Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF41C4E235F
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 08:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671981; cv=none; b=jXJU2u6289vFAzQ1qXeYGA0WKZ3+eq4A2lZcAfUeIXwCuTnkik+PdND52mGXaT87mJiwFnWxk36AOJM4EOs8KckcO4gkCIpvezCAE0ELS6qnRVYxP/jNXL2ePCbMbhR1nJiNFsnSuMrkpMgvITXJrW/NXPpISAERT2zk86ifxYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671981; c=relaxed/simple;
	bh=kor4g0PeQkauNRyd0OjzQuYUAneb9p6DsERWXQ5HwI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDHQzT4OYMa2TM3kEDYAmiu8/UZJAnMFtbwEqVFBrP+SU6goJ7CFHtl4Bmew58wfmz14aU7KBQcG8boM3ULfS01ooF/RvjpNoRpRjjCUOdo32CeGDlkytPcS2aCtZI5Y+Bh6mEET/QmXx3ZLOYCMIJ7q/HGBWNWmPomXu0gVfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnRqlXNm; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnRqlXNm"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f9bso18020645ad.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671979; x=1791276779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=natEiwM6lNYiM813fc4eYfICSWQq4v/YxBaqZ21XGiU=;
        b=WnRqlXNmhQ9MUl/JM/LdaQPgF199Jxq5W+LqCGbVjvC9ME1nlsu+QELg0ISFkAcoDA
         XpJTS+3L+KDilcL8ejlprfCAxA2BtKM0taOEwLrDgfu3BgJ71M/4TPOHFZC4BYvO0kM4
         LaFC0rqMuSB+EBHCbW9qwIUveMY3toS8sRnZcvQpizX+X9EOlGE6utmDXsCZ9BKAahX0
         L8F0VByXnFMY7fHwAwaAHRIioDt4yqfFRZMQUXKBtkkM134hR1LNp56vGJhE1aDt8b3i
         SzgmZZfxjtpeOO30Ums4HYIffxI3f7s4GpMs+N4tMyOUK3t6iw7CP5LU/KL00OuUY5pe
         dFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671979; x=1791276779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=natEiwM6lNYiM813fc4eYfICSWQq4v/YxBaqZ21XGiU=;
        b=0ZLUIGFQh8sKMIYedshW4jG1zjWlgMXRyH193KDrufWZHQk3sBC4ERht2ev71dZXeg
         qah2nmD6P+sy+5b+wR0KtTOydVV+YbF1YN6oFP0okBjIHq0vi0eSNmMnebzvcirmTM5V
         xDKNHOPknFz0CEhtlYRp1r0e42yhvXYJe6ESWpiw4Zo7mpiyVa95ANBGZcOEd6UiDSgK
         Holcz4t++8mVbrNeK0W4XJLxkhGxmrZzdqYVZkTSH9j9fp7jt5OlNsi/yt4+DV4NkN45
         DiHIrL567vGwUPtEegffOsJ5XmD5LW+m04XVu+K+XcL2O50vRo6ijSsNy5UXjKPOqMgN
         0dVg==
X-Gm-Message-State: AFq9FYLUNo2KYiJm3nBr+qZq7P+97+NzKcmH9jt1R2blgmcwpUlhqj4m
	Y7+O4La2k6xS2OffoqouNmGVyknuCcNdTqwQui5zlcI84mNZl8lfzorQ
X-Gm-Gg: AYBFou2PAPq9v8sIMFxrmlhoCsE8hUaKvcSHSmk1TcTGXuzE4L3cJHJrfBu2OWevJdm
	g2G72DGINoRl6fFwWSw3pYBe/ITWbUBrv7DdXE7u3GnGxR1RakHNNSTHAuOL6tBhe5V/xDK7iGB
	6ARXoL7W4mAvZTXS5pin5z9c7WZwEAUOszKGeiGOlkmhXnUNi0NzNQuvIGpaUABuy6usATGNyMi
	QKq8JSuxumbJc8KnVE+70ysZYGTyOd+nhz9ti8arOzzPCLq1CxD5lXVRYy0yDiT4/zd1IKa1RuP
	V4ctH77AAtjtzqGU6XDpWUhZgQ5kL3BAktzMA4tl6rV8QU9dTJrAxuCLtvnZQ+USuc2h8iXrNjh
	QjKXbmc1BuVUt7yZxpvre4fkxEW8oIIh4sfFPJt9tLGO2IGoBvYRZBKEBhhe3P6rE6fuDOKkzEm
	G/tfmzQZb7olFO1ye4BoSinpnU70dkvNXC/pkzZAMdNCURPzlt/elaoEeHgapSLPPh9HUd
X-Received: by 2002:a17:903:1ae7:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2df7da5ce18mr136442545ad.6.1790671979024;
        Tue, 29 Sep 2026 01:52:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm4296499a91.13.2026.09.29.01.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:52:58 -0700 (PDT)
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
Subject: [PATCH v4 5/5] doc: phy: Document some bulk helper functions
Date: Tue, 29 Sep 2026 16:52:35 +0800
Message-ID: <20260929085235.469515-6-inochiama@gmail.com>
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

Document all newly added bulk helper function, it can be used to manage
a set of PHYs automatically. This is useful when the driver want to
simplify the management of multiple PHYs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/driver-api/phy/phy.rst | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 0865c2e94eec..9d238ba0296d 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -114,6 +114,10 @@ it. This framework provides the following APIs to get a reference to the PHY.
 	struct phy *devm_of_phy_get_by_index(struct device *dev,
 					     struct device_node *np,
 					     int index);
+	int devm_phy_bulk_get_all(struct device *dev,
+				  struct phy_bulk_data **phys);
+	int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+				     struct phy_bulk_data **phys);
 
 phy_get, devm_phy_get and devm_phy_optional_get can be used to get the PHY.
 In the case of dt boot, the string arguments
@@ -129,6 +133,13 @@ Some generic drivers, such as ehci, may use multiple phys. In this case,
 devm_of_phy_get or devm_of_phy_get_by_index can be used to get a phy
 reference based on name or index.
 
+When a controller needs every PHY listed in a device node's ``phys`` property,
+devm_phy_bulk_get_all() obtains them from the controller's device node.
+devm_of_phy_bulk_get_all() does the same for an explicitly supplied device
+node. On success, these functions return the number of PHYs and store an array
+of ``struct phy_bulk_data`` in ``*phys``. The PHY references and array are
+managed by devres and are released when the device is detached.
+
 It should be noted that NULL is a valid phy reference. All phy
 consumer calls on the NULL phy become NOPs. That is the release calls,
 the phy_init() and phy_exit() calls, and phy_power_on() and
@@ -149,6 +160,19 @@ The general order of calls should be::
     phy_exit()
     [[of_]phy_put()]
 
+For a set of PHYs acquired with devm_phy_bulk_get_all() or
+devm_of_phy_bulk_get_all(), the corresponding order is::
+
+    devm_[of_]phy_bulk_get_all()
+    phy_bulk_init()
+    phy_bulk_power_on()
+    ...
+    phy_bulk_power_off()
+    phy_bulk_exit()
+
+The bulk get-all APIs release the PHY references and the array automatically
+when the device is detached.
+
 Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
 but controllers should always call these functions to be compatible with other
 PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
@@ -221,3 +245,8 @@ DeviceTree Binding
 
 The documentation for PHY dt binding can be found @
 Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+Missing Bulk Helpers
+====================
+Currently, only a few bulk helper functions are added as they have users.
+Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
-- 
2.55.0

