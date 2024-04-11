Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1C410788
	for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712846908; cv=none; b=p9Rr7TPrysZKvltKnHIMfikawatg6YbNfSLlcm8WIJQsUKHViLG1muOdCWXfG9bkOHzTzSPPmJpKIJunYPVF7SStEtQldhBkTT4ru74TlVwqK+CO1F7SM+Fay0g2Gbrp7ovofxIbzzy518iTgTJaETgc7OfxuHXmgSjPNxz0sI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712846908; c=relaxed/simple;
	bh=xdvDHEbiuJUGM57iynqCZ38yFaZXfSHSPEafF7pHVc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z41laPsNqaB1yuP97nKpJPBZH0vorqeME6OsDj3J7+8MEM8yE/u4neYflW24keau1j3gnuNgR2iXjCt8vFR/C7kipWbePPd0ciw61CEtMidsHpWbGDci85dzJ4/MCEZgk1PlIlnxveTOXWcSHV/ZSUjWjKTQeVgLwh5UjyuzYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RnjOmShM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnjOmShM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712846906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5jHQyB0DALNKMopR2MDBXCeG1jJE0vxzfU8Bvd08rQ8=;
	b=RnjOmShMMdcUN46kTM1FMXomdNgWA2//O7PUKFgKC0nyWhMZX9hC16eIWj/Ezdxn/G6eD7
	UsVp5+oX+NcpyRu9kcbOlHf5mOE5f/Ls/9bgciA97LypFSm7QTPhRZlm9dSVmMeSpYWlZZ
	dR9723zxjNaotK/DSjGNHm6ECFQC3Jk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-Mng4LwHsPXKztcU6-EoR3g-1; Thu, 11 Apr 2024 10:48:25 -0400
X-MC-Unique: Mng4LwHsPXKztcU6-EoR3g-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-78d6b7d1f4fso275293685a.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 07:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712846904; x=1713451704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jHQyB0DALNKMopR2MDBXCeG1jJE0vxzfU8Bvd08rQ8=;
        b=NXUbLOt4gWihjzZdaiODZ2ekH0XlrAZ9srAjbivSUc22Gag4gkpEU6ePzViAK11QXE
         3B+DU//orv8bfwOcqc/IF52fu09YQdbXOF5f64IFdoZFMDH2/rNAfWkCmOSIifzwIRPU
         tND3zl7CrRvUZiK/5NZYpoz9DTFfyNa4H0mOh6q6SVd2v7hDlliP1wzobQZxc2QI8fbK
         RGy1PDCHL9hmVUqqXDs9Vsm9FmAM8eFbNBTjdspnOVLJ7Ctt+6RD9M1BQdyS9LsYkUeW
         ZIe27LncK9bC399SsTKy3YvAFacmE8Iaaw1CNh5jpO87HJSH38BYGLO7MpSXvxiIyrjT
         LTTg==
X-Forwarded-Encrypted: i=1; AJvYcCVCXhjg1o1X8Wr9gCX3JZAkBb7nmm4IintoYdSzp9jYd8wqbsRNNzVCjbktA+tug3PEYecLa+eH/1nOWoS4zS0QF0izVYc5JA7K
X-Gm-Message-State: AOJu0YzGMGdVeA2UcF/4zIQfwQJADCDaI7YByjABK2lMdQ3t3juExUkp
	XsK0Bxd8GAFouVJK6DZ8SxuRtSup4z8wzeLzcilZKlZQZvbAZHuueRJuQiD6DAa4ZjZhqO3Idgn
	Fwq+EHyXx0xk/YuubkFASjE33/dlla2ZglqBr5jx42dHXPr3g/2h8IQ/N
X-Received: by 2002:a05:620a:1019:b0:78d:6bc5:167a with SMTP id z25-20020a05620a101900b0078d6bc5167amr6458940qkj.24.1712846904400;
        Thu, 11 Apr 2024 07:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQJu3FGq28jM8LbgkeqBzxhfuk9sHvIMAIsEnc8TLHProaKDrLP1ZIuG8SRzdfo2/qGcavEA==
X-Received: by 2002:a05:620a:1019:b0:78d:6bc5:167a with SMTP id z25-20020a05620a101900b0078d6bc5167amr6458917qkj.24.1712846904013;
        Thu, 11 Apr 2024 07:48:24 -0700 (PDT)
Received: from klayman.redhat.com (net-2-34-25-239.cust.vodafonedsl.it. [2.34.25.239])
        by smtp.gmail.com with ESMTPSA id bi10-20020a05620a318a00b0078d623428c5sm1106815qkb.88.2024.04.11.07.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 07:48:23 -0700 (PDT)
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
Subject: [PATCH v5] fpga: region: add owner module and take its refcount
Date: Thu, 11 Apr 2024 16:48:10 +0200
Message-ID: <20240411144811.121500-1-marpagan@redhat.com>
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

Fixes: 0fa20cdfcc1f ("fpga: fpga-region: device tree control for FPGA")
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Xu Yilun <yilun.xu@intel.com>
Reviewed-by: Russ Weight <russ.weight@linux.dev>
Signed-off-by: Marco Pagani <marpagan@redhat.com>
---

v5:
- Reverted function names swap in the documentation
- Renamed owner module pointer br_owner -> ops_owner
v4:
- Split out the swap between put_device() and mutex_unlock() while
releasing the region to avoid potential use after release issues
v3:
- Add reviewed-by Russ Weight
v2:
- Fixed typo in the documentation sets -> set
- Renamed owner module pointer get_br_owner -> br_owner
---
 Documentation/driver-api/fpga/fpga-region.rst | 13 ++++++----
 drivers/fpga/fpga-region.c                    | 24 +++++++++++--------
 include/linux/fpga/fpga-region.h              | 13 +++++++---
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/Documentation/driver-api/fpga/fpga-region.rst b/Documentation/driver-api/fpga/fpga-region.rst
index dc55d60a0b4a..2d03b5fb7657 100644
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
+   :functions: __fpga_region_register_full
 
 .. kernel-doc:: drivers/fpga/fpga-region.c
-   :functions: fpga_region_register
+   :functions: __fpga_region_register
 
 .. kernel-doc:: drivers/fpga/fpga-region.c
    :functions: fpga_region_unregister
diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index b364a929425c..cb446dc68fca 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -53,7 +53,7 @@ static struct fpga_region *fpga_region_get(struct fpga_region *region)
 	}
 
 	get_device(dev);
-	if (!try_module_get(dev->parent->driver->owner)) {
+	if (!try_module_get(region->ops_owner)) {
 		put_device(dev);
 		mutex_unlock(&region->mutex);
 		return ERR_PTR(-ENODEV);
@@ -75,7 +75,7 @@ static void fpga_region_put(struct fpga_region *region)
 
 	dev_dbg(dev, "put\n");
 
-	module_put(dev->parent->driver->owner);
+	module_put(region->ops_owner);
 	put_device(dev);
 	mutex_unlock(&region->mutex);
 }
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
+	region->ops_owner = owner;
 
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
index 9d4d32909340..5fbc05fe70a6 100644
--- a/include/linux/fpga/fpga-region.h
+++ b/include/linux/fpga/fpga-region.h
@@ -36,6 +36,7 @@ struct fpga_region_info {
  * @mgr: FPGA manager
  * @info: FPGA image info
  * @compat_id: FPGA region id for compatibility check.
+ * @ops_owner: module containing the get_bridges function
  * @priv: private data
  * @get_bridges: optional function to get bridges to a list
  */
@@ -46,6 +47,7 @@ struct fpga_region {
 	struct fpga_manager *mgr;
 	struct fpga_image_info *info;
 	struct fpga_compat_id *compat_id;
+	struct module *ops_owner;
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

base-commit: 5d04660b29fb31e88e945c8b3eb658976824d0fa
-- 
2.44.0

