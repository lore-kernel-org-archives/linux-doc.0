Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793697274;
	b=ah6IFAQaKynx4uDayJ06+t+frmOcHdPA7U2FTveW07sXAw23Y+pXCYLmn5Gy/SyawIXZ
	 FRKYFhPwbuBekAchsHlx/lKdJAwmNYSf/3yqXtP/CsvaagUFUNGSMk9/to4QMR5DWp566
	 ozD34DqfKI6nyCPyyUmNgY2CAIuQlTcvmYS43e3ByaWbBP8DeccmAvUfygoYjfrC4Q45b
	 GHcX/zvU/imUyas/NG2p4hnYyFDAYfv0ZcFroUjlPfRfnCBzMaV/Tll+rgTTtwzixg6jW
	 N69Uif08wcbOVHpMBTvYw95b5T6Msi2pRnpt6XB8HFTNM5GBZKkvpG+zHE9MJskzTfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
	b=a/Z9ttGB5v38Acla40U3sc0tIR9MBxjcYRpsS1DC5JtfcDq9uS6R5WkXL7598Qb0mHrm
	 0CDd47ldFMemLorS6AFfOzGcSZJMa5lmBFdSKXErUYAxCQvKVG1qvBod9YnXHBtbrp0ig
	 xyoHLc3ReXRx/1GfFSWoGSmEhNtJ1bKxc/KOnGM8GZRQ7pCHmE1ZfUgEUrcDqDyqr3Xb1
	 EQP1kVXkP+0gkFolUjNG/eEhBCjKltAExVZpA13gHYIhVYUSjfFOyJQ+jfxqvfgT3ZhDW
	 QBuvKmHYwl5IVDetELPt9zNvDEZH4Vne9ZrEgIFKWYvHoS54Lqbjhg42+Rl3S/7ghbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BFRA5WkF;
	arc=fail smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC3D606A33A
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 09:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC3D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BFRA5WkF
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5383c97c8cfso140051cf.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 01:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793697273; cv=none;
        d=google.com; s=arc-20260327;
        b=pkyDfeiC2n95yb9YLNn4aeCQwdqKMsTRzFIQ7k3lL8fdi/hjASHHAcnfZIBoYT9tG0
         +2ghPYfykFNyTkjjmPhsCkHAnYInSOojtCqpMDxsYPpMCSRAw1rE9WhEFRL4LGfFjXR/
         En7shC1doyYkShVnNJW+ECE8muWlpvSzvTP5FJoCdtJmhGkHW4JaCbV78FpFRR6v/G/l
         Vqfi++jbysgGnUjPGLrZQnp3gZutJsOJRFBVTN+71CadU/fRk56l6R3XILxMWmQ47mmD
         VnZJLSGmBOoLzBnD1K67rufGXppQiC0TthQ133S2EwIr86zQX+Z3kPIWjhhJayR3vA1Q
         A2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
        fh=0dSOC5Ze6CqPkpZHZOdg9YtgXbtI14yVy3B7ZPghH04=;
        b=C1LUZJxxsXxJj2Eueo3FDKOL9EzrX9tngez054ZhtsysWbcmjjxN5QU0FCqA58JNgL
         TdjuamYx2ieDH6mZEeWz3YowaLPghfDjo+PVVXCE5lWhZQHxw5+aRhjdL046a6w+085j
         0gaZ6gxHKB0MP0bC7sYRuQRzObo5fUk+E3AWGT2c7J22BEY39SQ3zb4vsyLe//c/GIRs
         H2gbndw+vZUqumVK47BPD5Fd0aXSEIn4kgt3AxTrL59Zkb/Fp7QroxPXea1htHs3CM9f
         BVxAwchd58lVsRuD9aGguMFZ43ETTFJqR8nhXY3ihxm9eDpDw10eZbgBscLA7IZqyuDq
         STDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793697273; x=1794302073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
        b=BFRA5WkFVzwofI4Y9qPUhFW2qtyO8NlwR48s0vcWHVm26tP/5OcdiQb7uQdbBFJ3l6
         6eWpgCHaYgj4N1eDLLQrwwhYiXTq7d11vqjE4ug1RgS0ElbGzpDYB2KQ9TkFp2okdQER
         yFf4tAgPt9WLDcmCO0BQmFV0yYbVZ8lRUw/90MMImfZoLthc1w4BHcofV8LGWl/B54q1
         nfF6Nupkbu20jzw4PqHlTu1tCWB6DY7rzVVWK6hzYnJCfcxYQPAhj2SwIldQyFdPZHAJ
         lQvb1sVV0SVYiVnLmhmTyS+xxxRLOhf7PlY2k0ra40cMDEjxCqbzHGepPLgMmkzh219l
         CA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697273; x=1794302073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
        b=IKXG0HZoOjImdLqNVJqXiVfGuAn8/ZJoZ0MnUVBSYCMy/NlZsAS/jmX8O7eHHKKgj5
         +7OvUAq54+czKM9KZ00lECC7mCGFe08KxfQujZGv6eGiKIltMalnTKSEvYoR13zukXbD
         SIS7Fo2WrbNPqU+hqbS7rYm/NHw5pxTPfj3mXyUXVTSrpmHDQozr4RGOoJHaigudKNzw
         2vX1Nt3z4JR7vk37ct6n83uv8GHe4cckpg+NT71FCk8oZOxs0Zb6KXYkVN/BOvaevi48
         Trh/9aUKYtcQPbJYGMO5tB1IhGAUo+kEweT/8s56F7pFyxIq5GCqrhm8/pNinPI+7qzK
         gHOQ==
X-Forwarded-Encrypted: i=1; AKwUvByBKpTHqLJ9/0M2/Dq5bzpQsJZgSdlVql+usSJlEOjIJwNjaoyuIZ/0Ixp84KM8K0ZiBjTa/qDjwgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GeErmFBFom3qyz0i8s+HqYKO0Pi86ZF2zSWxdJH8xVEVGOlud
	3PqbF1WqA3HhuXBFGKUe1gdmRl7MvTX8JAKvFPcMCwobD8WYLkV6Bd+AEQ4JUq364akk0RwVXwK
	ZjuRyS7UbiC/Jai4BlDSU9kdPShauyyK9cITP57Kq
X-Gm-Gg: AYBFou3lG9rFQnYX1EnKx/VSeq6kQ9lXYnQIoydGS/WaFXePXWGRc8f6v7SjF3E4Loh
	EZ8C0jYkzS6z0lkKtcenJJ6tqhBMtg9eN9ARICrpPRycOcI6USGBQanzY6x8d2CMNrOLLqHZIJ2
	3//xr1kpQfUGtTQF/RP7Shz9BEvUZASTjD6pNtxk7PubgU+RYiG88AOT2flIRv7MLHHxlr24bCj
	yhSYQ879o2nBIxnWWzhQawXpko8LWhq8G6ocCO9GzEY+7ObJvLgnzQAy9N1oJQO70CnHvH8cMj+
	S843mzvOzaaSrvP+5jdhiV6C15vnjkYaOKZyr1f0ZZNBV2jdonykNws4J6EwSpXXF2FkedCOYOU
	C80XHXNFg8e7IxnYBgMsQoYsZZAL57z5eoKi0Qrx74ymc4VZ4OrXDWY8UZzU=
X-Received: by 2002:a05:622a:598b:b0:535:84ef:2e26 with SMTP id
 d75a77b69052e-549dfce05fdmr11810771cf.7.1793697272817; Tue, 03 Nov 2026
 01:14:32 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
In-Reply-To: <20261103080933.GA4213@lst.de>
From: Luigi Rizzo <lrizzo@google.com>
Date: Tue, 3 Nov 2026 10:13:56 +0100
X-Gm-Features: AclHuK_l2TEIEs7qqznKn-9_c2yONWQ9t4tXrp8CyyoGHrPwnIyHLaBfgdlxlp4
Message-ID: <CAMOZA0+Fhq0_Pm02xGWpex06vb2y5pVzuFxOk=URZB7aq0xJ5A@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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

On Tue, Nov 3, 2026 at 9:09=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrote=
:
>
> On Fri, Oct 23, 2026 at 11:50:23AM -0300, Jason Gunthorpe wrote:
> > > Disk I/O is still potentially affected by the same problems
> > > (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> > > in confidential computing...)
> >
> > The disk folks already have a proposal to address all of this using
> > io_uring and preallocated buffers. I really doubt yet another version
> > is going to be interesting there.
>
> Huh?  If you mean the dma-buf I/O it doesn't really have anything
> to do with disks, except that this is the first user.  The dma-buf
> iovec can work for every ->read_iter/->write_iter consumer, and
> should be adopted more broadly.  Including by networking instead of
> their own totally weird different world.

Christoph, is this the dma-buf series you are referring to ?
https://lore.kernel.org/all/cover.1791975048.git.asml.silence@gmail.com/

I am not claiming that my proposal is a good fit for disk or accelerator I/=
O,
but every subsystem has different constraints, so it is not unreasonable
that a proposal for (N)etwork and a proposal for (D)isk focus on the
different bottlenecks (still there can be learning from looking at the
other solution).

As an example, in networking we have to deal with the following:
- typically at least two buffers per packet (header+payload)
- often, very small fragments (1400-ish MTU plus crumbles from
  data in different buffers
- extremely high I/O rate with almost no spatial locality, which is an IOTL=
B
  killer and the main reason behind my proposal and some of its complexity.
- on tx no good way for the application to pre-reserve buffers
  (buffers are sliced from a 32K per-task block,
  going to possibly different destinations)

cheers
luigi
