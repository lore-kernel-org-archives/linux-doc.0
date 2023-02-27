Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69987C7EE30
	for <linux-doc@archiver.kernel.org>; Mon, 27 Feb 2023 02:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjB0CfD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Feb 2023 21:35:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbjB0Ceq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Feb 2023 21:34:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050D21BAC8;
        Sun, 26 Feb 2023 18:34:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E33EA60DC1;
        Mon, 27 Feb 2023 02:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5FCC4339B;
        Mon, 27 Feb 2023 02:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677463620;
        bh=eF84hPSUlq0NnK3I0lJ1wPe3Vof4mcdSUvR4+5Y5PYE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=btn2gMr5oCwufGfIUvPwNOXoNPELoi78Dk5OZfhc/hGG+eZQZgQwqQisbuv6PgIOg
         sVeP0VETKD46B3SAM7NCLKhPqQCV/fMlx5UFc7rhN7LztHw2Atub0yAfFVyTU9gPWV
         hYllb/Gv5OyLQc4vuVSE4OjQL1TqjxD0Cit2GR2P9IjK3nMhqL8u1StGiK91l/nEJh
         weq9JFnnBZ2xjVYFLLc1rKDX9tHNpVpdZcCbd0bM4wNpxnQPGbAH5T3XfCsyITygXa
         kO5UUay63yfungqoh6Qwj7yvYf23LHC82uQIe7uFDk+VC2vToAOoDjqNcw1hDhLHRF
         uMPwW3aqOSUEQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jakob Koschel <jkl820.git@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 31/58] docs/scripts/gdb: add necessary make scripts_gdb step
Date:   Sun, 26 Feb 2023 21:04:29 -0500
Message-Id: <20230227020457.1048737-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jakob Koschel <jkl820.git@gmail.com>

[ Upstream commit 6b219431037bf98c9efd49716aea9b68440477a3 ]

In order to debug the kernel successfully with gdb you need to run
'make scripts_gdb' nowadays.

This was changed with the following commit:

Commit 67274c083438340ad16c ("scripts/gdb: delay generation of gdb
constants.py")

In order to have a complete guide for beginners this remark
should be added to the offial documentation.

Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
Link: https://lore.kernel.org/r/20230112-documentation-gdb-v2-1-292785c43dc9@gmail.com
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/dev-tools/gdb-kernel-debugging.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documentation/dev-tools/gdb-kernel-debugging.rst
index 8e0f1fe8d17ad..895285c037c72 100644
--- a/Documentation/dev-tools/gdb-kernel-debugging.rst
+++ b/Documentation/dev-tools/gdb-kernel-debugging.rst
@@ -39,6 +39,10 @@ Setup
   this mode. In this case, you should build the kernel with
   CONFIG_RANDOMIZE_BASE disabled if the architecture supports KASLR.
 
+- Build the gdb scripts (required on kernels v5.1 and above)::
+
+    make scripts_gdb
+
 - Enable the gdb stub of QEMU/KVM, either
 
     - at VM startup time by appending "-s" to the QEMU command line
-- 
2.39.0

