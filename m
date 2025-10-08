Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2E0248F77
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 13:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928657; cv=none; b=uonGCB+rBVtYI8KKOz7ZVfjmDM5c3fa/WjvwNPR0s/3ltJAMoT5EDA8NPGDPGtlCvbgmZtF0Eq6/MtsoEkXth2E9eaBClc7mZEKof5TPM9QY2c67KDT4/89vjYvBm/tvD2RDaWmjpKDeiaNQFmqkOkr+jvf33cLYlKETvQimTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928657; c=relaxed/simple;
	bh=iombOkx6RZ049iGmftkrgMRMmszUv7qM3smVLV5UOqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rfdpIDtmSpXQz7m+xv1b2C446f5MbKJKsU//oGdn1kMOG8ibKXfkrjfG1oSwSJ5tBjRSrxoX9uylNo8lHJc+DfjmDMYIdweZQi2Rm+9/eYedQioFaMDg9hl7c3DAKP1VaEeXTocM1cNHmZTpNwakvzKe6z1Nj2TgN02YNcV7Ils=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tFmk/2X8; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tFmk/2X8"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-639494bed86so6429588a12.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759928653; x=1760533453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqAM5J5K6OQvQzOQHzxihWMwPVqmYeUpdruR6N5ZdUg=;
        b=tFmk/2X8iExVa094zCS3dmlp+I9iU9nfzN6z9RHO8wwtjoKJppXfZdmLZHEI6bYIQU
         zbGcL/pdCWlhkJ3hApwh/ZjUEgoEdhrHB8/y0ezt+mdnBt2FfyvtYAG88wAXQj5pta0+
         oDDCiW0ESbkXijvhNB6RZUE8//iEZ9rGUNmnIaf1WtcsC7JkMspY9o2IBFPLTCNy3Gac
         OuiTmrMbZCJ0SnR5fqFAel1DrnRITcUUbVqiNzAjXLpOYzWlFxHoSswjQwOHKX13JeCn
         oBp1qczBZt2wz4VS3NToa7yjgz9HG3efh0MHTgi65X2Y19s0Pm0Rf9WyPRR48qigVPn6
         29qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928653; x=1760533453;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UqAM5J5K6OQvQzOQHzxihWMwPVqmYeUpdruR6N5ZdUg=;
        b=JgCA5hmtIC98C5H+1m2pzrrPh3g0eoJUK8HyH9DvXkSo4FS0Gcyc4vc5JbVSkyIrK4
         Xhb/Jk5sKC4qhqsAgZni0BaS7po/yS73WkJzXzvkxbZoHsD8b7TpFix0hhISHO3GJlSI
         s7gTG3OnbGJFcDyCUzkCj04eKBJ6Fwg2qhiqo9p0C0dQkjRqbC833pAfn1KekMWl8Hte
         P7jbhZZsLcLJFNxFJvuUfkGIkal/PXJY+1bEDXMI0++i4CAPsVm2UksLzy4hfFwPwVNO
         wya3G68l/BCel4KAladi/lX8my2bk3OvpHaHk4Bzz5d80JkJbE2aDjR6Ai00ci7iCnoF
         mHTA==
X-Forwarded-Encrypted: i=1; AJvYcCXoGfR24qGe1KZ9z6yBrlmDa38jyJnyXLXuxJgyCyKZioFQzWwva344P2GRSLYr8AvJsV89yZED4qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRTXj0OryTSYFnFQG3ZrCiXvGagsLEAzntwjsqKpAsQrpeEwip
	9CRA5eBf/mTK69tCLAmU6pc/XEmNvrRwS2xJ5nCJSru9PZu1/LISO1cj0NO1b8DcRRHUGcqH6/I
	Gu6o9hdHbSd+UfHOjkw==
X-Google-Smtp-Source: AGHT+IEwDtKAOG3+0GlDuiqWNfaiYirepvfQDt/Qk9gvr2w2apCZsFLWkE0cR2CwoYx8kDzMVpCqB89Jb5iURts=
X-Received: from edbde21.prod.google.com ([2002:a05:6402:3095:b0:62f:d279:8fa2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:40cf:b0:636:23c2:e61f with SMTP id 4fb4d7f45d1cf-639d5c5a38dmr3342530a12.26.1759928652918;
 Wed, 08 Oct 2025 06:04:12 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:04:11 +0000
In-Reply-To: <20251008124619.3160-3-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251008124619.3160-1-work@onurozkan.dev> <20251008124619.3160-3-work@onurozkan.dev>
Message-ID: <aOZhS9nTDnH3Zh7N@google.com>
Subject: Re: [PATCH v2 2/4] rust: xarray: abstract `xa_alloc`
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 03:46:17PM +0300, Onur =C3=96zkan wrote:
> Implements `alloc` function to `XArray<T>` that wraps
> `xa_alloc` safely, which will be used to generate the
> auxiliary device IDs.
>=20
> Resolves a task from the nova/core task list under the "XArray
> bindings [XARR]" section in "Documentation/gpu/nova/core/todo.rst"
> file.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/xarray.rs | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 90e27cd5197e..0711ccf99fb4 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -10,7 +10,7 @@
>      ffi::c_void,
>      types::{ForeignOwnable, NotThreadSafe, Opaque},
>  };
> -use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
> +use core::{iter, marker::PhantomData, ops::Range, pin::Pin, ptr::NonNull=
};
>  use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
>=20
>  /// An array which efficiently maps sparse integer indices to owned obje=
cts.
> @@ -268,6 +268,45 @@ pub fn store(
>              Ok(unsafe { T::try_from_foreign(old) })
>          }
>      }
> +
> +    /// Allocates an empty slot within the given `limit` and stores `val=
ue` there.
> +    ///
> +    /// May drop the lock if needed to allocate memory, and then reacqui=
re it afterwards.
> +    ///
> +    /// On success, returns the allocated index.
> +    ///
> +    /// On failure, returns the element which was attempted to be stored=
.
> +    pub fn alloc(
> +        &mut self,
> +        limit: Range<u32>,

The Range type is inclusive/exclusive but xa_limit is
inclusive/inclusive. They should match to avoid confusion.

Alice
