Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D4427D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Mar 2019 21:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfCGVMm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 16:12:42 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:51915 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726399AbfCGVMl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 16:12:41 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 427DF375A;
        Thu,  7 Mar 2019 16:12:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 07 Mar 2019 16:12:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=bVP7aGtSjiIGPMpmVaoqjqM6LweDbyR18f0u4vGL3Hw=; b=3HYrDLdq
        ZFyGxu9c90MiQ71cC/IIFV2dV3GjLFma/ubQ9W376h/0dztwgfQbGWf0mxGx+jjm
        BtuFwIbqJv1nn69YAbR1Ob7ur20FXKDiNa4dXYKMhNWuVnfWWtpWz+amqFmbEXV6
        9A8V/htRN8B1zkLmXt41EdCsz9E3Q5k28JnHXRGz86hoVnJlrVvIO3tAbMUK0Yk3
        MLKymC3BL9vk1Pmo7nQiPaEod4b58TSovYDYoLXVG3gbONSz0GnCY9hGYrErjlfz
        /k7mQHGkwLenYfrloOCOQ5aA2M0YVJzGGzeGqFh1u0AlwfU2SVIRQWGJmVyAX5pu
        yLEbmKsQIBgA4A==
X-ME-Sender: <xms:R4mBXGQ4OIrsQWzexKWwmap3-9a5dDLiGyHDfvFuGE7AGydCx04TMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfeekgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfvfhosghi
    nhcuvedrucfjrghrughinhhgfdcuoehtohgsihhnsehkvghrnhgvlhdrohhrgheqnecukf
    hppeduvdegrdduieelrdehrdduheeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgs
    ihhnsehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:R4mBXC2gbjBmx2rGiHG7aC8FFEVErATo21fGMrR343rdbjOEA85ILA>
    <xmx:R4mBXIFStUH13CrCMIQYsx6fYsnyQwE4-kHevjApIe8l0vFqB6M_jQ>
    <xmx:R4mBXEzjxF9dWNtdcbOJHpBJYho6AAq1BxaJn8jlkYe9-zeulV-z6g>
    <xmx:R4mBXCtv7xucjv1GKdqKzZjH2Kkwscz_XYgOznvNFiqcNAbyCRiOfQ>
Received: from eros.localdomain (124-169-5-158.dyn.iinet.net.au [124.169.5.158])
        by mail.messagingengine.com (Postfix) with ESMTPA id E783210345;
        Thu,  7 Mar 2019 16:12:37 -0500 (EST)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] docs: Remove unknown 'hint' directive
Date:   Fri,  8 Mar 2019 08:11:51 +1100
Message-Id: <20190307211153.28400-8-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190307211153.28400-1-tobin@kernel.org>
References: <20190307211153.28400-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Current RST file contains an unknown directive causing Sphinx to emit

	ERROR: Unexpected indentation.

Use normal language construct instead.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/driver-api/dmaengine/dmatest.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/dmaengine/dmatest.rst b/Documentation/driver-api/dmaengine/dmatest.rst
index 8d81f1a7169b..25eecd2769b0 100644
--- a/Documentation/driver-api/dmaengine/dmatest.rst
+++ b/Documentation/driver-api/dmaengine/dmatest.rst
@@ -59,8 +59,8 @@ parameter, that specific channel is requested using the dmaengine and a thread
 is created with the existing parameters. This thread is set as pending
 and will be executed once run is set to 1. Any parameters set after the thread
 is created are not applied.
-.. hint::
-  available channel list could be extracted by running the following command::
+
+Hint: available channel list could be extracted by running the following command::
 
     % ls -1 /sys/class/dma/
 
-- 
2.21.0

