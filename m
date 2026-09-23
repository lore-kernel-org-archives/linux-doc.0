Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB961378D70
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 02:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130860; cv=none; b=nibqdzXSjHCJMujvgIsqNCBNUSBR3DrSuLoW39WHLS0VgrZQyJD953xfiL2IeZolhYajeC5rf1sQY4OR4YviYCQNdEP1sADJDvMscfzswPJlZ/3lucPX77Ktp2UVLmL4h8pUGf+wz+F92/ZN5FULSJw2y3Q5c9x+E/Mf18lPAOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130860; c=relaxed/simple;
	bh=0BuC+m4001jm0LtxJ5Aoc4IuhuJTdWNW08Zgoc6YibU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4348vBUyWoJZhTBDXD8raMbryulofLUHhuM4IdzTmrGfZqxbmMiBuq+TzUkonihapHOEyCnkJzaF/cMzh7ZnC4CbyRR4pbP9usp4GsSGgD1+7tOEpNpXJ1eMpNB+QTsbOjSB4sff9w1m9fpPPoQU5wNVAQq/yBLy048uL5ptlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmjZuh0j; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmjZuh0j"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffcso2517035ad.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 19:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130856; x=1790735656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F23PT++YfQdFZCmgLsj0Bh4dPpOhTY0Wr6NJKb8T5Wo=;
        b=bmjZuh0jt+TFqGLbVBiCV/awZ5YzQmLOatlQ1C47cLT2CuR1MJXReu2K/PKhwwa6mw
         2d3mpnCthtYT4HmTyEF+OZ8+p+wT2/KRc9vxf0GulhDGqG1ELZamlmkgVKhLgVwwjl8Z
         eYYsvxHog3p9qHx/5vy1Olzfd7JOUbXj7g7DKRpR8W+rHX6MQr6mzmskybxBMmczbFX5
         VaP8bbZsy3zkzwrjO1boKv1AscdwHq2lBqgESP7YLUatekEQFloW8cN9P+9eXCtyEvxK
         scBzSL3z8YjUDtDt2SQtidqmBN5OQaDxg/SPbNaJd4joHf5cEnPMB7lnEx+ygpI0253G
         xE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130856; x=1790735656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F23PT++YfQdFZCmgLsj0Bh4dPpOhTY0Wr6NJKb8T5Wo=;
        b=LR2C8LI/ytWT5C75u1zcBYJZmmE04bckeJnitFbutPXgZvYQhBPArjzyAbdME6koHJ
         AQmHhGTNKO/epWObzyCx9kbj0cfj8imp05dmn1t6HAXVp1u8e2Wbw3INw85Tnz+9cVSC
         eLXotfmVBzSRCbETPNgtkn07+SD1EVrDMtIi2WDkwtzoFKYTDR1rmUROT/BbIJ5WCbCV
         EqOpsqu1zpFVDdJB/qlUwsnLL6tzy4GVyg83XASFy4iftco35QJRqoxftoAcTfwA13Ov
         tLSfXuc3gLMAViFW5TMbvOTLkAv/d2zoKQzp0TBZcREOWfUuLld+6dLGcWb0CXm7Rgni
         pBfQ==
X-Gm-Message-State: AFuF++nB4bKwTJU+t/Wj8E8veZXiZWgJ6+i7W5wjGX9w0fHgkJpQv8U2
	yHi5Zq3FnLlhpiGyWOR1u5PH42hQf/PcPqjOnxZhYE31009CYwejviKq
X-Gm-Gg: AYBFou2nUsrwE+7kpU30aN1oDZqtsywIOV/rcnu4CwOx9UBuBJGoLpbK8KvjmuihS2X
	x4wUdw+CpuHEGe8THW0uExyiRf+jHpy0ZtTj+zSuri5G6REX3Xx30tGfmRDPbRMF/vXAsJLCI8I
	QRjVQjmwYogo+PJiU4UkNuW7XT9s9lOGnUtSIT5NSVuAEH39/rZG0yNf6fGNqgTNEnpC5d1AEgD
	/4c7i9OzcGryPHZHA4HQPCauu7hRWi10oZ6JZu0EieNO51xrsnIU62y6MdXG3Z0ugkXK/VnhV+D
	/vndwAEdKXF+lkdaZhmbCdroMgo4416NuNZG+3Q/uWgmUvATo81cOc/6y6nu0zETjJxwv6sxB+Q
	OFAPiYO4CURbPMprm8IAkGAQrK/JcN63KHy4gF6Jcu+dLCIfYw5mhbV9pMQ63384OYrA4p+fpL/
	pYP9kbIESRtenAlt+V2woM1hFW49BW2++syXlIrfS7+woyqiyvYV9P0KDeRbJvC9yUK7zY
X-Received: by 2002:a17:902:e741:b0:2dd:c053:e0fa with SMTP id d9443c01a7336-2df69e017bdmr10714565ad.41.1790130855762;
        Tue, 22 Sep 2026 19:34:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c16f6sm3133945ad.35.2026.09.22.19.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:34:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 4/5] phy: core: Add managed phy bulk data helper functions
Date: Wed, 23 Sep 2026 10:33:02 +0800
Message-ID: <20260923023304.78428-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923023304.78428-1-inochiama@gmail.com>
References: <20260923023304.78428-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device managed variants of the phy bulk helper functions. So
the driver can benefit from automatically managed phy handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c  | 73 +++++++++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h | 19 +++++++++++
 2 files changed, 92 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 5b76c006575b..a588fba33313 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1145,6 +1145,79 @@ static void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
 	kfree(phys);
 }
 
+struct phy_bulk_devres {
+	struct phy_bulk_data *phys;
+	unsigned int num_phys;
+};
+
+static void devm_phy_bulk_release_all(struct device *dev, void *res)
+{
+	struct phy_bulk_devres *devres = res;
+
+	phy_bulk_put_all(dev, devres->num_phys, devres->phys);
+}
+
+/**
+ * devm_phy_bulk_get_all() - managed lookup of all PHYs requested by a device
+ * @dev: device that requests the PHYs
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * The function calls devm_of_phy_bulk_get_all() directly, but sets the
+ * @np parameter to dev_of_node(dev).
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys)
+{
+	return devm_of_phy_bulk_get_all(dev, dev_of_node(dev), phys);
+}
+EXPORT_SYMBOL_GPL(devm_phy_bulk_get_all);
+
+/**
+ * devm_of_phy_bulk_get_all() - managed lookup of all PHYs from a device node
+ * @dev: device that requests the PHYs
+ * @np: device node containing the PHY references
+ * @phys: pointer to store the allocated array of struct phy_bulk_data
+ *
+ * Gets all PHYs from the specified device node, associates the allocated array
+ * and PHY references with @dev, and creates a device link for each PHY. They
+ * are automatically released on driver detach.
+ *
+ * Return: the number of PHYs on success, %0 if no PHYs are found, or a
+ * negative error code otherwise
+ */
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys)
+{
+	struct phy_bulk_devres *devres;
+	int ret;
+
+	*phys = NULL;
+
+	if (!np)
+		return 0;
+
+	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
+			      GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	ret = of_phy_bulk_get_all(np, &devres->phys);
+	if (ret > 0) {
+		for (int i = 0; i < ret; i++)
+			phy_add_device_link(dev, devres->phys[i].phy);
+		*phys = devres->phys;
+		devres->num_phys = ret;
+		devres_add(dev, devres);
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_of_phy_bulk_get_all);
+
 /**
  * phy_bulk_init() - initialize multiple PHYs
  * @num_phys: number of entries in the phys array
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 77d9d74682b7..e60e42eb7e0b 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -322,6 +322,9 @@ void devm_of_phy_provider_unregister(struct device *dev,
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 
+int devm_phy_bulk_get_all(struct device *dev, struct phy_bulk_data **phys);
+int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+			     struct phy_bulk_data **phys);
 int phy_bulk_init(unsigned int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_exit(unsigned int num_phys, struct phy_bulk_data *phys);
 int phy_bulk_power_on(unsigned int num_phys, struct phy_bulk_data *phys);
@@ -511,6 +514,22 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline int devm_of_phy_bulk_get_all(struct device *dev,
+					   struct device_node *np,
+					   struct phy_bulk_data **phys)
+{
+	if (phys)
+		*phys = NULL;
+
+	return 0;
+}
+
+static inline int devm_phy_bulk_get_all(struct device *dev,
+					struct phy_bulk_data **phys)
+{
+	return devm_of_phy_bulk_get_all(dev, dev_of_node(dev), phys);
+}
+
 static inline int phy_bulk_check_disabled(unsigned int num_phys,
 					  struct phy_bulk_data *phys)
 {
-- 
2.55.0

