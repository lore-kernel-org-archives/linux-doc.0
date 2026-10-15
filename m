Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048AF4E8E0D
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066401; cv=pass; b=PZeVMlBDGlBN0n+IgK6R2Ow3CDi/Pr8ROMNi5Ai2tUb2psT8S9/SdF5AV+jJlXcPtHBba4GE85iuQQ7w83EGqiV1GCEfXcKDrneOt9spv+Inp7B5mhPx0fEztkCOi6vi7HFAyAG1u+b7XcfhnA7gNNpW/J6wJtVfCXjklkmaT/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066401; c=relaxed/simple;
	bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1d8PiRfhZwNoVWrYncit1QMC7ffX8RV6SmKFvTiNVKRH8mWZbdOv1ijZC/c3xZY7KKlZthImW/mM+KTWrRZJ0IZO+09lYas7gAOE11ksLzcDvH7zzNLaciI8xMMHWuL6Z5IizWNUn2bllmq9A02ZjumWTz8w0nV/4qmrPJ1w9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFUv0rFw; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFUv0rFw"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bccc73eea4so2712720e87.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 05:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792066397; cv=none;
        d=google.com; s=arc-20260327;
        b=AYWAU8ZGTWeSrkBd9vY2yzIVjamEM7WvjAo5SQwN3NmVH5HbXh3XEXUV4OzDVmK8oh
         pp1TutwXsqPE2Pxs2f1SMjxC4jd5zUKaoP7B3m6X4Eo6Voa+Wndkg14lx+DYFSeL7ov2
         zOInz6B1WdCuE56+Hys6DeFXcxUYC9VJofhtTA9qkCKLYLPFIKYvh65OyGBCn+v/e/RS
         MGMw1QLNL6/d3HoEsvUYzWI9jgF/Tfu4mwqbJ5Znxa65vgoWPXUVgMIYezvPd5xFHX65
         HYYjB+5ikSLmPcbpzkw+QKw/2BYxz4ux+cEV20x1o82z3ZDukVkRtbkSE5PG+shoaqJ3
         Xmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
        fh=uRJh146vQ+D8LMki3He07Mh+dj41hROE5oxQpYr1vx0=;
        b=O0+U/hp2WDE4r/3SIFEHmTRU0gX0ooC1yvL4kZC65O+iIi2g9b7ZpADksWiksw14fW
         dDbus286LSJbg2IV0T16Omr3FyXH/uogZ0LBFCdCt+Zd5WeuiXZ+FO5KQJvRFFQAw1Ho
         MtjLh/c7XS65jk8Frq7XK7AFx5y0RJHugFzWrzxbCEgx7oWbkp2Hbrpo0GCHFhdYhniW
         vjQrVIcpypIOrg/2k9I2D7v07uTvWQ0qqjPic2K7Wq4rCF1ui+WN3gSNMVP7DGjg/Ue/
         QBXaRp4plQ2FCJwOdLiHGKLCF3F0IFvDxITGvJ0IrnPTivaGwZssl37LZSBsm4tUxkF5
         HF3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066397; x=1792671197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
        b=MFUv0rFwkY46TMBt7X8wNlMgYfH2YjM20arVDogzgWTSRu/Y6LyM+DTrbXsuUU4IIM
         KMefd9j1ptRsfqlo0pBgpWwYnuwS7fgCGXKEckghBS+1MbY5V0k43XFCPQfNBRIo7rqn
         7ogA4wk4yI3JLiTiW/wgvj+yXuLzs7al5YO7pu1bm4MGoB+M3Ehh8qJsKATWAJkHuduv
         PK7Sw7a+CUJ3u0rQgaaMXwZoRqciyvgFJdV9v6dr96LtRVBOr1510olmTRyInjU3Gj5i
         ycB+cHUT0QzW4clXhHZ1Tr619ClxvRi78UB0NIs+BHrDyy9A1FwE0I9Iucm1YJ3qhBiM
         Q9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066397; x=1792671197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
        b=lsxD1JSvgiN3cqKbkgRnhH94rdGy6Aeq2H+QnHHYBbNftF1fp/yOiY9tSofrFEevEO
         32DJRcnGBvxwmM3zfnXAKddw2RGPpje+aXw7xKZlV+V+UskDhIjdSYm6I7f/NP4hIk4l
         sEyd9PO18pLCun3FNIW0IVffIfX6Q/g2uTb6rx43bg6KUqGCm8XV1IubEZRhTEJCDQDe
         qMZES0LKUlyK/oM07KJ35VJJ10i9pJfLGPY8x93GKTsZdUj6j7XAJbFohhwjyNYgAYR4
         Bkfi50C8h88ajhBZJBx17CJlVXlVB1//ljeJrcOfl2OT/GiAoqSkAbSq9PzzDXigLzYR
         UIJw==
X-Forwarded-Encrypted: i=1; AKwUvBwjlg0MhMTBbVfqsq1Klumw+y0Nn0QrDQ8qHoV52zfb0QPdh9wOxsAS4QHdvhBxywoxXr2cahNhoI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZc2DDlCf3OnM7qHLLfwynDpQMV1ocpn/WROgVWRo0P65vYtg4
	z2QiP/zcbatLAh09mey82plSsb1o8TPo7kYLqqcCB0hru2jQLAXWVbMqYlBzkKlmWg3WPuy97lL
	8eRFc/wPtc6W2GEWDbs74WG6idKtLx9E=
X-Gm-Gg: AYBFou3jxNIARsuK0l92Fgfg/kq50DSAC48bIjz1UkCIG5dddSZ06PFty7vtqykX34H
	2NJhXw+Ry2GhVkNXdpM47N/G2JtzSP8T9zB1hW7iH7jGIw1/Z6Wh6QwFc5tADR9vndDABIDW+Mn
	ZuUyfW7gWsuntdUiVVZBk/3cC16NwgwfmIVAu1oKiravQfQtqBQJRFuBc057cn3H/E5YFCgGSXs
	P0u/LtVoYTFSgQHGWf8QWdPTyUyUf4O0uyH9kTwa6miBxJE5EZXfc5/apouigt0tvZua32T3mcy
	NG5euSZA/N1ev86JVOfThI4TgXw0GzAMZGQF8KSPgpsMRXneZvvKP4ikUSsSHhTYMV2VOgCwYVR
	NR5gtnYrorEa7rqnI6kaHKOaV0TzfcMr4/Dr4DAoYZGmaQqv1qmNbU1XfJUTlbI0fy6/3Og==
X-Received: by 2002:a05:6512:b1c:b0:5b8:e9cf:daa6 with SMTP id
 2adb3069b0e04-5bcdd4f080cmr6853474e87.10.1792066396625; Thu, 15 Oct 2026
 05:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
 <20261013103906.2660384-3-wferguson@cloudflare.com> <877bjk893u.fsf@cloudflare.com>
In-Reply-To: <877bjk893u.fsf@cloudflare.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 15 Oct 2026 20:12:39 +0800
X-Gm-Features: AclHuK9xypnzrrqwCcprd2CwQO7kzSIQ141D-bgf0CuqS7x-S8jo7RzifyoP-go
Message-ID: <CAL+tcoBjfDEVGvvSXZHkiMjq5jat+5OJE-7uJr3MvtFyzn+KUg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next 2/4] tcp: add BPF_SOCK_OPS_TCP_TS_ID_CB to
 assign a TSval identifier
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Willem Ferguson <wferguson@cloudflare.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, ncardwell@google.com, 
	bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:51=E2=80=AFAM Jakub Sitnicki <jakub@cloudflare.co=
m> wrote:
>
> On Tue, Oct 13, 2026 at 10:39 AM GMT, Willem Ferguson wrote:
> > Let a sock_ops program pick the identifier that the previous patch
> > encodes in the low bits of TSval, for passively opened connections.
> >
> > The width is set per network namespace by the new tcp_ts_id_bits sysctl
> > (0 to 8, default 0). A listener opts in by setting
> > BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG, typically from BPF_SOCK_OPS_TCP_LISTEN_=
CB.
> > tcp_conn_request() then runs BPF_SOCK_OPS_TCP_TS_ID_CB once the request
> > socket exists and before the SYN-ACK is built, so the SYN-ACK already
> > carries the identifier. The program sees the request socket, the SYN
> > (bpf_load_hdr_opt() works on it) and the available width in args[1]. A
> > reply that fits in that width is stored with the width in the request
> > socket and is inherited by the child, including Fast Open children; any
> > other reply leaves the connection unencoded.
> >
> > The callback is not run for SYN cookies, which have nowhere to keep the
> > identifier, or when the peer did not negotiate timestamps. It is skippe=
d
> > for connections using microsecond timestamps and while the sysctl is 0.
> > The width is captured per connection, so changing the sysctl does not
> > affect existing connections.
> >
> > New /proc/net/netstat counters report how often an identifier was
> > assigned, declined by the program or skipped. TCPTSIdEchoMismatch count=
s
> > third ACKs whose TSecr no longer carries the identifier, which shows th=
e
> > echo was rewritten in flight.
> >
> > BPF_SOCK_OPS_ALL_CB_FLAGS grows from 0x7f to 0xff. The tcpbpf selftest
> > used 0x80 as an example of an unsupported flag, so move it to 0x100.
> >
> > Encoding makes the timestamp clock appear 2^bits times faster to the
> > peer. That shrinks the real-time span of the peer's PAWS window, and
> > peers that keep ts_recent for the RFC 7323 24 days stall connections
> > idle for longer than 24.8/2^bits days. ip-sysctl.rst documents both,
> > along with the lack of TCP_REPAIR support.
> >
> > Signed-off-by: Willem Ferguson <wferguson@cloudflare.com>
> > ---
>
> I think SOCK_OPS are considered legacy.
> We probably want bpf_tcp_ops struct_ops.
> See [1] for an example.
>
> [1] https://lore.kernel.org/all/20261006192601.1875100-11-kuniyu@google.c=
om/
>

Exactly!

Thanks,
Jason
