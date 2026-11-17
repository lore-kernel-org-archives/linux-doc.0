Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919218;
	b=bOXOdbnMWC5dyreVWyBgS1LLdxcJgFs/sMrX50EznyxdzNU8cVXYQD4Y4u46P3zw2iQO
	 N8w4jgSV91X6A9PVL/Mj8501dGw+t7HwN5fixvT87/bGKNj2joOw9AfNT9p3eLZd+0AlI
	 D6Sr4psqRRVMbpAYmHkuh3vUtUvvRQL1OKsetDYYScYy3/lrTH3ath4PGNXRI6o9aD7Al
	 2F/kd6itmKo4P0irzPrBTkGusGSxF73hBE8oq7d8uvrqeQqzc40sZhV4hSXjqDaITKBBo
	 YWv6/xdgRNYdUXsKq/w34lwWurFp65EABVYQtmrFW0qZ32Fu4T3IaazUI1/IkFB+KZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y763e7YwRFNkP4zRWIKKVSF3bpIZ4Wi9vMPyAWdYjNk=;
	b=igfs3F7xOdDZixilACc0GaqupVIcXpa6/8sQvbtzsKP0LBQKBUeSjNWP0MjiqYCLrpaZ
	 /6Q147wbrawqk8EY8hV4cFBiB0d3iu5G/yuq0eOVwsdY8JjHu+Qir0gdsgGALb+2W8MMG
	 8944rklDSVQL91pQZHFdDxmNmpOjCUoBV4EISo/jiRFmH05W6Zoj938d+mnLqmS411cIT
	 YVDzdTwKyUe+lLCLIoK3w+1Ic/rc9zCiXL4bLroW3GQGHjcE15368Jkk10vMV2I4hmoiE
	 +ZfvEgcziOWp8I21f61UfL7+mhF0E33sRJOz1RnxHHFcs3MK5VLDtAYv0j8lockRyTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyWKQJbG;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F6860A6F43
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F6860A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyWKQJbG
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so21353235e9.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919216; x=1795524016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y763e7YwRFNkP4zRWIKKVSF3bpIZ4Wi9vMPyAWdYjNk=;
        b=WyWKQJbG14yQjWM76cr0T/mlrGM0oYzdZgMcVBOr+gUVZYnkDy+unTdgVNJxXYMoAB
         LlIIFjUOnCuq2PP+/7VCoS1pyYbO1KyR+QcUH8E7NNU4g6ycCwno9oM3q2bNaCDgF0MZ
         NAwjppeh2WQYKIeKmUzpLaL5yxML15djL60Meq4e6/2DopFs8U8QYtG0qhn+YAmN5q9x
         YUyzGRRskMkzr2oS2nDKwOprZGjLFMI3QERaC5TgTb84mI8LmqZhynVI9BcIzhlJ89BQ
         C/JPTdyikCkvvZC3gk3oCMjockBiP0Q6Kg2XG1NZUlgS+ybV4QzIcf4gBgwc+2DshvKC
         As3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919216; x=1795524016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y763e7YwRFNkP4zRWIKKVSF3bpIZ4Wi9vMPyAWdYjNk=;
        b=UtahbW01kuZiDIB5y+qYmMWm+N7xgSPzcy6rtqWLilnHz10+5YHO/HssZP+F4WLXbG
         uAqvlwO0bSxFpvk2IsoTZnW0UHRw0WsIYkpiNDfCDdp1RveGDnmngv7gK0+hQDSNoQPR
         /iHwBOuAwWaWx1GikFxCzwXjOfTp8YhnEMrKe7QQGxbmx52E0IA3zwWLJRDoOmzdDj7u
         cf7zzfvcF9agS1k+UtKaytmms/7R0HChn8Aya3tcXSTehFdPoitEusTWaP0devWoVgJw
         FTn5O1mQ1rvCy5b0u3domIK+8fKU11vG7aC8x+lSYhhoTg1z1/ABkG/9PnRtRDsR4lCL
         cWSg==
X-Forwarded-Encrypted: i=1; AL+hErHc7W7hGULjVZOw92hNmILN4KTvg9fvaUWh3YmZgYyYPDr18WPG5iXjdUWr/z3D/MUZXPEQOdPgvRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qnTgFU5I5G0uY9fLeowbnCL6jyQJo7JeBZ+xiXW12SsNbio97
	hr29AFMeExBI5kpfpiyK6FEJ6IbaEdpacFsyQ1APBDoDtf8kvjqlQN+TZfVyvQ==
X-Gm-Gg: AYBFou3FO5BYkKCXFtHU8nbSnp5NzmiSP3R9pQr2qk3yywtrNEKMgnzG79Q/042jQlB
	RAhtqVk6aE5Bfz7WASsumzVn+XMxMWhTxIQ/+k5GFUa68eKfoLqdX9AVf4FvfMbDCau+kznqsO3
	f2xqAY+7EXSMLxwBPeiJvbtlbAmmlfQjOIM1FONObqx7G3z/ZziwgC/oCM9Rykcf0nqvlJIY/uQ
	oq7BVU3mPQrrHQPRw2/NsOFaWl6vzgOpSyNB/IagWF2y017TL3h0Kc06nLHavzQrL0rvbldL/9Q
	S8i6sMldtE6k3hFUzjbaaE8V3t8wIw+KiRNWK/MGz2KEZc+AUmzOmOUobkjgKKp2aaU+Pz8avzI
	f0GefwksMAQBD3/6YzZd/MoViryspiYuXNigtb5AfWwhkmhOisZRVnPIClKvNtYVBSsh7zLxz57
	SYWcTxbRzC47BwmoNr07m1qXZw4u1PUDV2r8A28wGdekXuICqD0Qpifz9i1HREropBS1+yDX8E1
	0Jhfon1k4334iHOhzK4Vb2G2p+fHsn/yb7yhbRMklXJJTAIGVn+uGUIuUGV3+n7d5m3U+eX4mYR
	aOXPDOcNTZzvxcTNE5WopEg4Pmx2enfOVrF3uDgfLinKBnddj64JOtnDRmHV7RuTFEUpqZzbDCP
	wr0YYqqWNYEefjg6zVNdl+Lk/4xCO7WH0zg==
X-Received: by 2002:a05:600c:3d91:b0:4bb:6871:8f21 with SMTP id 5b1f17b1804b1-4bb68718fa0mr184127955e9.23.1794919216076;
        Tue, 17 Nov 2026 04:40:16 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:15 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH net-next v22 04/15] net: pcs: implement Firmware node support for PCS driver
Date: Tue, 17 Nov 2026 13:39:44 +0100
Message-ID: <20261117123956.11981-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the foundation of Firmware node support for PCS driver.

To support this, implement a simple Provider API where a PCS driver can
expose multiple PCS with an xlate .fwnode_xlate function.

PCS driver will have to call fwnode_pcs_add_provider() and pass the
firmware node pointer and a xlate function to return the correct PCS for
the passed #pcs-cells.

This will register the PCS in a global list of providers so that
consumer can access it.

The consumer will then use fwnode_pcs_get() to get the actual PCS by
passing the firmware node pointer and the index for #pcs-cells.

For a simple implementation where #pcs-cells is 0 and the PCS driver
expose a single PCS, the xlate function fwnode_pcs_simple_xlate() is
provided.

For an advanced implementation a custom xlate function is required.

On removal the PCS driver must delete itself from the provider list
using fwnode_pcs_del_provider().

A devm variant devm_fwnode_pcs_add() is provided to automate the release
procedure.

Generic functions fwnode_phylink_pcs_count() and fwnode_phylink_pcs_parse()
are provided for MAC driver that will declare PCS in DT (or ACPI).

Function fwnode_phylink_pcs_count() will parse "pcs-handle" property and
will return the number of PCS entries described in the passed firmware
node.

Function fwnode_phylink_pcs_parse() will parse "pcs-handle" property and
fill the passed available_pcs array with the available PCS found up to
passed num_pcs value. It's worth to mention that this function will ignore
PCS that still needs to be probed (returning -ENODEV) and such PCS won't be
added to the available_pcs array.

Co-developed-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/Kconfig          |   6 +
 drivers/net/pcs/Makefile         |   1 +
 drivers/net/pcs/pcs.c            | 245 +++++++++++++++++++++++++++++++
 include/linux/pcs/pcs-provider.h |  70 +++++++++
 include/linux/pcs/pcs.h          |  74 ++++++++++
 5 files changed, 396 insertions(+)
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
index 108d47257bee..3d4d81c8e098 100644
--- a/drivers/net/pcs/Kconfig
+++ b/drivers/net/pcs/Kconfig
@@ -5,6 +5,12 @@
 
 menu "PCS device drivers"
 
+config FWNODE_PCS
+	bool "PCS Firmware Node"
+	depends on ACPI || OF || COMPILE_TEST
+	help
+	  Firmware node PCS accessors
+
 config PCS_XPCS
 	tristate "Synopsys DesignWare Ethernet XPCS"
 	select PHYLINK
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index f9f6cf2578d7..53ba1d560f69 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -3,6 +3,7 @@
 
 pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-wx.o
 
+obj-$(CONFIG_FWNODE_PCS)	+= pcs.o
 obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
 obj-$(CONFIG_PCS_XPCS_PLATFORM) += pcs-xpcs-plat.o
 obj-$(CONFIG_PCS_XPCS_ROCKCHIP) += pcs-xpcs-rk.o
diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
new file mode 100644
index 000000000000..b1d48f6eee7f
--- /dev/null
+++ b/drivers/net/pcs/pcs.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/phylink.h>
+#include <linux/pcs/pcs.h>
+#include <linux/pcs/pcs-provider.h>
+
+MODULE_DESCRIPTION("PCS library");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+
+struct fwnode_pcs_provider {
+	struct list_head link;
+
+	struct fwnode_handle *fwnode;
+	struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+					    void *data);
+
+	void *data;
+};
+
+static LIST_HEAD(fwnode_pcs_providers);
+static DEFINE_MUTEX(fwnode_pcs_mutex);
+
+struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
+					    void *data)
+{
+	return data;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_simple_xlate);
+
+struct fwnode_pcs_provider *
+fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+							    void *data),
+			void *data)
+{
+	struct fwnode_pcs_provider *pp;
+
+	if (!fwnode)
+		return ERR_PTR(-EINVAL);
+
+	pp = kzalloc_obj(*pp);
+	if (!pp)
+		return ERR_PTR(-ENOMEM);
+
+	pp->fwnode = fwnode_handle_get(fwnode);
+	pp->data = data;
+	pp->fwnode_xlate = fwnode_xlate;
+
+	mutex_lock(&fwnode_pcs_mutex);
+
+	list_add(&pp->link, &fwnode_pcs_providers);
+	fwnode_dev_initialized(fwnode, true);
+
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	pr_debug("Added pcs provider from %pfwf\n", fwnode);
+
+	return pp;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
+
+void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
+{
+	if (IS_ERR_OR_NULL(pp))
+		return;
+
+	mutex_lock(&fwnode_pcs_mutex);
+
+	list_del(&pp->link);
+	fwnode_dev_initialized(pp->fwnode, false);
+
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	fwnode_handle_put(pp->fwnode);
+	kfree(pp);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_del_provider);
+
+static void devm_fwnode_pcs_del(struct device *dev, void *res)
+{
+	struct fwnode_pcs_provider *pp = *(struct fwnode_pcs_provider **)res;
+
+	fwnode_pcs_del_provider(pp);
+}
+
+struct fwnode_pcs_provider *
+devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
+			     struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+								 void *data),
+			     void *data)
+{
+	struct fwnode_pcs_provider **ptr, *pp;
+
+	ptr = devres_alloc(devm_fwnode_pcs_del, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	pp = fwnode_pcs_add_provider(fwnode, fwnode_xlate, data);
+
+	if (!IS_ERR(pp)) {
+		*ptr = pp;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return pp;
+}
+EXPORT_SYMBOL_GPL(devm_fwnode_pcs_add_provider);
+
+static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode,
+				int index, const char *name,
+				struct fwnode_reference_args *out_args)
+{
+	if (!fwnode)
+		return -EINVAL;
+
+	if (name) {
+		index = fwnode_property_match_string(fwnode, "pcs-handle-names",
+						     name);
+		if (index < 0)
+			return index;
+	}
+
+	return fwnode_property_get_reference_args(fwnode, "pcs-handle",
+						  "#pcs-cells", 0, index,
+						  out_args);
+}
+
+static struct phylink_pcs *
+__fwnode_pcs_get_from_pcsspec_provider(struct fwnode_reference_args *pcsspec,
+				       struct fwnode_pcs_provider *provider)
+{
+	if (provider->fwnode != pcsspec->fwnode)
+		return ERR_PTR(-EINVAL);
+
+	return provider->fwnode_xlate(pcsspec, provider->data);
+}
+
+static struct phylink_pcs *
+fwnode_pcs_get_from_pcsspec(struct fwnode_reference_args *pcsspec)
+{
+	struct fwnode_pcs_provider *provider;
+	struct phylink_pcs *pcs = NULL;
+
+	if (!pcsspec)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&fwnode_pcs_mutex);
+	list_for_each_entry(provider, &fwnode_pcs_providers, link) {
+		pcs = __fwnode_pcs_get_from_pcsspec_provider(pcsspec, provider);
+		if (!IS_ERR(pcs))
+			break;
+	}
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	return !IS_ERR_OR_NULL(pcs) ? pcs : ERR_PTR(-ENODEV);
+}
+
+static struct phylink_pcs *__fwnode_pcs_get(const struct fwnode_handle *fwnode,
+					    unsigned int index, const char *con_id)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, con_id, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = fwnode_pcs_get_from_pcsspec(&pcsspec);
+	fwnode_handle_put(pcsspec.fwnode);
+
+	return pcs;
+}
+
+struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned int index)
+{
+	return __fwnode_pcs_get(fwnode, index, NULL);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get);
+
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	struct fwnode_reference_args out_args;
+	int index = 0;
+	int ret;
+
+	while (true) {
+		ret = fwnode_property_get_reference_args(fwnode, "pcs-handle",
+							 "#pcs-cells", 0, index,
+							 &out_args);
+		/* We expect to reach an -ENOENT error while counting */
+		if (ret)
+			break;
+
+		fwnode_handle_put(out_args.fwnode);
+		index++;
+	}
+
+	return index;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_count);
+
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs)
+{
+	unsigned int i, found = 0;
+
+	if (!available_pcs)
+		return -EINVAL;
+
+	if (!fwnode_property_present(fwnode, "pcs-handle"))
+		return -ENODEV;
+
+	for (i = 0; i < num_pcs; i++) {
+		struct phylink_pcs *pcs;
+
+		pcs = fwnode_pcs_get(fwnode, i);
+		if (IS_ERR(pcs)) {
+			/* Exit early if no PCS remain.*/
+			if (PTR_ERR(pcs) == -ENOENT)
+				break;
+
+			/*
+			 * Ignore -ENODEV error for PCS that still
+			 * needs to probe.
+			 */
+			if (PTR_ERR(pcs) == -ENODEV)
+				continue;
+
+			return PTR_ERR(pcs);
+		}
+
+		available_pcs[found] = pcs;
+		found++;
+	}
+
+	return found;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_parse);
diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-provider.h
new file mode 100644
index 000000000000..15c198ffdd58
--- /dev/null
+++ b/include/linux/pcs/pcs-provider.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_PROVIDER_H
+#define __LINUX_PCS_PROVIDER_H
+
+struct fwnode_pcs_provider;
+
+/**
+ * fwnode_pcs_simple_xlate - Simple xlate function to retrieve PCS
+ * @pcsspec: reference arguments
+ * @data: Context data (assumed assigned to the single PCS)
+ *
+ * Returns: the PCS pointed by data.
+ */
+struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
+					    void *data);
+
+/**
+ * fwnode_pcs_add_provider - Registers a new PCS provider
+ * @fwnode: Firmware node
+ * @fwnode_xlate: xlate function to retrieve the PCS
+ * @data: Context data
+ *
+ * Register and add a new PCS provider to the global providers list
+ * for the firmware node. The relevant PCS from the PCS provider
+ * is retrieved from the passed fwnode_xlate function.
+ *
+ * The xlate function MUST return a pointer to an existing, already-allocated
+ * struct phylink_pcs and MUST NOT dynamically allocate a new PCS.
+ * The same PCS object must be returned for a given firmware reference and args,
+ * as PCS pointer identity is used to associate PCS objects with their provider.
+ *
+ * Returns: A pointer to the registered PCS provider on success, or
+ * an ERR_PTR() encoded error code on failure.
+ */
+struct fwnode_pcs_provider *
+fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+							    void *data),
+			void *data);
+
+/**
+ * fwnode_pcs_del_provider - Removes a PCS provider
+ * @pp: PCS provider returned by fwnode_pcs_add_provider()
+ */
+void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp);
+
+/**
+ * devm_fwnode_pcs_add_provider - Registers a new PCS provider
+ * @dev: Device of the PCS provider
+ * @fwnode: Firmware node
+ * @fwnode_xlate: xlate function to retrieve the PCS
+ * @data: Context data
+ *
+ * Register and add a new PCS provider to the global providers list
+ * for the firmware node. The relevant PCS from the PCS provider
+ * is retrieved from the passed fwnode_xlate function. While at that, it
+ * also associates the device with the PCS provider using devres.
+ * On driver detach, release function is invoked on the devres data,
+ * then, devres data is freed.
+ *
+ * Returns: A pointer to the registered PCS provider on success, or
+ * an ERR_PTR() encoded error code on failure.
+ */
+struct fwnode_pcs_provider *
+devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
+			     struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+								 void *data),
+			     void *data);
+
+#endif /* __LINUX_PCS_PROVIDER_H */
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
new file mode 100644
index 000000000000..ef2134c578c7
--- /dev/null
+++ b/include/linux/pcs/pcs.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_H
+#define __LINUX_PCS_H
+
+#include <linux/phylink.h>
+
+#if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * fwnode_pcs_get - Retrieves a PCS from a firmware node
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative error pointer. Can
+ * return -ENODEV if the PCS is not present in global providers list (either
+ * due to driver still needs to be probed or it failed to probe/removed).
+ */
+struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
+				   unsigned int index);
+
+/**
+ * fwnode_phylink_pcs_count - Count PCS entries described in firmware node
+ * @fwnode: firmware node
+ *
+ * Helper function to count the number of PCS entries referenced by the
+ * "pcs-handle" property in a firmware node.
+ *
+ * Note that this function counts all PCS references in the firmware node,
+ * regardless of whether the corresponding PCS devices are already probed.
+ *
+ * Returns: number of PCS entries described in the firmware node.
+ */
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode);
+
+/**
+ * fwnode_phylink_pcs_parse - Parse available PCS from firmware node
+ * @fwnode: firmware node
+ * @available_pcs: pointer to preallocated array of PCS
+ * @num_pcs: maximum number of PCS entries to scan
+ *
+ * Helper function that parses PCS references from the "pcs-handle"
+ * property of a firmware node and fills @available_pcs with PCS that are
+ * currently available up to @num_pcs.
+ *
+ * Only PCS that are currently available are stored in @available_pcs.
+ * PCS that returns -ENODEV are skipped.
+ *
+ * Returns: number of PCS stored in @available_pcs, or negative error code.
+ */
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs);
+#else
+static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
+						 unsigned int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
+static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	return 0;
+}
+
+static inline int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+					   struct phylink_pcs **available_pcs,
+					   unsigned int num_pcs)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* __LINUX_PCS_H */
-- 
2.55.0

