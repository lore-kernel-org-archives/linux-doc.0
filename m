Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9FFC677F1
	for <linux-doc@archiver.kernel.org>; Thu, 12 Jan 2023 09:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240073AbjALJ0s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Jan 2023 04:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239894AbjALJ0Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 04:26:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 487BA1A078;
        Thu, 12 Jan 2023 01:16:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D96DE61F83;
        Thu, 12 Jan 2023 09:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86C8C4339C;
        Thu, 12 Jan 2023 09:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673514994;
        bh=oFc0IwWVLtbYv7DCWrnjSwABzc8JM/Pqrho6QIR7/GE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NzaYABpJWpMrVaVC4V4egtA8Eao1yIBWkjD8/cDjJ9WvmGsBeB6KBii81hggxnijA
         wtbaGG9hdGNUvP8xZ++YifcLHbFS87I7vFyKsO6JYzuTzuDcAmEaNRAGvnhlKlTTza
         wNfzDwU7SAQ+Uf2H8HHY4JeOvEMcJbUeohmOr5Xyh3inEV8ZqFoL97lKswQm20sMdF
         /CoQpEYqwe8QMpkMnLvNHhJYwoAsWGom7oajM7Ma4lXjdoAuR0BoQZDugHMGrqBKdJ
         BeNljZyQjFASbCQ01AEQGp/l0FhTWKW9CjPcYcJpQ25p4W8R1fyTYYoA4peBQv/grx
         cLnezprw+hStw==
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
Subject: [PATCH v3 1/3] docs/core-api: DMA API: add page label to allow external references
Date:   Thu, 12 Jan 2023 11:16:14 +0200
Message-Id: <20230112091616.824565-2-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230112091616.824565-1-rppt@kernel.org>
References: <20230112091616.824565-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 Documentation/core-api/dma-api.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 829f20a193ca..c847a5b0a0d3 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -1,3 +1,5 @@
+.. _dma_api:
+
 ============================================
 Dynamic DMA mapping using the generic device
 ============================================
-- 
2.35.1

