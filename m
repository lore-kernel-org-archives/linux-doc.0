Received: from mta1.migadu.com (out-48.mta1.migadu.com [95.215.58.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590826296
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 04:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941691; cv=none; b=ktMF0bKA5NXwyHNU7DjZI6+PmhLqcL2w8MCCb6yE5pgPmwtT5cnL7q5KUOunV9Kf7eIGWdZCQ3mgJonmsa83JHNAY5AjFuKKkmrQHsNZB9WEyEjiEeEGc1Ti9GYf+cJTjhoTQWGA4LsdvgAX+h8SnDNurpydhbtDGEk8Y/LTrGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941691; c=relaxed/simple;
	bh=pGSo1Cfu6sLAcXoqpPoreSz60pwDzvhB8EVdtBx16UE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyHlFUr81p2xKjNzfWuIRq+ZTEJqOoVtAkCnWQTOpJt5A0kMcn6SiNMg4YBra/L6Vnew9W3VbtKuz8PQCzZsci5vHye/ZSuANdTJ45pZj/s4jzinZk0BO1U7i+viENoGk6lIC1YRGXx4EYlKYOYlTrZlMbqajsWDAavcsrvOor8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AnoyqEqH; arc=none smtp.client-ip=95.215.58.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AnoyqEqH"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pGSo1Cfu6sLAcXoqpPoreSz60pwDzvhB8EVdtBx16UE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786941686; v=1; x=1787546486;
 b=AnoyqEqHofWVEm2rFglZDqDkqc+0a+UFU6FSJW3k94xbfoK9HbFjis8PFbiBRwSHeH1D4e7J
 IywKwp+mBHZcQ5U3+QHKVJYvsiSKAs3j5HDxc8NEqUUSqrdtMWMz54cpq4Wh878oLAjPfl+rPha
 WuwN5sCaweeSPjmw9DQnnEHA=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (2602:fce1:44f:115e::)
	by smtp.migadu.com with ESMTPS id 2dcc283464ad7e50;
	Mon, 17 Aug 2026 04:41:26 +0000
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: nico.pache@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v4 7/7] mm: Documentation: clarify where the mTHP stats live
Date: Mon, 17 Aug 2026 12:41:18 +0800
Message-Id: <20260817044118.86344-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-7-ddac39d61c4a@linux.dev>
References: <20260811-khugepaged_pte_refactor-v4-7-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Aug 11, 2026 at 06:48:39AM -0600, Nico Pache (Red Hat) wrote:
>The note about khugepaged counters references /proc/vmstat for the PMD
>case, but never mentions where the mTHPs stats can be found
>(i.e.: /sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/stats/)
>Add a small addition to this section for clarity.
>
>Also fix a missing period while we are at it.
>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
