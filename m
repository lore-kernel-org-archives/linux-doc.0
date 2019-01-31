Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7E09F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 04:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfAaEGu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 23:06:50 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36711 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726863AbfAaEGu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jan 2019 23:06:50 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id E954E22379;
        Wed, 30 Jan 2019 23:06:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 30 Jan 2019 23:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=vO60dR2e22Xp4
        dXd9SAGOxUNsYqzKSRswNuAvPihAWk=; b=iZKxeDtQPYVArE8l+G36Q9eiJfZZo
        /p5PTxpgRzvZQffpj93gOp1WK60RDf+wgwtuuMYth+RT1zJfHbOBuHlPKZUc2Gol
        jlznzt40ldKlEDBh7on4LnnxpyCdDuCFurTfrG8L38hoy7oFAa9gL+cyS/Avqopq
        1xSdNeXlGNDbWbSsODyob/qAA11WLXwge+wvDvII4qwYZHuQ3vg43bd2CU4XFKTC
        OKBCJIV7qZTSvdiGvgZinAbiUvxCUInWnoZCCwdB5ngw7fXvqZNukftL+3LveDAU
        hhzcyG4p8xTiECKm84iM/8kPkyEpEomIhc+PXyjbBHLuJSmu9U3hMEjnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=vO60dR2e22Xp4dXd9SAGOxUNsYqzKSRswNuAvPihAWk=; b=pP3qz8lJ
        PBmgJR34RzPYMdHxPkz0jMhyZhuaWY+jIXsryjUddSSRZ0csHJk/+WFNb8fvRI/u
        6wQ5gNkfQi3+juxxFge6tt2jhpKfR6or93DW0ozrY77oyoGyQ9csWRGhKJIcqunF
        va6aV3KRbmmkL42uajwjfxwhrcIL1FyJDD4vtgMd/RCd53Qcze9BHtHDwKfsLyxx
        G84BnMEAFd29t+Tmt3QGfWFMp0UiNEhQTxxpxr6kbBqagC0nNk21pQ5BYZoa7B7y
        LD+QxqY6xceB4rH+ju8Gx7HkS8+0m0JeiOvhYtQik3+ziZ1KTZxCfJHi5A2m62p2
        OZusPJ00yK2s9w==
X-ME-Sender: <xms:WHRSXEbR9ea2YrMu8GEk5DJRrIfjLWVii_oLxUuLR-x84yACK32KWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeehgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfedtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfvohgs
    ihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtohgsihhnrdgttgeqnecukfhppeduud
    ekrddvuddurddvudefrdduvddvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesthho
    sghinhdrtggtnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:WHRSXKQaM0d4C1WTTlbk2u7eQSFDW2eoyFGpDHzvD50KtHkpxUUN7Q>
    <xmx:WHRSXJL7R9P2y0rUFJYIc4hQguBqZlPMLnkjtvwpRiLxM5Trfm3b4w>
    <xmx:WHRSXAWHQvj1cX3JhiMk222zxQT-C_5r4vVEwOfjbp-wEHVb6he65w>
    <xmx:WHRSXKEC1WKux1hRynWwGo9HNA6NfnMj4RIMnoiKYrQP9WodG0Ztww>
Received: from eros.localdomain (ppp118-211-213-122.bras1.syd2.internode.on.net [118.211.213.122])
        by mail.messagingengine.com (Postfix) with ESMTPA id 01BF510086;
        Wed, 30 Jan 2019 23:06:46 -0500 (EST)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: [PATCH 2/3] docs: Add missing colon
Date:   Thu, 31 Jan 2019 15:06:22 +1100
Message-Id: <20190131040623.15569-3-me@tobin.cc>
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

sphinx emits warning

       WARNING: Inline emphasis start-string without end-string.

This is caused by a missing colon.

Add missing colon, clearing shpinx build warning.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/vm/slub.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/vm/slub.rst b/Documentation/vm/slub.rst
index 0871c5849..933ada436 100644
--- a/Documentation/vm/slub.rst
+++ b/Documentation/vm/slub.rst
@@ -66,7 +66,7 @@ Trying to find an issue in the dentry cache? Try::
 to only enable debugging on the dentry cache.  You may use an asterisk at the
 end of the slab name, in order to cover all slabs with the same prefix.  For
 example, here's how you can poison the dentry cache as well as all kmalloc
-slabs:
+slabs::
 
 	slub_debug=P,kmalloc-*,dentry
 
-- 
2.20.1

