Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7142CC4338F
	for <linux-doc@archiver.kernel.org>; Sat, 31 Jul 2021 14:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53D4660C3F
	for <linux-doc@archiver.kernel.org>; Sat, 31 Jul 2021 14:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233147AbhGaOlE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 31 Jul 2021 10:41:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:45470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233196AbhGaOlC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 31 Jul 2021 10:41:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3381560BD3;
        Sat, 31 Jul 2021 14:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627742456;
        bh=sM0qIIYDSM6uxLbTF8xR4+8YYGeZoXUG+nR6TJptVG0=;
        h=From:To:Cc:Subject:Date:From;
        b=YCDueqslvMwOfxLzFMKpmeScRfuuzBAHyHtoe9Ah9F8ahNuRQM9ewEfupGFxvAhWN
         j4Xld27pskoPVVRD/8iSCiJhuaB5fgrsXolMXup87xMqG9kwdEsk9mctnxBRUBZBmj
         mR2dKr3pSiFkUT3YlxVmUnFqARqlKUtRA2eePxFtila2wcTCET0UTOe6LWxoRiwMOG
         wcauUIN/XfyQko+wG2kPzTqUfrtNSIdqpdxnRLtEEbepKUYhygzWf0FBdQYfb/gLAU
         9fT4Cg3zqbE09BD4K0NCE7K4lRnlmUrF6IBaBD2wZJGXjgDKxYDqOpuN3LKs63hlOA
         n7wvdlSiyCOOQ==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        andrew@lunn.ch, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net] docs: operstates: document IF_OPER_TESTING
Date:   Sat, 31 Jul 2021 07:40:52 -0700
Message-Id: <20210731144052.1000147-1-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

IF_OPER_TESTING is in fact used today.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 Documentation/networking/operstates.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/operstates.rst b/Documentation/networking/operstates.rst
index f6b9cce5b201..1ee2141e8ef1 100644
--- a/Documentation/networking/operstates.rst
+++ b/Documentation/networking/operstates.rst
@@ -73,7 +73,9 @@ TLV IFLA_OPERSTATE
  state (f.e. VLAN).
 
 IF_OPER_TESTING (4):
- Unused in current kernel.
+ Interface is in testing mode, for example executing driver self-tests
+ or media (cable) test. It can't be used for normal traffic until tests
+ complete.
 
 IF_OPER_DORMANT (5):
  Interface is L1 up, but waiting for an external event, f.e. for a
-- 
2.31.1

