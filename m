Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7F3547D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 16:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbeKTCYv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 21:24:51 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:42214 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729825AbeKTCYv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 21:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=j9pE34T2S8u9GqwpKSukNLCLgpxlt2AX/wjlQmIfvmA=; b=sqaRttMTLL8ImJo4fV+zvRgZ5G
        B3g9S/Aby2lB0NYMv8UrDgCQA/0+izmPREWj5+khpIrm85yHU/ImiD+wjGSd53dhz9MqsuBicAWPB
        Gmj7SXnsx7Wgjd2t/Tm2AIEKlDtNE3BRU2hwnEE0GDHrXv9ve6oHsnxxEECRNxRUn5QKP6a/Puv6R
        Giirj9gFpg9wZu6ZtlTGgGr5FEydDS8KlbVBXc+/7iEXHm8EDDwawIP5I7nD73edQZTvLHeRo0oKr
        c87fYwrpW8RAGnlcpW9KNv2fss75DOdWOIHp+M4ItILmNfXc0b2xMJN7VTBFXjkX2kr/DyYQnv65R
        Q8foeE/A==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gOlyj-0002iQ-Pr; Mon, 19 Nov 2018 16:00:49 +0000
Date:   Mon, 19 Nov 2018 08:00:49 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org
Subject: [PATCH] Link the memory allocation guide from the MM docs
Message-ID: <20181119160049.GC394@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I just went looking for the memory allocation guide in the MM docs instead
of in the core API.  For the benefit of the next person who makes that
mistake, link to it from the MM docs.

Signed-off-by: Matthew Wilcox <willy@infradead.org>

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index f8bb9aa120c4..8954a88ff5b7 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -1,3 +1,5 @@
+.. _memory-allocation:
+
 =======================
 Memory Allocation Guide
 =======================
diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
index c4ded22197ca..2b3ab3a1ccf3 100644
--- a/Documentation/vm/index.rst
+++ b/Documentation/vm/index.rst
@@ -2,7 +2,9 @@
 Linux Memory Management Documentation
 =====================================
 
-This is a collection of documents about Linux memory management (mm) subsystem.
+This is a collection of documents about the Linux memory management (mm)
+subsystem.  If you are looking for advice on simply allocating memory,
+see the :ref:`memory-allocation`.
 
 User guides for MM features
 ===========================
