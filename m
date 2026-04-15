Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86523264F2;
	Wed, 15 Apr 2026 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257761; cv=none; b=ITRN//cTjfRFUc9ypfun6zs2X+GdOEg6Ico4ZOPz05n8h1+AyFGQT/3bRF/77PidtkQzRjtLDhL8GUi7nmFpS9urmsCnYatuwuXVfxY4gonXmSg/Oap0428bVslag00uY3pEXnq99yDpmjXEtc7CfpUUWOUr45ERlBK/heKCqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257761; c=relaxed/simple;
	bh=EXsbl4LOvo0JX/uD060vsfFhdmmxwiFz5i7QxlbIQHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+F3AqmQjh8mWi6TIzhxcxk/tR9I3P0+lC7+XF46ndkQiBXuNvFRAm9OviHVehJ5Qd44dclNk4uyr/NjY5ETEX6H7hNUQkV4ZWXuoDX4a4xPAhZujOJ9lGOyfPf53NC1E2rigcZEVnofGQTwHTrWyZ/eY6OAJo46zpWxrYzMis0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ASpGYU5v; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ASpGYU5v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=riFflWboHrZlyZ/i6D5M814hAUkl2Z5dRR5vqmlgkzI=; b=ASpGYU5vczZTHN/XsxD/FLQAyQ
	6SzORlkS8+LQdWaLAGjWoTcV7U7EYjKzXHAq7//tS6tYSTXZtc/JKbx6UDiELBiTw8J/KuM5tLOOB
	X0flixUOnVJlzq8BhnGjqvFK1p4HqRaWOQmjtn/WSv60pvdqlVuHYewUqjczEUZ3VtuTE3IClQkUJ
	3vK2CYHy6gkAoYfCq26Z7rO4tpe+64ickRryFncWPb45uk6KSDcTx+VrN0CDecnJIOdTFafFVcbjM
	b0WQf668NkUFjkp/OgnC7+koOfWTN+K1mDC1pA316ZO+R+XfvyaShK/gHr96w7sJ/1usqlmgZz5De
	WmC/jvgw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCzmc-00DqpN-1v;
	Wed, 15 Apr 2026 12:55:54 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 15 Apr 2026 05:55:02 -0700
Subject: [PATCH v4 3/3] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-ecc_panic-v4-3-2d0277f8f601@debian.org>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
In-Reply-To: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2686; i=leitao@debian.org;
 h=from:subject:message-id; bh=EXsbl4LOvo0JX/uD060vsfFhdmmxwiFz5i7QxlbIQHA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp34rHzbvgLtr3TTAmdP5mLG1e79OdmgxxC1fR1
 +wKbsrHi8GJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCad+KxwAKCRA1o5Of/Hh3
 bQ3gEACX1lxfvKvTxghRqJBwM6TajM+mlcfN8zoA9KsIMsIKnBuPbfHEWv1T8GFlR5n8AymDJBe
 x0r3lgTeAsJPVMBrRcFNRhonefmub4FF5hk5wbBOC+Q+7yAIumTYPAE5+l6lqJksMYHikqo6VDW
 2KvRnkyZMRFcIMgvbGX5KW2LOUI1kZKDhPW/2/LJf30R2P/tLBuAhhDgNU7ZG0qFdrSUZ6qX5Qm
 MZtUxf6SwvbyI7JlJXcJI1xnyvvedDMlnDdx8J/18XW41zgn+cwIyEkpsuGXKkGsM1l2MoV8Wda
 NLByRpDUNOLjJVjcOCr3+OhplbQi3mR4Ph1qBjlWUY81StlgklIkJ/gsX39nSWWwuhAs0nXr3a1
 wmY+10z+S/bTxsrSCBgLoOZ6vHptxax4m5lVZq+m1sO3Ked87jFkI2ke9mKKglZj/uZoMEJ7bKn
 RTXRZRH/BpW3tekyeeExVphRlRqExfEDJf6ueFYoDlShqS337Ozom6VffC2JB0CIdmlmDKO2uCy
 JNgSA4rGDzUtYBGuJFMPJpkS1fWgYjOJCvcVrRSqbfBEk/HQuo0Y0fz1motiv6ZpOFnavArDR14
 B2tCROnjtxyr3R/NIPgC5E28Xe1Zleqo81haT8UE8WgWbEGcrzBcW0OluJ6W05YD9OGLw3VHRUe
 ayxkxb2pnDUn9hA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Add documentation for the new vm.panic_on_unrecoverable_memory_failure
sysctl, describing the three categories of failures that trigger a
panic and noting which kernel page types are not yet covered.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/admin-guide/sysctl/vm.rst | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 97e12359775c9..592ce9ec38c4b 100644
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
@@ -925,6 +926,42 @@ panic_on_oom=2+kdump gives you very strong tool to investigate
 why oom happens. You can get snapshot.
 
 
+panic_on_unrecoverable_memory_failure
+======================================
+
+When a hardware memory error (e.g. multi-bit ECC) hits a kernel page
+that cannot be recovered by the memory failure handler, the default
+behaviour is to ignore the error and continue operation.  This is
+dangerous because the corrupted data remains accessible to the kernel,
+risking silent data corruption or a delayed crash when the poisoned
+memory is next accessed.
+
+When enabled, this sysctl triggers a panic on three categories of
+unrecoverable failures: reserved kernel pages, non-buddy kernel pages
+with zero refcount (e.g. tail pages of high-order allocations), and
+pages whose state cannot be classified as recoverable.
+
+Note that some kernel page types — such as slab objects, vmalloc
+allocations, kernel stacks, and page tables — share a failure path
+with transient refcount races and are not currently covered by this
+option. I.e, do not panic when not confident of the page status.
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
+Example::
+
+     echo 1 > /proc/sys/vm/panic_on_unrecoverable_memory_failure
+
+
 percpu_pagelist_high_fraction
 =============================
 

-- 
2.52.0

