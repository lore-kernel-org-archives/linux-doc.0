Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9812EBBA8
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759942792; cv=none; b=E4zoX3zvQE6ZQttaUqu9ZVtZvtfmLtK6TLaswux3md+ACXdoTrar4eG+WfnSHdclx6d/Lr7H8oNhlYLulH8LMhTMJRP1qop0Gs4vtJLyX+q2gI1JyfkuUAmbQu7RkQB8CucddXNdsECWaDzjZnk63dQM9Hw2exHTMtUgKgoLI3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759942792; c=relaxed/simple;
	bh=U6T66WCwAVe2p4J0jyxKKXb5H7i7GwEg7i80OTReVgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4PG4Q+CcFNFadejR3jqRTqiLJpDttK2pJBfdbjLuAd26JBIzKO+OR9gxPEcLnE/rgC+v69IWtuKzIasF+O0oRdv0lfF5uQ1+krIrBhQ95Gprjknsjbw6so3L+JpuasVHNPHlABKijZ86Ot9cS3E4fEldmPkd3VY/V41LvOcaJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9Lpz4ZJ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9Lpz4ZJ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-373a1ab2081so64447141fa.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759942789; x=1760547589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbyHQEVZUWM5+b8hXROM9euWoMjNsVjY1q+gc+HNpdk=;
        b=i9Lpz4ZJj6FKCaKoPdaH6Dt3SKPGXD6VuF9P8ZjiEdc8U0Dggs8yav0uSzlw3JPEYB
         1WFSd2V3sRgWMbdqOX8hHU53pNAZKNBt4piO1wY2Z5EoO6GSLCeMrWChf6rtv+wOo5WZ
         5QHjq4V5Z5UCH/n2yfZjjs6L/AFc3UVhC87gP2/gC88WC8pJtg/QCbHCby+ibMyDthjJ
         NlimmlOmlpThIL8inrrJ98gqaZbSJoVoGRX4rpG76bFr5dItIE/C/YLRG+o3x/8nk/SI
         iklWxA3Hn3w3N0jUbPjyohs+e+/9TpL42fFetfT8+HBwmUTFVsyFtKCHIg+LRxi2UcsL
         KSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942789; x=1760547589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbyHQEVZUWM5+b8hXROM9euWoMjNsVjY1q+gc+HNpdk=;
        b=vdPJksIJtOlhJJb+Hf/wIC2DSt8GguYFQ3tema4YXQKI8/aubcouNaQrUm0Nv4Z5ol
         XGsTBCEYC+bxwX/EF1ntQPZ7NkFoEjEiNMO9SQG7rbpSR27NNuHxit9rC6iGdIRXqoDT
         aGWLgPLei4oS/BGH1jNo5QplgJDh2NfI0BbhxRqvdMI40DlWRDZmrYGqf82TpwplFM74
         a/kFi0WCNcViv44vjdxM6GMw00vuB6ZgTVm9CsraOtPr447hdSNKHIrtZG3hDZiotrtR
         MSj6WA2wFvlRddLfvSOrCt+So18tafPzBQYQ9sb4ZOnKKgbOCJ40KJJ46mx2RNvWH5+G
         hlNw==
X-Forwarded-Encrypted: i=1; AJvYcCWS/1P9udZ2Pm6lKAW0QnZll88tl/g8cMrw/UxCTR4Nennp6FyUKzpONgY3PUief8l3nLOItQZVaEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS2AUk8kw2MDbQAr7btqc28q9DXNzdVa6iIB7e2xjNEhfm4i6n
	n+HpjJTe1vkV3sWYVbNTVGCi+H1X6bECUSOu2ESKGzZMECGkPKDGLphmCM8Slor7UH1hAfjaptA
	GTxgAAbCuVvUaBl4gd7GHGhsYFldXfOA=
X-Gm-Gg: ASbGncuwNvSzBxrV2opfAyOFixmPf00Tj5TEBvGqlcOLbOiZqFGvO4FeYRdMR9Y5B1w
	uTzxdfk+yoytHitvbODpKRq0+riipgLR37p3/VBQ1wvuKd1i4oPNiIem28FoiAOuGi/R5Krh7IA
	QDvZevUATN96AXhKmcUNAqCYPCVBC0dcKuBTI1lM5o0E0R7mXSWH8DCgl8kQViaOfc3wgJBa+3z
	3EYQZs9fWQmVeugb+tt4H8WjRZUtaJEfqDZ52C4t61WgnQIJ2siH6o+73ks2D3nBXGls2liSMbL
	FzDd1hR/NRhNgY3IT2y+ygQnoFuYGeQX+A/VpaAosEvzs131V/WnFB8=
X-Google-Smtp-Source: AGHT+IGwE31TEki+9bgtGRuJBI0XpflFmiVXP2InI4RexshP1L9r4vs0K8grtJNFkGtKKh4judP6Mucbj50jbGgWQT0=
X-Received: by 2002:a05:651c:12c3:b0:336:6c93:9726 with SMTP id
 38308e7fff4ca-37609cc1c50mr12805851fa.4.1759942788553; Wed, 08 Oct 2025
 09:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008124619.3160-1-work@onurozkan.dev> <20251008124619.3160-3-work@onurozkan.dev>
In-Reply-To: <20251008124619.3160-3-work@onurozkan.dev>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 8 Oct 2025 09:59:12 -0700
X-Gm-Features: AS18NWB_7cIMONd68nAMOTgSvZDlnnuuRjeTROznbec4OLsuftEiYVOVmU_FLrg
Message-ID: <CAJ-ks9mtfVmP+SwZvBVuQSwViiqo2ZngSGQuU5Y7A-Q_JSwjKQ@mail.gmail.com>
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

On Wed, Oct 8, 2025 at 6:05=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev>=
 wrote:
>
> Implements `alloc` function to `XArray<T>` that wraps
> `xa_alloc` safely, which will be used to generate the
> auxiliary device IDs.
>
> Resolves a task from the nova/core task list under the "XArray
> bindings [XARR]" section in "Documentation/gpu/nova/core/todo.rst"
> file.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/xarray.rs | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
>
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
>
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

Returning the index is not a very good abstraction. Would the
reservation API meet your needs?

https://lore.kernel.org/all/20250713-xarray-insert-reserve-v2-3-b939645808a=
2@gmail.com/

If yes, I would appreciate your tags there.
