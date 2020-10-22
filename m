Return-Path: <SRS0=90uN=D5=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC76C388F2
	for <linux-doc@archiver.kernel.org>; Thu, 22 Oct 2020 09:49:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 199E42245F
	for <linux-doc@archiver.kernel.org>; Thu, 22 Oct 2020 09:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ntkw3Oa1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896183AbgJVJtZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Oct 2020 05:49:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:48990 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896143AbgJVJtN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Oct 2020 05:49:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1603360151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Crg06KGGfBCWdVR6siqyRllme38SLEsgnrcw++z2EXs=;
        b=ntkw3Oa1P44/sgDd0FbtwXok4p2xU0vrbQGLG4PPE9rd1nOYQw27Ptor1TwPnXkxR18tKM
        ry1Zlp/JBcMLyM9Aux5JT3P9ciKA7Tdnn+EJKLeFFQV6SrPeC5bYYGXpA2ToqOzp4trx4+
        93O6GQYNhH18xBfwGqp33Jge1+eOrf0=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2A7AAAE3B;
        Thu, 22 Oct 2020 09:49:11 +0000 (UTC)
From:   Juergen Gross <jgross@suse.com>
To:     xen-devel@lists.xenproject.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Juergen Gross <jgross@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 5/5] Documentation: add xen.fifo_events kernel parameter description
Date:   Thu, 22 Oct 2020 11:49:07 +0200
Message-Id: <20201022094907.28560-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201022094907.28560-1-jgross@suse.com>
References: <20201022094907.28560-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel boot parameter xen.fifo_events isn't listed in
Documentation/admin-guide/kernel-parameters.txt. Add it.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 02d4adbf98d2..526d65d8573a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5978,6 +5978,13 @@
 			After which time (jiffies) the event handling loop
 			should start to delay EOI handling. Default is 2.
 
+	xen.fifo_events=	[XEN]
+			Boolean parameter to disable using fifo event handling
+			even if available. Normally fifo event handling is
+			preferred over the 2-level event handling, as it is
+			fairer and the number of possible event channels is
+			much higher. Default is on (use fifo events).
+
 	nopv=		[X86,XEN,KVM,HYPER_V,VMWARE]
 			Disables the PV optimizations forcing the guest to run
 			as generic guest with no PV drivers. Currently support
-- 
2.26.2

