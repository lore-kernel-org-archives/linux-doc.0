Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC103CCFCE;
	Mon, 13 Apr 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776086821; cv=none; b=T+qg9rS2DayTIp0WR+U/6rCmOyqdK1fcDX+kzYhTb4kC5vFJ+Nb6qBqK/UjNni148rmXqGpB4mWAu6a62WS3fQT6Cr77Q9MIIW0scprf57oE+MnVZ54etNp+qCRWxMGbnImTmNhqj8U0w3GaUhO+el0n1wO7vmDdD2N9ANMN1Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776086821; c=relaxed/simple;
	bh=bjhevl0rGny8MBH5z4YjsMVd08Vv7Qa3pt9kmLqdPhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jpHf5d1Iji0Mlj++RhKqWEtueYlOlNLQT+uK14byzR2MLf282TZOH99aUfJ1eSTllwK/FquMF9/uin0TrSNyGxiXU90j26n84magkT/7j60JchpmmS8QDsVbcsAc9NGds60nx0ch/E0TWRMUEWWXDUtpigsn8aHFgrJuT7Hrbds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=GoM5tt+g; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="GoM5tt+g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=glADREE+VEmEvXEBjVhecQZeEIPkFQqH+en5bctHaaA=; b=GoM5tt+gkJHHCFvIY8VycuA09j
	dx6RZ3UWH1pXUr8olEKT6e5C4EpFAiJmhCidL3pz9AmJGuG8/uOghmWuwCQVue4EP6/cehujA2ZzM
	MB93Yk6xGSLy5LoZI+qxEL3LSMlMIN4iqtQJcDg96G+rLgTm7zVrXler+RVhQt46PRTkCyQPZYojM
	rOZnHtIi1a3nH34iT9JEdyOSzMMjOrIQ5EBm8jtBHsGRLjtoQPCoWeppd/5iuInMTJX+osJViQx1d
	PbEpxQWmfoeYj3SMJgifSMRQ7Sr8KDWfZ+xk6vtHQHFWRoTvGmFNsu2IoVeyDMKIpmf8qFdgHfYZc
	/UL015ig==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCHJV-00CKEV-1k;
	Mon, 13 Apr 2026 13:26:53 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 13 Apr 2026 06:26:34 -0700
Subject: [PATCH v3 2/3] mm/memory-failure: add
 CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-ecc_panic-v3-2-1dcbb2f12bc4@debian.org>
References: <20260413-ecc_panic-v3-0-1dcbb2f12bc4@debian.org>
In-Reply-To: <20260413-ecc_panic-v3-0-1dcbb2f12bc4@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3040; i=leitao@debian.org;
 h=from:subject:message-id; bh=bjhevl0rGny8MBH5z4YjsMVd08Vv7Qa3pt9kmLqdPhg=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp3O8OF6tcX6PKJIBNETopoLJS8dwox8KQs2U4y
 BFoRT7EAtuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCadzvDgAKCRA1o5Of/Hh3
 bc8MD/9AxahVhWW8Xw4b1CRGc/JOcFzM8uT6pxI5EuHMeo8DCmrD/HLeYtkEmbQzqvIkvCPqiLv
 CvCim+4708mbhR4OP2HuM5+ojhiZ2FWhTT6fl6KVvVFcjzboF/3yRynwezzQtEVNNF2rsjsqIXL
 LnDH/M7W1LH7BbiKy2GzzcqLooGr8+u1Cs0NorzgATzvrw/nHd+Xq6O9m+j34H56tG3nYctQj/k
 faKtHcQr7swEdAPFypQXWDCG1OgoOpzNOMzkz/xhztftSluBoyfeA/13pspc/+PQeVC71DTrfd9
 juJMe5Rmu+SoAdp5MbPNuRU3BOQvqwIgsJ/u6GbXeJUa31TVR+OlsicTlRaVlnTBRy/0MlWOKXF
 bIrNDWWLAImz9hN2G66hqMmDM++3pagzs38I7C0NvTcP5y4/ngLr3DhIvuJFICgooWuAqZJ7C+z
 Z5k+e0mNVkTRRoc9IiufcU2AjCIknGJo/X+WuAV6qPI/Y5IrfjrxpWLHNW1ssjm6OZpy4o0ENM+
 5NMxSOBEiSKEvJK4IdK0Poe7/i34DqFGt0hLPnAJbSjkOkXP42qZdtrauXu29SswtCxCteLLJEI
 cyleZoYrTMKo1w74d73f6Orn9HDOS40Ejfi9TXRWuMVYAPzucjeUVVwIVX44qO/Krc0xZK6f3Tq
 +Hrh9IaHgpTB4lw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Add a kernel configuration option to enable panic on unrecoverable
memory failures at boot time, similar to CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC
and CONFIG_BOOTPARAM_HARDLOCKUP_PANIC.

This allows systems that prioritize availability over recovery to
automatically panic when encountering unrecoverable kernel memory
failures. The behavior can still be controlled at runtime via the
panic_on_unrecoverable_memory_failure sysctl.

When enabled, the kernel will panic if:
 * A memory failure affects kernel pages that cannot be recovered
 * A memory failure affects high-order kernel pages
 * A memory failure affects unknown page types that cannot be recovered

Examples of BOOTPARAM configuration usage:

1. Building with the panic option enabled by default:
   CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC=y

2. Disabling at runtime even when compiled in:
   echo 0 > /proc/sys/vm/panic_on_unrecoverable_memory_failure

3. Enabling at runtime when not compiled in by default:
   echo 1 > /proc/sys/vm/panic_on_unrecoverable_memory_failure

Similar to other BOOTPARAM options, this provides a balance between:
 - Safe defaults (disabled by default without CONFIG option)
 - Production flexibility (can be enabled at build time)
 - Runtime control (can be toggled via sysctl)

This is consistent with the kernel's approach to other panic-on-error
options that allow systems to choose between attempting recovery or
failing fast when critical errors are detected.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/Kconfig          | 9 +++++++++
 mm/memory-failure.c | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index ebd8ea353687e..596f24a872ff6 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -733,6 +733,15 @@ config MEMORY_FAILURE
 	  even when some of its memory has uncorrected errors. This requires
 	  special hardware support and typically ECC memory.
 
+config BOOTPARAM_MEMORY_FAILURE_PANIC
+	bool "Panic on unrecoverable memory failure"
+	depends on MEMORY_FAILURE
+	help
+	  Say Y here to panic when an unrecoverable memory failure is
+	  detected. This covers kernel pages, high-order kernel pages,
+	  and unknown page types that cannot be recovered. Can be disabled
+	  at runtime via the panic_on_unrecoverable_memory_failure sysctl.
+
 config HWPOISON_INJECT
 	tristate "HWPoison pages injector"
 	depends on MEMORY_FAILURE && DEBUG_KERNEL && PROC_FS
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 852c595aff108..cf06960b4d069 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -74,7 +74,8 @@ static int sysctl_memory_failure_recovery __read_mostly = 1;
 
 static int sysctl_enable_soft_offline __read_mostly = 1;
 
-static int sysctl_panic_on_unrecoverable_mf __read_mostly;
+static int sysctl_panic_on_unrecoverable_mf __read_mostly =
+			IS_ENABLED(CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC);
 
 atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
 

-- 
2.52.0

