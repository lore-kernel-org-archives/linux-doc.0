Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259504BC02C
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 13:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814947; cv=none; b=VQVOO1XY62Tbph8dxXelkrVCXy4UxUpukAyWvxcJukOCohcxlKgpLHVSy52uobBn4kJ8lmo2/u3YGPtZBKmR9DstOLpaKfUGw/YHzVopMpW5r/ZOyKy4x1tnnv1ZOu/JaNhe2i3VxvK+93dxKEUZjt0eNxHqaxBvmZwti8+fYQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814947; c=relaxed/simple;
	bh=PcGnm1nhz6OalWAM+8OBPe0bj+kN8RMGxEyp2+pu2/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u97umEs4acCf3hNoZJnZ7Yi+1O0C2U1DifthOOme1JHLkx25dmyRpSRp1WbJ4HHW6FRs4ac+O8d4t/81TuI6nFJu9Ad+CRAqI6NatGk58hA8couELjLeYIrVW9Sa/Klp82w34JjyIqUDpsRxJmulVS64ZtBIo2PyDYZq/3beQac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=nwctVBKE; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="nwctVBKE"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8f186025973so8782746d6.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1784814935; x=1785419735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JdlTjNa72Apcdo/QV8cbG21bSLdkYHzKHF8zUNaq1xI=;
        b=nwctVBKEkGTqB3NYBl1O1N6NbT3IS5MRJDoijb4VSpGBHqhMtzQRvoAUEYWxEfCRAJ
         EeyzbPOlL2rogqwSdr3AXBL5WWl6RSMyAoIdpOWzINHvrcOF6JHtqEUpGRTwuADTEr5C
         c6rYRqmIdzQsee2aYu7HTOdCyxz0ubacwoPL5fSEatVEQdCT4EoOC0zmJoPBKCnm2aCW
         kz+/xgtp+r4Is9Ffo5EWOaC7TnZhll8Qdyu0eQYWzcWU3z+zPN3ZyPVqHsx9r2pqiGwW
         TeiVC075M3giH+B9PCeWWIKG979nYU2wObisX0eu0ZTEEVk7p6ja26/LyA7HC4FiCfdr
         icJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784814935; x=1785419735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JdlTjNa72Apcdo/QV8cbG21bSLdkYHzKHF8zUNaq1xI=;
        b=A6EdO89hKmu3SslajLu+IYbcVPTEZBHnBTCR7f9vaPTPQPalk83p0u1Ep2Y2opL2d8
         msBaAOLwyXdzSkmn2V7wTY/4iIwH4eLDaecBKM0lj36LLwfUrE+Nb4knw3fwxB841dAX
         J71yA2c4GVwwDh7EnHExQkSAARRtGU3dx/JmY6eRKxnYl4Yvsmcrsq+VgFUA+2MZEj6h
         qbuuPC3zLC917lzAKfsSLqU4OvX0x8YeGHNKTrBB+NWl6HZxTLBBO3siBBTpk3goFRTk
         Slgu4L4cNXmDWZiG4qTAUkl3icAXKfqqF/hCLZH1bTaHbsC+4TDHuoCyCoweTcQCDCSp
         PC8g==
X-Forwarded-Encrypted: i=1; AHgh+RoBxhkFCduM+JfT3yl2ynyOvqeEEbUALYt7PgnpySVLbRe63KOb+tR6sgAFqqvCtDcDHNCW2q8F4Ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYJZ/7I6R+QlrFDt3TbwrVEoFOG73XI+vVios3R24poSUuNHPW
	KGzR8i+36dzE5dH4Ib7+eb1m6rVLPr5gq4tCGGA2W09UW635Wgg7eHNrAx9ZD0sVa4Q=
X-Gm-Gg: AR+sD11sajq6ggczR/N1WvhKtt7mm+cDB3vG9+5AYDA0J2K1/bLOicxNP3Zr1id/U2U
	sj87BRN32wibn5Tt1iVnlZ0VkEUMbVRKuMhVepjPEopKfP8x0BuoS/VEBmwR8sCFqSyAXK9ja2b
	cbh72sdjDUAd39QT1OmzgrMR7cJaLJAHb5GTXqKKWaS1VQvABFpEqajidzyBQqs/6z/8G+IgrMF
	5H3LOT4UHEF72l811nGbmte4INHOzPNWZ3Eo1mrQzJsi1vWSVuPGx/fPYDxIHgeTIbU4xSi9LIS
	GOB7N9XXTF38n7R6Ag2ILSnPR1KrTxWT65T9eoyalMsUf67uD8u4h/CXrLVyhQ3RpQVuCu9KzIr
	McYrnGcpM1FYgysp0lwdqR4zWwkYzd/6VLqFwulha4e3uZ86Hq2Y36rfhZUIa8EQEvhdmg05wFw
	yc
X-Received: by 2002:a05:6214:40d:b0:8ef:e3c9:5336 with SMTP id 6a1803df08f44-907ca356302mr35958626d6.34.1784814935519;
        Thu, 23 Jul 2026 06:55:35 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cfcsm45192186d6.44.2026.07.23.06.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:55:34 -0700 (PDT)
Date: Thu, 23 Jul 2026 09:55:31 -0400
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
Message-ID: <amIdU1lFxqxTI3Gc@cmpxchg.org>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com>
 <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>

On Wed, Jul 22, 2026 at 09:52:18PM -0700, Yosry Ahmed wrote:
> On Wed, Jul 22, 2026 at 7:27 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Fri, Jul 17, 2026 at 04:51:51PM +0800, Hao Jia wrote:
> > > @@ -1369,7 +1402,7 @@ static void shrink_worker(struct work_struct *w)
> > >                       goto resched;
> > >               }
> > >
> > > -             ret = shrink_memcg(memcg);
> > > +             ret = shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
> > >               /* drop the extra reference */
> > >               mem_cgroup_put(memcg);
> > >
> > > @@ -1493,7 +1526,7 @@ bool zswap_store(struct folio *folio)
> > >       objcg = get_obj_cgroup_from_folio(folio);
> > >       if (objcg && !obj_cgroup_may_zswap(objcg)) {
> > >               memcg = get_mem_cgroup_from_objcg(objcg);
> > > -             if (shrink_memcg(memcg)) {
> > > +             if (shrink_memcg(memcg, 1)) {
> >
> > Why 64 for the global limit but only 1 for the cgroup limit? That
> > seems arbitrary in multiple ways.
> 
> I suggested that we keep the writeback here without batching and do
> that change separately, mainly out of abundance of caution as
> writeback is done synchronously here so the extra latency could be
> problematic. I think we probably want to measure the performance
> impact of that separately.
> 
> That being said, this path is potentially too expensive anyway due to
> the flush, but I would rather we do some basic measurements before
> batching here.
> 
> What do you think?

It's not an unknown, right? We know this works for direct reclaimers,
cgroup limit reclaim e.g., and what the latency implications are.

Because of how reclaim works, we also know it'll call zswap_store() in
batches of SWAP_CLUSTER_MAX. If we don't batch here, they're likely to
each call shrink_memcg() once we're at the limit - while still risking
rejections due to compressibility differences.

My worry is that if we start with an inconsistency, we'll be stuck
with it for a long time.

I'd rather start with the clean, consistent version. Dial it back only
if we have data to justfiy the complication that we can put into a
comment and the changelog that outlines why exactly it's different.
