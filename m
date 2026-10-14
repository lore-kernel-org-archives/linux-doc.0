Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2CB568FDA
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 18:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001721; cv=pass; b=NThD2S+NGxfzjmdpOstd+0dJ8hdkqXtylu/NOwGyNHMD4UVRliTa9tltiVcv7s5hK0XFzWxdCCbDOxcCtxu5Xau0N9qsqsKFNuSbwfbVx+aZs6H1JQwOlEJh6F3hpX1QMBoWPiZZKfb2wBmt8xz1XPdJhf3j6k63nySlxk1V6IQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001721; c=relaxed/simple;
	bh=ZDeZDQJcijxdIEcisFFhzJK1uUV77Ej4r8MxO3z/x0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaBmKT8Z469nXR+fPBmCK55D+Zx21+0zY4chbpGcGufGgFNC1VM1Cd3scnx6vzQtSRJUch3mK/eZjtxqezdDnhpGjG3+OtD3bZFw6mqjrlj7CblRnQIOXf8BCmLwLDvDo3mnHQRlRH0IHk4gjBSajeTUIYDSDH7lYE7I9YDphEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eDZW5tE0; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eDZW5tE0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8623790f8so247715ad.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 11:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792001719; cv=none;
        d=google.com; s=arc-20260327;
        b=eLNnLRSbswSYWeW4TWK8ZKOrjRhoFGgJ10LTKXfNVWHECIZi5WNr9/EQW8MVfUtToR
         UIBwTGn0GSksfIjcBkOiPm/orXBNLVsqVxH4/MPUKW2CrEUFNIy+n6s+Hu+q0E4Mctb1
         c6l3dP7dnk5RUcmPyS7wHe4X4cdhnwvWkIYj9q2KgqspTd+UouXRF8e93Fd3uBfgYYmf
         Y0hbb+UxboFnrGUp3adGPXyw08gy1sfWj+F9PMys1D4o+CD+kZwzQ+R89+YVkEx6J+cP
         TjQ0v8t9r2SwGx/VMjyRyf51OCwUV44SBIR68JZkXCQZvtf2fTfsVQ0DTemlNcznDoB0
         dj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ukWxxq7IJoiKFikFQrOXvwgn9jZTFnVv2R6ijBLFQBc=;
        fh=SSQSmdk5VoVQXeezBd5TFmF6/KvPK533e4lSbt1I+RA=;
        b=YtyDxvVl4OgWjhwj6Pgqnjil30J/2ZcSjkzdAaagD827lGm1yj++5P3F+z8mczrTY3
         S7s0Y1JWl9Wz9ZYXv+SjhfTg51IC6EChFB12lbX0sJOuX7FFvj68DRtgs3P9rco3CP1m
         ekjrVtQWgTGC/TmIpYuKNJy1EF7200/CEsWKQ0wwN4ARcQISLU3eQV3gg9GSQyW+thhe
         NCp8NRcxe1c5St+EiOCnvo6beVMMeou15qsrHmyP1xNZ2G4kDgx/ccweSWc6dQOKGArP
         UpY0Op3xoXb5kXZ78o35CvgxD5Ys49xp+zJewRTupW1xRJkdvZeEUy4qj+HtFSGTgo+8
         Vbug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792001719; x=1792606519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukWxxq7IJoiKFikFQrOXvwgn9jZTFnVv2R6ijBLFQBc=;
        b=eDZW5tE0H0i3voxRY8dGPIy9d5/DPnjrUI5jZBS4x0h8n/nD0pw0WobLo5KLT9L0qE
         kdA5Ttczp2IexcEIdWTMpnakZrUXPVKi6J4s+PLvirAd+g8KLRld3hKUgoDCEukl5cz5
         2gxF+Budk4PGlFpKYcMhL2RjacadtMLfdXRooXjlvfYTjVdQunaPVKxFFYLTihepN2zo
         oj0NJjwa0roM/fjLYG376bEkDiYLM8x+zsA6pGzOHO0LPlwOwSMPpeaBcFhRNdSXq1Vr
         tB8GEHdz6igWH8FCPOIP/ujQiHNB+uwW9MTPkTqzwj0+PIqUUXNA3uK8+NGyAkH2in6t
         EjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792001719; x=1792606519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukWxxq7IJoiKFikFQrOXvwgn9jZTFnVv2R6ijBLFQBc=;
        b=ZtfgdFYzxqEWR0/z8F8elQGHy5bYgFlzGCTtvEKifKL3cE1HsL/4MuVBXWRovArJBt
         GxpW2fu/zJ9sacO6nox0WqKWiN7bVpEGVwGHJJm78sOMqaNe2RFI5jl7hX17G553iWHe
         6yQP12DwQb2WGwgtgHJaz4ZpHcZjgNIAqh9o7b3U33gZNrvHTx6OiibTzwXQOTLRsoFU
         kYW/5EkA8IqBoTKuTV4AVF4MN30YyUMkaJSb3XhJAy/n/gFyfOyNkwpEqi5RpZqix02x
         7eMQBndTP63MQh1qWlfs6TMvQhudkPPYTT6BGWmJAO8yPM910EEdDvHKn5BLvmO2IL7o
         /+yw==
X-Forwarded-Encrypted: i=1; AKwUvBwyF2gCviNlWnyS2nrNZF6PM5ar+56H6tRzsskuKEvui973rVDrcrWdmt51BeujXhJJYpxlsWpCnqo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgUywIVIWBghfRI7pY68NlQybqou/LKFU4Vt4HjYitKndbTkPs
	R/ehhDk/YVO6HGgA3s7KDy+BXTi+yDiiV/+BU9CTFXAeEpVW+VnHZeecPs0rIKwIz7BnlzPzALU
	kjKF0pRSwLqo3cPQiocNGZL2RunAT4YUNgniYZzC1
X-Gm-Gg: AYBFou1vM66VXjgL6PpcNfwmw+6LVBB4Y0Sz1wCzoAUDftTkR1f1CPUyyXwnMq47hxi
	TPIj9QfjFaCJDeW3Te65fOvQGySsor1ZKCL0hceU90J5JAjHuC4eJwvtLVfvKuQ+2R8CPUE61bn
	1C2G0snDYSyLxw/n+1Y5dCD+bBP9snggM2KD9ieaBtOfRWRs2OyZWJw15V9gGst3dKi8iKh3AvM
	+y5hWwlApug7+0NQebtKYt1v0r/dnLFz3TQso2kC6t2oCrAPTYjOwTR9g1QWc3JlYIhqd7vaOBB
	jc41mouIpeUirxaPSPkUpxYdOwqG9tdA8EbwUGSSceMAvNmIPdUaixou
X-Received: by 2002:a17:902:ec86:b0:2e6:1013:ad57 with SMTP id
 d9443c01a7336-2e939d090a3mr4279565ad.12.1792001718105; Wed, 14 Oct 2026
 11:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <8584c31e-fd93-4f1a-9929-e71c5d9ccd0f@nvidia.com>
In-Reply-To: <8584c31e-fd93-4f1a-9929-e71c5d9ccd0f@nvidia.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 14 Oct 2026 20:14:41 +0200
X-Gm-Features: AclHuK9G3FSCwwu9o-cWYwZA7nUn_K71LEEmvdGinw_0nCstr-Fs63NFljz-hj0
Message-ID: <CAMOZA0JiGhVmc0PXajBzha3cBY-sdc3pz8eLCCbt6=hmsEh65Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 7:28=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> Hi Luigi,
>
> On 03.10.26 23:22, Luigi Rizzo wrote:
> > Here is a subsystem called DMA_PMD on which I would like feedback on
...
>
> Thanks for the RFC. Here are my notes (some points rephrase what was alre=
ady
> said):
>
> - On CoCo VMs it seems that the only way to opt in the IOMMU optimization=
 is to
>   also opt in the copy avoidance which is not always desirable.
>
> - Having the pool generic opens up more visibility from the untrusted hos=
t
>   side. Having device based pools at least isolates one device's memory f=
rom
>   the rest of the system.
>
> - Also, device driver could help with provisioning just the right amount =
of
>   memory that is needed. And per device control also means that probably
>   you don't need to map everything RW to the IOMMU.

Yes on all three. I am looking into providing more knobs for different leve=
ls
of opt-in and isolation, so users may adjust them according to the
threat models and performance goals.

I am not especially worried about provisioning because the system is
already reasonably adaptive, and leveraging existing caches, the waste
the waste due to allocating 2MB units can be kept relatively small.

As an example, the update I am working on has the following:
- a lean per-cpu cache that can be attached on top of a dma_pmd_pool,
  similar to the one used by the buddy allocator. The dma_pmd_pool will hol=
d
  the 2MB pages, and the caches can buffer smaller sets, reducing the waste=
.
  Useful on the tx side.
- on the receive side, one dma_pmd_pool per device will feed all
  pagepools for that device (typically one per queue).
  The pagepool is already a pretty good cache that does not
  access the allocator often, so once again the waste due to
  partially used pages is minimized.

cheers
luigi
