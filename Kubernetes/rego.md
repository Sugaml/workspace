# Rego: The Policy Language for Open Policy Agent (OPA)

---

## **What is Rego?**

Rego is a high-level, declarative policy language used to write "policy as code" for the Open Policy Agent (OPA). It allows you to define rules and policies for access control, compliance, and other decision-making scenarios across cloud-native infrastructure, APIs, Kubernetes, CI/CD pipelines, and more.

- **Declarative**: You specify *what* the policy outcome should be, not *how* to compute it.
- **Inspired by Datalog**: Designed for querying and reasoning about structured data like JSON or YAML.
- **Policy as Code**: Policies are version-controlled, testable, and reusable.

---

## **Why Use Rego?**

- **Unified Policy Enforcement**: Use the same language for Kubernetes, APIs, Terraform, and microservices.
- **Separation of Concerns**: Decouples policy decisions from application logic.
- **Expressiveness**: Supports lists, booleans, strings, and complex data structures.
- **Testing & Validation**: Built-in support for unit testing policies.
- **Readability**: Designed to be clear and unambiguous, even for complex rules.

---

## **Rego Basics**

### **Rule Structure**

A Rego rule consists of a **head** (the decision or variable) and a **body** (conditions that must be true):
```rego
    allow {
    input.user.role == "admin"
    }
```
- Here, `allow` is true if the input user's role is "admin".

### **Packages**

Policies are grouped into packages (namespaces):

package example.access

### **Default Values**

You can set default values for decisions:

default allow = false
- This means access is denied unless a rule sets `allow` to true.

---

## **Example: User Access Control**

**Data Model (JSON):**
```json
    {
    "users": {
    "alice": {"role": "admin"},
    "bob": {"role": "developer"},
    "eve": {"role": "intern"}
    }
    }
```

**Rego Policy:**
```rego
    package example

    default allow = false

    allow {
    input.user.role == "admin"
    }

    **Input for Evaluation:**
    {
    "user": {"role": "admin"}
    }
```

**Query:**
> Should access be allowed for this user?

**OPA Decision:**  
Returns `true` (access allowed) if the user's role is "admin".

---

## **Rego in Action: OPA Evaluation Flow**

1. **Application sends input data** (e.g., user, action, resource) to OPA.
2. **OPA evaluates the input** against Rego policies and any external data.
3. **OPA returns a decision** (e.g., allow/deny, or a detailed JSON response).
4. **Application enforces the decision** (e.g., grants or blocks access).

---

## **More Rego Features**

- **Composite Values**: Work with arrays and objects.
    ```rego
    pi := 3.14159
    rect := {"width": 2, "height": 4}
    ```
- **Operators**: Arithmetic, comparison, logical (`==`, `!=`, `and`, `or`, etc.).
- **Negation**: Use `not` to assert that a condition is not true.
    ```rego
    deny[msg] {
      not input.user.role == "admin"
      msg := "Only admins allowed"
    }
    ```
- **Imports**: Reuse rules and data from other packages.

---

## **Sample Policy: Kubernetes Admission Control**
```rego
    package kubernetes.admission

    deny[msg] {
    input.kind == "Pod.runAsNonRoot
    msg := "Pods must run as non-root users"
    }
```

- This policy denies pod creation if `runAsNonRoot` is not set.

## **How to Write and Test Rego**

- **OPA CLI**: Use `opa eval` or `opa test` to evaluate and test policies locally.
- **Rego Playground**: Try policies in your browser without setup.
- **Integration**: OPA can be run as a daemon, sidecar, or library in your applications.


## **Summary Table: Rego Concepts**

| Concept           | Example Syntax                                 | Purpose                      |
|-------------------|------------------------------------------------|------------------------------|
| Package           | `package example.rules`                        | Namespacing                  |
| Rule              | `allow { input.user.role == "admin" }`         | Decision logic               |
| Default           | `default allow = false`                        | Default decision             |
| Input             | `input.user.role`                              | Data for evaluation          |
| Negation          | `not input.user.role == "admin"`               | Invert condition             |
| Message           | `msg := "Only admins allowed"`                 | Custom denial message        |
