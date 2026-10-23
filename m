Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768361;
	b=NFiFSfXNPL+eA7xhbNkgO0hPPm7D7Q3JHctyOhLLWd1lRfVwN7xysU+m6dZoSb1WYfZo
	 YpCjdBnFM6urQwu3/eJb09E40+zsj6e9sthmpfZppAeumGdu9mJtk3ZQ7JisjAJCmhpC3
	 gK52PDp9J3t0n1cZhWMJp5gWh4BhwRVSUKMhFXtWZwL99xWH9+k9aspupmkqGJQss5BYn
	 hwu7ei4WWnKl/llE1bnoE/+qTWSc/fKRNiMioadnFJRssuTK4Ttbn6501Zhctf5ix6UrT
	 WSYSpBPCUPTrR8eT2L8viEP6WeExBF3bdwT2jC/bHsHL3JgvbjlSEb72OC169jwOSVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
	b=njiCBvEwHg4Hrx2+4sqXwRrwRmIRkKt4keU9aE7IQ3j+HXS7ZCU18ez+v448LEA+TSNS
	 jZcRoIWQBc4LhgAWlyBIfmrKO2hr36F3AVcQK8s238j/HfPydAGBgp4BE9FcEsDwQf/Zr
	 toC4mDW12bHjJEOD8rBNSWNnQroBFiX47hS3PF8DyZ0DKVjutkW00LzNb10iQy4VA15Lr
	 LKH01Rgy/+sK0nKloJ0T4RU21mv5QYKWedkS1DYqNbhOixkwe680lWNXWAJTMdLmrATw0
	 CgLY3KBKDKgLwJ8j6apUBVcynSMMvaaTQAULUVL4+/fdepFngJtcYuJXjZGBVn77qTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FA1ALNrS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB061606A322
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 15:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB061606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FA1ALNrS
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so60925ad.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 08:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768360; cv=none;
        d=google.com; s=arc-20260327;
        b=Iw/HRoofi7yNbgpcX5oad1w7soJ/QcBydiQjo3BhF4B0QegdJVogyVArl6sR25XK/h
         DGXaPxVI+YV+g3OD3nxP2W+U67nY0mnxWJd3dBmP5jPprnE6wa5c+uibQBxYwFWNJw5/
         +3cwXwnXvNmnu0eZB9OtHutgRQYVduVd98rjb0wDKx1pK8xefm/yCpI1JZ3PSK4qSmYP
         KyBBJpRipLjrZhp7piv3B2f0WiOLbFahz3JpOK1rWOZVfwARGXl+dJ08xJpfCJflRKV7
         yrNmNmny44DHimc0sDZnntSEbb87RM3yPN9jKW/DXAB2/9f90wu1NY4HphK3udN7nUod
         oayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
        fh=FVAvPGo9KwavGtZWb08nDvI1p0f9S0ky7I3e1TH48gA=;
        b=iP8PmM+IUU7cfOR8+BsdZ85csnWQOEfswn/1TpkV+RUe/5FO4APxdx+UKb8uhhij/c
         0AsCiyS3/SY0KlcbViu/83wp+pNJj48CN5Hd9ZOg1mYkptqRJOoP16kLXmonljXq/ou/
         6ZsNNruKsUKdXjN+k7W928AYerV4mf1QmBy2COpB4HkeE7Ahusv3gXmMi6Nx+XJX8/EK
         oCr4JxY9tQWIkJ1/rXFDuPtAU1AAGBWcsVj1yMJ+7g/Otimhoh0Gtjg4KsFdfkGlpddE
         U03lU/l4pQHf+yu7vjEcHVp/TODSTxn7/UqdZaLwuVF1tM5T4v6CbXPnFnOmo0DqQxxV
         osJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792768360; x=1793373160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
        b=FA1ALNrSzo+aczkKotmLBVK24drLA8Xv+LZIoCG/tghiGEPsOcpLrHsGB4NxDwOPNO
         v9btTMfj2TUT2ME7MHLyGcYZn00t5NhDWmYs8B/upCPVYfVMZCuS3SM4lAK64iUiPH9j
         ncWVdRv9xYCrFdeHYtkXgXq5HdENMASP6P1cLAahsijYt1MlEcBzXVnewQSVcXj75jXo
         oX+4LvaWMfy1ZHuV+IEdyo+NsjZb9bgThh3R64BMx42FVa43uBb3ClvG48WDeW+ENXjq
         NJIKXPNKSy/+t3bLequ3La0Aw0+wNUS4fubMk8xHGpDCHB5FH3o0bNKJfcZoFPPsP48j
         7FsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768360; x=1793373160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
        b=vmvGkfo+89CNVxn5hTHJeRFfioo4NlnWQMDr3lH6DXna4UhrKHHx7Syjfp5XJ8QTR+
         /phuMtRZg8OR/PmmKvoM8KkkGnjsWSRLFhlLIxjEdR25g+I0uGdRTdnILZnOUB+k9rJb
         wmn4Iq87dEfUw4nHxmXLCBlX+1LA254mrMLu56iQcMTcTWCee/c94b18y+Gq4aVmGCNf
         M51ynNlGy4EJVyOKIw73DcEKLlA10gH2wJl0U4u5OZ+rdNYzIKbOH++Y6XY/1Br0LqiG
         CuM0muhg8Aanq7+USAXhMy++9JQUg840GZw+KrnxE/iP24jNpuLwM8zm2gpoDxuEA944
         Tg1Q==
X-Forwarded-Encrypted: i=1; AKwUvByiEdNw0YP0KIdj58ElWY/TsG43G+6IH1UIAf2rnzuAdmbTt6rrkk+8K3sT3ZAuSyZhzyMg1zXHxG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG5Mxi5P6LK8m5U0Da/N+eSvt9UBNHDRZ0fDXTh9nZ6d0wMWXT
	hiF1OdzH9PyVhCRvPBcGwegGJWVmQycTUSeH6eq/Ui4x8EYwQWBq7jeQniXOHwDiNC5KlsMCxIt
	g9Y01h9xzCbwleyR6c2vU8kNi+jdXpwXVTMukGOO9
X-Gm-Gg: AYBFou1t3APKHLF/+FJpbalnQupgnuoZwGJ6HRxRaY0zvz7z0fI3KZFK5BHyj0MPU+f
	L4wP3Td5LM+x2UDjCwmbJ+84URgDNFfodOFGWcJRZZ3uuYxP52Tcs6d14N2WDj0odtd07lWDGij
	RdL7N0hW1Vgpk0v0V1tzsRCeP1mS5keTFqZi19kUlfodI/0D5bRwY9T5rAjdEZjPvE41FAcfx8y
	K8LoLcYD415h2u5T3rzQYriqvbay4oyYeWbpKFWvQh2HCnmkAFDxlq4LWfVEA0RNBIqeVP7OJML
	TUcQHAdnFBBH+dTlpLN5COSQH+A2yqTRPw/kNlSrUKCQG9F7p5T+5vOvz7W3WRAshK17Cr9uvR5
	HeJ66OXB6Yh1DFrBnS4P6f9qoQF6/3fOd4UGeXA==
X-Received: by 2002:a17:902:e84f:b0:2d0:1aaf:daec with SMTP id
 d9443c01a7336-2ea7f4e1cbemr4092325ad.9.1792768358959; Fri, 23 Oct 2026
 08:12:38 -0700 (PDT)
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
 <20261023145023.GH3977851@ziepe.ca>
In-Reply-To: <20261023145023.GH3977851@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 23 Oct 2026 17:12:02 +0200
X-Gm-Features: AclHuK9W5A7aXTPFZUdD2jRhpUmEtp7k-vVQ254ZWcJE4ItfG1TCZYdvtBT8nSc
Message-ID: <CAMOZA0JfsviAkojjEewehxMq0r0AboS=L6AWafMj4_Azaeg-ww@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
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

On Fri, Oct 23, 2026 at 4:50=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Oct 23, 2026 at 04:30:25PM +0200, Luigi Rizzo wrote:

Just addressing the last part:

> ...The CC stuff seems
> actively dangerous. Unconditionally always using CC shared memory for
> skbs is completely security wrong. What I have traffic flowing inside
> my VM between containers or something? Does this end up putting those
> skbs in shared memory even if they never hit a physical NIC?  Same
> with a TDISP capable NIC, does this unconditionally degrade its
> security?

the current series was RFC and "unconditional"  just to show the concept.

My next version (a trivial change, really) is fully opt-in on a
per-device and per direction basis.

The unencrypted (or pre-mapped) buffers will only be used for traffic
that hits a device that opted in, and only for the directions that were
opted in. So we can finely tune the configuration based on hw capabilities,
threat model and performance requirements.

cheers
luigi
