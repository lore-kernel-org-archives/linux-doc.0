Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2734AB00;
	Fri,  8 May 2026 20:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271647; cv=none; b=GqFcscSLpZ8szIYB2wjz0ctoj8SuLo46T/r9D4hYPbm4CuBMVBoMlj84kODW5NsHkwFtVM0OA0FbucbQDiGaTKMUboj2WI/8IPmm5iawvkzmSC8gZnVscDuUidyESMuoGBNBSPaS0p4azyc8LVyTed6ztLI/oieDPnCjB4AFhrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271647; c=relaxed/simple;
	bh=7pzV74Xy1YMgSDaLbLTCZ/JeQlPopGqRG0xCubRXDXw=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=O9VzH1E+te14ccq2kO4nBrGrOdqLEscTpMEx1PZSyA9BZDOzbUKOJJI+qHaG/kpipgm7wA6JJz+VulptYxyH+mBc7nyjhOiAOhRrUal6rI0+DUCdAb9H2CBYGdNL0g6E8E/55S8Zz25NBka9o4iOJuLSASBAFWIjr4EbHvnXhs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dvyJWb0O; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dvyJWb0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778271637; bh=hWqx1blSQdp6dgm46Btp3ftogbY10gYMKeBKkQWtkfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dvyJWb0OGSTjSU4EJhFhbNSrBz2Bv2eoi6YPznBYGZe/H8Txc+jwnqtfErWpfIls9
	 mqYysEDTIi9tghh+NoklI0KwGfAWeohhxalnDg501Td6DhzlrQnTMib5uyy95I7+d2
	 1IQkfYkOXrV098uJK0BFURJP0DVsR870Ieerzsds=
Received: from node68.. ([166.111.236.25])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 52124024; Sat, 09 May 2026 04:20:33 +0800
X-QQ-mid: xmsmtpt1778271633t2lmi0qjr
Message-ID: <tencent_A63328EECD6F78288F70DD8C5A2070593D0A@qq.com>
X-QQ-XMAILINFO: MhK4DKsBP06iWD5gycqxXUMJVpmboO9b7h3t7pVFSfFwEPA48/rNusLwO0eAWi
	 k7sjJptT5r94bC1JGJTTnQmm5eOGSSuE2J/VoMyUkP7jcu2FpemRQaPCfFEAp2KhJeYXQms9BySm
	 ovw48LEXWVXMpIakykHkqM0QASmYbJP+EDRkjpNr/iEbBINAZ/s5I/ReXguOkB5EYtmxX++O/yOn
	 EzxIRvqQmpzuB4kOSc6uUz2texAuYCJd4r2C2+dARfcBKB6LkyGwxHZ35tmpHOasGvJGFBqS8o+B
	 a2Dali0UPmXv9mWJI3zKycQCtpsHDEpCZiEw87Gs715CGnI1JC3LAOlclKDxzyOkct92j0VhFUQm
	 ypvmeHB8QcupvY/V1e3+pR20KRlCFT7+7oKtRuh+pcQShv8Pc6jHTiX9xaNHlFQEhvLz7jqvjH6l
	 WlvD3QUX5Rd6K6B7R8BGjGRINo1Lf2GHOBZHXZipSPMxD0QZBSWrGLBHon6ZHfjL6zDncfo1ooIn
	 YG5PgavlMxuftw+NmgOehI41+zZyUQ+g1VHr5FoLo+GNQmNYokj3KQKSKQWCaha5JU/OYc/JMJur
	 v2nGP1lTM+zNtRBe+/lmKDi4lsqLW/CIB+1y87kfICi/D8rSKhspt6a34R+Ygc4au295uEXmn4nn
	 Yk+Km3Z9y0rGr7T7lwWXBsiE28nay69jcWQEIpFJePkhGGIh2T6yjN3bDwwfMj0YO2mmYY9wqNpH
	 2qToW6SQbfCiCz/Sf7VqqTQFEPd1H03pKuF/eCrzp8XAixiJ1zQfzFHHm+XTEC857Ljxv/7UfsoH
	 tAUQCg6P5PxlIVkhDRwaHLN1lMrQHNlfpjNaPYL8Y6OqgIQiYszzUHDLdB4HW5IjI4ji2qPRgyRu
	 sJUxfFElIfZ9hYSi1udadCQfwvvcpwUvoFLZvVWfivYnvL74st1G3qPuSOkaGBT3/EHCoQp5nOxh
	 629zGiBlH5K0TcxmFztsUGgZojjwu0defQirckaTdFGCNRGXwPnbM54K1GEZbfyI6s3jg7Woxffj
	 gyPRYVn0f1oWxvdfnG8BjY2lzZ/YOBtHZPCg3uqg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: fujunjie <fujunjie1@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Baoquan He <bhe@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: [RFC PATCH 1/5] mm: zswap: decompress into a folio subpage
Date: Fri,  8 May 2026 20:20:29 +0000
X-OQ-MSGID: <20260508202033.1834876-1-fujunjie1@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zswap_decompress() always writes to offset 0 of the target folio. That
is sufficient while zswap only loads order-0 folios, but large folio
swapin needs to fill each base page from its own zswap entry.

Pass the base-page index to zswap_decompress() and use it for the kmap
and scatterlist output offsets. Existing callers pass index 0, so this
is a preparatory change with no intended behavior change.

Signed-off-by: fujunjie <fujunjie1@qq.com>
---
 mm/zswap.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 4b5149173b0e..afe38dfc5a29 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -921,12 +921,14 @@ static bool zswap_compress(struct page *page, struct zswap_entry *entry,
 	return comp_ret == 0 && alloc_ret == 0;
 }
 
-static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
+static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio,
+			     unsigned long index)
 {
 	struct zswap_pool *pool = entry->pool;
 	struct scatterlist input[2]; /* zsmalloc returns an SG list 1-2 entries */
 	struct scatterlist output;
 	struct crypto_acomp_ctx *acomp_ctx;
+	size_t offset = index * PAGE_SIZE;
 	int ret = 0, dlen;
 
 	acomp_ctx = raw_cpu_ptr(pool->acomp_ctx);
@@ -939,14 +941,14 @@ static bool zswap_decompress(struct zswap_entry *entry, struct folio *folio)
 
 		WARN_ON_ONCE(input->length != PAGE_SIZE);
 
-		dst = kmap_local_folio(folio, 0);
+		dst = kmap_local_folio(folio, offset);
 		memcpy_from_sglist(dst, input, 0, PAGE_SIZE);
 		dlen = PAGE_SIZE;
 		kunmap_local(dst);
 		flush_dcache_folio(folio);
 	} else {
 		sg_init_table(&output, 1);
-		sg_set_folio(&output, folio, PAGE_SIZE, 0);
+		sg_set_folio(&output, folio, PAGE_SIZE, offset);
 		acomp_request_set_params(acomp_ctx->req, input, &output,
 					 entry->length, PAGE_SIZE);
 		ret = crypto_acomp_decompress(acomp_ctx->req);
@@ -1034,7 +1036,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
 		goto out;
 	}
 
-	if (!zswap_decompress(entry, folio)) {
+	if (!zswap_decompress(entry, folio, 0)) {
 		ret = -EIO;
 		goto out;
 	}
@@ -1611,7 +1613,7 @@ int zswap_load(struct folio *folio)
 	if (!entry)
 		return -ENOENT;
 
-	if (!zswap_decompress(entry, folio)) {
+	if (!zswap_decompress(entry, folio, 0)) {
 		folio_unlock(folio);
 		return -EIO;
 	}
-- 
2.34.1

