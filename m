Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D44D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 04:06:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfAaEGr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 23:06:47 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55901 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726863AbfAaEGr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jan 2019 23:06:47 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id A09A42228A;
        Wed, 30 Jan 2019 23:06:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 30 Jan 2019 23:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=o70yMcTALVCpH
        SQ2vqyfrInczVfUorzvjPoiDAcmaJ0=; b=VJBdntec4+RBe+1B5ugt226HR3FdV
        2cnj86zNKwo389jyzRdQXVNxcHHazN/VB66KHIeEW8ms2FvhyOGA7HtmKrm9zXkJ
        D413JYhuryoi97dL4bckcgPz8Rb8tYgLo18tL5k/fQsMEZxSc+kOUbuC54PDVhLS
        0sP3FQOTTNH/lhPYW/Lt2N9C92qSN+RB4qcpHFhx8yAl6GlPIFEDQa3FkIXOUkhO
        OGsirqyV/GBalSysPQZfnK/Cdq9yNZczRftrMKj4rJbWiSLfgPHHrXWugkokNDZ7
        vl8FEgLjQA0JK7aHvM6bk4cLUGUZS+eOg1m7W0VHZ2Nxm93M0o2x5ugIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=o70yMcTALVCpHSQ2vqyfrInczVfUorzvjPoiDAcmaJ0=; b=QQVVZmEd
        7jlBL2eTH33dH4MeD5+Dd/rjHTZRiIoadxy4pbtpj6a6SzBIvrU2BGzZT2RbJIJI
        29xH3caSrcg/0kT1GshP8jZQvNmtqy1+hglufHlJr1Canh1Pg/kCJuGub7YNUfw3
        q2+4sCxLMjmyeHTHhb+s3FDRNG2ywM7s4rH4crFiHYJWo1bo0TJOj3n93EHEfPiL
        fIuuDNfeFcD871/YjDhnAFm2HfFWmWz6FmCaOadWFdfChGmH4Ql7rJYq7JLlPst8
        8+dozxSvGoV2I1xBFtC57yhNIdbU7FU5BX39wT26Q44csi54moIBDLywl0/xV9/Q
        Nv/nFjCXy7Dk6w==
X-ME-Sender: <xms:VnRSXIc4142EN3iSK3XQM-n1MfXOJMfENTNcHztOYxpJOdIkVJV1mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeehgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfedtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfvohgs
    ihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtohgsihhnrdgttgeqnecukfhppeduud
    ekrddvuddurddvudefrdduvddvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesthho
    sghinhdrtggtnecuvehluhhsthgvrhfuihiivgepfe
X-ME-Proxy: <xmx:VnRSXMklArimpFY3iu51bSaGscILk1wtAAR-6ixbZvlD5W94p24r1g>
    <xmx:VnRSXEEHjT07xg31cfdCISAYuBL94EUIgLgo3b8FmQEm42kdIIZ0JQ>
    <xmx:VnRSXIff5n5dYtwZXahtoeWmmHY4hFxDKpODXTGWWRwuGQHsbII8hg>
    <xmx:VnRSXLWLk5keUsQJr0Lzu2dTt1Y60MxudKOiafTIl2W2MbTWRQMZUQ>
Received: from eros.localdomain (ppp118-211-213-122.bras1.syd2.internode.on.net [118.211.213.122])
        by mail.messagingengine.com (Postfix) with ESMTPA id 79A0E10312;
        Wed, 30 Jan 2019 23:06:44 -0500 (EST)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: [PATCH 1/3] docs: Fix SLUB docs typo
Date:   Thu, 31 Jan 2019 15:06:21 +1100
Message-Id: <20190131040623.15569-2-me@tobin.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131040623.15569-1-me@tobin.cc>
References: <20190131040623.15569-1-me@tobin.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Tobin C. Harding" <tobin@kernel.org>

There is a minor typo in SLUB documentation.

Fix typo.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/vm/slub.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/vm/slub.rst b/Documentation/vm/slub.rst
index 195928808..0871c5849 100644
--- a/Documentation/vm/slub.rst
+++ b/Documentation/vm/slub.rst
@@ -141,7 +141,7 @@ can be influenced by kernel parameters:
 	(list_lock) where contention may occur.
 
 ``slub_min_order``
-	specifies a minim order of slabs. A similar effect like
+	specifies a minimum order of slabs. A similar effect like
 	``slub_min_objects``.
 
 ``slub_max_order``
-- 
2.20.1

