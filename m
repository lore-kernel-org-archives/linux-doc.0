Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAF32BE7D5
	for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153469; cv=none; b=pwJYAamHHKPg8stWtkc6UEsPGTWkyzUe68yzPMSFqCWPY28kXnxE+aGTFiINrcrqfz8a/0imH57ZXzBKx+wMTu0WQ2g7Zpb9FCiHA35PEBwgwybBbzEAL08w4N+UY8ivwBYP7cVDWEFl+VTMEugRM2PaQKu+Ir7zVO803rqdwr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153469; c=relaxed/simple;
	bh=e4uRqKiHK+914gVeOIiVV3X3FcUt9r0rHl937hvIjjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aJ0NVT43T8iWDYMfbAqOZTSHJj7WkqwmEuUlCxrhd55ghYbyNeuxUAYFfeTi2w6ddnjynFiOIl06W9/zgYPUtpQlczMpukYO7evQzQHAdufOVjEKD5dTkSC8UsUBQg+nrjqHmiGLpDNZxg80C5r6KeEw110xXvBgDoRA0CBXj8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AMDuYYoD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AMDuYYoD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzL8BCb5z5mTe8AmKnSvyMsKdN+ktV9EKzPlxxLDauM=;
	b=AMDuYYoDWFJKnahySOKC7fu/UovDN6k0UTkmMIPV70HymgS1GDLj29vd9bYslqJnpNaeeq
	ugNe4tn24TZsLlZC23YsVaXKRxP0BRDr+uPRfnQM4BQzco1AtYV369AKkttflG443hF4h1
	4XElNQqDsLX6VB7o8dhARnhOVl2ZiWM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-OXl6rQYSM_mmYIFm4qDvyg-1; Tue, 17 Jun 2025 05:44:25 -0400
X-MC-Unique: OXl6rQYSM_mmYIFm4qDvyg-1
X-Mimecast-MFC-AGG-ID: OXl6rQYSM_mmYIFm4qDvyg_1750153464
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451deff247cso32087525e9.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Jun 2025 02:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153464; x=1750758264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzL8BCb5z5mTe8AmKnSvyMsKdN+ktV9EKzPlxxLDauM=;
        b=W5AiCijMmHu79PBZT5vPDeVo1xy6Sk2CWHSc321WFf6p+Nxs0SyUMU8hn3elvqBLue
         68HuyuO/RRk0f84BxcvzDU3QhLXCxDQqAjqc0Ui167GVf++MWi00s9zl89yuYty3J1Sj
         XBhCFdNhzKP2Zytl0z8HAKm4sEKEA9pbGqom8EVfr6Xr9ZUQrXnBVZjoQQ/CZqbRtj7v
         1VRM9Ndg0ume7ThJirDF0B8J6rCca+QnZ28vre3fEB0OKfoESOQY7LO7ZJ+DsRMvlUA+
         8ezs0GNB1BnomrIX4fV8hvwVJYR947ZPGNu66Igm8LoGizj7flRhWVyajBy346aJX9in
         Xrzg==
X-Forwarded-Encrypted: i=1; AJvYcCW0noQ0kBGPzes6G4j/lR22Mx5dZF2ytCB2YrT0+0cbZ044Hutg/x2PMtag9N6nGOY9WNdoJmRiLUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMH+u5vhkBgDKpMF4iEcu5CujCCYbyioKFDRQmt7XlsKzIntIU
	ms6/JHBvE6NBXqusbwYQgNo8xuK4e/C2GA5XOubGXB7dvK83P5pN8qYXF+10QcVDVPSpEJpaHdD
	RT68rGgFaMTJ/nRVwck3iOXc+djALa62MpYiEsrI3wteboo9028XTLunucPgKtA==
X-Gm-Gg: ASbGnct+s1aYtP7wciIwDDVLS+ywX4OrHeR03X6cxaZFEU/m13aodV93DmTSTuCEGel
	RM2HCZP/6+1cmB2f2ASTHm1h5uPKE0qnBTnBvx+LRIy0ZIxacvd7NsRq7eFtBgp8UG6j4W36G+i
	rSj/rmKTmdfcNVttLs+o8BSmY74elyUpxDqahCQLVRpr4HWqKvcrQYtkfeZdwXzJ1rKBA4KTaNT
	zEgOMxSx0TweF6aDxtrGGu3nUb0y4X7zo1L9xxopzFDHY6gf/YB3eTyTrusdhVWPYBCClF+Fq9V
	P/88UzaXkEUDIcNXli1JrIhUfU/Vr+C00OvKnyOoTDAsxInIgZSHg80n8bmOSeEwnt/7Rw==
X-Received: by 2002:a05:6000:4106:b0:3a5:7c5a:8c43 with SMTP id ffacd0b85a97d-3a57c5a8d11mr6597970f8f.11.1750153464171;
        Tue, 17 Jun 2025 02:44:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKE4/hdGNiZlnyMYBRWFUzYwIsk6LZeUq2PZYEGJVxcoKxTedoN7Csr9UGI1dlan0YwSjvcg==
X-Received: by 2002:a05:6000:4106:b0:3a5:7c5a:8c43 with SMTP id ffacd0b85a97d-3a57c5a8d11mr6597942f8f.11.1750153463754;
        Tue, 17 Jun 2025 02:44:23 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2448:cb10:3ac6:72af:52e3:719a? ([2a0d:3344:2448:cb10:3ac6:72af:52e3:719a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d009sm172188815e9.20.2025.06.17.02.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:44:23 -0700 (PDT)
Message-ID: <558d81d1-3cd0-41f8-87b1-aa7be05f2924@redhat.com>
Date: Tue, 17 Jun 2025 11:44:21 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 net-next 11/15] tcp: accecn: AccECN option failure
 handling
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
References: <20250610125314.18557-1-chia-yu.chang@nokia-bell-labs.com>
 <20250610125314.18557-12-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250610125314.18557-12-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 2:53 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 3de6641c776e..d7cdc6589a9c 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -1087,6 +1087,7 @@ static unsigned int tcp_syn_options(struct sock *sk, struct sk_buff *skb,
>  	/* Simultaneous open SYN/ACK needs AccECN option but not SYN */
>  	if (unlikely((TCP_SKB_CB(skb)->tcp_flags & TCPHDR_ACK) &&
>  		     tcp_ecn_mode_accecn(tp) &&
> +		     inet_csk(sk)->icsk_retransmits < 2 &&
>  		     sock_net(sk)->ipv4.sysctl_tcp_ecn_option &&
>  		     remaining >= TCPOLEN_ACCECN_BASE)) {
>  		u32 saving = tcp_synack_options_combine_saving(opts);

AFAICS here the AccECN option is allowed even on the first retransmit as
opposed of what enforced for synack packets and what stated in the
commit message. Why?

Either code change or code/commit message comment needed.

Thanks,

Paolo

