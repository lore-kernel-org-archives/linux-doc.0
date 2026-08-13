Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E22E32E151
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 23:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786662101; cv=none; b=DrTeOGzRUTl8ZE8cyIyAhoGTR3mquVXTecCbG2IW+a4iETOb7wc7sNF2phpUIVV/qRLXXuQPR941wqqVABzVufeVT0o9yF7Q2EjNYnXjCJSpQ43cPy6bmOM+JOM+TH76V1knqnEVAYZygXZhY3piGaJSh5boC+sekDKmEdxndJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786662101; c=relaxed/simple;
	bh=FlhAF0gqqWInieus6TVHgqrVVU/G7GLQqP/e8QxO/SA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UwBQVN92xq75Mpady50FU0VDc2CDY4O//afz520Wt8PDDWAeZ26+m41v8XTZjKQbG4caFdHF85Qa/N7kZKGhx2BSyt/Cj9Ady7bOe6Mw3Za9UlBwjh+7glNrnCzJOXH1gJx40T+sEmG8yxaA4rsWYd5Ii7xfnU9/40enqeBBRBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i3TrSMYJ; arc=none smtp.client-ip=95.215.58.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i3TrSMYJ"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FlhAF0gqqWInieus6TVHgqrVVU/G7GLQqP/e8QxO/SA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786662098; v=1; x=1787266898;
 b=i3TrSMYJx5Xa6cioVR3NrqB5SeaaaORDjNSagIWEKuF+9oPNuRhuzsCEWqm2NUTfLaSALFxL
 oDJlcOHZ94E+U0Z8wPNXJ8bFAXmaT8gRXqCYQlcZU4MUfmCSP+0M651UGLAmo/fVnJFmP7xpdN6
 f/aKPJhEnnPjOQAwIl1f5LCM=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from ctao-book.. (111.162.215.50)
	by smtp.migadu.com with ESMTPS id d2441ef27e3ea186;
	Thu, 13 Aug 2026 23:01:38 +0000
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
Subject: [PATCH v2 0/2] sched_ext: minor doc and comment fixes
Date: Fri, 14 Aug 2026 07:01:21 +0800
Message-ID: <20260813230123.2069719-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

Two small doc and comment fixes noticed while
reading the code. No functional changes.

Changes in v2 (per Tejun's review):
- show_state example: aborting prints as False (drgn bools)
- inlines.h: use scx_bpf_sub_dispatch(), not scx_bpf_dsq_insert()
- internal.h: name %SCX_DEQ_SCHED_CHANGE instead of dropping the
  never-defined %SCX_DEQ_SAVE
- internal.h: reword @name to cover sub-schedulers
- rebase onto sched_ext/for-7.3

Tao Cui (2):
  Documentation: sched_ext: fix events sysfs path and show_state example
  sched_ext: fix stale references in doc comments

 Documentation/scheduler/sched-ext.rst | 9 +++++----
 kernel/sched/ext/inlines.h            | 2 +-
 kernel/sched/ext/internal.h           | 7 ++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.43.0

