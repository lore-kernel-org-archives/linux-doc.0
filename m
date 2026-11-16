Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794862929;
	b=FXFn0kJlNjWX/J3K66V6i7cDNERyDcE3jgrnh8kbv6RirPeJI9f8anSW/mTX7GK2yIIr
	 lQXSqQBEN2JV8jshpudYBnQxNP0iMOArA/mEDjIG+ibxKKnE3cAGTP783Cb0ba8lSUa8o
	 cBLSsPSmQx7XPRScJY7WOpyw/MbNTBiFEQ2A2EUBmJsfHysVWcswYPlB98gW0/KufDjAs
	 PQ7NfnPxYp47PV/1Y1TnB/Y1QTUG7xSfHySaLrCcoDQ0CL+rTIohqYA/tAtZCzrg2MDPL
	 9wCSi6vBYyWhU0gFw92dO087qz2lQje9mgN+dAUWM1X6uipkn2QS2PAohOIOBdgAFMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sCS5KZMGBLoezFGXiUNPAPDsKb/lPpeScZna/DR+4wA=;
	b=iGs5R/9sE2PqwRjG9EJjK9Mz/ew092q/VCEs2BUlHtJD1QdfuuFJuRq9zMB2DqPlCyzo
	 WhelLzD8qDWbYqXvbLScF0vuvsac91ekp0n1zkRxgo1WBlDeVJU3Sd2XzQHN9noGyeGf2
	 wzOyz+SR7cuJ05wqt6YlIIgAngXUtXAuvaU3uDsCaM96OL6WGHNPTAnC5/JXN4/lWG8n4
	 32N/WVeWvnqQYyDhsmSvdlqNgI5FxmCrw++GiChxsFzJHcfQJocKL1sKxGtgiJouBVG7Q
	 pniuN9Joqwa89ErNrSyCxaD0AXY6M29hbu0lRRibVT24gCz8DGsEJfkieikVk7QllcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l7j4lma6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431D606A329
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 21:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5431D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l7j4lma6
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-150ef97e790so168c88.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 13:02:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794862928; cv=none;
        d=google.com; s=arc-20260327;
        b=nTHMwu/sFTUHLUxAQSnDD9e+8+ROUEQ+7JoLB/hEE0Wddbl1/o0b6BaaTtVyO048xN
         R/aQRwwrDRuA2gCQLmihUOpr0P2SDH6KqOA1sRvJHVd4ddnsKAJp0TuslwWDqBYtvncZ
         7v9+4/DFSPaEtMdwdJNYCtg2dUSStrCalYshZy2D8TLpG9rU82E60F59nNNLGLLUmXuk
         6X7z0mmB+fHYO9Ym5fYyQDneXGoCugpGvU+JI8rVkFjLFt/CYJ4t5v2m+XUky++f5dJs
         EWO/dIc9yEIeJryWHOhqs2i3NEd6qTES3OnitlUbkPWsB1legH/j3f3VNYlm5AIX5e98
         lJaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCS5KZMGBLoezFGXiUNPAPDsKb/lPpeScZna/DR+4wA=;
        fh=yezspQC+WBorJRnP8YqVs+2ayI6U1WjNDwDjfQW4UU0=;
        b=AvYDdOHZQFL/JPbKoKLNmVS4vBw8HSkr5m7iVLbKv9+olDzd/UJmeSA1JM/YdvhTu3
         d9mTWlKu/6ATOMCUW9AhUGs0S6DPJ2J8Nc3N+COzsH0SnHTJQIz5CMDuGmWOj0YAu18N
         C9o6CfWwMVSPmJuxp4JF92sYMXGDzOlxnjAsZJZuYi7XLbFBidCCunssYc6RTEBn8Zjj
         +bJXd4Eet/xkmLra78QYBhDWik9JIXJxxkQL/jwzNqOmaaG0QwsH1syVFhmEezpwSpSL
         4FoBvYPwM+sovuAf1BAYid1+G2ZipIOpiiNanrflT7kPO3EPPDykCqZBYxYKwYx7cjKG
         JVaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794862928; x=1795467728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sCS5KZMGBLoezFGXiUNPAPDsKb/lPpeScZna/DR+4wA=;
        b=l7j4lma6OIn67WMfsxxB8uEh6xG03Yq88f1nPAQ4YInGe7EdctTT+ampSCS3Oe9cgL
         1ppSFpVwbB3cQZ6DR+9z2pJc2Z5okFLv26O7AOnGLnchsWxXZetzufv2sZRiFf6QUGyp
         PHtYo+rxVm1hWHX/md1cnc6ROLsjn0kEqcS64JUMmE8Me55yF7FIzAuR5aD+5J1rNDPp
         1p4p+dBbWdG7C7+PvLijHT+AjmG95M56l62Xr+KtEH+3MPhxnTCwgYUbZKNbJa7QElCu
         GUz+G4moo2XffnQMhAzh4/0v0phnOgaWQspJ3475uaZ9YBfKfEa8m9FIZ8QvJLG/6slD
         O0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862928; x=1795467728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCS5KZMGBLoezFGXiUNPAPDsKb/lPpeScZna/DR+4wA=;
        b=ycwUNK2C6mBC9OPXMayVX3m76aHZKm8mnQFAqJBCGXqd0B+sxzF/kVXoEm4uyAJiJ+
         kG7l3CKv+nxVWfiRBNpPZazE9iFt+Mzt8+62IVNpcvNMNhlw/HQjHeChlnCaHirIR6PW
         t3lXsV0/ZQLpiJjyagrqPjBVaK7YybE6Lqsv9oCYvbOk7gb0/ZdTpoo+mZKVkV6hWj7E
         SHrChz0nqkHkqJf3oPLIiZgbkG03alH9WaiFPau8YsluEekRorYkIkQIGNGEN3rYS8sy
         sUhiZ843DEapOOHH8kEW+aES7bWOcvFuklU+BAUQFmkuP+2noPh8dKNGyk/nY3bHv/LG
         Ygcw==
X-Forwarded-Encrypted: i=1; AL+hErEQd4Cnt4JmZVm+WLY5ViNa+tZuH01M+bpzbctKTZPXaTpnLnmrhOkZNS8HPw2/eqsvFXRpVub2Ml0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JE0SJToeVWq0dXwU4sjE9AbL7SCgK0ExtdLSfzbDrAocBfUHD
	4igBo1r4ztTIQ7DymxBUA/UecW3ThzSD0CjXCH3jkY28B38Hvxkv8E1UYzdY6WX1Y7vzMJccne2
	eckZIKDtdN1u3TFW+47pgZTJd9PEHxsmTT8O3mZrF
X-Gm-Gg: AYBFou07CuyP/Qn2TUmGSTC3ZHVkZS696gJSUJTSVENLMtzjWwyqwGtWIO+63LJCOoi
	WmQ/fSp03mUv89RxJvEo7mc89J0ot9uZuIvix/dKmHG7DJ966L/W51Rsvgc5BUSbvZQjgXySKPn
	K18Wf0FN8qf3a/lipzYOX2aOMJZH29tI01Kg4NrTZzFVaCiUB0Q2LCSxUYKAytLI3KB5IqFzQTD
	YKdbCqaG1myvBqm7j2qInGYy7s0j0HHKjPXMT+O5IpEwDVU368xnyWnLEulP9Rs6LCceu6YSoQq
	L61zliKoPF5ZkGElS8ZVSqBMFVC5UqIDeZj/1WL46ZwyuydkgKu2WnqNammxCLnDaaT/OoaYU/1
	sppmib5hUGYsIworlAQ5FH9hLEKVYvENcojw=
X-Received: by 2002:a05:701b:290a:b0:1b1:d8c:1ed9 with SMTP id
 a92af1059eb24-1b53b1c51a2mr13906c88.18.1794862926873; Mon, 16 Nov 2026
 13:02:06 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-3-bjorn@kernel.org>
 <CAHS8izMaAv6gX1NeJR+QCf43CL+DC4DgePRNNxSLoE31jxHU0g@mail.gmail.com> <87fqx2j5jx.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87fqx2j5jx.fsf@all.your.base.are.belong.to.us>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 13:01:46 -0800
X-Gm-Features: AclHuK8rxGqdW2QY8q6YZLLoufNsDrdyzNs-Y5WE5rB9qXBUxJnfIT9hDTQTu7k
Message-ID: <CAHS8izNVDU8+JzeuwDBmF24C-XqkO+ox01qnTvK665Y8pyWNLA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 02/11] net: Add memory provider capabilities
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:47=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
>
> > On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@ke=
rnel.org> wrote:
> >>
> >> The core treats every memory provider as unreadable: installing one
> >> needs header split and no XDP program, and any page pool that allows
> >> unreadable netmem takes it. An AF_XDP UMEM provider is readable, needs
> >> XDP, and hands out whole buffers.
> >>
> >> Describe providers by MP_CAP_READABLE and MP_CAP_FRAG; devmem and
> >> io_uring keep their behavior with MP_CAP_FRAG. A page pool takes a
> >> readable provider only with the new PP_FLAG_MEM_PROVIDER:
> >
> > Why do we need this? I thought whatever creates the pool actually
> > shouldn't get to pick whether the pool picks up the memory provider. I
> > thought if core has configured the rxq for a memory provider then the
> > pool is forced to take it.
>
> Thanks for looking at series, Mina. ...this needed some thinking.
>
> It isn't forced today either: only pools with
> PP_FLAG_ALLOW_UNREADABLE_NETMEM take the queue's provider. Drivers set
> it on the pool that holds payloads, and keep headers in host memory: in
> a separate pool (fbnic, bnxt), or outside the page pool (gve, mlx5).
> That works because every provider so far backs payloads only.
>
> UMEM doesn't. The socket gets whole packets, so UMEM has to back the
> header buffers, and with multi-buffer the payloads too. The flag was my
> way to get it there, but you're right that it's the wrong knob: it lets
> the driver opt in, where it should only say what each pool holds.
>
> How about this instead. Both sides use the rx_roles bits from patch 5,
> HEAD and PAYLOAD:
>
>  - The provider says which buffers it backs, next to rx_page_size in
>    pp_memory_provider_params: devmem and io_uring zcrx PAYLOAD, AF_XDP
>    HEAD, or HEAD|PAYLOAD with multi-buffer.
>  - The driver says what each pool holds, in rx_roles. A pool without
>    roles but with PP_FLAG_ALLOW_UNREADABLE_NETMEM holds PAYLOAD, so
>    existing drivers don't change.
>  - page_pool_create() gives the provider to a pool whose roles are all
>    backed; the others get host pages. No opt-in.
>  - After ndo_queue_mem_alloc(), the core checks that the new pools that
>    took the provider cover everything it backs, or fails the restart.
>
> With fbnic's header and payload pools:
>
>   devmem:                header pool host, payload pool devmem
>   AF_XDP single-buffer:  header pool UMEM, payload pool host
>   AF_XDP multi-buffer:   one shared pool, UMEM
>
> A shared pool on a devmem queue doesn't take devmem, since devmem
> doesn't back HEAD, so the check fails and the driver has to split.
> That's the "headers in host memory" rule, without the driver asking
> which provider it is.
>
> Wdyt?
>

Hmm, I think maybe the exsiting knobs PP_FLAG_ALLOW_UNREADABLE +
CAP_READABLE covers your needs.

The pp says whether the memory it provides is readable or not via
CAP_READABLE (or !CAP_UNREADABLE).

The driver says whether it will allow unreadable memory for this pool.
For header pools, it doesn't specfiy PP_FLAG_ALLOW_UNREADABLE and for
paylaod pools it specifies ALLOW_UNREADABLE.

The change I think you need to make is: today we disallow any
providers if the caller did not specify ALLOW_UNREADABLE (because we
assume mp's are unreadable). After your series we only need to
disallow memory providers if the mp is unreadable and the caller said
it's not fine with unreadable.

--=20
Thanks,
Mina
