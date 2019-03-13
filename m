Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 29B447D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Mar 2019 04:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfCMEKO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Mar 2019 00:10:14 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:43173 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726998AbfCMEKN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Mar 2019 00:10:13 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id B54D138DE;
        Wed, 13 Mar 2019 00:10:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 13 Mar 2019 00:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=iT6gobTloWGYKNvcQoYjvlfXxly4mgEhkC/qn3HZUto=; b=ANgBypGG
        GPQNvdoA4wYMiMIQ8HiyNdcUAAhE4Crx12TFIlZjIa+dNPTS250es8YILta9woSN
        nnmXMf7rrgH14gF3xMa9nhpwSx/2dWKBEeeb+Lf5sDW83Ma0Q0IaVXje3bqEaB6o
        kli9uYDUNGJ9qVIcyvOBm4mzqJZIugTE30BZC4zM+ciKqbce5xdb0GcFL2zagDdE
        RHyqiN+PsWkpfaGJRAvXmz2fRKKtTOPaqJ2s+itPAd7M3q7GM9OHP7WisbO6L1Ca
        Gk8eK+/sYO7h8Tfq4XnyWe7wbdjlMMSnFkHs5UaY7eRmBJGHh+IbVbxm9XIBqPJk
        gTtuJ0tvLCp52w==
X-ME-Sender: <xms:o4KIXHfBgtOiYP3fJYDNnE7njpRhf85ILg8aHHomlJ2-UCWalTrViQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrgeelgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfvohgsihhn
    ucevrdcujfgrrhguihhnghdfuceothhosghinheskhgvrhhnvghlrdhorhhgqeenucfkph
    epuddvgedrudeiledrvdefrddukeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgs
    ihhnsehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:o4KIXOvlEtcIID3dQb8f0fOKL6NVxywtrW81VTnOeuAV6Rp0MbQXaQ>
    <xmx:o4KIXOLf5m4Igg0fxl47akNNi8r9pBT3r-GY0x-H9OOYn2H4eOLiBg>
    <xmx:o4KIXAYSihJlkvLpg09X2EXyX4ZH5sLC_uGtHwNQQMHt4rAVyNZMiQ>
    <xmx:o4KIXEVKsSs99GMjq4JN_BNUviB352O4u0SJQKTLNtJsf44iOkFbZw>
Received: from eros.localdomain (124-169-23-184.dyn.iinet.net.au [124.169.23.184])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0F0EEE4360;
        Wed, 13 Mar 2019 00:10:08 -0400 (EDT)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] docs: filesystems: vfs: Use correct initial heading
Date:   Wed, 13 Mar 2019 15:09:11 +1100
Message-Id: <20190313040919.6937-6-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190313040919.6937-1-tobin@kernel.org>
References: <20190313040919.6937-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kernel RST has a preferred heading adornment scheme.  Currently all the
heading adornments follow this scheme except the document heading.

Use correct heading adornment for initial heading.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/filesystems/vfs.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/vfs.txt b/Documentation/filesystems/vfs.txt
index b452b3fc5edc..0bc45c3a33db 100644
--- a/Documentation/filesystems/vfs.txt
+++ b/Documentation/filesystems/vfs.txt
@@ -1,5 +1,6 @@
-
-	      Overview of the Linux Virtual File System
+=========================================
+Overview of the Linux Virtual File System
+=========================================
 
 	Original author: Richard Gooch <rgooch@atnf.csiro.au>
 
-- 
2.21.0

