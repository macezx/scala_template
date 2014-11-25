package hello

import org.scalatest._

class HelloTest extends FlatSpec with Matchers{
    "Hello.hello()" should "return \"hello,world\"" in{
        Hello.hello() == ("hello,world")
    }
}
