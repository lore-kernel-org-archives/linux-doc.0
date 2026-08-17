Received: from mta0.migadu.com (out-252.mta0.migadu.com [91.218.175.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5561A25B09E
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 04:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941326; cv=none; b=sT9+SutyeePTpGTdBEW4h3lnKEria6Vi3mYnhoz4U7FQ3BXid51H3RD25MP4tML1w2pwViP5mw4SAna2dhr/3KC97HDD/7L8tWsaIehgLfJzlNmtzVkROQ048oBLEmhg67P4dV34HF3q0P8WZUBtflDpyy7khPwB6v3Q9Sin3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941326; c=relaxed/simple;
	bh=TJFmveu5s3Kxu3Slqv/wqtGi7A6VRAXoQNbgiOZH5C0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RqW8pu/qnhco4lQGkSJwcW6dMn/w/TTLKHVhOlPOfBuUB+JvCVxI8lrMT6vALHxvWufosa40bReRXv2NFiP+2R0X57KufecpSRZUGsGLHb58g8mQXpzAoDwXDlJ2KaPmRoUWkAjX8E8pK4QT0WCU9WW2TRPJ8raAKaOR6V585jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kPcj1zQl; arc=none smtp.client-ip=91.218.175.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kPcj1zQl"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TJFmveu5s3Kxu3Slqv/wqtGi7A6VRAXoQNbgiOZH5C0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786941322; v=1; x=1787546122;
 b=kPcj1zQlJ20imsqxTrELkYLuRunB82ZBWtl+Idm6zk4DJ2yij5DiTvjh2kHdx6B8XCHpjeQ4
 jYuI4MkdfYO2Ug7FF2lhW2HdkcbyLJoaeFPFvzfVZHlJVJogAJtVO0vuwHRyRIZ7VGJ0nsYreiQ
 oA2Tez+NZNJzE4XZ7OaApTxw=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (2602:fce1:44f:115e::)
	by smtp.migadu.com with ESMTPS id ffd4f95ea8158cf4;
	Mon, 17 Aug 2026 04:35:22 +0000
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
Subject: Re: [PATCH v4 2/7] mm/khugepaged: extract reference check into folio_pte_referenced() helper
Date: Mon, 17 Aug 2026 12:35:14 +0800
Message-Id: <20260817043514.82725-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
References: <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Aug 11, 2026 at 06:48:34AM -0600, Nico Pache (Red Hat) wrote:
>This change deduplicates the "is this PTE/folio referenced enough to be
>considered for a collapse" condition that was repeated in both
>__collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
>a single inline helper function.
>
>Also move the comment and use it as the function header. While we are at
>it, updated the comment to clarify that a young pte is a recently accessed
>one.
>
>Acked-by: Usama Arif <usama.arif@linux.dev>
>Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
