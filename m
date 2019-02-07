Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB74F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 20:15:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfBGUPt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 15:15:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55602 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726650AbfBGUPt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Feb 2019 15:15:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CD3DB20B01;
        Thu,  7 Feb 2019 20:15:48 +0000 (UTC)
Received: from llong.com (dhcp-17-35.bos.redhat.com [10.18.17.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CE4E462986;
        Thu,  7 Feb 2019 20:15:45 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v2] Documentation: Fix grammatical error in sysctl/fs.txt & clarify negative dentry
Date:   Thu,  7 Feb 2019 15:15:42 -0500
Message-Id: <1549570542-2471-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 07 Feb 2019 20:15:49 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a grammatical error in the dentry-state text and clarify the usage
of negative dentries.

Fixes: af0c9af1b3f66 ("fs/dcache: Track & report number of negative dentries")

Signed-off-by: Waiman Long <longman@redhat.com>
---
 Documentation/sysctl/fs.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/sysctl/fs.txt b/Documentation/sysctl/fs.txt
index 58649bd..ebc679b 100644
--- a/Documentation/sysctl/fs.txt
+++ b/Documentation/sysctl/fs.txt
@@ -80,7 +80,9 @@ nonzero when shrink_dcache_pages() has been called and the
 dcache isn't pruned yet.
 
 nr_negative shows the number of unused dentries that are also
-negative dentries which do not mapped to actual files.
+negative dentries which do not map to any files. Instead,
+they help speeding up rejection of non-existing files provided
+by the users.
 
 ==============================================================
 
-- 
1.8.3.1

