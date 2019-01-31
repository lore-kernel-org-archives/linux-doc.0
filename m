Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CFA567D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 04:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbfAaEGw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 23:06:52 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41633 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726863AbfAaEGw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jan 2019 23:06:52 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 4DBB222213;
        Wed, 30 Jan 2019 23:06:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 30 Jan 2019 23:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=oEUaDKPaaLNWR
        ZJ8hop0M9B3xHjHvQIeS1o6V3mlMgE=; b=fgb2MslJZsVKkxnzTKGpPSlsP4hDf
        JgeP2pwPmquIOuZJ9o3qFD/PZdGGcbBcumA6BMpyjKKxyaoyKUV5Q9OCIAD9KmZe
        41hpV3IXLz8a7K19HS4mF5SNriUQvGVhFJ8apY8ZnG33deUdYI5EzRC0K/8ysCMb
        OvketX15QbkGANbWeZYdEpIbeLCuPr5Sa/95WSn8s/rBoQbDXvYWmr+2G8adepFA
        sSRMBQuWS2fqjafnGW4NHJaOVReCGyisTgZqCjUwFhVrF3ywNyu5Jb0BQMbZbs7U
        MFDwhbwVCIeKz1KzeaozRmaTKixMEg16qI458e2+kvo4mHcglZcNtqWRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=oEUaDKPaaLNWRZJ8hop0M9B3xHjHvQIeS1o6V3mlMgE=; b=WMwk3EWd
        av5BVNZ8376SBy7f7w87TOeBkdg9UwGSypld+epZ9FWj/Oa6GppyomkyDF/38NnZ
        Vj7p5wS2jFLCwAg10061h4G5wi9jUaGE8QnET5bCz+23JP9USrQ/PahRt4bt9h4x
        9TiC+m2w/sxADB9uZQNtg/8neUEmX++31tpuVnGvdDehfY/n2+tK28fCNlRkepbp
        r5cZ41TSLNhzvfJv5U4MVU8r3vJPnvV8aAmeW8xvc6NM+zhrQSMzc34+tRR0Xjk9
        V1NXXNbxbw4h8eOxFpd+UMdcES9CYXwbuOukX9ZNCQNOCzaBHD89D24IsLqYmu5K
        eep2KPV1Y+ArMA==
X-ME-Sender: <xms:W3RSXBgZwXtbNal2G-fBy98hXuH22FqFWgHvxPwG1CbegO0yiXiWtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeehgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfedtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfvohgs
    ihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtohgsihhnrdgttgeqnecukfhppeduud
    ekrddvuddurddvudefrdduvddvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesthho
    sghinhdrtggtnecuvehluhhsthgvrhfuihiivgepge
X-ME-Proxy: <xmx:W3RSXGM1LFSuYWyEMmf3KgNDXAUz4TLGHmgZmJ5k7TIhkY1v3Pb_3w>
    <xmx:W3RSXC7258fCGbmfkfA2hl-yZT0NQOPpWS8Qy4eC8g6OT3s4zoeR6A>
    <xmx:W3RSXE2jH0Xw8dBBtS8fil4kP48mh7jMid2IZu9_mzW4AprbsvNxwg>
    <xmx:W3RSXFF8b0sEnw4eH0YeIRTbncOe-Encfa_19sXv3brGXEpt743cMg>
Received: from eros.localdomain (ppp118-211-213-122.bras1.syd2.internode.on.net [118.211.213.122])
        by mail.messagingengine.com (Postfix) with ESMTPA id 629F010086;
        Wed, 30 Jan 2019 23:06:49 -0500 (EST)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: [PATCH 3/3] docs: Use underscore not hyphen in label
Date:   Thu, 31 Jan 2019 15:06:23 +1100
Message-Id: <20190131040623.15569-4-me@tobin.cc>
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

       WARNING: undefined label: memory-allocation ...

This seems to be caused by the use of a hyphen in the label name instead
of an underscore.  Using an underscore for the label name and the
reference clears the warning.

Use underscore not hyphen in label and reference.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---

Not 100% sure this is the correct fix, please review.

thanks

 Documentation/core-api/memory-allocation.rst | 2 +-
 Documentation/vm/index.rst                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 8954a88ff..39f35ebdc 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -1,4 +1,4 @@
-.. _memory-allocation:
+.. _memory_allocation:
 
 =======================
 Memory Allocation Guide
diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
index 2b3ab3a1c..b58cc3bfe 100644
--- a/Documentation/vm/index.rst
+++ b/Documentation/vm/index.rst
@@ -4,7 +4,7 @@ Linux Memory Management Documentation
 
 This is a collection of documents about the Linux memory management (mm)
 subsystem.  If you are looking for advice on simply allocating memory,
-see the :ref:`memory-allocation`.
+see the :ref:`memory_allocation`.
 
 User guides for MM features
 ===========================
-- 
2.20.1

