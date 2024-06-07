Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD634194087
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763050; cv=none; b=UslnykOtv3/ppTQTI9HN4tr8eWifxfGmUvzEA5LssVxLEv17hDw5anunS9sKsU1eAu6s8jRVrIuujrk1gageFfAuUv8ztP3xBhOTvRI1k3uiwS/Fv7uYRIN/xGDxK32hsAUmPWVSx2FfbG95uzLjVpJBgTB0nch/3mZe2gwfH0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763050; c=relaxed/simple;
	bh=kZIr6xLD60e+MbBbyqcbjS2T4bx3h666V+8zvgQT53s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mk9dxZF6Rlv0kG5jtYIpkVI+ipVqrFkXq7m5LA73M/FQbpOZuNmlNGaTmVU5iCNEjolo4LGZ5WeXU1pFErE/OxWsPjJ1R2Po8xgDK4Oh+TN1wb7KfK/YFnHXk+brAD989XcxWzLSqBv+ZmsxIOixP2nsfoxuTOU70klNHluVfvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TxGBNwQ0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TxGBNwQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717763047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AVo7IPc/OzMgdNcQVcdkp4iZHfQkhLNpmKtGDFarvnM=;
	b=TxGBNwQ0nJgwdIPWGbQrjLbeQQzhnRKTI73QCdB6O9AfIb/UTgjAYQjPjpj09InWCXs+xT
	ng4Zw1jI8jbt/gwkKsDM1Hf3prRz7GYbo9trUVwIICvlLenRcqP7dkDiMieJaP8zUOw5/i
	d5mg6eG21tafaWFaawVo0hPKbX8S90U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-461-8Lw9Jl3kOiKOKhr_XOiSIg-1; Fri,
 07 Jun 2024 08:24:03 -0400
X-MC-Unique: 8Lw9Jl3kOiKOKhr_XOiSIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 322EA3C025AC;
	Fri,  7 Jun 2024 12:24:03 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.192.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 569D9492BCE;
	Fri,  7 Jun 2024 12:24:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v1 1/6] fs/proc/task_mmu: indicate PM_FILE for PMD-mapped file THP
Date: Fri,  7 Jun 2024 14:23:52 +0200
Message-ID: <20240607122357.115423-2-david@redhat.com>
In-Reply-To: <20240607122357.115423-1-david@redhat.com>
References: <20240607122357.115423-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Looks like we never taught pagemap_pmd_range() about the existence of
PMD-mapped file THPs. Seems to date back to the times when we first added
support for non-anon THPs in the form of shmem THP.

Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/proc/task_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 5aceb3db7565e..08465b904ced5 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1522,6 +1522,8 @@ static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		}
 #endif
 
+		if (page && !PageAnon(page))
+			flags |= PM_FILE;
 		if (page && !migration && page_mapcount(page) == 1)
 			flags |= PM_MMAP_EXCLUSIVE;
 
-- 
2.45.2

