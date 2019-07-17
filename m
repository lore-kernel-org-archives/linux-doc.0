Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 446797DBD4
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 11:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfGQLFi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 07:05:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47010 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfGQLFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 07:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kU4lZoZk1BRhrx8HkLHCBdk7MNLvQ8R2y7TKkaZGQ4g=; b=ODLW/jnT6KakAdssvFOjSFtrlj
        o1+SG765oBcxOps7Sm/hx8xi6KvevyBYWxTP6F4yTtofF4HjObt9FQyQmDvKnmMhmakX5KY9tOaKd
        Iv2MyeQ6awDKWwc3DCAhJGFBB22CRElAKAvK33bAmQ4qAMj6gcPM7hU35WLPNFx+y/jeqbfd+ojtt
        7tPLfyy9uKysKS+w2IpK8kC/YXzMAfGesybsBh+vFpboUTY3bPEbXxuSOYSw1A3rXRwzqElnLuYqK
        rTAyXFQJVB2eSIL9K5h69f298upkih0RrTzC6aW8jAn/Kl3mKXI6n2fo6DWNX/U/xG+0RMPfdBv77
        NKxMLjoA==;
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnhke-00054J-I3; Wed, 17 Jul 2019 11:05:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hnhkc-00039L-Lb; Wed, 17 Jul 2019 08:05:34 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 08/20] docs: kernel_abi.py: Update copyrights
Date:   Wed, 17 Jul 2019 08:05:21 -0300
Message-Id: <f069b8c2a5e4a9278cc05558a3c3f54f03fe0661.1563360659.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1563360659.git.mchehab+samsung@kernel.org>
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As Markus doesn't want to maintain ths file, update it to
put me as its maintainer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 2d5d582207f7..ef91b1e1ff4b 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -7,7 +7,8 @@ u"""
     Implementation of the ``kernel-abi`` reST-directive.
 
     :copyright:  Copyright (C) 2016  Markus Heiser
-    :copyright:  Copyright (C) 2016  Mauro Carvalho Chehab
+    :copyright:  Copyright (C) 2016-2019  Mauro Carvalho Chehab
+    :maintained-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
     :license:    GPL Version 2, June 1991 see Linux/COPYING for details.
 
     The ``kernel-abi`` (:py:class:`KernelCmd`) directive calls the
-- 
2.21.0

