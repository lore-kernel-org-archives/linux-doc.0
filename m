Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67EDC7EE22
	for <linux-doc@archiver.kernel.org>; Wed, 10 May 2023 18:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbjEJSS6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 May 2023 14:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbjEJSSV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 May 2023 14:18:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A528694;
        Wed, 10 May 2023 11:18:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA02063F96;
        Wed, 10 May 2023 18:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE4BC433AF;
        Wed, 10 May 2023 18:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683742645;
        bh=5niEoOKO1ZkgLqnjpypuOkCum/ZBxI/z2WOC9+AEEJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E6FdKMPCzjlU2H9fbkTFQeqdk0HNDS1E6dlpIRaNOGqMSKBtqk5OEVR2vxdhPqcQq
         UmL7syR5Zydq67rTe89amu9DmA4kLQgd6fTWw8bdF9HSzXheGkJVj+83Bppuh8OqrV
         8i8eX/Az14mdD/zd9P6cW47Rdw2zbrG41/siw7z82uINTpKp6TO56B7+59EhlyF6Jk
         xw6EEDZrM8IUBgtBgPlj1JZa/cakOVO2ZefOEY2pZ6sSy4zwo1jOnLWOwFjqyekILm
         n4ew9qJfLwqncnzQMbb+wxvxTr9RT5MWmPQlqU921KblIxe0gmwP/fxSFK6L6zZ/aE
         iwkUwlpWAPSdw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 0C48BCE21E1; Wed, 10 May 2023 11:17:19 -0700 (PDT)
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     x86@kernel.org, akiyks@gmail.com, linux-doc@vger.kernel.org,
        kernel-team@meta.com, "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH locking/atomic 19/19] docs: Add atomic operations to the driver basic API documentation
Date:   Wed, 10 May 2023 11:17:17 -0700
Message-Id: <20230510181717.2200934-19-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <19135936-06d7-4705-8bc8-bb31c2a478ca@paulmck-laptop>
References: <19135936-06d7-4705-8bc8-bb31c2a478ca@paulmck-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the include/linux/atomic/atomic-arch-fallback.h file to the
driver-api/basics.rst in order to provide documentation for the Linux
kernel's atomic operations.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Kees Cook <keescook@chromium.org>
Cc: Akira Yokosawa <akiyks@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: <linux-doc@vger.kernel.org>
---
 Documentation/driver-api/basics.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 4b4d8e28d3be..0ae07f0d8601 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -87,6 +87,9 @@ Atomics
 .. kernel-doc:: arch/x86/include/asm/atomic.h
    :internal:
 
+.. kernel-doc:: include/linux/atomic/atomic-arch-fallback.h
+   :internal:
+
 Kernel objects manipulation
 ---------------------------
 
-- 
2.40.1

