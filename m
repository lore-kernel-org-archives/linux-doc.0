Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DC9357D07
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 04:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782369; cv=none; b=af2EWJbvoJk0WEg1K+ySTurcBzaFJIzmPjNt8mhmjSalnPGp2wgiDYEVRa+TbSn44WCGOf4lZtzZkuRpt9YE2hCMtlVs5K193m7G1FAwFXHWE43hv+1hdP80/3rZ3wCdixPhUfZlLKqDFjEubtr6xGgPsh0r7JSseBm37FISBAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782369; c=relaxed/simple;
	bh=yjtQDRTFkCv2NgE2SMmGx7PrOqjHbbnr9k3VYD4ywco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6xI+lw1dAoMjtBxg2i7vGlbXV7ozfYDvij00XhJ91rQn+sE2pFVAt7rKiO5aoJVTKvyauwSYTQ5M/6sXVvN0oQ6G5sC+PiOQPm/i6774Rdr68dDGSJ6HagY1ru9cL4cBaVi14jJhyPuXI/KMSPERQD98wVMJaYneMEM5sYFm9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+LZ30AZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+LZ30AZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116591F00A3F
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 04:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784782356;
	bh=Brv9y6V5w0MiExnU3TiEoog1ZvKke2eRspfqamq76bo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P+LZ30AZenf4hexMSr3HDnRuufhp4XvpSwkoQjW2a9iJSzdlzVbAnyKk8NJQnoly6
	 z17w30H12eSK/xD9WZ+9mMaViROMcMzJhGz88jZJV0YnkYhMPTzwDy54yos2T7Dckf
	 SmLenuaoxroaqKtl0ELglqSOeQyG6b4Zcqw4E0FN/3zHU0rAEOp3Yo7vmssJ4hJiuY
	 IOHGcvkaxXF1sm/B6nulfJbsTePkGNvrJ2AQaa3dL8ZOjOP0/rqDUekyjQdnc1txr0
	 btaZ2weUDkhe3M+MlilvO6+k6Gs5IcLaLQDgahh1zp+vjUTkLfivRTVpwK2BTt0IYO
	 +od10dOtDv7MA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15d111ca99so27625966b.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 21:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoeENo3T/D5zcK0umcfe1dH5A3xJCxQzQRRZEjnIcak7Pq5Njle0Bx5nbQi4DBt/xYN2psBVuM3T5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2NCgfu6s9iPK2B3RR+IGlQQy0FHmS3vBu84+MAlFh8QKppR0
	leZ1IFKiHYbRocPTzgHYjyyPPLy1lrFoRDqaGZ5KXRbKo1kMhAKU0Coe99II3LKzZPRyXIMn1Hy
	05D8vBxe+HFGTiheinTAyDNxEyXBzT+I=
X-Received: by 2002:a17:907:709:b0:c16:581a:2a51 with SMTP id
 a640c23a62f3a-c1c508a5af4mr68122066b.12.1784782349803; Wed, 22 Jul 2026
 21:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com> <amF7_GB5Rl6OJmt4@cmpxchg.org>
In-Reply-To: <amF7_GB5Rl6OJmt4@cmpxchg.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 22 Jul 2026 21:52:18 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
X-Gm-Features: AUfX_my3zrri2W3U_84gLS9FldggdRqywrOu5bVpTll4NFvwZ9XNk7xwwgEDTek
Message-ID: <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 7:27=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Fri, Jul 17, 2026 at 04:51:51PM +0800, Hao Jia wrote:
> > @@ -1369,7 +1402,7 @@ static void shrink_worker(struct work_struct *w)
> >                       goto resched;
> >               }
> >
> > -             ret =3D shrink_memcg(memcg);
> > +             ret =3D shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
> >               /* drop the extra reference */
> >               mem_cgroup_put(memcg);
> >
> > @@ -1493,7 +1526,7 @@ bool zswap_store(struct folio *folio)
> >       objcg =3D get_obj_cgroup_from_folio(folio);
> >       if (objcg && !obj_cgroup_may_zswap(objcg)) {
> >               memcg =3D get_mem_cgroup_from_objcg(objcg);
> > -             if (shrink_memcg(memcg)) {
> > +             if (shrink_memcg(memcg, 1)) {
>
> Why 64 for the global limit but only 1 for the cgroup limit? That
> seems arbitrary in multiple ways.

I suggested that we keep the writeback here without batching and do
that change separately, mainly out of abundance of caution as
writeback is done synchronously here so the extra latency could be
problematic. I think we probably want to measure the performance
impact of that separately.

That being said, this path is potentially too expensive anyway due to
the flush, but I would rather we do some basic measurements before
batching here.

What do you think?

> Direct reclaim, kswapd, proactive reclaim, cgroup limit reclaim use
> SWAP_CLUSTER_MAX for the batch size near-universally. It's magic too
> to be sure, but at least you wouldn't have to make up new magic?
>
> Otherwise, the patch looks good to me.
