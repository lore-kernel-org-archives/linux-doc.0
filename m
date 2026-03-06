Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388D333E37B;
	Fri,  6 Mar 2026 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793077; cv=none; b=emBdsgs30RuslE71o0n4A+m4cobp3ATZlh+syN32LrjUkmO31L0K5u5G7NHJl4TNnBMgK2PXi2YshL44cBL7Bdy2sFfjlvBNSVAyp5mUTerTMq5iEFCDO+OxIdwxHt6OkjJt5Uj6/osD3EbnjYFXQ6gJb2Hro9v+TsUpLo41+7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793077; c=relaxed/simple;
	bh=kw2XtYZN3Kr84aIBUsDMUgvLsYNsSuOOpGAKDmubLBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CWYarJECCgxLFA2uiDUh6Dj0I1Ao9Sf4gjbFIXJt2XNZG0Q83lqeSg+If/YI5rLSknQu9/wysxMeqZ8MStgaFXwveKBrZ9xCF69RQTUvGAmWHgNmuKMK6Z2mQ+LoF1JaOETcjO2A9t5WAmGhrJ48el62ZLVHvfx1jUSFGUMVCVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15A30497;
	Fri,  6 Mar 2026 02:31:09 -0800 (PST)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.1.27.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1764A3F694;
	Fri,  6 Mar 2026 02:31:13 -0800 (PST)
From: Christian Loehle <christian.loehle@arm.com>
To: tj@kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org
Cc: arighi@nvidia.com,
	linux-doc@vger.kernel.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH] sched_ext: Documentation: Mention scheduling class precedence
Date: Fri,  6 Mar 2026 10:30:51 +0000
Message-Id: <20260306103051.1038604-1-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention the scheduling class precedence of fair and sched_ext to
clear up how sched_ext partial mode works.

Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 Documentation/scheduler/sched-ext.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
index 9e2882d937b4..100d45963781 100644
--- a/Documentation/scheduler/sched-ext.rst
+++ b/Documentation/scheduler/sched-ext.rst
@@ -58,7 +58,8 @@ in ``ops->flags``, all ``SCHED_NORMAL``, ``SCHED_BATCH``, ``SCHED_IDLE``, and
 However, when the BPF scheduler is loaded and ``SCX_OPS_SWITCH_PARTIAL`` is
 set in ``ops->flags``, only tasks with the ``SCHED_EXT`` policy are scheduled
 by sched_ext, while tasks with ``SCHED_NORMAL``, ``SCHED_BATCH`` and
-``SCHED_IDLE`` policies are scheduled by the fair-class scheduler.
+``SCHED_IDLE`` policies are scheduled by the fair-class scheduler which has
+higher sched_class precedence than ``SCHED_EXT``.
 
 Terminating the sched_ext scheduler program, triggering `SysRq-S`, or
 detection of any internal error including stalled runnable tasks aborts the
-- 
2.34.1

