Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F95C4338F
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 19:57:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D5AB60FE6
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 19:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhHKT6W (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 15:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47201 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229991AbhHKT6W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 15:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628711877;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=WxdcaYuyKYoi6tYy6rnNj7AJtwXW/DVftZFjymOGA2c=;
        b=ChexjBUXMinIX43Ro7se7Rj+zbMOTcjBQC9HDQK66RG9yxzkdHLiN0shUrLD1pGugaQI3T
        lJPGCTAirB1clxlK0JNj36x+FKUDsgBObhgkYiHmbtDNMY0N+FYSxfe16Y7N342dI47jEO
        ETIAi7aYN/MiHRWWW9YKKAjQ0Fo6zpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-THlbMnEaOlCLFHARtJeTbg-1; Wed, 11 Aug 2021 15:57:56 -0400
X-MC-Unique: THlbMnEaOlCLFHARtJeTbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D109192D78F;
        Wed, 11 Aug 2021 19:57:41 +0000 (UTC)
Received: from llong.com (unknown [10.22.18.115])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 98E29797C8;
        Wed, 11 Aug 2021 19:57:17 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Waiman Long <longman@redhat.com>
Subject: [PATCH v2] cgroup/cpuset: Enable memory migration for cpuset v2
Date:   Wed, 11 Aug 2021 15:57:07 -0400
Message-Id: <20210811195707.30851-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When a user changes cpuset.cpus, each task in a v2 cpuset will be moved
to one of the new cpus if it is not there already. For memory, however,
they won't be migrated to the new nodes when cpuset.mems changes. This is
an inconsistency in behavior.

In cpuset v1, there is a memory_migrate control file to enable such
behavior by setting the CS_MEMORY_MIGRATE flag. Make it the default
for cpuset v2 so that we have a consistent set of behavior for both
cpus and memory.

There is certainly a cost to make memory migration the default, but it
is a one time cost that shouldn't really matter as long as cpuset.mems
isn't changed frequenty.  Update the cgroup-v2.rst file to document the
new behavior and recommend against changing cpuset.mems frequently.

Since there won't be any concurrent access to the newly allocated cpuset
structure in cpuset_css_alloc(), we can use the cheaper non-atomic
__set_bit() instead of the more expensive atomic set_bit().

Signed-off-by: Waiman Long <longman@redhat.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 11 +++++++++++
 kernel/cgroup/cpuset.c                  |  6 +++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 5c7377b5bd3e..babbe04c8d37 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2056,6 +2056,17 @@ Cpuset Interface Files
 	The value of "cpuset.mems" stays constant until the next update
 	and won't be affected by any memory nodes hotplug events.
 
+	Setting a non-empty value to "cpuset.mems" causes memory of
+	tasks within the cgroup to be migrated to the designated nodes if
+	they are currently using memory outside of the designated nodes.
+
+	There is a cost for this memory migration.  The migration
+	may not be complete and some memory pages may be left behind.
+	So it is recommended that "cpuset.mems" should be set properly
+	before spawning new tasks into the cpuset.  Even if there is
+	a need to change "cpuset.mems" with active tasks, it shouldn't
+	be done frequently.
+
   cpuset.mems.effective
 	A read-only multiple values file which exists on all
 	cpuset-enabled cgroups.
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index adb5190c4429..d151e1de93d4 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2737,12 +2737,16 @@ cpuset_css_alloc(struct cgroup_subsys_state *parent_css)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	set_bit(CS_SCHED_LOAD_BALANCE, &cs->flags);
+	__set_bit(CS_SCHED_LOAD_BALANCE, &cs->flags);
 	nodes_clear(cs->mems_allowed);
 	nodes_clear(cs->effective_mems);
 	fmeter_init(&cs->fmeter);
 	cs->relax_domain_level = -1;
 
+	/* Set CS_MEMORY_MIGRATE for default hierarchy */
+	if (cgroup_subsys_on_dfl(cpuset_cgrp_subsys))
+		__set_bit(CS_MEMORY_MIGRATE, &cs->flags);
+
 	return &cs->css;
 }
 
-- 
2.18.1

