Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5BA247DE7E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Sep 2018 11:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbeIRRVN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Sep 2018 13:21:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45822 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728657AbeIRRVM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 18 Sep 2018 13:21:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A2498356E5;
        Tue, 18 Sep 2018 11:48:58 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-248.ams2.redhat.com [10.36.116.248])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C688217101;
        Tue, 18 Sep 2018 11:48:55 +0000 (UTC)
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
Subject: [PATCH v1 4/6] powerpc/powernv: hold device_hotplug_lock when calling device_online()
Date:   Tue, 18 Sep 2018 13:48:20 +0200
Message-Id: <20180918114822.21926-5-david@redhat.com>
In-Reply-To: <20180918114822.21926-1-david@redhat.com>
References: <20180918114822.21926-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 18 Sep 2018 11:48:58 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

device_online() should be called with device_hotplug_lock() held.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>
Cc: Michael Neuling <mikey@neuling.org>
Reviewed-by: Pavel Tatashin <pavel.tatashin@microsoft.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 8f1cd4f3bfd5..ef7181d4fe68 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -229,9 +229,11 @@ static int memtrace_online(void)
 		 * we need to online the memory ourselves.
 		 */
 		if (!memhp_auto_online) {
+			lock_device_hotplug();
 			walk_memory_range(PFN_DOWN(ent->start),
 					  PFN_UP(ent->start + ent->size - 1),
 					  NULL, online_mem_block);
+			unlock_device_hotplug();
 		}
 
 		/*
-- 
2.17.1

