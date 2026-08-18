Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940D537EFE7
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085860; cv=pass; b=kIDweod5J4C0l1rf8i7ODCboea1+lfsJpws7/MlOYSrG7vD/A1cRhqA7PHlnLSgQyaF4xESySfKVnvkmor7D6cSvNmqmxrKnMLdI1uC0FLu59HG7wfrt2805vygslLbIo11sOMfI/kOAJnjXbh64H0gTZpDdYfz1QEqZVQ7Agb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085860; c=relaxed/simple;
	bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUBjLgMpf2qL6JKSIWFz5xqmAPhdvRlszCOYkvPCgJ7TpVDaDIgS7anEHC2A+AQskdHDZiLksZX35RGy1LRXbIqBemXo60PNRtRI6wy0It7qNr+ciI3cuNPhkrddwFGNErt7SupPXg+rKyqiIZYDjcW5ljPH6H8pmupL2aQx5mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiSnCx9i; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiSnCx9i"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf49dc28ccso425925ad.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 13:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787085858; cv=none;
        d=google.com; s=arc-20260327;
        b=RrtJb/jOHZVl9c8N7OT8mwrBvoAMRgt860bvjPTFfGAoy3q8YTs/AEs2aRuIhUuHq3
         Uu3f2uK+AUjLeDcekMermZJxKpcICJZkhV1KrQNnHFUT49JcaPaPpib4Utex9c6qLSYh
         vd08Uj75+8EUPEzqXUTGA8ZIeCXekHZh92fHSsOcfOaxwr9lj/WX21oE1hzFSSul1OsM
         PgIx/s//u8E6Av5vSwPS8NgyV7BvO5UIxyiiWvhNyjyHSfgmKbXAhoo/uuHcdS/ZvIlP
         moZjtiV4Xt8oB3lLXlLLkEu/KJR7Kkze+vbq4PCPZB/GAwOFRSWt2G/TZorvFBurcLmf
         VZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        fh=5cgiEtCMNh1ZnCbiDfs5NhWLax7Hr40b/X34+lNmNKI=;
        b=ecKfz2V85eFt6O63bOLOcC8DEv51ACnl22Lx/lvPstjdg/O4uDYaStdBC/CTvMlFcQ
         50ZdJ1KV3828JPIMYxzdj/4rnQCo0xff/ZybB0HvdUifXcHXOh3jO95rOahEjWl5YkR5
         UGNqrE6uZFlsHRQkPMHkdow+9BoyCZ4UO9GvARpOd9hX4hopgNp13WKKcdCXTHeOviPk
         RuRLRU5ETFzPAAk6xzadPMcoa14cvNgBXxi6MtlXIfiNr+i2A2aHcD8WNOcdB0y0kcQC
         f7aIZkKUMAaOHecz949PTbOXNbXZynbQNyQiIUp4okz7ZXwenTcApM9pq9Vszn2LSe7e
         5Mcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787085858; x=1787690658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        b=TiSnCx9iAH+ZfAHEl3wMOsgjNgiGLv1iHt7TQM2L69mMIqOJS2RhYu9LXHIs+mf7fJ
         FCpjnNfhq7bb0X4M9cdmKTgUw0dRbG9uZ4j7mQO2H6FPmLBbnkLLhS+fftmOOyVqJBmH
         BQVs7ZWxSVENeLBdZJbYC7K8x+8AAdBoAM44HPFi8TkLwLzXgYwi5ZZoOmj/ZoxiYL3x
         Os7tGScy0cgJ5T2UCI5lANJDUlGoLFlQC1/HfL8DgqD47vzmN+UrOxE5y7ZewRhPAIVP
         shq7ljEda7DVejFUMZ/0h9BFxBWNpPGVI2HrkCK0z8G2ANUGgL0jv5XjYmvY7rY44Tlq
         gW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085858; x=1787690658;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBqcv7AREfC9nwVVa7mDdGWlnH2FctvtQBiP7rgCnV8=;
        b=KAblvjNwFLPgpXCiACYdT4777Nb0zrJl7bbVw92TcQsXbM+OabKLGayaCdCh622Sqy
         j17DoMKDlrY5DXXFdL302kJqi+X+m/dzvZhfDurA10N7XzWGj+DEiwXEn+UhdUVI8BJE
         Iq0GMuRq2/Xag+5sbt/KCl/vgVyJjoT3nbjCJ11x5+585gvIsH37ATfFN+eymSma8IgI
         v+AhwuVWMZ2oLTFzfrPu14cVgusBR5U+Jt53yOXsljXwrNKsWBmMotlQ+vDEBNirGQ2x
         BN1Pl5t9fOvpp0xIBdPu6EiaKU7EGjDnW2JrC1TPIN5Qpz5HnnJ0bXuv/Q7e8oyRenqh
         xssA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb6IKESzY6WOCRp/RVSSjXT4JLC0mN8sSqKGmqLVB2eQEA2JgxLHqYWiJ+vew3JfimIRKvM/TwlqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMQnhJPy9h+WayeBmiGPEoXQgltqjIYzEfhg9Rx6PDog5gSIH/
	l08hWzXJodTgHF1GoVZgYNrcj/8Xie6sUSjW5h/Dp54uN+xlyVVT2lKJdJXGds/uavl9TE4hqcB
	7o61KZaw8nOaLf4p9LEUw5SC59OgtiO8=
X-Gm-Gg: AR+sD12voH7pFu9C++NltIVh3mfuK3DrpZrg443fHOMK3xdo31SpsN/0fv0JeifSVTB
	A53R/CUUR3/1CkfGL/DETBzHCVg29JBCd1Ht9VOiCGZmyUoU8MgQtAwKBP7VYE5f9qIayVFpWdg
	nnRbiws8hC/B0UihzuM+1sSkv6OcA2Zph5RdF1nxh+xUcFAPW2LcUTkvmW9sodJ5Qzbo7lRmWm9
	V6urCS/dGkj2zA5iVYHGz0D2C7HTVfJQjy8JwUIlHrXIV9Rz0ntDr87YgQZvzQ4gJNvtiE2OLyG
	Nd1ahbF08rg9LGAsBzeVqcDgAHv+0ygnVBb211nurukKgsB1KXsZP9nr3xJ9fLh/piWf3GGL53M
	ToqWJPt/xd1kavAATW2Ame5Hl5jDkmKKC7WnXbvck1o4Ctcmac3jbKAFfA7Y7ju4WghlXzQTdde
	c2rDHmhLU=
X-Received: by 2002:a17:902:f64c:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d5f6c048bamr4365605ad.4.1787085857837; Tue, 18 Aug 2026
 13:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818152324.587932-1-ynorov@nvidia.com>
In-Reply-To: <20260818152324.587932-1-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 22:44:05 +0200
X-Gm-Features: AcwNN1XULaAA1GXIK7uBimPVbF7p5caYY_9Jijf1I6x_dsAVvxaRtE4L1JXqhyk
Message-ID: <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
To: Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:23=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Make every Rust KUnit test suite require the Kconfig option that controls
> it, and let the `kunit_tests` macro apply the corresponding `#[cfg]`
> attribute.

If we are sure we always want at least one `cfg` guarding them, then
yeah, this makes sense (we could ask to write the `cfg` bit inside,
for "greppability", and for clarity / less ambiguity later on).

David: are there cases on KUnit where you would recommend/prefer
something different?

For instance, I could imagine a Rust `mod` for testing purposes
already gated by a `cfg` that is meant to contain many tests, and then
different suites inside that for control (possibly with extra `cfg`s,
but maybe none too for some).

Cheers,
Miguel
