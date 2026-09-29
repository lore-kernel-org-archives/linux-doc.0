Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5AE4DA9A9
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671974; cv=none; b=mfNbDbtTGdx5VRmlSbygS7hwmYsrqH1PxgvoVUqUEhSCUpNISHjfTyOOFkC5F2zd/+/xmBYMRfI6xmVXTt4xKMjVJYrDYrBevPw3d+Qhj7dPWBrctSjouzQNe+PWORPzMF4wXkoT6uO3XidJAyvTU2rfkdlcbQZ57fSGce75sCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671974; c=relaxed/simple;
	bh=/5Y2a7OHDrZ6jahngk9hKXSydFbk7n3qDMauoI5sWJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfzDPARDjwQWYVlQO0RHs9pg3faVTlcdn8PA2DgNATNp6mmHXzcDUnUlTCA850KF6Q4d6+LMnHKWgzmM/b5uOOTCNz3y9IObaBs12vLi/ILpj9RRDyPI2JrLOql6B9qtP/pWdi/VFjeisUQREGJS+1lsZOOvghYsOly6uzG7vfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1+TJ2Mh; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1+TJ2Mh"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49bd98411so430909a91.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671971; x=1791276771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPE7PSkJ4NrPw8zuJEf70/v8WMud7mVFynWgRXYCG4A=;
        b=d1+TJ2MhPm4OfZ3oabH4GRwtok19CBvGwbQnzP/d5Bfz84nL5FkDitc5PHElk2ugIz
         cI86xZaxGR3XVVxMWUTGfZKNerW233bEBLyfZPCDrUGAe6+z65dvCO2ToHtYH/RwMAZJ
         oqXHfP2eisEbdQHie0ZUfulH6y3su8f98+hY/TwJHbWYODi3Gc9uz9G9WZ4v2fDCA1lW
         iyL+eDew7F1aE8WzLOZoTsOrHGJBiQzTQzDe54aL4XaGIJ4bfb1qH8aTg6KdnbXMlVtw
         n+QPcsiBWHPLvAgEs19hRcf23dlZ5rGyTsCtvetREKha+nlRxYAGH1cEzbEYNFzZli4W
         Ff4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671971; x=1791276771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPE7PSkJ4NrPw8zuJEf70/v8WMud7mVFynWgRXYCG4A=;
        b=NzdqxS7i4tkBydjYySVawg5gMvyzHOzyBRbYGmt9H79aw3Xp/eR8q2KiEc11+rv6qy
         mCDYTcB+XbH22+Y2xYc66BCHefiy+QPONDfH5U60nW8QPpMYemGXNSZJ0laN4w1SgLi3
         HMLEwpwLuyW7nVfpQpHLS5/yGw448Mhz0BpPg6K48OEbK7/IOthLcRjQgc7DORJ2Q2bs
         2+v4URrztmLyQ/TAAseJV+bKJx6X7otRrG92g1wAZnCgSlCDEukjS+687xQcFVm0Ecyp
         g0d68YpFZvR0BPr5zPvLVwCl3Goy8J62hU9TWVMWguWD8Tr9jJaXkqJkOwodVPrGxUZ2
         nRrw==
X-Gm-Message-State: AFq9FYI0IeM/vvaNwM9GavbXvt2h1ksZRdvRwqTl5tpKcDFm1BMjb8Is
	TGQ4VE3KLS/JuVtCTp1kuRNZs8ukYRmUqRDD2rRQJ5j+ZLmR9wfF7T0s
X-Gm-Gg: AYBFou3I3qPsu6kw/n3hVS/58q1NpX/lLhewI1Hm3apD21ADax9k2Knvk+TeDgWLgzG
	PCjnk7hA1MIFaKnTg/Azy/U78nvFcpG46EAQcrvmdnsMCkMH1NBOT5q4HBvTPxC75tnQvGrlGWB
	d5Sj5PeZLoW/ZxSMkZ/uo1t4/XV/t+v1BiWl65Y4qvz7ObLeNqD167/ds0P0ib5xxgd0ZVmeJo2
	Sh8wrZRPWVOJ1kaFkR7crGlHTbUpFaOm9UjrD4ECRyC/P7uxEPVGZONx3POCUDiwtJA3iZ0cwrK
	rBMCPdNjXaD+KmYnUssxENdYjjcXa38AEHeDZnZ/isZfVfmXki+ck1PcAycChKndONBW4lZVVVT
	9SoTli1LixtnGlF1NCyNgz69dubyS5Zd2lsySd4nw2DRM6zaQS4JdRX1Cw0JEPWWd6mXIvGW48x
	EcNTDuAL9N6sQ7+hdKJ6CVVpPyE7F1a9/kBHlCgeZlsu3qFCueH76Cm4nv2gLKjBXjxFYz
X-Received: by 2002:a17:90b:48d0:b0:3a0:f432:2684 with SMTP id 98e67ed59e1d1-3a0f4322bffmr6275906a91.9.1790671971142;
        Tue, 29 Sep 2026 01:52:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498179081sm4289281a91.14.2026.09.29.01.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:52:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
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
Subject: [PATCH v4 2/5] phy: core: Add common helper for get phy phandle by index
Date: Tue, 29 Sep 2026 16:52:32 +0800
Message-ID: <20260929085235.469515-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929085235.469515-1-inochiama@gmail.com>
References: <20260929085235.469515-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two phy helpers use index to get phy phandle of a device node,
add a common function for the future reuse.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/phy/phy-core.c | 51 +++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 7be649f14797..8fbaea003b90 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -682,33 +682,49 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
 	return phy;
 }
 
+/**
+ * of_phy_get_by_index() - lookup and obtain a reference to a phy using a
+ * device_node by index.
+ * @np: device_node for which to get the phy
+ * @index: index of the phy from device's point of view
+ *
+ * Returns: the phy device, after getting a refcount to it; or
+ * -ENODEV if there is no such phy. The caller is responsible for
+ * calling of_phy_put() to release that count.
+ */
+static struct phy *of_phy_get_by_index(struct device_node *np, int index)
+{
+	struct phy *phy;
+
+	phy = _of_phy_get(np, index);
+	if (IS_ERR(phy))
+		return phy;
+
+	if (!try_module_get(phy->ops->owner))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	get_device(&phy->dev);
+
+	return phy;
+}
+
 /**
  * of_phy_get() - lookup and obtain a reference to a phy using a device_node.
  * @np: device_node for which to get the phy
  * @con_id: name of the phy from device's point of view
  *
- * Returns the phy driver, after getting a refcount to it; or
+ * Returns: the phy device, after getting a refcount to it; or
  * -ENODEV if there is no such phy. The caller is responsible for
  * calling of_phy_put() to release that count.
  */
 struct phy *of_phy_get(struct device_node *np, const char *con_id)
 {
-	struct phy *phy = NULL;
 	int index = 0;
 
 	if (con_id)
 		index = of_property_match_string(np, "phy-names", con_id);
 
-	phy = _of_phy_get(np, index);
-	if (IS_ERR(phy))
-		return phy;
-
-	if (!try_module_get(phy->ops->owner))
-		return ERR_PTR(-EPROBE_DEFER);
-
-	get_device(&phy->dev);
-
-	return phy;
+	return of_phy_get_by_index(np, index);
 }
 EXPORT_SYMBOL_GPL(of_phy_get);
 
@@ -958,7 +974,7 @@ EXPORT_SYMBOL_GPL(devm_of_phy_optional_get);
  * @np: node containing the phy
  * @index: index of the phy
  *
- * Gets the phy using _of_phy_get(), then gets a refcount to it,
+ * Gets the phy using of_phy_get_by_index(), then gets a refcount to it,
  * and associates a device with it using devres. On driver detach,
  * release function is invoked on the devres data,
  * then, devres data is freed.
@@ -973,19 +989,12 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	phy = _of_phy_get(np, index);
+	phy = of_phy_get_by_index(np, index);
 	if (IS_ERR(phy)) {
 		devres_free(ptr);
 		return phy;
 	}
 
-	if (!try_module_get(phy->ops->owner)) {
-		devres_free(ptr);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
-
-	get_device(&phy->dev);
-
 	*ptr = phy;
 	devres_add(dev, ptr);
 
-- 
2.55.0

