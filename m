Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A68C63706
	for <linux-doc@archiver.kernel.org>; Mon,  5 Dec 2022 23:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbiLEXIo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Dec 2022 18:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbiLEXIj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Dec 2022 18:08:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28103FAC9;
        Mon,  5 Dec 2022 15:08:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B57B0614C5;
        Mon,  5 Dec 2022 23:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1305AC433B5;
        Mon,  5 Dec 2022 23:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670281718;
        bh=ew0j918CPCZ3BCkCfl4ilV0ZC0sdlaLXkkNEQyNFiwY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W8qG/90jufBB/qjSVpiIuoor4XnhnFVzjtYHepc2rpNDuU7yo7naKqYbm+xUemT+p
         qIttT3rUj6KqPG8THzAwmC5df/LY0OlN9RZ0cAdXuYxrbHF2EQ9HU6Cb8XcOYdQcZ1
         QQBc5DPFKjaAX3t0XTQ6D1HhaNWGA2Z+ZXyttXmz+77vKn0Vg2BxQHkOHWmFplAXzc
         /Cvnc01ns3hEKs/Oni+zs1nc1xnb1fLJa/63pUGo0MYGcW83Da8UJdc2xuwCIec8QL
         sj4CwRnbiNZ0pcCt7pWD+OzHOuqxbfF24jjEWG4kzF7RNn0ryU/e0lOmoMAfTVjeXo
         R8sA1F0+fiwCA==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>
Subject: [PATCH 04/11] Docs/admin-guide/damon/reclaim: document 'skip_anon' parameter
Date:   Mon,  5 Dec 2022 23:08:23 +0000
Message-Id: <20221205230830.144349-5-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205230830.144349-1-sj@kernel.org>
References: <20221205230830.144349-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the newly added 'skip_anon' parameter of DAMON_RECLAIM, which
can be used to avoid anonymous pages reclamation.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/reclaim.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index 4f1479a11e63..ff335e96e0d8 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -205,6 +205,15 @@ The end physical address of memory region that DAMON_RECLAIM will do work
 against.  That is, DAMON_RECLAIM will find cold memory regions in this region
 and reclaims.  By default, biggest System RAM is used as the region.
 
+skip_anon
+---------
+
+Skip anonymous pages reclamation.
+
+If this parameter is set as ``Y``, DAMON_RECLAIM does not reclaim anonymous
+pages.  By default, ``N``.
+
+
 kdamond_pid
 -----------
 
-- 
2.25.1

