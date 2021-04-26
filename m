Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78977C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 14:19:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4109661396
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 14:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhDZOUS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 10:20:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:33322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233637AbhDZOUQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Apr 2021 10:20:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1393B60E0C;
        Mon, 26 Apr 2021 14:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619446775;
        bh=SZoRCjNS7n0zZKfcX0q4e/N+EOpm1IX7g7LX8+u94y4=;
        h=From:To:Cc:Subject:Date:From;
        b=UK8aalI7zaK4IP34HP0sfRu/ONgB7D2Ievos/LSc0qAYNryQzv3iwnXMWxFwGQxkE
         HLLpKcI0sI1d9O+lC5dYAJtw6G6/64qbv7doRnSsw++PFdYR5GZJtsoY6dLMYTzhzm
         GtXq2sizXcdU6hJ+45nSpfCw7C4IzFXSehhJxi+gVCTvpGCOEElGyYH2fgyWbrQxLM
         FsJHKdnuPgl4/ruY+4ylzz6p3mJlci01x0tu180DtKd83SSQz5IDulL370RRr4T8z8
         gTgucY6MH466wBdSCKUBk/86CFoxWJU1jvtXgJkHrYTzcH512KVn64BFgVFDCjusFh
         PeTVhcf+aywHg==
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 0/2] mmzone.h: fix kernel-doc and simplify is_highmem_idx
Date:   Mon, 26 Apr 2021 17:19:25 +0300
Message-Id: <20210426141927.1314326-1-rppt@kernel.org>
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

v2:
* rebase on v5.12-rc8-mmots-2021-04-21-23-08
* add Reviewed-by tags, thanks Anshuman and Matthew

v1: Link: /home/mike/tmp/mm-docs/mmzone/v2/v2-0000-cover-letter.patch

Mike Rapoport (2):
  mm/mmzone.h: fix existing kernel-doc comments and link them to core-api
  mm/mmzone.h: simplify is_highmem_idx()

 Documentation/core-api/mm-api.rst |  1 +
 include/linux/mmzone.h            | 56 ++++++++++++++-----------------
 2 files changed, 26 insertions(+), 31 deletions(-)


base-commit: 5770176c2a0eaa998c58cfc7a9a5fe5b9291dd2a
-- 
2.29.2

