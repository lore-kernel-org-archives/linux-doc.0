Received: from mta0.migadu.com (out-23.mta0.migadu.com [91.218.175.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC87D30C165
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 04:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941434; cv=none; b=qTo9iiSao/wsont9p322WQSAied2uupeqruzt2jZmQ/JhPvt4Jjq482eD6RRh6bQ8qGp4L8n/X9hK8nRStuIqFi/c/1OjM4cKfarDCeiUyKXaEFYpLdUZ7h53fuDdSXAXF6aEGUONTFbV/hAJy5FBadS/aHg9WEuWHb7ymvdkuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941434; c=relaxed/simple;
	bh=SQVZWc2/JWe5tCn5l2jWkSOLcNsDOsT2p2+BDwA76P8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MrMb8oc3Ju/F9ysZexgdx9l/zUgH8o6VzNfms48os7RZDAJDLA10F9o3+UIiTsRLnWLRpUu5dHo62KL3sHyH1wYuAvVFETv6GkwFkGwucXJOc7VttoxZKVPi8TrJmDKpOuSSRCtugNXA2G6GNl0OdKgFVvf8+ZWit9NQ5VopbWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xjVPH4Lj; arc=none smtp.client-ip=91.218.175.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xjVPH4Lj"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SQVZWc2/JWe5tCn5l2jWkSOLcNsDOsT2p2+BDwA76P8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786941431; v=1; x=1787546231;
 b=xjVPH4Ljx0DhHL1JdnPcS3HA6/PlqH53MN4jR0TlowyXZ91TKY9rQWpT0xV/ZEOVnv+1SyKh
 rxOQuf1ySYaJw7FS7695N1FiN811fk5CNp9bCUYlivnUdcDGaxJGIgYEajbhEr/lJG/NyCr3v5s
 OuWdN6rmaj4NZxLLajcXmu70=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (2602:fce1:44f:115e::)
	by smtp.migadu.com with ESMTPS id 988b58362ce64e26;
	Mon, 17 Aug 2026 04:37:10 +0000
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
Subject: Re: [PATCH v4 3/7] mm/khugepaged: introduce a count_collapse_event() helper
Date: Mon, 17 Aug 2026 12:37:02 +0800
Message-Id: <20260817043702.83778-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-3-ddac39d61c4a@linux.dev>
References: <20260811-khugepaged_pte_refactor-v4-3-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Aug 11, 2026 at 06:48:35AM -0600, Nico Pache (Red Hat) wrote:
>Provide a simple helper function to help reduce a often used, and
>duplicate pattern across the khugepaged code.
>
>When collapsing to a PMD we need to record a vm_event and the mTHP_stat
>event. When doing mTHP collapse we only update the mTHP stat.
>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Acked-by: Usama Arif <usama.arif@linux.dev>
>Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
