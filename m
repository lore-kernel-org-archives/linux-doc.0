Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882F35CBCD
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073486; cv=none; b=OUv6hxMVHyebidN4zwQ5i5fGKZbonekIC35Vj9jc/gUN7e9Cbc+58YnwP5xXloCnGqGZWzrbde7s5Lgy9Lqfa1UjzxiwYzvpYIczsAM44mPldeuODso/3O9u4+8IbzVRjB+faZedEjLhGEawig4reUnfKHMtMu4uXHF2S5NTmqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073486; c=relaxed/simple;
	bh=1tFP7QsY2MC4C4GdSqy/Nat814BT+iIWefINH1K27Oo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogqJ4qjXsNWR7QHYH965/ZRT3f7sOF1HeYwGvQcI6S9c+DINzL0q3fhUeBASVd9Sss9CxLf8wxp4H4vKnGcJg1jvWxv7H4ElU19dZwbJqTX+nZjnaMEpFkV7toqBrXPkTF06HNIooQKzBTJui4h1DfMOHPenoOuqsB6h/uTZakA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=K2yy7OMv; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="K2yy7OMv"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64669a2ecb5so75205d50.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 07:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766073482; x=1766678282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pJJyo0wA5wZF/guy+NzrWw0sp1iH9coS+hQxgtQaQA=;
        b=K2yy7OMv8OyJHN4/eJdMJEZwgNXZwtj2YZIgePfYYkXqUli8Paq8gWe7tonRF63Spx
         lsedbRCJI2mbYkJ9l4VlODlQFpsLjD2xk9R1pryvLnsXbAjkqoc04wudwHly9a5rrAfG
         P0S2jozi+V4H5viqQPdX0v7nWbByF3lT7erN3ismc3nD0RqTTSHggNJdc96K5wCoMNDK
         HtTrNrSL6WlSgBHQaqwLKIHYE9tAdDZp6lee8XJWwRjFzAdmLsTmDQ7kZphpJPMk14Wv
         QaUhmkwYF6uL0FKIn4gQ6+aPVjNaFusnZIIWx4mJcSzVRjVg7ZjRacuDhDLa59/UI72/
         fOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766073482; x=1766678282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/pJJyo0wA5wZF/guy+NzrWw0sp1iH9coS+hQxgtQaQA=;
        b=gUaIPh/g8KS2cSh4B8PYABLLsU7+91gR4sybuv/J4b3uMkc+ysRGhBz52lGcvk/Sd9
         rbaAhMiO2PTFP5tZt2DMyDPaj5fJfh57YBTX5sf2/Fk1QaHkGXtzHew7LN4r7ABcWL0x
         BXbKxC9Ffrxw0068+kB9NK1Jssy1NmHWu1SGHi/N05CSiipdrvvTyxIccjPS6PM2k4Cm
         ndCnzNHPfkTwIenANulnFfQ9Qur1CRS0/qVgKGh5nv97ZE3K4zewS6i+q0epjb5hs7bj
         c/BkuvQOkLhe3hp3FrcL1VmH7jXB4+dz35pI03aEZGUe5xi+wxNWWr/xOaEJuFYa4yqJ
         nAgg==
X-Forwarded-Encrypted: i=1; AJvYcCUKDTEVxlx61mmWDUZ+KUCAqUwXYKG84huSHEdJr4EX7rWmHSQmHnurc59kZiPmaNgGpzaEPADvHuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOqypIJNc3sKzeP9Irh5pweafyI4XHnng9tV3hurlaHgr6uu/K
	z6i0d99bmo55/QBWSSVL0Ix5S0iDlVL0UZvU0IZwIhFd1BrWUJtKdZqLaeAQ7ikJByc=
X-Gm-Gg: AY/fxX6jld7xnOcdcfV6rhiyiPYct9kFwvQMZBVhJU70XwaeZV2OiZeIYhZMD1jhigY
	Ig6bA/+63i6Jupv/ve69FRE+UFXUJ6MGIzsR8IBOZi2kVjpbYTN8+Je1PPrt5KMwKQfPC7LJAqr
	4ZijmR79Kjsg7Seben7L2lutFD1yQcUTSuUlEFxAkWgd2u+lUYOPergHWmVehBM8g6oR/xpAA23
	bFUc1pDj2aeDDDNngzX9CXs+e+NYjwxEGQJgff5DSEuvbpsFGPr/Aly8D3Y6toDI2wt5WB3PMKB
	bcR14Bbsp2XLwFk/nonEcXgoWo9BePT7kp3gi+fQbRiYos0K+mzw79ajrSYN2ukCSVQkQf5tuWa
	1MBSfhLroI5zFNWnAZU20HtP7Bnwkck957ede0P2HmpBi64PU7Rwbv4AzkMqNJw8YNefJkOo49Q
	toAJMY0MoUZIYqBLRgYOYDtHJva5xLSWV5FPFThEjQGGkuHVm/nIJ7ffAAjhwOe3l8Lk6Bz657n
	NdSvvNal3B75V/ijXb06qfMzLqX22LB3znXMbzN1rvkcRML
X-Google-Smtp-Source: AGHT+IHumdS6sqTnJBVT5niyHe9Vg9uRdqw0fbEdNru2/HR/sCqE+7Blbu8+OGLsDlJnarrwm57AXQ==
X-Received: by 2002:a05:690e:1187:b0:646:44ef:cede with SMTP id 956f58d0204a3-64669dd8b9fmr52269d50.39.1766073481629;
        Thu, 18 Dec 2025 07:58:01 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fa6f52bb2sm9348467b3.16.2025.12.18.07.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:58:01 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	skhawaja@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	kees@kernel.org,
	davidgow@google.com,
	pmladek@suse.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nicolas.frattaroli@collabora.com,
	linux-doc@vger.kernel.org,
	tamird@gmail.com,
	raemoar63@gmail.com,
	graf@amazon.com
Subject: [PATCH v9 4/5] liveupdate: luo_flb: Introduce File-Lifecycle-Bound global state
Date: Thu, 18 Dec 2025 10:57:51 -0500
Message-ID: <20251218155752.3045808-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.313.g674ac2bdf7-goog
In-Reply-To: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a mechanism for managing global kernel state whose lifecycle
is tied to the preservation of one or more files. This is necessary for
subsystems where multiple preserved file descriptors depend on a single,
shared underlying resource.

An example is HugeTLB, where multiple file descriptors such as memfd and
guest_memfd may rely on the state of a single HugeTLB subsystem.
Preserving this state for each individual file would be redundant and
incorrect. The state should be preserved only once when the first file
is preserved, and restored/finished only once the last file is handled.

This patch introduces File-Lifecycle-Bound (FLB) objects to solve this
problem. An FLB is a global, reference-counted object with a defined set
of operations:

- A file handler (struct liveupdate_file_handler) declares a dependency
  on one or more FLBs via a new registration function,
  liveupdate_register_flb().
- When the first file depending on an FLB is preserved, the FLB's
  .preserve() callback is invoked to save the shared global state. The
  reference count is then incremented for each subsequent file.
- Conversely, when the last file is unpreserved (before reboot) or
  finished (after reboot), the FLB's .unpreserve() or .finish() callback
  is invoked to clean up the global resource.

The implementation includes:

- A new set of ABI definitions (luo_flb_ser, luo_flb_head_ser) and a
  corresponding FDT node (luo-flb) to serialize the state of all active
  FLBs and pass them via Kexec Handover.
- Core logic in luo_flb.c to manage FLB registration, reference
  counting, and the invocation of lifecycle callbacks.
- An API (liveupdate_flb_get/_incoming/_outgoing) for other kernel
  subsystems to safely access the live object managed by an FLB, both
  before and after the live update.

This framework provides the necessary infrastructure for more complex
subsystems like IOMMU, VFIO, and KVM to integrate with the Live Update
Orchestrator.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/liveupdate.rst |  11 +
 include/linux/kho/abi/luo.h           |  76 +++
 include/linux/liveupdate.h            | 147 ++++++
 kernel/liveupdate/Makefile            |   1 +
 kernel/liveupdate/luo_core.c          |   7 +-
 kernel/liveupdate/luo_file.c          |  24 +-
 kernel/liveupdate/luo_flb.c           | 654 ++++++++++++++++++++++++++
 kernel/liveupdate/luo_internal.h      |   7 +
 8 files changed, 924 insertions(+), 3 deletions(-)
 create mode 100644 kernel/liveupdate/luo_flb.c

diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index 7960eb15a81f..03b0212aaf41 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -18,6 +18,11 @@ LUO Preserving File Descriptors
 .. kernel-doc:: kernel/liveupdate/luo_file.c
    :doc: LUO File Descriptors
 
+LUO File Lifecycle Bound Global Data
+====================================
+.. kernel-doc:: kernel/liveupdate/luo_flb.c
+   :doc: LUO File Lifecycle Bound Global Data
+
 Live Update Orchestrator ABI
 ============================
 .. kernel-doc:: include/linux/kho/abi/luo.h
@@ -40,6 +45,9 @@ Public API
 .. kernel-doc:: kernel/liveupdate/luo_core.c
    :export:
 
+.. kernel-doc:: kernel/liveupdate/luo_flb.c
+   :export:
+
 .. kernel-doc:: kernel/liveupdate/luo_file.c
    :export:
 
@@ -48,6 +56,9 @@ Internal API
 .. kernel-doc:: kernel/liveupdate/luo_core.c
    :internal:
 
+.. kernel-doc:: kernel/liveupdate/luo_flb.c
+   :internal:
+
 .. kernel-doc:: kernel/liveupdate/luo_session.c
    :internal:
 
diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index bb099c92e469..2734d1020dda 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -37,6 +37,11 @@
  *             compatible = "luo-session-v1";
  *             luo-session-header = <phys_addr_of_session_header_ser>;
  *         };
+ *
+ *         luo-flb {
+ *             compatible = "luo-flb-v1";
+ *             luo-flb-header = <phys_addr_of_flb_header_ser>;
+ *         };
  *     };
  *
  * Main LUO Node (/):
@@ -56,6 +61,17 @@
  *     is the header for a contiguous block of memory containing an array of
  *     `struct luo_session_ser`, one for each preserved session.
  *
+ * File-Lifecycle-Bound Node (luo-flb):
+ *   This node describes all preserved global objects whose lifecycle is bound
+ *   to that of the preserved files (e.g., shared IOMMU state).
+ *
+ *   - compatible: "luo-flb-v1"
+ *     Identifies the FLB ABI version.
+ *   - luo-flb-header: u64
+ *     The physical address of a `struct luo_flb_header_ser`. This structure is
+ *     the header for a contiguous block of memory containing an array of
+ *     `struct luo_flb_ser`, one for each preserved global object.
+ *
  * Serialization Structures:
  *   The FDT properties point to memory regions containing arrays of simple,
  *   `__packed` structures. These structures contain the actual preserved state.
@@ -74,6 +90,16 @@
  *     Metadata for a single preserved file. Contains the `compatible` string to
  *     find the correct handler in the new kernel, a user-provided `token` for
  *     identification, and an opaque `data` handle for the handler to use.
+ *
+ *   - struct luo_flb_header_ser:
+ *     Header for the FLB array. Contains the total page count of the
+ *     preserved memory block and the number of `struct luo_flb_ser` entries
+ *     that follow.
+ *
+ *   - struct luo_flb_ser:
+ *     Metadata for a single preserved global object. Contains its `name`
+ *     (compatible string), an opaque `data` handle, and the `count`
+ *     number of files depending on it.
  */
 
 #ifndef _LINUX_KHO_ABI_LUO_H
@@ -163,4 +189,54 @@ struct luo_session_ser {
 	struct luo_file_set_ser file_set_ser;
 } __packed;
 
+/* The max size is set so it can be reliably used during in serialization */
+#define LIVEUPDATE_FLB_COMPAT_LENGTH	48
+
+#define LUO_FDT_FLB_NODE_NAME	"luo-flb"
+#define LUO_FDT_FLB_COMPATIBLE	"luo-flb-v1"
+#define LUO_FDT_FLB_HEADER	"luo-flb-header"
+
+/**
+ * struct luo_flb_header_ser - Header for the serialized FLB data block.
+ * @pgcnt: The total number of pages occupied by the entire preserved memory
+ *         region, including this header and the subsequent array of
+ *         &struct luo_flb_ser entries.
+ * @count: The number of &struct luo_flb_ser entries that follow this header
+ *         in the memory block.
+ *
+ * This structure is located at the physical address specified by the
+ * `LUO_FDT_FLB_HEADER` FDT property. It provides the new kernel with the
+ * necessary information to find and iterate over the array of preserved
+ * File-Lifecycle-Bound objects and to manage the underlying memory.
+ *
+ * If this structure is modified, LUO_FDT_FLB_COMPATIBLE must be updated.
+ */
+struct luo_flb_header_ser {
+	u64 pgcnt;
+	u64 count;
+} __packed;
+
+/**
+ * struct luo_flb_ser - Represents the serialized state of a single FLB object.
+ * @name:    The unique compatibility string of the FLB object, used to find the
+ *           corresponding &struct liveupdate_flb handler in the new kernel.
+ * @data:    The opaque u64 handle returned by the FLB's .preserve() operation
+ *           in the old kernel. This handle encapsulates the entire state needed
+ *           for restoration.
+ * @count:   The reference count at the time of serialization; i.e., the number
+ *           of preserved files that depended on this FLB. This is used by the
+ *           new kernel to correctly manage the FLB's lifecycle.
+ *
+ * An array of these structures is created in a preserved memory region and
+ * passed to the new kernel. Each entry allows the LUO core to restore one
+ * global, shared object.
+ *
+ * If this structure is modified, LUO_FDT_FLB_COMPATIBLE must be updated.
+ */
+struct luo_flb_ser {
+	char name[LIVEUPDATE_FLB_COMPAT_LENGTH];
+	u64 data;
+	u64 count;
+} __packed;
+
 #endif /* _LINUX_KHO_ABI_LUO_H */
diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index a7f6ee5b6771..fe82a6c3005f 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -11,10 +11,13 @@
 #include <linux/compiler.h>
 #include <linux/kho/abi/luo.h>
 #include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <uapi/linux/liveupdate.h>
 
 struct liveupdate_file_handler;
+struct liveupdate_flb;
+struct liveupdate_session;
 struct file;
 
 /**
@@ -99,6 +102,118 @@ struct liveupdate_file_handler {
 	 * registered file handlers.
 	 */
 	struct list_head __private list;
+	/* A list of FLB dependencies. */
+	struct list_head __private flb_list;
+};
+
+/**
+ * struct liveupdate_flb_op_args - Arguments for FLB operation callbacks.
+ * @flb:       The global FLB instance for which this call is performed.
+ * @data:      For .preserve():    [OUT] The callback sets this field.
+ *             For .unpreserve():  [IN]  The handle from .preserve().
+ *             For .retrieve():    [IN]  The handle from .preserve().
+ * @obj:       For .preserve():    [OUT] Sets this to the live object.
+ *             For .retrieve():    [OUT] Sets this to the live object.
+ *             For .finish():      [IN]  The live object from .retrieve().
+ *
+ * This structure bundles all parameters for the FLB operation callbacks.
+ */
+struct liveupdate_flb_op_args {
+	struct liveupdate_flb *flb;
+	u64 data;
+	void *obj;
+};
+
+/**
+ * struct liveupdate_flb_ops - Callbacks for global File-Lifecycle-Bound data.
+ * @preserve:        Called when the first file using this FLB is preserved.
+ *                   The callback must save its state and return a single,
+ *                   self-contained u64 handle by setting the 'argp->data'
+ *                   field and 'argp->obj'.
+ * @unpreserve:      Called when the last file using this FLB is unpreserved
+ *                   (aborted before reboot). Receives the handle via
+ *                   'argp->data' and live object via 'argp->obj'.
+ * @retrieve:        Called on-demand in the new kernel, the first time a
+ *                   component requests access to the shared object. It receives
+ *                   the preserved handle via 'argp->data' and must reconstruct
+ *                   the live object, returning it by setting the 'argp->obj'
+ *                   field.
+ * @finish:          Called in the new kernel when the last file using this FLB
+ *                   is finished. Receives the live object via 'argp->obj' for
+ *                   cleanup.
+ * @owner:           Module reference
+ *
+ * Operations that manage global shared data with file bound lifecycle,
+ * triggered by the first file that uses it and concluded by the last file that
+ * uses it, across all sessions.
+ */
+struct liveupdate_flb_ops {
+	int (*preserve)(struct liveupdate_flb_op_args *argp);
+	void (*unpreserve)(struct liveupdate_flb_op_args *argp);
+	int (*retrieve)(struct liveupdate_flb_op_args *argp);
+	void (*finish)(struct liveupdate_flb_op_args *argp);
+	struct module *owner;
+};
+
+/*
+ * struct luo_flb_private_state - Private FLB state structures.
+ * @count:     The number of preserved files currently depending on this FLB.
+ *             This is used to trigger the preserve/unpreserve/finish ops on the
+ *             first/last file.
+ * @data:      The opaque u64 handle returned by .preserve() or passed to
+ *             .retrieve().
+ * @obj:       The live kernel object returned by .preserve() or .retrieve().
+ * @lock:      A mutex that protects all fields within this structure, providing
+ *             the synchronization service for the FLB's ops.
+ * @finished:  True once the FLB's finish() callback has run.
+ * @retrieved: True once the FLB's retrieve() callback has run.
+ */
+struct luo_flb_private_state {
+	long count;
+	u64 data;
+	void *obj;
+	struct mutex lock;
+	bool finished;
+	bool retrieved;
+};
+
+/*
+ * struct luo_flb_private - Keep separate incoming and outgoing states.
+ * @list:        A global list of registered FLBs.
+ * @outgoing:    The runtime state for the pre-reboot
+ *               (preserve/unpreserve) lifecycle.
+ * @incoming:    The runtime state for the post-reboot (retrieve/finish)
+ *               lifecycle.
+ * @users:       With how many File-Handlers this FLB is registered.
+ * @initialized: true when private fields have been initialized.
+ */
+struct luo_flb_private {
+	struct list_head list;
+	struct luo_flb_private_state outgoing;
+	struct luo_flb_private_state incoming;
+	int users;
+	bool initialized;
+};
+
+/**
+ * struct liveupdate_flb - A global definition for a shared data object.
+ * @ops:         Callback functions
+ * @compatible:  The compatibility string (e.g., "iommu-core-v1"
+ *               that uniquely identifies the FLB type this handler
+ *               supports. This is matched against the compatible string
+ *               associated with individual &struct liveupdate_flb
+ *               instances.
+ *
+ * This struct is the "template" that a driver registers to define a shared,
+ * file-lifecycle-bound object. The actual runtime state (the live object,
+ * refcount, etc.) is managed privately by the LUO core.
+ */
+struct liveupdate_flb {
+	const struct liveupdate_flb_ops *ops;
+	const char compatible[LIVEUPDATE_FLB_COMPAT_LENGTH];
+
+	/* private: */
+	struct luo_flb_private __private private;
 };
 
 #ifdef CONFIG_LIVEUPDATE
@@ -112,6 +227,14 @@ int liveupdate_reboot(void);
 int liveupdate_register_file_handler(struct liveupdate_file_handler *fh);
 int liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh);
 
+int liveupdate_register_flb(struct liveupdate_file_handler *fh,
+			    struct liveupdate_flb *flb);
+int liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
+			      struct liveupdate_flb *flb);
+
+int liveupdate_flb_get_incoming(struct liveupdate_flb *flb, void **objp);
+int liveupdate_flb_get_outgoing(struct liveupdate_flb *flb, void **objp);
+
 #else /* CONFIG_LIVEUPDATE */
 
 static inline bool liveupdate_enabled(void)
@@ -134,5 +257,29 @@ static inline int liveupdate_unregister_file_handler(struct liveupdate_file_hand
 	return -EOPNOTSUPP;
 }
 
+static inline int liveupdate_register_flb(struct liveupdate_file_handler *fh,
+					  struct liveupdate_flb *flb)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
+					    struct liveupdate_flb *flb)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int liveupdate_flb_get_incoming(struct liveupdate_flb *flb,
+					      void **objp)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int liveupdate_flb_get_outgoing(struct liveupdate_flb *flb,
+					      void **objp)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif /* CONFIG_LIVEUPDATE */
 #endif /* _LINUX_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
index 7cad2eece32d..d2f779cbe279 100644
--- a/kernel/liveupdate/Makefile
+++ b/kernel/liveupdate/Makefile
@@ -3,6 +3,7 @@
 luo-y :=								\
 		luo_core.o						\
 		luo_file.o						\
+		luo_flb.o						\
 		luo_session.o
 
 obj-$(CONFIG_KEXEC_HANDOVER)		+= kexec_handover.o
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 944663d99dd9..7a9ef16b37d8 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -128,7 +128,9 @@ static int __init luo_early_startup(void)
 	if (err)
 		return err;
 
-	return 0;
+	err = luo_flb_setup_incoming(luo_global.fdt_in);
+
+	return err;
 }
 
 static int __init liveupdate_early_init(void)
@@ -165,6 +167,7 @@ static int __init luo_fdt_setup(void)
 	err |= fdt_property_string(fdt_out, "compatible", LUO_FDT_COMPATIBLE);
 	err |= fdt_property(fdt_out, LUO_FDT_LIVEUPDATE_NUM, &ln, sizeof(ln));
 	err |= luo_session_setup_outgoing(fdt_out);
+	err |= luo_flb_setup_outgoing(fdt_out);
 	err |= fdt_end_node(fdt_out);
 	err |= fdt_finish(fdt_out);
 	if (err)
@@ -226,6 +229,8 @@ int liveupdate_reboot(void)
 	if (err)
 		return err;
 
+	luo_flb_serialize();
+
 	err = kho_finalize();
 	if (err) {
 		pr_err("kho_finalize failed %d\n", err);
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 1a8a1bb73a58..cade273c50c9 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -285,10 +285,14 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (err)
 		goto err_free_files_mem;
 
+	err = luo_flb_file_preserve(fh);
+	if (err)
+		goto err_free_files_mem;
+
 	luo_file = kzalloc(sizeof(*luo_file), GFP_KERNEL);
 	if (!luo_file) {
 		err = -ENOMEM;
-		goto err_free_files_mem;
+		goto err_flb_unpreserve;
 	}
 
 	luo_file->file = file;
@@ -312,6 +316,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 
 err_kfree:
 	kfree(luo_file);
+err_flb_unpreserve:
+	luo_flb_file_unpreserve(fh);
 err_free_files_mem:
 	luo_free_files_mem(file_set);
 err_fput:
@@ -353,6 +359,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		args.serialized_data = luo_file->serialized_data;
 		args.private_data = luo_file->private_data;
 		luo_file->fh->ops->unpreserve(&args);
+		luo_flb_file_unpreserve(luo_file->fh);
 
 		list_del(&luo_file->list);
 		file_set->count--;
@@ -630,6 +637,7 @@ static void luo_file_finish_one(struct luo_file_set *file_set,
 	args.retrieved = luo_file->retrieved;
 
 	luo_file->fh->ops->finish(&args);
+	luo_flb_file_finish(luo_file->fh);
 }
 
 /**
@@ -851,6 +859,7 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
 		goto err_resume;
 	}
 
+	INIT_LIST_HEAD(&ACCESS_PRIVATE(fh, flb_list));
 	INIT_LIST_HEAD(&ACCESS_PRIVATE(fh, list));
 	list_add_tail(&ACCESS_PRIVATE(fh, list), &luo_file_handler_list);
 	luo_session_resume();
@@ -871,23 +880,34 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
  *
  * It ensures safe removal by checking that:
  * No live update session is currently in progress.
+ * No FLB registered with this file handler.
  *
  * If the unregistration fails, the internal test state is reverted.
  *
  * Return: 0 Success. -EOPNOTSUPP when live update is not enabled. -EBUSY A live
- * update is in progress, can't quiesce live update.
+ * update is in progress, can't quiesce live update or FLB is registred with
+ * this file handler.
  */
 int liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
 {
+	int err = -EBUSY;
+
 	if (!liveupdate_enabled())
 		return -EOPNOTSUPP;
 
 	if (!luo_session_quiesce())
 		return -EBUSY;
 
+	if (!list_empty(&ACCESS_PRIVATE(fh, flb_list)))
+		goto err_resume;
+
 	list_del(&ACCESS_PRIVATE(fh, list));
 	module_put(fh->ops->owner);
 	luo_session_resume();
 
 	return 0;
+
+err_resume:
+	luo_session_resume();
+	return err;
 }
diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
new file mode 100644
index 000000000000..4c437de5c0b0
--- /dev/null
+++ b/kernel/liveupdate/luo_flb.c
@@ -0,0 +1,654 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (c) 2025, Google LLC.
+ * Pasha Tatashin <pasha.tatashin@soleen.com>
+ */
+
+/**
+ * DOC: LUO File Lifecycle Bound Global Data
+ *
+ * File-Lifecycle-Bound (FLB) objects provide a mechanism for managing global
+ * state that is shared across multiple live-updatable files. The lifecycle of
+ * this shared state is tied to the preservation of the files that depend on it.
+ *
+ * An FLB represents a global resource, such as the IOMMU core state, that is
+ * required by multiple file descriptors (e.g., all VFIO fds).
+ *
+ * The preservation of the FLB's state is triggered when the *first* file
+ * depending on it is preserved. The cleanup of this state (unpreserve or
+ * finish) is triggered when the *last* file depending on it is unpreserved or
+ * finished.
+ *
+ * Handler Dependency: A file handler declares its dependency on one or more
+ * FLBs by registering them via liveupdate_register_flb().
+ *
+ * Callback Model: Each FLB is defined by a set of operations
+ * (&struct liveupdate_flb_ops) that LUO invokes at key points:
+ *
+ *     - .preserve(): Called for the first file. Saves global state.
+ *     - .unpreserve(): Called for the last file (if aborted pre-reboot).
+ *     - .retrieve(): Called on-demand in the new kernel to restore the state.
+ *     - .finish(): Called for the last file in the new kernel for cleanup.
+ *
+ * This reference-counted approach ensures that shared state is saved exactly
+ * once and restored exactly once, regardless of how many files depend on it,
+ * and that its lifecycle is correctly managed across the kexec transition.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/kexec_handover.h>
+#include <linux/kho/abi/luo.h>
+#include <linux/libfdt.h>
+#include <linux/list_private.h>
+#include <linux/liveupdate.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include "luo_internal.h"
+
+#define LUO_FLB_PGCNT		1ul
+#define LUO_FLB_MAX		(((LUO_FLB_PGCNT << PAGE_SHIFT) -	\
+		sizeof(struct luo_flb_header_ser)) / sizeof(struct luo_flb_ser))
+
+struct luo_flb_header {
+	struct luo_flb_header_ser *header_ser;
+	struct luo_flb_ser *ser;
+	bool active;
+};
+
+struct luo_flb_global {
+	struct luo_flb_header incoming;
+	struct luo_flb_header outgoing;
+	struct list_head list;
+	long count;
+};
+
+static struct luo_flb_global luo_flb_global = {
+	.list = LIST_HEAD_INIT(luo_flb_global.list),
+};
+
+/*
+ * struct luo_flb_link - Links an FLB definition to a file handler's internal
+ * list of dependencies.
+ * @flb:  A pointer to the registered &struct liveupdate_flb definition.
+ * @list: The list_head for linking.
+ */
+struct luo_flb_link {
+	struct liveupdate_flb *flb;
+	struct list_head list;
+};
+
+/* luo_flb_get_private - Access private field, and if needed initialize it. */
+static struct luo_flb_private *luo_flb_get_private(struct liveupdate_flb *flb)
+{
+	struct luo_flb_private *private = &ACCESS_PRIVATE(flb, private);
+
+	if (!private->initialized) {
+		mutex_init(&private->incoming.lock);
+		mutex_init(&private->outgoing.lock);
+		INIT_LIST_HEAD(&private->list);
+		private->users = 0;
+		private->initialized = true;
+	}
+
+	return private;
+}
+
+static int luo_flb_file_preserve_one(struct liveupdate_flb *flb)
+{
+	struct luo_flb_private *private = luo_flb_get_private(flb);
+
+	scoped_guard(mutex, &private->outgoing.lock) {
+		if (!private->outgoing.count) {
+			struct liveupdate_flb_op_args args = {0};
+			int err;
+
+			args.flb = flb;
+			err = flb->ops->preserve(&args);
+			if (err)
+				return err;
+			private->outgoing.data = args.data;
+			private->outgoing.obj = args.obj;
+		}
+		private->outgoing.count++;
+	}
+
+	return 0;
+}
+
+static void luo_flb_file_unpreserve_one(struct liveupdate_flb *flb)
+{
+	struct luo_flb_private *private = luo_flb_get_private(flb);
+
+	scoped_guard(mutex, &private->outgoing.lock) {
+		private->outgoing.count--;
+		if (!private->outgoing.count) {
+			struct liveupdate_flb_op_args args = {0};
+
+			args.flb = flb;
+			args.data = private->outgoing.data;
+			args.obj = private->outgoing.obj;
+
+			if (flb->ops->unpreserve)
+				flb->ops->unpreserve(&args);
+
+			private->outgoing.data = 0;
+			private->outgoing.obj = NULL;
+		}
+	}
+}
+
+static int luo_flb_retrieve_one(struct liveupdate_flb *flb)
+{
+	struct luo_flb_private *private = luo_flb_get_private(flb);
+	struct luo_flb_header *fh = &luo_flb_global.incoming;
+	struct liveupdate_flb_op_args args = {0};
+	bool found = false;
+	int err;
+
+	guard(mutex)(&private->incoming.lock);
+
+	if (private->incoming.finished)
+		return -ENODATA;
+
+	if (private->incoming.retrieved)
+		return 0;
+
+	if (!fh->active)
+		return -ENODATA;
+
+	for (int i = 0; i < fh->header_ser->count; i++) {
+		if (!strcmp(fh->ser[i].name, flb->compatible)) {
+			private->incoming.data = fh->ser[i].data;
+			private->incoming.count = fh->ser[i].count;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found)
+		return -ENOENT;
+
+	args.flb = flb;
+	args.data = private->incoming.data;
+
+	err = flb->ops->retrieve(&args);
+	if (err)
+		return err;
+
+	private->incoming.obj = args.obj;
+	private->incoming.retrieved = true;
+
+	return 0;
+}
+
+static void luo_flb_file_finish_one(struct liveupdate_flb *flb)
+{
+	struct luo_flb_private *private = luo_flb_get_private(flb);
+	u64 count;
+
+	scoped_guard(mutex, &private->incoming.lock)
+		count = --private->incoming.count;
+
+	if (!count) {
+		struct liveupdate_flb_op_args args = {0};
+
+		if (!private->incoming.retrieved) {
+			int err = luo_flb_retrieve_one(flb);
+
+			if (WARN_ON(err))
+				return;
+		}
+
+		scoped_guard(mutex, &private->incoming.lock) {
+			args.flb = flb;
+			args.obj = private->incoming.obj;
+			flb->ops->finish(&args);
+
+			private->incoming.data = 0;
+			private->incoming.obj = NULL;
+			private->incoming.finished = true;
+		}
+	}
+}
+
+/**
+ * luo_flb_file_preserve - Notifies FLBs that a file is about to be preserved.
+ * @fh: The file handler for the preserved file.
+ *
+ * This function iterates through all FLBs associated with the given file
+ * handler. It increments the reference count for each FLB. If the count becomes
+ * 1, it triggers the FLB's .preserve() callback to save the global state.
+ *
+ * This operation is atomic. If any FLB's .preserve() op fails, it will roll
+ * back by calling .unpreserve() on any FLBs that were successfully preserved
+ * during this call.
+ *
+ * Context: Called from luo_preserve_file()
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int luo_flb_file_preserve(struct liveupdate_file_handler *fh)
+{
+	struct list_head *flb_list = &ACCESS_PRIVATE(fh, flb_list);
+	struct luo_flb_link *iter;
+	int err = 0;
+
+	list_for_each_entry(iter, flb_list, list) {
+		err = luo_flb_file_preserve_one(iter->flb);
+		if (err)
+			goto exit_err;
+	}
+
+	return 0;
+
+exit_err:
+	list_for_each_entry_continue_reverse(iter, flb_list, list)
+		luo_flb_file_unpreserve_one(iter->flb);
+
+	return err;
+}
+
+/**
+ * luo_flb_file_unpreserve - Notifies FLBs that a dependent file was unpreserved.
+ * @fh: The file handler for the unpreserved file.
+ *
+ * This function iterates through all FLBs associated with the given file
+ * handler, in reverse order of registration. It decrements the reference count
+ * for each FLB. If the count becomes 0, it triggers the FLB's .unpreserve()
+ * callback to clean up the global state.
+ *
+ * Context: Called when a preserved file is being cleaned up before reboot
+ *          (e.g., from luo_file_unpreserve_files()).
+ */
+void luo_flb_file_unpreserve(struct liveupdate_file_handler *fh)
+{
+	struct list_head *flb_list = &ACCESS_PRIVATE(fh, flb_list);
+	struct luo_flb_link *iter;
+
+	list_for_each_entry_reverse(iter, flb_list, list)
+		luo_flb_file_unpreserve_one(iter->flb);
+}
+
+/**
+ * luo_flb_file_finish - Notifies FLBs that a dependent file has been finished.
+ * @fh: The file handler for the finished file.
+ *
+ * This function iterates through all FLBs associated with the given file
+ * handler, in reverse order of registration. It decrements the incoming
+ * reference count for each FLB. If the count becomes 0, it triggers the FLB's
+ * .finish() callback for final cleanup in the new kernel.
+ *
+ * Context: Called from luo_file_finish() for each file being finished.
+ */
+void luo_flb_file_finish(struct liveupdate_file_handler *fh)
+{
+	struct list_head *flb_list = &ACCESS_PRIVATE(fh, flb_list);
+	struct luo_flb_link *iter;
+
+	list_for_each_entry_reverse(iter, flb_list, list)
+		luo_flb_file_finish_one(iter->flb);
+}
+
+/**
+ * liveupdate_register_flb - Associate an FLB with a file handler and register it globally.
+ * @fh:   The file handler that will now depend on the FLB.
+ * @flb:  The File-Lifecycle-Bound object to associate.
+ *
+ * Establishes a dependency, informing the LUO core that whenever a file of
+ * type @fh is preserved, the state of @flb must also be managed.
+ *
+ * On the first registration of a given @flb object, it is added to a global
+ * registry. This function checks for duplicate registrations, both for a
+ * specific handler and globally, and ensures the total number of unique
+ * FLBs does not exceed the system limit.
+ *
+ * Context: Typically called from a subsystem's module init function after
+ *          both the handler and the FLB have been defined and initialized.
+ * Return: 0 on success. Returns a negative errno on failure:
+ *         -EINVAL if arguments are NULL or not initialized.
+ *         -ENOMEM on memory allocation failure.
+ *         -EEXIST if this FLB is already registered with this handler.
+ *         -ENOSPC if the maximum number of global FLBs has been reached.
+ *         -EOPNOTSUPP if live update is disabled or not configured.
+ */
+int liveupdate_register_flb(struct liveupdate_file_handler *fh,
+			    struct liveupdate_flb *flb)
+{
+	struct luo_flb_private *private = luo_flb_get_private(flb);
+	struct list_head *flb_list = &ACCESS_PRIVATE(fh, flb_list);
+	struct luo_flb_link *link __free(kfree) = NULL;
+	struct liveupdate_flb *gflb;
+	struct luo_flb_link *iter;
+	int err;
+
+	if (!liveupdate_enabled())
+		return -EOPNOTSUPP;
+
+	if (WARN_ON(!flb->ops->preserve || !flb->ops->unpreserve ||
+		    !flb->ops->retrieve || !flb->ops->finish)) {
+		return -EINVAL;
+	}
+
+	/*
+	 * File handler must already be registered, as it initializes the
+	 * flb_list
+	 */
+	if (WARN_ON(list_empty(&ACCESS_PRIVATE(fh, list))))
+		return -EINVAL;
+
+	link = kzalloc(sizeof(*link), GFP_KERNEL);
+	if (!link)
+		return -ENOMEM;
+
+	/*
+	 * Ensure the system is quiescent (no active sessions).
+	 * This acts as a global lock for registration: no other thread can
+	 * be in this section, and no sessions can be creating/using FDs.
+	 */
+	if (!luo_session_quiesce())
+		return -EBUSY;
+
+	/* Check that this FLB is not already linked to this file handler */
+	err = -EEXIST;
+	list_for_each_entry(iter, flb_list, list) {
+		if (iter->flb == flb)
+			goto err_resume;
+	}
+
+	/*
+	 * If this FLB is not linked to global list it's the first time the FLB
+	 * is registered
+	 */
+	if (!private->users) {
+		if (WARN_ON(!list_empty(&private->list))) {
+			err = -EINVAL;
+			goto err_resume;
+		}
+
+		if (luo_flb_global.count == LUO_FLB_MAX) {
+			err = -ENOSPC;
+			goto err_resume;
+		}
+
+		/* Check that compatible string is unique in global list */
+		list_private_for_each_entry(gflb, &luo_flb_global.list, private.list) {
+			if (!strcmp(gflb->compatible, flb->compatible))
+				goto err_resume;
+		}
+
+		if (!try_module_get(flb->ops->owner)) {
+			err = -EAGAIN;
+			goto err_resume;
+		}
+
+		list_add_tail(&private->list, &luo_flb_global.list);
+		luo_flb_global.count++;
+	}
+
+	/* Finally, link the FLB to the file handler */
+	private->users++;
+	link->flb = flb;
+	list_add_tail(&no_free_ptr(link)->list, flb_list);
+	luo_session_resume();
+
+	return 0;
+
+err_resume:
+	luo_session_resume();
+	return err;
+}
+
+/**
+ * liveupdate_unregister_flb - Remove an FLB dependency from a file handler.
+ * @fh:   The file handler that is currently depending on the FLB.
+ * @flb:  The File-Lifecycle-Bound object to remove.
+ *
+ * Removes the association between the specified file handler and the FLB
+ * previously established by liveupdate_register_flb().
+ *
+ * This function manages the global lifecycle of the FLB. It decrements the
+ * FLB's usage count. If this was the last file handler referencing this FLB,
+ * the FLB is removed from the global registry and the reference to its
+ * owner module (acquired during registration) is released.
+ *
+ * Context: This function ensures the session is quiesced (no active FDs
+ *          being created) during the update. It is typically called from a
+ *          subsystem's module exit function.
+ * Return: 0 on success.
+ *         -EOPNOTSUPP if live update is disabled.
+ *         -EBUSY if the live update session is active and cannot be quiesced.
+ *         -ENOENT if the FLB was not found in the file handler's list.
+ */
+int liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
+			      struct liveupdate_flb *flb)
+{
+	struct luo_flb_private *private = luo_flb_get_private(flb);
+	struct list_head *flb_list = &ACCESS_PRIVATE(fh, flb_list);
+	struct luo_flb_link *iter;
+	int err = -ENOENT;
+
+	if (!liveupdate_enabled())
+		return -EOPNOTSUPP;
+
+	/*
+	 * Ensure the system is quiescent (no active sessions).
+	 * This acts as a global lock for unregistration.
+	 */
+	if (!luo_session_quiesce())
+		return -EBUSY;
+
+	/* Find and remove the link from the file handler's list */
+	list_for_each_entry(iter, flb_list, list) {
+		if (iter->flb == flb) {
+			list_del(&iter->list);
+			kfree(iter);
+			err = 0;
+			break;
+		}
+	}
+
+	if (err)
+		goto err_resume;
+
+	private->users--;
+	/*
+	 * If this is the last file-handler with which we are registred, remove
+	 * from the global list, and relese module reference.
+	 */
+	if (!private->users) {
+		list_del_init(&private->list);
+		luo_flb_global.count--;
+		module_put(flb->ops->owner);
+	}
+
+	luo_session_resume();
+
+	return 0;
+
+err_resume:
+	luo_session_resume();
+	return err;
+}
+
+/**
+ * liveupdate_flb_get_incoming - Retrieve the incoming FLB object.
+ * @flb:  The FLB definition.
+ * @objp: Output parameter; will be populated with the live shared object.
+ *
+ * Returns a pointer to its shared live object for the incoming (post-reboot)
+ * path.
+ *
+ * If this is the first time the object is requested in the new kernel, this
+ * function will trigger the FLB's .retrieve() callback to reconstruct the
+ * object from its preserved state. Subsequent calls will return the same
+ * cached object.
+ *
+ * Return: 0 on success, or a negative errno on failure. -ENODATA means no
+ * incoming FLB data, -ENOENT means specific flb not found in the incoming
+ * data, and -EOPNOTSUPP when live update is disabled or not configured.
+ */
+int liveupdate_flb_get_incoming(struct liveupdate_flb *flb, void **objp)
+{
+	struct luo_flb_private *private = luo_flb_get_private(flb);
+
+	if (!liveupdate_enabled())
+		return -EOPNOTSUPP;
+
+	if (!private->incoming.obj) {
+		int err = luo_flb_retrieve_one(flb);
+
+		if (err)
+			return err;
+	}
+
+	guard(mutex)(&private->incoming.lock);
+	*objp = private->incoming.obj;
+
+	return 0;
+}
+
+/**
+ * liveupdate_flb_get_outgoing - Retrieve the outgoing FLB object.
+ * @flb:  The FLB definition.
+ * @objp: Output parameter; will be populated with the live shared object.
+ *
+ * Returns a pointer to its shared live object for the outgoing (pre-reboot)
+ * path.
+ *
+ * This function assumes the object has already been created by the FLB's
+ * .preserve() callback, which is triggered when the first dependent file
+ * is preserved.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int liveupdate_flb_get_outgoing(struct liveupdate_flb *flb, void **objp)
+{
+	struct luo_flb_private *private = luo_flb_get_private(flb);
+
+	if (!liveupdate_enabled())
+		return -EOPNOTSUPP;
+
+	guard(mutex)(&private->outgoing.lock);
+	*objp = private->outgoing.obj;
+
+	return 0;
+}
+
+int __init luo_flb_setup_outgoing(void *fdt_out)
+{
+	struct luo_flb_header_ser *header_ser;
+	u64 header_ser_pa;
+	int err;
+
+	header_ser = kho_alloc_preserve(LUO_FLB_PGCNT << PAGE_SHIFT);
+	if (IS_ERR(header_ser))
+		return PTR_ERR(header_ser);
+
+	header_ser_pa = virt_to_phys(header_ser);
+
+	err = fdt_begin_node(fdt_out, LUO_FDT_FLB_NODE_NAME);
+	err |= fdt_property_string(fdt_out, "compatible",
+				   LUO_FDT_FLB_COMPATIBLE);
+	err |= fdt_property(fdt_out, LUO_FDT_FLB_HEADER, &header_ser_pa,
+			    sizeof(header_ser_pa));
+	err |= fdt_end_node(fdt_out);
+
+	if (err)
+		goto err_unpreserve;
+
+	header_ser->pgcnt = LUO_FLB_PGCNT;
+	luo_flb_global.outgoing.header_ser = header_ser;
+	luo_flb_global.outgoing.ser = (void *)(header_ser + 1);
+	luo_flb_global.outgoing.active = true;
+
+	return 0;
+
+err_unpreserve:
+	kho_unpreserve_free(header_ser);
+
+	return err;
+}
+
+int __init luo_flb_setup_incoming(void *fdt_in)
+{
+	struct luo_flb_header_ser *header_ser;
+	int err, header_size, offset;
+	const void *ptr;
+	u64 header_ser_pa;
+
+	offset = fdt_subnode_offset(fdt_in, 0, LUO_FDT_FLB_NODE_NAME);
+	if (offset < 0) {
+		pr_err("Unable to get FLB node [%s]\n", LUO_FDT_FLB_NODE_NAME);
+
+		return -ENOENT;
+	}
+
+	err = fdt_node_check_compatible(fdt_in, offset,
+					LUO_FDT_FLB_COMPATIBLE);
+	if (err) {
+		pr_err("FLB node is incompatible with '%s' [%d]\n",
+		       LUO_FDT_FLB_COMPATIBLE, err);
+
+		return -EINVAL;
+	}
+
+	header_size = 0;
+	ptr = fdt_getprop(fdt_in, offset, LUO_FDT_FLB_HEADER, &header_size);
+	if (!ptr || header_size != sizeof(u64)) {
+		pr_err("Unable to get FLB header property '%s' [%d]\n",
+		       LUO_FDT_FLB_HEADER, header_size);
+
+		return -EINVAL;
+	}
+
+	header_ser_pa = get_unaligned((u64 *)ptr);
+	header_ser = phys_to_virt(header_ser_pa);
+
+	luo_flb_global.incoming.header_ser = header_ser;
+	luo_flb_global.incoming.ser = (void *)(header_ser + 1);
+	luo_flb_global.incoming.active = true;
+
+	return 0;
+}
+
+/**
+ * luo_flb_serialize - Serializes all active FLB objects for KHO.
+ *
+ * This function is called from the reboot path. It iterates through all
+ * registered File-Lifecycle-Bound (FLB) objects. For each FLB that has been
+ * preserved (i.e., its reference count is greater than zero), it writes its
+ * metadata into the memory region designated for Kexec Handover.
+ *
+ * The serialized data includes the FLB's compatibility string, its opaque
+ * data handle, and the final reference count. This allows the new kernel to
+ * find the appropriate handler and reconstruct the FLB's state.
+ *
+ * Context: Called from liveupdate_reboot() just before kho_finalize().
+ */
+void luo_flb_serialize(void)
+{
+	struct luo_flb_header *fh = &luo_flb_global.outgoing;
+	struct liveupdate_flb *gflb;
+	int i = 0;
+
+	list_private_for_each_entry(gflb, &luo_flb_global.list, private.list) {
+		struct luo_flb_private *private = luo_flb_get_private(gflb);
+
+		if (private->outgoing.count > 0) {
+			strscpy(fh->ser[i].name, gflb->compatible,
+				sizeof(fh->ser[i].name));
+			fh->ser[i].data = private->outgoing.data;
+			fh->ser[i].count = private->outgoing.count;
+			i++;
+		}
+	}
+
+	fh->header_ser->count = i;
+}
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 3f1e0c94637e..99db13d99530 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -100,4 +100,11 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 void luo_file_set_init(struct luo_file_set *file_set);
 void luo_file_set_destroy(struct luo_file_set *file_set);
 
+int luo_flb_file_preserve(struct liveupdate_file_handler *fh);
+void luo_flb_file_unpreserve(struct liveupdate_file_handler *fh);
+void luo_flb_file_finish(struct liveupdate_file_handler *fh);
+int __init luo_flb_setup_outgoing(void *fdt);
+int __init luo_flb_setup_incoming(void *fdt);
+void luo_flb_serialize(void);
+
 #endif /* _LINUX_LUO_INTERNAL_H */
-- 
2.52.0.313.g674ac2bdf7-goog

