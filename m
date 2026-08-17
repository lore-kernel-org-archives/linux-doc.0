Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C626296
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 04:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786941648; cv=none; b=P7HM0XoEM06l7NdWWtUf2W9t+/Y4B2HCBkmFSXIyxLBZA0c2SlCHmA4ELFbJK+ts8MzvO1389U5PAr4BKNHjG7FuBWZ1xOFRK9FBvcL/bv3Hndva3k3/DdOAB9uWdvfnNfJKVKoQVXO1DrAwl1tuCl5ESkhNulvkbgzycL3Ol/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786941648; c=relaxed/simple;
	bh=Sig0AIK+CTyDREqz+/6gNORlYF2lEzPEEGGXx1ld/m4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Im3L46v8eVWyA3NItR7Nc5Xeg655ewM5eWY++30SqnQv1H0iPeR/RLMwpwxyX2ehs9gwz9mpgoTrO88YRNBT9hBbM+CA3ng1AYh7gIpM8XTTyYyrox8GmphFlZJZ/Mx5pasbLkyh7IsULPvfKQOsbIbMoDSVrr5Fh24Tw6MIvNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dMK9o+Jr; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dMK9o+Jr"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Sig0AIK+CTyDREqz+/6gNORlYF2lEzPEEGGXx1ld/m4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786941645; v=1; x=1787546445;
 b=dMK9o+JrgYkBBQFORz/x1H6fIOlz7GAJeyZcXqQZPE+mue6SBqtpD8+BXmpwfl4xU21c5WwF
 TOozHPmNRBzpBSUEh4mEViOPOurcnLpFH8EZvHgdJkjoR2+xiujETf7MB3K3CZDmOxNeFNf2peA
 0LWHLkElAWzOYaSxeAcuap20=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (2602:fce1:44f:115e::)
	by smtp.migadu.com with ESMTPS id 2bebd8705dd01731;
	Mon, 17 Aug 2026 04:40:45 +0000
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
Subject: Re: [PATCH v4 6/7] mm/khugepaged: unmap pte before releasing vma write lock
Date: Mon, 17 Aug 2026 12:40:34 +0800
Message-Id: <20260817044034.85870-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-6-ddac39d61c4a@linux.dev>
References: <20260811-khugepaged_pte_refactor-v4-6-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Aug 11, 2026 at 06:48:38AM -0600, Nico Pache (Red Hat) wrote:
>We are currently dropping the anon_vma write lock before unmapping the
>PTE. Although this is safe, due to us still holding the mmap_write_lock,
>its safer and less confusing to switch the order of these two operations.
>
>Suggested-by: David Hildenbrand <david@kernel.org>
>Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
