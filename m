Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A61EB64D8
	for <linux-doc@archiver.kernel.org>; Fri, 16 Jun 2023 19:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345514AbjFPT0A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Jun 2023 15:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346509AbjFPTZc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Jun 2023 15:25:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D1949D6;
        Fri, 16 Jun 2023 12:23:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8DE5563B32;
        Fri, 16 Jun 2023 19:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BFBC433C9;
        Fri, 16 Jun 2023 19:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686943068;
        bh=tdsag9TbzOBwZuQPOUhp40y5OC9WFNnEYON6/5U8cj0=;
        h=From:To:Cc:Subject:Date:From;
        b=oEJj2BdDRPkPXY4SNHhOPScW7zA8ioghDK5NMrpk0PJQ0/arpKVZfssjMgsh9k5jO
         zEbbIC52S5jKtYtbyQ+3sk91O9tbVHQvgf0kGhkZ2OFket6vsM3uCXw/PABHj1fmC4
         INY/yAazHiSkFIn9tE6ZKGO2o9CqXW6u2DY9EIiix0b5KaEQ4SYRh5I6BonnlPBlbs
         HGW13EY34TqPM89LK9OjlE678YcTfCe9JesU6TOn2Qo5yAhBeeimqqu8kuvGoO0fPp
         117e8uxtPtTX3Z8wCO4IOQaj7/zIv6gIPo2rUbCK0KVrO4dFS67v73/Z1I38TET1SZ
         L+LNtHAS9Mg6Q==
From:   SeongJae Park <sj@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     SeongJae Park <sj@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        damon@lists.linux.dev, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] Docs/{mm,admin-guide}damon: update design and usage docs
Date:   Fri, 16 Jun 2023 19:17:35 +0000
Message-Id: <20230616191742.87531-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update DAMON design and usage documents for outdated and unnecessarily
duplicated parts.

SeongJae Park (7):
  Docs/mm/damon/design: document 'age' of region
  Docs/admin-guide/mm/damon/start: update DAMOS example command
  Docs/admin-guide/mm/damon/usage: fix typos in references and commas
  Docs/admin-guide/mm/damon/usage: remove unnecessary sentences about
    supported address spaces
  Docs/admin-guide/mm/damon/usage: link design document for DAMOS
  Docs/admin-guide/mm/damon/usage: clarify quotas and watermarks sysfs
    interface
  Docs/admin-guide/mm/damon/usage: update the ways for getting
    monitoring results

 Documentation/admin-guide/mm/damon/start.rst |  10 +-
 Documentation/admin-guide/mm/damon/usage.rst | 146 ++++++++-----------
 Documentation/mm/damon/design.rst            |  28 ++++
 3 files changed, 95 insertions(+), 89 deletions(-)

-- 
2.25.1

