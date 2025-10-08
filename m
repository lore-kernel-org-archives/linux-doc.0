Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B07E288C08
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759932321; cv=none; b=m6YQXNlRS0EwQmstSyDQe0790DQUJuIvIilZh/PrKMz3vb0E3Y9me6PyI8IrCHlTVM9vOZ/iQGh9xZTS4ynXlDmWUGFrnEfgXAmdw71WWKWuJ+Bf9Dn1EV5JdMEUj6rimtlpJaWjooBbEXyoFOELFAscEzVH7E4zSNVi1Gl5RyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759932321; c=relaxed/simple;
	bh=F6IH1UUuRkcLE+CnqnTRKITctuOhDmCi+4zdK2zYidU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZQ+ZNbCfiheeFihxMYcyV4xsyXtmBB8u2EvnzugppRIxCNxX+MdEDuh+BhJdCTTNox+RqtYNsbBDEn0kf2WBtmqqRsLe6QhOVEllNl8IvgWrNxA7OWeiRM5QCC0qMlK30To8n64rb5vFukhBVZ2qsubfrgcdPaYneKEcCr9cNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AoRYueJ4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AoRYueJ4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4060b4b1200so6526011f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759932318; x=1760537118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnFNM1hwuEwchUfhEuJaKySc2Ut3Y6Tp66F6XTEbLGo=;
        b=AoRYueJ48bVEgyGD/n88L6PvDQPhPAgKdqeMBxQFhW1vqdui2yif0lOOKRxdSYwZEY
         Gh2un4XkJPfhauj/qoPcgUS2bz9n6foRhy1VG0JDDlL1Kqg08MCcCqjXinoH/M/EdvPb
         KJvaufESPITN6mbI0M8rm9QkVtLtbX+GjAfqdgMQUG/ygBA3vlZCiXrYqWPP4IIr1ikS
         7ptZOAV1q/yD/7VAgfbDLwte6aUtudgbCe/wofqDzxsdWRdAC9hQ/EBi95TZGlaTqtBq
         STNzGfr1ZmgkUE/p+dNeMWq65JWEVDV6To95sAKmI9h4NtsBukkqDMK8YU6UopT5hGye
         8XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759932318; x=1760537118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnFNM1hwuEwchUfhEuJaKySc2Ut3Y6Tp66F6XTEbLGo=;
        b=OgxiIwB2zsP1mgp09z1xTuRSphsw0tfkiscLbpwVLMn+Wp1Ox1weugo3kVWAoQFw3j
         ugLPL/Xde8vdawcGsginnT00B5HcFNXZvcMlVBKxK4zpmiNqEa32EEvhu4nH/6jw9H7+
         uw3TPZ/nqlVltwWqRY+KDsFdA672gUKmk3CA5j3E/mHq3MYdVdCporP30lmIGiCwB5z2
         2y6rxcrGicwTDwsEGLR+6YIl90+M+nVeoJwEhUDMv4pPy7BjsqwVwyKIWywPvE1+uzMS
         H7BfOrjT9MPdmE9GG+n8jIlCh9N9Ua99A0W7YQ+vSZyg5mgN7FK2elRAP95W0X+ddY8Y
         g0ag==
X-Forwarded-Encrypted: i=1; AJvYcCWgycyF02PZhevjNlyiUdFFk1GnPkS4EU2ntvvoGZfAZEK4UaIT3Ukar++4mcyg+O6zH5bdvlrcQBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK4/mB1oACBe2EKNI3XzwZgzNkCzE75514Bof8stzTHYum3YG0
	+0FoBZq2sie5SpIQ0TUve1qL+xBVvIO3Fvc+KwfhCGJCXpPv0m6xmbBIZAw4i3uEmujMHaI7qfB
	MtuxcvdP3yrphiptoyNRrh14ew+wfwJtfZNijE4yD
X-Gm-Gg: ASbGnctAdvLXmvmhTAz3LA5I9UhEv7LK815ToMoVpj8+rReJUSjXszQcXUn4Vyq3I2F
	CGlfRfBrmGq1nVGcLToXrlNjvZfwQTrkpRovbPAtm0SjtIq8N6P8bf/+okCJGsrxi0D+L03+WrH
	Mn47kllZHlKT2CLNiuGz22heuHTKkWxb1Zt8BSNpzaAfYaJG/GbCRDtcP80CzLbRAz/QzyAg0Ay
	agDAvrPo1ovEbT+kEfdLWsYZfWtBYc8EMM+N08rHRYveKEuoY7tWO1G2/dF9U7+F9Y=
X-Google-Smtp-Source: AGHT+IEtL1VUjwteFF0aUMusK9O6vaSfUkvwFkxXShRQV/K9msyLkRj+XdqkEBNkBGqLRAXp1DSu3/HCWH6QZ7gPJbw=
X-Received: by 2002:a05:6000:2c0d:b0:3ec:df2b:14e2 with SMTP id
 ffacd0b85a97d-4267260e143mr2316476f8f.51.1759932317676; Wed, 08 Oct 2025
 07:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008124619.3160-1-work@onurozkan.dev> <20251008124619.3160-3-work@onurozkan.dev>
 <aOZhS9nTDnH3Zh7N@google.com> <aOZpwUD50MwSBycB@casper.infradead.org>
In-Reply-To: <aOZpwUD50MwSBycB@casper.infradead.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Oct 2025 16:05:05 +0200
X-Gm-Features: AS18NWCZJ-_06NHTt-9pvac60ma3Z_7vD0cIto5b6ZZ5rLx2-etkF4_odDy_JZs
Message-ID: <CAH5fLghoDEKnpq6WaD3zzV9UHm6gYzYXCOG_Q=pOUomcNcQhPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: xarray: abstract `xa_alloc`
To: Matthew Wilcox <willy@infradead.org>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 3:40=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Wed, Oct 08, 2025 at 01:04:11PM +0000, Alice Ryhl wrote:
> > > +        limit: Range<u32>,
> >
> > The Range type is inclusive/exclusive but xa_limit is
> > inclusive/inclusive. They should match to avoid confusion.
>
> ... and xa_limit is inclusive at the top end to be sure that we can
> actually allocate 2^32-1.  Or does Range handle that by using 0 to mean
> that 2^32-1 is allowed?

Rust has multiple range types for inclusive and exclusive cases. The
Range type is usually used for indexing arrays where the length fits
in the integer type. To include 2^32-1, you have to use RangeInclusive
instead of Range. It should be possible to write code that handles all
of the range types without repetition.

Alice
