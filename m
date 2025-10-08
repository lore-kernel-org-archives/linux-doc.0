Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7F825C838
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759956393; cv=none; b=pkvCM5lYrmxGxdSHgg8w4wTpI/H0NbPoElXChFsBQDuzMHIjuMi4i0Ff3B9YlE3ODfVSXppOHSuhiUDBrSm45GCUj1ifjqdy7MvNSNXV5pRqbTGY8ir8gr52E/IytK6VP6JMVfx8K2tB7Dgpi3qOSPP2xRPYSeOXtyr83uzjFts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759956393; c=relaxed/simple;
	bh=ATtk0XNCR2WVF4S15RHWwDC3LY2M+FoezyWVxyx62sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3sY7LMyAtKBJ24y9tMOIhuSm/nNfoZ/RAYxtE6+x4VvKL/7s0bVWtZ51LRjb6KYQngnekJSEd2FIX1HDKzShbW3SUIIoCh6Fy0NPYmLtY+y6gBjstsqiJrYiF5uypTcec6Vd/0SnOZS1WZ0oc/yrH54nSD427J9VAfFUCqnf+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUrr/SXm; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUrr/SXm"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-363cb0cd8a1so2438021fa.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759956390; x=1760561190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxhkbVa/uEXngkfUo+dBA3TFbsCdSBF++Qy9JKTTAdY=;
        b=ZUrr/SXmJv9FU6/GNB/gwDeo5Yc6IfyG7pKANFt+DY58Rny1M3VOUHCyRUmvhvhztu
         xsciyxIh41q5WLbBBHsvQEb4i2YV6feBSh4f43JDbuPXrehZ3I7eHbKiWaFW5yqrKpUv
         mVZ75e4D64N9vYN/6HZM4fb188Ixf5taW2b2boKDybuVZ0WsXTyW4g1vmD+7Imh8Eb9L
         uNbJHlzQ6A+Pbsvo81fXSUsNeonxjXOswMXZO8w41xBJ7lEie2i5zRYltPJfN91G/tAk
         PkzxCDgSS7QqquT7wRg75X3D2On+lpkNFyMpFklhxaiOu7c4StMMvOMrztrW7blInbZh
         cM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759956390; x=1760561190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxhkbVa/uEXngkfUo+dBA3TFbsCdSBF++Qy9JKTTAdY=;
        b=Drrwt2o3Mko9BlEWixaaoV/gSeqXODO7iL8azjnKL99rWhKQYBPNX3yiBwDDjdQ6ak
         x7PLeLgF8xfWZfATzJz0wdBBgAUn58TlZxzVv+PDLCUg6b+yGPGVZz+COLCQgjTZ17g3
         KT9fcvxzW3aA/PZ019cPMTfompHz1uruQEsxM2TDqDROxH0j6rrkGsCA0vzbafGmMl3h
         sfhr3eEscePkwEqV+a4g3WDp9OSvbNtfxXgE5OuUX4TBk89oPALljfxUJNfYzsMYJjLn
         kOox6Yvbwr1kylob51Seh+6lM02ih30RAQR9aw648gq9zjF+sPaSmqYox1dBqR63JB3V
         xUGA==
X-Forwarded-Encrypted: i=1; AJvYcCVdfzmkHOAkBVleZQvL/bmn/G0hBWlqYHvSJJWatbTW4KW7c5/lf0JVQkOo5xHk7LKOwMgeEwb4/fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpEQ7t/b1xZ2fmY2hAKO6U4+cGctGSUk6yZS28s7kdsdzpsIBr
	cw5oQOGnyVqfV4CEr5foM036ieeuWmhVXLq1D+hbKYnW5R0c7pEryneEULsnsCj/ieljSMfaEze
	0qvNRvuo3bLXy/lJjhyDOCQsaSg49C88=
X-Gm-Gg: ASbGncvFTa7Y6GEURJn6J4yv9amVbSQtewtbTGMAJR4TCooaD/8C0FohUZyqdAippCB
	MiWBdumGSW6wjDym37moufy7IFpDYs9AKViXYYvVUoXPfvfAS3PJaII2/4PFKAQYN+AXtaanqN1
	dOJNMvmXrvBRWKBWmwO7lzAURQ8nqHhX/q6VCYHU+4VOV2pou9R2AVJqroGPix3QSrrXkpnJ2au
	t8/9g4Te0cfZfa/Wc+K3XofCF5xDW5MJhPVPCl8mgHHkwmnBQ8mhnJwN3jk2Q/zRNEk4ERbhswK
	jNutXSlIfPOwxR3Zxwg8vMU2kzGQU+c27J1XYXl96AO0
X-Google-Smtp-Source: AGHT+IFJhp/tSRDD6lbiN5FsweIVaBTWj0SEmB759OfG5ef5vYNgy9NHDR6XMGwyweNedzBOPTYTzZLdyknCujsFpWk=
X-Received: by 2002:a05:651c:1992:b0:372:8ccc:2629 with SMTP id
 38308e7fff4ca-37609ea7f6fmr12329021fa.34.1759956389715; Wed, 08 Oct 2025
 13:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008124619.3160-1-work@onurozkan.dev> <20251008124619.3160-3-work@onurozkan.dev>
 <CAJ-ks9mtfVmP+SwZvBVuQSwViiqo2ZngSGQuU5Y7A-Q_JSwjKQ@mail.gmail.com> <20251008225002.011378ed@nimda.home>
In-Reply-To: <20251008225002.011378ed@nimda.home>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 8 Oct 2025 13:45:53 -0700
X-Gm-Features: AS18NWCgbeEJXhSg6SR3UxIn3ImEaYtYHA2yKjUMu36X7Q4evawJbCU6rPxkSEU
Message-ID: <CAJ-ks9nMziN2LU=T=XGhV8xau6UfGXOMZ49+2Lrt8KGbL7Qngg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: xarray: abstract `xa_alloc`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 12:50=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> On Wed, 8 Oct 2025 09:59:12 -0700
> Tamir Duberstein <tamird@gmail.com> wrote:
>
> > On Wed, Oct 8, 2025 at 6:05=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.=
dev> wrote:
> > >
> > > Implements `alloc` function to `XArray<T>` that wraps
> > > `xa_alloc` safely, which will be used to generate the
> > > auxiliary device IDs.
> > >
> > > Resolves a task from the nova/core task list under the "XArray
> > > bindings [XARR]" section in "Documentation/gpu/nova/core/todo.rst"
> > > file.
> > >
> > > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > > ---
> > >  rust/kernel/xarray.rs | 41
> > > ++++++++++++++++++++++++++++++++++++++++- 1 file changed, 40
> > > insertions(+), 1 deletion(-)
> > >
> > > diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> > > index 90e27cd5197e..0711ccf99fb4 100644
> > > --- a/rust/kernel/xarray.rs
> > > +++ b/rust/kernel/xarray.rs
> > > @@ -10,7 +10,7 @@
> > >      ffi::c_void,
> > >      types::{ForeignOwnable, NotThreadSafe, Opaque},
> > >  };
> > > -use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
> > > +use core::{iter, marker::PhantomData, ops::Range, pin::Pin,
> > > ptr::NonNull}; use pin_init::{pin_data, pin_init, pinned_drop,
> > > PinInit};
> > >
> > >  /// An array which efficiently maps sparse integer indices to
> > > owned objects. @@ -268,6 +268,45 @@ pub fn store(
> > >              Ok(unsafe { T::try_from_foreign(old) })
> > >          }
> > >      }
> > > +
> > > +    /// Allocates an empty slot within the given `limit` and
> > > stores `value` there.
> > > +    ///
> > > +    /// May drop the lock if needed to allocate memory, and then
> > > reacquire it afterwards.
> > > +    ///
> > > +    /// On success, returns the allocated index.
> >
> > Returning the index is not a very good abstraction. Would the
> > reservation API meet your needs?
> >
> > https://lore.kernel.org/all/20250713-xarray-insert-reserve-v2-3-b939645=
808a2@gmail.com/
> >
> > If yes, I would appreciate your tags there.
>
> It should be "allocated key", I misdocumented it. I don't have a
> use-case for this implementation, I am just trying to help on the nova
> task list:
>     https://docs.kernel.org/gpu/nova/core/todo.html#xarray-bindings-xarr

I think implementing things without understanding the use-case is a
good way to build the wrong thing.

> The task mentions "generate the auxiliary device IDs", which should be
> the returned key, right?

I dunno.

> There is also this reference [1] that shows that the returned key will
> be useful.
>
> [1]: https://lore.kernel.org/all/aOTyVzpJNDOaxxs6@google.com/

Sure, it's useful - the reservation API also exposes it. But it is not
a proper abstraction.

Cheers.

Tamir
