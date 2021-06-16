Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21C5C49EBE
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 06:28:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA356613C7
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 06:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbhFPGaO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 02:30:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:59906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231681AbhFPG34 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 Jun 2021 02:29:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D375861426;
        Wed, 16 Jun 2021 06:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623824868;
        bh=Zl+ZYs1qMh1ssinXO6bJDW7srAJFrDAxrK9NTRoL0So=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jGu1HNdL+QEMCBLlcUYrxRB5mIuoCCUVLO+lUPsY6Bri0KNIkbhMnNGoC6LP72SkA
         N2tFylAxVZO7TolXSTv+7zHUblfS9uWXNQ7VVYQ6eFuo3tOpp3ze658xHYLPr2ejnC
         7pfxV+Zpe8S3Z9BhProVgEe1L+XtXVzL81mH8o8zDkgw2qQPPsq5nSRvmNMiAI8Iah
         A9uB3NtZNA3ENNvazuXn4rlwMVJaSQxzaKFDovV7tAUyAd/06rTLJaKt53UXfFITYM
         Zc1/5zy/6t+M45WIOU+gpMHRNZ/aVxpkY29XI3cOB/l7E2xGnS6bpO+3+hdGyck2VM
         +t9RYJO3JX78w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltP1f-004kJy-5h; Wed, 16 Jun 2021 08:27:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 26/29] docs: trace: ftrace.rst: avoid using ReST :doc:`foo` markup
Date:   Wed, 16 Jun 2021 08:27:41 +0200
Message-Id: <cf9b03ff4b7917d9846503f198372bc6b821445b.1623824363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623824363.git.mchehab+huawei@kernel.org>
References: <cover.1623824363.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/trace/ftrace.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index b88c6b79db3e..cfc81e98e0b8 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -40,7 +40,7 @@ See events.rst for more information.
 Implementation Details
 ----------------------
 
-See :doc:`ftrace-design` for details for arch porters and such.
+See Documentation/trace/ftrace-design.rst for details for arch porters and such.
 
 
 The File System
-- 
2.31.1

