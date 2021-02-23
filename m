Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA63DC433DB
	for <linux-doc@archiver.kernel.org>; Tue, 23 Feb 2021 06:05:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D96464E4D
	for <linux-doc@archiver.kernel.org>; Tue, 23 Feb 2021 06:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhBWGFI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Feb 2021 01:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhBWGFI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Feb 2021 01:05:08 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065EDC061574;
        Mon, 22 Feb 2021 22:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=AEaIQi2veuBQwf4XS7youG5ABqjrt94dxMm7ycd6j8Q=; b=yr4TIbtQTCu8boueDH4UkQX4e2
        XS8PP67uNf8PPevKETIXm9kLdaB5S//pVsHm1XOx6GV1qc61vlGYWCCejWJ1rOzE1gf8iX+7Sqwu9
        I3LoPciKXqUUJ8SouyZ9XiBKJzkmBUhyDYnafVSrP8wUgQIIhtv3EjVmavwhUVKJpO6o4Dx97McuL
        uFp5XwMbrjzyqggcFA867TvSR8CeX1Dy/lj9VRBzeTL4tuA8dFXO/sIlVocnvpcKkaoTcbo9TkGAo
        WQbdb4Emf/W1TzGVZqYL9pbEfWO6+LxlJtK2gTZ3wGQ/h/VTHd2LtVZegc2R6ySulquo1iZgKWMBF
        bgEJwv6g==;
Received: from [2601:1c0:6280:3f0::d05b] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lEQo3-0005fq-Oh; Tue, 23 Feb 2021 06:04:24 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH -next] docs: proc.rst: fix indentation warning
Date:   Mon, 22 Feb 2021 22:04:18 -0800
Message-Id: <20210223060418.21443-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix indentation snafu in proc.rst as reported by Stephen.

next-20210219/Documentation/filesystems/proc.rst:697: WARNING: Unexpected indentation.

Fixes: 93ea4a0b8fce ("Documentation: proc.rst: add more about the 6 fields in loadavg")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
shame on me.

 Documentation/filesystems/proc.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210219.orig/Documentation/filesystems/proc.rst
+++ linux-next-20210219/Documentation/filesystems/proc.rst
@@ -694,7 +694,7 @@ files are there, and which are missing.
                 All fields are separated by one space except "number of
                 processes currently runnable" and "total number of processes
                 in system", which are separated by a slash ('/'). Example:
-                  0.61 0.61 0.55 3/828 22084
+                0.61 0.61 0.55 3/828 22084
  locks        Kernel locks
  meminfo      Memory info
  misc         Miscellaneous
