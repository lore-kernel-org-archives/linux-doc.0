Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6002B41760;
	Thu, 19 Dec 2024 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634028; cv=none; b=HeXGqvAU5WS/9QHMXfOYBd9Wh8cmEijL1qwoop1tVl9S1yuJfqsGfpYVYGuZR6saS5ECKnvlud2ohshUfJDZ2qwgNjL+lLDykOCOwyXIfmuElhGrL2dTt7/ONDblha2RacsRmkkUHHS4NvU9Bnr808QDRRZJLBrVnAkzI7nZCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634028; c=relaxed/simple;
	bh=Uuo89MMUgo99peE/L+FKDtIjSbFf8+PRrD4hl7wOvbg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkTpu55+PTCqcb+uEhqZ8sxukiTMQwKX6nNxW+cGwXMvpaj4Rlq01KmZQxYnL17y57v8mMCuRpWCA1oq6oeIGbo09c2k/8AvL9M/E5zcZndzVQaN+y4TwcnDJxf8JuxGyRoZ2dmms2GcHo9SrP0EnfLxcHbp6zA3o3iZXc7lSpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=S/wi1bNe; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S/wi1bNe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rGpeIQU8OFNXXoe0FS/CeUx+kNOrcVNpVk7LZwVhvWA=; b=S/wi1bNeQ9Q4i3rS/866YGgl2l
	sxjX4PZy8ejVi0QwRX6tnAaN4aIElD4TQue2Y0UGZI0RS7yqlyyCxvy/wm/4+D+OTsNH0gEMajZ1x
	AgCzSk6L82f/7uXvbHOXFTfWFaMyr5IkLFdYjbX+3g6wafzr4saIOUb9hQcqvaNNsLkhfY/X9LxVq
	u33g34oQAoGd/pda55FN+xUn6SdvlNPTb57LJb0TcvPwAI3t8ai+kuZ4IcRgbzMmHrMZ1o/YXXkmj
	xk0Lc8tD2brqYHKLRljGjNIfjDvRkDqkKG65eRrTr434YjeKdsAQl/vD8ZeX3B4RwK9Cj0C4LLfYH
	4E2LY/5A==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLXn-00000005Ucw-3lLs;
	Thu, 19 Dec 2024 18:46:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4CEA330031E; Thu, 19 Dec 2024 19:46:42 +0100 (CET)
Date: Thu, 19 Dec 2024 19:46:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
	oliver.sang@intel.com, mgorman@techsingularity.net,
	david@redhat.com, peterx@redhat.com, oleg@redhat.com,
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20241219184642.GF26279@noisy.programming.kicks-ass.net>
References: <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net>
 <20241219112011.GA34942@noisy.programming.kicks-ass.net>
 <wfzu6jvbazlxdybsjc54aoivleif6memaxaacd56bcep24nkv3@s3e3aj253hd6>
 <20241219174235.GD26279@noisy.programming.kicks-ass.net>
 <rnanfpzs6fmojyeaowt65mug6xekorrkeefvn3b4zc7buunzhc@rrzcbhkrjdv4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rnanfpzs6fmojyeaowt65mug6xekorrkeefvn3b4zc7buunzhc@rrzcbhkrjdv4>

On Thu, Dec 19, 2024 at 01:18:23PM -0500, Liam R. Howlett wrote:

> > For RCU lookups only the mas tree matters -- and its left present there.
> > 
> > If you really want to block RCU readers, I would suggest punching a hole
> > in the mm_mt. All the traditional code won't notice anyway, this is all
> > with mmap_lock held for writing.
> 
> We don't want to block all rcu readers, we want to block the rcu readers
> that would see the problem - that is, anyone trying to read a particular
> area.
> 
> Right now we can page fault in unpopulated vmas while writing other vmas
> to the tree.  We are also moving more users to rcu reading to use the
> vmas they need without waiting on writes to finish.
> 
> Maybe I don't understand your suggestion, but I would think punching a
> hole would lose this advantage?

My suggestion was to remove the range stuck in mas_detach from mm_mt.
That is exactly the affected range, no?
