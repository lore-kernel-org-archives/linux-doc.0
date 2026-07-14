Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128B46AF0F
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034447; cv=none; b=NIsCTqwWSvlkj6d68AY/loe/YgzmUBwxj/mUVO4KNQv1RtbenBqzkxBK7NwlocmUAhK9KS8Y5kJUip4JFguhL/+VgEyocE2V+mrpqYqUCUGs0inLLRDbvvG5vXNGy8Px/QsT/O/doI4+Tfh0L4llvnxTSIvqZjuE0BnJ8rs9hFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034447; c=relaxed/simple;
	bh=K94VRwZaVExISaYH+2jjkBkd/38Sf/HsRBDFWlaligk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=suBRcXKeOBaNiYLza4xyoET/z2cBRn2a8FBZcNzdGL5CMGSRusdem658yPaVpBYhUpkjJb1lW/uxFnt3X3BAhJnNPjUuy2io8C4+dbHhL4cVGISzCTNCj6ueROF9b8VPa9Z0bD+FlxfMdMVj2OISkILDolpN6sHmaJXCyNL10ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dy4k85cS; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dy4k85cS"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb42a2f5feso1732545a34.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 06:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784034444; x=1784639244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SD1E2b021BNT8K5FqPsuJFYVGZ1yPqvbXL/PhK3jvMg=;
        b=dy4k85cSxEadN3g3y8QfUXYwo9Z5DurmYafCkhfw3XU+puRhRJxX28CztpSHM0cVcS
         SgthW+M4ntmi06z1cSHm3BDpnyK6g9UX0GQE2H1VVsJ/G+yPYAzy4iunNYgaazY9UKqD
         V2jnP3kbXvDWD3wigJGJVqo/Ctf5NIFvn8sJ1/zsfQgZ66qKzr3YxakfaEGxqv69FRO3
         QJtn+CsZF2VaJDz0xOBuEgMEyA3Y1xS1E1zFC3sDq8RhjdyjR0RlLLRzkXL/V6XNmsnQ
         VZqR5leG+NDUJegAkveAvzi6hwCimWSiPFjw1rjhJuDajqTSdLG+ILSIQomfwK6Y7w2/
         o4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034444; x=1784639244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SD1E2b021BNT8K5FqPsuJFYVGZ1yPqvbXL/PhK3jvMg=;
        b=UiJSc7e+zw/zynGySiMD83OVZ2tjKyc9ZDE3vs22QsupOKOLRw+aU27ysaFEroq29C
         H6TMQ9E84D8bzHPr3HssM5p25F+FWMQkPJ0z1yZARl3RwCIl7dcy2u6FrDX/NM+0MSuZ
         vOrfPj/DwwODOMLgaT2rCfEwV9aJc31adhkjqHTN/CEOcBj+/zvvRXiiK9d5gkZD2z1o
         7t836Bxt2xPx8T8VQjL0/IFzrk43OQwN7VyBNODmAJQk72O57NztHAPah/YpVGRzQigM
         uREYVO8M+RcagV/NaaEalV+X+NwNCv6PlI/ulD1dHWEvBhQL5jkEkfUaJ9lZhE8rbYwV
         8IBA==
X-Forwarded-Encrypted: i=1; AFNElJ8RpaUbrZUQu8FH9flVDVfnmjiLSyEqL40uCyV5VYLUIKUF6jx4UmdYKNtH/2PeQo4q7HspKBNy90c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFiLZ/mHreutHWXLCAVPCTBqiZbgdLn0UH0OYwSBQJiqoIt//o
	SDm1sj9zeHTx9ST16r/a5haGpsdjnh/xAR8O1o9j1Xe3JaXchIi+J+T9fuzJeJSHGIM=
X-Gm-Gg: AfdE7cn7lv+ynlKTfS27IrK1iz5u7tM9ef4kUmRsLn7Y0eTIAn0FZ0obsy4oChXxahn
	lOYYstrGZ5CD1PXOx/XUbFUpfHSuxDk0TAOsjUF/6CLs9CMn6+pAF98HI9c2apWhU3tDcVJL4tN
	FY38GlSftSj3C/9KUfl4Ww8s9B6RA9uHQ0buBy/mIGn4ai02yWVNLTMCyBmf9U1Quor6mqsyjZX
	GQ1XSt8pQZZhKKMaNHgihqaB8X5x1nTJ7jWC5VmiOlX4R+D2MPgs+HnjlBJa+xDgkMKDmbadqx3
	3negHVXZv+EkqND2xCein56mXLqm5BeKJdfcJpQWm9lLwZ0a7QWWoJYmzTGIqu4jPRKoQbtsp2d
	wELJFN+sFSuarlJSeIul2Ucc694qdc7RcYYJHGUeKj4WeX1q3rVnBSMpW6OpRDKIm7uMvAeLaWI
	wRU4yeWXXB+EM/qQzBQZIzCdLVlHUV5Ktpi9T0KM0GJWCF43AS9KWtsZXrEOF+cw==
X-Received: by 2002:a05:6830:4182:b0:7e6:c9eb:535a with SMTP id 46e09a7af769-7ec4a768626mr991961a34.6.1784034443908;
        Tue, 14 Jul 2026 06:07:23 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm14657738a34.0.2026.07.14.06.07.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 06:07:23 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: will@kernel.org,
	robin.murphy@arm.com,
	fustini@kernel.org,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	corbet@lwn.net,
	shuah@kernel.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 1/7] iommu: Add group lookup by ID
Date: Tue, 14 Jul 2026 21:06:51 +0800
Message-ID: <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add iommu_group_get_by_id() so callers can resolve an IOMMU group from
the numeric ID used in /sys/kernel/iommu_groups.

An ID lookup must keep the group object alive without also keeping an
otherwise empty group active. Embed the devices kobject in struct
iommu_group so its address remains valid until the parent group is
released, and return a reference on the parent kobject to ID lookup
callers. Add iommu_group_put_by_id() to release that reference and
iommu_group_is_active() to detect when the devices kobject has become
inactive.

Serialize lookup against group teardown with iommu_group_kset_mutex and
only return groups whose devices kobject still has a live reference.
This prevents a concurrent lookup from dereferencing a stale child
kobject while allowing external users to discard bindings to empty
groups.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 drivers/iommu/iommu.c | 107 +++++++++++++++++++++++++++++++++++++-----
 include/linux/iommu.h |  17 +++++++
 2 files changed, 113 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e8f13dcebbde..da269d10f6bf 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -40,6 +40,7 @@
 #include "iommu-priv.h"
 
 static struct kset *iommu_group_kset;
+static DEFINE_MUTEX(iommu_group_kset_mutex);
 static DEFINE_IDA(iommu_group_ida);
 static DEFINE_IDA(iommu_global_pasid_ida);
 
@@ -52,7 +53,8 @@ enum { IOMMU_PASID_ARRAY_DOMAIN = 0, IOMMU_PASID_ARRAY_HANDLE = 1 };
 
 struct iommu_group {
 	struct kobject kobj;
-	struct kobject *devices_kobj;
+	/* Embedded so it remains addressable until the parent group is released. */
+	struct kobject devices_kobj;
 	struct list_head devices;
 	struct xarray pasid_array;
 	struct mutex mutex;
@@ -729,7 +731,7 @@ static void __iommu_group_free_device(struct iommu_group *group,
 {
 	struct device *dev = grp_dev->dev;
 
-	sysfs_remove_link(group->devices_kobj, grp_dev->name);
+	sysfs_remove_link(&group->devices_kobj, grp_dev->name);
 	sysfs_remove_link(&dev->kobj, "iommu_group");
 
 	trace_remove_device_from_group(group->id, dev);
@@ -1058,6 +1060,14 @@ static const struct kobj_type iommu_group_ktype = {
 	.release = iommu_group_release,
 };
 
+static void iommu_group_devices_release(struct kobject *kobj)
+{
+}
+
+static const struct kobj_type iommu_group_devices_ktype = {
+	.release = iommu_group_devices_release,
+};
+
 /**
  * iommu_group_alloc - Allocate a new group
  *
@@ -1091,17 +1101,22 @@ struct iommu_group *iommu_group_alloc(void)
 	}
 	group->id = ret;
 
+	mutex_lock(&iommu_group_kset_mutex);
 	ret = kobject_init_and_add(&group->kobj, &iommu_group_ktype,
 				   NULL, "%d", group->id);
 	if (ret) {
 		kobject_put(&group->kobj);
+		mutex_unlock(&iommu_group_kset_mutex);
 		return ERR_PTR(ret);
 	}
 
-	group->devices_kobj = kobject_create_and_add("devices", &group->kobj);
-	if (!group->devices_kobj) {
+	kobject_init(&group->devices_kobj, &iommu_group_devices_ktype);
+	ret = kobject_add(&group->devices_kobj, &group->kobj, "devices");
+	if (ret) {
+		kobject_put(&group->devices_kobj);
 		kobject_put(&group->kobj); /* triggers .release & free */
-		return ERR_PTR(-ENOMEM);
+		mutex_unlock(&iommu_group_kset_mutex);
+		return ERR_PTR(ret);
 	}
 
 	/*
@@ -1114,15 +1129,18 @@ struct iommu_group *iommu_group_alloc(void)
 	ret = iommu_group_create_file(group,
 				      &iommu_group_attr_reserved_regions);
 	if (ret) {
-		kobject_put(group->devices_kobj);
+		kobject_put(&group->devices_kobj);
+		mutex_unlock(&iommu_group_kset_mutex);
 		return ERR_PTR(ret);
 	}
 
 	ret = iommu_group_create_file(group, &iommu_group_attr_type);
 	if (ret) {
-		kobject_put(group->devices_kobj);
+		kobject_put(&group->devices_kobj);
+		mutex_unlock(&iommu_group_kset_mutex);
 		return ERR_PTR(ret);
 	}
+	mutex_unlock(&iommu_group_kset_mutex);
 
 	pr_debug("Allocated group %d\n", group->id);
 
@@ -1286,7 +1304,7 @@ static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
 		goto err_remove_link;
 	}
 
-	ret = sysfs_create_link_nowarn(group->devices_kobj,
+	ret = sysfs_create_link_nowarn(&group->devices_kobj,
 				       &dev->kobj, device->name);
 	if (ret) {
 		if (ret == -EEXIST && i >= 0) {
@@ -1431,7 +1449,7 @@ struct iommu_group *iommu_group_get(struct device *dev)
 	struct iommu_group *group = dev->iommu_group;
 
 	if (group)
-		kobject_get(group->devices_kobj);
+		kobject_get(&group->devices_kobj);
 
 	return group;
 }
@@ -1446,7 +1464,7 @@ EXPORT_SYMBOL_GPL(iommu_group_get);
  */
 struct iommu_group *iommu_group_ref_get(struct iommu_group *group)
 {
-	kobject_get(group->devices_kobj);
+	kobject_get(&group->devices_kobj);
 	return group;
 }
 EXPORT_SYMBOL_GPL(iommu_group_ref_get);
@@ -1461,10 +1479,77 @@ EXPORT_SYMBOL_GPL(iommu_group_ref_get);
 void iommu_group_put(struct iommu_group *group)
 {
 	if (group)
-		kobject_put(group->devices_kobj);
+		kobject_put(&group->devices_kobj);
 }
 EXPORT_SYMBOL_GPL(iommu_group_put);
 
+/**
+ * iommu_group_get_by_id - Lookup an IOMMU group by its sysfs ID
+ * @id: group ID matching /sys/kernel/iommu_groups/<id>
+ *
+ * Return a group with a reference on its parent kobject, or NULL if no active
+ * group exists for @id. The caller must release the returned group with
+ * iommu_group_put_by_id(). Keeping this reference does not keep an empty
+ * group's devices kobject active.
+ */
+struct iommu_group *iommu_group_get_by_id(int id)
+{
+	struct kobject *group_kobj;
+	struct iommu_group *group = NULL;
+	char name[12];
+
+	if (!iommu_group_kset || id < 0)
+		return NULL;
+
+	snprintf(name, sizeof(name), "%d", id);
+	mutex_lock(&iommu_group_kset_mutex);
+	group_kobj = kset_find_obj(iommu_group_kset, name);
+	if (!group_kobj)
+		goto unlock;
+
+	group = container_of(group_kobj, struct iommu_group, kobj);
+	if (!kobject_get_unless_zero(&group->devices_kobj)) {
+		kobject_put(group_kobj);
+		group = NULL;
+		goto unlock;
+	}
+
+	kobject_put(&group->devices_kobj);
+unlock:
+	mutex_unlock(&iommu_group_kset_mutex);
+	return group;
+}
+EXPORT_SYMBOL_GPL(iommu_group_get_by_id);
+
+/**
+ * iommu_group_put_by_id - Release a group returned by ID lookup
+ * @group: group returned by iommu_group_get_by_id()
+ */
+void iommu_group_put_by_id(struct iommu_group *group)
+{
+	if (group)
+		kobject_put(&group->kobj);
+}
+EXPORT_SYMBOL_GPL(iommu_group_put_by_id);
+
+/**
+ * iommu_group_is_active - Test whether a referenced group can accept devices
+ * @group: referenced IOMMU group
+ *
+ * Return true while the devices kobject still has a live reference. Once the
+ * group loses its last device and external device reference, it cannot become
+ * active again.
+ */
+bool iommu_group_is_active(struct iommu_group *group)
+{
+	if (!group || !kobject_get_unless_zero(&group->devices_kobj))
+		return false;
+
+	kobject_put(&group->devices_kobj);
+	return true;
+}
+EXPORT_SYMBOL_GPL(iommu_group_is_active);
+
 /**
  * iommu_group_id - Return ID for a group
  * @group: the group to ID
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d20aa6f6863a..e771b4a92f5b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -989,6 +989,9 @@ extern void iommu_group_remove_device(struct device *dev);
 extern int iommu_group_for_each_dev(struct iommu_group *group, void *data,
 				    int (*fn)(struct device *, void *));
 extern struct iommu_group *iommu_group_get(struct device *dev);
+struct iommu_group *iommu_group_get_by_id(int id);
+void iommu_group_put_by_id(struct iommu_group *group);
+bool iommu_group_is_active(struct iommu_group *group);
 extern struct iommu_group *iommu_group_ref_get(struct iommu_group *group);
 extern void iommu_group_put(struct iommu_group *group);
 
@@ -1401,6 +1404,20 @@ static inline struct iommu_group *iommu_group_get(struct device *dev)
 	return NULL;
 }
 
+static inline struct iommu_group *iommu_group_get_by_id(int id)
+{
+	return NULL;
+}
+
+static inline void iommu_group_put_by_id(struct iommu_group *group)
+{
+}
+
+static inline bool iommu_group_is_active(struct iommu_group *group)
+{
+	return false;
+}
+
 static inline void iommu_group_put(struct iommu_group *group)
 {
 }
-- 
2.50.1 (Apple Git-155)

