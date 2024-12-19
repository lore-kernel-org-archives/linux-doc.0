Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420EB149DF4;
	Thu, 19 Dec 2024 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734599633; cv=none; b=a/ONbBrXoHrQZspzWUqmnI4Y3uc1FgcFMOdSfshx83wQ1X/DkPXLL3WIIVpEiYhafOc7FhYT5Bc9Y17VkvuAqegZMwHlcVtjCojq1X/H4CQChWMhNyCqDo6VnpTKO1ARglZaYjZUMmSqjuFliKgoic66fSMjOBgvs3oSFhNwArc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734599633; c=relaxed/simple;
	bh=HL+77FaSWbISKMNuMomFMiSTJ/OqM2oa7Uc5fQtaOv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0xKeG2IFFiFtp3P8MDpEquERcFmkaptvQ5Z8iGhfrYrNdnSgnuUWg7z1X7gezsD9s/KGeQXaUYAXJQDMKMAwkZg7aO+4ARHTcmiWoT6xTGm65qV/eTu1qR+Alr2FNQy5f4BmGPb/8IuQTNZMmb7OXpd7uHzD/zSJwdGhl9ehjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aZVDbp1X; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="aZVDbp1X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xFCcOBb9eMvxc6GhECSeXMy/EsYjD7GWOE/6oJ0KceQ=; b=aZVDbp1XznBHq/27DPPV1JJSG8
	pBTAOiceVhuJuQsZKbQJ8OV3W4pEu7UqSjVRRjF6ZFkVm5d/GAjPNHaxM7wrZLKYWJhngcb2Zrd6q
	QeqFXdclPgtqYGjPYn+Fz37yE80/ibO5MH5PRld/ivlIu4Thqc/D+Nc8O6Ajb8p8YDd8WmmVGcrZR
	e5YSZx6Vl/0GtGKDp594inX58sMQMkXZ/3CWFySF65fzR1dLIrNDLsvYBEOnRlcP0ih3dWgEM/9eP
	AYqxoLXQqaOIhkMW+KVRBW3LPoqaGmy9QwXCI0+EkCg288FPzGEjWQL8zV2U/ihxDmZaB99HAr/mO
	pC0Ulvrg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCb8-00000005Q3z-3i8w;
	Thu, 19 Dec 2024 09:13:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6DFE03003FF; Thu, 19 Dec 2024 10:13:34 +0100 (CET)
Date: Thu, 19 Dec 2024 10:13:34 +0100
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
Message-ID: <20241219091334.GC26551@noisy.programming.kicks-ass.net>
References: <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
 <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>

On Wed, Dec 18, 2024 at 01:53:17PM -0800, Suren Baghdasaryan wrote:

> Ah, ok I see now. I completely misunderstood what for_each_vma_range()
> was doing.
> 
> Then I think vma_start_write() should remain inside
> vms_gather_munmap_vmas() and all vmas in mas_detach should be

No, it must not. You really are not modifying anything yet (except the
split, which we've already noted mark write themselves).

> write-locked, even the ones we are not modifying. Otherwise what would
> prevent the race I mentioned before?
> 
> __mmap_region
>     __mmap_prepare
>         vms_gather_munmap_vmas // adds vmas to be unmapped into mas_detach,
>                                                       // some locked
> by __split_vma(), some not locked
> 
>                                      lock_vma_under_rcu()
>                                          vma = mas_walk // finds
> unlocked vma also in mas_detach
>                                          vma_start_read(vma) //
> succeeds since vma is not locked
>                                          // vma->detached, vm_start,
> vm_end checks pass
>                                      // vma is successfully read-locked
> 
>        vms_clean_up_area(mas_detach)
>             vms_clear_ptes
>                                      // steps on a cleared PTE

So here we have the added complexity that the vma is not unhooked at
all. Is there anything that would prevent a concurrent gup_fast() from
doing the same -- touch a cleared PTE?

AFAICT two threads, one doing overlapping mmap() and the other doing
gup_fast() can result in exactly this scenario.

If we don't care about the GUP case, when I'm thinking we should not
care about the lockless RCU case either.

>     __mmap_new_vma
>         vma_set_range // installs new vma in the range
>     __mmap_complete
>         vms_complete_munmap_vmas // vmas are write-locked and detached
> but it's too late

But at this point that old vma really is unhooked, and the
vma_write_start() here will ensure readers are gone and it will clear
PTEs *again*.


