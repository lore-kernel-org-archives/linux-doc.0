Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211CFC4727F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:28:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E35D6207FB
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472521;
	bh=l4ZnRkqZgd8x5ZpSMUuNxg1b7AqKFMTZgq0sXQ4YesA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=04gbIh904800pN/iVItsKGVGhxuyMNFODm0KovETJpAeD3UnD02PZKFatKh9r7HyE
	 yDfRoV3xgyqdI47NT+iLZJLRghjTdM28UeqgNd2y6TaGd2NNh17bFu2LzEbyxwPQGk
	 lsjL5m5vSzCvZM1+hUhfXVivmWPw55QMjWWw9Pys=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730754AbgI3N2P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:28:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:38992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730196AbgI3NZV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:21 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C966221E7;
        Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472320;
        bh=l4ZnRkqZgd8x5ZpSMUuNxg1b7AqKFMTZgq0sXQ4YesA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IHbW5oI4/RtT4HYSSPeE8X1EzBAUE8t8/JWXbqCOvcxyIyaVyHWr5EFUmIsO7qVZ3
         8QHoWObwSmDtB0OW83b5GQOAMyHB/H6Ic+naNump2W81Vo82S16HzCQa7NE2yev42h
         StlL7adO+cQpZCRYWnUAZGsJtC2fBMmYH4AyuhRw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6g-001XJf-IO; Wed, 30 Sep 2020 15:25:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v4 19/52] memblock: get rid of a :c:type leftover
Date:   Wed, 30 Sep 2020 15:24:42 +0200
Message-Id: <0aab04f62bc3dfa82394e20d61c05c6efbfb4859.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

chanseset b3a7bb1851c8 ("docs: get rid of :c:type explicit declarations for structs")
removed several :c:type: markups, except by one.

Now, Sphinx 3.x complains about it:

	.../Documentation/core-api/boot-time-mm:26: ../mm/memblock.c:51: WARNING: Unparseable C cross-reference: 'struct\nmemblock_type'
	Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
	  struct
	memblock_type
	  ------^

As, on Sphinx 3.x, the right markup is c:struct:`foo`.

So, let's remove it, relying on automarkup.py to convert it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 mm/memblock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 165f40a8a254..326c6b3fec1d 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -50,8 +50,8 @@
  *
  * Each region is represented by :c:type:`struct memblock_region` that
  * defines the region extents, its attributes and NUMA node id on NUMA
- * systems. Every memory type is described by the :c:type:`struct
- * memblock_type` which contains an array of memory regions along with
+ * systems. Every memory type is described by the struct memblock_type
+ * which contains an array of memory regions along with
  * the allocator metadata. The "memory" and "reserved" types are nicely
  * wrapped with :c:type:`struct memblock`. This structure is statically
  * initialized at build time. The region arrays are initially sized to
-- 
2.26.2

