Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 73EBD7D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 27 Sep 2018 09:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbeI0Pn6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Sep 2018 11:43:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35340 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727625AbeI0Pn5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Sep 2018 11:43:57 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.25])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 48C0CA6DFD;
        Thu, 27 Sep 2018 09:26:37 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-205.ams2.redhat.com [10.36.116.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7ACF920154E7;
        Thu, 27 Sep 2018 09:26:32 +0000 (UTC)
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
Subject: [PATCH v3 4/6] powerpc/powernv: hold device_hotplug_lock when calling device_online()
Date:   Thu, 27 Sep 2018 11:25:52 +0200
Message-Id: <20180927092554.13567-5-david@redhat.com>
In-Reply-To: <20180927092554.13567-1-david@redhat.com>
References: <20180927092554.13567-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.25
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 27 Sep 2018 09:26:37 +0000 (UTC)
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
Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 773623f6bfb1..fdd48f1a39f7 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -242,9 +242,11 @@ static int memtrace_online(void)
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

