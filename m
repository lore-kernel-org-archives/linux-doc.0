Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7190E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Sep 2019 07:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730246AbfIQHP1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Sep 2019 03:15:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45310 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfIQHP1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Sep 2019 03:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=I1KmG1XCVkq/FnEUMFthbwvsxbAHhvWi1EJ0LLZvrXg=; b=nnjI0/9MfQ+xRTM+j7bTZb5F1
        fUDeKIrGwTzLiWZdlPu7wY73443LODAWtxgAYZt7guvXk9EnhG0XuEL8YojVbtu8OsA2JXNIqpqNv
        1z0RK2hRqKBte1lJP2YwFxF+7XahNG9Faq4eCUGnmF0ONVySTVlMYXx+sfCoARFRkHW4lpmnA0yzT
        vygiqCye1ZIPXoke9S7G+b0wn5XPwlf94DX4xsb+WxZUq9/WYEfOdLxSYH+pKIbrxGcFwqy/gBT94
        kAiF1SOgmiQU2ryPszHheD6pF9UWp1wyg6oMPIed+GSDhSsgHr4BJHgWf3I0wIVdGQ0BxbKmdbDL/
        2b7NB3Bhw==;
Received: from [213.208.157.37] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iA7hu-0001oY-59; Tue, 17 Sep 2019 07:15:26 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        schwab@suse.de
Subject: [PATCH v2] Documentation: document earlycon without options for more platforms
Date:   Tue, 17 Sep 2019 09:15:23 +0200
Message-Id: <20190917071523.16672-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The earlycon options without arguments is supposed to work on all
device tree platforms, not just arm64.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---

Changes since v1:
 - add comma, fix typo

 Documentation/admin-guide/kernel-parameters.txt | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4c1971960afa..d5956c29b93b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -977,12 +977,10 @@
 
 	earlycon=	[KNL] Output early console device and options.
 
-			[ARM64] The early console is determined by the
-			stdout-path property in device tree's chosen node,
-			or determined by the ACPI SPCR table.
-
-			[X86] When used with no options the early console is
-			determined by the ACPI SPCR table.
+			When used with no options, the early console is
+			determined by stdout-path property in device tree's
+			chosen node or the ACPI SPCR table if supported by
+			the platform.
 
 		cdns,<addr>[,options]
 			Start an early, polled-mode console on a Cadence
-- 
2.20.1

