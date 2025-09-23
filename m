Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8F311C09
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758624742; cv=none; b=Mnkjc1R+VENaWIdCl+t2gzOYpknnNlk4bgWYYfq7ikaBgaveJxLbOdeWLuLSjkvUR77pW/JsrxGUf9Fm/pRyyX74OLu7EFxSzMMXKWEhEhlsGFyeJG5JiEXGwvXxMGK0VrM6/tt0t/5Gkr2buElM+2FzDmD75dGvXwHg4TYuJYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758624742; c=relaxed/simple;
	bh=hSxoxIoAL3ZR7gXOu9nO0Er42gctGRFjyDjNWo272lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G15e7dUKT3VMlGN3Xu+PPmp4jQEYO6yToDuzNvivTc/Ymxf/rKU6vymh+APC4qiMhBE6y4lj/nKHtaU94bKZuPt+50L75hqIXxNngtgdIX89U1myq10LahX0Lzq7spR14z/wtGX6BydR8HKdrgzHJgOUzJaY+nzcmMVu5NSzXSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iGfj0ViC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iGfj0ViC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758624740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBi14BEc0YNSpiPSHpvT8/L9ylbivoJiX6J27JD/LkQ=;
	b=iGfj0ViCncJVA8LPGM//tcPvWsXrs3arx6LwGkWHXE4g5kQaVRzD2ldz4O8iYcuWr3hUBu
	kPFLTI/981NYO4A4ILIIsug4mFqFbSr5vmKLUrzcJeeYaKVM8FsoFBUtZiWibGCrYzW4N1
	cby01ii+3KR8nV2luzwPHnCezI/wkHU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-Zc8Pjxg-N7e5RbTCfOkQfA-1; Tue, 23 Sep 2025 06:52:18 -0400
X-MC-Unique: Zc8Pjxg-N7e5RbTCfOkQfA-1
X-Mimecast-MFC-AGG-ID: Zc8Pjxg-N7e5RbTCfOkQfA_1758624737
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso20335625e9.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 03:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758624735; x=1759229535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBi14BEc0YNSpiPSHpvT8/L9ylbivoJiX6J27JD/LkQ=;
        b=ncki4ptG2H2nUYemk4S1lxVrpl5Vr6DRO3YxL6FRjVt7XVqv+ilxtCdRd7j0TTcBdR
         z+GoEmB/LpYQ+jsPDnab9/X6r0uD+tMrVhmMIt6xmSmMnqsQ1T85OIoHHesDyYW9YVPJ
         4h6fNjDIDqMvv4aAOysaLh9+BSaVHj3yCdCt+wnQMykoy6PBE6w42Cq7Ikks0sScseWo
         3B7EN2YmXee+RH/x2sXo6YgNso+jJ4gs2ToTaFPDwoDlEAmfTj2e7aiQnYwRFj2LmvWi
         hZagYAX1i4l09rrB/4j/hO+B36YgaIryBizXfAaw7fkUkJaUa6RCbewDcvJcZ/HyI5pv
         XKzA==
X-Forwarded-Encrypted: i=1; AJvYcCWcQy1+TDt3EWOTqyJuixvFnPx1BiqAzW3q1Qi+VOWWRaxF1t/Xqxuw8S8zydFa2cIIYRj9+BuEWhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2WQmK1rv45NAgTPUxRJLzapQGTyyt7Q0XR+/3avkK5JPXAER
	mFzs93OZ19sz2Q7hyPw3cCpC/Qjbds/xvxMyYiltsQgCzuzztna83Dm/gYi7Hf3zHoNVlUP9K/W
	p1kpJDk2wJQyBIODWsl4BpktA5zL+AzEbDjsQaViSDfFWSG28ZxTS1Bg5Wh4BwA==
X-Gm-Gg: ASbGncvOBsXUmKqtUaMw1eokygGkP5VbvP/5jtzathnnHdGsyWrbHxhXTmYRG8gYc/4
	NS3k0ywrrhH4i2sBWscYJLn6F1THif5jkEzE/f1c1r0BhSQIfwiHDWUvEpTn9nvagX850Recs4K
	eZQVQbCGxRqPTRt/xKpgaQF8LOrr6U+rKsGocAA0CwO+1LMqfRjz0MgRB1a82bzpd3KCRq/B1hg
	R8DUrfeHZZfFUzcmd/wi/nhJglFaW6qb3+dyA0EPM1tTjDpSvGcUuaN6DFzRC6moDPLvilgj3Dt
	kxh9HmXxjMZBdYNubp05lra3aP0dRWaB9cJ2jwDwenhnQ4syI4hxkuP453jBzKPO6UscaiHokD4
	yU+pc2GzbLVcv
X-Received: by 2002:a05:600c:4f09:b0:45f:27f7:e1 with SMTP id 5b1f17b1804b1-46e1dabf750mr20581305e9.25.1758624734881;
        Tue, 23 Sep 2025 03:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg+AcE0r3wdgfn7+K4PlihmQgG21I4ch1KULCsoxGgKaY3chx/4+0hgTLlrbPqOSnHHgaa9w==
X-Received: by 2002:a05:600c:4f09:b0:45f:27f7:e1 with SMTP id 5b1f17b1804b1-46e1dabf750mr20581015e9.25.1758624734372;
        Tue, 23 Sep 2025 03:52:14 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e1cfb3df7sm11918245e9.4.2025.09.23.03.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 03:52:13 -0700 (PDT)
Message-ID: <03d6dba8-2586-4ae9-8a16-26b84cf206eb@redhat.com>
Date: Tue, 23 Sep 2025 12:52:10 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 13/14] tcp: accecn: stop sending AccECN opt
 when loss ACK w/ option
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20250918162133.111922-1-chia-yu.chang@nokia-bell-labs.com>
 <20250918162133.111922-14-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250918162133.111922-14-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/25 6:21 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Detect spurious retransmission of a previously sent ACK carrying the
> AccECN option after the second retransmission. Since this might be caused
> by the middlebox dropping ACK with options it does not recognize, disable
> the sending of the AccECN option in all subsequent ACKs. This patch
> follows Section 3.2.3.2.2 of AccECN spec (RFC9768).

Is this really useful/triggers in practice?

AFAICS it will take effect only it the retransmission happens just after
an egress AccECN packet, i.e. will not trigger if the there are more
later non AccECN packets pending.
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  include/linux/tcp.h   | 3 ++-
>  include/net/tcp_ecn.h | 1 +
>  net/ipv4/tcp_input.c  | 9 +++++++++
>  net/ipv4/tcp_output.c | 3 +++
>  4 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/tcp.h b/include/linux/tcp.h
> index 53a4a0da35cc..f3b72fb6fa76 100644
> --- a/include/linux/tcp.h
> +++ b/include/linux/tcp.h
> @@ -295,7 +295,8 @@ struct tcp_sock {
>  	u8	nonagle     : 4,/* Disable Nagle algorithm?             */
>  		rate_app_limited:1;  /* rate_{delivered,interval_us} limited? */
>  	u8	received_ce_pending:4, /* Not yet transmit cnt of received_ce */
> -		unused2:4;
> +		accecn_opt_sent:1,/* Sent AccECN option in previous ACK */
> +		unused2:3;
>  	u8	accecn_minlen:2,/* Minimum length of AccECN option sent */
>  		est_ecnfield:2,/* ECN field for AccECN delivered estimates */
>  		accecn_opt_demand:2,/* Demand AccECN option for n next ACKs */
> diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
> index 8317c3f279c9..3eb450b4b648 100644
> --- a/include/net/tcp_ecn.h
> +++ b/include/net/tcp_ecn.h
> @@ -401,6 +401,7 @@ static inline void tcp_accecn_init_counters(struct tcp_sock *tp)
>  	tp->received_ce_pending = 0;
>  	__tcp_accecn_init_bytes_counters(tp->received_ecn_bytes);
>  	__tcp_accecn_init_bytes_counters(tp->delivered_ecn_bytes);
> +	tp->accecn_opt_sent = 0;
>  	tp->accecn_minlen = 0;
>  	tp->accecn_opt_demand = 0;
>  	tp->est_ecnfield = 0;
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index f250b4912a0b..6083260133e9 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4804,6 +4804,7 @@ static void tcp_dsack_extend(struct sock *sk, u32 seq, u32 end_seq)
>  
>  static void tcp_rcv_spurious_retrans(struct sock *sk, const struct sk_buff *skb)
>  {
> +	struct tcp_sock *tp = tcp_sk(sk);

Minor nit: please leave an empty line after variable declaration.

/P

