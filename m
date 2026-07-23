Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A3338F239
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826710; cv=none; b=RCMAlSYZfuPiVLhIzxxzVLGVxWmv+DnIEwd5TFZD+5GegBHZylKyPSRY5Ll93fRPOJOczDzug+MmTva4/G9iRsMpWM1Z6ddx7yCOYdX8yuznnH3iRUxZPPzSu0aMC1R4LAFMym0RUUUmBmiqndsI7APCfXCZLwYc+/yHTDYv8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826710; c=relaxed/simple;
	bh=tUTBnTpIFePxO3CeYW+TX9+SIeQSbzlag/dkm7OOyH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tp6O0QuiAeTXfZ/mcX7jf0jnujhr5HLMXK1bXeyW/TVndwTXTbLsZGvKFJaBi4gYX8KcgrE/toxFx0xj5bVMrTXj2dpf7rWWWwJNb1taHdNeu/vP/v4aFAvMQX22u+XVOTz31z8gyRSRoCdA/U2FVLRSSUHoz6hAOTEHyU+YRrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=nSezCHZg; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="nSezCHZg"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92ea24a2dbfso84892785a.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1784826702; x=1785431502; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKoEFKHAauD9ChUUVwq+5WmbWXEzRCLgc2RAxWNhYLo=;
        b=nSezCHZgvzUe4adwbOp3wXMp4Fnpo8guQmvCrsFBs0ZJVStaV9fveF+ysC8xNvMGvX
         lzsZeNnhvGM5gjkiUmyPgzEe2beqhVh84vemlD/4f8/wlxA6h/Vhy+GLNKPOYbvMpu+H
         MyZeln0CwvDPUnaZ+L/7KBvqnE++YMyq2rV8N3n7B9kswZQECgfsa0bZfjnn4NXfh7UF
         +vkPl9tKX7TnlhUQlmLT1xYdLWlOslxpZ+QGnK6thSaDXz8+khyijP/KDmLJFWnn0tAA
         uO+ikJAo4/KYqJlC2TX8kctS07e8sJk9/r7fqdJiKa4TeJqtz2IEI6Sj7379tXk3Oo5O
         hl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826702; x=1785431502;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oKoEFKHAauD9ChUUVwq+5WmbWXEzRCLgc2RAxWNhYLo=;
        b=JSGfogSwg6CRQVaBVVSAjmSwtCiJ9tzlDsbx1rqvWaBXGojoLP9YKkH7WOLJuo5E5p
         ayYH7g+NaQnouYB3HdERVdHKQtS7rld15Wb83KzbNb1sltaRQ3hYkaRzUit/KHeTxpdK
         3IXKdhGugXT7ymX4qJk400oycb2elwVd+zBOCvEsbGR0vXgBsyy7OSUn/01Tpd4Aq6Yu
         0FTytzTyDkirdlE5I/3AwHAP/694iyOh5DzfJ0N585Qm/kG0gopy5a2L9fpEPa0Ym9Tq
         opKG9YClJDjGyR/Hd3a6wxQOONSeCXtRV7fkzO8sw1VIsBnWB8m7YBcqmGkxUbDUjA3H
         SIyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHz+x1GffNV6Ghz8Jdm7/dAFg2D7GpTB1krcMyZKsrlgrkrHb3jXulGe4Tdp3eCFBNeyEY67+ruPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOjMPhYjHS4WGT50bl34fqScCEYAfpxvSBM8QPP+t4vLtnVllb
	LHlAgvIFRpr/uaHk+4WJ185i4b6EHTgkAOJb2Q3wMj28zXL50NkkbjXvyCu9K9/I9Fk=
X-Gm-Gg: AR+sD12CmtPeUNmnAM4Db4dyfrS/Q4IRVoLYFxS75HNyZkFuxm/bzUczodDUmGJnlAa
	P9yBj6wJpiSX/s/xSUhGuC/qUM0DzVs/XT/Q/tOlXi//3BZXe2vcxXcscNTRieuCuRrzxSMGh3f
	547UQOhFkz+0ASXgEDR/MFkx5L/rLzO1vkjdhcepHZq7oqIwq5JDAMHvMrLWbvWPu+o6JhmVu5M
	KPCBjeE9Vs28QJB4PKuOdQSXxvEtMzxg8y7jocy8MG2Uj7v3jwvVnpYC4RSgJ031S36e35YvPGB
	gssSZvXufvM+ImKKtLnbZ5fe8kiBh/38avseGJgXxVVF8CrM0nlg5YHQbNv5l2XpscM22PmlVQb
	SEYlY9z/5QS/+3V2XPtEPrMmJjY9ByEY8IWnRa18bbHQJWOu9gk715tbQPHhkHnlPrP+izeknJp
	x0
X-Received: by 2002:a05:620a:1728:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-93103907cd9mr404452485a.11.1784826702204;
        Thu, 23 Jul 2026 10:11:42 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68743c8sm466141585a.7.2026.07.23.10.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:11:41 -0700 (PDT)
Date: Thu, 23 Jul 2026 13:11:40 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org,
	tj@kernel.org, shakeel.butt@linux.dev, mhocko@kernel.org,
	mkoutny@suse.com, nphamcs@gmail.com, chengming.zhou@linux.dev,
	muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in
 shrink_memcg()
Message-ID: <amJLTLQ5A9EDWcxF@cmpxchg.org>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com>
 <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org>
 <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>

On Thu, Jul 23, 2026 at 09:39:35AM -0700, Yosry Ahmed wrote:
> On Thu, Jul 23, 2026 at 6:55 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Wed, Jul 22, 2026 at 09:52:18PM -0700, Yosry Ahmed wrote:
> > > On Wed, Jul 22, 2026 at 7:27 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > > >
> > > > On Fri, Jul 17, 2026 at 04:51:51PM +0800, Hao Jia wrote:
> > > > > @@ -1369,7 +1402,7 @@ static void shrink_worker(struct work_struct *w)
> > > > >                       goto resched;
> > > > >               }
> > > > >
> > > > > -             ret = shrink_memcg(memcg);
> > > > > +             ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
> > > > >               /* drop the extra reference */
> > > > >               mem_cgroup_put(memcg);
> > > > >
> > > > > @@ -1493,7 +1526,7 @@ bool zswap_store(struct folio *folio)
> > > > >       objcg = get_obj_cgroup_from_folio(folio);
> > > > >       if (objcg && !obj_cgroup_may_zswap(objcg)) {
> > > > >               memcg = get_mem_cgroup_from_objcg(objcg);
> > > > > -             if (shrink_memcg(memcg)) {
> > > > > +             if (shrink_memcg(memcg, 1)) {
> > > >
> > > > Why 64 for the global limit but only 1 for the cgroup limit? That
> > > > seems arbitrary in multiple ways.
> > >
> > > I suggested that we keep the writeback here without batching and do
> > > that change separately, mainly out of abundance of caution as
> > > writeback is done synchronously here so the extra latency could be
> > > problematic. I think we probably want to measure the performance
> > > impact of that separately.
> > >
> > > That being said, this path is potentially too expensive anyway due to
> > > the flush, but I would rather we do some basic measurements before
> > > batching here.
> > >
> > > What do you think?
> >
> > It's not an unknown, right? We know this works for direct reclaimers,
> > cgroup limit reclaim e.g., and what the latency implications are.
> >
> > Because of how reclaim works, we also know it'll call zswap_store() in
> > batches of SWAP_CLUSTER_MAX. If we don't batch here, they're likely to
> > each call shrink_memcg() once we're at the limit - while still risking
> > rejections due to compressibility differences.
> >
> > My worry is that if we start with an inconsistency, we'll be stuck
> > with it for a long time.
> >
> > I'd rather start with the clean, consistent version. Dial it back only
> > if we have data to justfiy the complication that we can put into a
> > comment and the changelog that outlines why exactly it's different.
> 
> I am fine with doing that and basically always using NR_ZSWAP_WB_BATCH
> as the batch size in shrink_memcg(), but I would be more comfortable
> if we did some sanity testing.
> 
> Hao, would you be able to do some smoke testing with NR_ZSWAP_WB_BATCH
> used for all paths, and memory.zswap.max set in a way that induces
> writeback? You can probably set memory.zswap.max to 1% of total memory
> instead of the global pool limit and rerun the same test.

Please just use SWAP_CLUSTER_MAX. That's what the reclaim side which
issues the stores is also using for batching.
