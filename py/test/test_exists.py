# ProjectName SDK exists test

import pytest
from strictlybetter_sdk import StrictlyBetterSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = StrictlyBetterSDK.test(None, None)
        assert testsdk is not None
