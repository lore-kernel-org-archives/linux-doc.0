Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EA62C2372
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 04:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760414973; cv=none; b=g8scCfT1HiYDQM3gJ9RKqWr/xjPrTbeqyX12x1LDbesvo4IbY+Y6r3LGt4HChQh0Olc7bcNU3myTX/zOMNHZznmoXqsgGLzRWmSXloFtj2oCZPloHOuRDilKu9QySsSbVHovsCHtmNFxCUjwFFnVCxAfjCMj5pQKYexLKh2AyII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760414973; c=relaxed/simple;
	bh=QmKsXUDLO2UOS9i7oWY5FjWNJqQhabL/4daX4mxaWDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hm6OtLTz2eQG7Y4BIQsIVa5XZZGfUibUENTg52zRCuIsBXND/+n/I/YqNwJ4lFyVoyONhaDsVkn/79OXNyjJp4O27JVY5TaMYYTsb8hF5t4ozgPBbzViESeyswNZf19BQdzTW5TVqMGQwYvG7uDh/KjFpSMcbrLGpzRjRY+Zpyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhT1ss6r; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhT1ss6r"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-858183680b4so809874185a.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 21:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760414971; x=1761019771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2t/ysbOLBQifu3AncOUS++OTG/U64LIdWxNEMaNf1Yk=;
        b=RhT1ss6rJnMKvB52ZZtuXvA/QhV4mRfZ5PP2uU2ezBtgpZXS70/ZHNok2S80/YCWLe
         UBODpQ4Ny9JsEVaJRHR/kqbLGjTJ/JquzUgQv/QesY5LKRRcfXu6mdRfWJmzZ3Ak318Y
         5aMdAcpNTdijFdL5Qq/3D2IXoQkwgcvslUTSUsmPGSSPQl5SSFlJaj3ZDlK0La7Vc91P
         oeXF1SP6jBQmvCDxCQcVvszEFVukppijE3DjPqkvOqHW+B/FbedTevOgjMfflD8Sh3Qz
         9hASe9cOroyvOhxe9JSGvJMm64SDA9T6VgOG+xhp/K1YZrsOX+dFDtgUChqd6om2Mt1Y
         ui1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760414971; x=1761019771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2t/ysbOLBQifu3AncOUS++OTG/U64LIdWxNEMaNf1Yk=;
        b=ABmfBHU34vZRnerkXsvWyuFC6Bkhtk4GdpPwWoOyLlGnzvF5PpFciw8Z8x4itbHrjV
         TNGruo1LV0tXLJ0o/BmZZ0UM56Ofg+UdmrXv928zSgwCLn5w8ca7cSAuv7Q9ZkAY+KAb
         wOmW9DxBzsv83sppX8T/cUZjDJkN4aj8GniBcAS+SX2QzxFafexYIa1UiJhj1ZIUNT1O
         TJMmsc9/jXtQyee0JQx2AXI1sdQy7y+tAKaPjVEVZxAmJfxn3DBaSsh0Un1lNQr+AO1B
         5DLbEJOdrXvWnHina2S4xOB8ejILBGE0ws1dZhVF3ysNRCsOdV5tP7UbBjccY8B3kwIL
         BNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKqSmL5R6zC6JTtbRTpUKcxVZDlDr7y4JgDpBoJOQ8AHkkd7a+jgiGx9itTvLuvdgYnMyJ60r4DuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRKohecV3K4L8kt6I6NZk4JpFn9IE/xjFzSdb0BZDIjtbo1n81
	7rgWYAYucmaC8gCbMCpE4dN9U6oy9DeOVhJrMrubhx+90cAPyv6lGp7hUsKTBxX0PTt+2LLCPFm
	HilyO6UIqeiJe3yylYgG8YWaea2n4KZQ=
X-Gm-Gg: ASbGnct+yfIq8f0sdH1bXBs4FPlFyz/B63U9AtLOEee0K3UGMpjvG2w/LJLzmHIUuMJ
	5Xh0fn1MSAaM7sKFe0DNKHxwIS7teF2XbKGfiVZOBByGR7JRrqZzNsqgubpoCdGk0oL+77ro5cO
	MHXE8GBJ6atPW5K4N+T5emtnGC1x0vLDCvoelgybqquCkAnMk2KaB27FkyWQ0n6DIxq8YSxNSjd
	Tq6y6a8S283q3vxGBsxKjtZsAun3b+qMYj5K5xcOhdwGwVGRlrUVIrzAQ==
X-Google-Smtp-Source: AGHT+IETi+Y5YVwDc4yOoULmeg0a/9GeqOMfyBB7w5srSvCikgvrnPsYVAaDacZCpZa84Vw9/offBLIwQL/Ei3+rCbk=
X-Received: by 2002:a05:620a:2696:b0:883:9634:5182 with SMTP id
 af79cd13be357-883963455a8mr2869615085a.2.1760414970813; Mon, 13 Oct 2025
 21:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013101636.69220-1-21cnbao@gmail.com> <aO11jqD6jgNs5h8K@casper.infradead.org>
In-Reply-To: <aO11jqD6jgNs5h8K@casper.infradead.org>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 14 Oct 2025 12:09:19 +0800
X-Gm-Features: AS18NWCg3XvdE0hLImKQoNMslsxmyNkYfWghrFBQZL30dkAgd-aSHHY4CyF1lvs
Message-ID: <CAGsJ_4x9=Be2Prbjia8-p97zAsoqjsPHkZOfXwz74Z_T=RjKAA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Matthew Wilcox <willy@infradead.org>
Cc: netdev@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	Jonathan Corbet <corbet@lwn.net>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Huacai Zhou <zhouhuacai@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 5:56=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Mon, Oct 13, 2025 at 06:16:36PM +0800, Barry Song wrote:
> > On phones, we have observed significant phone heating when running apps
> > with high network bandwidth. This is caused by the network stack freque=
ntly
> > waking kswapd for order-3 allocations. As a result, memory reclamation =
becomes
> > constantly active, even though plenty of memory is still available for =
network
> > allocations which can fall back to order-0.
>
> I think we need to understand what's going on here a whole lot more than
> this!
>
> So, we try to do an order-3 allocation.  kswapd runs and ... succeeds in
> creating order-3 pages?  Or fails to?
>

Our team observed that most of the time we successfully obtain order-3
memory, but the cost is excessive memory reclamation, since we end up
over-reclaiming order-0 pages that could have remained in memory.

> If it fails, that's something we need to sort out.
>
> If it succeeds, now we have several order-3 pages, great.  But where do
> they all go that we need to run kswapd again?

The network app keeps running and continues to issue new order-3 allocation
requests, so those few order-3 pages won=E2=80=99t be enough to satisfy the
continuous demand.

Thanks
Barry
