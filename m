Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202EE39656E
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631545; cv=none; b=mjKa3F1EUfgn14whGAkA8Zz24myJyU2+JSvpjiBkQeEUjmVqiSCUbFgM5Els3GnR8zscXeOoXxvQZa7OkhXlFdXf/027zY5XvM3hHRWc3DnFM5IWLMIB6pbf9NFxp6g/BnTR+CDCbpBEiTerVIRS1ZZdXyFb04TyLPIuJDtdBLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631545; c=relaxed/simple;
	bh=pH5/HZ0/MqKAe/RgecoCvn5pOUsFTPLIQ5c47mKfrGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTK2czQPDMyKL/s0ZKs26JSJv9wgRCEoTJj6W1maysdQWBHtsd9UWZgY95b5rNs3NeXGihv76LsRr/eROEuN5pj7qypvgrvgOPNTHnu72ACXNUtOf/LtmBlSwBzlcj3V2hy77KvugvB/yUwxp97kDksHP/oH92YiyYWFc7jSDq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIpq61fY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIpq61fY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239041F000E9;
	Thu, 13 Aug 2026 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786631544;
	bh=IG593WwPZHkjAHpEh+qnkEZ5lNUNcA7qjwLsO5uxs1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cIpq61fYzk1dxWEdXEUCp16LoxTYoW+i9fW+HkgxV8mPgI1kWmiKvAvbhqO7rege8
	 D4WBjRsiJBmYFZ4x/ANT8VYdzB4jja+mx0CeeeAAZtDQK0u0gfKAmFXuj0NIl2rhjJ
	 g1Y4G/QIsHK9yryXNKb8Xw7oc6L2te2z/OrPxkketN/hBBA2lTD996Hs+poYAD7kOa
	 skFHZVF6659buG0et6UnjqRrB3ll7cdhZ8UMjlmrOnnlrSs34J7NkFplvnOsBuYoej
	 ENPENjuAw4Rwwzc1rxRSRB6CA0/fmMvtIplA5k4YCuiGnWDgEqHu4qDnXDeXf+dvbU
	 BFmcha80bjpHw==
Date: Thu, 13 Aug 2026 15:32:03 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	shr@devkernel.io, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com
Subject: Re: [PATCH v2 2/2] mm/ksm: fix advisor_min_pages_to_scan description
Message-ID: <an3RcQgDuhmcAb37@lucifer>
References: <20260813031722.569983-1-tujinjiang@huawei.com>
 <20260813031722.569983-3-tujinjiang@huawei.com>
 <an2g39TIN9v87enG@lucifer>
 <b35d14b5-65d8-4b8e-8754-de35f03d4b2d@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b35d14b5-65d8-4b8e-8754-de35f03d4b2d@huawei.com>

Please show me the common courtesy of responding to _all_ the review given,
not only the one point you want to respond to.

I'm not happy with this patch, sorry, for the reasons stated that you chose
to ignore.

On Thu, Aug 13, 2026 at 07:17:05PM +0800, Jinjiang Tu wrote:
>
> 在 2026/8/13 18:56, Lorenzo Stoakes (ARM) 写道:
> > On Thu, Aug 13, 2026 at 11:17:22AM +0800, Jinjiang Tu wrote:
> > > Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
> > > variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
> > > lower limit of the pages_to_scan parameter, but that is not how the
> > > scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
> > > advisor") only uses it to initialize ksm_thread_pages_to_scan when the
> > > scan-time advisor is enabled. This will mislead the users.
> > >
> > > The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
> > > [1], but the documentation wasn't updated.
> > >
> > > Update the documentation and comment to match the semantics of
> > > advisor_min_pages_to_scan.
> > Umm, firstly if this were wrong you'd need to change the name of the variable
> > too instad of documenting it as something completely distinct.
> >
> > But secondly AFAICT the logic in scan_time_advisor() suggests that it truly does
> > act as a minimum bound as well as being the initial value for
> > ksm_thread_pages_to_scan.
>
> As the cover letter[1] said, 'The initial value and the max value for the pages_to_scan parameter can
> be limited with:', ksm_advisor_min_pages is used as the initial value, not the min value of pages_to_scan.

(Wrap your lines properly please, it's a common courtesy to learn how to
send mail according to community conventions.)

One of the part of my review you ignored:

	But in any case, you are making a claim here yet have provided no
	evidence for it. 'It is just the initial assignment' means nothing
	- if the logic can then only increase it up to the maximum value
	then it still acts as a minimum.

>
> The v1 patchset[2] uses ksm_advisor_min_pages as the min value of pages_to_scan, but as David suggested, the
> author changed the semantics of advisor_min_pages_to_scan in v2, but forgot to update the comments and variable names.
>
> [2] https://lore.kernel.org/all/20231004190249.829015-1-shr@devkernel.io/
>
> >
> > So this patch just looks wrong to me.
> >
> > But in any case, you are making a claim here yet have provided no evidence for
> > it. 'It is just the initial assignment' means nothing - if the logic can then
> > only increase it up to the maximum value then it still acts as a minimum.
> >
> > A brief look at the logic suggests so.
> >
> > But in any case - the onus is on _you_ to prove that that's not happening.
> >
> > And even if you could do that, since it is _intended to be a lower bound_, the
> > fix wouldn't be alterting comments or documentation, it would be to re-establish
> > the minimum as a minimum.
> >
> > > Link: https://lore.kernel.org/linux-mm/20231028000945.2428830-2-shr@devkernel.io/ [1]
> > This patch repeatedly states that it is the minimum time. You have failed to
> > provide any analysis to suggest otherwise.
> >
> > > Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> > Assisted-by: ?
> >
> > > ---
> > >   Documentation/admin-guide/mm/ksm.rst | 4 ++--
> > >   mm/ksm.c                             | 2 +-
> > >   2 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
> > > index c9f533b10f6f..c329ca747b8c 100644
> > > --- a/Documentation/admin-guide/mm/ksm.rst
> > > +++ b/Documentation/admin-guide/mm/ksm.rst
> > > @@ -183,8 +183,8 @@ advisor_target_scan_time
> > >           pages. The default value is 200 seconds.
> > >
> > >   advisor_min_pages_to_scan
> > > -        specifies the lower limit of the ``pages_to_scan`` parameter of the
> > > -        scan time advisor. The default is 500.
> > > +        specifies the initial value of the ``pages_to_scan`` parameter of
> > > +        the scan time advisor. The default is 500.
> > >
> > >   advisor_max_pages_to_scan
> > >           specifies the upper limit of the ``pages_to_scan`` parameter of the
> > > diff --git a/mm/ksm.c b/mm/ksm.c
> > > index 7d5b76478f0b..4a6cf8cf5d60 100644
> > > --- a/mm/ksm.c
> > > +++ b/mm/ksm.c
> > > @@ -342,7 +342,7 @@ static enum ksm_advisor_type ksm_advisor;
> > >    * Only called through the sysfs control interface:
> > >    */
> > >
> > > -/* At least scan this many pages per batch. */
> > > +/* Initial number of pages to scan per batch. */
> > >   static unsigned long ksm_advisor_min_pages_to_scan = 500;
> > >
> > >   static void set_advisor_defaults(void)
> > > --
> > > 2.43.0
> > >
> > --
> > Cheers, Lorenzo

--
Cheers, Lorenzo
