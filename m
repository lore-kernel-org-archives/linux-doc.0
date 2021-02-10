Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C19BC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 04:26:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAE9564E45
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 04:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhBJE0R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Feb 2021 23:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhBJE0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Feb 2021 23:26:16 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF600C06174A;
        Tue,  9 Feb 2021 20:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=9jRCQI9OhZDLEzydyVbxcrW0qpE+alslMt9EqC76+6s=; b=PFSHo8AHmc+ORSS2V6BYX0LaTf
        KcSIohTAe8FmbV+PgFekePqTtcMCVlpd+PfqkrJzoqoZm2u/8Sm3YSK8jjDpjU57O0gQ+WK/sbFoF
        TLjEqJb80/hUau5st6/qs/X9VYpvrCQkQjdF1g51NaeMYffLce2B1fgzQVWwXk34cTnbssAgrhrt1
        ph5PEALiGfi2jxMsrMFYm5a2LCCCYVZyJyt3D3m/wLBI3B05041Q+f7JzxRZlF56jkj4gPhe8EQfc
        hT/2+Gtx7SFTGVul8qcf0nv5b7bgHpVYbZG7OiJHQ39ilzcldc/rv0d72mw2vKf2NNOFJYwsB4+y7
        lkyaQiyw==;
Received: from [2601:1c0:6280:3f0::cf3b] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l9h4H-0001Fi-8E; Wed, 10 Feb 2021 04:25:33 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/2] Docs: add fs/eventpoll to docbooks
Date:   Tue,  9 Feb 2021 20:25:26 -0800
Message-Id: <20210210042526.23174-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210042526.23174-1-rdunlap@infradead.org>
References: <20210210042526.23174-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add fs/eventpoll.c to the filesystem api-summary book.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
---
 Documentation/filesystems/api-summary.rst |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-next-20210205.orig/Documentation/filesystems/api-summary.rst
+++ linux-next-20210205/Documentation/filesystems/api-summary.rst
@@ -122,6 +122,12 @@ Events based on file descriptors
 .. kernel-doc:: fs/eventfd.c
    :export:
 
+eventpoll (epoll) interfaces
+============================
+
+.. kernel-doc:: fs/eventpoll.c
+   :internal:
+
 The Filesystem for Exporting Kernel Objects
 ===========================================
 
