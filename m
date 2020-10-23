Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB5EC5DF9E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A6AB241A3
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470954;
	bh=tFmwNM29Z4/PfnBG2iHx1y5DHZMj6Vv1utRUWGfTh9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=XzC6VQ0ycpCCXfhlecNHuiKZJ4oKEo4B2K41AqxcPvdVuFVFLUgNkwIDG2d5YkHSR
	 QDDzSCADh45LCtOxJbDebUWamigr1a3bWKZ3SYeJrq6E170Vi+fwn6tHnXllQ6qUPc
	 pBCPAP5SdzUFLEVhb2L8sMsdp32aZXRCe/mrEnD4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750899AbgJWQfx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:35:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:33734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751856AbgJWQdu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:50 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 929A2246CB;
        Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=tFmwNM29Z4/PfnBG2iHx1y5DHZMj6Vv1utRUWGfTh9w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1jMPhZPV3Dyl8Cacs6hSQpNHuacf27C8Ndlq+KGfckWwDB5sWSvRGCsHfFxBrh7bn
         X+hlmAjXZKxYd2Z35qaiVJ5PHhYkNA3Av7zQGm4c02Wr3bPehlB8/+8joBsIllY2nn
         Lddk8RiB4lzjf+Nz+l316w1MygYQ/DKDBF8jHSwY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00g-002AxW-Hi; Fri, 23 Oct 2020 18:33:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v3 47/56] memblock: fix kernel-doc markups
Date:   Fri, 23 Oct 2020 18:33:34 +0200
Message-Id: <90f921afef8f60498a997a4a243bcf839b9142ca.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some identifiers have different names between their prototypes
and the kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/memblock.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index ef131255cedc..95fe3cb71c54 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -272,7 +272,7 @@ void __next_mem_pfn_range_in_zone(u64 *idx, struct zone *zone,
 				  unsigned long *out_spfn,
 				  unsigned long *out_epfn);
 /**
- * for_each_free_mem_range_in_zone - iterate through zone specific free
+ * for_each_free_mem_pfn_range_in_zone - iterate through zone specific free
  * memblock areas
  * @i: u64 used as loop variable
  * @zone: zone in which all of the memory blocks reside
@@ -292,7 +292,7 @@ void __next_mem_pfn_range_in_zone(u64 *idx, struct zone *zone,
 	     __next_mem_pfn_range_in_zone(&i, zone, p_start, p_end))
 
 /**
- * for_each_free_mem_range_in_zone_from - iterate through zone specific
+ * for_each_free_mem_pfn_range_in_zone_from - iterate through zone specific
  * free memblock areas from a given point
  * @i: u64 used as loop variable
  * @zone: zone in which all of the memory blocks reside
-- 
2.26.2

