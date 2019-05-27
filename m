Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4EA0D7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Mon, 27 May 2019 22:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfE0W1E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 27 May 2019 18:27:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:58676 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727018AbfE0W1E (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 27 May 2019 18:27:04 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 49C446D9;
        Mon, 27 May 2019 22:27:04 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/7] docs: Do not seek comments in kernel/rcu/tree_plugin.h
Date:   Mon, 27 May 2019 16:26:52 -0600
Message-Id: <20190527222658.27304-2-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527222658.27304-1-corbet@lwn.net>
References: <20190527222658.27304-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are no kerneldoc comments in this file, so do not attempt to
include them in the docs build.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/core-api/kernel-api.rst | 2 --
 Documentation/driver-api/basics.rst   | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index a29c99d13331..a53ec2eb8176 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -358,8 +358,6 @@ Read-Copy Update (RCU)
 
 .. kernel-doc:: kernel/rcu/tree.c
 
-.. kernel-doc:: kernel/rcu/tree_plugin.h
-
 .. kernel-doc:: kernel/rcu/tree_exp.h
 
 .. kernel-doc:: kernel/rcu/update.c
diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index e970fadf4d1a..1ba88c7b3984 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -115,9 +115,6 @@ Kernel utility functions
 .. kernel-doc:: kernel/rcu/tree.c
    :export:
 
-.. kernel-doc:: kernel/rcu/tree_plugin.h
-   :export:
-
 .. kernel-doc:: kernel/rcu/update.c
    :export:
 
-- 
2.21.0

