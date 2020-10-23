Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5388CC4363A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0610E22210
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470916;
	bh=mdSdh5AGZt6OomnwQnDQKEOlC4NrmBkjBQ0E/tv2ezo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=kEU9YXsB8X1iN3AufZByws3OJyGhlhfrLQlGVsMY4OxFTKDGkmq0JeyAXWz95BqmU
	 0SYWONZBYifoJMVvCy1d8ayd1BiruCHIDSY8peXG3n3eUFkIjZA98+GoQURZLt2G5c
	 cHTavGIG0Owp9HgN5xIcn7iVKBjv7bDhTToWyYnE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465760AbgJWQfP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:35:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751863AbgJWQdv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:51 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4D37246DC;
        Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=mdSdh5AGZt6OomnwQnDQKEOlC4NrmBkjBQ0E/tv2ezo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xAxL9zxTXBFGtdrarG7uuibMZOhjG5gKpg1OD8UyzeKOtxBxVfbz9TKwnYR8shj+8
         ZbmH8Ss/WZdcFyhc3MyOZAkavbzReotyZxAAmORI3uTDXYLlFglulmkI2dqO/BjCcW
         VqJIVAfgqmhUkWc9aK18X9f794OlP+b5rJEceXZc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00g-002Axl-Nf; Fri, 23 Oct 2020 18:33:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 52/56] resource: fix kernel-doc markups
Date:   Fri, 23 Oct 2020 18:33:39 +0200
Message-Id: <926c3c9de205325acf609ea5e28dd905bda9768b.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kernel-doc markups should use this format:
        identifier - description

While here, fix a kernel-doc tag that was using, instead,
a normal comment block.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 kernel/resource.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/kernel/resource.c b/kernel/resource.c
index 3ae2f56cc79d..9738920abdca 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -320,9 +320,8 @@ int release_resource(struct resource *old)
 EXPORT_SYMBOL(release_resource);
 
 /**
- * Finds the lowest iomem resource that covers part of [@start..@end].  The
- * caller must specify @start, @end, @flags, and @desc (which may be
- * IORES_DESC_NONE).
+ * find_next_iomem_res - Finds the lowest iomem resource that covers part of
+ *			 [@start..@end].
  *
  * If a resource is found, returns 0 and @*res is overwritten with the part
  * of the resource that's within [@start..@end]; if none is found, returns
@@ -337,6 +336,9 @@ EXPORT_SYMBOL(release_resource);
  * @desc:	descriptor the resource must have
  * @first_lvl:	walk only the first level children, if set
  * @res:	return ptr, if resource found
+ *
+ * The caller must specify @start, @end, @flags, and @desc
+ * (which may be IORES_DESC_NONE).
  */
 static int find_next_iomem_res(resource_size_t start, resource_size_t end,
 			       unsigned long flags, unsigned long desc,
@@ -416,11 +418,9 @@ static int __walk_iomem_res_desc(resource_size_t start, resource_size_t end,
 }
 
 /**
- * Walks through iomem resources and calls func() with matching resource
- * ranges. This walks through whole tree and not just first level children.
- * All the memory ranges which overlap start,end and also match flags and
- * desc are valid candidates.
- *
+ * walk_iomem_res_desc - Walks through iomem resources and calls func()
+ *			 with matching resource ranges.
+ * *
  * @desc: I/O resource descriptor. Use IORES_DESC_NONE to skip @desc check.
  * @flags: I/O resource flags
  * @start: start addr
@@ -428,6 +428,10 @@ static int __walk_iomem_res_desc(resource_size_t start, resource_size_t end,
  * @arg: function argument for the callback @func
  * @func: callback function that is called for each qualifying resource area
  *
+ * This walks through whole tree and not just first level children.
+ * All the memory ranges which overlap start,end and also match flags and
+ * desc are valid candidates.
+ *
  * NOTE: For a new descriptor search, define a new IORES_DESC in
  * <linux/ioport.h> and set it in 'desc' of a target resource entry.
  */
@@ -1372,9 +1376,9 @@ static bool system_ram_resources_mergeable(struct resource *r1,
 	       !r1->child && !r2->child;
 }
 
-/*
+/**
  * merge_system_ram_resource - mark the System RAM resource mergeable and try to
- * merge it with adjacent, mergeable resources
+ * 	merge it with adjacent, mergeable resources
  * @res: resource descriptor
  *
  * This interface is intended for memory hotplug, whereby lots of contiguous
-- 
2.26.2

