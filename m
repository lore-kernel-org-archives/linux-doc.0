Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B343DFC6D
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417458; cv=pass; b=O1q3v04you4XFU5ZaJ/K2mJDYCJ14DdZZqKy+Z1QBNELA3NvCrT53nGw7gn6JATToVQPIsIAJv8nP5oZxpS+zA2Y9gmgbU8FM47gRYaBlLqsbCJEAlZZKAIxeyfNS2SxAexcPxDMf+d16g89TwZSLy7bwke+/tWkrEuJhl+Gft8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417458; c=relaxed/simple;
	bh=Bf9TWNPNYtmYksx0Z4126nO7+2r16rIPR+pSeEPgWew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d81B5Xmv2RKb7jA66NyjSYK74GtGp+axedkg9rtclXdiJvMMl6DzrN+LAIo/u9L00PNUahF8ZGf1Wj9NuTeOwARMn0ua+VmUrVfMtxrQja6v218Zxi6UZWGi8Ox17btFLzqc2/IJ6lk1FZraGaO5kwW1CzCqOX6zK0mduZ/Ef1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZTN5a0Vj; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZTN5a0Vj"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52ff0eea420so7975191cf.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 23:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788417451; cv=none;
        d=google.com; s=arc-20260327;
        b=Sv/fC3XAyBRKpg5VbPTk1LEatRqaPh9eGnngr1r/2DdrKbCBPnaR6iG0n46YBIK8Sn
         m387z/2EzGqTVf+NKMTRadrB2mGnSYR6l58jw4Gey988HxuF4HY+gWeCOMbrngUjqsKM
         C8wtrsH7xN+d4o4GE6uCmF9ROLp1OMB5HOAzZv3ALO1XK13DI2zSBXOjqghqhplS51n2
         G3aENPfgSTgO6i4WIdNOA04bSZAqD7Nqz9Z1aeY/kOVPrywOY82U7vViN6B7AZtfkF48
         Wljx3QLQwA43Mt9y6Ok8hCUJI2w9xprsRe8IrDhLlQqL4oyYFuZfKoblWi6/g459V5aS
         Ilag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KqkahuUIc5ZIZCVDrZu0ZNrbpsvf9SIwSaxwkoNLB/o=;
        fh=RQY2dUUZJTIXv24ds/ZhxZmcFjucqHUbdUE1EHVsL/A=;
        b=LBD3xDhM41eIajDd+oCqkZgs2DNIVN3wCxXGP1KDose4gvOwmZrUQYLLlAYyLXdvlq
         d89jZJOb0vPBlJotsE9VHvsJKbVlCPnAhsBynCnjxAzu9R/XJrutlK1IykJjlpDIX9PG
         g4L5ki7WDE9XYsOep1geyaUngJ1AJpwljknLxXe6cXZeokiMW4TMIx4Yvxub+SlcCIT5
         7x8ceqhJF+5ZmLzc+KpRBLoln6JdcN32Ow8fzOP1eIgDY3GwzH/Z/V04KdkxbWqQZh6C
         JQJo/eE9K8rdg4nWcCqD/Yo6lCrqOFxZlcStMm7jx2ZDUYjz3895cU1um6w0Nwd3HjZc
         62/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788417451; x=1789022251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KqkahuUIc5ZIZCVDrZu0ZNrbpsvf9SIwSaxwkoNLB/o=;
        b=ZTN5a0VjHJdoA57C0+KpZSXPIxuZaiejJljHOxKtYPgSw23xbYOLv0Yi8M6kwmKMF6
         ev471eRAUESMxyMBSwd5zf9ZNHMnr/4yyjhD8/at6EGMDvZrFuM8uNAFDByh3P9YpvFo
         K69ivSlxZfVR6RDeNXKbcHZWFftXWp2WYRTtVWJpPshY2GLMSMK/X6DaqjNRFzV99lxi
         qIOrQEwYSdOxuRM64D8FvH4J3IuBUxBxTtHZ+fuXdvqgZTzKsjPJeeRxX3MZ8ndMBy/Q
         fiKsNfWwasFQ4/Z7LJmOElPaV99nSFCXbNGnsK+cf9HhfqJoK60qbTThmHVvr1cfLWxO
         cNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417451; x=1789022251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KqkahuUIc5ZIZCVDrZu0ZNrbpsvf9SIwSaxwkoNLB/o=;
        b=iCkZiB8mKlcKcCuaCkHdj3SRU78+wX6Wu3CmFCsRaRPcJ2fhG4W+Yz0/tsoyC/Sx0a
         czyHn8aG1mR6Ai7WGpneGmvfZLs9yw/O3jWhBbVmVB4p8gRmOHAX/Vu6n/Mk1claRZFm
         gB+PDHz/at8bLVHrYBm/zZbZ9Dy8NGWnfc/tfBbNPQgOvJ5Cc1N5T838J2iKCX52IJQ7
         lHC57nRx9H35tYaMA7i7AiRTWrn7zhdGlu6lgXVXJXbYksXS3PICMyH53xmWSJbhhCs3
         HZGn9tZHpFQaLKNRVf5Sv94eIgIIGj0h+Hp26LJ0CNdMK4VAuaTrPdVUSbXcVIEjdVcr
         XaAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK6AWNPVwDK5EiFKyHN+bC+URWeBil+oS7H1LXmbYXT8RoMGelzeN9IPXXc5NeLSABEzbLU9hWHds=@vger.kernel.org
X-Gm-Message-State: AFuF++n7uv7u5dypWvXSKC4nYQ3ZGmRm2uelYZ/m38+p236AmFtIRiY3
	gyDUctC3Px1VI+euih6fMIfGiwUjKsssEyiclEX5tViZrwAypIIgZA0jqj0ChPmewhmwzTBEqXz
	s7c2CCzGo9P9z9WX9SosVBvBi/ipPa5wU55rT8iG4
X-Gm-Gg: AYBFou2ESDxbXdli+1TZ8JFtCzXWvUCtHxPF1nhmwdW0m159m+QGkd/hO8sO1EhDmTp
	w12///WDnfct4zT8n8jikbMV7ThatHBmaRKl7q/b+J+SdhTl4D0VWMBJ5ooIsBEdjzeZCiKGoss
	PnkQBBHM4qS1eEU4N6dVw+cNf4ShJ12AMRzY/ZljSf3/8KEjZeNUesQON8m+D2ZOnQgtLy6K/q0
	xR1SFIQhfaGmcyeDlhX2hAkfIf5nvbMoYC+GI97d0Z1ZrBcpFEUblQnHzE0HHqGy1xxyqOHkhRi
	DvPfD/5V6SDvyBaQdSmJuFEtsBXDNaMK0TFVy4vVF2DilunkSRQ7kGJBAdOw7Fq6WVVWsEIV3on
	bD+zgPgbUUDUeVLmqVJq9cSiw1QRxO7dWVnVdg56BRPYgCfhOxCYAo73Z+g==
X-Received: by 2002:a05:622a:d5:b0:51c:b98c:f772 with SMTP id
 d75a77b69052e-53048017e0emr12243781cf.15.1788417450800; Wed, 02 Sep 2026
 23:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788176024.git.zhilinz@nebusec.ai> <1bf5d64b8ffe1dc1b1f23d5b5ea6cb4ad3b2f562.1788176024.git.zhilinz@nebusec.ai>
In-Reply-To: <1bf5d64b8ffe1dc1b1f23d5b5ea6cb4ad3b2f562.1788176024.git.zhilinz@nebusec.ai>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 3 Sep 2026 08:37:17 +0200
X-Gm-Features: AcwNN1XvXyJWTbxaR_juppAtXiCFWgg250XzF3JL_n7xOWkjtwQ4YMaooAIxdiw
Message-ID: <CANn89iJ62OAU5PEQq9n1b8y-K=g7Z-BzgcX6gxeF=9DiPxiBcA@mail.gmail.com>
Subject: Re: [PATCH net v7 1/1] tcp: bound SYN-ACK timers to reqsk timeout range
To: Zhiling Zou <zhilinz@nebusec.ai>
Cc: pabeni@redhat.com, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	davem@davemloft.net, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, ncardwell@google.com, kuniyu@google.com, 
	vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 8:18=E2=80=AFAM Zhiling Zou <zhilinz@nebusec.ai> wro=
te:
>
> request_sock::num_timeout is a 7-bit counter. Commit e6c022a4fa2d
> ("tcp: better retrans tracking for defer-accept") split this counter
> out of an 8-bit field, but tcp_synack_retries still accepts an 8-bit
> value and TCP_DEFER_ACCEPT can still derive a retry count up to 255.
>
> If these settings exceed 127, the regular request timer cannot reach
> its expiration threshold and num_timeout wraps to zero. After the wrap,
> the request can keep timing out instead of expiring, and the next
> zero-to-one transition repeats the young-queue accounting decrement.
>
> Both request timer paths can also shift req->timeout by 64 or more while
> calculating the next RTO. UBSAN reports that invalid shift, and systems
> with panic_on_warn=3D1 panic before the later cap can take effect.
>
> Keep the tcp_synack_retries sysctl range unchanged, but cap its effective
> value in both SYN-ACK timer paths before the young-queue pruning loop.
> Cap the TCP_DEFER_ACCEPT conversion at the same range so its timer and
> bare-ACK consumers agree. Saturate the RTO calculation before shifting,
> and cap the Fast Open extra retry as well.
>
> Snapshot the request timeout and num_timeout once before the bounds check
> and shift. num_timeout is a bitfield, so add a raw view of its existing
> storage byte for a compile-safe READ_ONCE() snapshot. This keeps the chec=
k
> and shift consistent when the timer concurrently increments num_timeout.
>
> Document that the sysctl still accepts 0-255 and that the timers silently
> cap the effective retry count at 127.
>
> Fixes: e6c022a4fa2d ("tcp: better retrans tracking for defer-accept")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Signed-off-by: Zhiling Zou <zhilinz@nebusec.ai>
> ---
> changes in v7:
>
>  Documentation/networking/ip-sysctl.rst |  4 +++-
>  include/net/request_sock.h             | 20 ++++++++++++++++++--
>  include/net/tcp.h                      | 21 +++++++++++++++++----
>  net/ipv4/inet_connection_sock.c        |  2 ++
>  net/ipv4/tcp.c                         |  2 +-
>  net/ipv4/tcp_timer.c                   |  6 ++++--
>  6 files changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/netwo=
rking/ip-sysctl.rst
> index 208f46967ee59..4a2ed964dceab 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -954,7 +954,9 @@ tcp_stdurg - BOOLEAN
>
>  tcp_synack_retries - INTEGER
>         Number of times SYNACKs for a passive TCP connection attempt will
> -       be retransmitted. Should not be higher than 255. Default value
> +       be retransmitted. The sysctl accepts 0-255. Values above 127 are
> +       silently capped by the SYN-ACK timers, matching the 7-bit
> +       request_sock::num_timeout field. Default value
>         is 5, which corresponds to 31seconds till the last retransmission
>         with the current initial RTO of 1second. With this the final time=
out
>         for a passive TCP connection will happen after 63seconds.
> diff --git a/include/net/request_sock.h b/include/net/request_sock.h
> index 5a9c826a7092d..a9781fab774aa 100644
> --- a/include/net/request_sock.h
> +++ b/include/nets/request_sock.h
> @@ -58,12 +58,17 @@ struct request_sock {
>         struct request_sock             *dl_next;
>         u16                             mss;
>         u8                              num_retrans; /* number of retrans=
mits */
> -       u8                              syncookie:1; /* True if
> +       union {
> +               struct {
> +                       u8              syncookie:1; /* True if
>                                                       * 1) tcpopts needs =
to be encoded in
>                                                       *    TS of SYN+ACK
>                                                       * 2) ACK is validat=
ed by BPF kfunc.
>                                                       */
> -       u8                              num_timeout:7; /* number of timeo=
uts */
> +                       u8              num_timeout:7; /* number of timeo=
uts */
> +               };
> +               u8              num_timeout_syncookie;
> +       };
>         u32                             ts_recent;
>         struct timer_list               rsk_timer;
>         const struct request_sock_ops   *rsk_ops;
> @@ -74,6 +79,17 @@ struct request_sock {
>         u32                             timeout;
>  };
>
> +static inline u8 reqsk_num_timeout(const struct request_sock *req)
> +{
> +       u8 num_timeout =3D READ_ONCE(req->num_timeout_syncookie);
> +
> +#if defined(__LITTLE_ENDIAN_BITFIELD)
> +       return num_timeout >> 1;
> +#else
> +       return num_timeout & 0x7f;
> +#endif
> +}
> +

Please drop all the changes to include/net/request_sock.h

Instead, you can simply bound the shift amount in tcp_reqsk_timeout_sk():

static inline unsigned long tcp_reqsk_timeout_sk(const struct sock *sk,

        const struct request_sock *req)
{
        u64 timeout =3D (u64)READ_ONCE(req->timeout) << min_t(u8,
req->num_timeout, 30);
        return (unsigned long)min_t(u64, timeout, tcp_rto_max(sk));
}

Thanks.
