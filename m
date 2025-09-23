Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC47320A22
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758619978; cv=none; b=V6qIS+ul9/51mwwgmBwVUpaJhj69is94p2EsLrpRAsL9fWuaGeOSC0YyGG7H/z3YTUikkjI6bDBqhm2k3GeI5PNbuXXDahnvy+IngmTDmqqOKj64HyV8PbxGa5C3XYPMnlr+PVol55UYjW9nIz32yHfms7ENKd79J3EKQZZCYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758619978; c=relaxed/simple;
	bh=tPB7raWfWGID9fR86FpK1VHZrKtm3duV7JMnG1ZKvQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m/3y5SbtS9HoGglssPZmct1Ly9Mlr6QmG8xz1u2bIlCMXRznrIK19RmCf+Hjc2Z1bD4IlsWCp5Cm0UkLBv7YREkvFU6AAj+bv0W52pfuyjvgtC4esEPaAcRH8bsDcGcEqGQogtODjRkvQC/nN5WrWGh1s8SLrEKhjyVB+JhXjxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HnIUXBqy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HnIUXBqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758619976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2nfMQGoI76BBPiGl3YfZGIEopu0bozaW6TiCupIKqWQ=;
	b=HnIUXBqyxN4jEEX0aJFxefExF/9j8QGEGhLw1284a9sd/MufOBaY0cruUNW0280aLH/IHq
	h3jVzP36s8xxMZk7D6Kq3OpdRkUCB32lEYpR8sALBhkjehxeI5yyVNT0a0SR2m4M8M/9Ld
	AJC4YJ6hojJCJ+7w2WwNvaOKMNyxYrI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-HD3ScaxTPNGuKQZJiQkqug-1; Tue, 23 Sep 2025 05:32:51 -0400
X-MC-Unique: HD3ScaxTPNGuKQZJiQkqug-1
X-Mimecast-MFC-AGG-ID: HD3ScaxTPNGuKQZJiQkqug_1758619970
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso19824455e9.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 02:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758619970; x=1759224770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2nfMQGoI76BBPiGl3YfZGIEopu0bozaW6TiCupIKqWQ=;
        b=NZIzr4XWqhWVnEj4BMeK3ESCobPfXKeK6jsqKZYpcfAx8lU9Hcjq3ZpmtqAlbMDIOl
         Wr8hV35GRhespHjIbEjJ8N2zWwo8IgQQqViVedICWSlZ2UV3BEbzoUA3uXKpO/7NGMNB
         YxT6GBOyOplQf6Hg85vi9aP21r68nkRIohdzIxzHJU15Km/Hh7OTGKBReSdgNUcZSWOj
         64y3Yz2ULxIY+gkECCstHxIfa5ZJ5XBTC14FL4ytQhCSi6ofwmLp0yTO7XgDwAr61FQL
         hX4N+y6j/FsVjeVqGiqtnoYSifLuebItLZ0MpmGl309zzrnKzAJysJQkalQus+rMtqzF
         dt7g==
X-Forwarded-Encrypted: i=1; AJvYcCUwnlfb3MZf32TCGueDXKphub9usuHNUGyJmjx7ynrTyapO9HX2bIgekJj29egBMMczLxVTFU0X9xg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz7Ox3sdPjf6rRemGbH5/P7/gCCLfj/7Kj0E90QisRzvKLUNl5
	xNHq91VqGECNvOiM0HtdCr01xLTxqJghNXPPv+y+wCKGRgTzsTyezE/jJNMVVwa5cDUDqrf/LHC
	jWlzqoJkeleaVV0VKjNeKePyp7PgbSr9LJ3AmBalU4w3qCeCAesMhI3b+YTyiZA==
X-Gm-Gg: ASbGncsnRiFANHz0d7AT6l8grh+ZTM6RWlK6wMGQIAiOIp4z3bfawNfCY43IVwTtcPg
	WOU+Zf6EfRYolE+oeK96Z5rBJ4Epdlq3ZehlNm9cB8YJBDEsamDKZJN6erUpX7GihXu4Ldz68eS
	4El8Uh975/1GfVx3Fh1wm+XWevM3k/TfZlEMsqV0rOcjAZVQK6J/1ftI/YU3ANHg3b0NjmfJW4Y
	eHPyoCe1mZsmjfTOPQJBKEs+DzoeJT91DB0PK/DGE3bWY3yDOWawq/9qoAj/ZFH8mCZwooSdacE
	H4VYTYzm6QDPL4oIWYtdXKAgTdcRLxYsLqVaI9dzrsoycsrPaWbV+XdMT+MeBhM2nF8x9CHNKKC
	qAWC72WIQ7bvs
X-Received: by 2002:a05:600c:1390:b0:45f:2c89:a873 with SMTP id 5b1f17b1804b1-46e1dac904dmr18754175e9.35.1758619970377;
        Tue, 23 Sep 2025 02:32:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRjW0E8LgYXwe/Hd1Mr/o19iMfwq8X3jZyBkMmVWt+MhwqmWqz4pvjlLgA+mFsqOcaCMAy4g==
X-Received: by 2002:a05:600c:1390:b0:45f:2c89:a873 with SMTP id 5b1f17b1804b1-46e1dac904dmr18753925e9.35.1758619969994;
        Tue, 23 Sep 2025 02:32:49 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad30csm271970905e9.23.2025.09.23.02.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 02:32:49 -0700 (PDT)
Message-ID: <edfffc1e-a737-4074-98b1-6a2d60f50051@redhat.com>
Date: Tue, 23 Sep 2025 11:32:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 01/14] tcp: try to avoid safer when ACKs are
 thinned
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
 <20250918162133.111922-2-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250918162133.111922-2-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/25 6:21 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 9fdc6ce25eb1..0b25bf03ae6a 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -488,6 +488,10 @@ static void tcp_count_delivered(struct tcp_sock *tp, u32 delivered,
>  		tcp_count_delivered_ce(tp, delivered);
>  }
>  
> +#define PKTS_ACKED_WEIGHT	6
> +#define PKTS_ACKED_PREC		6
> +#define ACK_COMP_THRESH		4
> +
>  /* Returns the ECN CE delta */
>  static u32 __tcp_accecn_process(struct sock *sk, const struct sk_buff *skb,
>  				u32 delivered_pkts, u32 delivered_bytes,
> @@ -507,6 +511,19 @@ static u32 __tcp_accecn_process(struct sock *sk, const struct sk_buff *skb,
>  	opt_deltas_valid = tcp_accecn_process_option(tp, skb,
>  						     delivered_bytes, flag);
>  
> +	if (delivered_pkts) {
> +		if (!tp->pkts_acked_ewma) {
> +			tp->pkts_acked_ewma = delivered_pkts << PKTS_ACKED_PREC;

Can the above statement overflow pkts_acked_ewma in exceptional cases?
Do that need and additional min_t(u32, <init val>, 0xFFFFU)?

/P

