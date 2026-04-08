Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0C73358CA;
	Wed,  8 Apr 2026 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775684126; cv=none; b=YBhfxfGcH1j+2Ar+4msstcsXwkhB85fNQmokrYydMDND2q7ZvEfAm1nSx7BUEgNY+Hp7rJgOm9FdTcDl/qFWQ/cPb7tVRjMycS57g4WDDyDTflL5w5KvAJtbbH7Nr1oeL3nXHv2+1jUiAECbRzWI+KYCgMmiVCymMCyYP6xZCc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775684126; c=relaxed/simple;
	bh=zp1ZmTmc99ZOtXXToo0VmFST/yPF1TSPEd+n5cUdKRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bj4U47qeUNj3Qn4+NWZXVObV58EjKcKoSNurNvXwhGvM9qVw3GgWaYKL/jdX1G8xKoCgCHZXgSNDugKIccDHCU8xdMhEGImOztUH1YN8862sGifokbETsZTbyg8L6QjJkkYzY/17/xwoegEgSwWTNjdB8w477OA2S8QTXUmVF4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=D7lJiP5l; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D7lJiP5l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=QAX4cTzk0ReArriqNPf4q7/XcbVXFvy1utEpjZdmgVQ=; b=D7lJiP5ldPB/AHuj/KeLcoAihN
	IPNcor1R4pRm1KN7JqSvjqDqeueIkIk3aw4HV0CdTHutcr8nSvv00wOJGtsXNU0wk/DhlHh+9eUeT
	m/5Hp4VkYTh3qyu0V3VY4yeiizyJQhgKBdAnRHvfT8VJTCCXHMILbn6cV2LE9J2GWH1Ehi84jCpX6
	5vAqIeSUmucYNpP3Fkf8pa6CogdAXwnGm2YXKGluiGQbdpG2E8JV+QVgPwAvIR0LlRvRhEJwNXRR/
	6ol9ls87x56TO138WqCOhsRz3kFJ5bagisQteQwz/zBKaV4MiNAvVFR1wd6jakZMDc1hcBBnejqdC
	NilstJlg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaYV-00000009RR6-3Xun;
	Wed, 08 Apr 2026 21:35:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20Persson?= <Bjorn@xn--rombobjrn-67a.se>
Subject: [PATCH v2] doc: watchdog: fix typos etc.
Date: Wed,  8 Apr 2026 14:35:21 -0700
Message-ID: <20260408213523.2707947-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Correct typos in lockup-watchdogs.rst.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: corrections from Björn (Thanks)

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Björn Persson <Bjorn@xn--rombobjrn-67a.se>

 Documentation/admin-guide/lockup-watchdogs.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20260406.orig/Documentation/admin-guide/lockup-watchdogs.rst
+++ linux-next-20260406/Documentation/admin-guide/lockup-watchdogs.rst
@@ -41,7 +41,7 @@ is a trade-off between fast response to
 Implementation
 ==============
 
-The soft and hard lockup detectors are built around a hrtimer.
+The soft and hard lockup detectors are built around an hrtimer.
 In addition, the softlockup detector regularly schedules a job, and
 the hard lockup detector might use Perf/NMI events on architectures
 that support it.
@@ -49,7 +49,7 @@ that support it.
 Frequency and Heartbeats
 ------------------------
 
-The core of the detectors in a hrtimer. It servers multiple purpose:
+The core of the detectors is an hrtimer. It serves multiple purposes:
 
 - schedules watchdog job for the softlockup detector
 - bumps the interrupt counter for hardlockup detectors (heartbeat)
