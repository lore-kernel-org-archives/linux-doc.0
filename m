Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AD63BED74;
	Tue, 17 Mar 2026 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751363; cv=none; b=RtQShW6ndiEY8TKC6GUZyRDgKESqQ47/5UOV9gJK4IW814EeDPX4Q1k8QOP4Eh/BzPs6IQ/SvZAvVIThNwhUvk5bckVsKpPu7v/bX2cLzDEM5s1C2qpEnlE7LVIB7PYDSCJUljvmp7TRrHcldWDO5cZoaLRVK4cBdKJMySxXTB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751363; c=relaxed/simple;
	bh=adtxEG7dFOh4SdXBHztSm6DBpYkJ2W9np+GnxsmKE2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kQkHVKCVzQ7XUpUDsN15+enPCI9ArnyqKa9+OJZcUfvo+itHRR3D1kFf7euG5mulch6hoZn4So4xZ9HGPJ8EgCBdvWbfFMJq5xUJTB7jE6oNgTg+CGGJuhSe6eH2c2BomgRC6ACxQmUkcao511/j6KTXjf1AlF0+3JiZu7PRRi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=T9RwhJa5; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="T9RwhJa5"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fZrwQ5VWYz60v4;
	Tue, 17 Mar 2026 13:33:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773750806;
	bh=adtxEG7dFOh4SdXBHztSm6DBpYkJ2W9np+GnxsmKE2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=T9RwhJa5hxLnSH+BIXw+u/7xXpC32cdx6IzBNRbZ3SIE1ElB+A7DyrZiG2k3BBMcL
	 mqhBvajJhHDGpjv/55i/piMY4F5Zb5uvv33HCAiKsUWHUhZkhj7D7HbWzKxLwaSECG
	 7roI67Idp9MQjsWJ4QOJ0v9KqGTU5ynB79K1V7XT7z1pbshlFLlM/OKpRORZGXKs+i
	 3qbqcOWBJKQDd9l2M0EGBcrRDxFu+28vttxb972EBVBParLJZvOWXwT3+zrcw5GK8U
	 NF3YncFmvFjx+kC4z+bhW4gdB+uMT1vVi7b+Jzrx73i+TeOxo0rlOV4Evffc2Iwx79
	 qaf1sB/Jp+I8g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fZrwQ4mpNz4xdP;
	Tue, 17 Mar 2026 13:33:26 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fZrwP5Pzlz8sgW;
	Tue, 17 Mar 2026 13:33:25 +0100 (CET)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A2719635A2;
	Tue, 17 Mar 2026 13:33:24 +0100 (CET)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] docs: reporting-issues: tweak a few areas and rewrite
 the ending
Date: Tue, 17 Mar 2026 13:33:03 +0100
Message-ID: <cover.1773750701.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177375080532.2889253.14031627935577056975@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A2719635A2
X-NC-CID: ++Kt/dqzTDJc3KbmHsuPei5Mlc5gi1GjMXIJOv1c0sAZ2XJHpbM=

This patch-set tweaks a few parts in the fringes of our text on bug
reporting while replacing two sections at the end with a new text as
proper appendix that hopefully better fits the purpose and covers more
aspects.

This is the first versions of this patch-set, but it starts as v2, as it
contains three patches and a few bits that were part of an earlier and
bigger patch-set. This incorporates review feedback given there. The
last patch in this series is mostly new, but includes a few bits from
patch 4 and 5 of the earlier series.

Ciao, Thorsten

v2:
- initial version with 3 patches taken from this abandoned patch-set:
  https://lore.kernel.org/all/cover.1761481839.git.linux@leemhuis.info/
- Rewrite the section at the end and make it a proper appendix; based
  on patches 4 and 5 from above patch-set
- Incorporate various mostly minor review feedback. Among them:
  - Drop the change switching from single to double quotes.
  - Point out that feedback can be sent as a patch, too – and add a
    patch to sync the text about feedback with two other documents that
    contain a para which this section is based on.

Thorsten Leemhuis (5):
  docs: reporting-issues: mention text is best viewed rendered
  docs: reporting-issues: tweak the reference section intro
  docs: reporting-issues: add conclusion to the step-by-step guide
  docs: verify-bugs-… and quickly-build-…: improve feedback section
  docs: reporting-issues: create a proper appendix explaining
    specialties

 .../quickly-build-trimmed-linux.rst           |  14 +-
 .../admin-guide/reporting-issues.rst          | 210 +++++++++---------
 .../verify-bugs-and-bisect-regressions.rst    |  15 +-
 3 files changed, 123 insertions(+), 116 deletions(-)


base-commit: 73f175a46330c57ab5797287233cbf83a36b6a99
-- 
2.53.0

