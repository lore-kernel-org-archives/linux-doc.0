Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DD93A543F;
	Tue, 31 Mar 2026 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954845; cv=none; b=gFpyluYvZwMnzj3P8uJn87kBc0AAzLIHcHNMpMLYh8zDnzZtzizBWGyb5KkK0J9sBjZPuOD50zyiOU/bdW7C8r4plI6tQnNm4rVE4UkTp3jv+K2FM6KH78M5R8zylJEgIfwYOHvQ4lhk5niiesn1MlEol0b3bHt7gHzvrHtdSY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954845; c=relaxed/simple;
	bh=yzGP/Cy1yyj6AMionGm0ecG3Z37VsQOIJST1oCRcuAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/cwcMq4XIYlFJ2SqisNVCkCf73LIcUoohwWC2ZLzrhf+THU2SNoZ78Gpm/QkL3ID0hmoion/QCN4G+7jX6GdDxmk/GyGayKmG68wDLx/qi9/OvfluPYzkFzrWTXbLXNTXrNqRc12++kWahZ7JEZsyYvw7y387CI7ZXsIaP4yps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=qoNGz+Kk; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="qoNGz+Kk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=rVyhTawyidgAJFXlFpU1kNzGw6yToxZt3Y3vvzuWrVQ=; b=qoNGz+KkXkQW3BqbH2rQVP+plM
	Lpy5EaphkrsicKHvP+14QwCjtVBz1wPZunwR2OX+0/rP2uk8iOcampfze+kP4Mb+/aUGPAnSjoksO
	MzUDlxkSo9HIie7ra43H8/uYRDQvaR0VtclN+d2KAqiTCPrXEYURGg6ez+pPKtrnEka9o5J6OphI5
	Iy3vEZhaph0BjibtZ56hp4XQcLcbOy35KCFr2l4BJ69fbXC3y7KI0HHYlQWjzJ8SptDDf1bFi9yfQ
	43kCbKQM8ZaIFcqIfiwEqDbFcsBhkVUXou4AL+SjFPopnT9fomZAGgo4pJ2AFklTIpvdQ6LZ//e77
	WRk7DrlQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1w7Wpp-002Aat-1L;
	Tue, 31 Mar 2026 11:00:36 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 31 Mar 2026 04:00:17 -0700
Subject: [PATCH v2 2/3] mm/memory-failure: add
 panic_on_unrecoverable_memory_failure sysctl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-ecc_panic-v2-2-9e40d0f64f7a@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1836; i=leitao@debian.org;
 h=from:subject:message-id; bh=yzGP/Cy1yyj6AMionGm0ecG3Z37VsQOIJST1oCRcuAA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpy6lIqDJQvSdPLFq2MknuEvV7NkwbvksSPwQSQ
 7SDWBXqpaeJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCacupSAAKCRA1o5Of/Hh3
 bWzVD/wMEOFVeqAHE2Bo40HWmg1QMcTSipGvQHqL38jYHHqnOqXtg5Hj7d3c+YppJwEfs0QjFTA
 EcOibEYB573vJ1emMullT6EaX+vids8do9+A4DuxmM/Tvv6ijRy5LYi35aKp1E8u3Dp3aOQuvoW
 kJKb12RaZLu3QzrmfvyXWGQSFP+yyjqxpW56GzyAga0q/iWDywpxA8yxCUzfUT7ObsYejpLmdVl
 Zw7muxBxdc4ig0qzVFu8p4mPOfsjCrqoJrlK57xk84RVll65KvBMJvDR5ndDHQTrwfOarJpzGbx
 rQPN3ZJ3GS2nSsv66y/w8Gz+pGEPh8Inv9lvMwhcaLfWXSEUwCQ/4DGwUysY/3LRtMCenFpMiU0
 hTY1DleA0RfkpEfaGyy7Fi1ILFm8Uwk8zMZ1KIAbvEzVA8Ba2QJQjxaTbQn17AC4Y90cZHidbPv
 3i7I+kAGBQSP6hXw3gFEEMIvkWfWoKZZZY/47jWOKZuTH9qfu2Tr7iBNeIrlg33KH+hJ5owL6cl
 u/VjzANF38CSAb2yQdUlyRDJnYgcyQkmaXWO8Yb1uH6K6b7z4b0qebJ6DHqNV83wCMJWxwq5Pyv
 IijdlEzmEFbyPDxpsR5cOdIiLRELA/8gfu2HSHramLNlpPqUt4hshRqaSdwJNw0IfaaAD0c4vtH
 Z3/+zy2gRZBkGkw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Add a sysctl that allows the system to panic when an unrecoverable
memory failure is detected. This covers kernel pages, high-order
kernel pages, and unknown page types that cannot be recovered.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/memory-failure.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 6ff80e01b91a..d0d911c54ff1 100644
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
 
@@ -1298,6 +1309,11 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
 	pr_err("%#lx: recovery action for %s: %s\n",
 		pfn, action_page_types[type], action_name[result]);
 
+	if (sysctl_panic_on_unrecoverable_mf && result == MF_IGNORED &&
+	    (type == MF_MSG_KERNEL || type == MF_MSG_KERNEL_HIGH_ORDER ||
+	     type == MF_MSG_UNKNOWN))
+		panic("Memory failure: %#lx: unrecoverable page", pfn);
+
 	return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
 }
 

-- 
2.52.0

