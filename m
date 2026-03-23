Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645CA3B3BE5;
	Mon, 23 Mar 2026 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279820; cv=none; b=GsbUkmHoM1WH9Ym/BaPzytF2odcw8nzUMtmmkSaLh4bb+bzVq1DLtbHT4WGotu1N5sF5f2K3wGQau4qvvo5ldYTa7IlTcjhdeEQ3gBceEq5hg4WNCKD976WK+RD8nuqPlbn2xwvMDf7h1MjTujhphXzAtDin0xFnYCnBlGlyLRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279820; c=relaxed/simple;
	bh=BRu/uT3W6S86Xguye/JZNbSsUnO3+bic+mN1VkP6A44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NowiE+QIpzmZ/p7GCVB6o0IzECL0/mw4xBu2RoaIr14rnNE0gdtRF2oCsiGQqlrDl6wt3phft8hVNtBS32NopNroQKqHHD87bmN079s35/z257lG6rhDjYdtDXYSAygUwFBfVQ9J9XaT9agK12ue7p6QW+tPPGPxqqyjxr52q/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=HLT/Je4o; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="HLT/Je4o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=hs5AaukrdFZg+ZHq7Ly+Cm0DtzECAzYMSxHy8UfYBWo=; b=HLT/Je4ox9ntuJpC/sssziOdTL
	QfNnubHSQjyaukOdefaaxN2ZzCY8uIQy0CLWcPkpfBQ2QBnncSEDAY6z8v13+zcKC93E5o2zlZhtC
	PGpF0O5oytLitPWCEkdtnZJ5E7uWKUZix05I5nXzmbfKCiQUbz/Bn9xbJg5pKCu4AM62l3oHitPqn
	fZez9XbGldpYKaZEVygrHBJMLncJ1WfHSyEfS9frcEFCiZBonKvtFvRG9MI8nLMd0rogcZ7WmGrUZ
	8x8DRigVSc3P2St3Te/mYZ7NHMS3N9/MDRGWubgNH6oWl1fUI383oMsGXQqpFfjNC0jY7QABumCoo
	Fuoq84fw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w4hEM-007cwP-GF; Mon, 23 Mar 2026 15:30:13 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 23 Mar 2026 08:29:41 -0700
Subject: [PATCH 1/2] mm/memory-failure: add
 panic_on_unrecoverable_memory_failure sysctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-ecc_panic-v1-1-72a1921726c5@debian.org>
References: <20260323-ecc_panic-v1-0-72a1921726c5@debian.org>
In-Reply-To: <20260323-ecc_panic-v1-0-72a1921726c5@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978; i=leitao@debian.org;
 h=from:subject:message-id; bh=BRu/uT3W6S86Xguye/JZNbSsUnO3+bic+mN1VkP6A44=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpwVx91nh/3gITwRCtMZ5ICYhNvOzbysM6UGwey
 enOznJMOH+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCacFcfQAKCRA1o5Of/Hh3
 bfKED/9ujb3DroZDcyb8s6MgZ+3XY+lG5ikMKCpF07sDNSQN0LJhSJCznXEz7BkrDK1af2cM7Kf
 0D21Po3IbonUhJ1Y89QYcsfnogwTj9ZJ/thC+Czly8SgNGCYw4U2YS3ACA9bsIvaYNmCy0fHuZU
 7WV71tEcS7jmjgnIyee/I7CMez1KyBcTlgKGW4KatexyKZvApj9rGb4XoCmZUgrcqJ0c/MMvuov
 t+M04RJBMbmcl2PKMffze2ndyL3mkCL0J8iWOCa7Wv6ju3rK+FarWgMFXrAloKtE3sHFfhsHMDh
 RDmuo8urdrt49GtdOeDoIRrfSelN6ADdZpj8yaSJJsGJSzkpMK2iXr2vfk8Y/L7vAeuZvQgkEv1
 TLjTqVyHK03mu77tXr1JdDR6mD4hOLi6vkprv23PMrdOtUlq4M8k8qW/lwpxaP5coTC/TRwgXOw
 EelU/iQBwspJfHxrNEL4kYYfJbTZpU0bxcGfuKuiwo18uVZ0CqAJ4bu4MqCDSn8/l0IlB3kdyvF
 OqXK9ZdddgmOoWb70d5rwKXoNkTk6HYZCJ5Ob51noTA8JRNY+c7WcabdFQlGQ00xmfDC52bgG53
 Car8ZDuQPSfcloFs9iuRLGbUsyFYSHgB8pxnMfj5tdCmjGttnr9kwHvTK2Sz32fLVSCoWXO7ZCl
 sxFNi/2wlv9PGiw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

When memory_failure() encounters an in-use kernel page that cannot be
recovered (slab, page tables, kernel stacks, reserved, vmalloc, etc.),
it currently logs MF_IGNORED and continues. This leaves corrupted data
accessible to the kernel, risking silent data corruption or a delayed
crash when the poisoned cache line is next accessed.

For example, a multi-bit ECC error on a dentry cache slab page was
ignored by memory_failure(), and 67 seconds later d_lookup() accessed
the poisoned cache line, causing a synchronous external abort:

  [88690.479680] [Hardware Error]: error_type: 3, multi-bit ECC
  [88690.498473] Memory failure: 0x40272d: unhandlable page.
  [88690.498619] Memory failure: 0x40272d: recovery action for
                 get hwpoison page: Ignored
  ...
  [88757.847126] Internal error: synchronous external abort:
                 0000000096000410 [#1] SMP
  [88758.061075] pc : d_lookup+0x5c/0x220

Add a new sysctl vm.panic_on_unrecoverable_memory_failure (default 0)
that, when set to 1, panics immediately on unrecoverable memory
failures. This provides a clean crash dump at the time of the error
rather than a delayed crash with potential silent corruption in between.

The panic is placed in action_result() so that all call sites that log
MF_MSG_GET_HWPOISON with MF_IGNORED are covered, including the hugetlb
path in try_memory_failure_hugetlb().

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/memory-failure.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index ee42d43613097..25bd043497195 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -74,6 +74,8 @@ static int sysctl_memory_failure_recovery __read_mostly = 1;
 
 static int sysctl_enable_soft_offline __read_mostly = 1;
 
+static int sysctl_panic_on_unrecoverable_mf __read_mostly;
+
 atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
 
 static bool hw_memory_failure __read_mostly = false;
@@ -155,6 +157,15 @@ static const struct ctl_table memory_failure_table[] = {
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
+	},
+	{
+		.procname	= "panic_on_unrecoverable_memory_failure",
+		.data		= &sysctl_panic_on_unrecoverable_mf,
+		.maxlen		= sizeof(sysctl_panic_on_unrecoverable_mf),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
 	}
 };
 
@@ -1298,6 +1309,10 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
 	pr_err("%#lx: recovery action for %s: %s\n",
 		pfn, action_page_types[type], action_name[result]);
 
+	if (sysctl_panic_on_unrecoverable_mf &&
+	    type == MF_MSG_GET_HWPOISON && result == MF_IGNORED)
+		panic("Memory failure: %#lx: unrecoverable page", pfn);
+
 	return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
 }
 

-- 
2.52.0

