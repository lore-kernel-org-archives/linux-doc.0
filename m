Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30AD342C8A
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058862; cv=none; b=oJhWBks8J53wq63EoRHSvJeTTrKXXYBNJaBBam64bwpD2Fx2snvhf3KrNkj/PbCX04opUp4aFyi76lA82ELb/SmKb5FaLscyKMHa32T+l7IvfAYGhlKu3zUS1IMr+14+5JhAiPudhnm2wFjPvSYGctsqGS8tCRwqElVQhb1+KSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058862; c=relaxed/simple;
	bh=UwyM5R0KhWLgF6qfrYdIVk7mDfPJ06uK23mjZEGNIoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uISb6rOs4/E+OXICJwwBNTxhGvWKlTQ7nhjKNeTulNdC5sq7EhBD0KABJhdBmdvqbrQv1klP20IONlPltvhj38168sQJ0xAZjfTXCKgTRzS3NcA2JxjVg68qLiaxAbP4e2JFEOzSUqT53Cx46hcdOXue4TmSga9mJwMba93igLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HIbUyI/2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HIbUyI/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IxeaoFY2Zid2XlBwuhP3Cbqf0hU6HwUeKjXEu5WpZgc=;
	b=HIbUyI/26ixQ9eq6ff6KyoKaFwe6okwfg9cX6SaD2ZPBQzOTLHkAnmchQ8WmqBd/u2Ns44
	6fGqThNdiOYPBOE4+Xb0ZgFV2F6NIBX0+qZvXLqvsyCprKaKIQYKBNDP9SRPYwUw4BNV1Z
	UbIMsMN55cbIvdzbHmwKi8//Yc5PPJI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-aYNkhCKqNJWQPbXTn14kdA-1; Tue, 21 Oct 2025 11:00:57 -0400
X-MC-Unique: aYNkhCKqNJWQPbXTn14kdA-1
X-Mimecast-MFC-AGG-ID: aYNkhCKqNJWQPbXTn14kdA_1761058855
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-471168953bdso41190185e9.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 08:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058855; x=1761663655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxeaoFY2Zid2XlBwuhP3Cbqf0hU6HwUeKjXEu5WpZgc=;
        b=E2x9ri4c6B+d6dxISAyFBRLpE82JLbjx3Rmzu2Fv9Tkn2Dbwzeahw2+5+bQxsjxKRi
         yWf1MvN6ywK+E5lBK15XeCVdqEQyKSMqvxSdlKm5S/moubM01UkA2VvM1ujIQwGrq0Vo
         pxCIg+L8KOAKFZbvSy5JY2euMcID4VjCGVuDkMnTEyS6pqnZpRjE6pbfMbhEf2KhTr+9
         FLmR7OORvvzfUvqzLPPobs6mKWUKZcXgs9V2cr7SnZHXr+LqJlEHyncgdSRaomk6gpG8
         1d221cDJpS8YhMcj0HQueH3kS1H2ReJlEfhy9PebcZP0pS4S69WdeXAVMZjt5eRCb781
         MQ7w==
X-Forwarded-Encrypted: i=1; AJvYcCXQpn8VZdue0wiUANK0mwkxJ9xOt8fTEBvyUQ9QVwMnYco2ws1bG0m0vXJgZsH9sphLK4X6vH2Gcu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuephuZImUim0B8Gv55M/nxlYh3FcphQa9uy/xWBv3/teHMxwv
	u/PTV4Xi2f37KeY+cWJhU5RC9bk82n5P1eYNRBiuogXbcbRiwFzA9WDxM0G5ZGJh2eQ3hVqRrdY
	s6L4b3mkbbJTF+c1bseJ/jOgYsQAwG+QYYPFy/CBN+5Gr+bKjYXtoDmcaQe+htA==
X-Gm-Gg: ASbGncvQ4RddK4LuRH4gjELNLbChEqYB7kJtUWjsFBsmHGolt8CDkLiMcK6suEtodK9
	xcfU4zzUHGD4qeUvsChYHm+0qmbESXBRKoAZoDYGgFNExtF88r2tYxIjUUCTSt3/nixk5FUwbxT
	oJ3e+eR7mQjkKRdwMdvONn0ObBrBYhj5/hG5ePQCE5Dk4pFhqa2SQs2IEkrCoPv9qMmdPKhZlfJ
	ZWV+jjcIaWBp6qzj6MGnGts8ZyYXcC9voKeDIPlGJW9bBjsqtu1eNHbgYYZNYzk9mB1k1rn/gav
	Lil+bWoQ2uB58x7ebncWfYA0tkB5Y7dCdzRQBi+/rDH4y1Iy6mqif/P7zOntHubj/TPUIVLbhW/
	QFXQdY9btHoPrskqhdkr7Kn3Gv8TaoRHtAhHSvDKv7HeBUAIQ7Maydu5ClJ+c
X-Received: by 2002:a05:600c:6d87:b0:46f:cdfe:cd39 with SMTP id 5b1f17b1804b1-475c3ee145emr177155e9.16.1761058855004;
        Tue, 21 Oct 2025 08:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTNQTiGz5xAhZ5fsddDZjV1qS7LKojQZq7D4oRaNBiv/doXb8XOAkbt7nBaFlt+DyqmCX9Sw==
X-Received: by 2002:a05:600c:6d87:b0:46f:cdfe:cd39 with SMTP id 5b1f17b1804b1-475c3ee145emr176645e9.16.1761058854422;
        Tue, 21 Oct 2025 08:00:54 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144c82b8sm285435185e9.15.2025.10.21.08.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:53 -0700 (PDT)
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
Subject: [PATCH v1 22/23] mm: rename CONFIG_MEMORY_BALLOON -> CONFIG_BALLOON
Date: Tue, 21 Oct 2025 17:00:39 +0200
Message-ID: <20251021150040.498160-6-david@redhat.com>
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

Let's make it consistent with the naming of the files but also with the
naming of CONFIG_BALLOON_MIGRATION.

While at it, add a "/* CONFIG_BALLOON */".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/Kconfig | 2 +-
 drivers/misc/Kconfig                   | 2 +-
 drivers/virtio/Kconfig                 | 2 +-
 include/linux/vm_event_item.h          | 4 ++--
 mm/Kconfig                             | 4 ++--
 mm/Makefile                            | 2 +-
 mm/vmstat.c                            | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 3e042218d6cd8..f7052b131a4c5 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -120,7 +120,7 @@ config PPC_SMLPAR
 config CMM
 	tristate "Collaborative memory management"
 	depends on PPC_SMLPAR
-	select MEMORY_BALLOON
+	select BALLOON
 	default y
 	help
 	  Select this option, if you want to enable the kernel interface
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index b9c11f67315f0..47da8dfcffc2b 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -411,7 +411,7 @@ config DS1682
 config VMWARE_BALLOON
 	tristate "VMware Balloon Driver"
 	depends on VMWARE_VMCI && X86 && HYPERVISOR_GUEST
-	select MEMORY_BALLOON
+	select BALLOON
 	help
 	  This is VMware physical memory management driver which acts
 	  like a "balloon" that can be inflated to reclaim physical pages
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 6db5235a7693d..ce5bc0d9ea287 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -112,7 +112,7 @@ config VIRTIO_PMEM
 config VIRTIO_BALLOON
 	tristate "Virtio balloon driver"
 	depends on VIRTIO
-	select MEMORY_BALLOON
+	select BALLOON
 	select PAGE_REPORTING
 	help
 	 This driver supports increasing and decreasing the amount
diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index fca34d3473b6b..22a139f82d75f 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -122,13 +122,13 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		THP_SWPOUT,
 		THP_SWPOUT_FALLBACK,
 #endif
-#ifdef CONFIG_MEMORY_BALLOON
+#ifdef CONFIG_BALLOON
 		BALLOON_INFLATE,
 		BALLOON_DEFLATE,
 #ifdef CONFIG_BALLOON_MIGRATION
 		BALLOON_MIGRATE,
 #endif /* CONFIG_BALLOON_MIGRATION */
-#endif
+#endif /* CONFIG_BALLOON */
 #ifdef CONFIG_DEBUG_TLBFLUSH
 		NR_TLB_REMOTE_FLUSH,	/* cpu tried to flush others' tlbs */
 		NR_TLB_REMOTE_FLUSH_RECEIVED,/* cpu received ipi for flush */
diff --git a/mm/Kconfig b/mm/Kconfig
index c058a65080d1e..73e352bb82653 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -593,7 +593,7 @@ config SPLIT_PMD_PTLOCKS
 
 #
 # support for memory balloon
-config MEMORY_BALLOON
+config BALLOON
 	bool
 
 #
@@ -601,7 +601,7 @@ config MEMORY_BALLOON
 config BALLOON_MIGRATION
 	bool "Allow for balloon memory migration"
 	default y
-	depends on MIGRATION && MEMORY_BALLOON
+	depends on MIGRATION && BALLOON
 	help
 	  Allow for migration of pages inflated in a memory balloon such that
 	  they can be allocated from memory areas only available for movable
diff --git a/mm/Makefile b/mm/Makefile
index ab012157b5109..315aec23d78f5 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -121,7 +121,7 @@ obj-$(CONFIG_CMA)	+= cma.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
 obj-$(CONFIG_NUMA_EMU) += numa_emulation.o
-obj-$(CONFIG_MEMORY_BALLOON) += balloon.o
+obj-$(CONFIG_BALLOON) += balloon.o
 obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
 obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 8843a8c4914c4..542378df0bf75 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1431,13 +1431,13 @@ const char * const vmstat_text[] = {
 	[I(THP_SWPOUT)]				= "thp_swpout",
 	[I(THP_SWPOUT_FALLBACK)]		= "thp_swpout_fallback",
 #endif
-#ifdef CONFIG_MEMORY_BALLOON
+#ifdef CONFIG_BALLOON
 	[I(BALLOON_INFLATE)]			= "balloon_inflate",
 	[I(BALLOON_DEFLATE)]			= "balloon_deflate",
 #ifdef CONFIG_BALLOON_MIGRATION
 	[I(BALLOON_MIGRATE)]			= "balloon_migrate",
 #endif /* CONFIG_BALLOON_MIGRATION */
-#endif /* CONFIG_MEMORY_BALLOON */
+#endif /* CONFIG_BALLOON */
 #ifdef CONFIG_DEBUG_TLBFLUSH
 	[I(NR_TLB_REMOTE_FLUSH)]		= "nr_tlb_remote_flush",
 	[I(NR_TLB_REMOTE_FLUSH_RECEIVED)]	= "nr_tlb_remote_flush_received",
-- 
2.51.0

