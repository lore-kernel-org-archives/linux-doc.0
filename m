Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E289AC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 05:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97ABA64EC4
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 05:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhBSFy1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Feb 2021 00:54:27 -0500
Received: from mga12.intel.com ([192.55.52.136]:58642 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhBSFy0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Feb 2021 00:54:26 -0500
IronPort-SDR: dn2IF7BOdBad2zv4eWBYpAj9WtNFHHds18iWEjUmT8Kz1zEEli6p6z6UQuL2PbTatBUvr2ypED
 AByqVzshsstA==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="162890393"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="162890393"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 21:52:39 -0800
IronPort-SDR: ykHqUxz3Xc7ASyZnxEM2uCzBORYXPUKEBfNE7q9UQKR5rICd88rqqTCdEwMkNR9B/vk+z3y9wN
 NoiuKMuaV9ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; 
   d="scan'208";a="419848333"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
  by fmsmga004.fm.intel.com with ESMTP; 18 Feb 2021 21:52:39 -0800
From:   Jacob Pan <jacob.jun.pan@linux.intel.com>
To:     Linux Driver Review <linux-drivers-review@eclists.intel.com>,
        iommu@eclists.intel.com
Cc:     Yi Liu <yi.l.liu@intel.com>, Raj Ashok <ashok.raj@intel.com>,
        "Tian, Kevin" <kevin.tian@intel.com>,
        "Lu Baolu" <baolu.lu@linux.intel.com>, Wu Hao <hao.wu@intel.com>,
        Yi Sun <yi.y.sun@intel.com>, Dave Jiang <dave.jiang@intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 01/16] docs: Document IO Address Space ID (IOASID) APIs
Date:   Thu, 18 Feb 2021 13:21:13 -0800
Message-Id: <1613683288-89552-2-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613683288-89552-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1613683288-89552-1-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

IOASID is used to identify address spaces that can be targeted by device
DMA. It is a system-wide resource that is essential to its many users.
This document is an attempt to help developers from all vendors navigate
the APIs. At this time, ARM SMMU and Intel’s Scalable IO Virtualization
(SIOV) enabled platforms are the primary users of IOASID. Examples of
how SIOV components interact with the IOASID APIs are provided.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 Documentation/driver-api/ioasid.rst | 696 ++++++++++++++++++++++++++++
 1 file changed, 696 insertions(+)
 create mode 100644 Documentation/driver-api/ioasid.rst

diff --git a/Documentation/driver-api/ioasid.rst b/Documentation/driver-api/ioasid.rst
new file mode 100644
index 000000000000..3dc337eb4471
--- /dev/null
+++ b/Documentation/driver-api/ioasid.rst
@@ -0,0 +1,696 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. ioasid:
+
+=====================
+ IO Address Space ID
+=====================
+
+IOASIDs are used to identify virtual address spaces that DMA requests can
+target. It is a generic name for PCIe Process Address ID (PASID) or
+SubstreamID defined by ARM's SMMU.
+
+The primary use cases for IOASIDs are Shared Virtual Address (SVA) and
+IO Virtual Address (IOVA) when multiple address spaces per device are
+desired. Due to hardware architectural differences the requirements for
+IOASID management can vary in terms of namespace, state management, and
+virtualization usages.
+
+The IOASID subsystem consists of three components:
+
+- IOASID core: provides APIs for allocation, pool management,
+  notifications and refcounting. See Documentation/driver-api/ioasid.rst
+  for details
+- IOASID user:  provides user allocation interface via /dev/ioasid
+- IOASID cgroup controller: manage resource distribution
+
+This document covers the features supported by the IOASID core APIs.
+Vendor-specific use cases are also illustrated with Intel's VT-d
+based platforms as the first example. The term PASID and IOASID are used
+interchangeablly throughout this document.
+
+.. contents:: :local:
+
+Glossary
+========
+PASID - Process Address Space ID
+
+IOVA - IO Virtual Address
+
+IOASID - IO Address Space ID (generic term for PCIe PASID and
+SubstreamID in SMMU)
+
+SVA/SVM - Shared Virtual Addressing/Memory
+
+gSVA - Guest Shared Virtual Addressing, nested translation is used
+
+gIOVA - Guest IO Virtual Addressing, nested translation is used
+
+ENQCMD - Instruction to submit work to shared workqueues. Refer
+to "Intel X86 ISA for efficient workqueue submission" [1]
+
+DSA - Intel Data Streaming Accelerator [2]
+
+VDCM - Virtual Device Composition Module [3]
+
+SIOV - Intel Scalable IO Virtualization
+
+DWQ - Dedicated Work Queue
+
+SWQ - Shared Work Queue
+
+1. https://software.intel.com/sites/default/files/managed/c5/15/architecture-instruction-set-extensions-programming-reference.pdf
+
+2. https://01.org/blogs/2019/introducing-intel-data-streaming-accelerator
+
+3. https://software.intel.com/en-us/download/intel-data-streaming-accelerator-preliminary-architecture-specification
+
+
+Key Concepts
+============
+
+IOASID Set
+----------
+An IOASID set is a group of IOASIDs allocated from the system-wide
+IOASID pool. Refer to section "IOASID Set Level APIs" for more details.
+
+IOASID set is particularly useful for guest SVA where each guest could
+have its own IOASID set for security and efficiency reasons.
+
+Guest IOASID
+------------------
+IOASID used by the guest, identifies a guest IOVA space or a guest VA
+space per guest process.
+
+Host IOASID
+-----------------
+IOASID used by the host either for bare metal SVA or as the backing of a
+guest IOASID.
+
+
+IOASID Set Private ID (SPID)
+----------------------------
+Each IOASID set has a private namespace of SPIDs. An SPID maps to a
+single system-wide IOASID. Conversely, each IOASID may be associated
+with an alias ID, local to the IOASID set, named SPID.
+SPIDs can be used as guest IOASIDs where each guest could do
+IOASID allocation from its own pool/set and map them to host physical
+IOASIDs. SPIDs are particularly useful for supporting live migration
+where decoupling guest and host physical resources are necessary.
+
+For example, two VMs can both allocate guest PASID/SPID #101 but map to
+different host PASIDs #201 and #202 respectively as shown in the
+diagram below.
+::
+
+ .------------------.    .------------------.
+ |   VM 1           |    |   VM 2           |
+ |                  |    |                  |
+ |------------------|    |------------------|
+ | GPASID/SPID 101  |    | GPASID/SPID 101  |
+ '------------------'    -------------------'     Guest
+ __________|______________________|____________________
+           |                      |               Host
+           v                      v
+ .------------------.    .------------------.
+ | Host IOASID 201  |    | Host IOASID 202  |
+ '------------------'    '------------------'
+ |   IOASID set 1   |    |   IOASID set 2   |
+ '------------------'    '------------------'
+
+Guest PASID is treated as IOASID set private ID (SPID) within an
+IOASID set, mappings between guest and host IOASIDs are stored in the
+set for inquiry.
+
+Theory of Operation
+===================
+
+States
+------
+IOASID has four states as illustrated in the diagram below.
+::
+
+   BIND/UNBIND, WQ PROG/CLEAR
+   -----------------------------.
+                                |
+   ALLOC                        |
+   ------------.                |
+               |                |
+   +-------+   v    +-------+   v     +----------+
+   | FREE  |=======>| IDLE¹ |========>| ACTIVE²  |
+   +-------+        +-------+         +----------+
+      ^                                    |
+      |           +---------------+        |
+      '===========| FREE PENDING³ |<======='
+                  +---------------+  ^
+   FREE                              |
+   ----------------------------------'
+   ¹ Allocated but not used
+   ² Used by device drivers or CPU, each user holds a reference
+   ³ Waiting for all users drop their refcount before returning IOASID
+   back to the pool
+
+
+Notifications
+-------------
+Depending on the hardware architecture, an IOASID can be programmed into
+CPU, IOMMU, or devices for DMA related activity. The synchronization among them
+is based on events notifications which follows a publisher-subscriber pattern.
+
+Events
+~~~~~~
+Notification events are pertinent to individual IOASIDs, they can be
+one of the following::
+
+ - ALLOC
+ - FREE
+ - BIND
+ - UNBIND
+ 
+Ordering
+~~~~~~~~
+Ordering of notification events is supported by the IOASID core as the
+following (from high to low)::
+
+ - CPU
+ - IOMMU
+ - DEVICE
+
+Subscribers of IOASID events are responsible for registering their
+notification blocks according to the priorities.
+
+The above order applies to all events. For examine, the UNBIND event is
+issued when a guest IOASID is freed due to exceptions. All active DMA
+sources should be quiesced before tearing down other hardware contexts
+in the system. This is necessary to reduce the churn in handling faults.
+The notification order ensures that vCPU is stopped before IOMMU and
+devices.
+Besides calling ioasid_notify directly, notifications can also be sent
+by the IOASID core as a by-product of calling the following APIs::
+
+ - ioasisd_free()        /* emits IOASID_FREE */
+ - ioasid_detach_spid()  /* emits IOASID_UNBIND */
+ - ioasid_attach_spid()  /* emits IOASID_BIND */
+
+It is the callers responsibility to avoid chained notifications in the
+atomic notification handlers. i.e. ioasid_detach_spid() cannot be called
+inside the IOASID_FREE atomic handlers. However, ioasid_detach_spid() can
+be called from deferred work. See Atomicity section for details.
+
+Level Sensitivity
+~~~~~~~~~~~~~~~~~
+For each IOASID state transition, IOASID core ensures that there is
+only one notification sent. This resembles level triggered interrupt
+where a single interrupt is raised during a state transition.
+For example, if ioasid_free() is called twice by a user before the
+IOASID is reclaimed, IOASID core will only send out a single
+IOASID_NOTIFY_FREE event. Similarly, for IOASID_NOTIFY_BIND/UNBIND
+events, which is only sent out once when a SPID is attached/detached.
+
+Scopes
+~~~~~~
+There are two types of notifiers in IOASID core: system-wide and
+ioasid_set-wide.
+
+System-wide notifier is catering for users that need to handle all the
+IOASIDs in the system. E.g. The IOMMU driver.
+
+Per ioasid_set notifier can be used by VM specific components such as
+KVM. After all, each KVM instance only cares about IOASIDs within its
+own set/guest.
+
+Atomicity
+~~~~~~~~~
+IOASID notifiers are atomic due to spinlocks used inside the IOASID
+core. For tasks that cannot be completed in the notifier handler,
+async work can be submitted to the ordered workqueue provided by the
+IOASID core. This will ensure ordered completion of the work items
+submitted by all users.
+
+Reference counting
+------------------
+IOASID life cycle management is based on reference counting. Users of
+IOASID who intend to align its context with the life cycle need to hold
+references of the IOASID. An IOASID will not be returned to the pool
+for re-allocation until all its references are dropped. Calling ioasid_free()
+will mark the IOASID as FREE_PENDING if the IOASID has outstanding
+references. No new references can be taken by ioasid_get() once an
+IOASID is in the FREE_PENDING state. ioasid_free() can be called
+multiple times without an error until all refs are dropped.
+
+ioasid_put() decrements and tests refcount of the IOASID. If refcount
+is 0, ioasid will be freed. The IOASID will be returned to the pool and
+available for new allocations. Note that ioasid_put() can be called by
+IOASID_FREE event handler where the IOASID is reclaimed.
+
+Event notifications are used to inform users of IOASID status change.
+IOASID_FREE or UNBIND events prompt users to drop their references after
+clearing its context.
+
+For example, on VT-d platform when an IOASID is freed, teardown
+actions are performed on CPU (KVM), device driver (VDCM), and the IOMMU
+driver. To quiesce vCPU for work submission, KVM notifier handler must
+be called before VDCM handler. Therefore, KVM and VDCM shall monitor
+notification events IOASID_UNBIND. As KVM x86 code registers notification
+block with priority IOASID_PRIO_CPU and VDCM code registers notification
+block with priority IOASID_PRIO_DEVICE, IOASID core ensures the CPU
+handlers are called before the DEVICE handlers.
+
+For both KVM and VDCM, notifier blocks shall be registered on the
+IOASID set such that *only* events from the matching VM are received.
+
+If KVM attempts to register a notifier block before the IOASID set is
+created using the MM token, the notifier block will be placed on a
+pending list inside IOASID core. Once the token matching IOASID set
+is created, IOASID will register the notifier block automatically.
+IOASID core does not replay events for the existing IOASIDs in the
+set. For IOASID set of MM type, notification blocks can be registered
+on empty sets only. This is to avoid lost events.
+
+IOMMU driver shall register notifier block on global chain, e.g. ::
+
+ static struct notifier_block pasid_nb_vtd = {
+	.notifier_call = pasid_status_change_vtd,
+	.priority      = IOASID_PRIO_IOMMU,
+ };
+
+Namespaces
+----------
+IOASIDs are limited system resources that default to 20 bits in
+size. Each device can have its own PASID table for security reasons.
+Theoretically the namespace can be per device also.
+
+However IOASID namespace is system-wide for two reasons:
+- Simplicity
+- Sharing resources of a single device to multiple VMs.
+
+Take VT-d as an example, VT-d supports shared workqueue and ENQCMD[1]
+where one IOASID could be used to submit work on multiple devices that
+are shared with other VMs. This requires IOASID to be
+system-wide. This is also the reason why guests must use an
+emulated virtual command interface to allocate IOASID from the host.
+
+Life cycle
+----------
+This section covers the IOASID life cycle management for both bare-metal
+and guest usages. In bare-metal SVA, MMU notifier is directly hooked
+up with the IOMMU driver. By leveraging the .release() function, the
+IOASID life cycle can be made to match the process address space (MM)
+life cycle.
+
+However, guest MMU notifier is not available to the host IOMMU driver,
+when guest MM terminates unexpectedly, the events have to go through
+VFIO and IOMMU UAPI to reach host IOMMU driver. There are also more
+parties involved in guest SVA, e.g. on Intel VT-d platform, IOASIDs
+are used by IOMMU driver, KVM, VDCM, and VFIO.
+
+At the highlevel, there are following four patterns:
+
+1.   ALLOC -> FREE
+2.   ALLOC -> BIND -> DMA Activity -> UNBIND -> FREE
+3.   ALLOC -> BIND -> FREE
+4.   ALLOC -> BIND -> DMA Activity -> FREE
+
+The first two are normal cases, 3 and 4 are exceptions due to user
+process misbehaving.
+
+Exception handling can be complex when there are lots of IOASID
+consumers involved but the pattern is common and quite simple. When an
+IOASID in active state is being freed, IOASID core will notify all
+users to perform clean up. Each IOASID user performs cleanup and drop
+the reference at the end. When reference count drops to 0, IOASID will
+be reclaimed and ready to be allocated again.
+
+Cleanup can be either done in the atomic notifier handler or as queued
+work to the common ordered IOASID workqueue to be performed asynchronously.
+The highlevel flow is the following::
+
+  Free Req¹ -> Notify users -> Cleanup -> Drop reference -> Reclaim
+
+Notes:
+¹ Free one IOASID or free all IOASID within a set
+
+The following table shows how events are used on Intel VT-d platform.
+::
+
+  --------------------------------------------------------------------------
+  Events     |Publishers       | Subscribers
+  -----------+-----------------+--------------------------------------------
+  ALLOC      |/dev/ioasid      | None
+  -----------+-----------------+--------------------------------------------
+  FREE       |/dev/ioasid      | IOMMU (VT-d driver)¹
+  -----------+-----------------+-----------------------------------------------
+  BIND       |IOMMU            | KVM, VDCM
+  -----------+-----------------+-----------------------------------------------
+  UNBIND     |IOMMU²           | KVM, VDCM
+  -----------+--------------------------------------------------------------
+  
+  ¹ IOASID core issues FREE events if the IOASID is in the ACTIVE state. IOMMU
+    driver call ioasid_detach_spid() which issues UNBIND event outside atomic
+    notifier handler. 
+  ² Only *one* BIND/UBIND event is issued per bind/unbind cycle. For multiple
+    devices bound to the same PASID, BIND event is issued for the first device
+    bind, UNBDIN event is issued for the last device unbind. Faults must be
+    tolerated between the first and last device unbind. Under normal
+    circumstances, faults are not expected in that the teardown process shall
+    stop DMA activities prior to unbind.
+
+The number of IOASIDs allocated in the ioasid_set serves as the refcount
+of the set, this ensures the life cycle alignment of the set and its
+IOASIDs.
+
+API Implementation
+==================
+To get the IOASID APIs, users must #include <linux/ioasid.h>. These APIs
+serve the following functionalities:
+
+  - IOASID allocation/freeing
+  - Group management in the form of ioasid_set
+  - Private data storage and lookup
+  - Reference counting
+  - Event notification in case of a state change
+
+Custom allocator APIs
+---------------------
+
+IOASIDs are allocated for both host and guest SVA/IOVA usage. However,
+allocators can be different. For example, on VT-d guest PASID
+allocation must be performed via a virtual command interface which is
+emulated by VMM.
+
+IOASID core has the notion of "custom allocator" such that guest can
+register virtual command allocator that precedes the default one.
+::
+
+ int ioasid_register_allocator(struct ioasid_allocator_ops *allocator);
+
+ void ioasid_unregister_allocator(struct ioasid_allocator_ops *allocator);
+
+IOASID Set Level APIs
+---------------------
+For use cases such as guest SVA it is necessary to manage IOASIDs at
+ioasid_set level. For example, VMs may allocate multiple IOASIDs for
+guest process address sharing (vSVA). It is imperative to enforce
+VM-IOASID ownership such that a malicious guest cannot target DMA
+traffic outside its own IOASIDs, or free an active IOASID that belongs
+to another VM.
+
+The IOASID set APIs serve the following purposes:
+
+ - Ownership/permission enforcement
+ - Take collective actions, e.g. free an entire set
+ - Event notifications within a set
+ - Look up a set based on token
+ - Quota enforcement (TBD, contingent upon ioasids cgroup) 
+
+Each IOASID set is created with a token, which can be one of the
+following token types::
+
+ - IOASID_SET_TYPE_NONE (Arbitrary u64 value)
+ - IOASID_SET_TYPE_MM (Set token is a mm_struct)
+
+The explicit MM token type is useful when multiple users of an IOASID
+set under the same process need to communicate about their shared IOASIDs.
+E.g. An IOASID set created by VFIO for one guest can be associated
+with the KVM instance for the same guest since they share a common mm_struct.
+A token must be unique within its type.
+
+::
+
+ struct ioasid_set *ioasid_alloc_set(void *token, ioasid_t quota, u32 type)
+
+ int ioasid_set_for_each_ioasid(struct ioasid_set *set,
+                                void (*fn)(ioasid_t id, void *data),
+                                void *data)
+
+ struct ioasid_set *ioasid_find_mm_set(struct mm_struct *token)
+
+ void ioasid_free_all_in_set(struct ioasid_set *set)
+
+Individual IOASID APIs
+----------------------
+Once an ioasid_set is created, IOASIDs can be allocated from the set.
+Within the IOASID set namespace, set private ID (SPID) is supported. In
+the VM use case, SPID can be used for storing guest PASID.
+
+::
+
+ ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min, ioasid_t max,
+                       void *private);
+
+ int ioasid_get(struct ioasid_set *set, ioasid_t ioasid);
+
+ void ioasid_put(struct ioasid_set *set, ioasid_t ioasid);
+
+ int ioasid_get_locked(struct ioasid_set *set, ioasid_t ioasid);
+
+ void ioasid_put_locked(struct ioasid_set *set, ioasid_t ioasid);
+
+ void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
+                   bool (*getter)(void *));
+
+ ioasid_t ioasid_find_by_spid(struct ioasid_set *set, ioasid_t spid,
+ bool get)
+
+ int ioasid_attach_data(struct ioasid_set *set, ioasid_t ioasid,
+                        void *data);
+ int ioasid_attach_spid(struct ioasid_set *set, ioasid_t ioasid,
+                        ioasid_t spid);
+
+
+Notification APIs
+-----------------
+An IOASID may have multiple users, each user may have hardware context
+associated with an IOASID. When the status of an IOASID changes,
+e.g. an IOASID is being freed, users need to be notified such that the
+associated hardware context can be cleared, flushed, and drained.
+
+::
+
+ int ioasid_register_notifier(struct ioasid_set *set, struct
+                              notifier_block *nb)
+
+ void ioasid_unregister_notifier(struct ioasid_set *set,
+                                 struct notifier_block *nb)
+
+ int ioasid_register_notifier_mm(struct mm_struct *mm, struct
+                                 notifier_block *nb)
+
+ void ioasid_unregister_notifier_mm(struct mm_struct *mm, struct
+                                    notifier_block *nb)
+
+ int ioasid_notify(ioasid_t ioasid, enum ioasid_notify_val cmd,
+                   unsigned int flags)
+
+"_mm" flavor of the ioasid_register_notifier() APIs are used when
+an IOASID user need to listen to the IOASID events belong to a
+process but without the knowledge of the associated ioasid_set.
+
+Native IOASID Life Cycle (VT-d Example)
+---------------------------------------
+
+The normal flow of native SVA code with Intel Data Streaming
+Accelerator(DSA) [2] as example:
+
+1. Host user opens accelerator FD, e.g. DSA driver, or uacce;
+2. DSA driver allocate WQ, do sva_bind_device();
+3. IOMMU driver calls ioasid_alloc(), then bind PASID with device,
+   mmu_notifier_get()
+4. DMA starts by DSA driver userspace
+5. DSA userspace close FD
+6. DSA/uacce kernel driver handles FD.close()
+7. DSA driver stops DMA
+8. DSA driver calls sva_unbind_device();
+9. IOMMU driver does unbind, clears PASID context in IOMMU, flush
+   TLBs. mmu_notifier unregistered. ioasid_free() called
+10. The IOASID is returned to the pool, reclaimed.
+
+Exception happens when process terminates *before* device driver stops
+DMA and call IOMMU driver to unbind. The detailed flow of process
+exits are as follows:
+
+::
+
+   do_exit() {
+	exit_mm() {
+		mm_put();
+		exit_mmap() {
+			intel_invalidate_range() //mmu notifier
+			tlb_finish_mmu()
+			mmu_notifier_release(mm) {
+				intel_mm_release() {
+   				intel_iommu_teardown_pasid();
+                  intel_iommu_flush_tlbs();
+				}
+				// tlb_invalidate_range cb removed
+			}
+			unmap_vmas();
+                        free_pgtables();
+		};
+	}
+	exit_files(tsk) {
+		close_files() {
+			dsa_close();
+   			dsa_stop_dma();
+               intel_svm_unbind_pasid(); //ioasid_free()
+		}
+	}
+   }
+
+Unrecoverable(UR) faults could happen in between mmu_notifier.release call
+and the time driver FDs are closed. However, since the fault processing is
+disabled by the IOMMU driver after PASID entry is torn down, the UR fault
+will never reach the driver.
+
+Guest IOASID Life Cycle (VT-d Example)
+--------------------------------------
+Guest IOASID life cycle starts with guest driver open(), this could be
+uacce or individual accelerator driver such as DSA. At FD open,
+sva_bind_device() is called which triggers a series of actions.
+
+The example below is an illustration of a *normal* life cycle with all
+the SW components represented not all listed.
+
+::
+
+   dev/ioasid   IOASID   VFIO      IOMMU        Consumers¹           Refs²
+   .......................................................................
+   1                               ioasid_reg_notifier()
+   2                                            ioasid_reg_notifier_mm()
+   3 sfd=open()
+   4            set=ioasid_set_alloc()                               0
+   5 ioctl(sfd, ALLOC_PASID)
+   6            hpasid=ioasid_alloc(set)                             1
+                         ioctl(BIND_PGTBL, hpasid)
+   7                               iommu_bind_gpasid(hpasid,gpasid³)
+   8                               ioasid_get(hpasid)                2
+                                   ioasid_in_set(set, hpasid)ᶜʰᵉᶜᵏ ᵖᵉʳᵐ
+   10				 ioasid_attach_data(data->hpasid)
+   11                              ioasid_attach_spid(hpasid,gpasid)
+   12           ioasid_notify(data⁴,BIND)
+                                                -- Actions by KVM ------
+   13						kvm_nb(data,BIND)
+   14						ioasid_get(hpasid)                              3
+   15						PASID_tbl_update()
+   16                                           -- Actions by VDCM -----
+   Guest Programs gPASID for DWQ (No VDCM actions for SWQ)
+   17                                           hpasid=find_by_spid(
+                                                mm,gpasid,get)       4
+   18                                           dev_write(hpasid)
+   19 -------- GUEST STARTS DMA ----------------------------------------
+						vcpu enqcmd work submit
+						guest driver work submit
+   20 -------- GUEST STOPS DMA -----------------------------------------
+                                                -- Actions by KVM ------
+   21						vcpu stop enqcmd()
+                                                -- Actions by VDCM -----
+   22						guest_clear_dwq(mdev)⁵
+   23						ioasid_put(mdev->hpasid)                        3
+                        ioctl(UNBIND_PGTBL, hpasid)
+   24 				      unbind_gpasid(hpasid,gpasid)
+   25            		               iommu_ubind_gpasid(hpasid,gpasid)
+   26				                     ioasid_detach_data(data->hpasid)
+   27                               ioasid_detach_spid(hpasid,gpasid)
+   28           ioasid_notify(data,UNBIND)
+   29						kvm_nb(data,UNBIND)
+   30     					PASID_tbl_update()
+   31                          			ioasid_put(hpasid)            2
+   32         			   ioasid_put()	     		                     1
+   33 ioctl(IOASID_FREE, sfd)
+   34     ioasid_free()                                              0
+   35 close(sfd)
+   36                                                 Reclaimed
+   -------------- New Life Cycle Begin ----------------------------
+
+Notes:
+
+¹ IOASID in-kernel consumers, this can be KVM, device drivers such as
+VDCM host driver. KVM and VDCM examples are listed in the same column
+in the following steps.
+
+² Reference counts of the host IOASID
+
+³ Guest PASIDs are allocated by the VMM. Host IOASID core ensures there is
+no duplicated guest PASIDs in the same IOASID set.
+
+⁴ Notification data of the IOASID_BIND event contains sanitized guest
+and host IOASIDs information
+
+⁵ For the clearing of DWQ, guest PASID is not provided, just zero out
+queue control register.
+
+Exception cases arise when a guest/VMM crashes or a malicious guest
+attempts to cause disruption on the host system. The fault handling
+rules are:
+
+1. IOASID free must *always* succeed.
+2. An inactive period may be required before the freed IOASID is
+   reclaimed. During this period, consumers of IOASID perform cleanup.
+3. Malfunction is limited to the guest owned resources for all
+   programming errors.
+
+VFIO UAPIs service IOASID related calls without the knowledge of the
+IOASID value nor states. Therefore, VFIO is purely a transport which
+does not need to hold references of IOASID nor IOASID set.
+
+KVM PASID Translation Table Updates
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Per VM PASID translation table is maintained by KVM in order to
+support ENQCMD on SWQ in the guest. The table contains host-guest PASID
+translations to be consumed by CPU ucode. The synchronization of the
+PASID states depends on VFIO/IOMMU driver, where IOCTL and atomic
+notifiers are used. KVM must register IOASID notifier per VM instance
+during launch time. IOASID core ensures that IOASID_BIND/UNBIND events
+are symmetric, i.e. there will not be duplicated BIND/UNBIND events.
+Beside BIND/UNBIND events, KVM does not need to listen to any other
+IOASID events.
+
+Rules:
+
+1. Multiple devices can bind with the same PASID, this can be different PCI
+   devices or mdevs within the same PCI device. However, only the
+   *first* BIND and *last* UNBIND emit notifications.
+2. IOASID code is responsible for ensuring the correctness of H-G
+   PASID mapping. There is no need for KVM to validate the
+   notification data.
+3. When UNBIND happens *after* FREE, KVM will see error in
+   ioasid_get() even when the reclaim is not done. IOMMU driver will
+   also avoid sending UNBIND if the PASID is already FREE.
+4. When KVM terminates *before* FREE & UNBIND, references will be
+   dropped for all host PASIDs.
+
+VDCM PASID Programming
+~~~~~~~~~~~~~~~~~~~~~~
+VDCM composes virtual devices and exposes them to the guests. When
+the guest allocates a PASID then program it to the virtual device, VDCM
+intercepts the programming attempt then programs the matching host
+PASID on to the hardware.
+
+Conversely, when a device is going away, VDCM must be informed such
+that PASID context on the hardware can be cleared. There could be
+multiple mdevs assigned to different guests in the same VDCM. Since
+the PASID table is shared at PCI device level, lazy clearing is not
+secure. A malicious guest can attack by using newly freed PASIDs that
+are allocated by another guest.
+
+For SWQ, VDCM is unaware of PASID programming in that it is setup
+between KVM and the IOMMU driver. However, VDCM is still responsible for
+the SWQ PASID teardown due to exceptions. This requires VDCM register
+IOASID notifier per SWQ device on the IOASID set.By holding a reference
+of the PASID until VDCM cleans up the HW context, it is guaranteed that
+PASID life cycles do not cross within the same device.
+
+BACKUP
+======
+For bare metal IOVA, IOASID #0 is used for DMA request without
+PASID. Even though some architectures such as VT-d also offers
+the flexibility of using any PASIDs for DMA request without PASID.
+PASID #0 is reserved and not allocated from any ioasid_set.
+
+Multiple IOVA spaces per device are mapped to auxiliary domains which
+can be used for mediated device assignment with and without a virtual
+IOMMU (vIOMMU). An IOASID is allocated for each auxiliary domain as default
+PASID. Without vIOMMU, default IOASID is used for DMA map/unmap
+APIs. With vIOMMU, default IOASID is used for guest IOVA where DMA
+request with PASID is required for the device. The reason is that
+there is only one PASID #0 per device, e.g. on VT-d, RID_PASID is per PCI
+device.
-- 
2.25.1

