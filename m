Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8B1FE473
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736351116; cv=none; b=m/RCtzQR+uEsbcwkPKC87nAfdpf23mmMbkxxouiEleVMJCh6MBu05kaQCqQdJGN7ya2f7BqWY5+d75Im2S9EMLgBUxVxtvE4DWnkpAQjRC8deRDvzF2SRiD3v+s/HACd/w+f6ydstcNhWebV/PMPKkkmSVduUSxy0gUI9Rf+au8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736351116; c=relaxed/simple;
	bh=pirKXsY0oM4GRiNYPpfoPQO9VOT/v2K/mLJnvA2bIKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUv+CwyZAealEbQiwFQ5fZFTJZZFOO0vKjgB0evIath8/B+ohlIADpOjLv1xF95r9E3ji6TMkWsObTV8ocM83mRFNzRYX5NFmXzAfw+0IOgBTTN64zfhS9pD6oICjTb9aH/GRNsad6b+tjwSpcFSBsIBnutdJsC2fwquPlLoVic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a3KYj+1S; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a3KYj+1S"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4679b5c66d0so238011cf.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 07:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736351113; x=1736955913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut6ps4BaR+Fx/C+Oe+D/lHnuheHFjut1hUSjP6yraP0=;
        b=a3KYj+1SlxWOYFnGgvvTmPpq2qw46tWwZSF1dHBqL2SjnCi3To3nuIxSwqYUq5wc7I
         0tAe9t6qO1qEtLh7Aq4e0B+1mWe0GLp9MAs+I4/VdEpBeNCcDTTWdGNwR7i9Ljj2+u8z
         C7ik44g5d6TiVy+k58C1XCG9Tzdd8p59Mfgyc4tzIPxYJjHWmybeQaR1lmLTI8LYdJCa
         mAVHnryWIyfHuqT+9AK99gIy/UXdXbLTK0EvNI1MVippNYWEvjne+Dq4s6Oc+BETeN5a
         3lnnVw5DXvHmKHm0Bf4o571t3V4JNf0ceSDnns1cEh3HKoS5RdSxmqE2qLW4tIAhiqRY
         4duQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736351113; x=1736955913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut6ps4BaR+Fx/C+Oe+D/lHnuheHFjut1hUSjP6yraP0=;
        b=lbl1n/IjSPFQtw8PQNEgku9GHUWj7asJqr1p9EFT9oolwmNehsM+jl8P1t8ynQL8lv
         MNdKdupcPLpS1rAL2u2YYqXBwJJZ1kbMcCLbRu9BR84JX8W43AgWoZZh2IrTxYxjOiae
         1+Fw0rWkRrwbcyf9QACSWx13DRF77rNNSwoYc7TkBp2+2KVun5+e1wnQuUJaVabh+r/x
         /OmIDf+MgB3QueU2RWAh16TandPDuy7/DY255g1xECuINNjPrbvhoteGvpkn2qV5wuew
         tVhKjZDi8gzCKY5vb4PhQKI6u9Z5CUBeFTapQr09PoSywkxY8jOVqHi23xNiqf/vT0kr
         iM2w==
X-Forwarded-Encrypted: i=1; AJvYcCV28QXmnFggrdWuWPPmKE55gb+E5PdDRSRzsN05uCCL2plqLod0VVmy7bx37WF1PaD+s3nHWjR3r5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJxJaOFKBGGT6BxDTvf6vVmqRRvkZ4Suu8Nu7UpJuGMJjuY04G
	H9gRli4qtu4v59uabDdPk+hIpBepZ6ouk8OA2mrJWSin2mqYHdugimWgmuKSGuAR6iUBZsSjPQX
	BAAHbgvNFpcSPwBZqtFHZyX+GAyGG8i8cf3u1
X-Gm-Gg: ASbGncsNM/2P4XQq7v6J7ZYnJckoxMTVh2EeIWjcv9bP1pKeDMGGkN9Ww+CUFi1W0Fv
	pxVar/cLNbUkbsvt74j9YgZnSU+uIscTMgqD1Dc38ZCj4pvlYZKkv1jrTxbB7LrfMEkCo
X-Google-Smtp-Source: AGHT+IFDX7L/QVbpbCMSP0rEPvza/vRxRSDCXoVQlASwSNMIllfDLg7pmdwGP0XcElQ+pDJQkQNlzS43FuzAdd+N+es=
X-Received: by 2002:ac8:75d1:0:b0:46c:78e4:a9cc with SMTP id
 d75a77b69052e-46c78e4b6b4mr726881cf.25.1736351113171; Wed, 08 Jan 2025
 07:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-12-surenb@google.com>
 <275bd492-7d7c-4b9a-9fce-fbe25639cbfb@suse.cz> <Z36UafdgGTcbvaun@casper.infradead.org>
In-Reply-To: <Z36UafdgGTcbvaun@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 8 Jan 2025 07:45:02 -0800
X-Gm-Features: AbW1kvYGTaRM--yaX5OGK2NhrSQEmqPo0zX2_oayvDdLKFOlkk0jbNSqx1ev8GI
Message-ID: <CAJuCfpG-+eNvFaqpAPnk75esx88MnPbiX6wzFYbJ-ois2mkCJg@mail.gmail.com>
Subject: Re: [PATCH v7 11/17] refcount: introduce __refcount_{add|inc}_not_zero_limited
To: Matthew Wilcox <willy@infradead.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org, peterz@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 7:06=E2=80=AFAM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Wed, Jan 08, 2025 at 10:16:04AM +0100, Vlastimil Babka wrote:
> > >  static inline __must_check __signed_wrap
> > > -bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > > +bool __refcount_add_not_zero_limited(int i, refcount_t *r, int *oldp=
,
> > > +                                int limit)
> > >  {
> > >     int old =3D refcount_read(r);
> > >
> > >     do {
> > >             if (!old)
> > >                     break;
> > > +           if (limit && old + i > limit) {
> >
> > Should this be e.g. "old > limit - i" to avoid overflow and false negat=
ive
> > if someone sets limit close to INT_MAX?
>
> Although 'i' might also be INT_MAX, whereas we know that old < limit.
> So "i > limit - old" is the correct condition to check, IMO.
>
> I'd further suggest that using a limit of 0 to mean "unlimited" introduce=
s
> an unnecessary arithmetic operation.  Make 'limit' inclusive instead
> of exclusive, pass INT_MAX instead of 0, and Vlastimil's suggestion,
> and this becomes:
>
>                 if (i > limit - old)

Thanks for the suggestions, Vlastimil and Matthew! Yes, this looks
much better. Will use it in the next version.

>
> > > +                   if (oldp)
> > > +                           *oldp =3D old;
> > > +                   return false;
> > > +           }
> > >     } while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
>
> ...
>
> > > +static inline __must_check __signed_wrap
> > > +bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
> > > +{
> > > +   return __refcount_add_not_zero_limited(i, r, oldp, 0);
>
> Just to be clear, this becomes:
>
>         return __refcount_add_not_zero_limited(i, r, oldp, INT_MAX);

Ack.

>
