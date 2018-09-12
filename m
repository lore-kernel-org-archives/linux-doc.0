Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60DFB7DE7D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 17:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbeILWlh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 18:41:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47916 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727651AbeILWl2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 Sep 2018 18:41:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0E2B0804B4DB;
        Wed, 12 Sep 2018 17:35:55 +0000 (UTC)
Received: from llong.com (dhcp-17-55.bos.redhat.com [10.18.17.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 78F742156899;
        Wed, 12 Sep 2018 17:35:54 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jan Kara <jack@suse.cz>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Larry Woodman <lwoodman@redhat.com>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        "Wangkai (Kevin C)" <wangkai86@huawei.com>,
        Michal Hocko <mhocko@kernel.org>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v4 2/3] fs: Don't need to put list_lru into its own cacheline
Date:   Wed, 12 Sep 2018 13:35:41 -0400
Message-Id: <1536773742-32687-3-git-send-email-longman@redhat.com>
In-Reply-To: <1536773742-32687-1-git-send-email-longman@redhat.com>
References: <1536773742-32687-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 12 Sep 2018 17:35:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 12 Sep 2018 17:35:55 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The list_lru structure is essentially just a pointer to a table of
per-node LRU lists. Even if CONFIG_MEMCG_KMEM is defined, the list
field is just used for LRU list registration and shrinker_id is set
at initialization. Those fields won't need to be touched that often.

So there is no point to make the list_lru structures to sit in their
own cachelines.

Signed-off-by: Waiman Long <longman@redhat.com>
Reviewed-by: Dave Chinner <dchinner@redhat.com>
---
 include/linux/fs.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3332270..fd4cd8a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1443,11 +1443,12 @@ struct super_block {
 	struct user_namespace *s_user_ns;
 
 	/*
-	 * Keep the lru lists last in the structure so they always sit on their
-	 * own individual cachelines.
+	 * The list_lru structure is essentially just a pointer to a table
+	 * of per-node lru lists, each of which has its own spinlock.
+	 * There is no need to put them into separate cachelines.
 	 */
-	struct list_lru		s_dentry_lru ____cacheline_aligned_in_smp;
-	struct list_lru		s_inode_lru ____cacheline_aligned_in_smp;
+	struct list_lru		s_dentry_lru;
+	struct list_lru		s_inode_lru;
 	struct rcu_head		rcu;
 	struct work_struct	destroy_work;
 
-- 
1.8.3.1

