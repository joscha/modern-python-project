import logging

import pytest

from modern_python_project.my_function import my_function

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)


@pytest.mark.asyncio
async def test_async_function(snapshot):
    assert snapshot == my_function()
