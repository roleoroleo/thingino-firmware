WIFI_ATBM6441_SITE_METHOD = git
WIFI_ATBM6441_SITE = https://github.com/gtxaspec/atbm6441
WIFI_ATBM6441_VERSION = $(shell git ls-remote $(WIFI_ATBM6441_SITE) HEAD | head -1 | cut -f1)

WIFI_ATBM6441_LICENSE = GPL-2.0

WIFI_ATBM6441_MODULE_MAKE_OPTS = \
	KSRC=$(LINUX_DIR) \
	KVERSION=$(LINUX_VERSION_PROBED)

define WIFI_ATBM6441_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_WLAN)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS_EXT)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WEXT_CORE)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WEXT_PROC)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WEXT_PRIV)
	$(call KCONFIG_SET_OPT,CONFIG_CFG80211,y)
	$(call KCONFIG_SET_OPT,CONFIG_MAC80211,y)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211_RC_MINSTREL)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211_RC_MINSTREL_HT)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211_RC_DEFAULT_MINSTREL)
	$(call KCONFIG_SET_OPT,CONFIG_MAC80211_RC_DEFAULT,"minstrel_ht")
endef

$(eval $(kernel-module))
$(eval $(generic-package))