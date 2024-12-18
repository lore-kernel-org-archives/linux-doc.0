Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80285199FAF;
	Wed, 18 Dec 2024 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734516381; cv=none; b=VATareoTmA8HoamM3kqp/SITzPijTrA6c4kjyMx6iHPoabeGpvnCf8VLRTU5fgEgS1evgsr6nQIzZHMfM+FeBntz9+9rgma/3/ZSG+HdLOIT6zCNkPwUHH8hdcGI4J2QQ9RwLZcyUp6i2tRJn26gX8dRKF9LKvDA/dvzIiiQ0Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734516381; c=relaxed/simple;
	bh=yIaCYh7jnRmNuFiUrp2Xk//KXJnJzYMOabqKV+xxkow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT8f7zQze41AxsYOXzqNC9+j+kRN4nTdgKzidVg6oCW4sYJt1wS0k2L4rIqWUn1gqqQzs7RfZRqBsao9zddd9eAzn5SyoIOtaFNzVsCpTCHXLDo3i+jDlKDJSp2/rrtAJElFxnHlBbM+bRPspMcrZBm/lhRS2dlZMX1LzJTFIi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MmTr0Q+E; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MmTr0Q+E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LUQRqabp3as3yfp4jDRr00aDe4lMrHxwmyT4SmOcunE=; b=MmTr0Q+EHZB4ClIHbKKZbY6dPK
	ePUIFS2Bwc1SNveCy4x1n7SL4ukY/s0QGfcfLP3Q4K1Vm7UDMaIl6MKjYE0WD2E2Az/mF+52ZnCDS
	imghNb6QtoQmQruZG1QOobt+DPHL/3p93XU8AVt96PkwDzfdraDMnxBiv23MGevotwFOG2ct9EXO/
	W8rxQ65d7TxAnopaFGCA49O3ThQQcbLG/Q+v4ctmfNHUV/JPBGz3xxSaXHnseDpfbZELjmICq+hBU
	XbV8da4U6ko0VDyk0zWsgQ1irWJMRf86G+uHsz4NRGM/yrPb0nIl8tRBAlCj59vi+DNNYsAu0Anw8
	Ub6L2y9A==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqwL-00000005EEZ-2A25;
	Wed, 18 Dec 2024 10:06:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 128733002A0; Wed, 18 Dec 2024 11:06:01 +0100 (CET)
Date: Wed, 18 Dec 2024 11:06:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20241218100601.GI12500@noisy.programming.kicks-ass.net>
References: <20241216192419.2970941-1-surenb@google.com>
 <20241216192419.2970941-11-surenb@google.com>
 <20241216213753.GD9803@noisy.programming.kicks-ass.net>
 <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218094104.GC2354@noisy.programming.kicks-ass.net>

On Wed, Dec 18, 2024 at 10:41:04AM +0100, Peter Zijlstra wrote:
> On Tue, Dec 17, 2024 at 08:27:46AM -0800, Suren Baghdasaryan wrote:
> 
> > > So I just replied there, and no, I don't think it makes sense. Just put
> > > the kmem_cache_free() in vma_refcount_put(), to be done on 0.
> > 
> > That's very appealing indeed and makes things much simpler. The
> > problem I see with that is the case when we detach a vma from the tree
> > to isolate it, then do some cleanup and only then free it. That's done
> > in vms_gather_munmap_vmas() here:
> > https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1240 and we
> > even might reattach detached vmas back:
> > https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1312. IOW,
> > detached state is not final and we can't destroy the object that
> > reached this state. 
> 
> Urgh, so that's the munmap() path, but arguably when that fails, the
> map stays in place.
> 
> I think this means you're marking detached too soon; you should only
> mark detached once you reach the point of no return.
> 
> That said, once you've reached the point of no return; and are about to
> go remove the page-tables, you very much want to ensure a lack of
> concurrency.
> 
> So perhaps waiting for out-standing readers at this point isn't crazy.
> 
> Also, I'm having a very hard time reading this maple tree stuff :/
> Afaict vms_gather_munmap_vmas() only adds the VMAs to be removed to a
> second tree, it does not in fact unlink them from the mm yet.
> 
> AFAICT it's vma_iter_clear_gfp() that actually wipes the vmas from the
> mm -- and that being able to fail is mind boggling and I suppose is what
> gives rise to much of this insanity :/
> 
> Anyway, I would expect remove_vma() to be the one that marks it detached
> (it's already unreachable through vma_lookup() at this point) and there
> you should wait for concurrent readers to bugger off.

Also, I think vma_start_write() in that gather look is too early, you're
not actually going to change the VMA yet -- with obvious exception of
the split cases.

That too should probably come after you've passes all the fail/unwind
spots.

Something like so perhaps? (yeah, I know, I wrecked a bunch)

diff --git a/mm/vma.c b/mm/vma.c
index 8e31b7e25aeb..45d43adcbb36 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
 	struct vm_area_struct *vma;
 	struct mm_struct *mm;
 
+	mas_for_each(mas_detach, vma, ULONG_MAX) {
+		vma_start_write(next);
+		vma_mark_detached(next, true);
+	}
+
 	mm = current->mm;
 	mm->map_count -= vms->vma_count;
 	mm->locked_vm -= vms->locked_vm;
@@ -1219,9 +1224,6 @@ static void reattach_vmas(struct ma_state *mas_detach)
 	struct vm_area_struct *vma;
 
 	mas_set(mas_detach, 0);
-	mas_for_each(mas_detach, vma, ULONG_MAX)
-		vma_mark_detached(vma, false);
-
 	__mt_destroy(mas_detach->tree);
 }
 
@@ -1289,13 +1291,11 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
 			if (error)
 				goto end_split_failed;
 		}
-		vma_start_write(next);
 		mas_set(mas_detach, vms->vma_count++);
 		error = mas_store_gfp(mas_detach, next, GFP_KERNEL);
 		if (error)
 			goto munmap_gather_failed;
 
-		vma_mark_detached(next, true);
 		nrpages = vma_pages(next);
 
 		vms->nr_pages += nrpages;
@@ -1431,14 +1431,17 @@ int do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	struct vma_munmap_struct vms;
 	int error;
 
+	error = mas_preallocate(vmi->mas);
+	if (error)
+		goto gather_failed;
+
 	init_vma_munmap(&vms, vmi, vma, start, end, uf, unlock);
 	error = vms_gather_munmap_vmas(&vms, &mas_detach);
 	if (error)
 		goto gather_failed;
 
 	error = vma_iter_clear_gfp(vmi, start, end, GFP_KERNEL);
-	if (error)
-		goto clear_tree_failed;
+	VM_WARN_ON(error);
 
 	/* Point of no return */
 	vms_complete_munmap_vmas(&vms, &mas_detach);
