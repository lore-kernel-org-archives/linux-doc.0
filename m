Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB39EB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 16:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjF3QAh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 12:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjF3QAg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 12:00:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23843C00
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 09:00:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 690FB61792
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 16:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D6BC433C0;
        Fri, 30 Jun 2023 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688140834;
        bh=uYDvEiWptSjKoEmPqZloji6Rv0TWhRiCflg3ZFi70eY=;
        h=From:To:Cc:Subject:Date:From;
        b=XjF1ac0CCyldB3FBFPlLtog+nztvqTBxaZRDeoB5rLQFdOeX4pjLmJjjgCltOMHqp
         Ou7eQ9YBr77wATpMKZm8CkNvuFtRf700U/v+aUWFohOv7wRlW9Yy1KlocolrGBxE1a
         I5pFhqs9XzUKjoyATq7u6Zrm56NzdcsYUjKg7fnwJ3OleL8/2831WRplVJe++cioG7
         Auk/jmJ37NfZGo0Whleh6A2rf3qQs1S4LDu8WoTJgt2JcltAruL5R9QP9abWJmN2xz
         CgeAw/2ZuqU1L8ZMy7FSNC83wqlZOQbNo0UzcCtTOYPeSO33M+ZBwY06Evj8sOEmtl
         zjaryK6L8ZQgg==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net] docs: netdev: broaden mailbot to all MAINTAINERS
Date:   Fri, 30 Jun 2023 09:00:25 -0700
Message-ID: <20230630160025.114692-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reword slightly now that all MAINTAINERS have access to the commands.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 Documentation/process/maintainer-netdev.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index 83614cec9328..2397b31c0198 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -149,8 +149,11 @@ themselves. No email should ever be sent to the list with the main purpose
 of communicating with the bot, the bot commands should be seen as metadata.
 
 The use of the bot is restricted to authors of the patches (the ``From:``
-header on patch submission and command must match!), maintainers themselves
-and a handful of senior reviewers. Bot records its activity here:
+header on patch submission and command must match!), maintainers of
+the modified code according to the MAINTAINERS file (again, ``From:``
+must match the MAINTAINERS entry) and a handful of senior reviewers.
+
+Bot records its activity here:
 
   https://patchwork.hopto.org/pw-bot.html
 
-- 
2.41.0

