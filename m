Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B2DC54EED
	for <linux-doc@archiver.kernel.org>; Sun, 22 Jan 2023 21:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbjAVVhL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 22 Jan 2023 16:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjAVVhD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Jan 2023 16:37:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0761517141;
        Sun, 22 Jan 2023 13:37:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B4D8EB80B45;
        Sun, 22 Jan 2023 21:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B4CC4339C;
        Sun, 22 Jan 2023 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674423420;
        bh=Om9rzcZezlU14pI1K+F9UkJfcijoRG5QitbXtAfUnn4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R+dksstgFLrCWMJMU06/pTiNqPNC38F+1H6CUp8ygemg162RtoYkBKA3cHqI5yF+k
         OnfpfHSG7fY67/tAv2SakKssUIh8/Tv8HJZd6rS80iCQBOdxDGTmjygmnAIbhl1OQl
         ixbaCC+LZJQBB3xmG92lBNae97Gf8FQA/VxzXHwMvJ9Hzn+WtPRnQnZhJFnQzTAh+m
         YsUe+igBkFrwxKEhfsuk1ya5VcHhnvszSTYwuybDvcNkogJoyyvacZZEqLkZJukKWQ
         FcqOttTlFM/zf1cATtpRQVwku9FfZmROn7Bki40B6VF6hOZac29gwkXhbWH0Ro4Y9U
         T9rloaNhWgr9A==
From:   SeongJae Park <sj@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     SeongJae Park <sj@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] Docs/scheduler/index: Add missing SPDX License Identifier
Date:   Sun, 22 Jan 2023 21:36:49 +0000
Message-Id: <20230122213650.187710-8-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122213650.187710-1-sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add missing SPDX License Identifier for scheduler documentation index
file.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/scheduler/index.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 1aac972a652f..ae0229f5a9cf 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========
 Scheduler
 =========
-- 
2.25.1

