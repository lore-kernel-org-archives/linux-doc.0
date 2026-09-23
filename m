Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783B8380FDF
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 02:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130844; cv=none; b=VnOBxSLLIfTBFPPNBgVFKvgLK9owzCwtzZo1AQHnyTaO2q3xQfMm5BwDT/S0aUW4ZZmQ/9C6arsAvTvsAVoAKZLuH4oPm6Ntj0VAZTYqlkOBXHoPqwFtlZG6QaaI8xOdigNqOYAYYMv2UdtXgSIrrS2yMiDYoMhIE0wQ4+f+N8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130844; c=relaxed/simple;
	bh=NINNbjPJn/WUw0YRVDeoPVp/IxOxirFTB3dkvBGrbro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beGYh2t9LU6htBN2OyL667kqSTRRS4xZSMtQkX/rjIYibut+At2bebLZjmX2Yc7P4xT0ST8jLX2wNeUPSc5SrubG6smVXCAVhvf2mFXVsA6Ku23BeA4X0XAMIWofCINb4ZjZeG/p5Lg4apMH4JGsQtbcpQBmXiKZG7n1H0KmoJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrjxhybO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrjxhybO"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed1368so2840835ad.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 19:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130843; x=1790735643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igoxe3cxGkJq4SLiQXpcx4KeGIWifNJAVf3ouJtaOBU=;
        b=XrjxhybOANBUzo/zf3D5we5VtNyGhCC3Kad47Cui2VscThPKMhmKqDwebCovaYy20H
         OOwqNIQ37Egy8/wlbYYdHss+Dtcp/dZAE5m7y5uOei1DzoALkFL0XKpMjMtuu7pknOu5
         8+Su1rLo8G9J2TSaS00SSwIfawiTJOni8zT+bmIG0XE9SMLCVk0ojVMwipEwi7P/InbP
         K77Au5iVHH0i4tTS9RwiPfk+tc3odqQk40de+FFXxbds+s9NvJx0QvCSabLajgoOEo4s
         n2Yl1hMmaDI5tr1agZpx2/rOPAlk9VWwO7S9LlKIWg+fL/bcRiihXIhEaEI5l0oQr37k
         //Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130843; x=1790735643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igoxe3cxGkJq4SLiQXpcx4KeGIWifNJAVf3ouJtaOBU=;
        b=SmNwuZ4kMLLaaJ3uvFaJAQhF5aIiEVoMOZyC9UjazckAMtOPbTId4liabI+/kcw01M
         Ddzug8I/73QVcVqPJSIufJkgJ4K0g5zG4zE9YROdwUvRCs2eK4xv3BkeVxq3eV9fr60C
         pUuhuwrJ5kL3iXhsxMEpHa/cyiQrG3tLxQywjQUngfS1e2WAK3r8Medyh/08Oz+NqNF2
         NCEL709snQ1wvkvJASAQ6sOHWYOS/iOGeREMPKWV7fnk6xefR2CEYWBhGAaxdTWZ4gIX
         UJcKGe2jI7G2hOzvVNVowUhk7cHjRKc81C/SgYlOckxkTZ4PicyofGNx36/LIdWyiNoT
         xJXw==
X-Gm-Message-State: AFuF++nfIiAp+smm0VPgRb0T8SozBiWXSYX1IbB0OzHh5s8JpfnmhM44
	WmUzFQWXM9umQvxJevs//W+w+eSERGzE1rk5dn84PbiUw6vaYaMwK8Iw
X-Gm-Gg: AYBFou2Ep/s7TM/juXVpS/g3lq9UpPDC4243quCX3MGI527sqtKWaRXQEcV9xKi/wvM
	/f5iAUGkhmXJKJiX8YTSBHDtQ1CoADhMTTd6zKfkD4IDFZJ94SK33mKQsJYtSP/HQjwgfKTR89N
	/zrbzusdIOLHkWcVOMdWFyDRi0t8Wr8ufSegHqY7ixf4Dig/aQa86v+SV3/SUphg0w6HS3b1B+z
	qywvc7M4aKhqdkCASliXR0sDjvQJjBikixLFqxeqihqVbQjg7AxoEwy5KhM67l78a54dwnCFijB
	p+dmuEBSrjCRB0aCXVRb2GdPwrTK9ulExJuH/6PY+6Eth6AlRgDiIQ0UqKvuc5f/eIEhqUAdi2w
	1BGRdfjEjXUAgz2ywdqyHdoyHPZpjk4wbwM2JMCR2CH3EkgzhiFcxv1AGRpyaAa8403VltLSAv+
	wpWat1jVE/WwCoGaTnlt2/tLOEpChUoQ7+MC+wNXYVUwXYteY77/+tb5YpLkxn+g7ErBsCax6XV
	fCkzcY=
X-Received: by 2002:a17:903:1b4c:b0:2db:2427:97d5 with SMTP id d9443c01a7336-2df69d3704dmr11204435ad.4.1790130842671;
        Tue, 22 Sep 2026 19:34:02 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f79aesm3182785ad.74.2026.09.22.19.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:34:02 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/5] phy: core: Add common helper to add phy phandle device link
Date: Wed, 23 Sep 2026 10:32:59 +0800
Message-ID: <20260923023304.78428-2-inochiama@gmail.com>
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

It is very common for adding a device link for phy phandle
for device managed phy helper functions. So add a common
helper for future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53..7be649f14797 100644
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
  * _of_phy_get() - lookup and obtain a reference to a phy by phandle
  * @np: device_node for which to get the phy
@@ -784,7 +805,6 @@ struct phy *phy_get(struct device *dev, const char *string)
 {
 	int index = 0;
 	struct phy *phy;
-	struct device_link *link;
 
 	if (dev->of_node) {
 		if (string)
@@ -808,10 +828,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 
 	get_device(&phy->dev);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -885,7 +902,6 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 			    const char *con_id)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -900,10 +916,7 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
 		return phy;
 	}
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
@@ -955,7 +968,6 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index)
 {
 	struct phy **ptr, *phy;
-	struct device_link *link;
 
 	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
@@ -977,10 +989,7 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
-	if (!link)
-		dev_dbg(dev, "failed to create device link to %s\n",
-			dev_name(phy->dev.parent));
+	phy_add_device_link(dev, phy);
 
 	return phy;
 }
-- 
2.55.0

