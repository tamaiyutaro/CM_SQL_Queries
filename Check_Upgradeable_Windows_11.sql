Select
v_R_System.Name0 as 'Hostname',
v_R_System.User_Name0 as 'User Name',
v_R_System.Build01 as 'Current Build',
case
when v_GS_UPGRADE_EXPERIENCE_INDICATORS.Version0='CO21H2' then 'Windows 11 version 21H2'
when v_GS_UPGRADE_EXPERIENCE_INDICATORS.Version0='NI22H2' then 'Windows 11 version 22H2'
end as 'Target Windows',
v_GS_PROCESSOR.Name0 as 'CPU Name',
case
when v_GS_TPM.SpecVersion0 is not NULL then v_GS_TPM.SpecVersion0
else 'No TPM'
end as 'TPM version',
case
when v_GS_FIRMWARE.SecureBoot0='1' then 'Enable'
when v_GS_FIRMWARE.SecureBoot0='0' then 'Disable'
end as 'Secure Boot Status',
v_GS_UPGRADE_EXPERIENCE_INDICATORS.Reason0 as 'Reason',
v_GS_UPGRADE_EXPERIENCE_INDICATORS.UpgExProp0 as 'Result'
from v_R_System
inner join v_GS_UPGRADE_EXPERIENCE_INDICATORS on v_GS_UPGRADE_EXPERIENCE_INDICATORS.ResourceID=v_R_System.ResourceID
full join v_GS_TPM on v_GS_TPM.ResourceID=v_R_System.ResourceID
inner join v_GS_PROCESSOR on v_GS_PROCESSOR.ResourceID=v_R_System.ResourceID
inner join v_GS_FIRMWARE on v_GS_FIRMWARE.ResourceID=v_R_System.ResourceID
where v_GS_UPGRADE_EXPERIENCE_INDICATORS.Version0 = 'CO21H2' or v_GS_UPGRADE_EXPERIENCE_INDICATORS.Version0 = 'NI22H2'