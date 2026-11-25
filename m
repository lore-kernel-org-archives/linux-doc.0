Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581440;
	b=TTDi6CYbVYsGlR7h6Bw1R8cvyn6EYYozh1axtemgCXABEfZSEglWJ1GHd6En3q4nTkct
	 RH7rWJwKMUtyhMxTVcBYHHl7qFt2pzW/abiadBFMxroZKip2soE1MT65NhI+B8Pb3CLO1
	 FNHGJBoX0Tu58P9MuS0jYGCabDvjymmnK6jZ9dxoQx+2ZUB9jZXZrcuy26D2ONNckDRJm
	 sTEBfyaV0fTnBMMjfhrTElfMbxL3lD2lYcMwPD/u6j9FQBqTo0RV16lNvnRBGiPWT58CQ
	 ODgxLQxHizn0Jjeyj+qhRuKSHMaMQDNf3VR6iUzfT9ndq8oSofpx+NZDGx2YwpMACDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
	b=QbwwGawKC4eIQSZtpwu+48i0V8N3KkOsZggkQSykfCpPlVcYEQ1V1iF3LG7hISiNv+C5
	 Vc2KxloATHlTnoJUFfOyLCWpsisrlGZLaHGVR/+ywGKkEAu1UVbqaQHnOkh4h0am3h0C/
	 2cDQit3+EBGB3vCkM2GKaBNSIsTRXxs4hn9IfbDtK34d/TsF+jeAQBIS/BcNgRa6TxhtZ
	 BFOwAha6m+oSSD5VCbVV0lixdPzhKSiUF1lebNS03UWnf5buTnbvoEt8LJps38UEhG0mG
	 dFmfMuKzC6N3EeWBd9p6ZhyPLEbI578u++wzmICdQzT8mAcuFFbrmsOjbINWLJTeAKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hoAvfN9g;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34090606A680
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 04:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34090606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hoAvfN9g
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f04bea9a93so46349395ad.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 20:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581439; x=1796186239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
        b=hoAvfN9gzx2LyLk/gEV2pCQQvL2eHN7Ybl9S9sseLNfnxe3TLOcWzkEHsO7H6i52Z8
         ITIu0vs7T0b8u7ysTdtMP3BWhjQlfdDNdds8EuQtokuuaolNc47LQgMP5JHrlNBrvvNY
         q9gGurHUD/mXM8g3m3m4nnxtcS3ZNNq1GBaQ7k8tfmyG0pdFAYOWPER24dpLCCp52kf3
         DDrkI4f/Kew96kmDkgo7bik5bil4SFvJCzb0Eipy3PVqHi4pPc4ymxRehHa7UcOcivEg
         4C0+klwghxMs7IUhkeI6brCl6T5Hh7pBcL0nbKwnipb1PZLIUD0kE2x12R/M4CRr3dYs
         M4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581439; x=1796186239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v73lnBxXLvBxSu7XkVP0pFYU3Balrjs//m2fQ2pstrU=;
        b=Ywp1MfrpIdO//leV+2MatfKM/AxzUmvz5X0ntnH4VCIAFGPyOz8ieR7Xix26+ldfYc
         1MboPDyBHg+ZKWdBHoMA9j0EKuVQBeBBJpRjvbMHMZ847XqRjgKgSI38bQ9wucC/fw+/
         MXBeiqRqusXB1ME+ZGbaJatKujxR/Rm1AvN4aT6k9g0bOUptvvnlBVVElWRWSV2fmB+8
         x3SEZF+LtaQBlCL4az7/zI7KIqMJyEVq6bEtqyyPm0PjoGZDSsDFPr9/CUkoLzndH2gx
         nptSpVrnYU8FyiXPlbKO2uBbowMcsFrG24OkFMXfiHkIzcJKFR6gOE0/v6nvAhb98LeQ
         Zt3A==
X-Gm-Message-State: APuU4Z8MxLwzBEQQlqcc69eUHcukm3rHxCvenY58V4K5tgEf0P2Ezj4H
	1ePffXo13TvheYId5sNYiA2CnQwHb9acbRMVkoBD97F2fAPf3F3N1Sva
X-Gm-Gg: AZFdTZdIRM6sraUI4wiovx/AkHPO/wB3o5MtqLoNsrZqWj/6cgPQoapcPyNfPZI7YZQ
	hIbutE8xrBaFuYjdH43xE3a8BKODHKSEw/SlBrThjaNuZU4whubB7Wl8F+e8eXwVjM6YPEZ+MdJ
	hVSZGKiF8dZnnqJ/kUf2NjfHLpDyFVwnYtETs8sgwvifiOxWC7jQhYzMDa6Gbf/8+Nctmbu9t9q
	zfVXO5nG4go3RGimN5WMgKaZx9Imod8BWx9heasslVrR8GzzJNPXJksHpO9R/MlcOCQeXhThStn
	RXgfu6VucXhYfuMyFGvMtJsNe584FYqBCLrIk/aYxUV94EO/WQRtEiMzREPO+eyh1QBA70EFUW0
	tuxE/ds9Ixk2IaHGQwgUjyMO73+2nhNLy78Fvj8Jqy10ix8vTS3aKgqAO0QinYCgi8cupmA3f4Q
	RtwMWt9DgbDH5JdFQWUfZFY9cayzoFC0QlAfugJ5ybT9OFwlnfCfg7aVWnl3XYG8Y69FD1Bd8/w
	3thutoq5kDU6aSAj8Rzvh+DriJrX38wyqPKUTvu++l8J8SYSLbw7BrxK77FW+MQ2rvpogEg3VtJ
	6DcISZ4KV5GC303uM0eV+sVO36E=
X-Received: by 2002:a17:902:dacc:b0:2ed:472:b9d6 with SMTP id d9443c01a7336-2f03efb1397mr182475285ad.2.1795581439561;
        Tue, 24 Nov 2026 20:37:19 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm78614345ad.54.2026.11.24.20.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:19 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 1/8] phy: core: Add common helper to add phy phandle device link
Date: Wed, 25 Nov 2026 12:36:32 +0800
Message-ID: <20261125043639.249525-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
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

It is very common for adding a device link for phy phandle
for device managed phy helper functions. So add a common
helper for future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 46 ++++++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 597e6b234f5e..b7550ca37e66 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -606,6 +606,27 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 }
 EXPORT_SYMBOL_GPL(phy_validate);
 
+/**
+ * phy_add_device_link() - Associate the phy with the device
+ * @dev: the device consuming the PHY
+ * @phy: the PHY supplied to @dev
+ *
+ * Add a device link with @dev as the consumer and @phy as the
+ * PHY supplier.
+ */
+static void phy_add_device_link(struct device *dev, struct phy *phy)
+{
+	struct device_link *link;
+
+	if (!phy)
+		return;
+
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+}
+
 /**
  * _of_phy_get_with_args() - lookup and obtain a reference to a phy by of_phandle_args
  * @args: of_phandle_args to the phy
@@ -805,7 +826,6 @@ struct phy *phy_get(struct device *dev, const char *string)
 {
 	int index = 0;
 	struct phy *phy;
-	struct device_link *link;
 
 	mutex_lock(&phy_provider_mutex);
 	if (dev->of_node) {
@@ -833,10 +853,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 
 	get_device(&phy->dev);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 out_unlock:
 	mutex_unlock(&phy_provider_mutex);
@@ -912,7 +929,6 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 			    const char *con_id)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -927,10 +943,7 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 		return phy;
 	}
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -982,7 +995,6 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -1006,10 +1018,7 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 out_unlock:
 	mutex_unlock(&phy_provider_mutex);
@@ -1059,7 +1068,6 @@ EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -1073,10 +1081,8 @@ struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
 
 	*ptr = phy;
 	devres_add(dev, ptr);
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
-- 
2.56.1

