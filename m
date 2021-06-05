Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1F5C49361
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 13:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1C3761450
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 13:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhFENUm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Jun 2021 09:20:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230136AbhFENU1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91F0C6145D;
        Sat,  5 Jun 2021 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899118;
        bh=Zl+ZYs1qMh1ssinXO6bJDW7srAJFrDAxrK9NTRoL0So=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YpF8iOCQkZL7WP9NN6pA/AYPsZWdoabF2tBCwWkjOs4I5b9YXiqI1R25ZHboEUZu8
         k0Ig+kJKEZUHKb9I2sxjjB102EKXNoki+HQVkP6Gbmc1W1DjarynOlyYFWcjmKKB3s
         xCqZ8jSwKb/hpBP1ulotC5EjQmSXJyfbSjEkIlJCtHrcFO4AuTEytAi0GRTpTrpRWD
         YjCgGpqsSjaXgm2aqUBbMfUseOca4H3XGPP3z8jq124jnejIFyNfbc7GjKFWqFyjxO
         wwurBO7hzq0FZULzUToQuQednu13kEK1O2isUGLTz5ckU0eB9llsmc9sfISZyUcvsy
         53esdedl2Za1A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCC-008GGT-PW; Sat, 05 Jun 2021 15:18:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 31/34] docs: trace: ftrace.rst: avoid using ReSt :doc:`foo` markup
Date:   Sat,  5 Jun 2021 15:18:30 +0200
Message-Id: <cb57fb87323121961550ed7f8778275e5b82ce2a.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
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

