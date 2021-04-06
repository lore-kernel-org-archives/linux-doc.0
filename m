Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4057C433ED
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 22:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4FB4613CB
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 22:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbhDFW61 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 18:58:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:59658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232387AbhDFW61 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 18:58:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45A1C611EE;
        Tue,  6 Apr 2021 22:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617749898;
        bh=Blm98YmgFfRbUnQZpBPYNrgKyKvLbf4yx/fVw6NOED4=;
        h=From:To:Cc:Subject:Date:From;
        b=Jl7mrMBqwGubw3H2Il25t3rPlzPQtmdZFH1zb+PUH3GlLCMdu7gccf4UGlFeSkcAM
         m0zbtj3Skk7WlT1yW9z2ls/daMv+c4GxTy/YFxO9m2so5PbSBc/0RDLdDiLBIlmDqI
         HfZh3VT1UghgfKjcNC59F8xveMmK9t+yHYH0C4Tp/KmHBsSgi2NrA05zi4gAvW6vkX
         iVVWavPF2cV3ib5OGbjP6QTc2y+RbQktjSp9drNoxDi1mlkAcIlGItKtQVxUXZVxBb
         njUUXwZcoA68CYlW/hXHii5hsIc61X2P8m/DgzI2kLHY8taEJn6zUzq9+DJxZj/gC1
         DAdHW88lZXf8A==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        mkubecek@suse.cz, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net] docs: ethtool: fix some copy-paste errors
Date:   Tue,  6 Apr 2021 15:58:15 -0700
Message-Id: <20210406225815.1846660-1-kuba@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix incorrect documentation. Mostly referring to other objects,
likely because the text was copied and not adjusted.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 Documentation/networking/ethtool-netlink.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index 4bdb4298f178..dcb75c84c1ca 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -980,9 +980,9 @@ constraints on coalescing parameters and their values.
 
 
 PAUSE_GET
-============
+=========
 
-Gets channel counts like ``ETHTOOL_GPAUSE`` ioctl request.
+Gets pause frame settings like ``ETHTOOL_GPAUSEPARAM`` ioctl request.
 
 Request contents:
 
@@ -1011,7 +1011,7 @@ It will be empty if driver did not report any statistics. Drivers fill in
 Each member has a corresponding attribute defined.
 
 PAUSE_SET
-============
+=========
 
 Sets pause parameters like ``ETHTOOL_GPAUSEPARAM`` ioctl request.
 
@@ -1028,7 +1028,7 @@ Sets pause parameters like ``ETHTOOL_GPAUSEPARAM`` ioctl request.
 EEE_GET
 =======
 
-Gets channel counts like ``ETHTOOL_GEEE`` ioctl request.
+Gets Energy Efficient Ethernet settings like ``ETHTOOL_GEEE`` ioctl request.
 
 Request contents:
 
@@ -1058,7 +1058,7 @@ first 32 are provided by the ``ethtool_ops`` callback.
 EEE_SET
 =======
 
-Sets pause parameters like ``ETHTOOL_GEEEPARAM`` ioctl request.
+Sets Energy Efficient Ethernet parameters like ``ETHTOOL_SEEE`` ioctl request.
 
 Request contents:
 
-- 
2.30.2

