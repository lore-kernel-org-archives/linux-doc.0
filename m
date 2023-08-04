Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C902C001DE
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 18:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbjHDSZi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 14:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjHDSZR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 14:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD824C0C
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 11:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691173467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tdvB6S+0xdJe+R0RQa7YvMStrYjQLCLaAmPE3m6irHk=;
        b=JjUra3IcWfY1iE3JfduGNhWzGCs7T31Aq1d/r4Y7kjVyySkJkV7oV0PYiSpj7rkGjQXYd6
        vIHqf9734FwTRvbVhF5HCwKtG7g3uGkBr4JZYN28fxHDG1izWlpuqG450qH6AeHeW46MQC
        zxH2klK5D0ZkYyyXGgIwwsQtP5ju4+k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-j7eKXeFTOfCZlI5Ofy7cWQ-1; Fri, 04 Aug 2023 14:24:26 -0400
X-MC-Unique: j7eKXeFTOfCZlI5Ofy7cWQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993831c639aso161557966b.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 11:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691173465; x=1691778265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdvB6S+0xdJe+R0RQa7YvMStrYjQLCLaAmPE3m6irHk=;
        b=gofsC9SFp+0hG+QnsL79DEgJBEx3P4CX8Jc8Vlmvl1D6xhQbECBG7Ydy2WE69DOwsF
         c6UJSSRSkbj/YD6WP136iT4EIEieJTOIxbB2ysxI4j+M7w3991ocWeliktiXkOWXXOK7
         hTn3vJw8PG9kVUP5BpAg+zbPYzLnA95NXh8/i3TbnCV3cUvZGN+wX1h6gyQw0Jr+6Vl2
         mEHN1rTzb99hqKuQgssyve8cJRfFf7rIFCmKM7/IFsMKS9QNFc/N5XbX96ezMAtYXzg2
         W6ozj97Wdcnwa65fbHnB5EJEUBOQr8G6oT9a725GF4AYL9G4uhPV718GFrJbTdL8bgbl
         Qzcg==
X-Gm-Message-State: AOJu0YwE1/HV9KJJ0ygQEg8iZ/H/OFU4HysbpAcEUhJ9R+wG1Kv28fJx
        v6MYpFR8HrTg/7Pfv5vhbcO2Q7ate+EyB8MXhFmNE9UDLPgrDPrZpN4zErzc1H5tJOrztOBwn2u
        TYx34TOFmtaud4pptRKrQ
X-Received: by 2002:a17:906:54:b0:99b:44aa:fae0 with SMTP id 20-20020a170906005400b0099b44aafae0mr2198328ejg.21.1691173465553;
        Fri, 04 Aug 2023 11:24:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgkXhxgzo/kPDtkvo5KOEfegOWPtwZniqGCTkW1GKHaJkbmXDC0ExshzPIa96qYXE5j3rMCg==
X-Received: by 2002:a17:906:54:b0:99b:44aa:fae0 with SMTP id 20-20020a170906005400b0099b44aafae0mr2198317ejg.21.1691173465346;
        Fri, 04 Aug 2023 11:24:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id h4-20020a1709062dc400b0099bc2d1429csm1642676eji.72.2023.08.04.11.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 11:24:24 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net, donald.robson@imgtec.com
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Faith Ekstrand <faith.ekstrand@collabora.com>,
        Dave Airlie <airlied@redhat.com>
Subject: [PATCH drm-misc-next v10 03/12] drm/nouveau: new VM_BIND uAPI interfaces
Date:   Fri,  4 Aug 2023 20:23:43 +0200
Message-ID: <20230804182406.5222-4-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit provides the interfaces for the new UAPI motivated by the
Vulkan API. It allows user mode drivers (UMDs) to:

1) Initialize a GPU virtual address (VA) space via the new
   DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
   VA area.

2) Bind and unbind GPU VA space mappings via the new
   DRM_IOCTL_NOUVEAU_VM_BIND ioctl.

3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.

Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
asynchronous processing with DRM syncobjs as synchronization mechanism.

The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Co-developed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/driver-uapi.rst |   8 ++
 include/uapi/drm/nouveau_drm.h    | 217 ++++++++++++++++++++++++++++++
 2 files changed, 225 insertions(+)

diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
index 4411e6919a3d..9c7ca6e33a68 100644
--- a/Documentation/gpu/driver-uapi.rst
+++ b/Documentation/gpu/driver-uapi.rst
@@ -6,3 +6,11 @@ drm/i915 uAPI
 =============
 
 .. kernel-doc:: include/uapi/drm/i915_drm.h
+
+drm/nouveau uAPI
+================
+
+VM_BIND / EXEC uAPI
+-------------------
+
+.. kernel-doc:: include/uapi/drm/nouveau_drm.h
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index ca917e55b38f..b1ad9d5ffce8 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -76,6 +76,8 @@ struct drm_nouveau_channel_free {
 #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
 #define NOUVEAU_GEM_DOMAIN_MAPPABLE  (1 << 3)
 #define NOUVEAU_GEM_DOMAIN_COHERENT  (1 << 4)
+/* The BO will never be shared via import or export. */
+#define NOUVEAU_GEM_DOMAIN_NO_SHARE  (1 << 5)
 
 #define NOUVEAU_GEM_TILE_COMP        0x00030000 /* nv50-only */
 #define NOUVEAU_GEM_TILE_LAYOUT_MASK 0x0000ff00
@@ -164,6 +166,215 @@ struct drm_nouveau_gem_cpu_fini {
 	__u32 handle;
 };
 
+/**
+ * struct drm_nouveau_sync - sync object
+ *
+ * This structure serves as synchronization mechanism for (potentially)
+ * asynchronous operations such as EXEC or VM_BIND.
+ */
+struct drm_nouveau_sync {
+	/**
+	 * @flags: the flags for a sync object
+	 *
+	 * The first 8 bits are used to determine the type of the sync object.
+	 */
+	__u32 flags;
+#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
+#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
+#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
+	/**
+	 * @handle: the handle of the sync object
+	 */
+	__u32 handle;
+	/**
+	 * @timeline_value:
+	 *
+	 * The timeline point of the sync object in case the syncobj is of
+	 * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
+	 */
+	__u64 timeline_value;
+};
+
+/**
+ * struct drm_nouveau_vm_init - GPU VA space init structure
+ *
+ * Used to initialize the GPU's VA space for a user client, telling the kernel
+ * which portion of the VA space is managed by the UMD and kernel respectively.
+ *
+ * For the UMD to use the VM_BIND uAPI, this must be called before any BOs or
+ * channels are created; if called afterwards DRM_IOCTL_NOUVEAU_VM_INIT fails
+ * with -ENOSYS.
+ */
+struct drm_nouveau_vm_init {
+	/**
+	 * @kernel_managed_addr: start address of the kernel managed VA space
+	 * region
+	 */
+	__u64 kernel_managed_addr;
+	/**
+	 * @kernel_managed_size: size of the kernel managed VA space region in
+	 * bytes
+	 */
+	__u64 kernel_managed_size;
+};
+
+/**
+ * struct drm_nouveau_vm_bind_op - VM_BIND operation
+ *
+ * This structure represents a single VM_BIND operation. UMDs should pass
+ * an array of this structure via struct drm_nouveau_vm_bind's &op_ptr field.
+ */
+struct drm_nouveau_vm_bind_op {
+	/**
+	 * @op: the operation type
+	 */
+	__u32 op;
+/**
+ * @DRM_NOUVEAU_VM_BIND_OP_MAP:
+ *
+ * Map a GEM object to the GPU's VA space. Optionally, the
+ * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the kernel to
+ * create sparse mappings for the given range.
+ */
+#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
+/**
+ * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
+ *
+ * Unmap an existing mapping in the GPU's VA space. If the region the mapping
+ * is located in is a sparse region, new sparse mappings are created where the
+ * unmapped (memory backed) mapping was mapped previously. To remove a sparse
+ * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
+ */
+#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
+	/**
+	 * @flags: the flags for a &drm_nouveau_vm_bind_op
+	 */
+	__u32 flags;
+/**
+ * @DRM_NOUVEAU_VM_BIND_SPARSE:
+ *
+ * Indicates that an allocated VA space region should be sparse.
+ */
+#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
+	/**
+	 * @handle: the handle of the DRM GEM object to map
+	 */
+	__u32 handle;
+	/**
+	 * @pad: 32 bit padding, should be 0
+	 */
+	__u32 pad;
+	/**
+	 * @addr:
+	 *
+	 * the address the VA space region or (memory backed) mapping should be mapped to
+	 */
+	__u64 addr;
+	/**
+	 * @bo_offset: the offset within the BO backing the mapping
+	 */
+	__u64 bo_offset;
+	/**
+	 * @range: the size of the requested mapping in bytes
+	 */
+	__u64 range;
+};
+
+/**
+ * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
+ */
+struct drm_nouveau_vm_bind {
+	/**
+	 * @op_count: the number of &drm_nouveau_vm_bind_op
+	 */
+	__u32 op_count;
+	/**
+	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
+	 */
+	__u32 flags;
+/**
+ * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
+ *
+ * Indicates that the given VM_BIND operation should be executed asynchronously
+ * by the kernel.
+ *
+ * If this flag is not supplied the kernel executes the associated operations
+ * synchronously and doesn't accept any &drm_nouveau_sync objects.
+ */
+#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
+	/**
+	 * @wait_count: the number of wait &drm_nouveau_syncs
+	 */
+	__u32 wait_count;
+	/**
+	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
+	 */
+	__u32 sig_count;
+	/**
+	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
+	 */
+	__u64 wait_ptr;
+	/**
+	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
+	 */
+	__u64 sig_ptr;
+	/**
+	 * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
+	 */
+	__u64 op_ptr;
+};
+
+/**
+ * struct drm_nouveau_exec_push - EXEC push operation
+ *
+ * This structure represents a single EXEC push operation. UMDs should pass an
+ * array of this structure via struct drm_nouveau_exec's &push_ptr field.
+ */
+struct drm_nouveau_exec_push {
+	/**
+	 * @va: the virtual address of the push buffer mapping
+	 */
+	__u64 va;
+	/**
+	 * @va_len: the length of the push buffer mapping
+	 */
+	__u64 va_len;
+};
+
+/**
+ * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
+ */
+struct drm_nouveau_exec {
+	/**
+	 * @channel: the channel to execute the push buffer in
+	 */
+	__u32 channel;
+	/**
+	 * @push_count: the number of &drm_nouveau_exec_push ops
+	 */
+	__u32 push_count;
+	/**
+	 * @wait_count: the number of wait &drm_nouveau_syncs
+	 */
+	__u32 wait_count;
+	/**
+	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
+	 */
+	__u32 sig_count;
+	/**
+	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
+	 */
+	__u64 wait_ptr;
+	/**
+	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
+	 */
+	__u64 sig_ptr;
+	/**
+	 * @push_ptr: pointer to &drm_nouveau_exec_push ops
+	 */
+	__u64 push_ptr;
+};
+
 #define DRM_NOUVEAU_GETPARAM           0x00
 #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
 #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
@@ -174,6 +385,9 @@ struct drm_nouveau_gem_cpu_fini {
 #define DRM_NOUVEAU_NVIF               0x07
 #define DRM_NOUVEAU_SVM_INIT           0x08
 #define DRM_NOUVEAU_SVM_BIND           0x09
+#define DRM_NOUVEAU_VM_INIT            0x10
+#define DRM_NOUVEAU_VM_BIND            0x11
+#define DRM_NOUVEAU_EXEC               0x12
 #define DRM_NOUVEAU_GEM_NEW            0x40
 #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
@@ -239,6 +453,9 @@ struct drm_nouveau_svm_bind {
 #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
 #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
 
+#define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
+#define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
+#define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
 #if defined(__cplusplus)
 }
 #endif
-- 
2.41.0

