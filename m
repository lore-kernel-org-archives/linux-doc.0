Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFFDCD37B5
	for <linux-doc@archiver.kernel.org>; Sat, 16 Sep 2023 02:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238122AbjIPCKO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Sep 2023 22:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237655AbjIPCKL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Sep 2023 22:10:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA771FD6;
        Fri, 15 Sep 2023 19:10:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382ABC433CA;
        Sat, 16 Sep 2023 02:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694830204;
        bh=nsy3XKNul10yj7Y4C7UdRuVcXMAYGZfrN5/ruA9B7bY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D5fwDD0thq/Rt72hGYBK0NcXdn7gIm9hhCVt0E9COGIdJlZlT5diQNJHgrqlRm2/w
         /hJeRDI7YMNSa34674k2tuFz1TEtFUrS112DzxcXapnvRWe7lRkVkVGzUcP4Q6Mn1S
         RpaUPA/u6e+cUlUNhbCsmnNL8YEvnugttaxfg5Eu55gGGazyO5netSuj1JvK/y7F1I
         jvU2m8i4d4PyQ79MLBzTW0/6LiTw7gsPVE9Ca7ZMS7lGESQDY3HJxS9Z7YfMVuCJuP
         eXOAdloC1XbqCLlzqjd+bAxppTZqzXuG+XazVEwVZw+8OGlmGvK9EkXfP830RlrvVI
         IRF8dNOB4kzZA==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] Docs/mm/damon/design: document DAMOS apply intervals
Date:   Sat, 16 Sep 2023 02:09:41 +0000
Message-Id: <20230916020945.47296-6-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230916020945.47296-1-sj@kernel.org>
References: <20230916020945.47296-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update DAMON design doc to explain about DAMOS apply intervals.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 18e9b42673f8..1f7e0586b5fa 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -259,7 +259,8 @@ works, DAMON provides a feature called Data Access Monitoring-based Operation
 Schemes (DAMOS).  It lets users specify their desired schemes at a high
 level.  For such specifications, DAMON starts monitoring, finds regions having
 the access pattern of interest, and applies the user-desired operation actions
-to the regions as soon as found.
+to the regions, for every user-specified time interval called
+``apply_interval``.
 
 
 .. _damon_design_damos_action:
-- 
2.25.1

