Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FA4C77B75
	for <linux-doc@archiver.kernel.org>; Mon,  8 May 2023 05:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbjEHF7q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 May 2023 01:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjEHF7k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 May 2023 01:59:40 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9790E14E62;
        Sun,  7 May 2023 22:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=ixvEOTc/kA7Op4nO674aqpEaalzlKVm9oZsn6tzhnwk=; b=K/+TCMlKoW/tMEgk6Yg6hsJcGh
        G2qTVxwkh/nLgZ3XsajECeVu+u0GlmyjGjX5G5iOMWts7mxKrEm0piL/+bfCUk/SXLnFfVePXjgbi
        LjkbnODjo0XRqxbGf2DVigVP9UYe1+E/h8jHSWvrn9EgYW9K/wgF2F3hB9+7ysZmeQxNpg4jafd4S
        VCbGiBpuHi8JeGNIcG30JxvfqHrLCajrZNHRoLBnuTDHcmFWXetX8/y37y5U57l19Vz41aNAODOwe
        kWwdBmgKP1CTvYfR04GW3mDQ7fspOhMUhSwM2KCEDjO792pOSdc4WoTzBUuSlQA+tFcW1meFH1231
        iIY4fjdg==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pvtuN-00HLgB-06;
        Mon, 08 May 2023 05:59:39 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        linux-fsdevel@vger.kernel.org, Ram Pai <linuxram@us.ibm.com>,
        Peng Tao <bergwolf@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] Documentation/filesystems: sharedsubtree: add section headings
Date:   Sun,  7 May 2023 22:59:38 -0700
Message-Id: <20230508055938.6550-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Several of the sections are missing underlines. This makes the
generated contents have missing entries, so add the underlines.

Fixes: 16c01b20ae05 ("doc/filesystems: more mount cleanups")
Fixes: 9cfcceea8f7e ("[PATCH] Complete description of shared subtrees.")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: Ram Pai <linuxram@us.ibm.com>
Cc: Peng Tao <bergwolf@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 Documentation/filesystems/sharedsubtree.rst |    4 ++++
 1 file changed, 4 insertions(+)

diff -- a/Documentation/filesystems/sharedsubtree.rst b/Documentation/filesystems/sharedsubtree.rst
--- a/Documentation/filesystems/sharedsubtree.rst
+++ b/Documentation/filesystems/sharedsubtree.rst
@@ -147,6 +147,7 @@ replicas continue to be exactly same.
 
 
 3) Setting mount states
+-----------------------
 
 	The mount command (util-linux package) can be used to set mount
 	states::
@@ -612,6 +613,7 @@ replicas continue to be exactly same.
 
 
 6) Quiz
+-------
 
 	A. What is the result of the following command sequence?
 
@@ -673,6 +675,7 @@ replicas continue to be exactly same.
 		/mnt/1/test be?
 
 7) FAQ
+------
 
 	Q1. Why is bind mount needed? How is it different from symbolic links?
 		symbolic links can get stale if the destination mount gets
@@ -841,6 +844,7 @@ replicas continue to be exactly same.
 			     tmp  usr tmp usr tmp usr
 
 8) Implementation
+-----------------
 
 8A) Datastructure
 
