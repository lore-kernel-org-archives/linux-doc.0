Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBB33246E8
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 03:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766372842; cv=none; b=AjWnxM4D/AwAQUjQrsWjIYcImtMG7e4jMWcqda4Sg3NlHo98/UUge6zjv+BnNW85d5L7R38V/5bDegYPRdno+eDxfOhtp75n4jSHTi0Nd1t5oAZT8rwrW7+oAsvh9NLsWlTa7Bcfs0nKypMNg4JbJBwuXE+Js0nTF5C6d9FjTdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766372842; c=relaxed/simple;
	bh=7oRg9SqsvfNvLSoZHeT0OIFhWSGCvx9GVe7dZ8OWtc4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Uu4rw8/ysGurOnA0PMJveFTG48g9/UDgRdnqsHj3ugIQJYcGsQl4jOuHhTTjrbYmuTUOhiGeilyJD1KJfZ7pKeo/3uo6zgwnyVeFpYZ1XZDIinP/OALaW0RqyQSEqSkmRwDJapOjBp0YPyqUOLbnd1KawOBU3R6D/2A1BjAzMos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B15iFUZJ; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B15iFUZJ"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766372832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aEE1jBzrmlvkQWClZ4+qffIDz+w5zNzcaWqsicnW3I4=;
	b=B15iFUZJWScExC482xi1XlEuT0OQj+0zKUqUR7tidCAJYKbqbpZoZY6J4yltMWcQ7ZJzzH
	WM6EELoGUVx1rtRrMdPVgeeiM8jtROLTmuLJ3U9Uh2jB1aetinKLYBlGe0H/2h5JJf/uqi
	tQY26FgPXjrIFNsFU1RHwPOnR6z4eDY=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.200.81.1.6\))
Subject: Re: [PATCHv2 05/14] mm: Move set/clear_compound_head() next to
 compound_head()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-6-kas@kernel.org>
Date: Mon, 22 Dec 2025 11:06:28 +0800
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
Message-Id: <16EC6E4A-5CC2-477D-9C33-524BDBB49228@linux.dev>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-6-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 18, 2025, at 23:09, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> Move set_compound_head() and clear_compound_head() to be adjacent to the
> compound_head() function in page-flags.h.
> 
> These functions encode and decode the same compound_info field, so
> keeping them together makes it easier to verify their logic is
> consistent, especially when the encoding changes.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

