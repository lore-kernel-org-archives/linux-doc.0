Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A4245020;
	Mon, 23 Mar 2026 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279822; cv=none; b=BbIbLqmR7HeaK7nGEcNyj7oHuJPA9C7+hoO+mk+CktqwJ9CSjqbI6Q5gwz3j0Be3UssCdUEJUoH7Jaj9ui+ar9nABSgX69AuILpiFw51vjW1WntWPal/TnEw0TMXg+P3zp+gD83mkDzAxqAzPNPtFUlxv0GWqy943pCCPPY51iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279822; c=relaxed/simple;
	bh=jL377ytdCoM//Ho4ubP48OOIfsA/+ymH7ZOPYpJWWKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y42kpyNLi6OamIQ9lWYLnAhs7SI/qr3yqptVcmBh2R7YUineS5DV+GzIM7actWDL+/jZLX8TTXO0eEONb0PYM3EPEs5ndo3IOyrYIGbV6DApWYW+uFa3fFJz3X6zcnorfXun5XpI5TPp3NkuLKf3gR9B/cnPch2onhgRTkYUyFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=RrBpgySw; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="RrBpgySw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=KyGXX5+HJx34fkYM+Eg9zTm4QCG3KHrCHOBtah8R85E=; b=RrBpgySwdjAV3+WFL8Mru5P980
	9SQ4rhZSkDsOj2AC06ricxqYeCuzcnP8frnZvPhoHMeG68POl+066JMgStWe7nZwmkowZodBmZKek
	ls0OsdFPOqdBgQjTGFpyzMk32dkwH8+srZvwoZuUp8hqI3Uo+I5qfZA6+u1cVAGnFghtBxBv/4SGM
	NVILKMSpMFngQNz6XYrBj/jLAwNUX1FUDqMKTUuFS+mf8fUbRHKTO7I84qGQ5sbAdg7M5XyC1wczA
	qCFXWKJARagKGWdRqIurlMpP0CYkxQG4XyV/6gQ+te3fq0mbvNFuCjPouWPGP1SsWeCBZwIaIirFf
	IaUnVbSw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w4hEQ-007cwX-Ah; Mon, 23 Mar 2026 15:30:17 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 23 Mar 2026 08:29:42 -0700
Subject: [PATCH 2/2] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-ecc_panic-v1-2-72a1921726c5@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201; i=leitao@debian.org;
 h=from:subject:message-id; bh=jL377ytdCoM//Ho4ubP48OOIfsA/+ymH7ZOPYpJWWKA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpwVx9mcJMRz348d1iYSLpK0wFK23u5H0p2MPTV
 Ay34qwVDoyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCacFcfQAKCRA1o5Of/Hh3
 bWCwD/4umHrQNt+Fr5RoDabDdN2N48BqAz6131TiiU4X7zt4klDtfPB2xnQqS+9sLjngMAa9kzT
 wuAmSOGQnfT7UsZyMc/JkmutvxbYno8plRiyS9GgjHv52AiloMxFqKxsnDVJh1ifr6dIsyDv1NJ
 rPLcxkHijJBvpdDUdz59qgXnSV66sP85FfkKN2+f/QM6ftCMBdjB38EPjbEIXnIoYOhyg3G9OAM
 Fc/CUO/CyjLRBoly+vLX2m9oE5scQMbCeasRtMSeN/5eQOEmbixhW34b7nW+dWABAfdCRiX+abC
 UK8PMV0o8kJf8vX+7NtdcHyrJ79BEF+T7n1vc893/QjPi5cFzMW1/0u5esdzI5UQkLU7YMW96OR
 o/0qluJ7zsSc2dxuTxe/9RzPj4TWPjLD1Rm5VPoYLi1Dst1sR7/8a9QZRwZSoMnDRvgwm0K3XGm
 GkZkIY7+s+PI36s+IGF4VvC1hOuDSdtjL0dcVYTnvwOkMXKIlNpcsYKj2qw3+cSi7bNSudJtNhz
 Sm2UbW/PLzz6LdGt/JZB+sp448S+DIQrG1SLZaI33mLG6qSOicBW6+f1+EF22QB64fzjxW2F5hB
 uuqQx1PmMJ90+cKJ0eaPK2Rwg9c4TAHLWwwkmJKaYOgQB4hZQm9RL2gTdgf6VsCXFX978Ak0YZd
 5ViR8/D3+ttpvjQ==
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
index 97e12359775c9..3310fb8272fb9 100644
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
+= ===================================================================
+0 Try to continue operation (default).
+1 Panic immediately.  If the ``panic`` sysctl is also non-zero then the
+  machine will be rebooted.
+= ===================================================================
+
+
 percpu_pagelist_high_fraction
 =============================
 

-- 
2.52.0

