Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2782F547B
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282052; cv=none; b=Gk4G58Tw5LDmwBPHKztitq+ATw/y4SNPD4+mdOoleS5gQQwsAvE2vXRr3MgUwE1kfuBSqL228V74chdWrtPchW6Ryctqa4ZC9RkspQ/JYZQ1T2sN+NsW3PftDRVszpHaHpkRBCoorPuadGPdAbnAhTLzqCYutaqq9lEhb9z+UDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282052; c=relaxed/simple;
	bh=LCBnkF05BFy67Dj3X9soES2dtoYMqCQz73KyCOTgCrI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYMbcEUDTxht/74l5oqr5TJMIJzrw5NWaQp8MnvI+BxMHbpw+kwanUQBI4GhpCQUqJyRlKX8am0tS0BgjhKnOrXVSWYn/LUKqUme05sapP5dvkInxxEnFHJXDxOIKpNdLNg7gBDWFqwqRozZkLnQobryF3TWbIUI7gasHy58GCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=m5DGXr6N; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="m5DGXr6N"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-71840959355so20127b3.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753282039; x=1753886839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZSlqdnTxC2Wjx/Crjm0HF+UsFjTh+cAEzYLoPE8XGM=;
        b=m5DGXr6NYcGJEPB8rHEQgqA6Y5Ra6mUukhEcpFFyitFA+tLEZTL1vdctEV+52kMkVH
         fEYYUy1oiXeNVzQ87kzqWalZjOHkz5L5z8nppWYslCHk55sJt/aN2eINKVj/RAZCmUSz
         Mi8BCY73XOjynagXHoOfsLIcU5v6q2Kug+z2On6EwpUq2JXwzt5VKKqd2p032Gpcis6D
         6IygIaBo9ol60CxU5f1aE+oAzDjbTeH12+1Lpg7FxdzQKcWh0khh9XRZpEVZruWqrHHu
         ZNYNMX9FDzcsbMLVrH8HZSegt7jOAebzNe1fakq2uexh94lBUYfymaQ5G38N/Rx5BjLu
         cSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282039; x=1753886839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZSlqdnTxC2Wjx/Crjm0HF+UsFjTh+cAEzYLoPE8XGM=;
        b=H1CU6Pgy4Xth/AJQCl9DlfJNoc7zeumIH9OQVlfyTPbGniR52Ddlk18sw+m4VG0g1V
         i7/ZCqdWpDn+5hK0TZTy5rWdJuc3F/kkEvER37+4gqZIbvHZIyAvUkP/YAmb7+wykLew
         EIn6jDoJrSrlLPQk5KU2l+CPGDIietWgVKnio7CNirdlkyTJInwURkXIVqeBnfnRqJul
         2CaUT2BH2WmquDo+AuJw65kE9RSddHVsJqogU45jBE6QgJZyMl2eaI//L6aiIg9KtkpL
         Bx65+ccotCb/5SuIkKmJJDy7Y/6WloMF3rP5vohH1iXRAnFfvjdSDaFtTuxFiwkGgzmj
         w+YA==
X-Forwarded-Encrypted: i=1; AJvYcCUQl8nRFUTlpHPjHk3vCV3U1tH8BP/1hIggOe1wbeq6cqF08aL/JP9/9NQYkgMrO7sGDAFoxYg4AMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwThUHqG6MCM1xjl6YHBfrkozOMnslBHsVT6oC5yxBjg6z1bvDh
	y7z63CKJgL0t+MW2PSin1Gl352rEesKegWoxFn3rV9B1NlgQl74gyExuM/gIOsUp7ZU=
X-Gm-Gg: ASbGncuFg2QNamWLWe9tqQkYmdlfyX5wiQ/YMTyi1UVtkCHH42UbPWLTY7g7nnwxsEp
	zPT4Vilj9uVRYKPDejj//XcdcDQmsPaupZrG7DGyrvz84YT36TfD5kBAd18HpqJJDbMPxU+yTX+
	CxUNYmTLmfD4KKwzd2PMHpbb/RVgKUJaYdX8YE6t9iWmswoWaw+7HPrXQVMHAbu37a2zDEw4DHI
	AYg8mTdJ/kNjAPoGB1VdFmEUENbe/h9KSTBQEZ7E6ph2PStqYErUaNM5IYn836bk+Zheg/Eafgn
	yKOyH34DNIrmYdJI+OjsglFSdfMbtNgKdVwLTz0HoBA7FgQCJrbC8kHdqMERlOJqzSKLU3FK9EF
	xj1z4d5wGPo30tdjj9I0yJp3CphQ48ifvMq3IVCGAyx3Phe89eIpDB7+FEuFza8KcmYp2PC0f9H
	8U/6UsXAXUBh33AQ==
X-Google-Smtp-Source: AGHT+IFN9e7mm9DK4PFQKKKYO6Lt9oj1mK23kThGYjIcIMOCvVxNcrxRaUhkgKiI35z2KgooHTIX8A==
X-Received: by 2002:a05:690c:4d87:b0:719:a0ff:1bd1 with SMTP id 00721157ae682-719b4b2610cmr39176557b3.3.1753282038557;
        Wed, 23 Jul 2025 07:47:18 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e4fsm30482117b3.72.2025.07.23.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:47:18 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com
Subject: [PATCH v2 12/32] liveupdate: luo_subsystems: add subsystem registration
Date: Wed, 23 Jul 2025 14:46:25 +0000
Message-ID: <20250723144649.1696299-13-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the framework for kernel subsystems (e.g., KVM, IOMMU, device
drivers) to register with LUO and participate in the live update process
via callbacks.

Subsystem Registration:
- Defines struct liveupdate_subsystem in linux/liveupdate.h,
  which subsystems use to provide their name and optional callbacks
  (prepare, freeze, cancel, finish). The callbacks accept
  a u64 *data intended for passing state/handles.
- Exports liveupdate_register_subsystem() and
  liveupdate_unregister_subsystem() API functions.
- Adds drivers/misc/liveupdate/luo_subsystems.c to manage a list
  of registered subsystems.
  Registration/unregistration is restricted to
  specific LUO states (NORMAL/UPDATED).

Callback Framework:
- The main luo_core.c state transition functions
  now delegate to new luo_do_subsystems_*_calls() functions
  defined in luo_subsystems.c.
- These new functions are intended to iterate through the registered
  subsystems and invoke their corresponding callbacks.

FDT Integration:
- Adds a /subsystems subnode within the main LUO FDT created in
  luo_core.c. This node has its own compatibility string
  (subsystems-v1).
- luo_subsystems_fdt_setup() populates this node by adding a
  property for each registered subsystem, using the subsystem's
  name.
  Currently, these properties are initialized with a placeholder
  u64 value (0).
- luo_subsystems_startup() is called from luo_core.c on boot to
  find and validate the /subsystems node in the FDT received via
  KHO. It panics if the node is missing or incompatible.
- Adds a stub API function liveupdate_get_subsystem_data() intended
  for subsystems to retrieve their persisted u64 data from the FDT
      in the new kernel.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate.h         |  61 +++++++
 kernel/liveupdate/Makefile         |   1 +
 kernel/liveupdate/luo_core.c       |  19 +-
 kernel/liveupdate/luo_internal.h   |   7 +
 kernel/liveupdate/luo_subsystems.c | 284 +++++++++++++++++++++++++++++
 5 files changed, 370 insertions(+), 2 deletions(-)
 create mode 100644 kernel/liveupdate/luo_subsystems.c

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index da8f05c81e51..fed68b9ab32b 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -88,6 +88,47 @@ enum liveupdate_state  {
 	LIVEUPDATE_STATE_UPDATED = 4,
 };
 
+/**
+ * struct liveupdate_subsystem_ops - LUO events callback functions
+ * @prepare:      Optional. Called during LUO prepare phase. Should perform
+ *                preparatory actions and can store a u64 handle/state
+ *                via the 'data' pointer for use in later callbacks.
+ *                Return 0 on success, negative error code on failure.
+ * @freeze:       Optional. Called during LUO freeze event (before actual jump
+ *                to new kernel). Should perform final state saving actions and
+ *                can update the u64 handle/state via the 'data' pointer. Retur:
+ *                0 on success, negative error code on failure.
+ * @cancel:       Optional. Called if the live update process is canceled after
+ *                prepare (or freeze) was called. Receives the u64 data
+ *                set by prepare/freeze. Used for cleanup.
+ * @finish:       Optional. Called after the live update is finished in the new
+ *                kernel.
+ *                Receives the u64 data set by prepare/freeze. Used for cleanup.
+ */
+struct liveupdate_subsystem_ops {
+	int (*prepare)(void *arg, u64 *data);
+	int (*freeze)(void *arg, u64 *data);
+	void (*cancel)(void *arg, u64 data);
+	void (*finish)(void *arg, u64 data);
+};
+
+/**
+ * struct liveupdate_subsystem - Represents a subsystem participating in LUO
+ * @ops:          Callback functions
+ * @name:         Unique name identifying the subsystem.
+ * @arg:          Add this argument to callback functions.
+ * @list:         List head used internally by LUO. Should not be modified by
+ *                caller after registration.
+ * @private_data: For LUO internal use, cached value of data field.
+ */
+struct liveupdate_subsystem {
+	const struct liveupdate_subsystem_ops *ops;
+	const char *name;
+	void *arg;
+	struct list_head list;
+	u64 private_data;
+};
+
 #ifdef CONFIG_LIVEUPDATE
 
 /* Return true if live update orchestrator is enabled */
@@ -109,6 +150,10 @@ bool liveupdate_state_normal(void);
 
 enum liveupdate_state liveupdate_get_state(void);
 
+int liveupdate_register_subsystem(struct liveupdate_subsystem *h);
+int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h);
+int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 *data);
+
 #else /* CONFIG_LIVEUPDATE */
 
 static inline int liveupdate_reboot(void)
@@ -136,5 +181,21 @@ static inline enum liveupdate_state liveupdate_get_state(void)
 	return LIVEUPDATE_STATE_NORMAL;
 }
 
+static inline int liveupdate_register_subsystem(struct liveupdate_subsystem *h)
+{
+	return 0;
+}
+
+static inline int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h)
+{
+	return 0;
+}
+
+static inline int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h,
+						u64 *data)
+{
+	return -ENODATA;
+}
+
 #endif /* CONFIG_LIVEUPDATE */
 #endif /* _LINUX_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index b3c72c405780..999208a1fdbb 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -6,3 +6,4 @@
 obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
 obj-$(CONFIG_KEXEC_HANDOVER_DEBUG)	+= kexec_handover_debug.o
 obj-$(CONFIG_LIVEUPDATE)		+= luo_core.o
+obj-$(CONFIG_LIVEUPDATE)		+= luo_subsystems.o
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index c80a1f188359..fff84c51d986 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -130,6 +130,10 @@ static int luo_fdt_setup(void)
 	if (ret)
 		goto exit_free;
 
+	ret = luo_subsystems_fdt_setup(fdt_out);
+	if (ret)
+		goto exit_free;
+
 	ret = kho_preserve_phys(__pa(fdt_out), LUO_FDT_SIZE);
 	if (ret)
 		goto exit_free;
@@ -160,20 +164,30 @@ static void luo_fdt_destroy(void)
 
 static int luo_do_prepare_calls(void)
 {
-	return 0;
+	int ret;
+
+	ret = luo_do_subsystems_prepare_calls();
+
+	return ret;
 }
 
 static int luo_do_freeze_calls(void)
 {
-	return 0;
+	int ret;
+
+	ret = luo_do_subsystems_freeze_calls();
+
+	return ret;
 }
 
 static void luo_do_finish_calls(void)
 {
+	luo_do_subsystems_finish_calls();
 }
 
 static void luo_do_cancel_calls(void)
 {
+	luo_do_subsystems_cancel_calls();
 }
 
 static int __luo_prepare(void)
@@ -419,6 +433,7 @@ static int __init luo_startup(void)
 	}
 
 	__luo_set_state(LIVEUPDATE_STATE_UPDATED);
+	luo_subsystems_startup(luo_fdt_in);
 
 	return 0;
 }
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 3d10f3eb20a7..98bf799adb61 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -18,4 +18,11 @@ void luo_state_read_exit(void);
 
 const char *luo_current_state_str(void);
 
+void luo_subsystems_startup(void *fdt);
+int luo_subsystems_fdt_setup(void *fdt);
+int luo_do_subsystems_prepare_calls(void);
+int luo_do_subsystems_freeze_calls(void);
+void luo_do_subsystems_finish_calls(void);
+void luo_do_subsystems_cancel_calls(void);
+
 #endif /* _LINUX_LUO_INTERNAL_H */
diff --git a/kernel/liveupdate/luo_subsystems.c b/kernel/liveupdate/luo_subsystems.c
new file mode 100644
index 000000000000..436929a17de0
--- /dev/null
+++ b/kernel/liveupdate/luo_subsystems.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: LUO Subsystems support
+ *
+ * Various kernel subsystems register with the Live Update Orchestrator to
+ * participate in the live update process. These subsystems are notified at
+ * different stages of the live update sequence, allowing them to serialize
+ * device state before the reboot and restore it afterwards. Examples include
+ * the device layer, interrupt controllers, KVM, IOMMU, and specific device
+ * drivers.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/err.h>
+#include <linux/libfdt.h>
+#include <linux/liveupdate.h>
+#include <linux/mutex.h>
+#include <linux/string.h>
+#include "luo_internal.h"
+
+#define LUO_SUBSYSTEMS_NODE_NAME	"subsystems"
+#define LUO_SUBSYSTEMS_COMPATIBLE	"subsystems-v1"
+
+static DEFINE_MUTEX(luo_subsystem_list_mutex);
+static LIST_HEAD(luo_subsystems_list);
+static void *luo_fdt_out;
+static void *luo_fdt_in;
+
+/**
+ * luo_subsystems_fdt_setup - Adds and populates the 'subsystems' node in the
+ * FDT.
+ * @fdt: Pointer to the LUO FDT blob.
+ *
+ * Add subsystems node and each subsystem to the LUO FDT blob.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int luo_subsystems_fdt_setup(void *fdt)
+{
+	struct liveupdate_subsystem *subsystem;
+	const u64 zero_data = 0;
+	int ret, node_offset;
+
+	ret = fdt_add_subnode(fdt, 0, LUO_SUBSYSTEMS_NODE_NAME);
+	if (ret < 0)
+		goto exit_error;
+
+	node_offset = ret;
+	ret = fdt_setprop_string(fdt, node_offset, "compatible",
+				 LUO_SUBSYSTEMS_COMPATIBLE);
+	if (ret < 0)
+		goto exit_error;
+
+	list_for_each_entry(subsystem, &luo_subsystems_list, list) {
+		ret = fdt_setprop(fdt, node_offset, subsystem->name,
+				  &zero_data, sizeof(zero_data));
+		if (ret < 0)
+			goto exit_error;
+	}
+
+	luo_fdt_out = fdt;
+	return 0;
+exit_error:
+	pr_err("Failed to setup 'subsystems' node to FDT: %s\n",
+	       fdt_strerror(ret));
+	return -ENOSPC;
+}
+
+/**
+ * luo_subsystems_startup - Validates the LUO subsystems FDT node at startup.
+ * @fdt: Pointer to the LUO FDT blob passed from the previous kernel.
+ *
+ * This __init function checks the existence and validity of the '/subsystems'
+ * node in the FDT. This node is considered mandatory. It calls panic() if
+ * the node is missing, inaccessible, or invalid (e.g., missing compatible,
+ * wrong compatible string), indicating a critical configuration error for LUO.
+ */
+void __init luo_subsystems_startup(void *fdt)
+{
+	int ret, node_offset;
+
+	node_offset = fdt_subnode_offset(fdt, 0, LUO_SUBSYSTEMS_NODE_NAME);
+	if (node_offset < 0)
+		panic("Failed to find /subsystems node\n");
+
+	ret = fdt_node_check_compatible(fdt, node_offset,
+					LUO_SUBSYSTEMS_COMPATIBLE);
+	if (ret) {
+		panic("FDT '%s' is incompatible with '%s' [%d]\n",
+		      LUO_SUBSYSTEMS_NODE_NAME, LUO_SUBSYSTEMS_COMPATIBLE, ret);
+	}
+	luo_fdt_in = fdt;
+}
+
+/**
+ * luo_do_subsystems_prepare_calls - Calls prepare callbacks and updates FDT
+ * if all prepares succeed. Handles cancellation on failure.
+ *
+ * Phase 1: Calls 'prepare' for all subsystems and stores results temporarily.
+ * If any 'prepare' fails, calls 'cancel' on previously prepared subsystems
+ * and returns the error.
+ * Phase 2: If all 'prepare' calls succeeded, writes the stored data to the FDT.
+ * If any FDT write fails, calls 'cancel' on *all* prepared subsystems and
+ * returns the FDT error.
+ *
+ * Returns: 0 on success. Negative errno on failure.
+ */
+int luo_do_subsystems_prepare_calls(void)
+{
+	return 0;
+}
+
+/**
+ * luo_do_subsystems_freeze_calls - Calls freeze callbacks and updates FDT
+ * if all freezes succeed. Handles cancellation on failure.
+ *
+ * Phase 1: Calls 'freeze' for all subsystems and stores results temporarily.
+ * If any 'freeze' fails, calls 'cancel' on previously called subsystems
+ * and returns the error.
+ * Phase 2: If all 'freeze' calls succeeded, writes the stored data to the FDT.
+ * If any FDT write fails, calls 'cancel' on *all* subsystems and
+ * returns the FDT error.
+ *
+ * Returns: 0 on success. Negative errno on failure.
+ */
+int luo_do_subsystems_freeze_calls(void)
+{
+	return 0;
+}
+
+/**
+ * luo_do_subsystems_finish_calls- Calls finish callbacks for all subsystems.
+ *
+ * This function is called at the end of live update cycle to do the final
+ * clean-up or housekeeping of the post-live update states.
+ */
+void luo_do_subsystems_finish_calls(void)
+{
+}
+
+/**
+ * luo_do_subsystems_cancel_calls - Calls cancel callbacks for all subsystems.
+ *
+ * This function is typically called when the live update process needs to be
+ * aborted externally, for example, after the prepare phase may have run but
+ * before actual reboot. It iterates through all registered subsystems and calls
+ * the 'cancel' callback for those that implement it and likely completed
+ * prepare.
+ */
+void luo_do_subsystems_cancel_calls(void)
+{
+}
+
+/**
+ * liveupdate_register_subsystem - Register a kernel subsystem handler with LUO
+ * @h: Pointer to the liveupdate_subsystem structure allocated and populated
+ * by the calling subsystem.
+ *
+ * Registers a subsystem handler that provides callbacks for different events
+ * of the live update cycle. Registration is typically done during the
+ * subsystem's module init or core initialization.
+ *
+ * Can only be called when LUO is in the NORMAL or UPDATED states.
+ * The provided name (@h->name) must be unique among registered subsystems.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int liveupdate_register_subsystem(struct liveupdate_subsystem *h)
+{
+	struct liveupdate_subsystem *iter;
+	int ret = 0;
+
+	luo_state_read_enter();
+	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
+		luo_state_read_exit();
+		return -EBUSY;
+	}
+
+	mutex_lock(&luo_subsystem_list_mutex);
+	list_for_each_entry(iter, &luo_subsystems_list, list) {
+		if (iter == h) {
+			pr_warn("Subsystem '%s' (%p) already registered.\n",
+				h->name, h);
+			ret = -EEXIST;
+			goto out_unlock;
+		}
+
+		if (!strcmp(iter->name, h->name)) {
+			pr_err("Subsystem with name '%s' already registered.\n",
+			       h->name);
+			ret = -EEXIST;
+			goto out_unlock;
+		}
+	}
+
+	INIT_LIST_HEAD(&h->list);
+	list_add_tail(&h->list, &luo_subsystems_list);
+
+out_unlock:
+	mutex_unlock(&luo_subsystem_list_mutex);
+	luo_state_read_exit();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(liveupdate_register_subsystem);
+
+/**
+ * liveupdate_unregister_subsystem - Unregister a kernel subsystem handler from
+ * LUO
+ * @h: Pointer to the same liveupdate_subsystem structure that was used during
+ * registration.
+ *
+ * Unregisters a previously registered subsystem handler. Typically called
+ * during module exit or subsystem teardown. LUO removes the structure from its
+ * internal list; the caller is responsible for any necessary memory cleanup
+ * of the structure itself.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ * -EINVAL if h is NULL.
+ * -ENOENT if the specified handler @h is not found in the registration list.
+ * -EBUSY if LUO is not in the NORMAL state.
+ */
+int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h)
+{
+	struct liveupdate_subsystem *iter;
+	bool found = false;
+	int ret = 0;
+
+	luo_state_read_enter();
+	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
+		luo_state_read_exit();
+		return -EBUSY;
+	}
+
+	mutex_lock(&luo_subsystem_list_mutex);
+	list_for_each_entry(iter, &luo_subsystems_list, list) {
+		if (iter == h) {
+			found = true;
+			break;
+		}
+	}
+
+	if (found) {
+		list_del_init(&h->list);
+	} else {
+		pr_warn("Subsystem handler '%s' not found for unregistration.\n",
+			h->name);
+		ret = -ENOENT;
+	}
+
+	mutex_unlock(&luo_subsystem_list_mutex);
+	luo_state_read_exit();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(liveupdate_unregister_subsystem);
+
+/**
+ * liveupdate_get_subsystem_data - Retrieve raw private data for a subsystem
+ * from FDT.
+ * @h:      Pointer to the liveupdate_subsystem structure representing the
+ * subsystem instance. The 'name' field is used to find the property.
+ * @data:   Output pointer where the subsystem's raw private u64 data will be
+ * stored via memcpy.
+ *
+ * Reads the 8-byte data property associated with the subsystem @h->name
+ * directly from the '/subsystems' node within the globally accessible
+ * 'luo_fdt_in' blob. Returns appropriate error codes if inputs are invalid, or
+ * nodes/properties are missing or invalid.
+ *
+ * Return:  0 on success. -ENOENT on error.
+ */
+int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 *data)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(liveupdate_get_subsystem_data);
-- 
2.50.0.727.gbf7dc18ff4-goog

