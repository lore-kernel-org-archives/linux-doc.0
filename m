Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47369C19F2C
	for <linux-doc@archiver.kernel.org>; Sun, 31 Jul 2022 06:18:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236214AbiGaGSb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 31 Jul 2022 02:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbiGaGSa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 31 Jul 2022 02:18:30 -0400
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr [80.12.242.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC86013D6B
        for <linux-doc@vger.kernel.org>; Sat, 30 Jul 2022 23:18:28 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id I2HRo3vdL5V1hI2HRokPDz; Sun, 31 Jul 2022 08:18:27 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 31 Jul 2022 08:18:27 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     "Theodore Ts'o" <tytso@mit.edu>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jonathan Corbet <corbet@lwn.net>,
        Wang Jianjian <wangjianjian3@huawei.com>
Cc:     linux-kernel@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] ext4, doc: Fix a broken layout
Date:   Sun, 31 Jul 2022 08:18:24 +0200
Message-Id: <d3ec14afe2396272da6353162b3081a0c92de313.1659248273.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The commit in Fixes: has removed an escaping character without updating
the layout of the table.

Add the missing space.

Fixes: 3103084afcf2 ("ext4, doc: remove unnecessary escaping")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 Documentation/filesystems/ext4/blockmap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/ext4/blockmap.rst b/Documentation/filesystems/ext4/blockmap.rst
index 2bd990402a5c..cc596541ce79 100644
--- a/Documentation/filesystems/ext4/blockmap.rst
+++ b/Documentation/filesystems/ext4/blockmap.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 +---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-| i.i_block Offset   | Where It Points                                                                                                                                                                                                              |
+| i.i_block Offset    | Where It Points                                                                                                                                                                                                              |
 +=====================+==============================================================================================================================================================================================================================+
 | 0 to 11             | Direct map to file blocks 0 to 11.                                                                                                                                                                                           |
 +---------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
-- 
2.34.1

