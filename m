Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3EE27280A
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451524; cv=pass; b=hlZBpvVMiZ/DSxykgXPGOIb3O+jx1sc2yP5TKVGlEj1HQFOd0E02NT8cFcOkB+Xjk1L2Jfyk8LAq6PwTv2oevcHtI5LZ+Zi8WQEZSAL0BA0joT44j5dfHvdQePMTp8l49SDTf03ZodHqdO+Qlu9V8r5GjP/T8Xak+EyUQHWlm+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451524; c=relaxed/simple;
	bh=VV7t6wHWEE7xZB0c0ALAUrHcYMkXiim8886mu4yeAcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzElrMreboC4rPliTddDZY3vuxTApm2KK014/f1i73zI5h0JBFZiRoOUwuEl5hrKuw3WFiax3N75TQ/wRHIYLadTlh7dwcYw/PPnnjBvgGaxrKHDQYRL/0wZAvraL8vZy7LcCmfEhYz9vbY8Tb9PBQgoMZ8EZKUWUOCX/VCN0u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAC4ebbM; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAC4ebbM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cffd93cdedso2463925ad.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 05:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786451522; cv=none;
        d=google.com; s=arc-20260327;
        b=EUbsTIZvYvsDdsx87+3wctnWo2Y3UQsyoXxkGfCiQOB+3t/+xd/bKxQFlihjZuFXBq
         TdT5c/aDLc3gitNZA6zR+tsnnIrW7xDw3IBwCg4HDiMllWiqwgDggcH8JYoflhNqzaq+
         A0iv4Y4Bf0tt2sd/gFPuYWAl3YKQ9fP9C93VpVOL7iBGm4FFx+3KNP14aadq7Xa1v/ub
         EZgT5a0ANlGPquD/U1PczdXvndXuQCpsNmKdaPPc0tFvLUcIPlehKSFahKdbHq/eCvzY
         UczhGP2V/lZ7KP791+ooT8Boiovroxf+h4t2XL0Jl6TE59xf+twR8NXB8qvm0mUg4ymc
         Eo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=orvbh+9JL+FbxIqTNlcfLvYH6xrqqMswPRU7oLw3bow=;
        fh=MIATiPAicILaTtgoDg1ERrvIhh6OWUuDzWT3qxzXf0I=;
        b=QW59H2+3KI3rwhC4kQp8SLoSQ7+mURMWN1JBCcYh90hWwWAnje9dbaX9b1Ja8PCtvJ
         VOJcuZcJ48I6xIkAUGvQCROugAxLANpPZFsVnlA9V4Tfa9eLBZYT4PUBsrT5os86u+zr
         Hh4JirwCvzlHV/z84n1Q2YjdCjjdZNfdjPT1idayt/DCHwr4LfgVLNkTPpwCaJ6NktLF
         d7ovUTiRRuSwghBEI6MkSQEMuL96iepprZ7CF0Iel1/5GXJVqNFjGx6V5n1cC9CE4dW6
         EtxYHZ53gOmbzytoXrpu33IhwLj6t+JBeXovtoQqEOhaMfQyFTbD7sN1jYZvUaCVhnrL
         LFvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786451522; x=1787056322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=orvbh+9JL+FbxIqTNlcfLvYH6xrqqMswPRU7oLw3bow=;
        b=ZAC4ebbMJRFcLOZcWT8I75Wq4KRaV/L2X3uX9KducB2qZtBVFoQrIPyAHbyfmnEj+u
         hPN9Wlj8vwx3y9BFdweqgXaw8NGZVttCE6oxWFiiwdHCHUJbZQOXJ5ct6Tt49XSFot62
         ZCtEc731BqcxEXw3PW0ObokXfJ+C+cPfDZmH5Elp5M1fZeVCqkI/0nU5hbbKNXZuBwHA
         235ofFKka/gzkwkL1/SaT8Ijmh97dDXwsqHklGmN+6bJaaiUczfEdHGP5+vvNiZBtqGX
         /FWC/aVh3Ag2uzfAMBfJdlbB+/GIKcoyyDyr97RO0aPIyIcnDEWW267ZoUO3OXFN7Nk8
         pleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451522; x=1787056322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orvbh+9JL+FbxIqTNlcfLvYH6xrqqMswPRU7oLw3bow=;
        b=LA4Kan6+VK+XuLt5SrVzeN4o4n4RwYKnl2kZWf8vhVD8e/gVOLwcXRuHSsXQH2m64e
         E4jKpT3tvR0HcXw/l+4ZYeFriWlOXB+0d/m0iNYnddaXdwPh7iXAx9Ksg0spB1FW4Lqk
         zMjxWi+Ey9qcP2YvFvlftOzKxkLdu9q95O+94oABfClUjq0V1mw+M2EzJ6ay90zZsU5V
         mIS9oyrxXVZVpy+2hoUbAAaXiCwl0FRl3qpE9IxKALLSHST9uEmx3IOEbml+TiO8ZHPF
         U7K9J3A1jGy5j4lQyjYt1FiVEOFW3JluSRzX72yRXWmrcHZJtcwjTuVoZUDWF5gvp2SW
         Qf1g==
X-Forwarded-Encrypted: i=1; AHgh+RpGLgmHfW3KFnoiQQHl+UnUngWERsvsMv1EsPOj++4v1+m4CxFtpVwXnp5IuNgdMHRqv+L4TsAngSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmQI71f8t6ZpSbS8XlnHIbKKfx5JbM0Et2nkNWA4lxr2YpI0ly
	T9QV63i6H193WYAenTjC01xNIumxz1xzqtsD6BseR0Ff/PLPiTJuVR0P90TgBqKLJ4sDyPJCmH8
	ApE5tzm8N3Z/QtuIXCF6R9zZAMsJx57g=
X-Gm-Gg: AR+sD10jRHhz2AzU0znckIu7/STRqcE16iOBnMyiK4UvEe5cXrYa8oNGxQFmkmNWT3D
	VWMwv2Wtyg8Im9YJbAxHoWQMQwjjh64B840IWxEv2yxZCyFmIArTZVyuNrC6KOTuQI5wEP8Aa7G
	avbl6EF6veKiFUDMpB5ERZ67Xh5IqCcL6j+y+XsGnjDgitw2z/4wBQ7rt+HUd4XiOLfXMBJuNcm
	p0KU16iYCpJAounEfQr+m7S1q+DWZvur1qeiHvjPsS0GatpUb/pdC0jShzt7LLASNckJIDmQfIl
	hv0FIbwpZktBCace/tVnU9dljFVCfxnC2BO4VhtpYVKZlqZ3DgGp1B+rNHve2EjY+hOCvNeYXWc
	H0MZc9LxmFP/lwkWACVj2EonKeFB4Eoq/S4u7PkviadpeRKqG4tk0pYTLt0wr
X-Received: by 2002:a17:903:950:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d317790400mr26287245ad.1.1786451521959; Tue, 11 Aug 2026
 05:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
In-Reply-To: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:31:48 +0200
X-Gm-Features: AUfX_mw-sYa6mBs4ValMgNlBU-v6shu4N24mrRNJSqO0XtM0upSdH02iosArTGY
Message-ID: <CANiq72n9TaUgWgZYg3Xzm2mn3Ed36B7O+f544a5BXik_XUh8FA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] gpu: nova-core: add PRAMIN window support
To: Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 3:57=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
>       rust: num: use const_assert! in Bounded
>       rust: num: reject Bounded::shr overshifts at build time
>       rust: num: add Bounded::shr_exact

Applied to `rust-next` -- thanks everyone!

Alex: I didn't add an implicit Acked-by to the first one but I assume
you are OK with it:

    Suggested-by: Gary Guo <gary@garyguo.net>
    Link: https://lore.kernel.org/rust-for-linux/DKIY9YGIPUUE.SZD2DUQM9NGK@=
garyguo.net/

The second one is actually fairly important so I did:

    [ This implies we can break the type invariant, which in turn means
      we can trigger UB via `Deref`, e.g.:

          rust_kernel: panicked at rust/kernel/num/bounded.rs:528:22:
          unsafe precondition(s) violated: hint::unreachable_unchecked
must never be reached

        - Miguel ]

    Cc: stable@vger.kernel.org
    Fixes: c59a2d14cd24 ("rust: num: add `shr` and `shl` methods to `Bounde=
d`")

Cheers,
Miguel
