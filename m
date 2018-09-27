Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55E017D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 27 Sep 2018 09:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbeI0PoB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Sep 2018 11:44:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35370 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727625AbeI0PoA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Sep 2018 11:44:00 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.25])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id DD78A30039BC;
        Thu, 27 Sep 2018 09:26:40 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-205.ams2.redhat.com [10.36.116.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A85BE20154E7;
        Thu, 27 Sep 2018 09:26:37 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-mm@kvack.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
        xen-devel@lists.xenproject.org, devel@linuxdriverproject.org,
        David Hildenbrand <david@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rashmica Gupta <rashmica.g@gmail.com>,
        Balbir Singh <bsingharora@gmail.com>,
        Michael Neuling <mikey@neuling.org>
Subject: [PATCH v3 5/6] powerpc/powernv: hold device_hotplug_lock when calling memtrace_offline_pages()
Date:   Thu, 27 Sep 2018 11:25:53 +0200
Message-Id: <20180927092554.13567-6-david@redhat.com>
In-Reply-To: <20180927092554.13567-1-david@redhat.com>
References: <20180927092554.13567-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.25
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 27 Sep 2018 09:26:41 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Let's perform all checking + offlining + removing under
device_hotplug_lock, so nobody can mess with these devices via
sysfs concurrently.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>
Cc: Michael Neuling <mikey@neuling.org>
Reviewed-by: Pavel Tatashin <pavel.tatashin@microsoft.com>
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Acked-by: Balbir Singh <bsingharora@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index fdd48f1a39f7..84d038ed3882 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -70,6 +70,7 @@ static int change_memblock_state(struct memory_block *mem, void *arg)
 	return 0;
 }
 
+/* called with device_hotplug_lock held */
 static bool memtrace_offline_pages(u32 nid, u64 start_pfn, u64 nr_pages)
 {
 	u64 end_pfn = start_pfn + nr_pages - 1;
@@ -110,6 +111,7 @@ static u64 memtrace_alloc_node(u32 nid, u64 size)
 	/* Trace memory needs to be aligned to the size */
 	end_pfn = round_down(end_pfn - nr_pages, nr_pages);
 
+	lock_device_hotplug();
 	for (base_pfn = end_pfn; base_pfn > start_pfn; base_pfn -= nr_pages) {
 		if (memtrace_offline_pages(nid, base_pfn, nr_pages) == true) {
 			/*
@@ -118,7 +120,6 @@ static u64 memtrace_alloc_node(u32 nid, u64 size)
 			 * we never try to remove memory that spans two iomem
 			 * resources.
 			 */
-			lock_device_hotplug();
 			end_pfn = base_pfn + nr_pages;
 			for (pfn = base_pfn; pfn < end_pfn; pfn += bytes>> PAGE_SHIFT) {
 				__remove_memory(nid, pfn << PAGE_SHIFT, bytes);
@@ -127,6 +128,7 @@ static u64 memtrace_alloc_node(u32 nid, u64 size)
 			return base_pfn << PAGE_SHIFT;
 		}
 	}
+	unlock_device_hotplug();
 
 	return 0;
 }
-- 
2.17.1

