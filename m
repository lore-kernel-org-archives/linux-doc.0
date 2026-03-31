Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9ED3A9D80;
	Tue, 31 Mar 2026 11:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954851; cv=none; b=YKjscURGVjF3MDH0C04ocnk0jlZnQFtj4O3Z3oYMsD51FzU3qw8j33PX/bSeKgQP7j5yk6i9Ml2dlVht4CvVXcu0YLy0tcjtX22utvDOcxaxfCwuWqONa2VEEqLTjuMLP6DK6j2rUIhcm53I+WBq+W+r7muISn+F/I1u41+bAXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954851; c=relaxed/simple;
	bh=qiZP3pMkiWVhwKRsjcSJIBXS5tm3G3sL6gwl8SO35OI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eoqKZ+m63nmcge96rukS/UV45WDmW1WwNbfFcrGHC+4uC4iFDsZaIM3Yxkb43PBJik4iIeEQAncwYaC3REL6Bbaws/D8MXWZm25hEL6H/M8FFfOg/GEXkWPI4frRThN0LGBTkH/6Yc7vgbJRjTXE3cIbTI3fAWclMH+c0sq/7qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=i6VLUgQA; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="i6VLUgQA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=ej999Lltj3psDX+lSQBFgt+N0EJ87JUHiVq66s1ytUM=; b=i6VLUgQA/T0U4Tb0sHMae0huaZ
	DcHpw+WDe4WKFSLgNEx6/iYQ5QKrY1wYAc7PlcqpMNjdjsX5kn8EhzI7DZ0OZUaysRpoSAFqhIgwD
	ZngqZaFcB9zZvKGWzZn3GGTclUY2J2wp9RJ5g93XeBOWbiLlhU99/9uRk9PUGld31uog+4fpMj3TB
	S13iCPBlXulv0Jr8k4gmNRWXzbt7KLO2ZXDaITx4kyLJqidYNoRngbqtzlQg3sI7y3TQqkR3h5TYe
	OSsgZm0bFPTvqARhR13J3SjMdiOxt5owZOLQjxlHl4YBYrIg2GGNrIts692bLvq8uVwTnaWP2Lcez
	GuNN27hg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1w7Wpt-002Ab1-2Z;
	Tue, 31 Mar 2026 11:00:40 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 31 Mar 2026 04:00:18 -0700
Subject: [PATCH v2 3/3] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ecc_panic-v2-3-9e40d0f64f7a@debian.org>
References: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
In-Reply-To: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2203; i=leitao@debian.org;
 h=from:subject:message-id; bh=qiZP3pMkiWVhwKRsjcSJIBXS5tm3G3sL6gwl8SO35OI=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpy6lInoiOsKvmqn6zqDWvDEROH5pmoV+ihKV/y
 MR1/drgwtKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCacupSAAKCRA1o5Of/Hh3
 bRPXD/0eaeyWiE1Kspzsio63y3xZCajlbk7YAuNAZscwsWBzwt/us5mtJR+/U1FW9IxJ1aIde12
 23iTxJZeNecTeF/tpBu/brJ4fm9HrKL/ws2a8q6s1OXwFtSPbQq6JIJmCwr2xvMZ6XUTrfJLpFm
 vBsH7/XV2NTRcgLS/lXd4yl3bqP6HcseRaUk2RPCUeUXUJ89Bdlpaa7VEc31qag+j573OQxpaYE
 cBjddR29bMmm7RUsd/JbrOlPaXioD2as5uj8vRsSQmDgxs34e7PZIqqvp4mYbZdShzIQW+KRqo8
 iiKbtOM12ujLYlr/580y80C3Z/sxy5VsN7pciBU9ajWSFhX4C0Ze5OldxRp309jzSnucUWDFTE+
 ppp4Ru2UjQFJdG4p8hycOZfFswIC7pR40Y2Q7FIrYj8VwOTiZfhPqhWccG8KwMyhExQnseAzc6o
 VmekuFk2Pk5n3JD2I1844DzPag8gx/qFCgVNNoEcet0tEyEXKkxoJwQ5i9ZDhvBfamuAByEnX2T
 uIWhrsBnE65GsSRmMuQNZFfn3/4a+cEba31Lf8Fxpqc4a1Jz5y8XDE/QRYD/nJtpgUpNtk7YqSJ
 CI/uq8Ssj2NFj8Dz+HbkLS17Y/Rv10yfgpd754oyf0iafvr/gd/kLFIscbcjbY1HNwO48OfO369
 kvLCJzvXVXOq2wQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Document the new vm.panic_on_unrecoverable_memory_failure sysctl in the
admin guide, following the same format as panic_on_unrecovered_nmi.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/admin-guide/sysctl/vm.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 97e12359775c..a811f503bca6 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -67,6 +67,7 @@ Currently, these files are in /proc/sys/vm:
 - page-cluster
 - page_lock_unfairness
 - panic_on_oom
+- panic_on_unrecoverable_memory_failure
 - percpu_pagelist_high_fraction
 - stat_interval
 - stat_refresh
@@ -925,6 +926,32 @@ panic_on_oom=2+kdump gives you very strong tool to investigate
 why oom happens. You can get snapshot.
 
 
+panic_on_unrecoverable_memory_failure
+======================================
+
+When a hardware memory error (e.g. multi-bit ECC) hits an in-use kernel
+page that cannot be recovered by the memory failure handler, the default
+behaviour is to ignore the error and continue operation.  This is
+dangerous because the corrupted data remains accessible to the kernel,
+risking silent data corruption or a delayed crash when the poisoned
+memory is next accessed.
+
+Pages that reach this path include slab objects (dentry cache, inode
+cache, etc.), page tables, kernel stacks, and other kernel allocations
+that lack the reverse mapping needed to isolate all references.
+
+For many environments it is preferable to panic immediately with a clean
+crash dump that captures the original error context, rather than to
+continue and face a random crash later whose cause is difficult to
+diagnose.
+
+= =====================================================================
+0 Try to continue operation (default).
+1 Panic immediately.  If the ``panic`` sysctl is also non-zero then the
+  machine will be rebooted.
+= =====================================================================
+
+
 percpu_pagelist_high_fraction
 =============================
 

-- 
2.52.0

