Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384144315F;
	Sat, 27 Jun 2026 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782552452; cv=none; b=JgpEiHfA0IIzdfMA2kG806CBlsuGb8iWHJF8lHbarbjmnazESesXmZHR5qyYiVCN3oKU9MZEVgjoNO43D0Bz+LWylntd6mPOtqXuIiVmRuAyhQKyt39FYH8zMvz9iEJ4XE0MP97ofTIFV2Rp2pLKzsSenebznntUEkIa8lHXi0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782552452; c=relaxed/simple;
	bh=FecOqGGa7xBMJijRx5wXq1aO23YnLhYIUFRClaUfNRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qMAwcBUBH9oTbtl12wGJLirQjsIFBVbx9Ojh5ljSLuLPaRwTmeIb2n10wNfXvkE4Rcn/OOB4HYRJoupXz9fpSKaBHA29gWukdestGNZ3bEZTDjmb/xSZBtH70yGpCIW51YHi3pAYNFFeUtYmADxbYP/YfAscK8tJVwj9lx/CRic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FLB9opzJ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jExektJu; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FLB9opzJ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jExektJu"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gnRyj6yWRz9twp;
	Sat, 27 Jun 2026 11:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782552446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bVkSp3qg8CWzoE2WASgIfh+owIfIPIR/DalWj63NHmc=;
	b=FLB9opzJq98gtIEw4aRlvJiLAiUll601TklV0K/lushSOAXFxApjP58vz7k+ZqkND3c3LT
	nY48lDVtT9FAkAlWNAU2dniSgU2AE4SBRQMN6I52edhE59mWBJUextVplXa79e9R1MCM5G
	P2LN3XDUyQi5WIr9HzNjqfz4dqcexsViI+I5fh53Lja759A4onwOkur+XrHB/az6jo5A3e
	5Lp8OU/xcHThHpy/PMcQvelyRcFrXYXUOrkqoUP117WvmrKV9zlUdm7K5RKsu+u8MM/fq6
	8SjQXLfg8sl6g8QcYXx7nmrv2zVjaqGwJw8BIjAAQGF2D51u0qqM/JaN0hIL6Q==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782552444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bVkSp3qg8CWzoE2WASgIfh+owIfIPIR/DalWj63NHmc=;
	b=jExektJu6v8C2cGRuJp6NrgazA1sjPHCBY5OemWo3yyLQwI0vLINbRndKZSHcDIU0hrmzj
	gmpoOt8YdTDjaoSKmJMipR0KTUKM3QsPg5Eien0lDqEV9B8754tx4WS4Z0wCIFYsdtPqD4
	DjSkdCVOE/Zpmwy01gLeqeZf6vlopNK4ABkZS9dU3QZ1vVg4FTW1sjOotSEccuD5Z0SDJy
	LJu7j5LlEsivdF7ESTp0jvG0oSChFOZdniyIeaMpTL55FQ4lZvy7vty9TCZbPlN9bKSp/x
	FMyghgcQGdmHJ3A5py22hNkoyol7gIP5/abMRrFJGuRE0rrwPAt+cb6McgHySA==
To: "Paul E . McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: RCU: fix brackets
Date: Sat, 27 Jun 2026 11:26:45 +0200
Message-ID: <20260627092644.30809-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f70037f364541ff7166
X-MBO-RS-META: 78pe7bufc1csqgt4u149wk3z1oe95n4j

Remove needless brackets and add missing bracket.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 .../Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst  | 2 +-
 Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg         | 2 +-
 Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg         | 2 +-
 Documentation/RCU/Design/Requirements/Requirements.rst          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst b/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst
index 414f8a2012d6..cf0f9cdca7e8 100644
--- a/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst
+++ b/Documentation/RCU/Design/Expedited-Grace-Periods/Expedited-Grace-Periods.rst
@@ -410,7 +410,7 @@ workqueues (see Documentation/core-api/workqueue.rst).
 
 The requesting task still does counter snapshotting and funnel-lock
 processing, but the task reaching the top of the funnel lock does a
-``schedule_work()`` (from ``_synchronize_rcu_expedited()`` so that a
+``schedule_work()`` (from ``_synchronize_rcu_expedited()``) so that a
 workqueue kthread does the actual grace-period processing. Because
 workqueue kthreads do not accept POSIX signals, grace-period-wait
 processing need not allow for POSIX signals. In addition, this approach
diff --git a/Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg b/Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg
index d05bc7b27edb..95a66de40ca5 100644
--- a/Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg
+++ b/Documentation/RCU/Design/Memory-Ordering/TreeRCU-gp.svg
@@ -3933,7 +3933,7 @@
          font-style="normal"
          y="-3914.085"
          x="3745.7725"
-         xml:space="preserve">rcu__report_qs_rdp())</text>
+         xml:space="preserve">rcu__report_qs_rdp()</text>
     </g>
     <g
        id="g4504-3"
diff --git a/Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg b/Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg
index 7d6c5f7e505c..882132680308 100644
--- a/Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg
+++ b/Documentation/RCU/Design/Memory-Ordering/TreeRCU-qs.svg
@@ -815,7 +815,7 @@
          font-style="normal"
          y="-3914.085"
          x="3745.7725"
-         xml:space="preserve">rcu__report_qs_rdp())</text>
+         xml:space="preserve">rcu__report_qs_rdp()</text>
     </g>
     <g
        id="g4504-3"
diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 8a216e4a46a7..8101fe6229d5 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -2785,7 +2785,7 @@ both srcu_read_lock() and srcu_read_unlock().  This need is handled by
 a Tasks Trace RCU API implemented as thin wrappers around SRCU-fast,
 which avoids the read-side memory barriers, at least for architectures
 that apply noinstr to kernel entry/exit code (or that build with
-``CONFIG_TASKS_TRACE_RCU_NO_MB=y``.
+``CONFIG_TASKS_TRACE_RCU_NO_MB=y``).
 
 Now that the implementation is based on SRCU-fast, a call
 to synchronize_rcu_tasks_trace() implies at least one call to
-- 
2.54.0

