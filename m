Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 715227D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 21:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730064AbeLJVlO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 16:41:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43408 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728470AbeLJVlN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Dec 2018 16:41:13 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3C52730026D1;
        Mon, 10 Dec 2018 21:41:13 +0000 (UTC)
Received: from llong.com (dhcp-17-223.bos.redhat.com [10.18.17.223])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 926475C1B4;
        Mon, 10 Dec 2018 21:41:11 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Johannes Weiner <hannes@cmpxchg.org>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-api@vger.kernel.org,
        Roman Gushchin <guro@fb.com>, Jens Axboe <axboe@kernel.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v5 3/5] cgroup: Make debug controller report new controller masks
Date:   Mon, 10 Dec 2018 16:40:56 -0500
Message-Id: <1544478058-24252-4-git-send-email-longman@redhat.com>
In-Reply-To: <1544478058-24252-1-git-send-email-longman@redhat.com>
References: <1544478058-24252-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 10 Dec 2018 21:41:13 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The newly added cgroup controller masks (subtree_bypass and
enable_ss_mask) are now being reported in the debug.masks controller
file.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/cgroup/debug.c b/kernel/cgroup/debug.c
index 5f1b873..176bb9e 100644
--- a/kernel/cgroup/debug.c
+++ b/kernel/cgroup/debug.c
@@ -263,6 +263,8 @@ static int cgroup_masks_read(struct seq_file *seq, void *v)
 
 	cgroup_masks_read_one(seq, "subtree_control", cgrp->subtree_control);
 	cgroup_masks_read_one(seq, "subtree_ss_mask", cgrp->subtree_ss_mask);
+	cgroup_masks_read_one(seq, "subtree_bypass",  cgrp->subtree_bypass);
+	cgroup_masks_read_one(seq, "enable_ss_mask",  cgrp->enable_ss_mask);
 
 	cgroup_kn_unlock(of->kn);
 	return 0;
-- 
1.8.3.1

