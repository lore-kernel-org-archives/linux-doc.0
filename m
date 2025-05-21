Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D450C133
	for <linux-doc@vger.kernel.org>; Wed, 21 May 2025 02:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795616; cv=none; b=geDi0+Lt8PHPmt6zzgDzbnjZaLipD3xeED337yJwslKrsVLzcIWX2BzRAtK0BcxM/MGHrLMyvGvJ4dvJ9+pyDQDUHxY/cr16qEuddH7hY3ztSPQna/Re9vbdje2YRGYC/I+VxKyWxmCGxPEDa6ubRS7N4mogKnSGR1FSiIX0FkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795616; c=relaxed/simple;
	bh=s0Yv5qpAybqDPz+g5ZEmMpZGSzKgHGyyNvk9T13DIOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j//0wnLU1B8tsA5ttH2rU1MuQUpLbbENO4F1oGkAOBfopodbND1KVZGJKRjgIAMYU0hUdk0Cy5eoYF18A9utGeZzVdtP1dGAVobqGP0pI+SsjJn47ZOWDL7EooelQLj70313ae3M1d098W5zq4EPXV7quoR4VDV/tsV7T2Zij30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DypL6xK1; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DypL6xK1"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-317f68d0dffso76559171fa.2
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 19:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747795611; x=1748400411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nxt6arEcdTzqN2aNV7xZMthDenOsecbhCIniDpCb5w8=;
        b=DypL6xK1BLywsaU4fe8cPvIMG+7dD3qHaq8yz1alNmpjfQMo/zNWIvu/Ni1xhGSy8M
         T6L3HMmI9gcFBpeN8HI8/O8+AX5FG7gl3mEJvACKExL1TFEq+EQ589D/JIjlBdH8KMZn
         rwJH4VhzO7k8H2+NiGqcVw64qEzWfqUfwOaisWypKacxwCHlcVs8G4tcjVizcHgYBw2G
         ucQojIMv9ozfTzKWeQemfPd60/KESoa39kfvOAoUYD7GGTAKsJmS1pa/d42Hm829jHhh
         5QQ7RhYIRFne9dOnEeZoUOeByyb4OjdKPHRdTLwr3JhAWqNLBNQhLwDsFFQ6Dzy0C7GH
         OLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747795611; x=1748400411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nxt6arEcdTzqN2aNV7xZMthDenOsecbhCIniDpCb5w8=;
        b=L37y+1PL3NPMsOUSoKbHONCnxb+QbovHspHMNqAVcP4k0z1NEqmsm9L2lO6USTS/Yn
         1qQRDrb5/ngzihqK70JFEWYatfcaUIpYiEutXQDZX+oUVWTFy1H3wp3NHSbu6iVjYDxr
         Jh1sEnAWqPodbxCaknwgFNqY9Ei69Ph6nXR3mGmnxe/E7oysE3CnjFMqNykRazKB+22E
         m6D82h8cuH0n+zWLQQU0+peMSkPPQxqi0IScek++VTLao/UnVE8DTt020zVPMe+UV0bD
         qqBnsozpA9KU5n9Efw1oGNJ4YFthcSy7IbXNY5sSllh9Ye4ADA5hOLON6w8wveAh7e8W
         Y0/w==
X-Forwarded-Encrypted: i=1; AJvYcCXBV0cI3Dld0xlmnNoaxLiaBqu933NTF3dd6dE/C2h64wBUeVDdpB8wsv5JlnMBDQuI2/T4l7XFOs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW3cU2MEAyjAEDPdf77k08lpqSCCh7lw2nmqErI/J45ac0YMxf
	l7HLvbtg+cE0vqZ5FeRUvrzK+Eg7Hnb7V2cAYsUBXbWTJXzWi1sfzuI+ktmQMi2uk3StiY6j+m2
	3H/ZQO04vb3c6brzCrolIa7E/EjZYbxC3pYhezJw=
X-Gm-Gg: ASbGncueYBv/P5V/UB6YzhEScaAl2vTGxyOjYtysqec35ZHE73SDkStx8GwwuJGFo+x
	OJ1QQkYJSZMYDu1hjrvXAzUMVI472wEadkdU0nvdtGug8GV8eKCPv45Kd+TvLMYltQoef95cKHn
	Xb9BerFBn9u3/qzZBZ/hzJU9vAFhgoOnsr+NMnfnLqjmV5m6aXRWxEsYETfVNc8X+JXQY+jIY=
X-Google-Smtp-Source: AGHT+IHPiBTH/IUONoliZXjExrOKudiG9XvffXjRUKLNtiXlLaXy9m8H+bx6CRbSWTdibiF38hi9o5vXfOGfvKq6xdY=
X-Received: by 2002:a05:651c:54c:b0:30c:201a:149a with SMTP id
 38308e7fff4ca-328077a9f1bmr71629351fa.25.1747795611095; Tue, 20 May 2025
 19:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
In-Reply-To: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 20 May 2025 19:46:39 -0700
X-Gm-Features: AX0GCFvaIAnE0yZNsTcLxjSWVR6RvkV3hbcw5IoUnGn4QI2anEO8q4-VMGo9Bvw
Message-ID: <CANDhNCoQ=V5Uk0ThmeHdn20xmUucPb-mjCjX5pbM94EvzGRZMw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add naming guidelines
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:00=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> We've discussed a number of times of how some heap names are bad, but
> not really what makes a good heap name.
>
> Let's document what we expect the heap names to look like.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 535f49047ce6450796bf4380c989e109355efc05..b24618e360a9a9ba0bd85135d=
8c1760776f1a37f 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,24 @@ following heaps:
>     usually created either through the kernel commandline through the
>     `cma` parameter, a memory region Device-Tree node with the
>     `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
>     `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
>     might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +
> +Naming Convention
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A good heap name is a name that:
> +
> +- Is stable, and won't change from one version to the other;
> +
> +- Describes the memory region the heap will allocate from, and will
> +  uniquely identify it in a given platform;
> +
> +- Doesn't use implementation details, such as the allocator;
> +
> +- Can describe intended usage.
> +

Thanks again for sending this out. Sorry I've been spotty in some of
the discussions (I'm really trying to step back from this area).

I might only suggest you provide a bit more "why" to the list of
qualities you highlight here, just to communicate more of the
spirit/philosophy of how these might be judged or reviewed in the
future.

> +For example, assuming a platform with a reserved memory region located
> +at the RAM address 0x42000000, intended to allocate video framebuffers,
> +and backed by the CMA kernel allocator. Good names would be
> +`memory@42000000` or `video@42000000`, but `cma-video` wouldn't.

The point about avoiding the allocator details, just so I better
understand the criteria: Would distinguishing from a contiguous pool
vs non-contiguous in the name be considered ok? As it's a property of
the buffer returned, and one that is critically important for some
devices. Or do you intend that to be opaque, and the usage->heap
mapping logic to provide that itself? (Effectively avoiding folks from
being able to make potentially problematic assumptions from the name?)

Similarly, how would you suggest naming a heap that provides 32bit
allocations?   Similarly for "protected' allocations, which are being
proposed?

thanks
-john
