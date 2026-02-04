Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D12BDC16
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 03:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770176443; cv=none; b=Ui9HmxZ0qVpXOiSv3z0KyutRgtXNSnJBJC+xot/GQYHu+wq7hHNXFFrTDf5MuNblqTtLwxYm/FTWpyD18sFEv2OrjdnT/MG6RT28GVeWFWZsx6filwlVzaHu/6tEWuSs2WLWPDWTxhmCCkqNn4pAcDpvRkaobN0JiYzNIBGCk6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770176443; c=relaxed/simple;
	bh=KfsmFp2tc0dqLNsUFulltmvFtwa/SLzHgGiJdDB8Mt0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EJ6FgbOMJtsCS4ej5b8dS4CPBa5jy/FZ16F7hsbEq3mLPKgdHLVE2NDRb6fbguiYscMaXWtuSZcFyxkDv8WECmwH7WeG9wawg8b7UdGqKsY0zl9ibcBU3D3LyLqZE8HNJDWldVM9/qUZhblGcqUc+o21jKkyo2VPIs1/RbZiT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=usqKfjbj; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="usqKfjbj"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770176430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Onih74rKhXQNkfzkcTR+Zq0Kg1PNfu8onD0zt1Z+qOs=;
	b=usqKfjbjQqGhGMX7b2myIEJwHkIgCA2hiWToeEcUL8WqIF6QvZMpKyiHrZTCEotjc/XuU5
	hrDYwyyf/mkZYKRDIdwxGzjQqypNpRQ2ezxi2dWRzE5gQ301xxUaeKxtXnz1t8CvaMPyEY
	CPkmIkZoqEon51/SAo3Y3y1+pjFyNM0=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv6 17/17] mm/slab: Use compound_head() in page_slab()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260202155634.650837-18-kas@kernel.org>
Date: Wed, 4 Feb 2026 11:39:42 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Message-Id: <69CF3AD0-F761-48FE-A7A9-20061ADA1A5C@linux.dev>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-18-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Feb 2, 2026, at 23:56, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> page_slab() contained an open-coded implementation of compound_head().
> 
> Replace the duplicated code with a direct call to compound_head().
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>

