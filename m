Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4693E4C97;
	Fri,  8 May 2026 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271717; cv=none; b=eDESe2wEUjuU6bHM6TJWV5TwJRfWGkYktlBCRwJTG9TgpLAeAV0CFahDeroOkGA58sd74K3swBrlfyErVpg0a9ruexNuzluxBAMgSvTHtCSLdfOUcZsyyt3mW+vYYYcktUvFJwdMjGZIhb8ChWfPK/pGXoLilWWhAiFkLT7bk8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271717; c=relaxed/simple;
	bh=WPGvh3XsqcwEbxeBcx+6QdnRnslVQEHJsQZ56FIeZGs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=nzXjbh6U1JDUUuTj43Eawl9NsETGJIBB7+FwALfqu1lpKHFIJJKC7wjjdAvgY0E4DDP0Jbdr4ZDZ2+JLPHRDpD0iEkyjUJ9ASkizxdRluNVFY9C+kl5kW9mxp120pFuz026ob8l8PazIZjRYcjOhw2qSyUKmjdKCTukOW3LK0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=wungASmC; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="wungASmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778271707; bh=MErEmjiki8eLR7tKMnzhamgQ5TwvhrTV3RrgO75bht8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wungASmCtf/9Pgfd3Ux0SBGkA+uGlQCAEdyZqke1KOnZVE0Yki8iJ271TNwSab558
	 oZAnVXVNosanf6XQCZlzGDZR8P5cOUSxmM/qZRuoc6hj/5wHVQTcnrr/kfmdgHZOcy
	 pi1M6kG+znHEM+LArlEIvDqNlDbbgnylUeleIt8s=
Received: from node68.. ([166.111.236.25])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 52124024; Sat, 09 May 2026 04:20:33 +0800
X-QQ-mid: xmsmtpt1778271635tke1hdcuy
Message-ID: <tencent_2B796C8FACDD905B3470C93D072BC2CF2B0A@qq.com>
X-QQ-XMAILINFO: Nwte6vbuj0Eq+xflc0glVhK11CErug6dGLe8F71ZYm74Myk/sg596Jj4bJ5QwL
	 Xk0KOfEkVY4f+Ab3EaMi/ET48FUl9wmDKfhx1wov3J+5pII5WnkIU4kEKsRstbH696zW7e3IbARA
	 ZRPNpqUGT10j36xKt6J88EKj6j9vpTNdbMtxaMmJ8Q6hncry+fz33iaQ7TrerYa7JdO0VuaeNcoL
	 PQTuaqdaM46epuKA7OiRiJ8Ui8RpMXE/rXr50RYIYIG/uCanWRTkA94HtBCyVLhfQTBDL9ME5gtf
	 4kP5dQ41FGEUkvE+UABBagk9nV6K4XVzRVh/TMLyQnNH2IYLU0Zu76aCR1froDCoig6KzhKZhHjA
	 wEblB9hS9fxvzSJ+VdvJZ65hk+/J3QmD1SLhKfReWd5k1/p7R1Zf3uVsvGI4UX8Hjzt/fKDLFUrh
	 KmFAZVf7TIun2O1eGTkI28lgilqvN+wB0JINKhPlKCcdm83bPWZ/r4UuUKeMeiJAAExKnOwte03N
	 XYPLlKPeaqEYVbXS5RH6rX0gromLrzUVyOVCTMUXR3So+7z1nja6jZ7sRgnwz7oe2CW5ehSTYuN4
	 RRKYp2qg5xQB2/b9C51wE+0t4Ez148iStBWw2jTyDrs58/MyRBzt134Rb6CaSzNucayK4bJn2sKc
	 KctXN6TbwcYY4k9UJ2TJDK5+cfb1a6V4GHl2J3mJU0lBxDH0Ww+fhNsg8xwE86JjGzicRuY+a04C
	 gMGV0c/sYLGmMQ9/62ZhCIGyeEHejbeWvCz0/D7QY2EW4ypiYbzjYnuL+Zq+StXMIPrSOILz/wXs
	 yMI1AHJgS50gnen0/z873KWQ6CX6+OOk08LrsMS5OcWiCN5MbK6dCVVZd2nX6kPQDLbFFynyXq9H
	 00BrsIlEQYaj9qr8XoZu2b5wK6HqkN8d03m+4jmkrvm5yPjSF79+W/3duSTTOTvVi858PpRnzEX2
	 aTJUAIEx2k4pr/gLQMQz3K4zKL7kn+U8IlIwYAmjoHWf8uMwFDmw+IrDLf4lYGSUsebwb3Topt0h
	 HWy3ImDYhOVIwUKLEMVz2MlYuq+bhl/DGt9evqeDSlljxebdh6
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
Subject: [RFC PATCH 2/5] mm: zswap: add a zswap entry batch helper
Date: Fri,  8 May 2026 20:20:30 +0000
X-OQ-MSGID: <20260508202033.1834876-2-fujunjie1@qq.com>
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

Large folio swapin has to know whether a contiguous swap range is backed
consistently by zswap. A range that is partly in zswap and partly on
disk cannot be read by the existing whole-folio swap_read_folio()
backend selection.

Add zswap_entry_batch(), mirroring the existing zeromap batch query: it
returns how many entries starting at a swap entry share the same zswap
presence, and optionally reports the first entry's state. The
CONFIG_ZSWAP=n stub reports that the whole range is not in zswap.

Signed-off-by: fujunjie <fujunjie1@qq.com>
---
 include/linux/zswap.h |  9 +++++++++
 mm/zswap.c            | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/linux/zswap.h b/include/linux/zswap.h
index 30c193a1207e..b9d71f027200 100644
--- a/include/linux/zswap.h
+++ b/include/linux/zswap.h
@@ -27,6 +27,7 @@ struct zswap_lruvec_state {
 unsigned long zswap_total_pages(void);
 bool zswap_store(struct folio *folio);
 int zswap_load(struct folio *folio);
+int zswap_entry_batch(swp_entry_t swp, int max_nr, bool *is_zswap);
 void zswap_invalidate(swp_entry_t swp);
 int zswap_swapon(int type, unsigned long nr_pages);
 void zswap_swapoff(int type);
@@ -49,6 +50,14 @@ static inline int zswap_load(struct folio *folio)
 	return -ENOENT;
 }
 
+static inline int zswap_entry_batch(swp_entry_t swp, int max_nr,
+				    bool *is_zswap)
+{
+	if (is_zswap)
+		*is_zswap = false;
+	return max_nr;
+}
+
 static inline void zswap_invalidate(swp_entry_t swp) {}
 static inline int zswap_swapon(int type, unsigned long nr_pages)
 {
diff --git a/mm/zswap.c b/mm/zswap.c
index afe38dfc5a29..27c14b8edd15 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -234,6 +234,42 @@ static inline struct xarray *swap_zswap_tree(swp_entry_t swp)
 		>> ZSWAP_ADDRESS_SPACE_SHIFT];
 }
 
+/*
+ * Return the number of contiguous swap entries that share the same zswap
+ * presence as @swp. If @is_zswap is not NULL, return @swp's zswap status.
+ *
+ * Context: callers must keep the swap type alive. The result is a snapshot
+ * of zswap xarray presence; callers must tolerate races by rechecking under
+ * the lock that matters for their operation or by falling back safely.
+ */
+int zswap_entry_batch(swp_entry_t swp, int max_nr, bool *is_zswap)
+{
+	pgoff_t offset = swp_offset(swp);
+	bool first;
+	int i;
+
+	if (zswap_never_enabled()) {
+		if (is_zswap)
+			*is_zswap = false;
+		return max_nr;
+	}
+
+	first = !!xa_load(swap_zswap_tree(swp), offset);
+	if (is_zswap)
+		*is_zswap = first;
+
+	for (i = 1; i < max_nr; i++) {
+		swp_entry_t entry = swp_entry(swp_type(swp), offset + i);
+		bool present;
+
+		present = !!xa_load(swap_zswap_tree(entry), offset + i);
+		if (present != first)
+			return i;
+	}
+
+	return max_nr;
+}
+
 #define zswap_pool_debug(msg, p)			\
 	pr_debug("%s pool %s\n", msg, (p)->tfm_name)
 
-- 
2.34.1

