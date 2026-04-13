Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E8E3CCFAD;
	Mon, 13 Apr 2026 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776086820; cv=none; b=mU7WNt6foKpKTz34unjMR6RqBqWuSFHW5FM5vQqj4k32t3+xxopHNnNzGs4z/v6sNjabF+Z+jjsaMM/1MADA0GhLgxYQfcoL6PFcqJG4/jTFalO3+xHWfGeBFnc4T/tQtPZi1svFqioG8dM8Xgv6dSIXwr1rcVvMdKC6XgiwKzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776086820; c=relaxed/simple;
	bh=5kticVozScC6u8qmLk9+hhZd71yiocm3BKCHqXfpTvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B96+yO7rdXBmh8/azbxa4+fT7ieTbHq1EtPxTHCLXC48FxOgAGXu0UQbLX4BGHOMUZraTmB+p1yoPE7KM6EfiXoRGjUuTcEKX1IWqrIFaaEN35Bl3dWtCyYXUQjq9xfuPw5QN/eKL/CIqLbJhEoJ2Kaa/Syn++XTXzbEr1EVmWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=SegWXM+3; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="SegWXM+3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=Ts5NH0xUvZdmVlkgq9z2yi5cSaxNAbH4JcbwnyOwfPI=; b=SegWXM+33+iQB4lzbciiQtJfqE
	y9zWi3WdYV5DpEeTro/sk84OUYQNQVXiNyWsbRLqt2/N/CcK9paVcPJMRqKbsthaKoz/3+sb9beNI
	32BB5VuwvDNg5IYdhiB8D4GkP6b0PVIVf9kgcd6j2pdv3fhtNe2llJUC/6GN7RNCqkimqw2o/+OeO
	NKNCv7SIBZFbG4myyCZ+8dlwRID4SOHvnyI/s6P5IIpZ5dIjaQ6vtfYmLu3p/zCz8QvhgJkLoeZ26
	KAkWfydAemXmFix9QXWrfWTCDPRnQZPYlEXq2vOUFVXsCPo8VrviOsUf/V66pCLP6SgF1rjhYamtx
	Gh5qEKDQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCHJQ-00CKEQ-2C;
	Mon, 13 Apr 2026 13:26:48 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 13 Apr 2026 06:26:33 -0700
Subject: [PATCH v3 1/3] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-ecc_panic-v3-1-1dcbb2f12bc4@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3839; i=leitao@debian.org;
 h=from:subject:message-id; bh=5kticVozScC6u8qmLk9+hhZd71yiocm3BKCHqXfpTvc=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp3O8OGjMhJ00sPwi1tkdTGacpr0NdoWmXFCwqB
 fETGcica/uJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCadzvDgAKCRA1o5Of/Hh3
 bTMOEACDVZS/51etxbpUL7Fkz6ajXdmMgOGgxmuNv7buSOZbViDuCi1ds2F/1rXwxwpxHG83XA3
 KYdFSDzqS9bqK17+lFSC4W7hfOXqLUID2NYoVCuvKScI1sk6JL9UHn8Q8mQFh7ohtfQgnYRJd/p
 VSDvW4wpIgX8+UavBQCvtRr5QIaH2zAhJD6DD6OUBQyn8/l4LSFOfVZHtEiCkOJO2xB8HrHDtM1
 UHQMlsndcKtDtErSj1OJlbqmy19xM/jD2HOf9zWN4RsGGOgz97uhbFYRHzb1ZgKdPagi+4Wm3v1
 R4SYPz6OHHtb+orElndz4KXEwwozJA5N8Msh+7efgPPho7Jpxxl789+XZVNVEiXfpOzqMSRVZD3
 DdnbIlV4hNrspnEz4iBuzVy9p5xJxn4yPSi4fmudxWGxon8iLyvzYdwGDhXi8kW5xzRvAh03Gry
 pttT2Vl7BcM81su4p1IOFRkj/WrBpcdWJOXhy4yzxkbHIEwYIHNldDBO5QRiRvm7zcGmY0R024/
 70ETzBG98+7b2FHdnFxlg7HzcOw9SRPCfF+ODwTOYVoEn0twZKFTT1GOqqLlvVKEcPVAlloxV/G
 OJfI0egBuyqFiBQIx8+pdyhjLqBKL/oY3hldDPmapM2IONXLZpO1kjwarMk4T8KCFQKbhTf58Sv
 ET1F4s/x9fIsJGg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

When get_hwpoison_page() returns a negative value, distinguish
reserved pages from other failure cases by reporting MF_MSG_KERNEL
instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
and should be classified accordingly for proper handling by the
panic_on_unrecoverable_memory_failure mechanism.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/memory-failure.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index ee42d43613097..852c595aff108 100644
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
 
@@ -1281,6 +1292,35 @@ static void update_per_node_mf_stats(unsigned long pfn,
 	++mf_stats->total;
 }
 
+/*
+ * Determine whether to panic on an unrecoverable memory failure.
+ *
+ * Design rationale: This design opts for immediate panic on kernel memory
+ * failures, capturing clean crashes other than random crashes on MF_IGNORED pages
+ *
+ * This panics on three categories of failures:
+ * - MF_MSG_KERNEL: Reserved pages that cannot be recovered
+ * - MF_MSG_KERNEL_HIGH_ORDER: High-order kernel pages that cannot be recovered
+ * - MF_MSG_UNKNOWN: Pages with unknown state that cannot be classified as recoverable
+ * - and the page is not being recovered (result = MF_IGNORED)
+ *
+ * Note: Transient races are mitigated by memory_failure()'s retry mechanism.
+ * When a buddy allocator race is detected (take_page_off_buddy() fails), the
+ * code clears PageHWPoison and retries the entire memory_failure() flow,
+ * allowing pages to be properly reclassified with updated flags. This ensures
+ * that false posiotives are not misclassified as unrecoverable.
+ *
+ */
+static bool panic_on_unrecoverable_mf(enum mf_action_page_type type,
+				       enum mf_result result)
+{
+	return sysctl_panic_on_unrecoverable_mf &&
+	       result == MF_IGNORED &&
+	       (type == MF_MSG_KERNEL ||
+		type == MF_MSG_KERNEL_HIGH_ORDER ||
+		type == MF_MSG_UNKNOWN);
+}
+
 /*
  * "Dirty/Clean" indication is not 100% accurate due to the possibility of
  * setting PG_dirty outside page lock. See also comment above set_page_dirty().
@@ -1298,6 +1338,9 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
 	pr_err("%#lx: recovery action for %s: %s\n",
 		pfn, action_page_types[type], action_name[result]);
 
+	if (panic_on_unrecoverable_mf(type, result))
+		panic("Memory failure: %#lx: unrecoverable page", pfn);
+
 	return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
 }
 
@@ -2432,7 +2475,11 @@ int memory_failure(unsigned long pfn, int flags)
 		}
 		goto unlock_mutex;
 	} else if (res < 0) {
-		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
+		if (PageReserved(p))
+			res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);
+		else
+			res = action_result(pfn, MF_MSG_GET_HWPOISON,
+					    MF_IGNORED);
 		goto unlock_mutex;
 	}
 

-- 
2.52.0

