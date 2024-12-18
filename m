Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902B6148855;
	Wed, 18 Dec 2024 16:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538750; cv=none; b=PxqGrE6QBE5eTBgu0JRpR/iqgzjsBsR7zTjyEuw9OQmXiHf98jN5eJaAuMead7Mdtl0sZ3b8KAx82Jc9uB3hsGTSSLoUN3PmOhYxLV7u6K/z31COGX2qmL1fJ9lus3bj5DyrCgmINY9lXTVHTbKDoBFLvunTjDVXwxCFxQ9NtRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538750; c=relaxed/simple;
	bh=eQ3d4PyEkqgZYq7MM0+JV94wre2Ax4fhV9LM2jlrmF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2meQqMOy3QkA8nHvbu4oVSyGXMVxB1X+jtteIMi+F2T5FN7vcMDhMZ0JDF1ypxP1Xm4uqa5yBQEFxx/FpTEC8/X8QYxI4eQOg33+GbDfXniQtL8X4B9aUGVfPHFnPSNLFxlrh0zsMuv26GCyt/aDLUt8JlLnbW9enfZnaq6tmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CY3N6al0; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CY3N6al0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZHpuBWCyR8vlWFUMmiUoV4xehd4CsItuBEKyBXtYL4g=; b=CY3N6al0QW9pNvhvU+tELTEeq1
	eOdc+9YVKPX8bKD42LpFTKqZUZaVCtjVnxjfLkokusvZKTw1pVBBaHK3ARoHcD8ikDQsm0+3PdjhW
	fBnOqWb46wN8GB+xUf0J8yV0d4dvaV2ByKE6KHq8iyM4W1MIvX+W/O0CvGRJ1XtNlL1G+5eF9n+v+
	KIlVpTW5pp8MViJWIdluxxUM0g0iHldNYd4Xsdb7dVcqhR/j9Ll1fkWX4HBW5tOUOIVt5M15QmFNg
	QXfXR5i6Wc7cLtGVkTprBFHRF/bLKhKJNq6NvsNOnoST9p8xmCBTQrNPvMcHaq+rP4VAc2fOVrPNU
	Wxk2JmCA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwl9-00000005ImP-2Fk8;
	Wed, 18 Dec 2024 16:18:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 16DF730031E; Wed, 18 Dec 2024 17:18:51 +0100 (CET)
Date: Wed, 18 Dec 2024 17:18:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
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
Message-ID: <20241218161850.GG2354@noisy.programming.kicks-ass.net>
References: <20241216192419.2970941-1-surenb@google.com>
 <20241216192419.2970941-11-surenb@google.com>
 <20241216213753.GD9803@noisy.programming.kicks-ass.net>
 <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net>
 <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>

On Wed, Dec 18, 2024 at 07:50:34AM -0800, Suren Baghdasaryan wrote:

> I think vma_start_write() should be done inside
> vms_gather_munmap_vmas() for __mmap_prepare() to work correctly:
> 
> __mmap_prepare
>     vms_gather_munmap_vmas
>     vms_clean_up_area // clears PTEs
> ...
> __mmap_complete
>     vms_complete_munmap_vmas

I'm unsure what exactly you mean; __split_vma() will start_write on the
one that is broken up and the rest won't actually change until
vms_complete_munmap_vmas().

> If we do not write-lock the vmas inside vms_gather_munmap_vmas(), we
> will be clearing PTEs from under a discoverable vma.

You will not. vms_complete_munmap_vmas() will call remove_vma() to
remove PTEs IIRC, and if you do start_write() and detach() before
dropping mmap_lock_write, you should be good.

> There might be other places like this too but I think we can move
> vma_mark_detach() like you suggested without moving vma_start_write()
> and that should be enough.

I really don't see why you can't move vma_start_write() -- note that by
moving that after you've unhooked the vmas from the mm (which you have
by that point) you get the sync point you wanted. 


