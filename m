Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEA542A17F
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670002; cv=none; b=DWGwNPOsNPg4qdITZqlGc9rspJKYtQAU5aObC4Fx2KWqA0fVNhQFz/o8s1/VqpMLZ2UzUef7Zf1Nd6F1OnUR/ShfHYfS+/zBVKz1lZqm7Ay7BbRVKpddq8/xZiIcQWg8h0nPinO5vb/yaVDiZfFFm1QQPmg0hLMzBGNHcoNUZUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670002; c=relaxed/simple;
	bh=Dpw4rtPNIhmMqn7wNJpVZncgvMPX1xG1jtECbsm5Vj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoBQELdIPwgBqORAmdKLAbnU/2wcUvhxKMbdj/JVSSob/g4FWSf26ScrXolrtBygMT9GfroDL96l1ZSYlq01kRvRAM/zGF+qryAcgKlJhhEYclh0MfjsExoiukqeAkphlHR1smRUp/gPhBcYpZfH3AVEsATuOccZMW2Wd0o/Kb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TaE266Wd; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TaE266Wd"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c16794450aeso726019166b.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787669994; x=1788274794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=06QgDRd3KsQRNkIC849obH3kyg/ANunDmHU+Cwu/Xpo=;
        b=TaE266Wdpq6iQsaokirOQEe4P7Up3BdlXLynmT2tdAbixOEuLgylVj3/ONXvl240Gd
         XOLYm886a43G/NjFMJ33EcK8dDdAF8cWS2NjjOSAOCi/rn3fBe6u1Xf46fSqOz0o12vP
         0NCt4aZ2NjrKTVBvUJcnqgg2YsyNY3FQf6ac7Ri5KEa4HPcYlg9grx4a/Bh2eRo/ySMh
         EfRT/nmlHsNWGm2LzStmUJKh/TnnICIE1HpJkousfGkVO80IXxLWxA2pGFPVoaN4b/E0
         OON4P1FJEenXJhGzsZd3QJewKyf27NhyFqrq2x7/1/1Q9a2TThPF5/J+SdFoRzCBHCuh
         SgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787669994; x=1788274794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06QgDRd3KsQRNkIC849obH3kyg/ANunDmHU+Cwu/Xpo=;
        b=Vf05nThoO30p+WShBeVnDcokfPrpDL7cRkSVSFaI1s73CQ+EoaAljhqVpbYawyqqi5
         QQRuK6p4RiS+SFX6MO2vOc58JGzwPLyNj5PvqywqbmTSE/vFWhVGP5OpJ2iCzJogCzER
         pdwykdYTQCitVUJORZBZflAlER0s0ayeiw8CrnqJi++lrxp9GKKrrVwsmeKwTXXzfg3b
         SGISihX7tZpPoaHfDYUZ/BxvGsxcT+koruj2eb3ZfZVacvwGJYWwXArMiBNn0sLgmAgG
         tPSn1BUhmLsG0hGXbmsgnkKKEbEGcD1LZxYnN3Efsm9SciYQB2lbHeJ+lBGKO7bei7Vg
         WC7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpXb+fOydU0NeFCIAxvP/CKHdS1V8fO7LoFncbEP2E0oP1g/GVaStTbCY+8LVFrhy1cJ2WLPBKIDsM=@vger.kernel.org
X-Gm-Message-State: AFuF++nBfpWZZ/J43TX6PCYKMX1q5XHxBTl4Sa/3ukVUehGC5uSsFpul
	ArCAA99SDngU6ZyM0z4JEXs3qDi2ZUoPjXEdNKb9sjcrwGAbQMN1U7tWxvv4pA32Qzk=
X-Gm-Gg: AR+sD13ADrUh6Fdc4m/rmPWxfaUZs3THsUYZXiRLXb//YIb+Kk5da+5fQ+eLcBQi5fd
	78kMTx89EGzQlQBZ+FhU177aGzZ/tljntT3sT2OpogKHziUKYRS3C/Hr5xKmHO6sr6lXbHAgWc6
	cpxS92VhIYw4EWy7PQWHw78XKrrXAtmiu1qFQD3a5Dvv9efqgkzkBOPlobSpX/Y5txS8vPWUxks
	wceBR0KiYYI+NRhorjcvxYUWL1JpZ3QPshpZYJP1Vb0fA5QQDVF1QOadJCpcEDfUaTwW2F4er9u
	EpDeTpsG96+oayTrPUMU9smE/dF7h6SKv/rsP2I2Z8r1YeQ+foKIcZQwPoUaWh+bc7F8TxGfh17
	//FE1XLQ9Y7ok+/hplsZyVzNEp7/SFqEvM7jWxk3o+AcXeHvGHfLPGWSfI6WGZ7CE178TUrtyUJ
	aAPKWdJJAEA+iKqywQOcay9q6x7RZgEZl2T1AhIsxRaJtauOH2SM9Hr7KfBoaFgSOqQNDTYGA=
X-Received: by 2002:a17:907:b048:20b0:c20:1c9c:b36f with SMTP id a640c23a62f3a-c246a4b154amr2894042866b.8.1787669994328;
        Tue, 25 Aug 2026 07:59:54 -0700 (PDT)
Received: from localhost (109-81-80-32.rct.o2.cz. [109.81.80.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a905sm2134790566b.13.2026.08.25.07.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:59:53 -0700 (PDT)
Date: Tue, 25 Aug 2026 16:59:52 +0200
From: Michal Hocko <mhocko@suse.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>,
	Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <ao2t6HP-Zt5KDg30@tiehlicka>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
 <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>

On Tue 25-08-26 10:47:53, Eric Chanudet wrote:
> On Mon, Aug 24, 2026 at 10:58:18AM +0200, Michal Hocko wrote:
> > On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> > > CMA allocations are currently unaccounted for by cgroup memory
> > > controllers. As system resources, they should fall under memcg, but CMA
> > > areas partition the available space for different purposes and memcg
> > > doesn't have a good representation for that.
> > 
> > Which CMA usecases are covered by this work? It would be also great to
> > spend more time describing usecases.
> 
> We would like to offer some usage guaranties to userspace processes
> ending up doing allocations in CMA.
> 
> For example, a shared CMA area is described in device-tree for an ARM64
> platforms. Userspace components could then, for example, allocate from
> it through the dmabuf heap, or a device or framework-specific ioctl for
> that matter, to use the buffer with sensors. The dtb may have other CMA
> areas described additionally that may or may not be used by that
> component. In this context, we would like the ability to limit one of
> the userspace component to over-allocate and choke the other(s).

How exactly is this supposed to work? How is the CMA access controled
and opted in for accounting. What happens when memcg limits are hit. And
many more details, please.

> memcg
> looked like a good fit to achieve this, albeit handling the areas, so a
> cgroup has a quota in a given CMA resource.

Please expand more on why do you think this fits into the memcg model.
AFAIU we are talking about a unreclaimable memory and reservations of
CMA areas.

> This trails from an earlier post where we tried doing this using
> dmem[1], but I was unable to reconcile the requirement for memcg
> accounting[2] since from dmem I didn't have memory objects to charge nor
> the guaranty there was one. Given CMA is always system memory, it looked
> like a better fit to try something without dmem.
> 
> Best,
> 
> [1] https://lore.kernel.org/all/20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com/
> [2] https://lore.kernel.org/all/ahB7pCu_G4vuswc0@linux.dev/
> 
> > -- 
> > Michal Hocko
> > SUSE Labs
> > 
> 
> -- 
> Eric Chanudet

-- 
Michal Hocko
SUSE Labs
