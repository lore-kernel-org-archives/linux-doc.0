Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A723CAE95;
	Mon, 13 Apr 2026 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776086839; cv=none; b=meWV+2prlpPe7Ygi/GATK9sN5QidfZ2vn0+DGEbgYjOCYszqsM0Ue76YsofhG6TJghDpBwOnZuzwQc116UykCUl1xtpYfqqX4M7gQ1VI27TBfq3e8sXpDOcxzRIDsu39Y/g+edr/gnfAB28T+c/LeUVDxewU4S+3UP0+ne2Jyyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776086839; c=relaxed/simple;
	bh=Mp1Qv6rhhs0jzy9DwGJSWL5EM4TqsDFHcgB+US1rhmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DiSm5ys/gSAEnV0EgHIhuIHJI51MXNdq1qMWQFjBmTQQqxZs4AZTawzEYVjMGSbwLWaaa16oO+DxLW9jXZj5Vo3EVVy52ErGhUPOx9YQQrZtfnRX7+UrlLHBuIWpQS+S0QPks3CIgIvg1UPXw/RWbEBfTZymatYum3BgI+AtO2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=QBzc305O; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="QBzc305O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=nbtwqqP04/XwB92jTwUHTtIQvE/SEZDBq3VRc3N6Y6I=; b=QBzc305OGUU3CKBmxPvJpBa4Oi
	I+/4n5il8SogHtoZ9MYMe5yABscVp4Uwgzh7udwzt87tchgUBR60wrkk3013QEZGquOerBE/DLD6y
	I+rFCji1nIzcCUrJJ++zbGDBJANL6pQRdpdDLuinvsc9TNjaujyOLdviEwyNIbBayln7o509HIBre
	Wic1Em1XHS3+OKmfW9u9rOJ1B2ipR/UxyfAneocY+8yVQKj51+KYTOvC4M2+068/5Nc0unBm+gz+2
	6yfunAVklS9x8MwaYjqT5W9Tu0FsVhUTnxel7+gKsAbEs3NZc9MtgWZazik+Kr8QK9RHHvsfede3r
	voQFxuVA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCHJa-00CKEj-03;
	Mon, 13 Apr 2026 13:26:58 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 13 Apr 2026 06:26:35 -0700
Subject: [PATCH v3 3/3] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-ecc_panic-v3-3-1dcbb2f12bc4@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3210; i=leitao@debian.org;
 h=from:subject:message-id; bh=Mp1Qv6rhhs0jzy9DwGJSWL5EM4TqsDFHcgB+US1rhmY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp3O8OOxyyLmnEVBgYOxqnlJRNzEM32jMwRHuJl
 lp++LJaOeOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCadzvDgAKCRA1o5Of/Hh3
 bbCzD/9leaOJbS39F2fvv+N0M66/TmFRtRCcOvuRaKUAiQBKdSD1YSoEQj/XTjfciF6P5hnM7xz
 z+aS5nQ1qmxSLt/HRHr7rxoCfaSg0I+P0ltripbJMdGICH4kW1rvmfUcGQT8wRwz/4lipjlOFec
 jFublJBDLwhJmN9e2X3x4uXgJu4D4w8QWlXAW/ScqPcOYARBsjIsbWn44+1JoehOLSovAcWL/Pp
 LT+uIQxpkclyud2f+JDVRHE+vZDjl+PIgNWUBQBLCHWUmTCmxgh8jkkpMgVblybwg6t2113OfPw
 fHUQy5kQesNq2FKEU7QUESbLK0nXapRElS1AFOJvPhm7hkXbtTsa+k+39jLu4/zxFv8ToGhG6i/
 PQWe2A/8s9edOQR1dEQ6MVbsrzZE1gduOsoMmFv2REu4gqWiEyFdDynidGUS6evfEBTgOV72gSd
 nfFItHI9Iha6SBepQQB0W2IGVk587944kax9CtNXIWL5JOyt88lDUXkZy7h/L0R8rP2jlRPWjWm
 bpiDU2XojNGjjJeOJiQHh20p54N+ghvu63JKOZeeNlw6/dKxYqUFTPznWPwtm4NGxsO8+V10KmE
 3WopOzwuVW+t8nmq3ORD19ijF9bZwM8FQsKnklTlw19aTltDK+/URDsNvwZFEfveAYI0aJArQeU
 m2XO1b/mwZvaQ6A==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Document the vm.panic_on_unrecoverable_memory_failure sysctl in the
admin guide, including the CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC kernel
configuration option that allows enabling this behavior at build time.

This follows the same format as panic_on_unrecovered_nmi and other
panic-on-error documentation, providing clear examples of:
 - Enabling panic at build time via CONFIG option
 - Disabling at runtime via sysctl
 - Enabling at runtime via sysctl

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/admin-guide/sysctl/vm.rst | 46 +++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 97e12359775c9..af545869bc1b4 100644
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
@@ -925,6 +926,51 @@ panic_on_oom=2+kdump gives you very strong tool to investigate
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
+This sysctl can be set to 1 at boot time by enabling the
+``CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC`` kernel configuration option.
+This provides systems with the ability to enforce panic-on-error behavior
+from the kernel build, without requiring runtime sysctl configuration.
+
+Examples:
+
+1. Enable panic on unrecoverable memory failure at kernel build time::
+
+     CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC=y
+
+2. Disable at runtime even when compiled in::
+
+     echo 0 > /proc/sys/vm/panic_on_unrecoverable_memory_failure
+
+3. Enable at runtime when not enabled at build time::
+
+     echo 1 > /proc/sys/vm/panic_on_unrecoverable_memory_failure
+
+
 percpu_pagelist_high_fraction
 =============================
 

-- 
2.52.0

