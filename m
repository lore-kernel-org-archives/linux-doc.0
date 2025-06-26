Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E522EAD1A
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959825; cv=none; b=o8EpkcPYogXAOwop2BLhoI/igKSojIv4kGEQBpBFTJzzBI9UyRRijhkgo3xJhRrfkDmfXlBqgZpClQByyl+Afb5yzhXhQQqjSznk7bxhLpu7Xh9lyfLwvNon91116pfO0MKDhRJ2pmIMvqlLU+3776lBjfzaDjk68WDbIRQqHeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959825; c=relaxed/simple;
	bh=wzwuJqhyKPA6pFtaKqL29WQiBrCe4P+CAFqirUycMO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca+kBfIo74DOyg7xmFiRiBb6aHT35t8zMvNTY3WBHAZPBE49kpXSSoyyCzhzXE9stIvD3/r5ZOUJv+q2dMND4LzkoKdFLBAQBttO+Jrw/kJMkx77WhTm7vBC6hRDfpvUKxkE2Mjr+I30nEeUIfq3m9+jBlq497ssK+yy5W9+8BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uRrzxsZG; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uRrzxsZG"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fada2dd785so17002136d6.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750959823; x=1751564623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzwuJqhyKPA6pFtaKqL29WQiBrCe4P+CAFqirUycMO4=;
        b=uRrzxsZG44G6eDnDIhl0c8BBQFpP+FPrPF7DTbhiUZRh/b4LXNOFAHXQav1PkJByrK
         qSTAP+IOM7gZP1/GDF+v194ozXfpnRIHmNItppCvJJ0AHYuO6jeZy0t4sjl7VlJ0A9cK
         w1Ds+40PB2CNyYoPyPaMYkZCFp+WOG/zEpOLM1/ZP+BTXEHwKafrArBUg7+T1dZ2jN/d
         eq5s3CMK6cocfL79zK3G1tnFenNtyr5Yl9LTZj2+6PGp3TlkUwsFN+RYZ4J5deFWY8GA
         oBEBua9ZKaiWqSbHQYmi8Ncr8S+8IS8bZeOHviN2iLFt1wIKtH0Ae5oh22CK9f3IYgwK
         8Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959823; x=1751564623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzwuJqhyKPA6pFtaKqL29WQiBrCe4P+CAFqirUycMO4=;
        b=QD4MqzsYdlZAt89ExcOLd/0Yb7D0lo8ncpR/NJXxcezuz38w6EyC8zhFnUKwuAC2sX
         s7jjj6XQS2sZ/R5pMuDsUuPIi2Ht8zLEaaZQ6nDPHksJLRroOgCpAwwlmaOw6qO/FMD1
         EHsCurbTnqWZxutA5PbXvln83+GmX4WiNm3qvCrBzXZVnQubkaxWKhHIqBaHWnEO1jHg
         p3uk65nQK/iU4P4u32yN5j6HzPZUTvyg6VLq2KEQvPwY/RC5Ge8qYOop/58efqhRS+xr
         uNNMFzqByvqeYWiQyfs9dJCOCOCdLKDqdch0QXW1IXe9hquJFSNoyYEjYK7ASnhDIhzV
         Ffxg==
X-Forwarded-Encrypted: i=1; AJvYcCVeguuR7aazHTLmyY1DVRJtwcfroUOI+IRDqM3bgBBzM/IaBPaweKFUAgjQOp0Xcq41IO+yVOpWbH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3B4g+sZGjeZUwzUcMIQu4Q/NuNOL4vYHjLhMe+H7+aZBkimhr
	xwtETtHTuKFPRN5ZOGD5TyawoZkFXSXVF5S9suoCIRwX3O7/XL8GcQivz/X5RQAhaj3+w2sr9CD
	rN0KkR8i3WOFSRvB3ZDJVteIMt5F/Y8rbrIqxviIy
X-Gm-Gg: ASbGnctcklif8KBMtsDjl6MBLb4FxcC3tbFfouM2c+kV6FknEBeS7IhWnO1oHqi8T4O
	0pFxfgxZ3n8Wocol/7xXyMs/zCjDfPfX7yfmCN9QTdVFL2FO5Ai6Fsudh4cIXXT0FnpQ4MeNNAQ
	jVdeyAq3ppjC8DjlbsqpvuqFVQrS4rJPI6f4b/FJ8bwZiaNP9SuFRmWVXjtEtQGc+O9jPEDKqH0
	Q==
X-Google-Smtp-Source: AGHT+IGdh/IJuNTnlJ5wP1tLYohn6WiFRhrAxLVoOATEeK6niUOWXM6UN14DbuitTFowPzRbNWX5WutFoxjvCZRzqB8=
X-Received: by 2002:a05:6214:2aa1:b0:6fb:5f1d:bf8c with SMTP id
 6a1803df08f44-6fffdcff5c9mr6100526d6.11.1750959822639; Thu, 26 Jun 2025
 10:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750854543.git.leon@kernel.org> <cabe5b75fe1201baa6ecd209546c1f0913fc02ef.1750854543.git.leon@kernel.org>
In-Reply-To: <cabe5b75fe1201baa6ecd209546c1f0913fc02ef.1750854543.git.leon@kernel.org>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 26 Jun 2025 19:43:06 +0200
X-Gm-Features: Ac12FXyaDZROOxurpvkcs9ZXthsb5DglqUebhn0NTWwPhDYnIEGQjkQ7oqhUUFw
Message-ID: <CAG_fn=XWP-rpV-D2nV-a3wMbzqLn2T-43tyGnoS2AhVGU8oZMw@mail.gmail.com>
Subject: Re: [PATCH 5/8] kmsan: convert kmsan_handle_dma to use physical addresses
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	=?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	iommu@lists.linux.dev, virtualization@lists.linux.dev, 
	kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 3:19=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>

Hi Leon,

>
> Convert the KMSAN DMA handling function from page-based to physical
> address-based interface.
>
> The refactoring renames kmsan_handle_dma() parameters from accepting
> (struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
> size_t size).

Could you please elaborate a bit why this is needed? Are you fixing
some particular issue?

> A PFN_VALID check is added to prevent KMSAN operations
> on non-page memory, preventing from non struct page backed address,
>
> As part of this change, support for highmem addresses is implemented
> using kmap_local_page() to handle both lowmem and highmem regions
> properly. All callers throughout the codebase are updated to use the
> new phys_addr_t based interface.

KMSAN only works on 64-bit systems, do we actually have highmem on any of t=
hese?
