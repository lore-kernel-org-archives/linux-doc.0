Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01EA3793AC
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 23:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782255914; cv=none; b=tp7minFirniFBm49rLGdOzJhcZ/x1sN3DARHdIcw13wSCUcwann+mzeSYOU8p/R239nmzW6mQtx9F2yg2iWGTEwR4cQ+j6D9pIkRboyS9jYcAk0LTZfyZ9tkpTqoNt7TmC25j1tR0lhj+xP8jjrGmlXBwtqQewUM7CmtgN7/bKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782255914; c=relaxed/simple;
	bh=GFnvqzOA+msWCU116qHmV5FrXG/LnYNeFPPmReb2Bi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1J4tAAZERdhBEqht9YEOSZ9z3Cdv7YbXNe6tIbbKybRybDG0wiP0t1kinaO31NVRJObOMzE5tus/3hh1ZKjYnJ6TS0CHZBA+sMAfPbpmUkbupBV/awQLUghyeIZSMQFiMPsxR831O+fMhlk0hiw9yijQUaXtqgRaVj6ujSX6B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JxGpkOFw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JxGpkOFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782255912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o0JYaxtKq5T6dSoG39+ki+lC5EFXV1/igQMvJlCVGE8=;
	b=JxGpkOFwPj4OzOt0DomMvgUMZVim6i2JtVREfrDT8GjHAJFDqjRLXMDzsL0yCXIKj44ME2
	ruEx/t60GLs/8+w5/vHzQEo+JvbsFecM18Mv1s5cFtHTCWarfk3khNGxAWfOhOKpMkvbML
	5QkEmlNNfhnE+e8LTVm3xI51XN99+yU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-Q6dTz-U-PUKZbDoNYwaZXw-1; Tue,
 23 Jun 2026 19:05:07 -0400
X-MC-Unique: Q6dTz-U-PUKZbDoNYwaZXw-1
X-Mimecast-MFC-AGG-ID: Q6dTz-U-PUKZbDoNYwaZXw_1782255906
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC06E19560A6;
	Tue, 23 Jun 2026 23:05:05 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.2.17.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B38631955F6D;
	Tue, 23 Jun 2026 23:05:02 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v2 2/2] cgroup/cpuset: Rebind/migrate mm only for threadgroup leader in cpuset_update_tasks_nodemask()
Date: Tue, 23 Jun 2026 19:04:13 -0400
Message-ID: <20260623230413.1984188-3-longman@redhat.com>
In-Reply-To: <20260623230413.1984188-1-longman@redhat.com>
References: <20260623230413.1984188-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

As reported by sashiko [1], cpuset_update_tasks_nodemask() will do
mpol_rebind_mm() and possibly cpuset_migrate_mm() for all threads of
a multithreaded process. Since commit 3df9ca0a2b8b ("cpuset: migrate
memory only for threadgroup leaders"), cpuset_attach() had been updated
to rebind and migrate memory only for threadgroup leaders to mark the
group leader as the owner of the mm_struct.

To be consistent and avoid unnecessary performance overhead for heavily
multithreaded processes, follow the cpuset_attach() example and perform
memory rebind and migration only for threadgroup leaders.

Also add a paragraph in cgroup-v2.rst under cpuset.mems that the
threadgroup leader is the memory owner of that threadgroup. Therefore
the non-leading threads shouldn't be in other cgroups whose "cpuset.mems"
doesn't fully overlap that of the group leader.

[1] https://sashiko.dev/#/patchset/20260621032816.1806773-1-longman%40redhat.com

Signed-off-by: Waiman Long <longman@redhat.com>
Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
---
 Documentation/admin-guide/cgroup-v2.rst | 7 +++++++
 kernel/cgroup/cpuset.c                  | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 993446ab66d0..f9c353174a7e 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2527,6 +2527,13 @@ Cpuset Interface Files
 	a need to change "cpuset.mems" with active tasks, it shouldn't
 	be done frequently.
 
+	For a multithreaded process, the threadgroup leader is
+	considered the owner of the group's memory. Memory policy
+	rebinding and migration will only happen with respect to the
+	threadgroup leader. To avoid unexpected result, non-leading
+	threads shouldn't be put into another cgroup whose "cpuset.mems"
+	doesn't fully overlap that of the threadgroup leader.
+
   cpuset.mems.effective
 	A read-only multiple values file which exists on all
 	cpuset-enabled cgroups.
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 044ddbf66f8e..055ae54a040a 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2673,6 +2673,10 @@ void cpuset_update_tasks_nodemask(struct cpuset *cs)
 
 		cpuset_change_task_nodemask(task, &newmems);
 
+		/* Rebind and migrate mm only for thread group leader */
+		if (!thread_group_leader(task))
+			continue;
+
 		mm = get_task_mm(task);
 		if (!mm)
 			continue;
-- 
2.54.0

