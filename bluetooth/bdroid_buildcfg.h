#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

#if !defined(OS_GENERIC)
#include <cutils/properties.h>
#include <string.h>

static inline const char* getBTDefaultName()
{
    char device[PROPERTY_VALUE_MAX];
    property_get("ro.boot.hardware", device, "");

    if (!strcmp("maple", device)) {
        return "Xperia XZ Premium";
    }

    return "Xperia";
}

#define BTM_DEF_LOCAL_NAME getBTDefaultName()
#endif // OS_GENERIC

// Wide-band speech support
#define BTM_WBS_INCLUDED TRUE
#define BTIF_HF_WBS_PREFERRED TRUE

// QCOM power management workaround
#define BT_CLEAN_TURN_ON_DISABLED TRUE

#endif
