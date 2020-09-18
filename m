Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D102C43464
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 05:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEC04208C3
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 05:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FcQ2fIGf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgIRFr6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 01:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgIRFr6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Sep 2020 01:47:58 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B79DC06174A;
        Thu, 17 Sep 2020 22:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=/Ig+sSXUy2MIXCWJ27f9BUyjjjQ2x5GFRXzVOicO27w=; b=FcQ2fIGfZRZ90UPtRhtzKKpqxf
        eimfHcQvlDQ+0YBvaZNc9Wua2RK4I0nX752JvZF1QWRtAtWBQ2DgC3cgvFM/fK2LniKxhB/8FWKqr
        awU3bH+Bhq0wt6Fvz8iynn1Rlu77pxbY6D7zfXNPNPMmgV0HzzVHcaleFpNPVO5fcc9Bh61XWBQSd
        IrDqNypvOc97J2ENJqsAHG9mE+2tDknwqrERjP+gztGFJP5UZaZg7tkh/b5cPmTLNsn00qAJAt4AP
        Tla2KtfdoIUAV9SaexEFeDZ59Uba8v95mfGU7m8JhTPG4JLuq1xos0GfTW8OB6u3fj4iIfVR5AH3R
        v+OsOnow==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJ9FT-00029W-NF; Fri, 18 Sep 2020 05:47:56 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/admin-guide: kernel-parameters: fix "io7" parameter description
Date:   Thu, 17 Sep 2020 22:47:51 -0700
Message-Id: <20200918054751.6538-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix punctuation and capitalization for the "io7" boot parameter.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/kernel-parameters.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200917.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20200917/Documentation/admin-guide/kernel-parameters.txt
@@ -1973,7 +1973,7 @@
 			1 - Bypass the IOMMU for DMA.
 			unset - Use value of CONFIG_IOMMU_DEFAULT_PASSTHROUGH.
 
-	io7=		[HW] IO7 for Marvel based alpha systems
+	io7=		[HW] IO7 for Marvel-based Alpha systems
 			See comment before marvel_specify_io7 in
 			arch/alpha/kernel/core_marvel.c.
 
