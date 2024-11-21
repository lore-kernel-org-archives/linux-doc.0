Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CC9230985
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 00:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732148012; cv=none; b=EkuDe+wOV0nvULIDNflYKT3+50+A2ZgTf6Pf0UTs/L9ymbgOFYJJS16HyVqTREGQ0NeGTcW52zNBZDyJCEs/n2RQbvzXCH9wEQY8jGiqwDWWm8kJYZC+VqWH1g0A7ZouPp/w7/8Wjzf9LWyxspKAKN95AUJPdd9RPfiRfdyzWUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732148012; c=relaxed/simple;
	bh=hWEv0KIFJwicM6LeJgD+7z0rb3G+LNEhTqzZnzoa5vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgZWtbLswI08liFOSgsvb3cF0oXIFCw/AxBIndxIAKVZFDXS8RsiHUKdNi37K/smCPfNRwA6IpAnJ/2L/xt+Pc1GMvLATeViC4xDzMjsgtA6wTJyk23jVRUr2hPbuP9BTecomXQBbYDCVRizYoT+OXQf9iOVR5TSe2/qiLXd7Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rSRMelt/; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rSRMelt/"
Date: Wed, 20 Nov 2024 16:13:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732148008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D+3yoI3Tk1l4Ls0opWZrCxxqVyBTDwb3hEjQXTZi1zU=;
	b=rSRMelt/5Wn4N8XUn/dJZwUqVAEVa288uiM3gPK/8TPDcTZGy3PYHUxZyME8j04Foq2WZq
	7Ns7G4yqbANrlkjIJXEn8FDvnOyR5MnLQwycCi5jsPgCqb3kJensaFaAbJdjiX8j6EGsVw
	k/4/oyWWpXvO3vGTe0gV0kRSdGNOT5M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, oleg@redhat.com, 
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, 
	hdanton@sina.com, hughd@google.com, minchan@google.com, jannh@google.com, 
	souravpanda@google.com, pasha.tatashin@soleen.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Subject: Re: [PATCH v4 3/5] mm: mark vma as detached until it's added into
 vma tree
Message-ID: <nja2grmyl5ezj33iygy6vexbkh4jdnwht4i4hhkawi7is5oexj@763smex2d76l>
References: <20241120000826.335387-1-surenb@google.com>
 <20241120000826.335387-4-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120000826.335387-4-surenb@google.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Nov 19, 2024 at 04:08:24PM -0800, Suren Baghdasaryan wrote:
> Current implementation does not set detached flag when a VMA is first
> allocated. This does not represent the real state of the VMA, which is
> detached until it is added into mm's VMA tree. Fix this by marking new
> VMAs as detached and resetting detached flag only after VMA is added
> into a tree.
> Introduce vma_mark_attached() to make the API more readable and to
> simplify possible future cleanup when vma->vm_mm might be used to
> indicate detached vma and vma_mark_attached() will need an additional
> mm parameter.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
