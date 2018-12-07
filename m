Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D259E7D8A3
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Dec 2018 19:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbeLGTMT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Dec 2018 14:12:19 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59720 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbeLGTMS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Dec 2018 14:12:18 -0500
Received: from localhost.localdomain (unknown [IPv6:2804:431:9719:1d1c:60c2:167c:a334:f7b3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 66EC62639EC;
        Fri,  7 Dec 2018 19:12:09 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-doc@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: [PATCH] configfs: fix wrong name of struct in documentation
Date:   Fri,  7 Dec 2018 17:11:58 -0200
Message-Id: <20181207191158.18769-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The name of the struct is configfs_bin_attribute instead of
configfs_attribute

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

 Documentation/filesystems/configfs/configfs.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/configfs/configfs.txt b/Documentation/filesystems/configfs/configfs.txt
index 3828e85345ae..16e606c11f40 100644
--- a/Documentation/filesystems/configfs/configfs.txt
+++ b/Documentation/filesystems/configfs/configfs.txt
@@ -216,7 +216,7 @@ be called whenever userspace asks for a write(2) on the attribute.
 
 [struct configfs_bin_attribute]
 
-	struct configfs_attribute {
+	struct configfs_bin_attribute {
 		struct configfs_attribute	cb_attr;
 		void				*cb_private;
 		size_t				cb_max_size;
-- 
2.19.1

