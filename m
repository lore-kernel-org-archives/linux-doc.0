Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6D013C8EA
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 03:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752203390; cv=none; b=BMUEnDhLgxooH7vs6puvdrXJ8mx9fHxiWSkCpidlN6lXAy3SxbPmMvQB75d+P5vkXXfca6RWfJFt/o26RnTYvLcyOCTTsr/EKtErmsKCzwnlpi2OMa//pmETPFHUJaC45UBQtaekh6c6TYrKfgsGk+kQvSwbL+90oMXulvJF1fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752203390; c=relaxed/simple;
	bh=OdUFrMVeki+Bt7+QFfSrM1vO4k4ljr9kCeHcNJtcqeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/GXAR3y8hbswO8ch5vjQgi5h9i7HKuCfCs2kN9R8mqfUAMUy5Y2rDEKMG8nqM4IfFtLKmCAQrblRkoolMfS5U5UcjYOQY7QCEq7ZLre7MnXxI90o2kSveuSqlmTgsYH7uuUL9KQeRm9YiSLWc6rvhm4+FP8D1ots1z2aAJ1Nn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ha2jJ+1U; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ha2jJ+1U"
Date: Thu, 10 Jul 2025 23:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752203376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzOTbQ1Df5qkQWA6hvvWlK1j4HvbNfCUSsN8QNrENNI=;
	b=Ha2jJ+1Un81FwO48RYKC+YAoTVvgzxsJE5vDg3xIUoIXu8kiYU146iH1BKTlDg7kdqSChg
	chPi2Twa/a8WDyrhdZngLl7qtueqOyA/Zl0rMqyAvZm/oRlldCopdGRi4j1DpN6B5AmasM
	1+LiVG0rG5qG6TbOiF5qCzJBDgFqkig=
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
Message-ID: <vyguhk4hzhf6zyg6hn77satnmsrsr5hmcl7bifws32bnilqbs2@374p6che72yz>
References: <20250711002322.1303421-1-cachen@purestorage.com>
 <CALCePG3a6wG+3Nu7-JHha+LMtyRRNF3sXp13sS-=Xv1pvsX09Q@mail.gmail.com>
 <fhy4rcjrwwmlebgoiwepmga3fovxdvqeylsub6lk3opl2fi2td@ucuwdpu4ua7r>
 <CALCePG1h8NE010EGpBh8CxhiWqr4-GantEJ4P0Dnck+cnioBiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALCePG1h8NE010EGpBh8CxhiWqr4-GantEJ4P0Dnck+cnioBiw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jul 10, 2025 at 06:07:13PM -0700, Casey Chen wrote:
> On Thu, Jul 10, 2025 at 5:54 PM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > On Thu, Jul 10, 2025 at 05:42:05PM -0700, Casey Chen wrote:
> > > Hi All,
> > >
> > > Thanks for reviewing my previous patches. I am replying some comments
> > > in our previous discussion
> > > https://lore.kernel.org/all/CAJuCfpHhSUhxer-6MP3503w6520YLfgBTGp7Q9Qm9kgN4TNsfw@mail.gmail.com/T/#u
> > >
> > > Most people care about the motivations and usages of this feature.
> > > Internally, we used to have systems having asymmetric memory to NUMA
> > > nodes. Node 0 uses a lot of memory but node 1 is pretty empty.
> > > Requests to allocate memory on node 0 always fail. With this patch, we
> > > can find the imbalance and optimize the memory usage. Also, David
> > > Rientjes and Sourav Panda provide their scenarios in which this patch
> > > would be very useful. It is easy to turn on an off so I think it is
> > > nice to have, enabling more scenarios in the future.
> > >
> > > Andrew / Kent,
> > > * I agree with Kent on using for_each_possible_cpu rather than
> > > for_each_online_cpu, considering CPU online/offline.
> > > * When failing to allocate counters for in-kernel alloc_tag, panic()
> > > is better than WARN(), eventually the kernel would panic at invalid
> > > memory access.
> > > * percpu stats would bloat data structures quite a bit.
> > >
> > > David Wang,
> > > I don't really understand what is 'granularity of calling sites'. If
> > > NUMA imbalance is found, the calling site could request memory
> > > allocation from different nodes. Other factors can affect NUMA
> > > balance, those information can be implemented in a different patch.
> >
> > Let's get this functionality in.
> >
> > We've already got userspace parsing and consuming /proc/allocinfo, so we
> > just need to do it without changing that format.
> 
> You mean keep the format without per-NUMA info the same as before ?
> My patch v3 changed the header and the alignment of bytes and calls. I
> can restore them back.

I mean an ioctl interface - so we can have a userspace program with
different switches for getting different types of output.

Otherwise the existing programs people have already written for
consuming /proc/allocinfo are going to break.
