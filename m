Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7626C54EAA
	for <linux-doc@archiver.kernel.org>; Fri, 27 Jan 2023 06:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbjA0Gkm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Jan 2023 01:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbjA0GkZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 01:40:25 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743EC74482;
        Thu, 26 Jan 2023 22:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=huJh30wXrIqcWBSOL1vocAnzpHcHtfTmbim5FCg9IpA=; b=F8r6qThdjsmRVJtRP699tDAgbI
        OyM7xl8oc9U4Zg2f/8dSkwBi1Up7WBuDiYSPAf47+2UqMjpfjIc3x8cxblNIGhzMqtei4mky0FOcY
        Z8h5t77F1fnrWtDKnRE6pmCdUTUpFOWvrQj6adcmwcxGGwGo3niaumkFkcJdxhfw+fBdK+rII3u53
        /Uwch8GBHRAxjIWrjIjFyg11lOdaM1DxrnmnePLYMVuiLV+K4byqxQH/H1z3NleI+G/uTC8lcdHM6
        z37De5ibRgkMW4S1h8MUFfIrbQhqA0bPHsLf5HIEFPMFl8x27QSUkGM1h6Aq3qsw6wWviorQNXUNG
        QgXB7u3Q==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pLIPP-00DM0u-HH; Fri, 27 Jan 2023 06:40:23 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 29/35] Documentation: timers: correct spelling
Date:   Thu, 26 Jan 2023 22:39:59 -0800
Message-Id: <20230127064005.1558-30-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127064005.1558-1-rdunlap@infradead.org>
References: <20230127064005.1558-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct spelling problems for Documentation/timers/ as reported
by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/timers/hrtimers.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/Documentation/timers/hrtimers.rst b/Documentation/timers/hrtimers.rst
--- a/Documentation/timers/hrtimers.rst
+++ b/Documentation/timers/hrtimers.rst
@@ -148,7 +148,7 @@ a given clock has - be it low-res, high-
 hrtimers - testing and verification
 -----------------------------------
 
-We used the high-resolution clock subsystem ontop of hrtimers to verify
+We used the high-resolution clock subsystem on top of hrtimers to verify
 the hrtimer implementation details in praxis, and we also ran the posix
 timer tests in order to ensure specification compliance. We also ran
 tests on low-resolution clocks.
