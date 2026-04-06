Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA3358D00
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504890; cv=pass; b=F0KbGl9VxELlhAdzz6+FyVF0D0S9Qxih4fdikY2odZ0Wae2HJN6S9txem+48kK8t8llc0VwuSyltX9UVPRAgmQTK1Gf6xmylh7szOF3tcPSVxeR2Xk9nmahRKyoupoD0ZbxWsLXdO2etRo/31CGriwI2mVHzy04a0Uropjxh3gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504890; c=relaxed/simple;
	bh=Bm0v6wTtP+iT93N9OKKBUpzG1JpFtFuCcP8xKu0pC7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7zlTL/mr09z3ogSdVB9YmhB+OXfIiwpM3H6KVLsL+YCvzH/DYKrhtNvAICSvgqiRe0vIhkzisTKNWQA0M/shZH2uS/PikcQve+h94ZZD+EgeUwSA+20OqTQS4IQ2ZZDhS/6ZBEWEgqaBXoZR5oN/oMvzSpctoNkU9CIh8ZGcLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+BjTxRe; arc=pass smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+BjTxRe"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1271195d2a7so9225621c88.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 12:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775504889; cv=none;
        d=google.com; s=arc-20240605;
        b=eiFvUI/0O3JFr3F6a4POquo1cFnNQqWqGncRTgDwI5nVw18ppCIVNXZ9pbP5Jr6b3W
         vdBmbFlvG85MF4fo6fW8COhHAsKrqPnQkwYR5uwnOTLZHp1fYsmy9eaPgzl+avU27t/D
         r8MSKqQ3Cs9cbe/rV4eHUMr+NhjC0ESzRQ3yOXjP8sSHG2sHxR+QS/vn01R0vXDNLECn
         OtecUXyhfUnUiW9UnAf8H4Z3wLA+qD7ZSkj0jXR9H8oVhE8b9ecYGM1WcvbFlMWWWzex
         sTnrTAkk0ucwA++ZxzKF3g8GO2x/2SlVYSdlXJ2HipYVC1eV3Ze8Qtvgbudlaqa55bqo
         qeag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n+p9huaeZyNc20m6cFvaCZ1I+Q193UaM95oPQNTrZk8=;
        fh=7t8dT5wPRu7HW7l4+viT4p/aRmcZ08rtvv+H00ML2qI=;
        b=KIq+OMNhrCxggrbQyG36QbYSO9wvz1kQvbwK0BhA3hPIe96FKBHKSN/qi4ius05GUZ
         MW9PdgfVBEdA9tlZExFpL+qghdv9wTqDHBVMKBz5Iw5jLwIT4AcgdpwtrIB33fYvbEQv
         SY4viat/p2m/vMvD2k1LfVCIPeOxx/YPvIBF9C6ERPyYwPwAz70NmGn461jiFbDyanld
         y2IzL2pBVHEtTwS+515GIy+Kgr+D1G+4RJtAfwUMbgwIahSqfdz4ZN+kDM1kjz/lpiAR
         WhFjcSo9IOhYk/bt3dbaHSC3WxFltDh6tYz1R06zT5uBxfuHylowgmG4DDrJozZ/7t9N
         JJhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775504889; x=1776109689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+p9huaeZyNc20m6cFvaCZ1I+Q193UaM95oPQNTrZk8=;
        b=U+BjTxReCYJIa79IIHe/PZP+M8bbqr6/Yvl9xT8oy6mvyBTYiQc+6c9qD7gLSvmOJO
         UMlC1U9V+Nfv0ykYLiEcxPk/S+QoEdFLDC9kkltmUSZHFwNYd14bQtg2WiUge9IGMXi6
         y9bMbxcwadR+cm+7zQPkQJShiXHXUznsEY51AOycNqdmBzVeEpQcmJ1pMi4GG5ifYc5d
         phF+lfAuZ6DiONaK+qajoUFat3Q7OCLoDK9/2Wscvrt2mrVHCT15QKSmDKs8RT0mp11x
         zNgq0jy6woYLzcAaQUzQsfwLXV06TuwOkWQaQtWGIZXNexPG74QaGx3eRzHR1ihWj6nH
         BXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775504889; x=1776109689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n+p9huaeZyNc20m6cFvaCZ1I+Q193UaM95oPQNTrZk8=;
        b=DQWCMQF1VlAmggRfykR7ZB9oKmNiatUd185SSqUPtnugFTi9dW3Os/gtFNOZEAE7DD
         YCY5lRNe829CBlVEnFQZH8Fbbn5v5ViBx0wsukpaiYNxNhpJGWb7DRnITCpw+wUT9hhZ
         I9WItSKSSa0TgmGj3cMHKsGlqS7aWa+LbqJ1nInap9Lx2UqqrFlj0xFJ2htAGDGmV2Ra
         PD5BtujWtaKFIjKb1KBgy2Xgj4duEn2QtBOjNTRnZXBxPs40XpCsTioZ8qb98VP6xVAc
         I8WmOru+ZmqigruClkyKMsoG69TIuhaYs2fYIH7711ZZqOkSw5e42MVJZeF/kmfIP6/W
         /7/w==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0fnQncwIdMXHfl52CZ+6an5Gq5nkfCn2xLHVIwyfvhy1gljhmqIRcynLGtNBX6DbdOkQzJ/QOEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfE5KAB/xd7OR+4MsbuHju6TpI7EpfwdjlUybZMUeHpkbOs2JH
	zAmn8Fn6dzJjdiM9Y5OApHU2TCDwBnsMFSrTlvh2GdpC91192ovMob/E4XzCmzntxI0zqcqK7Z7
	oQnvHrJsMXXFkZALwXiFmkGgG+YLBbw==
X-Gm-Gg: AeBDieva/ulzpbS0IDMeuhuVv6ZXuOHZy23pDLILYOOOssU1wWl3wdBjrT5tr/GUO7C
	090K58FXTnU/Hwwl+6u7mP4w1NxSXRw37RzmVihyzAoKqmVVKgZJHjJ9eI7qJ1KCsZg2/HwmuZK
	5PQ20EBApcTQdkESfd9FVrGUcLjA6gzlAzBZjp9gpZAxwGfdXD9otK2FIjItyIZ21x2BpvenwNW
	PJ98fd6ccP4rz/ePN8SeLvWHldikWD8ofB+qdrC5F7q6tmwoqh567sgC4THz19VvvjoKmoQLZo6
	sH+2E3U=
X-Received: by 2002:a05:7022:ea2f:b0:11a:e426:911a with SMTP id
 a92af1059eb24-12bfb70b6aamr7852006c88.15.1775504888403; Mon, 06 Apr 2026
 12:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405184247.2690-2-ravis.opensrc@gmail.com> <20260405224550.76218-1-sj@kernel.org>
In-Reply-To: <20260405224550.76218-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Mon, 6 Apr 2026 12:47:56 -0700
X-Gm-Features: AQROBzBpPbsPlwve819G7eO28GC1duFxJHiGRdlflbmAq_VezuBZJYhpR-us9Gg
Message-ID: <CALa+Y14oWqu5+DbkENy7GgBjc=dCbFTaoOCr1i4=9CN-ZNRgEA@mail.gmail.com>
Subject: Re: (sashiko review) [PATCH v6 1/1] mm/damon: add node_eligible_mem_bp
 and node_ineligible_mem_bp goal metrics
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 5, 2026 at 3:45=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote:
>
>
> Ravi, thank you for reposting this patch after the rebase.  This time sas=
hiko
> was able to review this, and found good points including things that dese=
rve
> another revision of this patch.
>
> Forwarding full sashiko review in a reply format with my inline comments =
below,
> for sharing details of my view and doing followup discussions via mails. =
 Ravi,
> could you please reply?
>

Thanks SJ, providing your comments on top of sashiko's review is very helpf=
ul.

> > # review url: https://sashiko.dev/#/patchset/20260405184247.2690-2-ravi=
s.opensrc@gmail.com
> > # start of sashiko.dev inline review
> > commit 5f6ea8da06d136b84d97827777acf2b07047d42c
> > Author: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> > mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal metr=
ics
> >
> > This commit adds quota goal metrics for tracking scheme-eligible and
> > ineligible memory distribution across NUMA nodes. It iterates over
> > scheme-eligible regions and uses damon_get_folio() to determine placeme=
nt.
> >
> > > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > > --- a/mm/damon/core.c
> > > +++ b/mm/damon/core.c
> >
> > [ ... ]
> >
> > > +static unsigned long damos_calc_eligible_bytes(struct damon_ctx *c,
> > > +           struct damos *s, int nid, unsigned long *total)
> > > +{
> > > +   struct damon_target *t;
> > > +   struct damon_region *r;
> > > +   unsigned long total_eligible =3D 0;
> > > +   unsigned long node_eligible =3D 0;
> >
> > Can total_eligible and node_eligible overflow on 32-bit architectures?
> > Since these accumulators track raw physical bytes, regions spanning mul=
tiple
> > gigabytes might wrap around the 32-bit unsigned long limit. Would it be
> > safer to use u64 or track the counts in pages instead?
>
> Makes sense.  Ravi, could we update these to use phys_addr_t?

Agreed. I'll update total_eligible, node_eligible, and the function
return type to use phys_addr_t throughout damos_calc_eligible_bytes().

>
> >
> > > +
> > > +   damon_for_each_target(t, c) {
> > > +           damon_for_each_region(r, t) {
> > > +                   phys_addr_t addr, end_addr;
> > > +
> > > +                   if (!__damos_valid_target(r, s))
> > > +                           continue;
> >
> > Should this loop also check damos_core_filter_out()? By only checking
> > __damos_valid_target(), it seems memory explicitly excluded by user-def=
ined
> > region filters (like target ID or memcg limits) is still counted as
> > eligible, which might inflate the total and affect the quota tuning loo=
p.
>
> No, we intentionally defined "eligible" based on only the access pattern.=
  We
> may be able to extend this to apply filters in future, if we find a use c=
ase.
> But, for now, I'd suggest keeping this as is for now.
>

Got it. Will keep it as is.

> >
> > > +
> > > +                   /* Convert from core address units to physical by=
tes */
> > > +                   addr =3D r->ar.start * c->addr_unit;
> > > +                   end_addr =3D r->ar.end * c->addr_unit;
> > > +                   while (addr < end_addr) {
> >
> > Could this unbounded loop cause CPU soft lockups? Since DAMON regions c=
an
> > span hundreds of gigabytes, executing millions of folio lookups sequent=
ially
> > without a cond_resched() could monopolize the CPU.
>
> Good point.  Most DAMOS action implementations are also doing cond_resche=
d()
> per region.  Ravi, could we add cond_resched() per region to this functio=
n,
> too?

Will add cond_resched() at the end of each region's processing.

>
> >
> > > +                           struct folio *folio;
> > > +                           unsigned long folio_sz, counted;
> > > +
> > > +                           folio =3D damon_get_folio(PHYS_PFN(addr))=
;
> >
> > What happens if this metric is assigned to a DAMON context configured f=
or
> > virtual address space monitoring? If the context uses DAMON_OPS_VADDR,
> > passing a user-space virtual address to PHYS_PFN() might cause invalid
> > memory accesses or out-of-bounds page struct reads. Should this code
> > explicitly verify the operations type first?
>
> Good finding.  We intend to support only paddr ops.  But there is no guar=
d for
> using this on vaddr ops configuration.  Ravi, could we add underlying ops
> check?  I think damon_commit_ctx() is a good place to add that.  The chec=
k
> could be something like below?
>

I plan to add the ops type check directly in the metric functions
(damos_get_node_eligible_mem_bp and its counterpart) rather than in
damon_commit_ctx(). The functions will return 0 early
if c->ops.id !=3D DAMON_OPS_PADDR.

That said, if you prefer the damon_commit_ctx() validation approach to
reject the configuration outright, I can implement it that way instead.
Please let me know your preference.

> '''
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -1515,10 +1515,23 @@ static int damon_commit_sample_control(
>  int damon_commit_ctx(struct damon_ctx *dst, struct damon_ctx *src)
>  {
>         int err;
> +       struct damos *scheme;
> +       struct damos_quota_goal *goal;
>
>         dst->maybe_corrupted =3D true;
>         if (!is_power_of_2(src->min_region_sz))
>                 return -EINVAL;
> +       if (src->ops.id !=3D DAMON_OPS_PADDR) {
> +               damon_for_each_scheme(scheme, src) {
> +                       damos_for_each_quota_goal(goal, &scheme->quota) {
> +                               switch (goal->metric) {
> +                               case DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP:
> +                               case DAMOS_QUOTA_NODE_INELIGIBLE_MEMPBP:
> +                                       return -EINVAL;
> +                               }
> +                       }
> +               }
> +       }
>
>         err =3D damon_commit_schemes(dst, src);
>         if (err)
> '''
>
> >
> > > +                           if (!folio) {
> > > +                                   addr +=3D PAGE_SIZE;
> > > +                                   continue;
> > > +                           }
> > > +
> > > +                           folio_sz =3D folio_size(folio);
> > > +                           /*
> > > +                            * Clip to region boundaries to avoid cou=
nting
> > > +                            * bytes outside the region when folio sp=
ans
> > > +                            * region boundaries.
> > > +                            */
> > > +                           counted =3D min(folio_sz, (unsigned long)=
(end_addr - addr));
> >
> > Does this accurately calculate the remaining bytes if the region starts=
 at an
> > unaligned offset within a large folio? folio_size() returns the full si=
ze
> > of the folio, so this calculation might overestimate the eligible bytes=
 by
> > not accounting for the initial offset within the folio.
> >
> > > +                           total_eligible +=3D counted;
> > > +                           if (folio_nid(folio) =3D=3D nid)
> > > +                                   node_eligible +=3D counted;
> > > +
> > > +                           addr +=3D folio_sz;
> >
> > Can this pointer advancement overshoot the end of the current folio? If
> > addr was unaligned, adding the full folio_sz will skip past the beginni=
ng
> > of the next contiguous physical memory folio.
>
> Above two points make sense to me.  Ravi, could we fix these?
>

 Will fix it. Will calculate the exact overlap between the
 region [addr, end_addr) and the folio's actual range.

> >
> > > +                           folio_put(folio);
> > > +                   }
> > > +           }
> > > +   }
> > > +
> > > +   *total =3D total_eligible;
> > > +   return node_eligible;
> > > +}
> >
> > [ ... ]
> >
> > > +static unsigned long damos_get_node_ineligible_mem_bp(struct damon_c=
tx *c,
> > > +           struct damos *s, int nid)
> > > +{
> > > +   unsigned long total_eligible =3D 0;
> > > +   unsigned long node_eligible;
> > > +
> > > +   if (nid < 0 || nid >=3D MAX_NUMNODES || !node_online(nid))
> > > +           return 0;
> > > +
> > > +   node_eligible =3D damos_calc_eligible_bytes(c, s, nid, &total_eli=
gible);
> > > +
> > > +   /* No eligible memory anywhere - ratio is undefined, return 0 */
> > > +   if (!total_eligible)
> > > +           return 0;
> > > +
> > > +   /* Compute ineligible ratio directly: 10000 - eligible_bp */
> > > +   return 10000 - mult_frac(node_eligible, 10000, total_eligible);
> > > +}
> >
> > Does this return value match the documented metric? The formula compute=
s the
> > percentage of the system's eligible memory located on other NUMA nodes,
> > rather than the amount of actual ineligible (filtered out) memory resid=
ing
> > on the target node. Could this semantic mismatch cause confusion when
> > configuring quota policies?
>
> Nice catch.  The name and the documentation are confusing.  We actually
> confused a few times in previous revisions, and I'm again confused now.  =
IIUC,
> the current implementation is the intended and right one for the given us=
e
> case, though.  If my understanding is correct, how about renaming
> DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP to
> DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP_COMPLEMENT, and updating the documentati=
on
> together?  Ravi, what do you think?
>

Agreed, the current name is confusing. How about
DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP_OFFNODE?

The rationale is that this metric measures "eligible memory that is off
this node" (i.e., on other nodes).

 I think "offnode" conveys the physical meaning more directly than "complem=
ent".
That said, I'm happy to go with "complement" if you prefer.
both are clearer than "ineligible".

> >
> >
> > # end of sashiko.dev inline review
> > # review url: https://sashiko.dev/#/patchset/20260405184247.2690-2-ravi=
s.opensrc@gmail.com
>
>
> Thanks,
> SJ
>

Best Regards,
Ravi.
> # hkml [1] generated a draft of this mail.  You can regenerate
> # this using below command:
> #
> #     hkml patch sashiko_dev --for_forwarding \
> #             20260405184247.2690-2-ravis.opensrc@gmail.com
> #
