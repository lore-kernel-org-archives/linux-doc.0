Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B94DDA2
	for <linux-doc@vger.kernel.org>; Sat, 24 Feb 2024 01:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708739982; cv=none; b=J7mxiFhQfkWCqicnE/tkLYW++F4cZ6Ezm68/Jt8KtuPjKWiO2Mg9QPzHp0R+YYyLmrQMXhXHjBP5AsmZeeCi3YNXHfyfEDCAkf7A75yTuej0i+CsrZJn+3BNjIuAqZ3ZeyZdKhn/1Dfry3ZiWOL1GV1YaDPqEg4SSMq25wn19gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708739982; c=relaxed/simple;
	bh=T+a2SRS9CYU21NdR/LXMyfpfOaFxGBggdHbbvAXJGNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqaZ52BV4sBSXRt4S4XPObhZv3hggS82LB6faSQ5urPudKNeB78xXjbIhpjfGb7VmR/lizdwnZ9Kl4ePg3UHQwuwwo4OivsjllhliGkLkui/MrP7LmNYfbOS+Mj7Uev+yn209/CiZTgRy3/ot6L4jwC1BH6NyB5nMDVTRWwU4+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zntyXLY0; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zntyXLY0"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso1128659276.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Feb 2024 17:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708739979; x=1709344779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+a2SRS9CYU21NdR/LXMyfpfOaFxGBggdHbbvAXJGNw=;
        b=zntyXLY0prDLuWUAhvw7ixaIAkbzjzN//FBBd3O1inJndHdJNJMleIJeV7pmILIE3j
         H1sZwAVtjmK4UL17vQLGrErXQgtH9PEo56eebJxhiRdq5oKHMvaMmWnyndxXsxaPDXpP
         B0G+/TPLtQdYA+tqWpY1HLN0IUBPlHROJ6oEHXFr4bBEs5NbLPiYkVxGTthTCwdI89AD
         BsSQ+baqISaQvSdgEpLz+sjf7DYzOqk9VgIBOYVwAc0IiEDMsCy1yTyDzz4GGOko2bpL
         LXdoK1umc4qmBuz/eYU/H3495v3656CSywMDPyRHm/YcM7FljiuX4s/TNoB7YqCFRu8+
         lwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708739979; x=1709344779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+a2SRS9CYU21NdR/LXMyfpfOaFxGBggdHbbvAXJGNw=;
        b=GJPhoOR3nV4tcFmrVJ+c/52ACPLFW9ZSBTul4sVhvwV0+GTv8NRHEQQkvFY5kQryQD
         yAeFaMLMKntYy4lYxSIVKhCz0IvjFJ/38clAb2OypxriL0lgA4jalv48D96IP3h4ruot
         O597UGExTGlnObQT8fVGONLgdqrp97TupBDHzPOVa9pc0UZDPsoQgN4YaPnJ/DGxOQT5
         i9sYvYSbTelDMKzhLWKAbHJknx+23/66fe0PuLGAwa2po51ynyr4K+uRi+tuBjzhmFLs
         dWAAwKif4BpL7SAcOBqMKkr0/xtI8MG4xakO71ggMxW/m6oAb1GMXztu2YcdorvC9MDj
         MgDA==
X-Forwarded-Encrypted: i=1; AJvYcCVP8kr+1gRMBQcfGGSXksginN8LtjMnQl226QeYGuszlrtZHYs4JTgWcYh0WxfewFtTLY4Vy0h+B4BqnFKv09FVY8JXlqyhLw7D
X-Gm-Message-State: AOJu0Yw7kLPnVA+Hi0od1JabQefcS5Y0HCJRJfIIQl4k0Mg/rMofpKjs
	zUn+SzVh566AmiKfL127TpS8218SIAEsY1gSRF3ZXS8QmtepRTfcpHBuqRcrYt1XJ39uMBwCuBa
	N21McB20KksP9DNPFx6DT3TU6oaygjp+pBlcj
X-Google-Smtp-Source: AGHT+IE96gofthBIDY1zcxV1fCC6ZYb0ubhfQdxrWxQDA5xXy9sf7lsJXU+uVwoyJAnzh9d/485wU5tc9VrVgvYEwvY=
X-Received: by 2002:a25:aa67:0:b0:dcc:b69c:12e1 with SMTP id
 s94-20020a25aa67000000b00dccb69c12e1mr1515692ybi.59.1708739979162; Fri, 23
 Feb 2024 17:59:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-7-surenb@google.com>
 <Zdc6LUWnPOBRmtZH@tiehlicka> <20240222132410.6e1a2599@meshulam.tesarici.cz> <CAJuCfpGNoMa4G3o_us+Pn2wvAKxA2L=7WEif2xHT7tR76Mbw5g@mail.gmail.com>
In-Reply-To: <CAJuCfpGNoMa4G3o_us+Pn2wvAKxA2L=7WEif2xHT7tR76Mbw5g@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 23 Feb 2024 17:59:26 -0800
Message-ID: <CAJuCfpHY1T2jCCitt7cufKSeXP7zhh_f9gVN0UNZoOQz1cNBjw@mail.gmail.com>
Subject: Re: [PATCH v4 06/36] mm: enumerate all gfp flags
To: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>
Cc: Michal Hocko <mhocko@suse.com>, akpm@linux-foundation.org, kent.overstreet@linux.dev, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 11:26=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Thu, Feb 22, 2024 at 4:24=E2=80=AFAM 'Petr Tesa=C5=99=C3=ADk' via kern=
el-team
> <kernel-team@android.com> wrote:
> >
> > On Thu, 22 Feb 2024 13:12:29 +0100
> > Michal Hocko <mhocko@suse.com> wrote:
> >
> > > On Wed 21-02-24 11:40:19, Suren Baghdasaryan wrote:
> > > > Introduce GFP bits enumeration to let compiler track the number of =
used
> > > > bits (which depends on the config options) instead of hardcoding th=
em.
> > > > That simplifies __GFP_BITS_SHIFT calculation.
> > > >
> > > > Suggested-by: Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz>
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > >
> > > I thought I have responded to this patch but obviously not the case.
> > > I like this change. Makes sense even without the rest of the series.
> > > Acked-by: Michal Hocko <mhocko@suse.com>
> >
> > Thank you, Michal. I also hope it can be merged without waiting for the
> > rest of the series.
>
> Thanks Michal! I can post it separately. With the Ack I don't think it
> will delay the rest of the series.

Stand-alone version is posted as v5 here:
https://lore.kernel.org/all/20240224015800.2569851-1-surenb@google.com/

> Thanks,
> Suren.
>
> >
> > Petr T
> >
> > --
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to kernel-team+unsubscribe@android.com.
> >
