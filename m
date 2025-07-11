Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E0226ACC
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 00:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752195250; cv=none; b=pp/mdirS4NxuSWUuOcP54ZJjEIfwuXjMe5f/kRqU5UM+I3J95N2K8pH6OmsGj9ebF+29wsljwoHH2EPzQOuLMOeilPDMlfewuU/04cZumc89x3t9M+qI4AUpahxiJlZAUd53Td/3jBdhBXYsKAkx5CNctIj2qyNPed9SZumvLjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752195250; c=relaxed/simple;
	bh=k1UeMauCXxsYjk7riRCt97R+eKDef0D7cRGeElJ7olM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWegQMYgQRuZt/lHxx/yy8KQjSButDFg5XMGNricTVqFmkJXA9ud+EUOnAhOtsKLbAU/BHZZKveU3ApivfMQFADKoROu1aU0VRKR0BydZKfhdNs4AzaSXX4mN71QWVkq1gq5ozOEL8OKJ8urTGT4yFp/cAaGodfTc1IZOmbE0v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r4KzGQV7; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r4KzGQV7"
Date: Thu, 10 Jul 2025 20:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752195234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BD12tr+LLYiYR7OTG7xOog1ys1NXTYaW1lkc9WXDyO8=;
	b=r4KzGQV7lsDCehWWSbFWG67lAJvedJha90ev1sbxLF5YzczhqOlVq3O+rjtX5M2zFdjr1E
	P+7WH5eZwXbnM91kTXmck1abLU7/U+PQm7xAVza9SFDeVPs7HQmoXP/GAbajx9GA81iM49
	QKbaDYPFVf60yIPa52U51/np+6LN2HM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Casey Chen <cachen@purestorage.com>
Cc: akpm@linux-foundation.org, surenb@google.com, corbet@lwn.net, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, vbabka@suse.cz, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, rientjes@google.com, 
	roman.gushchin@linux.dev, harry.yoo@oracle.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, yzhong@purestorage.com, 
	souravpanda@google.com, 00107082@163.com
Subject: Re: [PATCH v3] alloc_tag: add per-NUMA node stats
Message-ID: <fhy4rcjrwwmlebgoiwepmga3fovxdvqeylsub6lk3opl2fi2td@ucuwdpu4ua7r>
References: <20250711002322.1303421-1-cachen@purestorage.com>
 <CALCePG3a6wG+3Nu7-JHha+LMtyRRNF3sXp13sS-=Xv1pvsX09Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCePG3a6wG+3Nu7-JHha+LMtyRRNF3sXp13sS-=Xv1pvsX09Q@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jul 10, 2025 at 05:42:05PM -0700, Casey Chen wrote:
> Hi All,
> 
> Thanks for reviewing my previous patches. I am replying some comments
> in our previous discussion
> https://lore.kernel.org/all/CAJuCfpHhSUhxer-6MP3503w6520YLfgBTGp7Q9Qm9kgN4TNsfw@mail.gmail.com/T/#u
> 
> Most people care about the motivations and usages of this feature.
> Internally, we used to have systems having asymmetric memory to NUMA
> nodes. Node 0 uses a lot of memory but node 1 is pretty empty.
> Requests to allocate memory on node 0 always fail. With this patch, we
> can find the imbalance and optimize the memory usage. Also, David
> Rientjes and Sourav Panda provide their scenarios in which this patch
> would be very useful. It is easy to turn on an off so I think it is
> nice to have, enabling more scenarios in the future.
> 
> Andrew / Kent,
> * I agree with Kent on using for_each_possible_cpu rather than
> for_each_online_cpu, considering CPU online/offline.
> * When failing to allocate counters for in-kernel alloc_tag, panic()
> is better than WARN(), eventually the kernel would panic at invalid
> memory access.
> * percpu stats would bloat data structures quite a bit.
> 
> David Wang,
> I don't really understand what is 'granularity of calling sites'. If
> NUMA imbalance is found, the calling site could request memory
> allocation from different nodes. Other factors can affect NUMA
> balance, those information can be implemented in a different patch.

Let's get this functionality in.

We've already got userspace parsing and consuming /proc/allocinfo, so we
just need to do it without changing that format.
