Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D6FC54EBE
	for <linux-doc@archiver.kernel.org>; Sun,  8 Jan 2023 21:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236119AbjAHVhZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Jan 2023 16:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234052AbjAHVhE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Jan 2023 16:37:04 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9C52DF8;
        Sun,  8 Jan 2023 13:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=4qsZ9wzkXLk6pUGuDgw5aL2USVk+ASQRr7XqPZCah3I=; b=cECacXzcfkL0IOyePstbJOuK4o
        FQR1KdzUbs8QOklVKv6hOVpHyr/9M8BcMZ2/I63/DZi7fdmntq05El/JP+zfmnU9oRSK3cFQZ5Lxj
        A1h335pEFAG4uqVjvEVkFXgzQNv3feiS5Nlrn444ZF2LZ/uUaSOkhA//vWjfynHHFlMhNN9J5J+Gs
        kut5BevRJFD47HjBmrDt9krrMcI91VwupLnKkIsEa6pj+BnV7PHpz/H4IKCSTdjaybLma9TMOecYJ
        h5Hv86X2PaoJpYdfMY2GhM5ZYLKiAYi1tP1/9Cx2jPl+8V246wqb7P1J21savgg8MFD/6PIAdMSLg
        6rKSbqHQ==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pEdLh-00Fu8o-6I; Sun, 08 Jan 2023 21:37:01 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] x86/retbleed: add "stuff" mode admin documentation
Date:   Sun,  8 Jan 2023 13:37:00 -0800
Message-Id: <20230108213700.5703-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add admin documentation for "retbleed=stuff", based on commit
description and source code.

Fixes: d82a0345cf21 ("x86/retbleed: Add call depth tracking mitigation")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/kernel-parameters.txt |    8 ++++++++
 1 file changed, 8 insertions(+)

diff -- a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5364,6 +5364,14 @@
 				       when STIBP is not available. This is
 				       the alternative for systems which do not
 				       have STIBP.
+			stuff        - Enables "stuffing" mode mitigation,
+				       which uses return thunking and call depth
+				       tracking.  Only if effect if
+				       CONFIG_CALL_DEPTH_TRACKING is set and
+				       Spectre V2 mitigation mode is
+				       "retpoline".
+				       IBRS is fully secure mitigation but is
+				       more costly (slower) than stuffing.
 			unret        - Force enable untrained return thunks,
 				       only effective on AMD f15h-f17h based
 				       systems.
