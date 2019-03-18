Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B79887D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 23:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbfCRXPm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 19:15:42 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36599 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727739AbfCRXPk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 19:15:40 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id DD488220D3;
        Mon, 18 Mar 2019 19:15:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 18 Mar 2019 19:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=KI88KXE/VwgS/93kb7QWVrDbaWWMc5prnOguY0XMKY4=; b=g/i14s8Z
        fv3g6OlcaJDQQrkQbzyOpqjGeDyh4Yr+/BYKMenUC+8jVvij5nHtLWohxvNqf4r4
        v2PQGtwDj3AFBYOFz1xXmkzc9k73k4sgHLK1cVhE0XTyic1HCKVWh1lzWKrrWFfB
        Q26K7CkgbK5adf5INrLUmDyX2U/pJU9/x1LavNPXaedvB6g56FwmM/UjmQao4J4n
        Een2Vp7anzUAfV4dHRELMlWVq1fFPA973LX2hyImXnVnbyXEYqrdMOztTSufRMyl
        e4eYJhumVH9TWJCRrhrRdWUGIiJTMi0UpwueH2I0/gPd672LMmGK3ZdAN46fPGBd
        tj+88OmhiwVXfw==
X-ME-Sender: <xms:miaQXPwH2422BOpQNEp3rDpz2e5vWTYGywm8gjwMZFM66F2hcXm5Tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddriedvgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfvohgsihhn
    ucevrdcujfgrrhguihhnghdfuceothhosghinheskhgvrhhnvghlrdhorhhgqeenucfkph
    epuddvgedrudeiledrudegledrgedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgs
    ihhnsehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpeei
X-ME-Proxy: <xmx:miaQXKcrkjAcEHjyhLK8hJM2fgSuBmD9SrZg0abV8nNC5oaTbCazzQ>
    <xmx:miaQXAK2lYoHQGgX6vI1WSOLJJi8dQIpymQtTRnFTmaG8-ciobGMCQ>
    <xmx:miaQXOlnraYM3QBO3G0ViLatGQd47oW5W9MTboM--p4lujHeXzqPpQ>
    <xmx:miaQXKz52eTmtiG_EDfaaclKUfyjMGswJ8Wl9_Gh0xIQfKwmntDUrg>
Received: from eros.localdomain (124-169-149-40.dyn.iinet.net.au [124.169.149.40])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2324F1031F;
        Mon, 18 Mar 2019 19:15:35 -0400 (EDT)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] docs: filesystems: vfs: Fix pre-amble indentation
Date:   Tue, 19 Mar 2019 10:14:31 +1100
Message-Id: <20190318231437.1666-8-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190318231437.1666-1-tobin@kernel.org>
References: <20190318231437.1666-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently file pre-amble contains custom indentation.  RST is not going
to like this, lets left-align the text.  Put the copyright notices in a
list in preparation for converting document to RST.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---

Any better ideas than using a list to hold the copyright lines?

 Documentation/filesystems/vfs.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/vfs.txt b/Documentation/filesystems/vfs.txt
index 5c8358c73e30..43b18bafbc20 100644
--- a/Documentation/filesystems/vfs.txt
+++ b/Documentation/filesystems/vfs.txt
@@ -4,12 +4,12 @@
 Overview of the Linux Virtual File System
 =========================================
 
-	Original author: Richard Gooch <rgooch@atnf.csiro.au>
+Original author: Richard Gooch <rgooch@atnf.csiro.au>
 
-		  Last updated on June 24, 2007.
+Last updated on June 24, 2007.
 
-  Copyright (C) 1999 Richard Gooch
-  Copyright (C) 2005 Pekka Enberg
+- Copyright (C) 1999 Richard Gooch
+- Copyright (C) 2005 Pekka Enberg
 
 
 Introduction
-- 
2.21.0

