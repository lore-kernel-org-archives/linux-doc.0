Received: from mta0.migadu.com (out-6.mta0.migadu.com [91.218.175.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5363C548578
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091963; cv=none; b=Sb59HU3D6+OKJCXA1J71Rr3xUdF5HLv9AVvFq5C5g9LRx/F5az4Se3Nxo3tcYVpfs4IWDrBu1hJT8/13L8/NNlGs670/WM+imZuXWmDq8CYWWkf3uLI6oHHxFAGC7PoIQ3vQSCF6J/bvzhhZ2aoy1DrJkzxypGf2wNt9yXfRF9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091963; c=relaxed/simple;
	bh=E4nsCeMhUyoyfA92nxYsi+1V5mplBSR6abTs7jkapTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7vfqHf8h7iolDsU/HjQ5SJlH1wDV0puelveO5sEoh8mDvfIY+cHY2VD3NvZu7v8oL1xyWSqB4rADtCiGux3xKEXoUDud+3mcUZOMj3TjP4uprMz7m3yoAD1u5Jgabc+fGjUoeqFR/klILcgilfHQJcj8MkO1d0gNzt7JUkqK6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j8Pd6TsC; arc=none smtp.client-ip=91.218.175.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j8Pd6TsC"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E4nsCeMhUyoyfA92nxYsi+1V5mplBSR6abTs7jkapTk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790091955; v=1; x=1790696755;
 b=j8Pd6TsCJrJcpukHfn+/ory5A8icclYSiGnK/2ongwQCQlkTubh56qmMQO4Y/GfppFqo+vfs
 Cz5dOZ6fqnZoFIg6xFTbewHKZL2UTkAzhHLAHP1UM0XSL7SbaGyiqKMfg8mLJ2+gAJIZ/0a43ml
 sRuIZIdtLkH2Xnz0b1Sz4szk=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fbff1a32c447a0a9;
	Tue, 22 Sep 2026 15:45:54 +0000
X-Mizu-Trace-ID: fbff1a32c447a0a9
X-Migadu-Flow: FLOW_OUT
Date: Tue, 22 Sep 2026 08:45:49 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Chris Li <chrisl@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Meta kernel team <kernel-team@meta.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arKgladcnmeTWUKb@linux.dev>
References: <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora>
 <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <arKRdaNEaKvFOtMg@linux.dev>
 <CACePvbX7aM45SE9H0hg1_uXBt1i4W7Pgk+d33Z2sG5bj8cHudA@mail.gmail.com>
 <arKZpJDpsavixjPx@cmpxchg.org>
 <CACePvbUmVLVk=w1sJinBfKVYoXcO57A163RrXv7C_QLzM4yQZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACePvbUmVLVk=w1sJinBfKVYoXcO57A163RrXv7C_QLzM4yQZQ@mail.gmail.com>

On Tue, Sep 22, 2026 at 05:30:44AM -1000, Chris Li wrote:
> On Tue, Sep 22, 2026 at 5:07 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Tue, Sep 22, 2026 at 04:56:48AM -1000, Chris Li wrote:
> > > On Tue, Sep 22, 2026 at 4:43 AM Shakeel Butt <shakeel.butt@linux.dev> wrote:
> > > >
> > > > People can speak for themselves and suggest other time slots. You do not speak
> > > > for anyone but yourself here. At this point this is derailing the conversation.
> > > >
> > >
> > > I am expressing my opinion, freedom of speech. As you can see in the
> > > previous discussion, Baoquan wasn't able to join that time slot. He is
> > > a major shareholder in XSwap. I worry that alignment vswap vs xswap
> > > without Baoquan is ineffective. That is my opinion.
> >
> > Actually, he said he is not sure if he can make it, and before Nhat
> > could respond to that soft push you drew a hard line without actually
> > proposing a workable alternative that made Nhat give up instead.
> 
> Please consider that it is 1AM in Beijing if I remember correctly. I
> don't consider that is a workable and reasonable ask.
> 
> > So my free speech opinion is the same as Shakeel's: you're speaking
> > for others and thereby derailing efforts to align on something.
> 
> I sympathize with asking Baoquan to join a meeting at midnight.
> 
> >
> > We all want Baoquan in the room.
> 
> In Chinese we have this saying: don't apply things to others that you
> wouldn't want applied to yourself. Do you want to participate in a
> technical meeting at 1 AM?

Three emails in, you have rejected the proposed slot and proposed
none, and your own conclusion was to drop the meeting and keep this on
the list. That is not inclusiveness, it is a veto, and the outcome
serves Baoquan and xswap worse than any hour of the day would have.

Baoquan said he was not sure he could make it. He is perfectly capable
of declining himself, or of sending alternative timeslots to the list.
You turned his "not sure" into a hard no on his behalf, then argued
with everyone who pointed that out.

Please reply with two or three specific windows in UTC that work for
people not in US timezone. If they overlap with the other participants,
we use one of them.
