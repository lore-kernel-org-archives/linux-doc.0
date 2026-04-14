Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8182324B1F
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776177216; cv=pass; b=aIv9t4GjI6W1MhPiaKQ7FYFWvnn4oN4DsNnESsH3VkrryxfUXVIJItnoqsc1GtYxwFm+0JDpacI8HoHlNTOMvE2oJLrBbZ8pkzcG6XMp4eS/c78ZL3h1Xml5n/4FCh0CoW3SRgiVQu1deVqMo7V1aC2xSmGzwL/in51+nv1xLoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776177216; c=relaxed/simple;
	bh=z+r8cADNJ1goFXqiFxfvrucLp8szq64XSfMHf/m9FPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MF+Uv2L7qJMfJSkSc02+JRAuf7bS8CzgAqRtnACpZ/OIXRlmh5EZHgcyXzHA0d1RWALVrf8d3C5rPbbsqk7n0VIE7sWds+C+uNcY1XSoEHeXnS/kp1GhU+FjxkXy/uMwmrR/WwakNBMw7d3LRrDtQZgW5kJDBcsW1koNtAAHFHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1uY4nFb; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1uY4nFb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d74086e5bso1923451f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 07:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776177212; cv=none;
        d=google.com; s=arc-20240605;
        b=kwC7mELegh+L1xbzCAw6G7wBM0hotFRIr/eyhQr9gZvs6f7pq/KTGiCilEqegsDlNg
         WL3Ph3+aZdElKBTkb9FL6/URQ2xNLaSaFedUiav/reyJ0/73YTNXdoihDL4OQh6vWnUO
         swmObUcCA4BioFrpbyt3GfkNzVCFHv/uBUnSRacm0Rk6ImoCjiSjWbj2JomkvErUHlNq
         I/zthBTQv253mM5fZyPIqmFKgXhwt2zMDEvXbSuYrhSeZR/50Tm71POS75JODsuGPg++
         5l3xm1bFa3C213FxpnKSBVihJbbptRLk5n8aoYscbYDXLvmJyK6TTWuom+J3ur24wU6c
         wXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bw6f7AXQLyB14/caIw5kD86MDDHBEfPYqQSR/5hoL5E=;
        fh=59Kf+gCIXmLIn2U/5+F1yjQiuPiaxhQBdrLFD+uah8I=;
        b=VWWUxdaO7R1EhDY1rgh/sS7HLYf89SQw+MRzlFSy6dMraX2YgNPz05YJs7tb5YLwfW
         qMgseee8QAOOySYywENEwlP+j9a72DQEJ3H5jcOc76vyu4vhdCN3ukqG7SleQFxxraSP
         NHIiqP9uKEG2PSHmnNfd5lQmbxnUYcqjh+fDNWiG6nVbcdk4tAAId6Uk5bmeXnyBj2E5
         Bj1HMBYsnmTDYlhWd3DF3KtuaMbasBQx/qwfaOTHntjBdlduFoUdyNQ9vaK9dmSrc/u0
         jDyU3xVTXUmpT21Mzle2OoRvkF07odWKRNpE91qHPSP/229tFEs5eg1mfaPpQh57de3D
         U89Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776177212; x=1776782012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw6f7AXQLyB14/caIw5kD86MDDHBEfPYqQSR/5hoL5E=;
        b=m1uY4nFbY48r/Xpf0dgmOPmB9DkzFeJODUf2P/v9awivH5M9bJI+kaZ8lUv2TJJ7w6
         60+c6MD4hliooPY6i0iKklgtYsS6WEt6MJ3Yu0yjgNgK0u2qWZYDGPeu6KzpS+qV9SN0
         Hs1ZIWxifj3I2qEIwWCszVmZ3+WA8yapSNbrCejSe1+OEChdvyzgAk2W0FvskJoFRfKO
         5qbqExof2+YjkvyZ+bZhz43P92nF99wqvr8HT1itd+kbrtU7EkwGkIsT+OnpqUb67aYC
         SoxavYpjJbVYYA09w9m8REuOuwbtlPLHmBQjitN0f1D4QT3yhFjKy7LFHlqymcP0gaVm
         QgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776177212; x=1776782012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bw6f7AXQLyB14/caIw5kD86MDDHBEfPYqQSR/5hoL5E=;
        b=akbe3AFjOhZrQEA5kRg/BlIFdydnJ6u8yTCE1YMx4BxcmsrcsO7Y3qAgnq+gKI+m3i
         Kr7IAZpfqZTn9qXKMBMwfqkiN6sEgaV4U6C6bFk7QZHM2J/vrNiSTzvd2VhU7Omi8RWH
         JaqhNyJhQNQRV4dZJakQb6Khyk03QZOlEI4zGCdGx9PVSBJa7DE+RlJgqfbZbPr2c2fU
         9A09UddJuMTZRdu740Tk6gP34gRTBLFmOT7exFgjdRRo8tN2NdOcf8j9z0ErQN2P9Gv3
         JjMpvTGRZ4g5P+eSmR0PdfCR+w4ch+kenvRe6yMqoAQuVqGKgi9u78L/6Qb/ffXDXq9Y
         SOzw==
X-Forwarded-Encrypted: i=1; AFNElJ+5202A5FxZlbKkuhX2F7V5JkplBvfOO8JceNB45npOm/UgfB/NC6OpONoCyd+oQhdSmqDkXGajOCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsWMXmdMrCBSFAMjJVtmWqEt9uY1nU1wU12icpY40RzHHESIXY
	FxVN10X5/JjyPeH29W/odYHtuNb6S/f8qprO9iWKeaUR3BxLqoBnaqNR+YgTlrXB7B5qnMsBOgN
	PZzPV0Eq5YnVEm2sGFhSWaHPLmTVhWKM=
X-Gm-Gg: AeBDiet1NpGRx9dHghRDys2VNq9T/cSAu58avqtOxB6+pzCGS2+FMd1Zg3SGK2rl9+K
	LVH14evmJ9zdapVXUZ55OEeEfsLvL6UTAlwA/nMomyT8p/F+05vE9PGXCD7upDjKkfa1memyqGx
	6eDaEm0bdsycvKar6LS+wsW9Uo78lZr/iEJff/hymRoQcnNvAefcEbUphkB+G6wghNTTzmRD1xD
	wXKueCvjajr4uNAaiiLuNXHbHVgELvo+xftlHsL85TxLJ/ToWh73kD7jgcCjrrSTBfbA0Ts4zpa
	QEVQ9ok8WwPm46fKmILn55VhHevGLF789gLcJ0Z5RPEzJAp8prFrTrnuTLh3SO3CTr57ouADXcb
	8a3LKG58oIpnf0Y87AFGptfXL2FWIKj/gCPcF
X-Received: by 2002:a05:6000:2dc1:b0:43d:7af0:3a7c with SMTP id
 ffacd0b85a97d-43d7af03e24mr10264101f8f.29.1776177211931; Tue, 14 Apr 2026
 07:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414105702.248310-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260414105702.248310-1-jiayuan.chen@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 07:33:20 -0700
X-Gm-Features: AQROBzCkbw5ADLWM4k0dOh5Z9WgXj9bNTMtPKcV-DzogX7CuHh-4xfxWUg3Ty-U
Message-ID: <CAADnVQKZC5hrfn1+7BJXYnemWT_AR6ODYH5OhmpRaAWOosTxDQ@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf,tcp: avoid infinite recursion in BPF_SOCK_OPS_HDR_OPT_LEN_CB
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Quan Sun <2022090917019@std.uestc.edu.cn>, 
	Yinhao Hu <dddddd@hust.edu.cn>, Kaiyan Mei <M202472210@hust.edu.cn>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 3:57=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> A BPF_PROG_TYPE_SOCK_OPS program can set BPF_SOCK_OPS_WRITE_HDR_OPT_CB_FL=
AG
> to inject custom TCP header options. When the kernel builds a TCP packet,
> it calls tcp_established_options() to calculate the header size, which
> invokes bpf_skops_hdr_opt_len() to trigger the BPF_SOCK_OPS_HDR_OPT_LEN_C=
B
> callback.
>
> If the BPF program calls bpf_setsockopt(TCP_NODELAY) inside this callback=
,
> __tcp_sock_set_nodelay() will call tcp_push_pending_frames(), which calls
> tcp_current_mss(), which calls tcp_established_options() again,
> re-triggering the same BPF callback. This creates an infinite recursion
> that exhausts the kernel stack and causes a panic.
>
> BPF_SOCK_OPS_HDR_OPT_LEN_CB
>   -> bpf_setsockopt(TCP_NODELAY)
>         -> tcp_push_pending_frames()
>           -> tcp_current_mss()
>                 -> tcp_established_options()
>                   -> bpf_skops_hdr_opt_len()
>                            /* infinite recursion */
>                         -> BPF_SOCK_OPS_HDR_OPT_LEN_CB
>
> A similar reentrancy issue exists for TCP congestion control, which is
> guarded by tp->bpf_chg_cc_inprogress. Adopt the same approach: introduce
> tp->bpf_hdr_opt_len_cb_inprogress, set it before invoking the callback in
> bpf_skops_hdr_opt_len(), and check it in sol_tcp_sockopt() to reject
> bpf_setsockopt(TCP_NODELAY) calls that would trigger
> tcp_push_pending_frames() and cause the recursion.
>
> Reported-by: Quan Sun <2022090917019@std.uestc.edu.cn>
> Reported-by: Yinhao Hu <dddddd@hust.edu.cn>
> Reported-by: Kaiyan Mei <M202472210@hust.edu.cn>
> Reported-by: Dongliang Mu <dzm91@hust.edu.cn>
> Closes: https://lore.kernel.org/bpf/d1d523c9-6901-4454-a183-94462b8f3e4e@=
std.uestc.edu.cn/
> Fixes: 0813a841566f ("bpf: tcp: Allow bpf prog to write and parse TCP hea=
der option")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  Documentation/networking/net_cachelines/tcp_sock.rst |  1 +
>  include/linux/tcp.h                                  | 11 ++++++++++-
>  net/core/filter.c                                    |  4 ++++
>  net/ipv4/tcp_minisocks.c                             |  1 +
>  net/ipv4/tcp_output.c                                |  3 +++
>  5 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/networking/net_cachelines/tcp_sock.rst b/Docum=
entation/networking/net_cachelines/tcp_sock.rst
> index 563daea10d6c..07d3226d90cc 100644
> --- a/Documentation/networking/net_cachelines/tcp_sock.rst
> +++ b/Documentation/networking/net_cachelines/tcp_sock.rst
> @@ -152,6 +152,7 @@ unsigned_int                  keepalive_intvl
>  int                           linger2
>  u8                            bpf_sock_ops_cb_flags
>  u8:1                          bpf_chg_cc_inprogress
> +u8:1                          bpf_hdr_opt_len_cb_inprogress
>  u16                           timeout_rehash
>  u32                           rcv_ooopack
>  u32                           rcv_rtt_last_tsecr
> diff --git a/include/linux/tcp.h b/include/linux/tcp.h
> index f72eef31fa23..2bfb73cf922e 100644
> --- a/include/linux/tcp.h
> +++ b/include/linux/tcp.h
> @@ -475,12 +475,21 @@ struct tcp_sock {
>         u8      bpf_sock_ops_cb_flags;  /* Control calling BPF programs
>                                          * values defined in uapi/linux/t=
cp.h
>                                          */
> -       u8      bpf_chg_cc_inprogress:1; /* In the middle of
> +       u8      bpf_chg_cc_inprogress:1, /* In the middle of
>                                           * bpf_setsockopt(TCP_CONGESTION=
),
>                                           * it is to avoid the bpf_tcp_cc=
->init()
>                                           * to recur itself by calling
>                                           * bpf_setsockopt(TCP_CONGESTION=
, "itself").
>                                           */
> +               bpf_hdr_opt_len_cb_inprogress:1; /* It is set before invo=
king the
> +                                                 * callback so that a ne=
sted
> +                                                 * bpf_setsockopt(TCP_NO=
DELAY) or
> +                                                 * bpf_setsockopt(TCP_CO=
RK) cannot
> +                                                 * trigger tcp_push_pend=
ing_frames(),
> +                                                 * which would call tcp_=
current_mss()
> +                                                 * -> bpf_skops_hdr_opt_=
len(), causing
> +                                                 * infinite recursion.

Let's not add new bits.
Reuse existing and test/check all in one place,
like commit 061ff040710e9 did.

pw-bot: cr
