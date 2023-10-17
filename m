Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1A544471
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bUUaQcch"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D55FAB
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 10:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697562853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tJHuMYgfyryTZGUvqLcpzrOcz/yjy5LJnlWOHUnXTfY=;
	b=bUUaQcch0FV7sRenujn43HG0u9muptrma78DoEiGEN5rfcVITnNnIiM42uqJkyCnZ3fa/m
	xBoRxkuTUgHk5MuaNFHgHPzHemppfxxH6yCiAV7z23MfkGaUELem7SR7JZl/7qnYCWQ9vR
	xHBrpWIfr2egUVNcjs2GkUHyB6J9YUY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73--3wFHCaTPaOwPLl3R7pQhA-1; Tue, 17 Oct 2023 13:14:08 -0400
X-MC-Unique: -3wFHCaTPaOwPLl3R7pQhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DA803C0252B;
	Tue, 17 Oct 2023 17:14:07 +0000 (UTC)
Received: from llong.com (unknown [10.22.16.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78C8E1C060AE;
	Tue, 17 Oct 2023 17:14:06 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Hunt <pehunt@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] docs/cgroup: Add the list of threaded controllers to cgroup-v2.rst
Date: Tue, 17 Oct 2023 13:13:41 -0400
Message-Id: <20231017171341.3683352-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The cgroup-v2 file mentions the concept of threaded controllers which can
be used in a threaded cgroup. However, it doesn't mention clearly which
controllers are threaded leading to some confusion about what controller
can be used requiring some experimentation. Clear this up by explicitly
listing the controllers that can be used currently in a threaded cgroup.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index b26b5274eaaf..a6f58aecb431 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -364,6 +364,13 @@ constraint, a threaded controller must be able to handle competition
 between threads in a non-leaf cgroup and its child cgroups.  Each
 threaded controller defines how such competitions are handled.
 
+Currently, the following controllers are threaded and can be enabled
+in a threaded cgroup::
+
+- cpu
+- cpuset
+- perf_event
+- pids
 
 [Un]populated Notification
 --------------------------
-- 
2.39.3

