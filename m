Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 91FAE7D92A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 27 May 2019 22:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfE0W1F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 27 May 2019 18:27:05 -0400
Received: from ms.lwn.net ([45.79.88.28]:58682 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727167AbfE0W1F (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 May 2019 18:27:05 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 3D09D728;
        Mon, 27 May 2019 22:27:05 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 5/7] docs: no structured comments in fs/file_table.c
Date:   Mon, 27 May 2019 16:26:56 -0600
Message-Id: <20190527222658.27304-6-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527222658.27304-1-corbet@lwn.net>
References: <20190527222658.27304-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove the kernel-doc directive, since there are only warnings to be found
there.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/filesystems/api-summary.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/filesystems/api-summary.rst b/Documentation/filesystems/api-summary.rst
index aa51ffcfa029..bbb0c1c0e5cf 100644
--- a/Documentation/filesystems/api-summary.rst
+++ b/Documentation/filesystems/api-summary.rst
@@ -89,9 +89,6 @@ Other Functions
 .. kernel-doc:: fs/direct-io.c
    :export:
 
-.. kernel-doc:: fs/file_table.c
-   :export:
-
 .. kernel-doc:: fs/libfs.c
    :export:
 
-- 
2.21.0

