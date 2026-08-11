Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D727361640
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433933; cv=none; b=Ll0EmjgSepN4MeXGFQCpehr9PfBdapwL5BsOLp4I2lKoxzVLeWaY4wFdabixMlICH4aqnCUc1xcxsq14CDJe/+MNIBZBWGlpbWQJ1z69cAWlMO3XZv+V77TsKLnHZlrk77A0RYaP5UkapUJQWJGEgvV4BXLzHPDzxlIxlVVHQBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433933; c=relaxed/simple;
	bh=hudZ7it0neGAksgRgLThkhz3Cv+lH/seZNwlPqyLIFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbQdCo8qhnWQ0QsQK5h3GlvhOSzuOK1cGkgam6MNH1u2KJdhbD7LaAfvyi9Jj7+Djk+Wa9W+uO2lK/2Cy2JxpGNWFfyHFGN+k+0x2CBCQ4W6TXEmTwLH9AtvUFqf7RTHVpbdJJ5myqjq+w6GmpXd/fsQdmHmqvjVXuPAS20HL18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c1iLnb28; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c1iLnb28"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786433928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J5kaFKVWfsSegFeC84ly4ZTSKxKYis3YIo4wmGDmJdI=;
	b=c1iLnb28Xc9FW2/2B5F0dmLL1vV1Zcy8GWN1P/C4+yqj7LQtHmCdMkVLTalHCXPKTwvHam
	SU1YLSH83BmbP0NIVJf7BnOFns0lXioBQcWlCmmlBbVMMaxhFtMoXOZM+E65QvdfRRp111
	rcr+KvCS+Jw8BqkDIUaTN2btiPyiRJU=
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
Subject: [PATCH 0/2] sched_ext: minor doc and comment fixes
Date: Tue, 11 Aug 2026 15:37:59 +0800
Message-ID: <20260811073801.342165-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Tao Cui <cuitao@kylinos.cn>

Two small doc and comment fixes noticed while
reading the code. No functional changes.

Tao Cui (2):
  Documentation: sched_ext: fix events sysfs path and show_state example
  sched_ext: fix stale references in doc comments

 Documentation/scheduler/sched-ext.rst | 9 +++++----
 kernel/sched/ext/inlines.h            | 2 +-
 kernel/sched/ext/internal.h           | 5 ++---
 3 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

