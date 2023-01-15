Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FE2C3DA78
	for <linux-doc@archiver.kernel.org>; Sun, 15 Jan 2023 18:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231271AbjAOSm3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 15 Jan 2023 13:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbjAOSm2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Jan 2023 13:42:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F068F744;
        Sun, 15 Jan 2023 10:42:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7FF360D2E;
        Sun, 15 Jan 2023 18:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9587EC433EF;
        Sun, 15 Jan 2023 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673808146;
        bh=z11MFNtV3X3bexpW51OoHjzIJBfJWYhzONMb5AHF4Hs=;
        h=From:To:Cc:Subject:Date:From;
        b=KgvxCLGviINKr8HSgryYWcHu97Z6S76usHSgEw43auqHfd/fmzAGQTha7oSFnwTUj
         oiD69dL0laJ/5SCeZ0KjLARkAnCmZvA0503c3TRoTmhdlxQSJggGgvHYC61+vhZO9V
         3KHImVs6lhJo2LlgsMvpU8acSTRhhCvgoX7pkJgjbl9FyQTbqoRM6VofW8MtamencW
         uC3WY3RxSJBUj163OoMmZYeuHIWl7gJYS3ptzkARJi7xIW1HZY78h8fAvznV2W5LoD
         dFp+QR5f7FTAAj9GaQqARJhDvTiQkxwsGmzyj/HWhyXJKdalODz3L1Job/wNSD4AXq
         +oid1JlGlTrDQ==
From:   Mike Rapoport <rppt@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v4 0/1] docs/mm: start filling out new structure
Date:   Sun, 15 Jan 2023 20:42:11 +0200
Message-Id: <20230115184212.996298-1-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Last year at LSF/MM Matthew promptly created the new structure for MM
documentation, but there still was no patches with content.

I've started to work on it a while ago and I wanted to send it out in a
more complete form, but I've got distracted and didn't have time to work
on this.

With fast changes around struct page and the threat of Lorenzo's book,
I've decided to send out what I have till now with a hope that we can
really make this a collaborative effort with people filling paragraph
here and there.

If somebody does not feel like sending formal patches, just send me the
"raw" text my way and I'll deal with the rest.

The text is relatively heavily formatted because I believe the target
audience will prefer html version.

v4:
* squash commits into one (Bagas)
* fix references formatting (kbuild)
* add Reviewed-by and Acked-by tags

v3: https://lore.kernel.org/all/20230112091616.824565-1-rppt@kernel.org
* rephrase ZONE_DMA(32) and ZONE_MOVABLE description (Michal)
* add cross-reference to DMA API

v2: https://lore.kernel.org/all/20230110152358.2641910-1-rppt@kernel.org
* rephrase the paragraph inroducing zones (Lorenzo)
* update formatting (Bagas)
* add section stubs (Bagas)
* small fixes here and there

v1: https://lore.kernel.org/all/20230101094523.1522109-1-rppt@kernel.org

Mike Rapoport (IBM) (1):
  docs/mm: Physical Memory: add structure, introduction and nodes
    description

 Documentation/core-api/dma-api.rst   |   2 +
 Documentation/mm/page_reclaim.rst    |   2 +
 Documentation/mm/physical_memory.rst | 346 +++++++++++++++++++++++++++
 3 files changed, 350 insertions(+)

-- 
2.35.1

