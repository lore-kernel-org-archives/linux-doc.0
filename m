Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF93217F27
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895221; cv=pass; b=WMpPC79hvaO/947RNfDsWamWLC3e13z2Izidn2AQqMqLaq2OeoCzg2S3GIaOeWMxPE10LjrG5fi00qL9si2jT9ax+MYorCYTZJ7ee04INvSY9TbGPEf6XWrr8MLQSXpSj8Fmbf3db4SfdLCCanWIHqiZvt99FFAOXpuB6L88ltU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895221; c=relaxed/simple;
	bh=2xcKVenmsOkTL/dR7a9UaRkSdDoYvwvb2hQq8wsPR50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEtUyzJ+6NVBjup3y7x3Kk0n/dwOI2gaHUlsisLeth59Ytg06a2eDyDCse2w6n+025Hszc6AkpZgtaQ9GA52At9Gzf0je9xa8NI/y/PlH0NyNUjdlCRHksqLoJ+3gj8KF2wGJ0WKyKtVfUtAHyBwBdklqeFxssBko+hWS7b6w+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8DrU4pZ; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8DrU4pZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so722449f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 05:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895216; cv=none;
        d=google.com; s=arc-20260327;
        b=EwL9o1FNpOZ2y7ectImii5rh6PzqaLWh4FimU2CgmXS0Vevk6uNVGj1/RqZ8k+T8ii
         qRK/oK8ACTh73g7m8HytmJofqtH7X3x5URWATUfPkNBfRtvROo5tLktdXxUQdQAyRsz/
         2u77D0skh+XMTGqo1Y4D08nbcJ6h2BGPlqA1Oo396w89xt8Cg/2uYbb2Wj8nVlaAji4v
         R+yFep+IB6r5Jydpq9uVPS/Rz9EtKCpY6Z2Y8g+AvbaEXni9bWTHUaCOCywksQigr6od
         scXHws6EOOEAKebf6sgc9EHpgJWVgiINLHP6HXfdumI4VNKtozfImMKFfuWdwNzVUZCz
         4dDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        fh=pmgrc2CiGYsV3joSNufP58Es/Qn2FBL5/5hwSZ+ZV/s=;
        b=Ao5zmo180e0RghXs1AFZsrmCjXpOj9HGi/xDld320q6m6yRxbG5rj9n7WRHEC0rO7a
         9m3ovbUwyQXpD4oW5ecP8MU4B7pRBs/gU/m+JSDpiU0dxlxfSE6wc64HKojoOpYGAnNl
         QvO7sY7aCyJ1Y41P69nqUW2meObwyJP5JiBCwrHs3cjqKTFfHiTIKc5bY6VcUaNCQohE
         Dl5q9cdenxcNuCoZ8J6VCbhgpQBpWJiIsaZQzIFV4Cri8dlWvwgfP8N/gDqsob6loXVq
         nDOQtb4DHo08+nFBGsMod8x/sDNpKaHEco4jEW0z35tHhh/3Mw5CNiEhVjbH0Am10PmQ
         UCmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895216; x=1792500016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=L8DrU4pZy6lObZsY3CcCLNFY6pLCfmuKnb5MhJbhxEbXnEtHWeVBDHA/xYQ6FC4TGL
         V5XNDn8fJdNx/uI3DEUeswYU8Kolgk7PP8Jfz5PL9EDloPkBgLKpL2UHOxWv4PmG0LOk
         5T8mw6OC03YMpzP/Bu22TpMc4b8HYLJcJwHEXWKXyGTtTmAvoxlwCfHV/rsgAPAKu5Bj
         WkBrlHdIBl+eclwY7V97giPr9FpbVb0wVkAEJxHwM7JI1YsENcXY0LUXsFKnzKGYbZXy
         INifoEBz8db9sTW33xlVj6OnsCVhVtIyZx3x71VRWhc4Xnfc/3oytpCoro0rd982wx3T
         Nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895216; x=1792500016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=CTB5tNjNDkC8epz+eZCqyorNyXYrzkgifjgBRPW62rkGCX1iYrsZZt4fxU5X+WcG1Y
         VV9aKZqYJ9/JGWkqhuFSqRPAV01dZER7CUsb0IN6X3btwL3tHHR2dLMROPzNfo+ep8Hx
         YuWSKrjpAUeT6lhtm9JjTsxHv1s0bb6gXTwOKFEKyEa93G2wQ9Ai9MRF512N12vjFp24
         luFBNemuLwShHmJhGZaU/k0wtQq6Hy15uRVqK7TEaTNMeKSNBaZX+0iFV2OG0U3LUVrb
         Cae0ESsw8NFR9spbugyDyOwmQf6/5NX0UntaxE9+Dcfovi2sw+auCv7fIbskVzbu6MNp
         GoMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzi4BXqMXaVm5b6maJ/3nkg3fDdbSv8HGhR1375Ny7mM9Fa6cgCs2ciK2i6VjPlc2OEnKZ3jIwWyT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3a3BXdK0qzXYbQ6aoxcj3nXtTOT6xBtUOTedRAwjYQvY1B//d
	wgP0pQtUQm0MjrepXPYyC30m4IrwQH6m/HZyoqmTokyFQGiWbJ4MzsA7mcp5B0WNsf+UqfVWnbY
	EB44Cq7cW3ncYZmXtunIG7+FM5f4oWU6QdOMAQz8M
X-Gm-Gg: AYBFou3CsFkY8vQmn0mLaN/MvVy73BpVksfVvKCEzsrgEiWYt7bIM3Rsx/WtuU1469S
	4TqkPh8L0ppqIG/3vm6PARrwHQpJvT8EqQ8c20dLNMDlw9XDdZ6++jBvIKLgDgGaA78ZzS9UD5t
	+KE+XUcqV3QUxVuWOqDN19zbIhvHSDZ46jD1i6hkOgW7C4IpbLLutAInupOz2RktP8Qn+Pjvr7v
	Fmfsupp+GTqf4ehJ3p2v+PlGGGcU2r71QdiiLDGkOOG5EbD4ZfVQmUf9kitD2gcOAeSziMqc13x
	Ug8ozBAbdt9ymSmLKMLENFctf0LPQ3L7HFpBvgpnz4RL4jZfnkzoPQJh4MNnTAFg9vYDivjXFE9
	KJDYA2veQYaTA68sjOlgno0I=
X-Received: by 2002:a05:6000:43c5:20b0:487:27f6:a4df with SMTP id
 ffacd0b85a97d-48dbad3c1e2mr17146863f8f.47.1791895214991; Tue, 13 Oct 2026
 05:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
 <as4DdRqFKxuJNDnS@elver.google.com> <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
In-Reply-To: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Oct 2026 14:40:01 +0200
X-Gm-Features: AclHuK-baEW0UEHM2ney0XhOi65COv0qWM-kqnIhtWfQmlen933Tf5epqt03if4
Message-ID: <CAH5fLgh=TkPnycdZ8_yQKaVeufN1YUS-MTo3EoMVhZzOdpKwYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:32=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Looks like it, and we need this patch to use system_dfl_wq:
> >
> >
> > From: Marco Elver <elver@google.com>
> > Date: Tue, 13 Oct 2026 10:05:52 +0000
> > Subject: [PATCH] rust: workqueue: add system_dfl()
> >
> > The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> > (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> > system_{unbound}_wq is used")).
> >
> > Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  rust/kernel/workqueue.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > index 7e253b6f299c..e46d3acf903d 100644
> > --- a/rust/kernel/workqueue.rs
> > +++ b/rust/kernel/workqueue.rs
> > @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
> >      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
> >  }
> >
> > +/// Returns the system default work queue (`system_dfl_wq`).
> > +///
> > +/// Workers are not bound to any specific CPU, not concurrency managed=
, and all queued work items
> > +/// are executed immediately as long as `max_active` limit is not reac=
hed and resources are
> > +/// available.
> > +pub fn system_dfl() -> &'static Queue {
> > +    // SAFETY: `system_dfl_wq` is a C global, always available.
> > +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> > +}
> > +
> >  /// Returns the system freezable work queue (`system_freezable_wq`).
> >  ///
> >  /// It is equivalent to the one returned by [`system`] except that it'=
s freezable.
> > --
> > 2.56.0.385.gd3acb90ef8-goog
>
> This is:
>
>   https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@ke=
rnel.org/
>
> i.e. we have had a warning like that in one of our current tests for a
> while, it would be nice to clean it up:
>
>     workqueue: work func
>     _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtN=
tNtBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
>     enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Cc'ing workqueue: Tejun and Lai.

I was actually working on resending that workqueue patch series, but I
think this particular patch should be split out as a separate fix, so
I'll go ahead and do that.

Alice
