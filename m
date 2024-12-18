Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5041C5CD5;
	Wed, 18 Dec 2024 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538445; cv=none; b=YxZ0lJ2REWFW3hnOZoBNs4as+xZyXEgWmLmKn+YUaDImEhkuKmQPPxLQIR25RJx+gAIlowGvyA+FSrgPK2wVVcFcHnGt4jymqmTX5Fg7e1O2e9vna9IjOwRJje5n5ann1Snkik9rAmF5D5n13oK2jn7cvJIuNZUWBgUAumXW0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538445; c=relaxed/simple;
	bh=dKKnDIhB4A0sGKEEYCETnqpyhida6DC/j2Qr7VZKsWs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbOje1XbNfg1SdKS2E2EBISV0KSNpc+cwC6LImjAL/L3YW7wPCs5IoU7uUwaJm503J/R52ozXp9DTuFSqVuZtygzWls4fMBxRvKh4iF/gEiXI17uWWHuiVOWzw22gzU7xh2CJSu+GyJKdHLaWTXdtg+ICcxTb9Ar/zT/EaLyLuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fWmTjZKz; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fWmTjZKz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aIbpWcOsQF2GNf1HLesq1CHwmoFFqD5BsZnUSbWorAc=; b=fWmTjZKzVq/NgFXdrNpKW/AopX
	QOTVf3mfNIyNNXvIbExWn2tEpM2feagYfvHYKknQAYc+bJNMCM/Yk4B9kkSLlAgX/SFL+xIAQZBGP
	XAaf8PydocvVg0o858lm6BL5uc7zIsuEF86c6SmAxi+C3Se3tTEDTNLiT6pQaR6JDYbelh1sKjlFL
	FE5HY7KvYNQp/Ro52RjI5Ha2ZwjgB13ptQPkcr6j2+gO+vXpyBb1ANCHzm495OUqx11UqzEZtVpSG
	Ycea+xdQjYtzC3XhtI0Fyig2AgLXPvYQ+kqKJY/0OF1q4yBwOZsvXV86HJUjAlWUZ4iAihLhYl2R4
	zSAlJ+jg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwgC-00000005IkE-2wBV;
	Wed, 18 Dec 2024 16:13:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C2B1D30031E; Wed, 18 Dec 2024 17:13:43 +0100 (CET)
Date: Wed, 18 Dec 2024 17:13:43 +0100
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
Message-ID: <20241218161343.GF2354@noisy.programming.kicks-ass.net>
References: <20241216192419.2970941-1-surenb@google.com>
 <20241216192419.2970941-11-surenb@google.com>
 <20241216213753.GD9803@noisy.programming.kicks-ass.net>
 <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net>
 <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>

On Wed, Dec 18, 2024 at 10:37:24AM -0500, Liam R. Howlett wrote:

> This is also correct.  The maple tree is a b-tree variant that has
> internal nodes.

Right, I remembered that much :-)

> > Also, I think vma_start_write() in that gather look is too early, you're
> > not actually going to change the VMA yet -- with obvious exception of
> > the split cases.
> 
> The split needs to start the write on the vma to avoid anyone reading it
> while it's being altered.

__split_vma() does vma_start_write() itself, so that should be good
already.

> > That too should probably come after you've passes all the fail/unwind
> > spots.
> 
> Do you mean the split? 

No, I means the detach muck :-)

> I'd like to move the split later as well..
> tracking that is a pain and may need an extra vma for when one vma is
> split twice before removing the middle part.
> 
> Actually, I think we need to allocate two (or at least one) vmas in this
> case and just pass one through to unmap (written only to the mas_detach
> tree?).  It would be nice to find a way to NOT need to do that even.. I
> had tried to use a vma on the stack years ago, which didn't work out.

Urgh yeah, vma on stack sounds like utter pain :-)
