# Multi Tenant SPI

# Contents

1.  [**Service Provider Interface**](#spi)

2.  [**Authenticator SPI**](#authentication-spi)

3.  [**Multitenancy Authenticator SPI**](#multitenancy)
    1. [**Executes**](#executes-in-spi)
    2. [**Browser**](#browser-flow)
        1. [**MultiIdentifer Validation**](#multiidentifier-validation)
        2. [**Tenancy Group Validation**](#tenancy-group-validation)
    3. [**Conditions**](#conditions)
        1. [**Conditions for User Blocked**](#user-blocked-cond)
        2. [**Condition - 2FA Condition**](#two-fa-cond)
    4. [**Direct Grant**](#direct-grant-flow)
        1. [**Send SMS Code**](#send-sms-code)
        2. [**Validate Domain**](#validate-domain)
        3. [**Validate VKN**](#validate-vkn)
    5. [**Reset Credentials**](#reset-credentials-flow)
        1. [**Choose User and Verify Second Identifier**](#choose-user-verif-second-identifier)
        2. [**Unblock user**](#unblock-user)
4.  [**Authtentication Flow Examples**](#configuration-examples)  
    <a name="spi"></a>
    # Service Provider Interface
    Identity Access Management Provider (IAM), has a number of Service Provider Interfaces (SPI) for which you can implement your own providers.
    <a name="authentication-spi"></a>
    # Authentication SPI
    Identity Access Management Provider (IAM), provides an authentication SPI that you can use to write new plugins. The admin console supports applying, ordering, and configuring these new mechanisms.
    <a name="multitenancy"></a>
    # Multitenancy Authenticator SPI
    Multitenancy Authenticator SPI offers new executes that allow us to both change password, create user authentication flows.
    <a name="executes-in-spi"></a>
    ## Executes
    An execution is an object that binds the authenticator to the flow and the authenticator to the configuration of the authenticator. Flows contain execution entries.
    <a name="browser-flow"></a>
    ## Browser
    <a name="multiidentifier-validation"></a>
    ### MultiIdentifer Validation
    This execution verifies a second identifier. It also renames the labels on the login page (ex username or second identifier name).
    _ **Configurations**
    _ Enable Multi Identifier Login : If enable, verifies second identifier
    _ Second Identifer Name : Changes second identifier to new label name
    _ First Identifier Name : Changes username to new label name
    _ Verify Second Identifier By : Sets the attribute name for the second identifier
    _ User's fail attempt counter : Sets the number of attempts for blockage
    <a name="tenancy-group-validation"></a>
    ### Tenancy Group Validation
    This execution verifies tenancy. When multitenancy is active, it activates the domain area on the login page and confirms that the user is in the selected domain.
    _ **Configurations**
    _ Enable multitenancy : If enable, verifies domain
    <a name="conditions"></a>
    ## Conditions
    This requirement type can only be set on sub-flows. A Conditional sub-flow can contain a "Condition" execution. These "Condition" executions must evaluate as logical statements. If all "Condition" executions evaluate as true then the Conditional sub-flow acts as Required. If not, the Conditional sub-flow acts as Disabled. If no "Condition" execution is set, the Conditional sub-flow acts as Disabled. If a flow contains "Condition" executions and is not set to Conditional, the "Condition" executions are not evaluated, and can be considered functionally Disabled.
    <a name="user-blocked-cond)"></a>
    ### Conditions for User Blocked
    This execute for sub-flow. If the user is not blocked, passes to execution below. Checks "is_blocked" user attribute for condition.
    <a name="two-fa-cond"></a>
    ### Condition - 2FA Condition
    This execute for sub-flow. If required 2FA validation to user, passes to execution below. Checks "mfaRequired" user attribute for condition.

    * **Configurations**
        * Enable Check Device : If enable, verifiy device_id parameter in request from "device credential" in user.
          <a name="direct-grant-flow"></a>
    ## Direct Grant
    <a name="send-sms-code)"></a>
    ### Send SMS Code
    Send SMS Code for Direct Grant flow.
    <a name="validate-domain"></a>
    ## Validate Domain
    Validates "domain" parameter in request.
    <a name="validate-vkn"></a>
    ### Validate VKN
    Validates "vkn" parameter in request.
    <a name="reset-credentials-flow"></a>
    ## Reset Credential
    <a name="choose-user-verif-second-identifier)"></a>
    ### Choose User and Verify Second Identifier
    After validate users second identifier, adds user to flow context.
    * **Configurations**
        * Enable Multi Identifier Login : If enable, verifies second identifier
        * Second Identifer Name : Changes second identifier to new label name
        * First Identifier Name : Changes username to new label name
        * Verify Second Identifier By : Sets the attribute name for the second identifier
          <a name="unblock-user"></a>
    ### Unblock user
    Updates user attributes and unblock user.
    <a name="configuration-examples"></a>
    # Authtentication Flow Examples
    **1.** Browser Login Flow

    ![Screen 1](docs/img/multiidentitybrowserflow.png)

    **2.** Reset Credential Flow

    ![Screen 2](docs/img/resetcredentialflow.png)
