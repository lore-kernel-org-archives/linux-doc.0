Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21683806DD;
	Mon,  6 Jul 2026 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357847; cv=none; b=bV0u/dJxUUpr1q1oVl7lijjXQx6ZSn13pTVYxJOCFV9TxNpvL/NdPhI+tR64qGZtinXp0qtuoRrz6IcGnXrxLUz33l1+sKaH5Egaj8gk2bAKju2VfrXLUBOQ5Wk1oNUdXxHKCX9DMJcZcQ9FmVwpZBstocKL5jUJzXNIFue8iCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357847; c=relaxed/simple;
	bh=lexlrdR5XCaYSzYYJR9iX5sgVi1vNb6A6aVID1RadSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNt0tyop97rja8iNN8/iglME/aLxxMiXHzXKJgGvSAQ/NNS8iXO4BisDWrzHKCQzn8Eott8q4S+EW/Xm34CUdmkznKN7EjRJX3AQF8avh8PxZ8AA4lgjOVyohu3nTnEf9BZIEEld48rKAo7hwCdKsJx10gpuMzDl/4H/4grSn3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jp/aWUSg; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jp/aWUSg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783357843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8B4kLd9O4yTubQHP6cxhqJtyGSLfRF2Xu8qr9txj38=;
	b=jp/aWUSgAz66O8jyAVernzctnnaGA5zaWiqwTWPjEwmghu3+EwHNEA3IgUk4FM+7ghh5o6
	QzLKKdUmDlvGk+bUmK1Xzn15aSRkeL23VIUUMGJ8RAc8U1StucG3/xf7C9lUHANhuAbfh5
	AEqtfZIE5Pf3iXapFCqOsIqg7RzHT7o=
From: Usama Arif <usama.arif@linux.dev>
To: Nico Pache <npache@redhat.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 3/8] mm/khugepaged: introduce a count_collapse_event() helper
Date: Mon,  6 Jul 2026 10:10:31 -0700
Message-ID: <20260706171032.3487318-1-usama.arif@linux.dev>
In-Reply-To: <20260706154500.39178-4-npache@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon,  6 Jul 2026 09:44:50 -0600 Nico Pache <npache@redhat.com> wrote:

> Provide a simple helper function to help reduce a often used, and
> duplicate pattern across the khugepaged code.
> 
> When collapsing to a PMD we need to record a vm_event and the mTHP_stat
> event. When doing mTHP collapse we only update the mTHP stat.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  mm/khugepaged.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 

Acked-by: Usama Arif <usama.arif@linux.dev>
 
