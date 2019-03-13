Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF3877D922
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Mar 2019 04:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfCMEKj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Mar 2019 00:10:39 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34205 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727258AbfCMEKh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Mar 2019 00:10:37 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 9112338A5;
        Wed, 13 Mar 2019 00:10:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 13 Mar 2019 00:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=wuyC/w0fZC/HLTA0wpZcPFlpk/EavVuLEU6w+kk4GK0=; b=xhh5r7xj
        pPf8WSU/QI5Dw0H0p2qYaDiT0LCbORQnjtCDu8Hgbj7swV1Bb6gpmcHyqxSAeA95
        AyxWu3HGXEnwt6sJF7edd+7bU1ZMhmH0mX90q6q7+UePY0gksCRyT26RnR27ivZc
        +lhBB809AXfiHVj6ZmxcRLDhA3raXdtYBTTlECkJ92gvL1crspR4qdFLYH8b60i5
        56z7YLeg8zyzS1QNB+0j1MNpqzaXOMKcTsFiOpoPGZd5Ms3gVdfSQ9ttKdKHQ0rz
        du8/e0WNYd1e7m7P0qErwZg3YFdhB5VpMqtPhO6V1ugmscsft1GJDUs69FI11pi4
        op6Yd7J991cTzA==
X-ME-Sender: <xms:vIKIXKvN5QnpMlhQD465dlQuh-GpDWtRsw0278vUM-NGE4xC4BTPxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrgeelgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfvohgsihhn
    ucevrdcujfgrrhguihhnghdfuceothhosghinheskhgvrhhnvghlrdhorhhgqeenucfkph
    epuddvgedrudeiledrvdefrddukeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgs
    ihhnsehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpeduud
X-ME-Proxy: <xmx:vIKIXEs9Q6D6H4P09ESnoRgWLiXLX_nzcU7Ej_Sx4ZUl1I_rYQWnWw>
    <xmx:vIKIXHcaagkKVydJCg514Z9FEh1OOTzos32LZg7lTQ4-12Mjjr0EQQ>
    <xmx:vIKIXNYk8SEZJpVx_tBdEBK7GKOUCohKpXEUWrtaOrrsnrLxV565VQ>
    <xmx:vIKIXGQvCz9zIWOcsABY1KPA8JjmNkJhuK41QZ7IaRHO-AW_--EiFQ>
Received: from eros.localdomain (124-169-23-184.dyn.iinet.net.au [124.169.23.184])
        by mail.messagingengine.com (Postfix) with ESMTPA id A8319E4360;
        Wed, 13 Mar 2019 00:10:33 -0400 (EDT)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] docs: filesystems: vfs: Use backticks to guard star
Date:   Wed, 13 Mar 2019 15:09:19 +1100
Message-Id: <20190313040919.6937-14-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190313040919.6937-1-tobin@kernel.org>
References: <20190313040919.6937-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx emits a warning because of the use of a * (C pointer construct)
within the document.  We can prevent this by guarding the C source code
with back ticks.

Use backticks to guard star (C pointer).

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/filesystems/vfs.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index c0259538a759..838777133f53 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -355,7 +355,7 @@ Extended attributes are name:value pairs.
 
 When none of the xattr handlers of a filesystem match the specified
 attribute name or when a filesystem doesn't support extended attributes,
-the various *xattr(2) system calls return -EOPNOTSUPP.
+the various ``*xattr(2)`` system calls return -EOPNOTSUPP.
 
 
 The Inode Object
@@ -722,7 +722,7 @@ cache in your filesystem.  The following members are defined:
   out properly.
 
   The filesystem must return the locked pagecache page for the specified
-  offset, in *pagep, for the caller to write into.
+  offset, in ``*pagep``, for the caller to write into.
 
   It must be able to cope with short writes (where the length passed to
   write_begin is greater than the number of bytes copied into the page).
-- 
2.21.0

