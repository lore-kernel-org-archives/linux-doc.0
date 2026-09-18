Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FED651C33D
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754585; cv=none; b=D3ABXou/HPpq6TCtJlC/RSPjfkcBsmH6//9100VeC4xjr0U3qwYvzqPy/IXhwY1RdCFjvPHHmYakqjenw7uWI1hCbBdUT9R4VKgaSOkv/VJrC7ovFatfvADce7NNu/gl6sgbnm5YStlTMpCxDIo2X/eWK3Ax0aO8/moE9QADse0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754585; c=relaxed/simple;
	bh=DKrV8Dk2Xf7+0f4DO4cy+Nlg5v572tfl82Ug1Z8WZHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy6nlkG8C6za/RmnDkg7eZpAm9nxTN8BNxtR7lZBxfg5Y5fEUgMmSkOaJ1VQfWGlhhRkVJGz6U6ednDfurTeIZEFw6ntk/zTPA/kWFHaY4KPqVhQW9xP6Hw/pXYi87Q8ovVKhV6feW8X0oDJtE1enWvBX6GXSku2BROYlXVwFsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKrZdAbX; arc=none smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKrZdAbX"
Received: by mail-oi2-f41.google.com with SMTP id 46e09a7af769-805cc8b4231so577484a34.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754578; x=1790359378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkWDXoev3ue4855J8KR8M6HtT2XHzciSRhLql9R/iaw=;
        b=NKrZdAbX37tFFps5wJG4gDwuD+7Amk62HrEVxFb/x1qyabY3KErXXE+KjUcrEOyYmL
         K4OwhcMHOEeh+DxWeefb/D0MzN/Tkp4CezgeyEEXrSRlKXIOCLI2xN9GZ+EIEVVwEa7p
         GJ/p0t8SrCvbbixIM+pkLNA20Vkh6DiJdCp/xYd2FTdukvboriPIQU1toHND7YOwAvhh
         kDAabakX9n/RP4yzyoR5YnGsD5tXBCXAlLfk/msencEMtGQxxQwahA3rlzpIlPkU67zt
         QEczZjrWWPzmHWBS8lWuCRi93i6JJil4KnMTv96lYSbMWkoXeXvBkWz3ID8x7fo46Yl5
         FyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754578; x=1790359378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WkWDXoev3ue4855J8KR8M6HtT2XHzciSRhLql9R/iaw=;
        b=VONYV4svoEZHeFFqwQwtqkpMFPACn2tjPuLjbnTdyJiPBGgo7cLUYho1vRlw/Us0v8
         WS2EsvIlR1Od0pSAackHbtiP8F5RChcq2hHhvRXHjrrruP5u+Tl1FPaxuA47Yb/3sihh
         zPuRF8nD8isOR4zmsS7QJsXRxx+rqDrm31uFVnz8gdhAPfrfcKRUhE4Yi1Gyq9CirQDj
         FZZ4eBLUk0jZ9QYCA5QZrfBQVq1MlBsJ70Y4ol0ZPBslj4v1+dos/1NEspmDbCGR9GBB
         y8q2bXocr9iQdPWXhdKXRtgg/OjDG/O4d5UB8khnC9/BVCuc6RtfpSU8YWPUnwx5N8Pc
         aZkQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3i77ukl+dqqiemd/19pdPcSdmdujf7tg2/c0ehU9+EBXxAjoOxLDo6zPHApiWDOWp48Bqdr8AtOs=@vger.kernel.org
X-Gm-Message-State: AFuF++lNfDcgE4gZey3/U6YkJrCen0GdVvO1Kz+ZoksjQk+h5vfQHL4R
	LkF4zhaRUS76neoBesE6MFgpq1p2nryw1jxj9pI1x3L2LHpPGk+5nUTz
X-Gm-Gg: AYBFou1peiWWBWST8WqIMQLK7CqLM7zCzpFRDjMt7c+WZ0izl+wfzBfszAYr9HaAoSF
	bdAlz0VpSAOjU4vilviGoz2biYSc+NG6GjadPeehXWbnw9SqUOtCsDsPfypamlWp7VrzG3usPI7
	Bq/rmjmSzX1iU+FAGX60capNnRhnFXkQKt0AuEfPPgUdFnHApst6+e8PBpBUJs7pD+/v7BULHZ7
	LhKzazFP9tMEdepowzsAY4din+mSc+s0gUvWC9sS73tMoZmoxUhYFuTx99iEIxmBO0EIEj9iuya
	6MToCuh0S8BrBkPEM4KjFpABi5HZD3DfiCPMt6hPPRN3/lV2yoBlegnjw/7XsQJIYqfJA8unj8Y
	Qpw6clEJrdV/Exfg9aPRRDQABfghPDLFf99GG9o0/Tv33zff6JV/SgM/kx69/Fi/EHKvepD0Dmw
	fQjgUb31IKFyti9OgvCGRTWF2TiBqh9iwgoj/Cea6qHPJhv+pxylN9u8cJ2R735K7LlSjNHEeNH
	jjnncrY05zhTjN2O6Ssng==
X-Received: by 2002:a05:6820:81c2:b0:6c3:38ca:c9c0 with SMTP id 006d021491bc7-6ca9ca59232mr3229844eaf.53.1789754578532;
        Fri, 18 Sep 2026 11:02:58 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd3591d0b6sm565715eaf.12.2026.09.18.11.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:02:57 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosry@kernel.org,
	david@kernel.org,
	muchun.song@linux.dev,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	chengming.zhou@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	qi.zheng@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	riel@surriel.com,
	gourry@gourry.net,
	haowenchao22@gmail.com,
	corbet@lwn.net,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	kunwu.chan@linux.dev,
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v5 09/11] mm, swap: add debugfs counters for vswap
Date: Fri, 18 Sep 2026 11:02:39 -0700
Message-ID: <20260918180241.3424851-10-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918180241.3424851-1-nphamcs@gmail.com>
References: <20260918180241.3424851-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add /sys/kernel/debug/vswap/ with two counters:

* used: virtual swap slots (pages) currently allocated
* alloc_reject: cumulative pages that failed to get a vswap slot

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 3c3fc3b87b9b..cf07d87d2301 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/blkdev.h>
+#include <linux/debugfs.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
@@ -142,6 +143,7 @@ static DEFINE_PER_CPU(struct percpu_vswap_cluster, percpu_vswap_cluster) = {
 	.lock = INIT_LOCAL_LOCK(),
 };
 
+static atomic_long_t vswap_alloc_reject = ATOMIC_LONG_INIT(0);
 static void vswap_mark_cache_only(struct swap_cluster_info *ci,
 				  unsigned int ci_off);
 static void vswap_clear_cache_only(struct swap_cluster_info *ci,
@@ -1996,6 +1998,7 @@ static bool vswap_alloc(struct folio *folio)
 
 	this_cpu_write(percpu_vswap_cluster.offset[order], SWAP_ENTRY_INVALID);
 	local_unlock(&percpu_vswap_cluster.lock);
+	atomic_long_add(folio_nr_pages(folio), &vswap_alloc_reject);
 	return false;
 }
 
@@ -4827,9 +4830,25 @@ early_param("vswap", early_vswap);
 /* vswap does no IO on its own. */
 static const struct swap_ops vswap_ops = { };
 
+static int vswap_used_get(void *data, u64 *val)
+{
+	*val = swap_usage_in_pages(vswap_si);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(vswap_used_fops, vswap_used_get, NULL, "%llu\n");
+
+static int vswap_alloc_reject_get(void *data, u64 *val)
+{
+	*val = atomic_long_read(&vswap_alloc_reject);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(vswap_alloc_reject_fops, vswap_alloc_reject_get, NULL,
+			 "%llu\n");
+
 static int __init vswap_init(void)
 {
 	struct swap_info_struct *si;
+	struct dentry *root;
 	unsigned long maxpages;
 	int err;
 
@@ -4881,6 +4900,12 @@ static int __init vswap_init(void)
 	mutex_unlock(&swapon_mutex);
 
 	vswap_si = si;
+
+	root = debugfs_create_dir("vswap", NULL);
+	debugfs_create_file("used", 0444, root, NULL, &vswap_used_fops);
+	debugfs_create_file("alloc_reject", 0444, root, NULL,
+			    &vswap_alloc_reject_fops);
+
 	pr_info("vswap: created virtual swap device (%lu pages)\n", maxpages);
 
 	/* Last: everything above must be visible before routing starts. */
-- 
2.53.0-Meta

