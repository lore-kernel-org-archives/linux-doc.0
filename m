Received: from mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7E6275AFD
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 04:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941233; cv=none; b=XTcWAIr1YVhhCVa6WC7yaRDp1P74L+qmk2n9IBWx6lR4jXeD4C12GaR4sIQl2Qxes6TrSz6Lm3kdSwslvfurEzuIbyjVomVaDdYOPFIaL+TQKXglVKbyX79jeO91zAgvAnYrE0QRrGUP/6bpDFlD20fK/cpnilc5mhH2czzRqLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941233; c=relaxed/simple;
	bh=OVHf+C9hypheHTUg0T4L6jqA/swZQ/qniFqO2dkTgRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Loo2Omfl1sKMe9RLP9aYtYc4v7nMlHv1drCSZ5N3vo4CeIIU4adCZ14Y1QTP7JNHoX36Bkcy1MYjHJfPeeBrW7NCoGjGN7nf1OTCD8QL8a1eRZBmZnlKEFejXi5YHKxbjR0xmtINukiBDUJi/Bfb+yzyc6321VXhBhIh09+NlPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JBM1YnnA; arc=none smtp.client-ip=91.218.175.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JBM1YnnA"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OVHf+C9hypheHTUg0T4L6jqA/swZQ/qniFqO2dkTgRg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786941228; v=1; x=1787546028;
 b=JBM1YnnAfAjf03oekWZUucH7Rxj+1/vlipH+ruqz69v5YZ93YzWxDhmIT2pbrhXx9AYS80Nx
 fuZhY1OQwwknJJhGi8YHYQRNs0RDQPe0N/v6A0j+iZAeG/Km+mY8c8c1SslEqCjUxGG03LQ71+F
 nKvFe0IpsDpmtdrC9+okKZ4o=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (2602:fce1:44f:115e::)
	by smtp.migadu.com with ESMTPS id 5407dfe574b6016e;
	Mon, 17 Aug 2026 04:33:48 +0000
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
Subject: Re: [PATCH v4 1/7] mm/khugepaged: refactor per-scan state clearing into collapse_control_init_scan()
Date: Mon, 17 Aug 2026 12:33:36 +0800
Message-Id: <20260817043336.81695-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-1-ddac39d61c4a@linux.dev>
References: <20260811-khugepaged_pte_refactor-v4-1-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Aug 11, 2026 at 06:48:33AM -0600, Nico Pache (Red Hat) wrote:
>Extract the repeated clearing of node_load, alloc_nmask, and
>mthp_present_ptes into a helper to reduce duplication in
>collapse_scan_pmd() and collapse_scan_file(). Althought file scans do not
>current use the bitmap, they will in the future, and clearing it now is
>harmless.
>
>Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>Acked-by: Usama Arif <usama.arif@linux.dev>
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
>---

Nice cleanup!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
