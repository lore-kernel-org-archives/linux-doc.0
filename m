Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD6169AD2
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 06:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766385131; cv=none; b=UqBR4mBjUqRitCG7knZtGA+M7C1mPDkvVmuJVkrRnrMQ+OGlsdj7VbIDg9WELGYSxWgWU9RsGifsjnRSn8UpA6E1E6Lwz8B+av1bJ5CP9B6ATaUqtGEHp3+8rtGjsPMOH+7UJaCHSfIX7EOK9KT8Zd/NPaq4EK3KeAn82IuisRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766385131; c=relaxed/simple;
	bh=Rv92R8ZgKSQhD5Jxtk0mVwVcDU3IJri4b3KGrlpF5FA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=a96XN6gggFSHlypCVXGCEAqQH36/PyfeHIlv6tbDGiAVgV5qg4H4ZgizeqrVrO++6g/Xt2IdUVdUAehfSJ+LrErj69rjqSCXRNofkXxjIB5Zj9mMBLKNu9u5EW2S2fpoYnBnyhqU5Fr+WKTOROKuaStMNk8LGeTbFSjZeW0RXWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iu4ZcA1i; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iu4ZcA1i"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766385125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s6iPmwXAnw1MIWCXIq9iloY9ziGZIeahgVzOqeL0Kjg=;
	b=iu4ZcA1iAiPki2z1YLVNViP6Cn9KukP7/o5NwVLvj5FHWny5OWV6yoY+8ucbVUH0Bwea2P
	/c2OfBuzYkhGjx/u0kwMaigW+hlLLt0hwIOxRLse0k8Az0vcl5JOduVDHHPZ6XbtAvXfQE
	7PnuTIBKJB+YBgiVZYr8nDf4WjrsL5U=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCHv2 13/14] mm: Remove the branch from compound_head()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-14-kas@kernel.org>
Date: Mon, 22 Dec 2025 14:30:56 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
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
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <324C52CD-0E8C-412F-BA33-0F605C1B7AC3@linux.dev>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-14-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 18, 2025, at 23:09, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> The compound_head() function is a hot path. For example, the zap path
> calls it for every leaf page table entry.
> 
> Rewrite the helper function in a branchless manner to eliminate the risk
> of CPU branch misprediction.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

