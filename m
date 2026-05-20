Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1B3438A2
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261741; cv=pass; b=WmmVAuw8UTPomWvwf73ahPtqHRtxJEBdmDDo8K1vmeUU0fOnGgD+/AYYeWfTWHpMqV+BQpRMfrHF2NlCkoag3eG8V7eOGhzVAiSa6xM4UdHJ5DiX/nq4CWG1YCCyzhzkYW1bNp2zOeawXtJTrGIOhWUfpJwCuE2+At8QpUOo7yY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261741; c=relaxed/simple;
	bh=wupLUxHCLNIn82ENANfRaN7CKoGhY1WDOE+kOFYZXFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoeijJpuiDoJnW36p8VDPFAtTcaxGtSaW/N3dCbLy2pHQPC6KK/Pi0yZU7Rg4O9Cp8kPrnkDETSdaGWqkAkbctMtzLlvYHy+0XX+9C1WpKUepgjfz5Dr18Yy4VXZmFe7dydiTOMMpmyxn7/p6zXM3LEVkQaOLhi3opHHEiWFg5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMVF/5TY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oa1rqCQF; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMVF/5TY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oa1rqCQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779261739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xx2spnpzWhoLag/qhNvFLWpyojrRWUzv888prY2ah/g=;
	b=EMVF/5TY9Z+ov2XErYebG2/YTaGwrc1Nd9r8MMGS/RN6tuGHGOMovsMGKyogf7ENieQ7i7
	/iE0y6TGN+fmY3TzxArCSnMOx91cdYhNPW8is5IspVIEagpFM8eOe3U1ifHLN8cTwBNTaC
	ECRRBG/vA+ROaOP3EiSTcN87Kbfv7Sk=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-Isofm5QTMz2_Jurb3vWTOg-1; Wed, 20 May 2026 03:22:17 -0400
X-MC-Unique: Isofm5QTMz2_Jurb3vWTOg-1
X-Mimecast-MFC-AGG-ID: Isofm5QTMz2_Jurb3vWTOg_1779261737
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bf0b47d2e2so85286697b3.3
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 00:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779261737; cv=none;
        d=google.com; s=arc-20240605;
        b=MI3kZu4frS23PTzsYnCFF+8OFBXw421jCVbMVrXpl5mwheSL9gMD8KRovXPq/+T8CY
         AS6UAX580Od8vqZcd44IFsT6HM8EPrHQw+KNed90AxHU/6n+ETHgbpOnDvfT9h071Xns
         It8mFX1gKevMTbmhusVeK4B0mMUi2ieFpLmVF57D6l+ioGfw3CfVMCHXF3hjMnghfqRT
         ApsOJ3vm8zmRKX6UTcqFR5XbbgFuw+nndYpuSO2m99JgRd5V+oewgkhexx3cTu1gdba4
         lA8Ks1ZFif2XL1um0COFHe4Nn+VtVdbvWoa666I8+luY2stcgRG0q0llnToSTkdaJTmP
         Vugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xx2spnpzWhoLag/qhNvFLWpyojrRWUzv888prY2ah/g=;
        fh=/ZxinDeEz/388IFVl6UmbzG+Fu6yC4ShleD80k9WPhM=;
        b=V6alsZkWDmYFdV6EStZzTxjNhUzPtVPCtnrnwoqVVE5IvPyDS3ZmMBrl39qwLJPv1G
         4dsqzi7jE5qkC5kPLiKdl2hBrZVGM76kL76OiERBUBbm+osa6xrIDq2VCkQhotzxknDQ
         +DSnEczbg8pV71tO2T1E4oAvXyvM0c2CDIrADaF6DaQyq0lSy69lomdKOnM3bIKFbsAd
         knF+pVPybReH4wAzJ9PMB8iDCl1TeXeXl1wj34K0d8rt9kQpWIWA0ANo1Ad3l3xaC8gY
         Cys81+LxHyzLvEe9n/tp11yn/krlI0Iw+J3lW8QdBaSRr5MQUi/BIfPq1y4Ri4wkeL37
         SztQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779261737; x=1779866537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx2spnpzWhoLag/qhNvFLWpyojrRWUzv888prY2ah/g=;
        b=Oa1rqCQFPpAVZy+6jKuXMrN0EhcTbdd4X3A1SSvMMYf1L4IFO8RuLA9WFmxTGXdBsk
         xpVKlJvzsIYrwxFC5KJyLICyxBSCMgpltTU7ICbRKhahbxQB5bWCnByFWYfbsD29wlUK
         do2GE/AsWhvX+3vs5VHYbtQbLWxjdw/lTA5dxkR4sR01wW5HX6HX38U6F3WaCySqL3fm
         JvCX4nD49qrOE9yAB8eTteCzKaAbqYG/RFPmKeZ13omA4NlaUe6Gc5EFUcn/yjHdMri5
         EKO+n5m/p7Dm1eY6YCzZ6O5IIiKEcv1NGG22VscjRNJ6TeDHXADB8w5pKbHfKUmu7WOy
         SVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779261737; x=1779866537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xx2spnpzWhoLag/qhNvFLWpyojrRWUzv888prY2ah/g=;
        b=TjWXJCejR+g3nlkmqXoWhMSixMKq/arwOUUTz3rm1IH7Orcs93yx1TWpcwopO5CbpJ
         E1YWL1bndO0IybcdSP0zJ44oQbfp4RWfQAVVbH5Z+TRIOQ/aVWyQFH78yO1BtX6pIbvf
         XAIkRXtMnpDSlITSVDOqKBjcR6OdGRmDHFp82hlDNMusl9aS7SMm+v1YgygQvApeqQbn
         1hP4iRtG43jt4JxEgzNd5XEmtnzUA8+YcAobo2a/dNnOolbFrA8DAgVUDLEbjhVW0L5l
         cM+Nfr85n7x0CeSpWw0RC63DqXBWNpfwzUm+VHKpNFCXyMQVrFQfzQm+TDitZKC9QxR8
         2NYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ce5UfanMYf8GAzuEM04IqOxt6UGEdQ4qQbPoIP+gVr4o8cCMqIugwCZUGcH+nqfED89YZkudI6Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXUWVW6fX7ueZ0Fq6JQNGkmltQ9E8RtZHDeNS9gCOeXnsqvqXR
	SuvRXmtoM33cbMh/Bzy7jQQg7Uigexr0RswNlFE4Y+8PBknQs9BYFlB1yRmKTEOFn1qM6FNNiOa
	ZvvA37wxCeSbIS+wJdS/8GErudhVslrcVknUTnicD8Eml3rsZmUcTmSqZh1C6xAOP8iGKua6Y1B
	xqtwyjrzHnwDE+h7zPfC9qrZAkVT3wHEornIcc
X-Gm-Gg: Acq92OE2j/5Lu5x4Biyiuix8eCJZ95VgBrJlJ1LJjDh/Ho2LutsUpA5k11gGt4vDFye
	in371EOUeqjZ8dcXeZmqS939xcqAgq6odvh+W2YInoqzS4ZOcnYkwRUXg1YUP63XnK0yIy5IWST
	FVOstv/3db7mLQNlN3C+pa5h8Khfo+0dOq75LEZh0/4ooKj2QObnyirvhCi/6Mf16BHpqXOywJX
	LpvZA==
X-Received: by 2002:a05:690c:84:b0:7b5:88ec:91b0 with SMTP id 00721157ae682-7c95d1d9e08mr253826627b3.48.1779261736924;
        Wed, 20 May 2026 00:22:16 -0700 (PDT)
X-Received: by 2002:a05:690c:84:b0:7b5:88ec:91b0 with SMTP id
 00721157ae682-7c95d1d9e08mr253826267b3.48.1779261736472; Wed, 20 May 2026
 00:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com>
 <20260519-cgroup-dmem-memcg-double-charge-v2-1-db4d1407062b@redhat.com>
In-Reply-To: <20260519-cgroup-dmem-memcg-double-charge-v2-1-db4d1407062b@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 20 May 2026 09:22:02 +0200
X-Gm-Features: AVHnY4KBhaLJ6-NKlQm0NilZQ57LVIjKu_pC_jcyJuZg3rPObvW4KXxjSx93n3c
Message-ID: <CADSE00L4R6PGtP6yGTZ6Ym=tvOZEYHRbuEtEu0BKX294HN6qXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm/memcontrol: add dmem charge/uncharge functions
To: Eric Chanudet <echanude@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
	Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maxime Ripard <mripard@redhat.com>, Dave Airlie <airlied@gmail.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 6:01=E2=80=AFPM Eric Chanudet <echanude@redhat.com>=
 wrote:
>
> Add mem_cgroup_dmem_charge() and mem_cgroup_dmem_uncharge() to allow
> dmem pool allocations to optionally be double-charged against the memory
> controller. Take the struct cgroup from the dmem pool's css as there is
> no convenient object exported to represent these allocations. These will
> resolve the effective memory css from that cgroup and perform the
> charge.
>
> Introduce a MEMCG_DMEM stat counter to memory.stat to make the cgroup's
> dmem charge visible.
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>

Reviewed-by: Albert Esteve <aesteve@redhat.com>

> ---
>  include/linux/memcontrol.h | 16 ++++++++++++
>  mm/memcontrol.c            | 65 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 81 insertions(+)
>
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index dc3fa687759b45748b2acee6d7f43da325eb50c1..8e1d49b87fb64e6114f3eb920=
293e14920290fe7 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -39,6 +39,7 @@ enum memcg_stat_item {
>         MEMCG_ZSWAP_B,
>         MEMCG_ZSWAPPED,
>         MEMCG_ZSWAP_INCOMP,
> +       MEMCG_DMEM,
>         MEMCG_NR_STAT,
>  };
>
> @@ -1872,6 +1873,21 @@ static inline bool mem_cgroup_zswap_writeback_enab=
led(struct mem_cgroup *memcg)
>  }
>  #endif
>
> +#if defined(CONFIG_MEMCG) && defined(CONFIG_CGROUP_DMEM)
> +bool mem_cgroup_dmem_charge(struct cgroup *cgrp, unsigned int nr_pages,
> +                           gfp_t gfp_mask);
> +void mem_cgroup_dmem_uncharge(struct cgroup *cgrp, unsigned int nr_pages=
);
> +#else
> +static inline bool mem_cgroup_dmem_charge(struct cgroup *cgrp,
> +                                         unsigned int nr_pages, gfp_t gf=
p_mask)
> +{
> +       return true;
> +}
> +static inline void mem_cgroup_dmem_uncharge(struct cgroup *cgrp,
> +                                           unsigned int nr_pages)
> +{
> +}
> +#endif
>
>  /* Cgroup v1-related declarations */
>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index c03d4787d466803db49cdaa90e6d6ba426b7afe2..91a7ac16b6eac2d6c3700b688=
5a068bf8b640706 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -433,6 +433,7 @@ static const unsigned int memcg_stat_items[] =3D {
>         MEMCG_ZSWAP_B,
>         MEMCG_ZSWAPPED,
>         MEMCG_ZSWAP_INCOMP,
> +       MEMCG_DMEM,
>  };
>
>  #define NR_MEMCG_NODE_STAT_ITEMS ARRAY_SIZE(memcg_node_stat_items)
> @@ -1606,6 +1607,9 @@ static const struct memory_stat memory_stats[] =3D =
{
>  #ifdef CONFIG_NUMA_BALANCING
>         { "pgpromote_success",          PGPROMOTE_SUCCESS       },
>  #endif
> +#ifdef CONFIG_CGROUP_DMEM
> +       { "dmem",                       MEMCG_DMEM              },
> +#endif
>  };
>
>  /* The actual unit of the state item, not the same as the output unit */
> @@ -5909,6 +5913,67 @@ static struct cftype zswap_files[] =3D {
>  };
>  #endif /* CONFIG_ZSWAP */
>
> +#ifdef CONFIG_CGROUP_DMEM
> +/**
> + * mem_cgroup_dmem_charge - charge memcg for a dmem pool allocation
> + * @cgrp: cgroup of the dmem pool
> + * @nr_pages: number of pages to charge
> + * @gfp_mask: reclaim mode
> + *
> + * Charges @nr_pages to @memcg. Returns %true if the charge fit within
> + * @memcg's configured limit, %false if it doesn't.
> + */
> +bool mem_cgroup_dmem_charge(struct cgroup *cgrp, unsigned int nr_pages,
> +                           gfp_t gfp_mask)
> +{
> +       struct cgroup_subsys_state *mem_css;
> +       struct mem_cgroup *memcg;
> +
> +       /* CGROUP_DMEM and MEMCG guarantees this cannot be NULL. */
> +       mem_css =3D cgroup_get_e_css(cgrp, &memory_cgrp_subsys);
> +
> +       /* Use the memcg, if any, of the dmem cgroup. */
> +       memcg =3D mem_cgroup_from_css(mem_css);
> +       if (!memcg || mem_cgroup_is_root(memcg)) {
> +               css_put(mem_css);
> +               return false;
> +       }
> +
> +       if (try_charge_memcg(memcg, gfp_mask, nr_pages)) {
> +               css_put(mem_css);
> +               return false;
> +       }
> +
> +       mod_memcg_state(memcg, MEMCG_DMEM, nr_pages);
> +       css_put(mem_css);
> +       return true;
> +}
> +
> +/**
> + * mem_cgroup_dmem_uncharge - uncharge memcg from a dmem pool allocation
> + * @cgrp: cgroup of the dmem pool
> + * @nr_pages: number of pages to uncharge
> + */
> +void mem_cgroup_dmem_uncharge(struct cgroup *cgrp, unsigned int nr_pages=
)
> +{
> +       struct cgroup_subsys_state *mem_css;
> +       struct mem_cgroup *memcg;
> +
> +       /* CGROUP_DMEM and MEMCG guarantees this cannot be NULL. */
> +       mem_css =3D cgroup_get_e_css(cgrp, &memory_cgrp_subsys);
> +
> +       memcg =3D mem_cgroup_from_css(mem_css);
> +       if (!memcg || mem_cgroup_is_root(memcg)) {
> +               css_put(mem_css);
> +               return;
> +       }
> +
> +       mod_memcg_state(memcg, MEMCG_DMEM, -nr_pages);
> +       refill_stock(memcg, nr_pages);
> +       css_put(mem_css);
> +}
> +#endif /* CONFIG_CGROUP_DMEM */
> +
>  static int __init mem_cgroup_swap_init(void)
>  {
>         if (mem_cgroup_disabled())
>
> --
> 2.52.0
>

