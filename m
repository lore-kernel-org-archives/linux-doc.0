Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30C1FAF05
	for <linux-doc@vger.kernel.org>; Thu, 24 Oct 2024 17:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790786; cv=none; b=h2tuh6DXrZNs2AfySsjlg8RYlHvUCYHxdoChnowAF8recSjsCg/Vjy1R3Euks67a5rLAOy22KSEO5RMFUuzi0zvke2gyylqbggC/tyO5qn2OQbNNIp54Vhls6OicmWdYI/PiW0nY0k71J91S4XP1zb4Qnv3j76p3+xT8xnB4tqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790786; c=relaxed/simple;
	bh=mZy3gH8hiW0A+IkBao8g6kJ+dPCUrqLtDAb39XcdETw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEdPDdcsNfVcB73N6xmiXVv+TD3zM+nKfogChTXgK3Z0m0TvbolKPuupL7F5YD396eGF918IGMnNlv2cOuqa8CzOk+gef/6+cxRq5Cp2OjHOfKRfyqQWkqZWg+DOWYxe7rYXrbyUmQjWQvEvdeJeSj/aCzVI/A/jXD0XFXW3iCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pCmhJlLo; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pCmhJlLo"
Date: Thu, 24 Oct 2024 10:26:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729790780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8R1hlFXC1iEAhNiTAY04zaD5qomPk8wLiMSHdfUvjQA=;
	b=pCmhJlLo+awlJ1B+3t7IW8LaVA2tC/Qps/pAgSG+bCpusILq+Ruj7SJ7JKPnGAqKrv5PS+
	59E6MzrcspYqHjiGVg8MNQzKvH6jXBn5h4scJe0DSYcr0dPkbgO96SYo2O7IR0U5Bl9L5J
	BY8u54XjMBQQspmHOK1gwT1Tm9bKv8Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [RFC PATCH 3/3] memcg-v1: remove memcg move locking code
Message-ID: <7w4xusjyyobyvacm6ogc3q2l26r2vema5rxlb5oqlhs4hpqiu3@dfbde5arh3rg>
References: <20241024065712.1274481-1-shakeel.butt@linux.dev>
 <20241024065712.1274481-4-shakeel.butt@linux.dev>
 <Zxp63b9WlI4sTwWk@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxp63b9WlI4sTwWk@google.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Oct 24, 2024 at 04:50:37PM GMT, Roman Gushchin wrote:
> On Wed, Oct 23, 2024 at 11:57:12PM -0700, Shakeel Butt wrote:
> > The memcg v1's charge move feature has been deprecated. There is no need
> > to have any locking or protection against the moving charge. Let's
> > proceed to remove all the locking code related to charge moving.
> > 
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> 
> Reviewed-by: Roman Gushchin <roman.gushchin@linux.dev>

Thanks Roman for the review. Based on Michal's question, I am planning
to keep the RCU locking in the next version of this patch and folowup
with clear understanding where we really need RCU and where we don't.
