Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB7B67DE7B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 11:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfGVLIK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 07:08:10 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35568 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbfGVLH7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 07:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6CiO/QcGVCk10o4wnjQ/qQ91WZw6QRelFsjbSZfjreo=; b=AHj0L/j4XItezENLRQ9OPQ2DYC
        xPUnb2X0Cmre2vHuOQqC6nO6SRD76gTovkKwe8XhZilmW5JafhlfBICqL0Ts2YSNA/U6TEVgVhbm9
        SjIJMEP40WIb23Ly8tzfF7yG4Isf5ta94omjdEJl7jDfjve9eTEMdXkt7YJkt7BazCpgflvpFM8dQ
        FwylugM5m+KIwoHUBG6hEWPGk0XEtPsUf3hXsRLy0z//gn5wJzfn7BPyEDeTBB2ijkp6OhzFVbqGD
        SFyJ3k0rxGT2eJciOnqUC5Y0EUA90eevSOHefmi+vI/7tNQNvEb4Gt9cSBTVzDKy6K9PIeee7KKLo
        wNT0EQ6Q==;
Received: from 177.157.124.3.dynamic.adsl.gvt.net.br ([177.157.124.3] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hpWAh-000258-F9; Mon, 22 Jul 2019 11:07:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hpWAa-00041v-G4; Mon, 22 Jul 2019 08:07:52 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 19/22] docs: nios2: add it to the main Documentation body
Date:   Mon, 22 Jul 2019 08:07:46 -0300
Message-Id: <efd99ef47362b2525cdfa32ce51ad0b8430746dd.1563792334.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563792333.git.mchehab+samsung@kernel.org>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
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
index 09d24878ad14..0a564f3c336e 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -151,6 +151,7 @@ implementation.
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

