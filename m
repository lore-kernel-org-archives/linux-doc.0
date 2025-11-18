Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EF72F2609
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474349; cv=none; b=Wr6dIbe6IF3/GwKeZPdLd+hKK0VBoSNctVDb77QCwEaWOM/k5OB5Tv8F4nJ9kL0iz9lHf3EHKZdMUgVsd/ek93t3tfktGbUkI2y6ovk1RUWWaLpLrLjoyuvcff5islCSDgfYUlU95dRHFqJXDxEYRsVf8BoWtOS+V7g6f7Dro6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474349; c=relaxed/simple;
	bh=aDOXQIB2n+pg4b/q/S49BAM6icV8tjHMUu6SgbSHF3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qBFbqPc4k5o+Edc8amZXoyrFTpepKeSrJGqayLOXTBT2dUYZdWZjmuw0BUe8w5zJyJGXQdKkw/LSLNpJ5mZWSgxwmOlbYtoU6+D60K7LtxFRsZbbtvp67PZq37OrPR1Yaz3McaHBvPtp79v4pLXXJfyFjWgTnrpZ0oJTgLwfK7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XK4Td46z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aC6M3Cjc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XK4Td46z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aC6M3Cjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763474343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sMrzWdyDZvwFZkmGhcBLLXh+fImVyjMBGC8vdg9gsc=;
	b=XK4Td46zKk99R21Rlga4CfC+43zsFYx2JIzS4w5rbzAVeVCIF4dldZZXfArjVVNEERT5Q7
	RH7TlgzI+6rfMEqWfHCWfsp8TAQhMDopaH284OT77WN0N6mG9krPdEo5PMz0QHsHuigOYb
	9IBaxvKOLwIHUnyI/XhOqxEvvpobVsA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-A4mp28wtNlOV6v229dKPlQ-1; Tue, 18 Nov 2025 08:59:02 -0500
X-MC-Unique: A4mp28wtNlOV6v229dKPlQ-1
X-Mimecast-MFC-AGG-ID: A4mp28wtNlOV6v229dKPlQ_1763474341
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4775d110fabso43249685e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 05:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763474341; x=1764079141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/sMrzWdyDZvwFZkmGhcBLLXh+fImVyjMBGC8vdg9gsc=;
        b=aC6M3CjcSJ3JHIvhVPo6nuzb9LRIbQY7YGexjD9QcSAzfyiL8M/bJXaEy4f0VSi6Kf
         JfHWaXFSQ/Qr7dOFkq+uXGHmg/Zg6VNf0xIn2WLWKDCVT0O+NKsi9JNGX+y8mPDWBw/3
         prPFcyeaaGc2YvCoSFjH/jrOsn2RHVdzAEBseKOX5Grv0NZ4r4FLSb0daLHHG5eOi1oK
         mAF+h2ext16wAdV1uLc/+A98iSBMiYUDKEl+1WQv0oqLpwppwhjnxKmYaIenNUVyy/lV
         XLn5SmJedRevW+eL0O1d/Ek8h1NrKHjBaBPX/TmyByD7cAIZ1hckHhrJA06rcEE3y6OV
         xnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474341; x=1764079141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sMrzWdyDZvwFZkmGhcBLLXh+fImVyjMBGC8vdg9gsc=;
        b=ZX6OO9V9BzIHkS3Cmb4UGDtDsdNBuhRPsMnhBOqK9XdFC3D9Rg+XYwiWuBYnBIcfp0
         2Mxas6She4+S6ZDcH/glPBbyxg63UxHCXDGqSwUaEDuNE0Uh/mN+eTUJ9y1FfMP1w9l9
         RbeWiIwwJ6x/SA25TtTlhiUKXEL0f5UJAiIp9bCl99HmPmAMDES+a1ynQTt618fhWR3f
         Iz4mlD5fHCFhnJZD8Tx/pxCLbafKyoGfOOsYTLv2UUuKWG3KShSWunWMZQ0Mq62Z5X9l
         ez6RbLdSxoOv+GjGUYrgTFERzyeDl15+hFZTs61dXpdZNWgJecYSli95xSq7q+EYMp4r
         YRLA==
X-Forwarded-Encrypted: i=1; AJvYcCXjumtlrfnLXOYXFQYMN5Oy2tV6m/YllOv/7wWfa7ZQS8b+wNXJxTGe78HqMFytM7gMN21olTna37g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6iwe6RWdyI7aee+nLV4YImZPr5j3+UrwzlHB1qLH29yJ4N03a
	NiJvJL3p61vdVQyjvOusczE9eFod6wf2Pw8zq7kXEynGpvs6vNW6TYPDmgB/DACYbkfS+/MTFNK
	K3/NrdFB3YbXHGQ1iiB524WTQlFfhPO+pNwbPComougIbTai0qlQnnWOrK1+Xfw==
X-Gm-Gg: ASbGnctucDYou22iFE1gMAET2Uvosq3kPp/mJSvBLhYXR2y94PERccAW/MBmUT6XQLr
	q1HgOBm9f7zXMEG6iLlHTgH1V9FraSHVPJ0RbArzgPo/0n34VS9tpptXxPHoA4lU0EKzNCpj6Yk
	n9mDTSZVsOQG12oklwfl6Nv2DuP9cjyj/gEJmSd7+cbQw/EufJqUdk/t+yogoORtN8p8dL0gvTj
	24rO/T3Pr0PnwADmq4IBTf8vuEnyvnA+8iN4PjI8g8p55UWjKtz0DCfF5A2/5xkZQhUQatZIOOU
	iH4bQ1qaAQtCscdAJPYsGqt78r6MSjEb3GGXnLUlxeXktiP0GuJJf9YQGJnhVxaXt2H6Gf64m/k
	q0Oi3Rg1MowCu
X-Received: by 2002:a05:600c:4595:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-4778fe88265mr151064265e9.27.1763474340705;
        Tue, 18 Nov 2025 05:59:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9Am1Diu+ximSUOXMP3A5a0o3OiqTxBDb1D8Ajqh2TFqWWMm87brTKlLuvl3dgDrOlhHHa3A==
X-Received: by 2002:a05:600c:4595:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-4778fe88265mr151063795e9.27.1763474340210;
        Tue, 18 Nov 2025 05:59:00 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9deb126sm16925725e9.9.2025.11.18.05.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:58:59 -0800 (PST)
Message-ID: <769c1ba6-b622-402e-a615-dffa6f3d640c@redhat.com>
Date: Tue, 18 Nov 2025 14:58:56 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 10/14] tcp: accecn: retransmit SYN/ACK without
 AccECN option or non-AccECN SYN/ACK
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com, parav@nvidia.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20251114071345.10769-1-chia-yu.chang@nokia-bell-labs.com>
 <20251114071345.10769-11-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251114071345.10769-11-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/25 8:13 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> For Accurate ECN, the first SYN/ACK sent by the TCP server shall set the
> ACE flag (see Table 1 of RFC9768) and the AccECN option to complete the
> capability negotiation. However, if the TCP server needs to retransmit such
> a SYN/ACK (for example, because it did not receive an ACK acknowledging its
> SYN/ACK, or received a second SYN requesting AccECN support), the TCP server
> retransmits the SYN/ACK without the AccECN option. This is because the
> SYN/ACK may be lost due to congestion, or a middlebox may block the AccECN
> option. Furthermore, if this retransmission also times out, to expedite
> connection establishment, the TCP server should retransmit the SYN/ACK with
> (AE,CWR,ECE) = (0,0,0) and without the AccECN option, while maintaining
> AccECN feedback mode.
> 
> This complies with Section 3.2.3.2.2 of the AccECN specification (RFC9768).
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> ---
> v6:
> - Use new synack_type TCP_SYNACK_RETRANS and num_retrans.
> ---
>  include/net/tcp_ecn.h | 20 ++++++++++++++------
>  net/ipv4/tcp_output.c |  4 ++--
>  2 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
> index a709fb1756eb..57841dfa6705 100644
> --- a/include/net/tcp_ecn.h
> +++ b/include/net/tcp_ecn.h
> @@ -649,12 +649,20 @@ static inline void tcp_ecn_clear_syn(struct sock *sk, struct sk_buff *skb)
>  }
>  
>  static inline void
> -tcp_ecn_make_synack(const struct request_sock *req, struct tcphdr *th)
> -{
> -	if (tcp_rsk(req)->accecn_ok)
> -		tcp_accecn_echo_syn_ect(th, tcp_rsk(req)->syn_ect_rcv);
> -	else if (inet_rsk(req)->ecn_ok)
> -		th->ece = 1;
> +tcp_ecn_make_synack(const struct request_sock *req, struct tcphdr *th,
> +		    enum tcp_synack_type synack_type)
> +{
> +	// num_retrans will be incresaed after tcp_ecn_make_synack()

Please use /* */ for comments

> +	if (!req->num_retrans) {

It's unclear you this function receives a `synack_type` argument and
don't use it. Should the above be

	if (synack_type != TCP_SYNACK_RETRANS) {

?

Or just remove such argument.

/P

