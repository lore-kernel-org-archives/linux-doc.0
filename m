Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F51482E9
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711734489; cv=none; b=bt5qrltRbBkBC2id+suxm72+MPFLNXIGHGKvu5waUE2iogO/TMzK2OcxCUeTanjpo/JUDnm8TGqLpI5ibLpSJIhRbIOT++10FMvEPDUHL0XNgng+83VqMVkj2jrUPeGJY/BNkz/Y3GQzIg6UxJbTGVnF0q82cW3Dwh9XwfIuqWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711734489; c=relaxed/simple;
	bh=973ZqU4LV/o8oIgHaoOlO0jC2gNX0j0wWK0Yc79NMGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MAN4qKffL7F4btu6fW49nxs5WkI8FVIJYLgNmQ61bMhuRsYpcLdi6D0QnsidVWPHU5mQkgk2JcurkDMURiFEEOWv9jBFrBtnKb5cCE6HhIiGcX0qst14mgMEnRPCEsc7214lbV+h+SzGJs5pIpNMD9Ip68523s1SMzNiWkS3HoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jl3wMsN8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jl3wMsN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711734485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x3/DpX6QupEcauZLwMrHtNsSzaJ+r7G/yL5hqFelshU=;
	b=Jl3wMsN83VMoP+fM6a5mr8gY5mNAw9s60rVrgyxkm50wyY4U+wacQ3/+caIFIEVR6oYc/I
	7fWf1dGDWtf+T6npwWxjdEzDeBr9tXXB5zqJLLJyBLb0XiC9hcxxfe3VJebKtTC+hXHMDS
	jgs24roMXyfiVlGqWstK/ttdcmzuUwo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-E-keonxsPkqkAeh2roTUKg-1; Fri, 29 Mar 2024 13:48:04 -0400
X-MC-Unique: E-keonxsPkqkAeh2roTUKg-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6966412d4dbso29435066d6.0
        for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 10:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711734483; x=1712339283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3/DpX6QupEcauZLwMrHtNsSzaJ+r7G/yL5hqFelshU=;
        b=j27Q7vK5AAnq2kc0CWAbIEscR9iVbSlPuTootKCdcfFeATv2WvAuCiOYELX4OklOyF
         i4Nnt/X3uc4SPjCiStJ1GbmU7A1AX/vsgNmCKHWuY9va/40lTBAMRosk+QuYkcdlGvPt
         isaq9A++gUBJ27BMiWAQosahREDB2kgiap4gbkLAGIjekb3LGJjRDq7qOiYbSNiZV82G
         EGxGAwSRafCBF/kw2NOtT0hAXh0o206Or2p+4Y1V0geF+4jp30GpYvxueCkB/bjSZTKE
         YpfBizS2pvfG34P4Vzx3kwJC/+ao6oXSK4eHylVlBQhuol2U+C7oywSeCLaDPijBgRI6
         WN3w==
X-Forwarded-Encrypted: i=1; AJvYcCWyqanHNDUZkDDSxEm0uShi7NH6vxttxFWpOaNmjmKKRTmb1C0kzbWzoyGS2CrJfZp8GtKPXWEbmDRwkhC5itoFn7a1E6dPPqrL
X-Gm-Message-State: AOJu0YzxyJxraCrRahRNYrJKFM/LUkpdelNupKXp9z+hhtJYHIOHgN+0
	0An3ogghK0wsy8PomTv5WksaAA+J/Jk42EuMsWGM8mHlQTt/KUH1G76D1skxQStWy5DXYsEHT6G
	rPJ7TgkNW1oTyfJbBawl/cuh48upzRWVHsv+x1EbjxJ1mcD+3ORDNisG3
X-Received: by 2002:ad4:448e:0:b0:696:2efd:ab27 with SMTP id m14-20020ad4448e000000b006962efdab27mr4627636qvt.16.1711734483543;
        Fri, 29 Mar 2024 10:48:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhaiRy9L/U2xYhifLOYfnfKwxe0YwCfdSfzeXDDjXLH0sS5Tk3kEF+w/OyhpGNxfkxPKmm1w==
X-Received: by 2002:ad4:448e:0:b0:696:2efd:ab27 with SMTP id m14-20020ad4448e000000b006962efdab27mr4627617qvt.16.1711734483240;
        Fri, 29 Mar 2024 10:48:03 -0700 (PDT)
Received: from klayman.redhat.com (net-2-34-30-89.cust.vodafonedsl.it. [2.34.30.89])
        by smtp.gmail.com with ESMTPSA id kk15-20020a056214508f00b00692bd4905c9sm1850291qvb.15.2024.03.29.10.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:48:02 -0700 (PDT)
From: Marco Pagani <marpagan@redhat.com>
To: Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Tull <atull@opensource.altera.com>
Cc: Marco Pagani <marpagan@redhat.com>,
	Russ Weight <russ.weight@linux.dev>,
	linux-fpga@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] fpga: region: add owner module and take its refcount
Date: Fri, 29 Mar 2024 18:47:28 +0100
Message-ID: <20240329174729.248144-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of the fpga region assumes that the low-level
module registers a driver for the parent device and uses its owner pointer
to take the module's refcount. This approach is problematic since it can
lead to a null pointer dereference while attempting to get the region
during programming if the parent device does not have a driver.

To address this problem, add a module owner pointer to the fpga_region
struct and use it to take the module's refcount. Modify the functions for
registering a region to take an additional owner module parameter and
rename them to avoid conflicts. Use the old function names for helper
macros that automatically set the module that registers the region as the
owner. This ensures compatibility with existing low-level control modules
and reduces the chances of registering a region without setting the owner.

Also, update the documentation to keep it consistent with the new interface
for registering an fpga region.

Other changes: unlock the mutex before calling put_device() in
fpga_region_put() to avoid potential use after release issues.

Fixes: 0fa20cdfcc1f ("fpga: fpga-region: device tree control for FPGA")
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Xu Yilun <yilun.xu@intel.com>
Reviewed-by: Russ Weight <russ.weight@linux.dev>
Signed-off-by: Marco Pagani <marpagan@redhat.com>
---

v3:
- Add reviewed-by Russ Weight
v2:
- Fixed typo in the documentation sets -> set
- Renamed owner pointer get_br_owner -> br_owner
---
 Documentation/driver-api/fpga/fpga-region.rst | 13 ++++++----
 drivers/fpga/fpga-region.c                    | 26 +++++++++++--------
 include/linux/fpga/fpga-region.h              | 13 +++++++---
 3 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/Documentation/driver-api/fpga/fpga-region.rst b/Documentation/driver-api/fpga/fpga-region.rst
index dc55d60a0b4a..77190a5ef330 100644
--- a/Documentation/driver-api/fpga/fpga-region.rst
+++ b/Documentation/driver-api/fpga/fpga-region.rst
@@ -46,13 +46,16 @@ API to add a new FPGA region
 ----------------------------
 
 * struct fpga_region - The FPGA region struct
-* struct fpga_region_info - Parameter structure for fpga_region_register_full()
-* fpga_region_register_full() -  Create and register an FPGA region using the
+* struct fpga_region_info - Parameter structure for __fpga_region_register_full()
+* __fpga_region_register_full() -  Create and register an FPGA region using the
   fpga_region_info structure to provide the full flexibility of options
-* fpga_region_register() -  Create and register an FPGA region using standard
+* __fpga_region_register() -  Create and register an FPGA region using standard
   arguments
 * fpga_region_unregister() -  Unregister an FPGA region
 
+Helper macros ``fpga_region_register()`` and ``fpga_region_register_full()``
+automatically set the module that registers the FPGA region as the owner.
+
 The FPGA region's probe function will need to get a reference to the FPGA
 Manager it will be using to do the programming.  This usually would happen
 during the region's probe function.
@@ -82,10 +85,10 @@ following APIs to handle building or tearing down that list.
    :functions: fpga_region_info
 
 .. kernel-doc:: drivers/fpga/fpga-region.c
-   :functions: fpga_region_register_full
+   :functions: __fpga_region_register
 
 .. kernel-doc:: drivers/fpga/fpga-region.c
-   :functions: fpga_region_register
+   :functions: __fpga_region_register_full
 
 .. kernel-doc:: drivers/fpga/fpga-region.c
    :functions: fpga_region_unregister
diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index b364a929425c..1beb7415c2dc 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -53,7 +53,7 @@ static struct fpga_region *fpga_region_get(struct fpga_region *region)
 	}
 
 	get_device(dev);
-	if (!try_module_get(dev->parent->driver->owner)) {
+	if (!try_module_get(region->br_owner)) {
 		put_device(dev);
 		mutex_unlock(&region->mutex);
 		return ERR_PTR(-ENODEV);
@@ -75,9 +75,9 @@ static void fpga_region_put(struct fpga_region *region)
 
 	dev_dbg(dev, "put\n");
 
-	module_put(dev->parent->driver->owner);
-	put_device(dev);
+	module_put(region->br_owner);
 	mutex_unlock(&region->mutex);
+	put_device(dev);
 }
 
 /**
@@ -181,14 +181,16 @@ static struct attribute *fpga_region_attrs[] = {
 ATTRIBUTE_GROUPS(fpga_region);
 
 /**
- * fpga_region_register_full - create and register an FPGA Region device
+ * __fpga_region_register_full - create and register an FPGA Region device
  * @parent: device parent
  * @info: parameters for FPGA Region
+ * @owner: owner module containing the get_bridges function
  *
  * Return: struct fpga_region or ERR_PTR()
  */
 struct fpga_region *
-fpga_region_register_full(struct device *parent, const struct fpga_region_info *info)
+__fpga_region_register_full(struct device *parent, const struct fpga_region_info *info,
+			    struct module *owner)
 {
 	struct fpga_region *region;
 	int id, ret = 0;
@@ -213,6 +215,7 @@ fpga_region_register_full(struct device *parent, const struct fpga_region_info *
 	region->compat_id = info->compat_id;
 	region->priv = info->priv;
 	region->get_bridges = info->get_bridges;
+	region->br_owner = owner;
 
 	mutex_init(&region->mutex);
 	INIT_LIST_HEAD(&region->bridge_list);
@@ -241,13 +244,14 @@ fpga_region_register_full(struct device *parent, const struct fpga_region_info *
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(fpga_region_register_full);
+EXPORT_SYMBOL_GPL(__fpga_region_register_full);
 
 /**
- * fpga_region_register - create and register an FPGA Region device
+ * __fpga_region_register - create and register an FPGA Region device
  * @parent: device parent
  * @mgr: manager that programs this region
  * @get_bridges: optional function to get bridges to a list
+ * @owner: owner module containing get_bridges function
  *
  * This simple version of the register function should be sufficient for most users.
  * The fpga_region_register_full() function is available for users that need to
@@ -256,17 +260,17 @@ EXPORT_SYMBOL_GPL(fpga_region_register_full);
  * Return: struct fpga_region or ERR_PTR()
  */
 struct fpga_region *
-fpga_region_register(struct device *parent, struct fpga_manager *mgr,
-		     int (*get_bridges)(struct fpga_region *))
+__fpga_region_register(struct device *parent, struct fpga_manager *mgr,
+		       int (*get_bridges)(struct fpga_region *), struct module *owner)
 {
 	struct fpga_region_info info = { 0 };
 
 	info.mgr = mgr;
 	info.get_bridges = get_bridges;
 
-	return fpga_region_register_full(parent, &info);
+	return __fpga_region_register_full(parent, &info, owner);
 }
-EXPORT_SYMBOL_GPL(fpga_region_register);
+EXPORT_SYMBOL_GPL(__fpga_region_register);
 
 /**
  * fpga_region_unregister - unregister an FPGA region
diff --git a/include/linux/fpga/fpga-region.h b/include/linux/fpga/fpga-region.h
index 9d4d32909340..d175babc3d68 100644
--- a/include/linux/fpga/fpga-region.h
+++ b/include/linux/fpga/fpga-region.h
@@ -36,6 +36,7 @@ struct fpga_region_info {
  * @mgr: FPGA manager
  * @info: FPGA image info
  * @compat_id: FPGA region id for compatibility check.
+ * @br_owner: module containing the get_bridges function
  * @priv: private data
  * @get_bridges: optional function to get bridges to a list
  */
@@ -46,6 +47,7 @@ struct fpga_region {
 	struct fpga_manager *mgr;
 	struct fpga_image_info *info;
 	struct fpga_compat_id *compat_id;
+	struct module *br_owner;
 	void *priv;
 	int (*get_bridges)(struct fpga_region *region);
 };
@@ -58,12 +60,17 @@ fpga_region_class_find(struct device *start, const void *data,
 
 int fpga_region_program_fpga(struct fpga_region *region);
 
+#define fpga_region_register_full(parent, info) \
+	__fpga_region_register_full(parent, info, THIS_MODULE)
 struct fpga_region *
-fpga_region_register_full(struct device *parent, const struct fpga_region_info *info);
+__fpga_region_register_full(struct device *parent, const struct fpga_region_info *info,
+			    struct module *owner);
 
+#define fpga_region_register(parent, mgr, get_bridges) \
+	__fpga_region_register(parent, mgr, get_bridges, THIS_MODULE)
 struct fpga_region *
-fpga_region_register(struct device *parent, struct fpga_manager *mgr,
-		     int (*get_bridges)(struct fpga_region *));
+__fpga_region_register(struct device *parent, struct fpga_manager *mgr,
+		       int (*get_bridges)(struct fpga_region *), struct module *owner);
 void fpga_region_unregister(struct fpga_region *region);
 
 #endif /* _FPGA_REGION_H */

base-commit: b1a91ca25f15b6d7b311de4465854a5981dee3d3
-- 
2.44.0

