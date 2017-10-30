from huey.contrib.djhuey import periodic_task, task

@task()
def count_beans(number):
    print('-- counted %s beans --' % "HI")
    return 'Counted %s beans' % "Hello"
