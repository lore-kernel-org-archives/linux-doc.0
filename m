Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31FFEE14D7
	for <linux-doc@archiver.kernel.org>; Thu,  7 Sep 2023 02:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242061AbjIGC3s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Sep 2023 22:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243060AbjIGC3p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Sep 2023 22:29:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336F51BC1;
        Wed,  6 Sep 2023 19:29:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D10C433CC;
        Thu,  7 Sep 2023 02:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694053782;
        bh=nX+lBCNxvHlh2Hd6gi4Ol2YBYOd7nIVtVx3JTRH4uq0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I9w1kxv9RA186Id0zHiS1zj+BAWURWAM5lFzFwxGnAFkbOzT+alc0bJOmHHWt8jct
         Q4jtNAkHhp+5IA6yHicRT3lr/mvEFKowHjn869YNnj4WhXTR6m9pryGxMT2+ME1DTC
         DMptSU91rd7c6N4zVxIIoXhw+QDzsyi0AO1xQdEgloEG1ovEnYjbJyUsoo6s74QWSp
         beuyoPPwVNVq+pc8howL9hkKWIUO3KAdpEzIpzs3Hhu0WBQMaGsAOnUtSDLvDS21uK
         qwRvMdnKNG7PeimG83FzH02OCX+LD3nmd+vZ0CUO8eRiFMPYGbJ+Ekra1waYsgazYV
         Kr6xv4L++j1iw==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] Docs/mm/damon/design: add a section for kdamond and DAMON context
Date:   Thu,  7 Sep 2023 02:29:24 +0000
Message-Id: <20230907022929.91361-7-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230907022929.91361-1-sj@kernel.org>
References: <20230907022929.91361-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The design document is not explaining about the concept of kdamond and
the DAMON context, while usage document does.  Those concept explanation
should be in the design document, and usage document should link those.
Add a section for those.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 51aab9b0621a..ee099d45fea8 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -476,3 +476,13 @@ modules for proactive reclamation and LRU lists manipulation are provided.  For
 more detail, please read the usage documents for those
 (:doc:`/admin-guide/mm/damon/reclaim` and
 :doc:`/admin-guide/mm/damon/lru_sort`).
+
+
+Execution Model and Data Structures
+===================================
+
+The monitoring-related information including the monitoring request
+specification and DAMON-based operation schemes are stored in a data structure
+called DAMON ``context``.  DAMON executes each context with a kernel thread
+called ``kdamond``.  Multiple kdamonds could run in parallel, for different
+types of monitoring.
-- 
2.25.1

