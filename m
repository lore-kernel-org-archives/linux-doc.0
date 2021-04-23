Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86227C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 20:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F4E1613B1
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 20:38:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhDWUjC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Apr 2021 16:39:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:49084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243797AbhDWUjA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Apr 2021 16:39:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD40E613C1;
        Fri, 23 Apr 2021 20:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619210303;
        bh=ny/sT7gwWEM66ZHkzg7/Gi0H/QSDH+E6gNIWpbUP1UI=;
        h=From:To:Cc:Subject:Date:From;
        b=m6RumjXLT0ZB3VskzI8rH7ThOW5Lm34QRUwMW3Ex7JV/jU9jfkkFouHFa8PSzjm5Z
         TI8mJYWTXIud02ZHsjHxyNWRkNqJt5vgum4bI8WYCSH+1i5tgWZlzSdpqbTATnN8PW
         V0op9Q7qUJFeEfp8WzqABmucxrgctSE9PMd/bHy4R26cUbIzjcy2wJLRGFqbHwgZLU
         NNCTHFik9m+pYPLeGpRhKL5T6Tiu+QvqaaQ2lcuSlQvp54VBdwTHwPtujn/EaKo3qV
         LY8RppOgnUXR9TfmLonNsEFyvIdLeDwK4wXjIgnaYq++T0ZJGlWsWiRhC5A+myhKaB
         I25TIhuHyuWdw==
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 0/2] mmzone.h: fix kernel-doc and simplify is_highmem_idx
Date:   Fri, 23 Apr 2021 23:38:09 +0300
Message-Id: <20210423203811.1247508-1-rppt@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

There are several kernel-doc comments in include/linux/mmzone.h, but
they have some formatting issues and they are not linked to the rest of
the documentation.

The first patch here fixes the formatting and adds the kernel-doc
comments to the core-api/mm-api.rst.

The second patch simplifies a bit detection if a zone is a highmem zone.
It does not generally depends on the first one, but they have a textual
conflict.

Mike Rapoport (2):
  mm/mmzone.h: fix existing kernel-doc comments and link them to core-api
  mm/mmzone.h: simplify is_highmem_idx()

 Documentation/core-api/mm-api.rst |  2 ++
 include/linux/mmzone.h            | 56 ++++++++++++++-----------------
 2 files changed, 27 insertions(+), 31 deletions(-)

-- 
2.29.2

