Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A215CAD4B
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 00:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707784502; cv=none; b=k+BBCTi1lJNUYi/U/lPmcJdLk5hZ0iJ3pGmeEW+Lzz947rtJOoOkO5rLd61PmVr0GUBgUFDrJYKO2yTTYWr6ZNd2KJHHLcy5Wiq9vYRfxLP/zI4YSdiT7kz85fU4FRFVo/6GNg6iGNdgOIsuIAsLc1nHBjK8HNjJWirVl8RGBzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707784502; c=relaxed/simple;
	bh=UHD/3jMRU1ccG3YkQIqWf6JR5thVdXFBz5XlT+Q0DtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urvyn1IbZOhjBbao0fU2tZTYalKnbbTCwUV+dfl4hs2TYEFep2JAG67RarEE+HUbRd7esc6vG7/X8tzPyeyI8ggrWvAFukARikj5xbJzjx++1iJnE0msjqt8RvLdf1dM9/vhw6nAdlIBy9F70v7TNX5wAeMXVc5H2jBIgQImw1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ms1aUX/u; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ms1aUX/u"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc745927098so3196789276.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 16:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707784495; x=1708389295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHD/3jMRU1ccG3YkQIqWf6JR5thVdXFBz5XlT+Q0DtQ=;
        b=ms1aUX/uHe/bOSB9ADzyvPOqoUS4sMi2M2opxDzAExtTMUaUMBsxUXU/+IDeAq8TOQ
         Zt+d4vX/Dy5rWvlo0PlLR++slAyxGVX/rNBlzI3cZWAvKs+Lp5gpnQg+8aPril7OL4JV
         +NzvDsLHi18Cxttijh6lIjaaebgaVxApRPWlvQPYHSCySBsKr8vuZbu6a8SnOLouxLU1
         YpaTl5yaxwwZK3KJuNQ1b7tjQK2g6a/dFcginWYe2p2O9hnQegD50C3rQiFSINKGGQpJ
         +NubCjjAZ/d6/gCzMTdoEvG0hATxHtssDQIlpCEoqa++J5nowadTkZGotpE6uokNO1q9
         zRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707784495; x=1708389295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHD/3jMRU1ccG3YkQIqWf6JR5thVdXFBz5XlT+Q0DtQ=;
        b=WpCGzh1s6xVjNaU5+CGXyKh2jmx0QqB03MSvHpfrJst3cbO9EvlkOfjavagYlhVBY9
         Tet7uBWflDUOaKQu3AgJtFthbb42T5ctPGy29Pai3BvOkA6kAp84CVrv4XEmUNuAdFFm
         01KjJFyptGIl9J03W46T8b4a7B/NtP0yCtDmviMHS0DxdsSWkPWJ/amQp63rd2GwaRRc
         lQ9ZvHKO4yljlz47UeJiHc74rmY1JNt1eIqeZp3JlAgSvHH68uuB0FzQFYc9fZxT+zHD
         ZkmtrOF9USsKXoWS0JcRArUp5FAfHMU+8hZIrlaewFQXYs2/0fNg9+xEPNTb31w28z0s
         z9TA==
X-Forwarded-Encrypted: i=1; AJvYcCXJOH426tb/76iSSQkTpUUWHjJwYf4jX93+IryEwSNYy8Y6fLB15hwZHcbeK/V6Rh4hM0VZcDePNSunP2EA/V6OuFQlwiNQP3kB
X-Gm-Message-State: AOJu0Yw1EsTwOidyuL6WhEUVOD9yd3XEDtkmNAWENXpwfESE3BW/GHrC
	DsL33CnwDywAiyBXg4mM1Z8SXDbmj6GJceYmV4UQzP2fxdtubuGPogg2eR2hEegvDY7FNlm2V7J
	NLvKMPoE/hdMMi+gNC6UfefBxphKcN++9mokS
X-Google-Smtp-Source: AGHT+IFjB55gPzAJ3uayg/3DbZropi86YtyNQzi/ARRSHghfRy48VLa7tw6T2sjep0csYIBMYiEo+U9Z3yu21UMYcUw=
X-Received: by 2002:a25:b389:0:b0:dcb:ca7e:7e6f with SMTP id
 m9-20020a25b389000000b00dcbca7e7e6fmr1832315ybj.55.1707784495521; Mon, 12 Feb
 2024 16:34:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240212213922.783301-24-surenb@google.com>
 <202402121631.5954CFB@keescook>
In-Reply-To: <202402121631.5954CFB@keescook>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 12 Feb 2024 16:34:44 -0800
Message-ID: <CAJuCfpHf+EUPL7ObG7ghVhQShcJJSwMjNcUAzeg-x1BoS5OeEw@mail.gmail.com>
Subject: Re: [PATCH v3 23/35] mm/slub: Mark slab_free_freelist_hook() __always_inline
To: Kees Cook <keescook@chromium.org>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, ndesaulniers@google.com, 
	vvvvvv@google.com, gregkh@linuxfoundation.org, ebiggers@google.com, 
	ytcoode@gmail.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com, 
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org, iamjoonsoo.kim@lge.com, 
	42.hyeyoo@gmail.com, glider@google.com, elver@google.com, dvyukov@google.com, 
	shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 4:31=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Mon, Feb 12, 2024 at 01:39:09PM -0800, Suren Baghdasaryan wrote:
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> >
> > It seems we need to be more forceful with the compiler on this one.
>
> Sure, but why?

IIRC Kent saw a case when it was not inlined for some reason... Kent,
do you recall this?

>
> >
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook
