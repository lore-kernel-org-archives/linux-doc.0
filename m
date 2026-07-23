Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5C37189A
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824818; cv=none; b=iHrGgB5q8738RReDDPPtnlns3CVhlDDFdOVnQ6JbWhS3Kg1S9BP0VvMeODPEXwX1nluAn9ZHx1aRl4UlZsucEjiGjhkgomFlY6uVHjI1IGBXcfH8ohShvYzzfc9iYimJo+ZpwoAHBF2N9siCvvRsxfxGmDE8mxhwEv2RxAenfZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824818; c=relaxed/simple;
	bh=/vfsRfeT3phJEGQInn81u01fiKlYvRCYThWT0KL3NiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EuKkUp3ZbezsOdPehvKzOAES1/sIKhGAvmScJ1SCG2HD89lKMWfehYJDilxDuWbtb2CJ71t1Tzc80xMgE13I1HDdwnxr99xsFZoFq8HBalugwXq1LaMWowe8eX4gRTZzbvvbR7ngzLNU1eYEuhl+Qsh1y9d4NJ+6tKEarh5mEe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFEC1F00A3E
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 16:40:14 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so94732066b.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 09:40:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrFhPuwueTfSmOjMV2qWUqGG9xEhlHBHBgEC3QL9vqJ6vwNGHOuZzkUMAHXKo587tkP+X1BzhhJn5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhKopryCXS1QalhTZ9KKb/UUg6O4zcYlgm+Vkl4Ll5AiWpQu4
	Naa74RkbDBXyqSoHQ/sej35lHwwO21Ea8EEasVCkvdFVv++LGe7wdTODv8WdRBISZZ+uJ/7aZMc
	fNj81UM0q8lhiy/SvusjB02w7k4DujK4=
X-Received: by 2002:a17:907:3e95:b0:c12:9b98:209e with SMTP id
 a640c23a62f3a-c1c50779e7cmr200383466b.23.1784824788367; Thu, 23 Jul 2026
 09:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com> <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com> <amIdU1lFxqxTI3Gc@cmpxchg.org>
In-Reply-To: <amIdU1lFxqxTI3Gc@cmpxchg.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 23 Jul 2026 09:39:35 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
X-Gm-Features: AUfX_mzK8yuJuGvUphs6dtuGvP6iNql6l9OJrVUX_BJAcI_Tz-dPlTb80kJnY38
Message-ID: <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 6:55=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Wed, Jul 22, 2026 at 09:52:18PM -0700, Yosry Ahmed wrote:
> > On Wed, Jul 22, 2026 at 7:27=E2=80=AFPM Johannes Weiner <hannes@cmpxchg=
.org> wrote:
> > >
> > > On Fri, Jul 17, 2026 at 04:51:51PM +0800, Hao Jia wrote:
> > > > @@ -1369,7 +1402,7 @@ static void shrink_worker(struct work_struct =
*w)
> > > >                       goto resched;
> > > >               }
> > > >
> > > > -             ret =3D shrink_memcg(memcg);
> > > > +             ret =3D shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
> > > >               /* drop the extra reference */
> > > >               mem_cgroup_put(memcg);
> > > >
> > > > @@ -1493,7 +1526,7 @@ bool zswap_store(struct folio *folio)
> > > >       objcg =3D get_obj_cgroup_from_folio(folio);
> > > >       if (objcg && !obj_cgroup_may_zswap(objcg)) {
> > > >               memcg =3D get_mem_cgroup_from_objcg(objcg);
> > > > -             if (shrink_memcg(memcg)) {
> > > > +             if (shrink_memcg(memcg, 1)) {
> > >
> > > Why 64 for the global limit but only 1 for the cgroup limit? That
> > > seems arbitrary in multiple ways.
> >
> > I suggested that we keep the writeback here without batching and do
> > that change separately, mainly out of abundance of caution as
> > writeback is done synchronously here so the extra latency could be
> > problematic. I think we probably want to measure the performance
> > impact of that separately.
> >
> > That being said, this path is potentially too expensive anyway due to
> > the flush, but I would rather we do some basic measurements before
> > batching here.
> >
> > What do you think?
>
> It's not an unknown, right? We know this works for direct reclaimers,
> cgroup limit reclaim e.g., and what the latency implications are.
>
> Because of how reclaim works, we also know it'll call zswap_store() in
> batches of SWAP_CLUSTER_MAX. If we don't batch here, they're likely to
> each call shrink_memcg() once we're at the limit - while still risking
> rejections due to compressibility differences.
>
> My worry is that if we start with an inconsistency, we'll be stuck
> with it for a long time.
>
> I'd rather start with the clean, consistent version. Dial it back only
> if we have data to justfiy the complication that we can put into a
> comment and the changelog that outlines why exactly it's different.

I am fine with doing that and basically always using NR_ZSWAP_WB_BATCH
as the batch size in shrink_memcg(), but I would be more comfortable
if we did some sanity testing.

Hao, would you be able to do some smoke testing with NR_ZSWAP_WB_BATCH
used for all paths, and memory.zswap.max set in a way that induces
writeback? You can probably set memory.zswap.max to 1% of total memory
instead of the global pool limit and rerun the same test.
