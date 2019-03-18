Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F1A57D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 23:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfCRXPh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 19:15:37 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37337 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727693AbfCRXPg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 19:15:36 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 4D5A721EAE;
        Mon, 18 Mar 2019 19:15:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 18 Mar 2019 19:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=ooOKa/ZqqBINC0OX8j3RPnzyNMPjMfRf5UkgG248/x4=; b=Qah7eJzP
        l3i1z9Ws6s/h6BAk9+qNH7OkKO/tVL/zbpFXZR7JblGunHuSAq6JMnoU4mbdhIaF
        NpGQGHihn1ApJenhkDpGCXSagOSUuqWV1MNL6OftaR+5DfWo/NSC3mx59Xsi3qhp
        DybedDwvRLSI3QPbGKM2qwjPEA+efebCOJ6UcGdjzA2+1Ll1kEN9UqHIza1VqzaA
        2/86Z1g4k2y6VPizG8xyBgJ2xnx6vh520wek3RONlZdKEdI9eOfawKD3rPOF7kGx
        P/y35qlShoteqX52eITSCxm3aX8rckxOJBBZn1qQgO1eXof/S8PteXGZqUEoDa44
        Z+YNwl8+EffL9Q==
X-ME-Sender: <xms:lyaQXFa2ZTydIg0VmEHZyrL4td0vEo1zHR_NWo-6XYKbUNgbOb9T2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddriedvgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepfdfvohgsihhn
    ucevrdcujfgrrhguihhnghdfuceothhosghinheskhgvrhhnvghlrdhorhhgqeenucfkph
    epuddvgedrudeiledrudegledrgedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgs
    ihhnsehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpeeh
X-ME-Proxy: <xmx:lyaQXArcjGXslQkwU_HJXFIrLrGO2QAOwqBEaYB9NdtVchW9TTu1_A>
    <xmx:lyaQXC-ZjRFIHgejEvcy--RX81Fpcjzh5Y_D4FXwa_wl6IPIyc4xSw>
    <xmx:lyaQXH98PbkeTfH971z3WHSqq5q_LqoU-grOTXa5knUS-J-Zip1kDQ>
    <xmx:lyaQXHAzlcgYyGM-HVCCWyzHz320Yw8gnpy1Wug0QDaHsqpPA4ALWw>
Received: from eros.localdomain (124-169-149-40.dyn.iinet.net.au [124.169.149.40])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9AA3F10311;
        Mon, 18 Mar 2019 19:15:32 -0400 (EDT)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] docs: filesystems: vfs: Use SPDX identifier
Date:   Tue, 19 Mar 2019 10:14:30 +1100
Message-Id: <20190318231437.1666-7-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190318231437.1666-1-tobin@kernel.org>
References: <20190318231437.1666-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently the licence is indicated via a custom string.  We have SPDX
license identifiers now for this task.

Use SPDX license identifier matching current license string.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/filesystems/vfs.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/vfs.txt b/Documentation/filesystems/vfs.txt
index 790feccca5f4..5c8358c73e30 100644
--- a/Documentation/filesystems/vfs.txt
+++ b/Documentation/filesystems/vfs.txt
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =========================================
 Overview of the Linux Virtual File System
 =========================================
@@ -9,8 +11,6 @@ Overview of the Linux Virtual File System
   Copyright (C) 1999 Richard Gooch
   Copyright (C) 2005 Pekka Enberg
 
-  This file is released under the GPLv2.
-
 
 Introduction
 ============
-- 
2.21.0

