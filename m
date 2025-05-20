Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012092135D1
	for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734599; cv=none; b=TiWDHpdQ2TQocMhkkHgifUGgS6LYUHhmlQSSIGvJ/b1dxi6CRQ9/kWzuV595CAgxuduNHvWnc5WoUyxKVyBRABuxZtvFioa8gkdto5Q8Nb2QGwIi843V72Z4xwiv21XHyffoozMQqcu1bnwXADN4N//A69qecWPeTEvnuHGoDbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734599; c=relaxed/simple;
	bh=zmMeJiDDZWaauBVCwiIbfO5yDwZo3DooABBxbFXHDdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Yh591z5kFo/nmekMkiZdkAw9pvew99hOpyTExVKYPy4RhSj5gzaZ3UqfkLm0WIrktxwm4XHzPy8EKw5Alsz/VbfP3huBNhM2sx91BYrgk/1xMtr3MxXyIw3H/CYrEWqWeYPSgpHeaqErAyvpUx4qCpNUxlOZ5BVL4LvshsPtf54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OilUs5VI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OilUs5VI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747734596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aKVK+uAlT4VzaC9oAx0YIHTOnxhoJDuCN0nhLSXNB60=;
	b=OilUs5VIuMkAc5DqdUq5KBNkbKNbgf8IVIE6lFJx4vKDMkDaBxvYuTC0RMlOZaXz/gJSNd
	AaUGHNkYk3DCOwMG+mkHhVdpbRSJ+GKFAaW3+IU3OwNiHEzfEs0az+i0clj7ukNizoSC1f
	5ta/UULC7J4J/+3d6BOTTYZGJWMjPM4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-HVj9GA8_MNGZaOd0kqxviQ-1; Tue, 20 May 2025 05:49:55 -0400
X-MC-Unique: HVj9GA8_MNGZaOd0kqxviQ-1
X-Mimecast-MFC-AGG-ID: HVj9GA8_MNGZaOd0kqxviQ_1747734595
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a362dcc86fso1465470f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 02:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734595; x=1748339395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKVK+uAlT4VzaC9oAx0YIHTOnxhoJDuCN0nhLSXNB60=;
        b=vFKyJluoNtKcrPBNjCKq75wddav9Cexppcw8JfVhz9QRHLHw31rLhPg08w0dOGImnY
         9T6c2OPV5txyZcYUtnN34ThwDp4Z4/et3NJ4GBaLJMldbXVVCg/D5RQykz/2pWMMtIEz
         DofKwHTgam/yyAEpNm+E0HNwUIsqMFA1sv3FX/1CK1uV1d2vIS2AO3QEHHpbcV/5XfPN
         I3wQKAix9b6GLkD/qtT+5Lk1yqCzdDLm3yFnrfpwB3LMxpbkisod1L3CMlyacerLg5u0
         RLclhs9o29swReINZXJrW3VQilxMt9Nn3ApBCE4zpba9RfV1sXtVbWo1FvgY0vtKZrzo
         4e8g==
X-Forwarded-Encrypted: i=1; AJvYcCXocGXHtkzoQzkUPiDSRpvswraj6kvAu2rkLVLiz4kAFXIbYnZdZcU09xuabzR1R49y1t1vpqnGy1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY453Qf0jif1ZxkCykuZkPEWKL7FTTXSx5FXGhlMq72qsNaLPb
	1ZTntHZm9PtWSbXQLp43M7PQF2eBMmjGYF4BhKZqooecA/2T7O/lU4PpKvLcbEIP9DVMVysE837
	oNIxPaSHzlfH0NK12XmBlf08aVjnpF7TCiSO0PMhuGFPS4OKmPtstHTtb42KC1w==
X-Gm-Gg: ASbGnctdyUpdSVjUlpd4nu/6kVA7pQ57JJw2Tnu3zY3+yn0bkMVx+3bMgjcWdIkjUiW
	Pjcz+5lTPOwIikl8s+nv8ZzZ9CdA+N481Bl3lVfC2n6M5fThUrotbU8LIXRoDNUM3rMhs278kxL
	oZI0/FTYHjR779O2qB+6u4TEBnKlObG7USdgZSGNK+P5Zk9cCs9WYIYMcb9T6xDhzHEbJzpHAND
	8hO3COH/1AfKb/6SIj/ofoycRRrVKn3/O7IuCKaIZ9YBjNqrGsotTEVsA0eHiOvBW6if5WDeoW9
	zLlJM+hZlwPl1uloNOtAxV6Sojdcjr7sq8xnQPCNIcRW1Ukx8KLVShT+kGI=
X-Received: by 2002:a5d:6a49:0:b0:3a3:5cca:a56a with SMTP id ffacd0b85a97d-3a35ccaa7ccmr9872999f8f.32.1747734594722;
        Tue, 20 May 2025 02:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERZPLs4JlsuZmumP5YHPtj9qIckLqLuPz2NZ0FOXcdTy6ANbEKQ9dbQymmsaS/IsilI+AwLw==
X-Received: by 2002:a5d:6a49:0:b0:3a3:5cca:a56a with SMTP id ffacd0b85a97d-3a35ccaa7ccmr9872974f8f.32.1747734594291;
        Tue, 20 May 2025 02:49:54 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db? ([2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88a13sm15601908f8f.74.2025.05.20.02.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:49:53 -0700 (PDT)
Message-ID: <6ce5f200-aacc-4b01-b3b6-b2dbe543248d@redhat.com>
Date: Tue, 20 May 2025 11:49:51 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 10/15] tcp: accecn: AccECN option send control
To: chia-yu.chang@nokia-bell-labs.com, linux-doc@vger.kernel.org,
 corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com,
 bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com,
 jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org,
 xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@google.com, andrew+netdev@lunn.ch, donald.hunter@gmail.com,
 ast@fiberby.net, liuhangbin@gmail.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, ij@kernel.org, ncardwell@google.com,
 koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
 ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com,
 cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com,
 vidhi_goel@apple.com
References: <20250514135642.11203-1-chia-yu.chang@nokia-bell-labs.com>
 <20250514135642.11203-11-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250514135642.11203-11-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/14/25 3:56 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> @@ -6450,8 +6480,12 @@ static bool tcp_validate_incoming(struct sock *sk, struct sk_buff *skb,
>  	 * RFC 5961 4.2 : Send a challenge ack
>  	 */
>  	if (th->syn) {
> -		if (tcp_ecn_mode_accecn(tp))
> +		if (tcp_ecn_mode_accecn(tp)) {
> +			u8 opt_demand = max_t(u8, 1, tp->accecn_opt_demand);
> +
>  			accecn_reflector = true;
> +			tp->accecn_opt_demand = opt_demand;

There is similar code to update accecn_opt_demand above, possibly worth
an helper.

> @@ -1237,12 +1253,16 @@ static unsigned int tcp_established_options(struct sock *sk, struct sk_buff *skb
>  	}
>  
>  	if (tcp_ecn_mode_accecn(tp) &&
> -	    sock_net(sk)->ipv4.sysctl_tcp_ecn_option) {
> +	    sock_net(sk)->ipv4.sysctl_tcp_ecn_option &&
> +	    (sock_net(sk)->ipv4.sysctl_tcp_ecn_option >= TCP_ECN_OPTION_FULL ||
> +	     tp->accecn_opt_demand ||
> +	     tcp_accecn_option_beacon_check(sk))) {
>  		int saving = opts->num_sack_blocks > 0 ? 2 : 0;
>  		int remaining = MAX_TCP_OPTION_SPACE - size;
>  
>  		opts->ecn_bytes = tp->received_ecn_bytes;
> -		size += tcp_options_fit_accecn(opts, tp->accecn_minlen,
> +		size += tcp_options_fit_accecn(opts,
> +					       tp->accecn_minlen,
>  					       remaining,
>  					       saving);

Please avoid unneeded white-space only changes.

/P


