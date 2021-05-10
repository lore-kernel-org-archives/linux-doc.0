Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FD9C43460
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:29:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D6C7614A5
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbhEJKaj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 06:30:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:33952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231320AbhEJK3G (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 May 2021 06:29:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90ABA61606;
        Mon, 10 May 2021 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620642443;
        bh=6sjYk0L7r47OqYeDFjm8HLNedMhHYNiE4aHEhPrw9X4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rPNA5gEb5wiceV6HZJDTEF76167hXADux0bMIy4zcCsn87c0Pv/dhwycAoBvBt0Mg
         L8E1PnHY/IY0UsGTRRAe6VFOk1LBA9yNuSXQ4KmtxcA9qj8l75kW/l7LNHfMr/WNWy
         9UOGqjfxUBQ2/dzsSQUZg5sbYS8xqRdyq+a9O2UhEqrQqvtl7iKZmIsaNwQKBSuEgW
         7zbM4Oht6O649bsiQ7yXMTu3uyg54vHyaX9ZnuXoeZXJGIVp1YdKe6JZR3NG7+Siuc
         PWPn4e/RXVENSgzMkKVeVwZNAEtkCO+3/0vE5iPH8L5c0ZsmoKJwdIP8Iq5L5Deztp
         ObXMEsBNcz9BA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lg38C-000UOa-Fy; Mon, 10 May 2021 12:27:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH 04/53] docs: index.rst: avoid using UTF-8 chars
Date:   Mon, 10 May 2021 12:26:16 +0200
Message-Id: <fbf39b4b4a7d78a5180489755fd27b5723224adc.1620641727.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While UTF-8 characters can be used at the Linux documentation,
the best is to use them only when ASCII doesn't offer a good replacement.
So, replace the occurences of the following UTF-8 characters:

	- U+2014 ('—'): EM DASH

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/index.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 54ce34fd6fbd..11cd806ea3a4 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -30,7 +30,7 @@ tree, as well as links to the full license text.
 User-oriented documentation
 ---------------------------
 
-The following manuals are written for *users* of the kernel — those who are
+The following manuals are written for *users* of the kernel - those who are
 trying to get it to work optimally on a given system.
 
 .. toctree::
@@ -90,7 +90,7 @@ Kernel API documentation
 These books get into the details of how specific kernel subsystems work
 from the point of view of a kernel developer.  Much of the information here
 is taken directly from the kernel source, with supplemental material added
-as needed (or at least as we managed to add it — probably *not* all that is
+as needed (or at least as we managed to add it - probably *not* all that is
 needed).
 
 .. toctree::
-- 
2.30.2

