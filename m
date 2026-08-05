Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6009042FCDC
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 11:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927829; cv=none; b=h4hYWCCGUMpaTzfVfShth8rwsaJFINR6h8r+mN2O5w+97hK4yTFLRwFUIjUybwYn2oCTQVRT+aoyhsnMl+4ukbHTH/AbjwkSbzWa9IIlCJ5Z2JXK+AMldoupnNXynY/xPakNBdwDrstDQVb36KU/WO0d/DwZDVHHm8LFegedJPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927829; c=relaxed/simple;
	bh=QZ6lKvnhbVeHlU6U3SVBxx8dvMrA3U0MLhqi1maPH58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dsRv0uWGEWorO20iAVYNv8ytsf2J0+wDjYHGQastREAJ/J8p15BWwzeUlJg/0bvLcUPJ2QkK0XBELrG0QBGeOZ76T3y1/4Efy9aEvHmEof9s3BPkNBkxqW5CnszaGzNOn8VvpX/vUY9rzbVPwz9Qogkqe6vIEeSqe/PMkF3olKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kL+KaXLl; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kL+KaXLl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785927815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R4TrMHTQkzwP2lLEW0oUQVcx04oxAW8/FB2AgqPWE68=;
	b=kL+KaXLlSRmxOZd41Q1d8l4/jqKr/ZYm47f8yzGu5BEqF2e7C/vKuZMbvHXlQuuRSPGY2M
	J1zxCBSaVEnGrZC13ujg9FxHZbJq54bTXDPFHy9chloV7JQhfuX3/rvWWiKpxzJr7tXl1y
	JzAC1N9VfGWtT+BtcVWNy9B6T7mYDaM=
From: Hongfu Li <hongfu.li@linux.dev>
To: akpm@linux-foundation.org,
	david@kernel.org,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hongfu.li@linux.dev,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: [PATCH] ksm: update comments and docs to reference folio->mapping
Date: Wed,  5 Aug 2026 18:59:07 +0800
Message-ID: <20260805105927.41987-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hongfu Li <lihongfu@kylinos.cn>

The KSM code already stores and checks the stable node key via
folio->mapping, but the comment in ksm_get_folio() and the reverse
mapping documentation in ksm.rst still refer to page->mapping.

This is a pure wording update to match the folio-based implementation.
No functional change is intended.

Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
---
 Documentation/mm/ksm.rst                    | 4 ++--
 Documentation/translations/zh_CN/mm/ksm.rst | 4 ++--
 mm/ksm.c                                    | 7 +++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
index 2806e3e4a10e..2b4f72f1f953 100644
--- a/Documentation/mm/ksm.rst
+++ b/Documentation/mm/ksm.rst
@@ -24,13 +24,13 @@ tree.
 
 If a KSM page is shared between less than ``max_page_sharing`` VMAs,
 the node of the stable tree that represents such KSM page points to a
-list of struct ksm_rmap_item and the ``page->mapping`` of the
+list of struct ksm_rmap_item and the ``folio->mapping`` of the
 KSM page points to the stable tree node.
 
 When the sharing passes this threshold, KSM adds a second dimension to
 the stable tree. The tree node becomes a "chain" that links one or
 more "dups". Each "dup" keeps reverse mapping information for a KSM
-page with ``page->mapping`` pointing to that "dup".
+page with ``folio->mapping`` pointing to that "dup".
 
 Every "chain" and all "dups" linked into a "chain" enforce the
 invariant that they represent the same write protected memory content,
diff --git a/Documentation/translations/zh_CN/mm/ksm.rst b/Documentation/translations/zh_CN/mm/ksm.rst
index f0f458753d0c..822c7a289671 100644
--- a/Documentation/translations/zh_CN/mm/ksm.rst
+++ b/Documentation/translations/zh_CN/mm/ksm.rst
@@ -31,10 +31,10 @@ KSM维护着稳定树中的KSM页的逆映射信息。
 
 当KSM页面的共享数小于 ``max_page_sharing`` 的虚拟内存区域(VMAs)时，则代表了
 KSM页的稳定树其中的节点指向了一个ksm_rmap_item结构体类型的列表。同时，这个KSM页
-的 ``page->mapping`` 指向了该稳定树节点。
+的 ``folio->mapping`` 指向了该稳定树节点。
 
 如果共享数超过了阈值，KSM将给稳定树添加第二个维度。稳定树就变成链接一个或多
-个稳定树"副本"的"链"。每个副本都保留KSM页的逆映射信息，其中 ``page->mapping``
+个稳定树"副本"的"链"。每个副本都保留KSM页的逆映射信息，其中 ``folio->mapping``
 指向该"副本"。
 
 每个链以及链接到该链中的所有"副本"强制不变的是，它们代表了相同的写保护内存
diff --git a/mm/ksm.c b/mm/ksm.c
index ab1fc59424e8..4bde9fd8d44e 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -959,10 +959,9 @@ enum ksm_get_folio_flags {
  * seconds or even minutes: much too unresponsive.  So instead we use a
  * "keyhole reference": access to the ksm page from the stable node peeps
  * out through its keyhole to see if that page still holds the right key,
- * pointing back to this stable node.  This relies on freeing a PageAnon
- * page to reset its page->mapping to NULL, and relies on no other use of
- * a page to put something that might look like our key in page->mapping.
- * is on its way to being freed; but it is an anomaly to bear in mind.
+ * pointing back to this stable node.  This relies on freeing an anon
+ * folio to reset its mapping to NULL, and relies on no other use of a
+ * folio to put something that might look like our key in its mapping.
  */
 static struct folio *ksm_get_folio(struct ksm_stable_node *stable_node,
 				 enum ksm_get_folio_flags flags)
-- 
2.54.0

