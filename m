Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F170C47426
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C70FC2075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472380;
	bh=aku/UqgSvnZLntkwVHFchuchgI6ne7BFwihXevm3wEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=w3f2PA2U2+op0ff4LUS+3k+/wX2lfb84bXuMtvE9hsXMWlrkvpl/QHMVX5SOhdSNu
	 D0XvkOWdFhgm8eud/5lYQ9sf78DIISCr6TLA59ftY0oDaCsGe9gjPYCaUysLfejWMQ
	 yq954w0tmrn+K5oDYUzKNCsJIK/43TO+rMesjFKI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730276AbgI3NZW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730232AbgI3NZV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:21 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F39FA2388B;
        Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=aku/UqgSvnZLntkwVHFchuchgI6ne7BFwihXevm3wEM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wRvbXM29gZvbbjWLi9QF+sw/R1VV46gD7TI3UY5fvZewJDUOMeczox30v6lZlSmhH
         sVTVKmKVUHQ6dlvMrHzCol+BxC98pWiG12+HSz0FQp0e8Dzz9lSv/wpqVB6WJPODKT
         anOR4KTtjORA+EPrakngwk/2LRa80KW3Wb+/K/Ys=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6h-001XKL-41; Wed, 30 Sep 2020 15:25:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH v4 33/52] docs: net: statistics.rst: remove a duplicated kernel-doc
Date:   Wed, 30 Sep 2020 15:24:56 +0200
Message-Id: <c484b653417a3ba2c0eb7bb70331397577a71980.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

include/linux/ethtool.h is included twice with kernel-doc,
both to document ethtool_pause_stats(). The first one is
at statistics.rst, and the second one at ethtool-netlink.rst.

Replace one of the references to use the name of the
function. The automarkup.py extension should create the
cross-references.

Solves this warning:

	../Documentation/networking/ethtool-netlink.rst: WARNING: Duplicate C declaration, also defined in 'networking/statistics'.
	Declaration is 'ethtool_pause_stats'.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/networking/statistics.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/networking/statistics.rst b/Documentation/networking/statistics.rst
index 8e15bc98830b..234abedc29b2 100644
--- a/Documentation/networking/statistics.rst
+++ b/Documentation/networking/statistics.rst
@@ -175,5 +175,4 @@ The following structures are internal to the kernel, their members are
 translated to netlink attributes when dumped. Drivers must not overwrite
 the statistics they don't report with 0.
 
-.. kernel-doc:: include/linux/ethtool.h
-    :identifiers: ethtool_pause_stats
+- ethtool_pause_stats()
-- 
2.26.2

