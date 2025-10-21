Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DC2341AB1
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058853; cv=none; b=W/+KjSEczfH08vL2XPdzSKNL2zlwcPkbGyoOZdlwEV5wyR4y2qcY3cAH1KFBT5auPf0fuApj9UBevBJJUe1+/4z7hVkM8Lw65vlGnYllt7YfDg10iKf8eW8CUn8J0TMe2a7S0Nxr8BjpTltrvFktDFGzKcmbnPLAERI+LlLxZ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058853; c=relaxed/simple;
	bh=ptuaLzDjZgkWF1wvDAN8KY/453EoHUcLMwhjUdNpArU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7KCt8Eof6JBWKfopWCOXAdPIEEYMcUyX8zvsxrsQVyBD8DDynMOJCIJbVN68gFPASLy52LVbTCRFawuIYER3fN4hq8eXLbhA8OdvI60s51lT66nzv4IocAWRQVxZFcgZv3Gyth9KX6nFtlglgDS8f+EA7+i9jq547Z2M+7XyoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJj3rObL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJj3rObL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WXJD5DBTOSdH4OFa5cGG6Bl5vxCoyITjfVMpwdlj+A=;
	b=TJj3rObLoZgVC/7QhxUQD85N6mptPcdzk+nfl6mGo6pVl4iw14d3o9RWf+dIwD4DpdfEVk
	WWD6jIC6//wtMiFRpWRSApICdOabEzjli52EnqJDwspHoVxLNkOnVxYSBvjeFNnxijZqfa
	fniOO/lZTOBm6X9be19EDUVpaqkjxC8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-ARJePfEBO2aALrTXcrfSLg-1; Tue, 21 Oct 2025 11:00:49 -0400
X-MC-Unique: ARJePfEBO2aALrTXcrfSLg-1
X-Mimecast-MFC-AGG-ID: ARJePfEBO2aALrTXcrfSLg_1761058848
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4283bf5b764so1858817f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 08:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058848; x=1761663648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WXJD5DBTOSdH4OFa5cGG6Bl5vxCoyITjfVMpwdlj+A=;
        b=CdfFdCzENyi2bULRiCgelhanxZYh9MTl8wCTdBJymWiJKf+9VzglYARZUR7DwpLloB
         q2fxPZDs9jBJEtPFC4PXKbfXWQhicCbALebe15h0/8eZWs/rVAbLVjFTHC0wNswS7O7o
         LhckQKykX7McgGMJNk/gHG0PVE9pHNMrDcFjgfYnSy3Pxxrdt4e6pcJzaZUyZWvr3qSa
         MteP/2Dsti8OsQtyGRKsEVE+TUVo47QGiBl4HteguhSbBcY/Ui6lR0oIOVB2Bbcb8d7g
         n2XYkpsHtrnqqmg6pkMGiYnwZ+X5kYMBEHxN8HEs6cgJjP7/UKAyQWGkK37tiWMX9rQx
         Pqpg==
X-Forwarded-Encrypted: i=1; AJvYcCWHI2URIzPY1ZR21AzcBxypNI2HTTY8zm6SlY0rOueu/s7+otsSxGFN0BcbDvqpoqmsu3KZqOVFsfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5IR6MIWH8FtmQ6XgTOl3s8MEh/edl6UAB5Y5g3HDAuf4IUcVa
	QG4FnFszjBCbSJBzvJRK32WZVptC4kwoisAcmn92VrZEuWyuKw33Pi2qHDlE3cW9/tl5RDnzkjC
	U+WbsfYlhvrezV6x3LkLNj2LwSW/4TSiTFVKr6AqTRocp0TRPyAuWRrULzI8mFQ==
X-Gm-Gg: ASbGnctlN4LBZg78j/1GqkRZ+IfT4OvdYAvTriBoCtWXrIch4VpEoeQ98pHjZBu5h5R
	d5EoxttQXy02RIHqcXSO90lPyy3rxVnfYlq5kBFEtgKuXCNozDZdSJqt66zNMf0FyT60VF52Ub4
	9z2iuEaJ7LaqUi1CiBh+uPFFBpkNSV0OSCjzNeqe8z/QjPD4oS4LgtiMjk1wsynaY2K5YLxVOl0
	dclSDQ7NlAqNjij7J8bvFQw3U1MeytLtTleDHzmeBWLEIHQzNQ/Y0+PFSBMpqMn0NMuQDjY4BZX
	/vBRT/20WjBNNh37wJHyrZ6GFWXzQrmy/No4PvAvkB7ZnD73+YzPxJ+qJaXVobYrEYlnTzzBs9b
	TyGD3Mj7tG+lMgoI6+I6n6Fe2M65FlPmuVEPyXb6GbfWvYaTtY7eS5282YDMz
X-Received: by 2002:a05:600c:4e89:b0:46f:b42e:e392 with SMTP id 5b1f17b1804b1-47117931c1dmr117960535e9.39.1761058848064;
        Tue, 21 Oct 2025 08:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDebz8te/SdK4RMl9FXThAzS3UlvHbYsiUZ1AXYYoG1U9LkInArDMPFE9fh7553nINZVhlvg==
X-Received: by 2002:a05:600c:4e89:b0:46f:b42e:e392 with SMTP id 5b1f17b1804b1-47117931c1dmr117959965e9.39.1761058847485;
        Tue, 21 Oct 2025 08:00:47 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144b5c91sm283508025e9.11.2025.10.21.08.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:47 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 19/23] mm: rename balloon_compaction.(c|h) to balloon.(c|h)
Date: Tue, 21 Oct 2025 17:00:36 +0200
Message-ID: <20251021150040.498160-3-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021150040.498160-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021150040.498160-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even without CONFIG_BALLOON_COMPACTION this infrastructure implements
basic list and page management for a memory balloon.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/core-api/mm-api.rst                 |  2 +-
 MAINTAINERS                                       |  4 ++--
 arch/powerpc/platforms/pseries/cmm.c              |  2 +-
 drivers/misc/vmw_balloon.c                        |  2 +-
 drivers/virtio/virtio_balloon.c                   |  2 +-
 include/linux/{balloon_compaction.h => balloon.h} | 11 +++++------
 mm/Makefile                                       |  2 +-
 mm/{balloon_compaction.c => balloon.c}            |  7 +++----
 8 files changed, 15 insertions(+), 17 deletions(-)
 rename include/linux/{balloon_compaction.h => balloon.h} (92%)
 rename mm/{balloon_compaction.c => balloon.c} (98%)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index 68193a4cfcf52..aabdd3cba58e8 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -130,5 +130,5 @@ More Memory Management Functions
 .. kernel-doc:: mm/vmscan.c
 .. kernel-doc:: mm/memory_hotplug.c
 .. kernel-doc:: mm/mmu_notifier.c
-.. kernel-doc:: mm/balloon_compaction.c
+.. kernel-doc:: mm/balloon.c
 .. kernel-doc:: mm/huge_memory.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e..878e53d0f65ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27062,9 +27062,9 @@ M:	David Hildenbrand <david@redhat.com>
 L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/virtio/virtio_balloon.c
-F:	include/linux/balloon_compaction.h
+F:	include/linux/balloon.h
 F:	include/uapi/linux/virtio_balloon.h
-F:	mm/balloon_compaction.c
+F:	mm/balloon.c
 
 VIRTIO BLOCK AND SCSI DRIVERS
 M:	"Michael S. Tsirkin" <mst@redhat.com>
diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 9ed71683ae402..c5aee15e192ea 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -19,7 +19,7 @@
 #include <linux/stringify.h>
 #include <linux/swap.h>
 #include <linux/device.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 #include <asm/firmware.h>
 #include <asm/hvcall.h>
 #include <asm/mmu.h>
diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 53e9335b6718c..7fd3f709108c2 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -29,7 +29,7 @@
 #include <linux/rwsem.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 #include <linux/vmw_vmci_defs.h>
 #include <linux/vmw_vmci_api.h>
 #include <asm/hypervisor.h>
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 4b22de6a5f845..5434a7739d588 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -13,7 +13,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 #include <linux/oom.h>
 #include <linux/wait.h>
 #include <linux/mm.h>
diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon.h
similarity index 92%
rename from include/linux/balloon_compaction.h
rename to include/linux/balloon.h
index 7757e0e314fdb..82585542300d6 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon.h
@@ -1,8 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * include/linux/balloon_compaction.h
- *
- * Common interface definitions for making balloon pages movable by compaction.
+ * Common interface for implementing a memory balloon, including support
+ * for migration of pages inflated in a memory balloon.
  *
  * Balloon page migration makes use of the general "movable_ops page migration"
  * feature.
@@ -35,8 +34,8 @@
  *
  * Copyright (C) 2012, Red Hat, Inc.  Rafael Aquini <aquini@redhat.com>
  */
-#ifndef _LINUX_BALLOON_COMPACTION_H
-#define _LINUX_BALLOON_COMPACTION_H
+#ifndef _LINUX_BALLOON_H
+#define _LINUX_BALLOON_H
 #include <linux/pagemap.h>
 #include <linux/page-flags.h>
 #include <linux/migrate.h>
@@ -75,4 +74,4 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 	balloon->migratepage = NULL;
 	balloon->adjust_managed_page_count = false;
 }
-#endif /* _LINUX_BALLOON_COMPACTION_H */
+#endif /* _LINUX_BALLOON_H */
diff --git a/mm/Makefile b/mm/Makefile
index 21abb33535501..ab012157b5109 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -121,7 +121,7 @@ obj-$(CONFIG_CMA)	+= cma.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
 obj-$(CONFIG_NUMA_EMU) += numa_emulation.o
-obj-$(CONFIG_MEMORY_BALLOON) += balloon_compaction.o
+obj-$(CONFIG_MEMORY_BALLOON) += balloon.o
 obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
 obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
diff --git a/mm/balloon_compaction.c b/mm/balloon.c
similarity index 98%
rename from mm/balloon_compaction.c
rename to mm/balloon.c
index f41e4a179a431..5734dae81e318 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon.c
@@ -1,15 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * mm/balloon_compaction.c
- *
- * Common interface for making balloon pages movable by compaction.
+ * Common interface for implementing a memory balloon, including support
+ * for migration of pages inflated in a memory balloon.
  *
  * Copyright (C) 2012, Red Hat, Inc.  Rafael Aquini <aquini@redhat.com>
  */
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/export.h>
-#include <linux/balloon_compaction.h>
+#include <linux/balloon.h>
 
 /*
  * Lock protecting the balloon_dev_info of all devices. We don't really
-- 
2.51.0

