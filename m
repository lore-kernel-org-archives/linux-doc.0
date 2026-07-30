Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A433E765A;
	Thu, 30 Jul 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404471; cv=none; b=ruINn8ZhDP66WjUB5PHn975WDlwvY9ZDHABE17drliULEQcutBwHReOei9gVhnK53p30sYavsHqIDKg7XzXiaql9Nk7YUkzx+T9G2OJTVX0xTIfd54su+kEnVv/5TWEcBwyqOT8mVVhX/YnkSRepPRq9I5sQQeS/ccuOafCYZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404471; c=relaxed/simple;
	bh=EfHBcbb1OIgrrK1ouHGHYWE/faqmsEd8X5yc66vuH1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVnonZ+sh93XCY8eWJTphxqxTihH2+IMfOHuJIJ5gS/ulNMxAKaG2d3GzFSB+RdgcovkM57N2MbBLnDRE5t/JUZerfFEeDroIU3S+KuKOx+RF+DyDiXUljHqchhijaTiUjneFw4tb48SmgshDyWqn6Kf7VlXXRl5PIU3T1sjjq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owEBCDFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owEBCDFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7A81F000E9;
	Thu, 30 Jul 2026 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785404469;
	bh=bXRSOEW7KmTLEA5e4w9VE7SIvHIV48lOKraAwCykp7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=owEBCDFFYm/5ZGKYj3PLpfK+W4y/oqab8Ho92pybkve7clPInVhDZYpnfoTE2ZI9w
	 ZJcdk9WK/XuZ4xo1fAia9i8pCuoK5NIMjj7Vt4X7ThgaEv5SrTuO6SrBPoo/mZO3xw
	 sy9fYDPX7qedxRttlYHJ9q0EDjpfGK0xUZ19gOGeiVIeu2TwwfErbWKZ87/2sU1/lE
	 8RhFDnjjaTmufFd6794B6PbR6kfVxcM09RXHKo/NfZeAM0Ln535IdVwrtGHY9beqLj
	 rPhVwl45M11nidWsdiefFhPWPdjhNcYtx8CQ6IEgv2yzE3EXffemnjENxT1rx2DHHr
	 ebSEugnxHDQuQ==
Date: Thu, 30 Jul 2026 10:40:50 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pratyush Mallick <pratmal@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	akpm@linux-foundation.org, vbabka@kernel.org, sj@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, anshuman.khandual@arm.com, gthelen@google.com, surenb@google.com, 
	mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, 
	liam@infradead.org, rppt@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module
 parameter
Message-ID: <amsYVFfJmOs-Hy90@lucifer>
References: <20260727230545.262579-1-pratmal@google.com>
 <amiN82J8p5z9l_Rm@lucifer>
 <91b61f02-c533-41b9-b680-7de52a5c6918@kernel.org>
 <CALHaPKeOs25YNRg60+NxfS3E5RYLt5hJqFNX02ZCEBrjcDua0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHaPKeOs25YNRg60+NxfS3E5RYLt5hJqFNX02ZCEBrjcDua0Q@mail.gmail.com>

On Tue, Jul 28, 2026 at 01:31:10PM -0700, Pratyush Mallick wrote:
> On Tue, Jul 28, 2026 at 11:55 AM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 7/28/26 13:13, Lorenzo Stoakes (ARM) wrote:
> > > On Mon, Jul 27, 2026 at 11:05:45PM +0000, pratmal@google.com wrote:
> > >> From: Pratyush Mallick <pratmal@google.com>
> > >>
> > >> Currently, the free page reporting uses a hardcoded delay of
> > >> (2 HZ) between reporting intervals. While this is a reasonable
> > >> default, it lacks the flexibility to adapt to varying guest workloads.
> > >>
> > >> A low delay allows aggressive memory reclamation, returning unused
> > >> pages to the host as quickly as possible. However, during spiky
> > >> allocation/free churn, this immediate reporting can lead to a severe
> > >> performance penalty (nested page faults) as the guest re-allocates memory
> > >> that the host has just unmapped. In these scenarios, there is benefit
> > >> from increasing the delay to batch free pages over a longer window,
> > >> absorbing the churn without hypercall and re-fault overhead.
> > >
> > > Since you're talking about increasing it, maybe set the floor at the current
> > > value of 2s?
>
> We benefit equally by setting the value to zero as well. This would immediately
> report the pages being freed back to the host without any delay. This helps when
> the host is under pressure, as any immediate memory release would help it.

OK page_reporting_order makes this better.

>
> > >>
> > >> This patch exposes the delay as a module parameter:
> > >> /sys/module/page_reporting/parameters/page_reporting_delay_ms, measured
> > >> in milliseconds and defaults to 2000ms.
> > >
> > > I'm not sure this is great as it means we now have a parameter we have to
> > > support forever and autotuning becomes harder to implement, also if later the
> > > implementation is changed, this might prevent a reimplementation.
> >
> > While I'd prefer to keep the implementation as simple as possible unless really
> > required, I guess auto-tune could be enabled by setting the parameter to e.g.,
> > -1 in the future.

We'd have to retain the customisable delay forever either way.

But I guess maybe in this case it's not such a big deal.

>
> The case we're trying to solve involves tuning free page reporting based on host
> memory pressure. I think the host is the primary beneficiary of free page
> reporting, so if we wanted to dynamically autotune this delay, we would need
> some mechanism from the host to enlighten the guest about its current memory
> pressure and the autotuner would build its heuristics around it.
> As far as I understand, no such mechanism currently exists. While
> we do have ballooning, it requires the guest to actively allocate memory under
> pressure, which makes it a comparatively slower mechanism and wouldn't help
> much for simply adjusting the reporting rate of already free pages.

You're explicitly needing to do this under certain circumstances.

>
> > >>      /*
> > >> -     * Delay the start of work to allow a sizable queue to build. For
> > >> -     * now we are limiting this to running no more than once every
> > >> -     * couple of seconds.
> > >> +     * Delay the start of work to allow a sizable queue to build.
> > >> +     * We limit this based on page_reporting_delay_ms.
> > >>       */
> > >> -    schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
> > >> +    schedule_delayed_work(&prdev->work,
> > >> +                          msecs_to_jiffies(page_reporting_delay_ms));
> > >
> > > Err, do we not want to limit this to something sensible? What if the user
> > > specifies 0 does it just hammer the system at that stage?
> >
> > IIUC, 0 just means "as soon there is a suitable free page block to report, start
> > reporting immediately".

There's comments like "We will defer by page_reporting_delay_ms to allow more
pages to accumulate." etc.

Maybe worth tweaking that?

But with page_reporting_order == 9 (or 5 see below) then fine I guess.

If somebody asks for something stupid by setting it higher they'd already
accumulate latencies, just now with a 0 timer it could be really crazy :) but I
suppose they are asking for it.

> >
> > With 2s, we wait 2s before we start reporting immediately by kicking the
> > workqueue immediately.
> >
> > So "0" does not mean "report all the time", rather "start reporting immediately
> > as we are notified about a pageblock to report".

No, it's whenever pageblock_order is specified, defaulting to a pageblock.

But I guess in practice fine.

There's fun like this in virtio_balloon.c btw:

		/*
		 * The default page reporting order is @pageblock_order, which
		 * corresponds to 512MB in size on ARM64 when 64KB base page
		 * size is used. The page reporting won't be triggered if the
		 * freeing page can't come up with a free area like that huge.
		 * So we specify the page reporting order to 5, corresponding
		 * to 2MB. It helps to avoid THP splitting if 4KB base page
		 * size is used by host.
		 *
		 * Ideally, the page reporting order is selected based on the
		 * host's base page size. However, it needs more work to report
		 * that value. The hard-coded order would be fine currently.
		 */
#if defined(CONFIG_ARM64) && defined(CONFIG_ARM64_64K_PAGES)
		vb->pr_dev_info.order = 5;
#endif

>
> Right. Setting the delay to 0 does not hammer the system. The execution
> is constrained by two checks:
> 1. The worker is only scheduled when high-order pages (default is >= 2MB) are
> freed. This makes scheduling relatively infrequent compared to normal 4K
> page allocations.

It's that only by default and could be overridden (and is for arm64 64 KiB page
tables but probably also fine there)

But probably fine.

> 2. Even when the worker wakes up, the actual expensive operations, such
> as page isolation, acquiring locks, and hypercalls to report pages, are
> guarded by the watermark check in page_reporting_process_zone(). We only
> proceed with reporting if the zone has enough free pages to fill the
> capacity batches (32 slots by default). If the watermark is not met,
> the worker simply
> exits and returns to the IDLE state without issuing any hypercalls.

OK that makes it better.

Can you make these points in the commit msg on respin then?

>
> > >>       state = atomic_cmpxchg(&prdev->state, state, PAGE_REPORTING_IDLE);
> > >>       if (state == PAGE_REPORTING_REQUESTED)
> > >> -             schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
> > >> +             schedule_delayed_work(&prdev->work,
> > >> +                                   msecs_to_jiffies(page_reporting_delay_ms));
> > >
> > > This code is duplicated, while you've making this change maybe pull this into
> > > its own function?
> > >
>
> Thanks. I can create a new function for this and send a V4.

Thanks

>
> Regards,
> Pratyush

Cheers, Lorenzo
