Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4938332F
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 02:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130862; cv=none; b=sfQll+9H7RA/axEKDwI+OGSJwvEYe8qdsng12yw4ie1gkIO7HOrpeqzvlKe7CducXzfPw/uOIIwfNDV2sxbGGmO1+HPdwYxTReBnibFOyzuvEwRfFIBSPZ30pcn5kb08ZfHjOWnivCjkr/Vqz6vUyLUyQb+kF+3Sia9dfF9bqK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130862; c=relaxed/simple;
	bh=KAHvlzNsX2RSyag5xWzRHXQ55ITbwrvDX57hYu6PuRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ae51DdWgJcuE9xNr8BRRJikVSyQB/AKUe53tzDL/T9PVz7zzYyjYTBWyV40EyHbxyPpURe4FKC5WxYn5IASA2vv4Um6lnJX+N0qEBbxB5heEalwCbfmpzMNY62EvEXMH7rb9jA8meodPD3U69EUHR9voJ/w0hEnRt4nzZ9wHg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8MkN9VM; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8MkN9VM"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso262211a12.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 19:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130860; x=1790735660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnrcjxk0kzIW2dBkRTKNaLCxSo8UzYbysB1rR/EfFJo=;
        b=k8MkN9VMrRU9sPd9dtcMWT0cF4KpSTEZQyWhl1CC2eG0KRCQvOfuMPs4HiASEB0yEA
         LwFsqsEYOdap3mxGXGFCQ2TM7bkEpsqPBrev+EpcyC4RDOaxF86BT/OPu3H0psYnuA8G
         tmud/Dqy4ZW02HxvEhQejRbukiuvTYBh6VnijTOfQDZ/sSIi3JRSStHdoqXBWYFvOe7u
         SFj28cvc9xghEqBqYULCC22OxCB2JehDz24CV/ARJjP8FW/Gkcy6XRt5B4eG7CkG26c7
         ERuJpBr/cW1KSM/TEv77aUFS1EMqn5YMXidTOPd/lXUFLesbWU/+EDvoJAycAoQFQU2r
         xTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130860; x=1790735660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xnrcjxk0kzIW2dBkRTKNaLCxSo8UzYbysB1rR/EfFJo=;
        b=Zg5OBTdtbxZmanyhzVLSFxPkRAzZetZP/QtZm+qYzP+LcVCSKKE0b4UB0heKVLYB8v
         H28qS3/nvYZQbB38OkGYNwAExL4IyXJGtZ5hR5UiIxWItiIZEM9FSal9qllqmGRcsEl5
         SAC9HeKu8eP82UloTwXR3LR9otBSm1QLu/d/CddAUd4/4GKurrJJcXTVvWeUalqwfLK9
         W94htJjtIIHnmVNpiy9hgNeKgxnwyGv53msWyHaj3Jp8szs6Cd0DYGL9v9JoQYRZ6UX/
         2OV1HOeWjburToqWVdzI6x4PttXZ8QNr56gVniQtmWEHKy/yNL9nHAv1xlGQn/rPoYMI
         CmgQ==
X-Gm-Message-State: AFuF++k4+LeZKeSJ45272F7CaQCUU7P3M+Jtf6Ou8Qo8OsW/12Z4rusN
	QTH0z5kE8mUImBDrvBk/gF+bt1ibSAuq+i6mcwLCH1EZJsISfyj8+XCb
X-Gm-Gg: AYBFou3Ox9RzAs5G0uHibOnTUHsek+brF0W3diZgpRNBNyeoYKZYSwX02VFwMFWb5zf
	QPdhqVyUQ5MV7LFoHlT9F34LduVsVFfOXSF9RfZzJTHIHlk0BRihX5cfaacNu+rvv+sRbiYp/hb
	sXfDuSToAHP0MQq9kxxNj/Rj36o/ODwfC7ePKA5nyUlM5N63GLC+NEcqqCk6Ojg+IBH4NiYx1oM
	IORpP1HU53PDUWrXiPHjXUOYIxveK2+6+rgStW2aODQjtAk9AZRtVONXsD7kzw2PGYjdVHGZOP0
	+yTmL6Qy8hbPqyQqmKuwUfBAkahTTeBbyNd3UzBGDdzPdVF+kp0HfFFl7dvDwIe96SNnS6K5gG4
	5nv4w8gnaALeM8M9o9IBvG219qWKK0KW6xeXSwAxJkqQub97jTicXuVqCJfU8BsFC7H6YuI5bTS
	lIH/e0FAPHAjc6aslVm39vbwmrCjvXSrg65OqUBG0z7eLxi+EMUImVj4OHxOBVjR7n+Pwn
X-Received: by 2002:a05:6a20:3c9f:b0:3dd:a196:53a8 with SMTP id adf61e73a8af0-3ddf82fd72emr1311152637.74.1790130859652;
        Tue, 22 Sep 2026 19:34:19 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d5ce8sm316506a12.17.2026.09.22.19.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:34:19 -0700 (PDT)
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
Subject: [PATCH v3 5/5] doc: phy: Document some bulk helper functions
Date: Wed, 23 Sep 2026 10:33:03 +0800
Message-ID: <20260923023304.78428-6-inochiama@gmail.com>
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

Document all newly added bulk helper function, it can be used to manage
a set of PHYs automatically. This is useful when the driver want to
simplify the management of multiple PHYs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/driver-api/phy/phy.rst | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 0865c2e94eec..c5d3d7cc1a74 100644
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
+Currently, Only a few bulk helper functions are added as they have users.
+Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
-- 
2.55.0

