Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0AD2D77E4;
	Wed, 13 Aug 2025 20:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115539; cv=none; b=hdxrRGlWcaRU+Ve47NUY01LXs21go1xO1uMQbdZEp8Wy0o2dzk3GIcdJXdP3xVgJ+sELd3u87X+nLMPk8x+pyWxuVuuvg2mCBUFXseHZnJqr+/s/Q3OGITBtRjowdh5Oc7Alf0GXwHltchcZSz0ewDz81Q0WfC3EJI7pRKJ2kPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115539; c=relaxed/simple;
	bh=yOn5yiy8SKCVSr8kA0/USc5mjRtF0LgI7LWuw3IydgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PoZM85DVi8Waba/xtV87UyH6P5OQbBVzp665QnSCYQHUjF94qCC7VbSh7lA29Fx7i31hq6iihUUtM7psc7NA++vSO/oXwj2Wb/foczHx2skl1wvFeoXZ8nNMKtb1tXJTJhVNyqO0XkUMTGB/IGaxMxw/Dg2Uzq9AUVuDe8Q1OMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebcW8elx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebcW8elx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E97EC4CEEB;
	Wed, 13 Aug 2025 20:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755115539;
	bh=yOn5yiy8SKCVSr8kA0/USc5mjRtF0LgI7LWuw3IydgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ebcW8elxMEDo1GitNehchmKMIPcntX/zyGwt0X948Uv2us5tBmYuS82IG53ImkGVb
	 OMkAkMTwgDOLV8Mj+5uRKYiEVRa2jnbpSn8RWLLS0VJ8vBn7sY3O6X59d9oZQklMln
	 ZXXigjOkix23EzdiuTpRDHOGlQucCnoTF5J+uSel4VZdejZW3VA6fBh4dbo3ztRddb
	 EBK4UJPhaEMxEqkHeNUYNuC2KXzrMajvO1CA1D6R8AtVPS2QmQ+IPs3/3C81hBDWd1
	 Vbvz7cbfnHZpbrXe7zJ5gM/lnV/gY0tk7HNfbjeaY/1ocofhrqLcqgoMsJtkR7AC9a
	 x5nLb88Mg2bJQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2/9] Documentation: Fix RCU typos
Date: Wed, 13 Aug 2025 15:04:58 -0500
Message-ID: <20250813200526.290420-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813200526.290420-1-helgaas@kernel.org>
References: <20250813200526.290420-1-helgaas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bjorn Helgaas <bhelgaas@google.com>

Fix typos.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/RCU/lockdep.rst   | 2 +-
 Documentation/RCU/stallwarn.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/RCU/lockdep.rst b/Documentation/RCU/lockdep.rst
index 69e73a39bd11..741b157bbacb 100644
--- a/Documentation/RCU/lockdep.rst
+++ b/Documentation/RCU/lockdep.rst
@@ -106,7 +106,7 @@ or the RCU-protected data that it points to can change concurrently.
 Like rcu_dereference(), when lockdep is enabled, RCU list and hlist
 traversal primitives check for being called from within an RCU read-side
 critical section.  However, a lockdep expression can be passed to them
-as a additional optional argument.  With this lockdep expression, these
+as an additional optional argument.  With this lockdep expression, these
 traversal primitives will complain only if the lockdep expression is
 false and they are called from outside any RCU read-side critical section.
 
diff --git a/Documentation/RCU/stallwarn.rst b/Documentation/RCU/stallwarn.rst
index d1ccd6039a8c..d7c8eff63317 100644
--- a/Documentation/RCU/stallwarn.rst
+++ b/Documentation/RCU/stallwarn.rst
@@ -119,7 +119,7 @@ warnings:
 	uncommon in large datacenter.  In one memorable case some decades
 	back, a CPU failed in a running system, becoming unresponsive,
 	but not causing an immediate crash.  This resulted in a series
-	of RCU CPU stall warnings, eventually leading the realization
+	of RCU CPU stall warnings, eventually leading to the realization
 	that the CPU had failed.
 
 The RCU, RCU-sched, RCU-tasks, and RCU-tasks-trace implementations have
-- 
2.43.0

