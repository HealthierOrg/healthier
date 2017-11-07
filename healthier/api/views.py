from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.schemas import SchemaGenerator
from rest_framework.views import APIView
from rest_framework_swagger import renderers

# local
from healthier.user.models import HealthierUser
from healthier.consumers.models import Consumer
from healthier.providers.models import Provider
from healthier.service.models import HealthierService, ServiceGroupCategory, ServiceGroup
from .serializers import UserSerializer, ConsumerSerializer, ProviderSerializer, BaseServiceSerializer
from .serializers import ServiceGroupSerializer, ServiceGroupCategorySerializer

# app
from .helpers import AbstractDetail, EmailTest


class SwaggerSchemaView(APIView):
    permission_classes = [AllowAny]
    renderer_classes = [
        renderers.OpenAPIRenderer,
        renderers.SwaggerUIRenderer
    ]

    def get(self, request):
        generator = SchemaGenerator()
        schema = generator.get_schema(request=request)

        return Response(schema)


class ConsumerDetail(AbstractDetail):
    def __init__(self):
        self.MODEL = Consumer
        self.SERIALIZER = ConsumerSerializer
        self.ID_NAME = 'healthier_id'
        self.ID_VALUE = None
        AbstractDetail.__init__(self)


class ProviderDetail(AbstractDetail):
    def __init__(self):
        self.MODEL = Provider
        self.SERIALIZER = ProviderSerializer
        self.ID_NAME = 'healthier_id'
        self.ID_VALUE = None
        AbstractDetail.__init__(self)


class UserDetail(AbstractDetail):
    """
    This endpoint presents user details.
    Supported methods: GET, PUT
    """

    def __init__(self):
        self.MODEL = HealthierUser
        self.SERIALIZER = UserSerializer
        self.ID_NAME = 'email'
        self.ID_VALUE = None
        AbstractDetail.__init__(self)

    def get(self, request, format=None):
        """
        This endpoint allows retrival of user information
        - If user email is passed as argument, details of the particular user is returned.
        - If no user email is passed, returns details of all users in the database.
        """
        return AbstractDetail.get(self, request, format=None)

    def post(self, request, format=None):
        """
        This endpoint allows creating users
        - **Required fields** :
                            email, password, account_type
        - **Valid Account Type** :
            CON for consumer, PRO for provider

        - ** If email already exist, error is raised** :
        ```
            {
                "email": [
                    "healthier user with this email already exists."
                ]
            }
        ```

        """

        return AbstractDetail.post(self, request, format=None)

    def put(self, request, format=None):
        """
        This endpoint allows updating user information
        - **Note** : Email must always be passed!
        - **Supported fields** :
                            email, account_type, username, address, description, city,
                            country, phone_number, website, is_staff, is_admin, is_active,
                            is_logged_in, is_superuser, has_configured_account.
        - **Partial data update is supported**:
        ```
        {
            "email": "test@test.com",
            "account_type": "PRO",
            "username": "test",
            "address": "some new address",
            "description": "",
            "city": "",
            "country": ""
        }
        ```
        - If no user email is specified or specified email doesn't exist, error is raised:
        ```
        {
            "detail": "Not found."
        }
        ```

        """
        return AbstractDetail.put(self, request, format=None)


class ServiceDetails(AbstractDetail):
    def __init__(self):
        self.MODEL = HealthierService
        self.SERIALIZER = BaseServiceSerializer
        self.ID_NAME = 'service_name'
        self.ID_VALUE = None
        AbstractDetail.__init__(self)

    def get(self, request, format=None):
        """
        This endpoint retrieves service details
        - If service_name is passed as argument, details of the particular service is returned.
        - If no user service_name is passed, returns details of all services in the database.
        """
        return AbstractDetail.get(self, request, format=None)

    def post(self, request, format=None):
        """
        ** Expected details **

        ```
        {
            "service_name": "random",
            "details": "some random description",
            "group": "a valid group_name"
        }
        ```
        """
        try:
            service_group = request.data.get('group')
        except KeyError:
            return Response({'error': 'group must be specified'})

        try:
            group = ServiceGroup.objects.get(group_name=service_group)
        except ServiceGroup.DoesNotExist:
            return Response({'error': 'group does not exist'})
        request.data['group'] = group.id
        return AbstractDetail.post(self, request, format=None)


class ServiceGroupDetail(AbstractDetail):
    def __init__(self):
        self.MODEL = ServiceGroup
        self.SERIALIZER = ServiceGroupSerializer
        self.ID_NAME = 'group_name'
        self.ID_VALUE = None
        AbstractDetail.__init__(self)

    def post(self, request, format=None):
        """
        ** Expected details **

        ```
        {
            "group_name": "random",
            "group_description": "some random description",
            "category": "a valid category_name"
        }
        ```
        """
        service_group_category = request.data.get('category')

        try:
            category = ServiceGroupCategory.objects.get(category_name=service_group_category)
        except ServiceGroupCategory.DoesNotExist:
            return Response({'error': 'category does not exist'})

        request.data['category'] = category.id
        return AbstractDetail.post(self, request, format=None)


class ServiceGroupCategoryDetail(AbstractDetail):
    def __init__(self):
        self.MODEL = ServiceGroupCategory
        self.SERIALIZER = ServiceGroupCategorySerializer
        self.ID_NAME = 'category_name'
        self.ID_VALUE = None
        AbstractDetail.__init__(self)

    def post(self, request, format=None):
        """
        ** Expected details **

        ```
        {
            "category_name": "random",
            "category_description": "some random description"
        }
        ```
        """
        return AbstractDetail.post(self, request, format=None)
