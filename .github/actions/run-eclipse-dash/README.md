A GitHub Action that runs the [Eclipse Dash Licenses tool]((https://github.com/eclipse-dash/dash-licenses)) for a given list of components.

The action retrieves the tool's latest JAR file from the Eclipse repository, if not already available in the current user's home folder.

# Inputs

| Name              | Description                                                                                                                                                                                                                                                                                                                                               |
| :---------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `components-file` | The path to a file that contains the list of components to check. The file must contain one line per component and each line must contain the component's ClearlyDefined identifier. Please refer to the [Eclipse Dash tool's documentation](https://github.com/eclipse-dash/dash-licenses/blob/master/README.md) for details on how to create this file. |

# Outputs

| Name             | Description                                                                                                                                                                                                                                                                                                                                            |
| :--------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `dash-exit-code` | 0: The check has been run successfully and all components have licenses that are approved by the Eclipse Foundation<br>> 1: The check has either failed to run at all or at least one component's license informaiton could not be vetted successfully. In this case the `summary-url` points to the summary report created by the Dash Licenses tool. |
| `summary-url`    | The URL to the summary report, if the license check has failed.                                                                                                                                                                                                                                                                                        |
