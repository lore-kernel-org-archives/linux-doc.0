Received: from smtp233.sjtu.edu.cn (smtp233.sjtu.edu.cn [202.120.2.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8657145A05
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 11:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.120.2.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754912108; cv=none; b=PU0Xw7B4ZTNgyGFtP1hHy67EpqiVyKwv+7i9wAflOsFcx+AEOcHoYokSxKddQsQvbV9sfAMdDDZA8do+rnbP8RpLc/mYkqKvFbnWY1gZVeNemxHrViBAZQ9oEvbulUZAbSQ06VqVKKiqWoDj8u30ceAo8nfe2AxWFNG/+kf/Zso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754912108; c=relaxed/simple;
	bh=Qg5XJNDXsXdbSOFQYOwuZbF330HUtOyd/NmRg5xc5f4=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=cqaOhTFL6DopIbNT/aWAWh04xdtg20bAPxR8sNsirtUTY08knZXVy2LclzYU4wo0KDo0k6ZG5YEiddSIJU2Fd5xnpg/11qfRZmdumlsP7xn3s4WdTiqE8UT6QK0Iz76vn4D3vRhqzQihdaDkoyxvzBms/jdO685qlV1D+XaLOZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sjtu.edu.cn; spf=pass smtp.mailfrom=sjtu.edu.cn; arc=none smtp.client-ip=202.120.2.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sjtu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sjtu.edu.cn
Received: from mta91.sjtu.edu.cn (unknown [10.118.0.91])
	by smtp233.sjtu.edu.cn (Postfix) with ESMTPS id 88AE5105BCF6B;
	Mon, 11 Aug 2025 19:25:02 +0800 (CST)
Received: from mstore139.sjtu.edu.cn (unknown [10.118.0.139])
	by mta91.sjtu.edu.cn (Postfix) with ESMTP id 671DC37C8FB;
	Mon, 11 Aug 2025 19:25:02 +0800 (CST)
Date: Mon, 11 Aug 2025 19:25:01 +0800 (CST)
From: "Shi, Jiacheng" <billsjc@sjtu.edu.cn>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Message-ID: <5771658.4213243.1754911501808.JavaMail.zimbra@sjtu.edu.cn>
Subject: [PATCH] docs: trace: fix an error in events-kmem.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 10.0.14_GA_4767 (ZimbraWebClient - SAF16.4 (Mac)/10.0.15_GA_4781)
Thread-Index: 9JL3ebDRgzNTEx1P7wNc+AGv2INt3w==
Thread-Topic: docs: trace: fix an error in events-kmem.rst

Commit 44042b449872 allows high-order pages to be stored on the per-CPU lists.
Update the documentation accordingly.

Signed-off-by: Jiacheng Shi <billsjc@sjtu.edu.cn>
---
 Documentation/trace/events-kmem.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/events-kmem.rst b/Documentation/trace/events-kmem.rst
index 68fa75247488..1796530e2ab5 100644
--- a/Documentation/trace/events-kmem.rst
+++ b/Documentation/trace/events-kmem.rst
@@ -78,9 +78,8 @@ contention on the lruvec->lru_lock.
   mm_page_alloc_zone_locked	page=%p pfn=%lu order=%u migratetype=%d cpu=%d percpu_refill=%d
   mm_page_pcpu_drain		page=%p pfn=%lu order=%d cpu=%d migratetype=%d
 
-In front of the page allocator is a per-cpu page allocator. It exists only
-for order-0 pages, reduces contention on the zone->lock and reduces the
-amount of writing on struct page.
+In front of the page allocator is a per-cpu page allocator. It reduces
+contention on the zone->lock and reduces the amount of writing on struct page.
 
 When a per-CPU list is empty or pages of the wrong type are allocated,
 the zone->lock will be taken once and the per-CPU list refilled. The event
-- 
2.25.1
