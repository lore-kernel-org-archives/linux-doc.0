Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5F434DB7C
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640052; cv=none; b=FuJbUKy3EChXiHiqSRemFfTml+qZ78rrxDP+hlbmQrfH0SLl72gPMS9lmA1AVHFhuUk1VB3Vw2qMD4KgcWY3PwKm8Ty7N5SIW3IsK6x6+4aphD8LIrP42LhDDCHxzQ9bQnw2o1xFQVXHnoch/fadYpQP4+Nh3W/D0ru75grP7I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640052; c=relaxed/simple;
	bh=iIEcsOfgyoQwnVxTEoJrOmuXhZRHf4VmCFe2BWfUG0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRxBmuNyb9JVOD3cVTFJ2EtvvorYTu1uTkjoBs2g9bUUVbnAy3+RXfbsm0dljZdyyanPfhRKjndN0aoqyzYhhjSX57YdezUe3P5v3CxTXyjto6EYhLbJYjaoJ5KzpHcN5iOS0oTXOJvV2E8LKqgaujh6tBPwtAA/kfx1Uy6/WMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=ftkhT3Oe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="ftkhT3Oe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso62212665e9.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 08:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772640048; x=1773244848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNmgU9ASHSR7+2H948CyENoisRrq7nchFqcl7cGshyU=;
        b=ftkhT3OeFhHAf33owxf/YhwRgMLICzVeqazvpP0QrPLaQ3gtmOhem7gNfNfgDo0H56
         19VKp4IAF6XLvhNEmudreQw790iu2yWFhko3uc6sUicgjhxLcxKNC3RLyK4+X2ymlof/
         +vm4OdFV6KHo3lCUvMgu/DoqT3DfV4+FBIhcKdMYVVap/zy4/zdUtKMJWVJiBqQXyqdz
         CuvriifmyubbbbRbqih895MJZiHYoN6EmSWAnEk379SFYq6/tTaUmxrgmwlsWvR3jUnl
         34dDqWa48zo+qJq0Yw1I5QyXOOqPiAubD+9GVLpfJlixGpAmhptUvre3yXa09tgwZqf6
         /oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640048; x=1773244848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TNmgU9ASHSR7+2H948CyENoisRrq7nchFqcl7cGshyU=;
        b=IdFkMjnN4bkESrm6C768C8LeEmk2Bc5hZlXqSs+nwDMQ7We4kG4fAI9Aimk0XLEbQd
         oOsFZpuBZQTJfAP0qnO67Gk6SKlAFQThVDslXStGAcRdGqVT/r5N38YXX/kx5sq0biKM
         ipblhjzCxd2EmSp/sLQvPMXhve63FaEs4h/JZG+5EcU0PLSaDqwrK2ZcIRXWI+KTfySd
         X41hRY6ueOMZNsC5/eGVfXtdXkTH4C2bz6qJMsDJjFNH03Qua0Cn8gICDxlc99MtYchP
         avTBUSfr7ZjB7sF9+fv2Z4VwSzk9M8oV+2v8zMMBtlWR3KwhffesYt3DTaZ+N5u6xCPw
         fcqA==
X-Forwarded-Encrypted: i=1; AJvYcCXu6gUmDbxZ/tUPdnvveQYQ7r1EBeIW5zAFw2M4FqNt5RJCAPqU8WRYkywSg52KPNHvpbIo4gIlxyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNJsVeHyL6K9tUwq4mLY67imQiZvg46Kxt41qrmqCgfSAyKaVZ
	9+LG010LRZyoEHmdsXdV+CoRP0b3wxoiK5Dj8kFUi3WvrgzGp81rKlPhAAqpUMtJGQA=
X-Gm-Gg: ATEYQzyTRggj7tEJiTiwCbr3T+4zWrU+IkGUhVkd4HL7gV4kBWMdz6MJHQ0cKRJS4J+
	jDFOhb1Cf6azHHLWAHrG8BdXoqAMZpkbDlEMz74Jh08t6ki5OJqDDRsGP8AkZacaCWy8iCz93hy
	BljzJm1Xa32344Wd6Rrkc7XpxafEosSAWcdHbnZkjU5tGAr8Wui8pdoAuWXU0m5Znx2fYlOuSzz
	2fk2WCCZ8FXkcdAvMNTC1Kq6C6sLNRvbxI8krC2ey92SfaSDlNcATvyhdWf75JqSsx3vFhvK79X
	auHgt44ypT9FZT9+gDZ6Gbh6PaLDek5YLqzuM4GZM8ZcFKAqkhTO1/3awyg3f7QSNnPVsMOuCDG
	1HFoJ6mwO0pSiEmw5ntTdTc6Vj6BZp7sZXwsYlFNCDtNWe6LeEbQFwigEU9oh3I9mph2mC7/nBP
	OZVSg6mfnGhzqe7kIbAINn0mR60tahVHBmnrL6CgfCRoZwcg==
X-Received: by 2002:a05:600c:620f:b0:47d:885d:d2ff with SMTP id 5b1f17b1804b1-4851989f6bemr42106725e9.29.1772640047786;
        Wed, 04 Mar 2026 08:00:47 -0800 (PST)
Received: from localhost (46-13-72-179.customers.tmcz.cz. [46.13.72.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187b7851sm104855645e9.3.2026.03.04.08.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:00:47 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	donald.hunter@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	przemyslaw.kitszel@intel.com,
	mschmidt@redhat.com,
	andrew+netdev@lunn.ch,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	chuck.lever@oracle.com,
	matttbe@kernel.org,
	cjubran@nvidia.com,
	daniel.zahka@gmail.com,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH net-next v3 11/13] devlink: introduce shared devlink instance for PFs on same chip
Date: Wed,  4 Mar 2026 17:00:20 +0100
Message-ID: <20260304160022.6114-12-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260304160022.6114-1-jiri@resnulli.us>
References: <20260304160022.6114-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Multiple PFs may reside on the same physical chip, running a single
firmware. Some of the resources and configurations may be shared among
these PFs. Currently, there is no good object to pin the configuration
knobs on.

Introduce a shared devlink instance, instantiated upon probe of
the first PF and removed during remove of the last PF. The shared
devlink instance is not backed by any device device, as there is
no PCI device related to it.

The implementation uses reference counting to manage the lifecycle:
each PF that probes calls devlink_shd_get() to get or create
the shared instance, and calls devlink_shd_put() when it removes.
The shared instance is automatically destroyed when the last PF removes.

Example:

pci/0000:08:00.0: index 0
  nested_devlink:
    auxiliary/mlx5_core.eth.0
devlink_index/1: index 1
  nested_devlink:
    pci/0000:08:00.0
    pci/0000:08:00.1
auxiliary/mlx5_core.eth.0: index 2
pci/0000:08:00.1: index 3
  nested_devlink:
    auxiliary/mlx5_core.eth.1
auxiliary/mlx5_core.eth.1: index 4

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v2->v3:
- added __counter_by() for priv
- added *driver arg to devlink_shd_get()
- added ops, priv_size and driver pointer consistency check
v1->v2:
- s/err_kstrdup_id/err_devlink_free/
- fixed kernel-doc comment of devlink_shd_get()
- removed NULL arg check in devlink_shd_get/put()
---
 include/net/devlink.h |   7 ++
 net/devlink/Makefile  |   2 +-
 net/devlink/sh_dev.c  | 161 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+), 1 deletion(-)
 create mode 100644 net/devlink/sh_dev.c

diff --git a/include/net/devlink.h b/include/net/devlink.h
index 45dec7067a8e..3038af6ec017 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -1647,6 +1647,13 @@ void devlink_register(struct devlink *devlink);
 void devlink_unregister(struct devlink *devlink);
 void devlink_free(struct devlink *devlink);
 
+struct devlink *devlink_shd_get(const char *id,
+				const struct devlink_ops *ops,
+				size_t priv_size,
+				const struct device_driver *driver);
+void devlink_shd_put(struct devlink *devlink);
+void *devlink_shd_get_priv(struct devlink *devlink);
+
 /**
  * struct devlink_port_ops - Port operations
  * @port_split: Callback used to split the port into multiple ones.
diff --git a/net/devlink/Makefile b/net/devlink/Makefile
index 000da622116a..8f2adb5e5836 100644
--- a/net/devlink/Makefile
+++ b/net/devlink/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y := core.o netlink.o netlink_gen.o dev.o port.o sb.o dpipe.o \
-	 resource.o param.o region.o health.o trap.o rate.o linecard.o
+	 resource.o param.o region.o health.o trap.o rate.o linecard.o sh_dev.o
diff --git a/net/devlink/sh_dev.c b/net/devlink/sh_dev.c
new file mode 100644
index 000000000000..85acce97e788
--- /dev/null
+++ b/net/devlink/sh_dev.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved. */
+
+#include <net/devlink.h>
+
+#include "devl_internal.h"
+
+static LIST_HEAD(shd_list);
+static DEFINE_MUTEX(shd_mutex); /* Protects shd_list and shd->list */
+
+/* This structure represents a shared devlink instance,
+ * there is one created per identifier (e.g., serial number).
+ */
+struct devlink_shd {
+	struct list_head list; /* Node in shd list */
+	const char *id; /* Identifier string (e.g., serial number) */
+	refcount_t refcount; /* Reference count */
+	size_t priv_size; /* Size of driver private data */
+	char priv[] __aligned(NETDEV_ALIGN) __counted_by(priv_size);
+};
+
+static struct devlink_shd *devlink_shd_lookup(const char *id)
+{
+	struct devlink_shd *shd;
+
+	list_for_each_entry(shd, &shd_list, list) {
+		if (!strcmp(shd->id, id))
+			return shd;
+	}
+
+	return NULL;
+}
+
+static struct devlink_shd *devlink_shd_create(const char *id,
+					      const struct devlink_ops *ops,
+					      size_t priv_size,
+					      const struct device_driver *driver)
+{
+	struct devlink_shd *shd;
+	struct devlink *devlink;
+
+	devlink = __devlink_alloc(ops, sizeof(struct devlink_shd) + priv_size,
+				  &init_net, NULL, driver);
+	if (!devlink)
+		return NULL;
+	shd = devlink_priv(devlink);
+
+	shd->id = kstrdup(id, GFP_KERNEL);
+	if (!shd->id)
+		goto err_devlink_free;
+	shd->priv_size = priv_size;
+	refcount_set(&shd->refcount, 1);
+
+	devl_lock(devlink);
+	devl_register(devlink);
+	devl_unlock(devlink);
+
+	list_add_tail(&shd->list, &shd_list);
+
+	return shd;
+
+err_devlink_free:
+	devlink_free(devlink);
+	return NULL;
+}
+
+static void devlink_shd_destroy(struct devlink_shd *shd)
+{
+	struct devlink *devlink = priv_to_devlink(shd);
+
+	list_del(&shd->list);
+	devl_lock(devlink);
+	devl_unregister(devlink);
+	devl_unlock(devlink);
+	kfree(shd->id);
+	devlink_free(devlink);
+}
+
+/**
+ * devlink_shd_get - Get or create a shared devlink instance
+ * @id: Identifier string (e.g., serial number) for the shared instance
+ * @ops: Devlink operations structure
+ * @priv_size: Size of private data structure
+ * @driver: Driver associated with the shared devlink instance
+ *
+ * Get an existing shared devlink instance identified by @id, or create
+ * a new one if it doesn't exist. Return the devlink instance with a
+ * reference held. The caller must call devlink_shd_put() when done.
+ *
+ * All callers sharing the same @id must pass identical @ops, @priv_size
+ * and @driver. A mismatch triggers a warning and returns NULL.
+ *
+ * Return: Pointer to the shared devlink instance on success,
+ *         NULL on failure
+ */
+struct devlink *devlink_shd_get(const char *id,
+				const struct devlink_ops *ops,
+				size_t priv_size,
+				const struct device_driver *driver)
+{
+	struct devlink *devlink;
+	struct devlink_shd *shd;
+
+	mutex_lock(&shd_mutex);
+
+	shd = devlink_shd_lookup(id);
+	if (!shd) {
+		shd = devlink_shd_create(id, ops, priv_size, driver);
+		goto unlock;
+	}
+
+	devlink = priv_to_devlink(shd);
+	if (WARN_ON_ONCE(devlink->ops != ops ||
+			 shd->priv_size != priv_size ||
+			 devlink->dev_driver != driver)) {
+		shd = NULL;
+		goto unlock;
+	}
+	refcount_inc(&shd->refcount);
+
+unlock:
+	mutex_unlock(&shd_mutex);
+	return shd ? priv_to_devlink(shd) : NULL;
+}
+EXPORT_SYMBOL_GPL(devlink_shd_get);
+
+/**
+ * devlink_shd_put - Release a reference on a shared devlink instance
+ * @devlink: Shared devlink instance
+ *
+ * Release a reference on a shared devlink instance obtained via
+ * devlink_shd_get().
+ */
+void devlink_shd_put(struct devlink *devlink)
+{
+	struct devlink_shd *shd;
+
+	mutex_lock(&shd_mutex);
+	shd = devlink_priv(devlink);
+	if (refcount_dec_and_test(&shd->refcount))
+		devlink_shd_destroy(shd);
+	mutex_unlock(&shd_mutex);
+}
+EXPORT_SYMBOL_GPL(devlink_shd_put);
+
+/**
+ * devlink_shd_get_priv - Get private data from shared devlink instance
+ * @devlink: Devlink instance
+ *
+ * Returns a pointer to the driver's private data structure within
+ * the shared devlink instance.
+ *
+ * Return: Pointer to private data
+ */
+void *devlink_shd_get_priv(struct devlink *devlink)
+{
+	struct devlink_shd *shd = devlink_priv(devlink);
+
+	return shd->priv;
+}
+EXPORT_SYMBOL_GPL(devlink_shd_get_priv);
-- 
2.51.1

