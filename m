Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DD22E2663;
	Fri, 26 Dec 2025 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766743631; cv=none; b=EMThQIhxynRSDn9x6QjH2YnMALMNi7FJ4vikquS+QxFcYKYUWP5DRFjRs6vwdOtzNu8aXRMREYOGZjVB7V78Qs4wgSNOS9txPZ7zeutMe/X07L4bNb+JzoM5psFsiyiI4gxHpD2mqHSs0MGzibtSRZ3PFT6XuaiDVmXWj2wsKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766743631; c=relaxed/simple;
	bh=4xvEdFpZvR3SKFkUK1wXHoUUb4W2Z7H1w64jltYA1nw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pqCgwtC89A207o+fjfgnIZROXsnCtFw6pAZjcCz+QC0DsLTCBu19mni003IBlL6m9VhCtyLdxwxO0PhKAPy8EB9CDIWW1BxUeiUl+vqVbqgW7sxSNuBcBCxsanDExoDqeNtWs/6zzeEiqlxouGPFhUZcXZXNExf42zBzTZlxqO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ImJTDvuJ; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ImJTDvuJ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uHCEbvNncUuRInD7vc2/gwTA6d8ybu6jRUaqdDQkZqk=;
	b=ImJTDvuJi1+ZtX5SRSl+cYjB+gjMZvdy7CfO6TcarAyj6li0iYNm59timP5kR2LiErVcKYSKU
	3rixA21pODZizTNSIRyouLGsgHeqXYwUeHFK+PfzDq4orVgC0fuIHvKFa5vt0oUBJ2xsD6MgTXf
	RFEXlONDUVzIeOzu/ZIaknQ=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dd1RH4shKzmVXB;
	Fri, 26 Dec 2025 18:03:55 +0800 (CST)
Received: from dggpemf500012.china.huawei.com (unknown [7.185.36.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 793D840563;
	Fri, 26 Dec 2025 18:07:04 +0800 (CST)
Received: from huawei.com (10.50.85.135) by dggpemf500012.china.huawei.com
 (7.185.36.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 26 Dec
 2025 18:07:03 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <corbet@lwn.net>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<Liam.Howlett@oracle.com>, <npache@redhat.com>, <ryan.roberts@arm.com>,
	<dev.jain@arm.com>, <baohua@kernel.org>, <lance.yang@linux.dev>,
	<vbabka@suse.cz>, <rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<willy@infradead.org>, <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lianux.mm@gmail.com>,
	<zhangqilong3@huawei.com>
Subject: [PATCH next v2 2/2] mm/huge_memory: Use per-VMA hugepage flag hints for exec THP COW
Date: Fri, 26 Dec 2025 18:03:37 +0800
Message-ID: <20251226100337.4171191-3-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251226100337.4171191-1-zhangqilong3@huawei.com>
References: <20251226100337.4171191-1-zhangqilong3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500012.china.huawei.com (7.185.36.8)

Using the per-VMA hugepage flag to avoid system wide default
behavior. If 'vma->vm_flags' indicates a preference for huge pages,
then the exec THP COW can be attempted.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
v2:
- Use 'vma->vm_flags' as hint for exec THP COW suggested by David

---
 mm/memory.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 691e3ca38cc6..eb2bb36e284c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6128,10 +6128,17 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
 		}
 	}
 
 	if (is_exec_mapping(vm_flags) &&
 	    is_cow_mapping(vm_flags)) {
+		/*
+		 * Reuse the per-VMA flag, only if VM_HUGEPAGE is
+		 * set, do exec THP COW.
+		 */
+		if (!(vm_flags & VM_HUGEPAGE))
+			goto split;
+
 		ret = do_huge_pmd_exec_cow(vmf);
 		if (!(ret & VM_FAULT_FALLBACK))
 			return ret;
 	}
 
-- 
2.43.0

