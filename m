Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D7828488F
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811073; cv=none; b=UT56kVv1s0DofY78NAKjiGGam26vCVHtADrwhF8sbMmGdpGZPpPL1R3GjHmUTLZtd2u1F1onJyEZaaGXeHHbe4x2d8IA2ukllrlUCQyzKT8caAIrLjycb8vV6TV9YjFw1iynZerfR7dXzIrmmO5O5PvFB1pTQrswOWa9QnxBELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811073; c=relaxed/simple;
	bh=ZHzJt5yr9XR8XKjlfvXHxCg47wu84r6JkT9Tuv6M8LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYm6z43PPeZ4lis+OTWxr8e1xVqsf41HiSwHn1ixuHOjuCyGDiURVAZFrNifOxZS2zCWCH5D5exi9BiN2kqlVu5VbeelDUuBh3YYoFbTZc2gVX0vDMx73foICW74YTlgCXtFBpVl5mXANwpNeOKYgAmjJCePIWXZbZn1pUcb9Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wgGA8atQ; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wgGA8atQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784811059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=syMYcAbG7GBcE53aHGp1ZkfMuwv7fI9MyytwGfh2LRY=;
	b=wgGA8atQDNgk3Szc93kYjV8lppZoZ6QAb/81VdcLZyhjV+K7VaSemsCbjzL3sdv8Xj+CVW
	rE5HHu55gwzbpukvSB1iJ3VWrNAO+8H5mPjTNgqsSvS2h7i7vpfp1O1YCTGaXAPoS957VY
	9/Fgva3xoy+/NkmAhZS1n9k00SupffA=
From: Tao Cui <cui.tao@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>
Cc: linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Tao Cui <cuitao@kylinos.cn>,
	linux-kernel@vger.kernel.org,
	cui.tao@linux.dev
Subject: [PATCH] docs: accounting/psi: drop stale 500ms window minimum from trigger docs
Date: Thu, 23 Jul 2026 20:50:25 +0800
Message-ID: <20260723125025.457841-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Tao Cui <cuitao@kylinos.cn>

psi.rst says trigger windows range "from 500ms to 10s" with a 50ms min
polling interval. That minimum was removed in commit 519fabc7aaba ("psi:
remove 500ms min window size limitation for triggers"): the polling-rate
protection moved to gating trigger creation behind CAP_SYS_RESOURCE,
which also stopped capping psi event latency.

Update the wording accordingly: windows up to 10s with no enforced
minimum; trigger creation requires CAP_SYS_RESOURCE on cgroup pressure
files, while unprivileged users on /proc/pressure/ are limited to 2s
multiples.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 Documentation/accounting/psi.rst | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/Documentation/accounting/psi.rst b/Documentation/accounting/psi.rst
index d455db3e5808..aae57fb5f15c 100644
--- a/Documentation/accounting/psi.rst
+++ b/Documentation/accounting/psi.rst
@@ -99,15 +99,14 @@ psi metric and deactivates upon exit from the stall state. While system is
 in the stall state psi signal growth is monitored at a rate of 10 times per
 tracking window.
 
-The kernel accepts window sizes ranging from 500ms to 10s, therefore min
-monitoring update interval is 50ms and max is 1s. Min limit is set to
-prevent overly frequent polling. Max limit is chosen as a high enough number
-after which monitors are most likely not needed and psi averages can be used
-instead.
-
-Unprivileged users can also create monitors, with the only limitation that the
-window size must be a multiple of 2s, in order to prevent excessive resource
-usage.
+The kernel accepts window sizes up to 10s. The 10s maximum is chosen as a
+high enough number after which monitors are most likely not needed and psi
+averages can be used instead.
+
+To prevent excessive resource usage, trigger creation is restricted to
+privileged users (CAP_SYS_RESOURCE) on cgroup pressure files; on the
+system-wide /proc/pressure/ files unprivileged users can create monitors
+as well, limited to window sizes that are a multiple of 2s.
 
 When activated, psi monitor stays active for at least the duration of one
 tracking window to avoid repeated activations/deactivations when system is
-- 
2.43.0

