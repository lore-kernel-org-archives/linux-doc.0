Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846872;
	b=Rp8iH72h6qNwvygSfvyBaL22S8lAokQ0qhwe9FuvvXaMlaQreqU//kHocPiao2ZZq0jK
	 BeUyQjwcZlqbTLO5IN27xK2pJX70xS08G8zydMEdUVb913JUFFJnGfbSJM6AxAd2bdfO+
	 aB79YoNBaQ0HdIHvMwH9ByujlJuqwAM/udeN9lMT0qnQ3HuAp7HG/iifryXWFfRW2/2++
	 n5Z0UMmwRKGPbIsKtwYMThaUJ9+BJPRITXVAL17SukMsmw9FEVTsdex95QBexjO9tYiWy
	 V3/87twfH9wQJtvkdieWYjs6o5aEHmwoORF1xxE5qhxtXTQHCOQMnQ4myT5x89P04nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y763e7YwRFNkP4zRWIKKVSF3bpIZ4Wi9vMPyAWdYjNk=;
	b=gs6Qm0W5r43OctUUIcAqRlrbxD0F9u9mOVj4JPkVk97oCOCpBV2KdUVq/owsnh4TIIFg
	 glBBf5OiQlWTR/clkc46NGmzSTfkUR0468zXH1qXPFmNxweGFlgjjt2BNCBFhOyXOZu85
	 lnjWhlQ+sYW01ibqh4vpB41v5fHhQWkgGtWwAEuJ9HbZCs1fBYHBMvi/aujvG42ZDs570
	 j4qR37wSiZSBdKo4vu1AJfPbVnt7srpfZp2GE4ONSKi2JlNK3ev4t/aUhlcUmYwtg4N6h
	 3DNYWdMO12W4TjmK7nOquVklRVahRoPI+IjFFcUj+7E1vLFv/MRQHGwDUjjJSNcQg8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SduwwDMH;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80961606A8A9
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80961606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SduwwDMH
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so16561f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846870; x=1795451670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y763e7YwRFNkP4zRWIKKVSF3bpIZ4Wi9vMPyAWdYjNk=;
        b=SduwwDMHDnsHvEl9obUlEF5t39IJDdb0zFEYyMwT5yY1NUlRFGSlpDhaawNmTNcKYi
         bB7OVRMrcxZ8zoZ1j40EnxR+7krtCQ82AjOsiZ+mhbsfxtLhyyeau7Z2RC/3thF2cVlk
         i97dFoSDlsjzsoUnizmYbDA/i8XgBYgxxMY71FKlgxq4SCjPmV0OSeBG6EQaXfffqz3i
         QeSPtcOMyycxkYJnl6JI2fJ7O/ohEIoKYikYD7kwRKeefoqVvBo4JJw+Zz7wsc9Msj0v
         s78BGFi4HlYRQQj26iSAzc0cBbKugdWo3XAVOor3//iF8hQMY5RvsYeCVI4l7pl4ZFF4
         JHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846870; x=1795451670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y763e7YwRFNkP4zRWIKKVSF3bpIZ4Wi9vMPyAWdYjNk=;
        b=GltfongWWl7DwNYRlKTAlU/EDv7YahHitt8IcxGZ/ffopIUD8i3TX615SX/rl//30b
         8PCI7qIfXClstmTWALoL9/Me2bVXr5/UeChskd955AJrBtoct51/q3TJPXaO7yrO4CKy
         /vuCXs92W/YwmFaO3JT1SU8yC5CFuvRSfbwaUqUSR5jqm/AZ+q5oi3D9QNWIu1ivicVd
         d3tzGmzd2kvGHDQIAf6A6Aw+MTnnVxzLxcKDUzBmsREv+gAJkqg2WpWcXNSlTB5Bno+w
         LpYE9ihKMmgFvqdMkrjQGYEhc0ST1SUUs7c9igyIRklL+k2d0S41wr9XNdVGKK1UwmxS
         Bl2g==
X-Forwarded-Encrypted: i=1; AL+hErE1dCPmgcd2iNc+VYF1K7dtqFabrqgLhMDD9atmkUAxksuCLNFj6Jureaj7fIGw7BZKk34dAqz3jqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gqF9+X70VlO6YQlTw2LdkaBD7O1XyQaGvQaoiOFHwx+WXnkAu
	6hLo5Mp/ufuVB7rSDZ1g3AGMUuJ1FmyaAATZy0cpmeOZ/3j8EmNO3CKV
X-Gm-Gg: AZFdTZdVNmZS6f4K7beoXlQH27DBDDtyaQGStWwhn5lpJsCjvs0MR73rBUjlPbklu+G
	mOaptr+3Q2he47YcQcGTNHJh5TxzxeqI+RAuCCDblDpcqHapR8UloYgP4XXj0jsGSwWYTVIPbUe
	ldTJmiKtZLXajGjlVQByJ8fElSAVwlUvHnMUHAv35wo1s9dWF6i6WoUxqrdmviGkkcc1PnMLmCF
	z2nTc6VA6IWtkc/WsgnZP4ec3eJOdnRnq6DoUs+6AMmfSmPbStMZd4J3m9Ywt+mHFekcdiIfJy2
	EAjOErIxrn7+ztdSJ7loZhlS9uqa0j/OSoYz4pnmKYRGCAJI/+8C8XTSo/uk/4Wvf8ZCAcJyF9H
	pxhVCAbhX5jzAsu390PvSzyVGOfZfJcvrpVCveLUKRNcZ1b1n8Mju+G7tkGwa5HDAbliSKW7uM4
	HfMzYwzjIhfs+vyeNeCjSEY9APkKdERxFZc8Wl0ObCOo/UTXdgznYTviL6P8NXUAev2AJk9sjbD
	VPK4e4bTn7eFdTws5UZqI9OX6etINlTuhetNfuCJVo68XbB/96vlVeVFdxFJPryVVU+Z+uWzF+i
	44xnUkWcEF69z6eseRrLaNdFjNjbPMRNFYJ9XUGCt8BIJNr7LaZ0/3qNmCWdX1BHz78Y1rlO9uX
	2N3FXbMHrx9WPs6XyX0KLMpkX6+yGGeAY4Q==
X-Received: by 2002:a05:6000:24c4:b0:491:eb12:e151 with SMTP id ffacd0b85a97d-4a36c30c94dmr41439f8f.4.1794846869734;
        Mon, 16 Nov 2026 08:34:29 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:29 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: [PATCH net-next v21 04/15] net: pcs: implement Firmware node support for PCS driver
Date: Mon, 16 Nov 2026 17:33:47 +0100
Message-ID: <20261116163412.551438-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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

