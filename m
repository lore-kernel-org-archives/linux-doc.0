Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E005C21256C
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928498; cv=none; b=kJm3TrD2thABVkpANGbsNJhIfAfQ16YZYZV1TccVQrMJFiyi09+Dq7SuAc4OBSfJ4GWMExssynXVeL0lF76wwdLUdodeuN6G6UeZP+NK1TWb4lQJTxOezTKedRFUEAok73XFXVVpvdnlkxKtxTOa53PPt4Wi/h/ngVLliJVENJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928498; c=relaxed/simple;
	bh=U8gluw6AjhGk5C4G3GGmOk26ZsDpNCj6rdIo4rIN0as=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LnFRBOhl9i+VgmOpDDW1cGK48AOihDU2RBPuBGUbOtE4SWfeHBbNehqxS3D+x1vOet5XJIi6WGyQmOcGu9+4WCO8ZuVuDldE8pDwbUKkNv/ImHJTO50jUUuD/BJaykijDTYYXOYVatNpQfn6+2VpFj0WINM7suuRLlzFSY76t8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IfzrqvhN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IfzrqvhN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e38957979so28173095e9.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759928495; x=1760533295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GegBdW6/vqVWwJUxJt/HTrMkbdqIQ76CzJgwPMuKcI0=;
        b=IfzrqvhN3k8D6tCmwFAOMXIZ3zUH1wfHtLoqS5Ycotmv2wVVC1liSJSKg6UcjPYrGk
         GejJ65Z1FTci3WtVkyIrzK7OOmACpsz+CIPDL8GrRTnnDVO5aS5eyMCtAGk12IMXaIg2
         k7SdSY2Ew0qmYJlwMlsh/YmVMQyHWh0fJaWOGFZSwvy97t+JLrkxkQeQMXl/0PhhiaD6
         6+xnH36AJHw/6QP4e9rv/A9Oz4JlOLuhSQRwPOeepWURUkr0dYYhLDIiElpwwd6GwIG6
         yf9YfcQ1uxC7AlSrybO/tGi+KlkWfhor0JePVMW7vSUNLFmfKCA2+X2K2fQMvo02JpjW
         wbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928495; x=1760533295;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GegBdW6/vqVWwJUxJt/HTrMkbdqIQ76CzJgwPMuKcI0=;
        b=YDzuTZ62qQmLKXocwfIpsqs+s/Ek3NEiU0wylH87oFKyrBXcK9OmlNZNw7ulffn6Qm
         3yeF4jfCrQyDjcLNJPTVaJBvN6btgKKSDZ3RFszT05bkXxIyaDJ7+Ux7bbY+Zuo7u38F
         TPYlm3NdmCo2XJW9Qgbz684x/V2czAn9oWjakhD6/XZZHiQn0E7ylpLmAwQ0Kg3QPBLO
         r1MOugRSn502iOk0aEQtYtbuuNchNBt0XWx9pqw4Cc88wk2Z1z1dsvWqERYe3mrgkZ7v
         XbYg0Q6S/tAQtSLntDlT3VBVGqJS9YFX0dVAAsQsJLRFLleITCNj9frWTGPN7xpsNs+z
         UQOg==
X-Forwarded-Encrypted: i=1; AJvYcCVeQI1tOgYlz3rIKTa+DClV/gBzhaiAFdi77nhBTfip+3warp/Uz4Hi3YiiOKu/7cRA6Bw4NeAIAA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyULXts75UVvx/VcjLfP/I/yG+0Zoh11xTugnPsoZyspqpadgth
	X2pTAhpe/3yvFRcJMuGYkDTXZ1SdS2s7wnJu8srgudy0vGljKiuc23fjxvBKxyM1HZd6p0W84LA
	robYsfnEWw6W2HN4SWw==
X-Google-Smtp-Source: AGHT+IFOSiOdV5yhuZ0ZB6MFGcVW4EY/P9vvGB1lbHla91Nrf6b7CfBCTOLrpELNIGe52y3C6X6BGL/q+rKkFJc=
X-Received: from wmpu15.prod.google.com ([2002:a05:600c:4d0f:b0:46f:aa50:d6ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3546:b0:46e:33a6:46b2 with SMTP id 5b1f17b1804b1-46fa9a96a70mr22790175e9.12.1759928495174;
 Wed, 08 Oct 2025 06:01:35 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:01:34 +0000
In-Reply-To: <DDCV43KW9OGL.27I8HP4TSTQ6N@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006163024.18473-1-work@onurozkan.dev> <20251006163024.18473-2-work@onurozkan.dev>
 <DDBHMNEIU9HJ.68MGF28IF58I@kernel.org> <aOTyVzpJNDOaxxs6@google.com> <DDCV43KW9OGL.27I8HP4TSTQ6N@kernel.org>
Message-ID: <aOZgrhsNrKpxM_PW@google.com>
Subject: Re: [PATCH 1/3] rust: xarray: abstract `xa_alloc`
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:18:24PM +0200, Benno Lossin wrote:
> On Tue Oct 7, 2025 at 12:58 PM CEST, Alice Ryhl wrote:
> > On Mon, Oct 06, 2025 at 09:31:43PM +0200, Benno Lossin wrote:
> >> On Mon Oct 6, 2025 at 6:30 PM CEST, Onur =C3=96zkan wrote:
> >> > Implements `alloc` function to `XArray<T>` that wraps
> >> > `xa_alloc` safely.
> >> >
> >> > Resolves a task from the nova/core task list under the "XArray
> >> > bindings [XARR]" section in "Documentation/gpu/nova/core/todo.rst"
> >> > file.
> >> >
> >> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> >> > ---
> >> >  rust/kernel/xarray.rs | 39 +++++++++++++++++++++++++++++++++++++++
> >> >  1 file changed, 39 insertions(+)
> >> >
> >> > diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> >> > index a49d6db28845..1b882cd2f58b 100644
> >> > --- a/rust/kernel/xarray.rs
> >> > +++ b/rust/kernel/xarray.rs
> >> > @@ -266,6 +266,45 @@ pub fn store(
> >> >              Ok(unsafe { T::try_from_foreign(old) })
> >> >          }
> >> >      }
> >> > +
> >> > +    /// Allocates an empty slot within the given limit range and st=
ores `value` there.
> >> > +    ///
> >> > +    /// May drop the lock if needed to allocate memory, and then re=
acquire it afterwards.
> >> > +    ///
> >> > +    /// On success, returns the allocated id.
> >> > +    ///
> >> > +    /// On failure, returns the element which was attempted to be s=
tored.
> >> > +    pub fn alloc(
> >> > +        &mut self,
> >> > +        limit: bindings::xa_limit,
> >> > +        value: T,
> >> > +        gfp: alloc::Flags,
> >> > +    ) -> Result<u32, StoreError<T>> {
> >>=20
> >> I think it would be a good idea to make the id a newtype wrapper aroun=
d
> >> u32. Maybe not even allow users to manually construct it or even inspe=
ct
> >> it if possible.
> >
> > What? People need to know what the assigned index is.
>=20
> The documentation says "allocated id", so I assumed that it was some
> internal, implementation-dependent thing, not an index. In that case we
> should change the docs instead.

An xarray is a map from integer to pointer. The allocated id the key in
this map. The alloc method picks the smallest unused key in a given
range.

Alice
