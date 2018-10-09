Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 194867D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Oct 2018 10:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbeJISLW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Oct 2018 14:11:22 -0400
Received: from mx2.suse.de ([195.135.220.15]:44020 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726721AbeJISLD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 9 Oct 2018 14:11:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 001CBAE41;
        Tue,  9 Oct 2018 10:54:40 +0000 (UTC)
From:   Juergen Gross <jgross@suse.com>
To:     linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-doc@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        corbet@lwn.net, boris.ostrovsky@oracle.com,
        Juergen Gross <jgross@suse.com>, stable@vger.kernel.org
Subject: [PATCH v4 1/3] x86/xen: fix boot loader version reported for pvh guests
Date:   Tue,  9 Oct 2018 12:54:35 +0200
Message-Id: <20181009105437.5471-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20181009105437.5471-1-jgross@suse.com>
References: <20181009105437.5471-1-jgross@suse.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The boot loader version reported via sysfs is wrong in case of the
kernel being booted via the Xen PVH boot entry. it should be 2.12
(0x020c), but it is reported to be 2.18 (0x0212).

As the current way to set the version is error prone use the more
readable variant (2 << 8) | 12.

Cc: <stable@vger.kernel.org> # 4.12
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pvh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index c85d1a88f476..f7f77023288a 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -75,7 +75,7 @@ static void __init init_pvh_bootparams(void)
 	 * Version 2.12 supports Xen entry point but we will use default x86/PC
 	 * environment (i.e. hardware_subarch 0).
 	 */
-	pvh_bootparams.hdr.version = 0x212;
+	pvh_bootparams.hdr.version = (2 << 8) | 12;
 	pvh_bootparams.hdr.type_of_loader = (9 << 4) | 0; /* Xen loader */
 
 	x86_init.acpi.get_root_pointer = pvh_get_root_pointer;
-- 
2.16.4

