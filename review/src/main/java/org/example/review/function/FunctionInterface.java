package org.example.review.function;

import java.util.UUID;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

interface Foo {
    void sayHello();
}

/**
 * @author haisky
 */
public class FunctionInterface {
    public static void main(String[] args) {
    }

    private static void predicate() {
        Predicate<String> predicate = new Predicate<String>() {
            @Override
            public boolean test(String s) {
                return s.startsWith("a");
            }
        };
        System.out.println(predicate.test("abc"));

        predicate = s -> s.startsWith("c");
        System.out.println(predicate.test("abc"));
    }

    private static void supplier() {
        Supplier<String> supplier = new Supplier<String>() {
            @Override
            public String get() {
                return UUID.randomUUID().toString();
            }
        };
        System.out.println(supplier.get());

        supplier = UUID.randomUUID()::toString;
        System.out.println(supplier.get());
    }

    private static void consumer() {
        Consumer<String> consumer = new Consumer<String>() {
            @Override
            public void accept(String s) {
                System.out.println(s);
            }
        };
        consumer.accept("abc123");

        consumer = System.out::println;
        consumer.accept("123123");
    }

    private static void function() {
        Function<String, String> function = new Function<String, String>() {
            @Override
            public String apply(String s) {
                return s.toUpperCase();
            }
        };
        System.out.println(function.apply("abc"));

        function = String::toUpperCase;
        System.out.println(function.apply("xyz"));
    }

    private static void common() {
        Foo foo = new Foo() {
            @Override
            public void sayHello() {
                System.out.println("Hello Lambda");
            }
        };
        foo.sayHello();

        foo = () -> {
            System.out.println("Hello Lambda");
        };
        foo.sayHello();
    }
}
