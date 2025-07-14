Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864424678B
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505951; cv=none; b=V/oNqdC2asH5S1qAm2yUFtYnB+yejdgo8BuQUlASsWOmZSk/7DFdH4zOtSXAVGW54J+1AFoCRg5JE9x6A2H9LdSdOpfFozm09tw0z8UMg2aXS0PO3NQQB6ALO2FnkiCB5xbiNV/y3tpsGHSY3hjSbJRfjKU+R64isHHbn17P7YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505951; c=relaxed/simple;
	bh=nUBsyJw1CVVySBdkscf0wKBNx6+3aTki+UmriA4CZ7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G/2WtXT0CDD1cyoVmkalz/InMz3noPpiuKdRcSb/2He6x0uaHcTLynuvR/scI/+j2HGVL+kwoaADNvlgm6lND4/mgCl8N7Zqc2Q629FxSyIkVFYbXgjBF3a0V3oLME0bkOTDSog3c7K81P9OMIN1vmL4/TsoFl4Ih5TFT1sVESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ay1s6mI3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ay1s6mI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752505948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MByh1M8hBJM6ZO7YZ21H+SItyH0RTixPX6ghJ1VgS10=;
	b=ay1s6mI3yWSvcBE5bjvkYNF5KjB71YxA38QqKB/P4o4B/u15LXCqwkmiZ9TVWJL9sTq38i
	+cffp0mV3RlbKxJsfjUKVVYTZQb/CB/QnAFAsrdfNXPUMz9NZW+Qhg0k7mLTBsNFxu3U3L
	Rd8QNQngRg7/pMMdf21x/ZoPRqkQ4hQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-V9EIixqeM3COzbsnDH5m5g-1; Mon, 14 Jul 2025 11:12:25 -0400
X-MC-Unique: V9EIixqeM3COzbsnDH5m5g-1
X-Mimecast-MFC-AGG-ID: V9EIixqeM3COzbsnDH5m5g_1752505944
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4560b81ff9eso14046905e9.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 08:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505944; x=1753110744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MByh1M8hBJM6ZO7YZ21H+SItyH0RTixPX6ghJ1VgS10=;
        b=iyORPv6CJJIjrpVGAKIcxY+dskFkIHlIXzOVPVr6248KOsP71XV9xpPjYI6U8xNZZG
         JnJHiWu0sp2QNGXPEfPMJMdIwch1MB/nCMyKJqxQgb2hBQmx5MUnt9hGGb87HLF0sfCL
         77U7B3K7nvwsPJAPydwFsXdkblz2afuez2YUKnnuDqsqPDdJfMg2Q05MYbIopGzp6YBb
         n/pY+sOf017P+Btt8BG8WnrSJG4NzPTK/tmV8M9oAt8xNFWNHFFJ2t9K2RfN7iBYloST
         r6Xw1/dZgyG3ZR+6/8gs7HI6DQkHmZCyIHgb9NeF4K2qwrdTPOkHU+nP8HL+yjRcnvtC
         1rTg==
X-Forwarded-Encrypted: i=1; AJvYcCXyjYBNIUfb1Vj0nK1tyno5PeQBLlXgINu7ZweVIsFEGCzMO3aHBJZtV7Mb657+Tp9K5zsEvDEjcfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQCYcBYtlEB6YwCf/ShK0vs9xkuk+cOmMdwlKbUiwO1JFm5rhJ
	FALlqKKNV8huZfJKzeHHCx6JHaUHY9V5xVPll2rtui+xdAoYLvJNoA9IfS4FirtWH2lSZlzKWjx
	BB22tw2x5imF4jPKiavQWtwJTukZQcC3flC/xTu25cd12cs8aFHHpBKtMndEyfw==
X-Gm-Gg: ASbGncvqs+cwOIsjmQbRHGyX5jowh3cerb9m66BfXudt/V63m/HiAEBGHS98v7iz/F7
	tueAjG3e1fspDRWn4+uVZZlt4wSOg57DIkXlqSh+3UYwezXUyHUsDuVUB7uTWD0ULF3wJLmaGx3
	KH2qxpbBf3gNYMZGRMa50y19uu/K5ChycX83gmkB36RGkL+3yXROpdh2fVB0Pptedxl72AqfTBo
	J3Fj2Q1mlkk1E3LBdf8V1Tpye3umKU819PJFpN0crAjDesvyXEsu8VNQD15fpRFRxQDszx1Vygq
	Jca65KlYKHxvMXFcK57JMKFBklds5wx9bSh9e9JB1RQ=
X-Received: by 2002:a05:600c:841a:b0:456:1b6b:daaa with SMTP id 5b1f17b1804b1-4561b6bdd3amr38487905e9.29.1752505944233;
        Mon, 14 Jul 2025 08:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI8sx2a/TCHL+bqItM/OhugxGKDQcaU6p5roxACLJIP/WtAGE/GxnvHPR1UMcQFIC+o2xoAQ==
X-Received: by 2002:a05:600c:841a:b0:456:1b6b:daaa with SMTP id 5b1f17b1804b1-4561b6bdd3amr38487625e9.29.1752505943842;
        Mon, 14 Jul 2025 08:12:23 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.155.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd56d936sm117404425e9.0.2025.07.14.08.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:12:23 -0700 (PDT)
Message-ID: <e3bef5ed-535f-4ce3-9ea4-f6a40df448ff@redhat.com>
Date: Mon, 14 Jul 2025 17:12:20 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 net-next 12/15] tcp: accecn: AccECN option send
 control
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
References: <20250704085345.46530-1-chia-yu.chang@nokia-bell-labs.com>
 <20250704085345.46530-13-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704085345.46530-13-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/25 10:53 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> @@ -1151,7 +1155,10 @@ static unsigned int tcp_established_options(struct sock *sk, struct sk_buff *skb
>  	}
>  
>  	if (tcp_ecn_mode_accecn(tp) &&
> -	    READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn_option)) {
> +	    READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn_option) &&
> +	    (READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn_option) >= TCP_ACCECN_OPTION_FULL ||
> +	     tp->accecn_opt_demand ||
> +	     tcp_accecn_option_beacon_check(sk))) {
>  		opts->use_synack_ecn_bytes = 0;
>  		size += tcp_options_fit_accecn(opts, tp->accecn_minlen,
>  					       MAX_TCP_OPTION_SPACE - size);

whoops, I almost missed it...

Please call READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn_option) only
once, i.e.:

	if (tcp_ecn_mode_accecn(tp)) {
		int ecn_opt = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_ecn_option);

		if (ecn_opt && (ecn_opt >= TCP_ACCECN_OPTION_FULL || // ...

/P

