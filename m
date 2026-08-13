Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B953435C6BD
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 23:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786662112; cv=none; b=N+1vc6rnaVC+pcxwMZr1LIMGa0rzsa9Jz/+OntXuRBkT9pxYWMQMUGzhoYtnrYcVGWkC5XjZe13JLNuincPBqFNfKGu1yQzw3UcmV9oRaz1C5cxSTsiX/6Njds/U33uYYrG28riVi8pxTgu1OUtZG5BQfJCeILcP7gtuffDOq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786662112; c=relaxed/simple;
	bh=86Ku6rMPPzoffm7BdqHJ23UuUftGpHlUvJrV5uLx5Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LrK7hw2xxC8ipBNYA6nia3KJyiCU20L8oMl1SOmI2JzgujZ6N0BM8tpCscT2pG2b7Yj21fRI0tKW1XWHXaIl3mTXTroB0J6U89TxqL37Gn5OHVOMu00PMGsxclRog89IL7Qk5DOjtiaBfbo1jJt9qlpCr32u7kQZZfOOxEsCZiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L7+Juwit; arc=none smtp.client-ip=95.215.58.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L7+Juwit"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=86Ku6rMPPzoffm7BdqHJ23UuUftGpHlUvJrV5uLx5Ho=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786662108; v=1; x=1787266908;
 b=L7+Juwitr6/CBX64rUn+q9+jempK52Ch0gnr+hAy+/Q7Yik0FtmiUXD0jtJGq3yiJZLzJqWN
 Mut82bnZfgrrvbhuyaxqg4KOWLMAztO1mHq6BspacpcSsUVEEEdDPm3rwDvL2UBZIsPMJkmx9iA
 OyxlFZY5PQvUqXLOKrMVejUY=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from ctao-book.. (111.162.215.50)
	by smtp.migadu.com with ESMTPS id bb7d3cc60806c1ee;
	Thu, 13 Aug 2026 23:01:48 +0000
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: tj@kernel.org,
	corbet@lwn.net
Cc: rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	arighi@nvidia.com,
	yphbchou0911@gmail.com,
	jpiecuch@google.com,
	ihor.solodrai@linux.dev,
	suzhidao@xiaomi.com,
	luoliang@kylinos.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH v2 1/2] Documentation: sched_ext: fix events sysfs path and show_state example
Date: Fri, 14 Aug 2026 07:01:22 +0800
Message-ID: <20260813230123.2069719-2-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813230123.2069719-1-cui.tao@linux.dev>
References: <20260813230123.2069719-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

The events file is under the scheduler's sysfs kobject
(/sys/kernel/sched_ext/root/events for the root scheduler), not the
nonexistent "<scheduler-name>/events" path. Also add the missing "aborting"
line to the scx_show_state.py example.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 Documentation/scheduler/sched-ext.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
index ad2fff3..0e97fd0 100644
--- a/Documentation/scheduler/sched-ext.rst
+++ b/Documentation/scheduler/sched-ext.rst
@@ -93,13 +93,13 @@ scheduler has been loaded):
     # cat /sys/kernel/sched_ext/enable_seq
     1
 
-Each running scheduler also exposes a per-scheduler ``events`` file under
-``/sys/kernel/sched_ext/<scheduler-name>/events`` that tracks diagnostic
-counters. Each counter occupies one ``name value`` line:
+Each running scheduler exposes an ``events`` file under its sysfs kobject
+(``/sys/kernel/sched_ext/root/events`` for the root scheduler) that tracks
+diagnostic counters. Each counter occupies one ``name value`` line:
 
 .. code-block:: none
 
-    # cat /sys/kernel/sched_ext/simple/events
+    # cat /sys/kernel/sched_ext/root/events
     SCX_EV_SELECT_CPU_FALLBACK 0
     SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE 0
     SCX_EV_DISPATCH_KEEP_LAST 123
@@ -153,6 +153,7 @@ detailed information:
     switching_all : 1
     switched_all  : 1
     enable_state  : enabled (2)
+    aborting      : False
     bypass_depth  : 0
     nr_rejected   : 0
     enable_seq    : 1
-- 
2.43.0

