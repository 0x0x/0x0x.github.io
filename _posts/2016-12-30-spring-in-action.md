---
layout: post
title: "Craig Walls — \"Spring in action\", 4th edition."
description: "Main ideas of the \"Spring in action\" book"
tags: [java, bookoverview]
---

# Part 1

### How to define Spring application context.
  1. `AnnotationConfigApplicationContext` — Loads a Spring application context from one or more Java-based configuration classes
  2. `AnnotationConfigWebApplicationContext` — Loads a Spring web application context from one or more Java-based configuration classes
  3. `ClassPathXmlApplicationContext` — Loads a context definition from one or more XML files located in the classpath, treating context-definition files as classpath resources
  4. `FileSystemXmlApplicationContext` — Loads a context definition from one or more XML files in the filesystem
  5. `XmlWebApplicationContext` — Loads context definitions from one or more XML files contained in a web applications

### Bean lifecycle

{% include image.html path="02_spring-in-action/chapter01/01_bean_lifecycle.jpg" path-detail="02_spring-in-action/chapter01/01_bean_lifecycle.jpg" alt="Bean lifecycle" %}

  1. Spring instantiates the bean.
  2. Spring injects values and bean references into the bean’s properties.
  3. If the bean implements `BeanNameAware`, Spring passes the bean’s ID to the `setBeanName()` method.
  4. If the bean implements `BeanFactoryAware`, Spring calls the `setBeanFactory()` method, passing in the bean factory itself.
  5. If the bean implements `ApplicationContextAware`, Spring calls the `setApplicationContext()` method, passing in a reference to the enclosing application context.
  6. If the bean implements the `BeanPostProcessor` interface, Spring calls its `postProcessBeforeInitialization()` method.
  7. If the bean implements the `InitializingBean` interface, Spring calls its `afterPropertiesSet()` method. Similarly, if the bean was declared with an `init-method`, then the specified initialization method is called.
  8. If the bean implements `BeanPostProcessor`, Spring calls its `postProcessAfterInitialization()` method.
  9. At this point, the bean is ready to be used by the application and remains in the application context until the application context is destroyed.
  10. If the bean implements the `DisposableBean` interface, Spring calls its `destroy()` method. Likewise, if the bean was declared with a `destroy-method`, the specified method is called.

