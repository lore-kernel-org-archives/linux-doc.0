Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 359DF7D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 12:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfGZMvl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 08:51:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39864 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfGZMvl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 08:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZFv2xjqfZM2WfkDE8CqX1DtbTr60HVV4SmjhrFwyzAc=; b=JUHfWHbEBYg3royGZe4nfCO4Z2
        UVLXGyLqgqf1HSIVeC9I/bi4rEWtkMdbEJJutmgEK8itnZHJgjsSxaJhB7xp3sYulzNCaGIyML6Xv
        Qu7zbBEYNq1En1YS0IvlGdbLV54saVSkKneHA8IsHrODPe0YUC18DwUqCriU0RdENXp4x3M2cARba
        bbzpTarObaVdiLt1cqrhcrwlI09UxZr+QMXilt3XEXFRixQFDsg3KPzp06FjKn2MdNohb+RNsAm6k
        paPNGhiEszH6yS8aCSYGufa1zm19T8LQ1tVh8jJHj54StbDyLRn2h5eQ5ifAoke2GZFiMIwk76HRF
        Hd0532yQ==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqzhE-0006Ah-Ld; Fri, 26 Jul 2019 12:51:40 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqzhC-0005bm-Gw; Fri, 26 Jul 2019 09:51:38 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2 23/26] docs: nios2: add it to the main Documentation body
Date:   Fri, 26 Jul 2019 09:51:33 -0300
Message-Id: <93d00e9b0b5b4f02e5b8f5695c2513af49bc0ef9.1564145354.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564145354.git.mchehab+samsung@kernel.org>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rename and add the nios2 documentation to the documentation
body.

The nios2 document is already on an ReST compatible format.
All it needs is that the title of the document to be promoted
one level.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/index.rst                   | 1 +
 Documentation/nios2/{README => nios2.rst} | 1 +
 2 files changed, 2 insertions(+)
 rename Documentation/nios2/{README => nios2.rst} (96%)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 1ff03833276a..d963db84fc42 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -150,6 +150,7 @@ implementation.
    m68k/index
    powerpc/index
    mips/index
+   nios2/nios2
    openrisc/index
    parisc/index
    riscv/index
diff --git a/Documentation/nios2/README b/Documentation/nios2/nios2.rst
similarity index 96%
rename from Documentation/nios2/README
rename to Documentation/nios2/nios2.rst
index 054a67d55563..43da3f7cee76 100644
--- a/Documentation/nios2/README
+++ b/Documentation/nios2/nios2.rst
@@ -1,3 +1,4 @@
+=================================
 Linux on the Nios II architecture
 =================================
 
-- 
2.21.0

