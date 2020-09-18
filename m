Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C613C43464
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 05:09:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC11821D20
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 05:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TThGQDFJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgIRFJZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 01:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIRFJZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Sep 2020 01:09:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A773C06174A;
        Thu, 17 Sep 2020 22:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=HLnh6iIbj00ze0CKUC639F6G3ECBVRfFGlYq7QMKuHE=; b=TThGQDFJWhzjXo2wJWwNttrw4S
        IwZWjyPvlXz8W+XCgkp+vyTwB8GMdIo94tFBzFfwtKQT95T9bni85Go/ht/skyUocZ0pl3wXH2egD
        v+F0Ol+8vElRwqWsTa4Yis1hnkoy5cdmivAe3xqykMq3fYLg+Dc1WZiUL7vR3733pZEu/tEqJlR8v
        QKE5e6hZK1APz0L458SAUgk4L0V239N76SIoguqhXF279eLqnUyYQ7ySNRaLity7cLwSlvLZS+aAf
        hVAAXnAGxB13TfyL2VI4tn9Ktu53K0T8gYtr1F2AQOspGW3lAzSxwLOGffglmaxu6jqy4WDQl9GSB
        HRubsZog==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJ8eA-0004xv-DB; Fri, 18 Sep 2020 05:09:22 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: admin-guide: reformat "lapic=" boot option
Date:   Thu, 17 Sep 2020 22:09:18 -0700
Message-Id: <20200918050918.518-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reformat "lapic=" to try to make it more understandable and similar
to the style that is mostly used in this file.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/kernel-parameters.txt |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20200917.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20200917/Documentation/admin-guide/kernel-parameters.txt
@@ -2384,9 +2384,10 @@
 	lapic		[X86-32,APIC] Enable the local APIC even if BIOS
 			disabled it.
 
-	lapic=		[X86,APIC] "notscdeadline" Do not use TSC deadline
+	lapic=		[X86,APIC] Do not use TSC deadline
 			value for LAPIC timer one-shot implementation. Default
 			back to the programmable timer unit in the LAPIC.
+			Format: notscdeadline
 
 	lapic_timer_c2_ok	[X86,APIC] trust the local apic timer
 			in C2 power state.
