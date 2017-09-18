from django.contrib.auth.base_user import BaseUserManager


class ProviderManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, email, password, **extra_fields):
        if not email:
            raise ValueError('No email address provided')
        email = self.normalize_email(email)
        provider = self.model(email=email, **extra_fields)
        provider.set_password(password)
        provider.save(using=self.db)
        return provider

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_admin', True)
        extra_fields.setdefault('is_staff', True)

        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(email, password, **extra_fields)





