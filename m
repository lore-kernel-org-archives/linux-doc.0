Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A82C25B4E
	for <linux-doc@archiver.kernel.org>; Sun, 22 Jan 2023 21:37:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjAVVhB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 22 Jan 2023 16:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjAVVhA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Jan 2023 16:37:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D57816AEB;
        Sun, 22 Jan 2023 13:36:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 371D1B80B6B;
        Sun, 22 Jan 2023 21:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB1AC4339C;
        Sun, 22 Jan 2023 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674423416;
        bh=ouBh5gtf3YcpQnZmuqTzawn7E0xCJfbx4PNMl8SCcOw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I8oGcgrcsSzQdlL3yI2xgYW7YFu/wnxSK7sTrc43GUWXYbTqMPHFQn9X5wLGnJStd
         EbBHGBvBnX2gclrn80b8FWig3JT+ofHtaeHSvpJfxSmnDXmFWb5n7z49FIjwEc0oie
         sq0M2/n10RB00otTmR+jb4bcksDjq1ssdo9l+LFSqKYw833dSrZyNqud0tK4xebvyH
         7bjrl4UD8VVoG4ei8DmZf06U67AgHSfoKS1z+MhW5PoswPN1OPnMaETFgCMLZWCsy/
         Z4D3oFB4AXxAAAL1WER8R4i+bvJxoz9d1dpfEkuxjVk4FsjfxLzF+A+aXgJnnFkjV5
         /RiW6spQe/Kpw==
From:   SeongJae Park <sj@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     SeongJae Park <sj@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] Docs/driver-api/index: Add missing SPDX License Identifier
Date:   Sun, 22 Jan 2023 21:36:44 +0000
Message-Id: <20230122213650.187710-3-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122213650.187710-1-sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add missing SPDX License Identifier for driver-api documentation index
file.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/driver-api/index.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index b208e0dac3a0..7a2584ab63c4 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ==============================
 Driver implementer's API guide
 ==============================
-- 
2.25.1

