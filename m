Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621D526A0AB
	for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735437; cv=none; b=Ca2wRGqGs/wfayq9ZQDHLu/n/E894pmI5ApC9WFoD93kyGoujEc/KGJ59o3LeX2Sd14sBXOvozu8JxGpklkH9WLiaak+IzMmb6vSrV6KzWINBj/C7ASv1DOKVYGu4u3Jl0W4xeeNNxznyKdniEqNyrzpF3xtwgOmHrm7BjzLkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735437; c=relaxed/simple;
	bh=oQct3z7yZTuJFGbn3XS7mhPXI0W7KRCAKQLxbHABIwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mqg++/4Dx8ic7aSpEqVpcJFFaEjpgCoHcI9bFTzRRGYJZI734XPhzIjNtvvRqArw4D77GCSXtgGlTOMvQO5gOXkjotJljDG+/JsdUGgbzR3w42UK5u1UGCh6zOycOW4LgIs1Z1zIQqT3qE3jyHqdRWOSnbw8nwWazFTH5G70C7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HcpQIk3U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HcpQIk3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747735434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eLw6MuYmnUA5oO55uYzH8GiosQdp8/A6eA7en/wS5A=;
	b=HcpQIk3U/cHsru8Tdmq5Ks6hTZQld8VPZvLkspwinkHVnQjgMtfaeqMAh+fro/0+tGtY52
	4VArwMWxh1pGnaYi8taeWgAcVdU0zvWB7y9HB7IZxQ7FYysZRKNMmiN7F67iAxtTWOSglV
	cHrsHC6/DAasENu9c5npatV7lzWcw4Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-j7IShg_jMhe4IaLBObd3hA-1; Tue, 20 May 2025 06:03:52 -0400
X-MC-Unique: j7IShg_jMhe4IaLBObd3hA-1
X-Mimecast-MFC-AGG-ID: j7IShg_jMhe4IaLBObd3hA_1747735432
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a35c8a7fd9so2119224f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 03:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747735431; x=1748340231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9eLw6MuYmnUA5oO55uYzH8GiosQdp8/A6eA7en/wS5A=;
        b=BV4X5keTsyP0fzaBypop8AZlVaRpcgKdxK0xSSFnYLFTmQOaXQ7rkPJOufUb3AtL7W
         qTzxI/yPETLBCz8HS3OOQxrewGOdevmdcYwgHoQANot9lBX2GTUAaJd2V6ga+Kbg/cfS
         fEDZ1SWtITsJyBtW7tso9r2JJxl0X3rCYrDZoyVXrP5+uDn9XbbqhPmC3GnD/aHXpLz3
         rb0pWMqFafkZeCMSOKC1m3S4I74K44XlGGe2Rm0zvwFLzevOVz5skGdJ7YGwH+sBOPIZ
         tHzLqx9bpl5e55eRIQT4y/ekGGWgkkj1t6JxOa7BJ3tBi4Gnilj+Jjy1FVVjOm1HoJ9P
         MNHA==
X-Forwarded-Encrypted: i=1; AJvYcCUK2id2SfCW+uJE1qhh22I75iw27uINoBnq5PgnrFwt/W0vJ6EwJu0S8LcmfbRgv5PqzGO0SEXZk6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGpSrloS+9d0YFBxi9i2SOj/7tWxeMnXQClYnaqed8qIVOgTrF
	U0+C1J+CIZ47IaBj0YC1p8klCzMgpgRDQFfQO7yJ99NjBwcwbJtTnfAkaVakX7bpBOSmK+7YNlH
	9tqIWc0gZ0PH6oN4N+Pl7UYMGQARLxZzPSvO+Oz3WNtYlVGLYH2ocarMrXp8YLg==
X-Gm-Gg: ASbGncsffAhjdtYdeiIty2t+tVw6lDt+YHSVX0G+PTd1U0kk4VsnMY9NcLSRHgmW6ap
	AvjrvM9Eo06CZzJjxMRRBT+feE+eTdb42bhP7tCfEHRhMB9rfFpMlf7rfN9IUMkN+sjSpBb5uZv
	rI8yC+95MsW84Ka8RdmDMjVS9ZYyLZHEjclB6NtWNZjr45PDtxY1f+T8qDks5hIkrRK9mj3zbsr
	ypZ/OVUHXKIoHJwEO9pPwC9aVm6opY2rGWuHlzcblF9DmYRCBKU5tYjQqllmFanM6+V0EgRZok/
	8L24BoeR6leUgg8O93LFfeg59aUlAKMs+xa6jQRbyED7515lWpNUX+zXnuc=
X-Received: by 2002:a05:6000:184d:b0:3a0:b56a:c256 with SMTP id ffacd0b85a97d-3a35caa324bmr12946142f8f.28.1747735431512;
        Tue, 20 May 2025 03:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjzsI2YT2/DVLY0cAmO5haVByJwMdMBzlDD2Iap/r36gCGHKYF7umijA2JUWL0evKqNRnT8w==
X-Received: by 2002:a05:6000:184d:b0:3a0:b56a:c256 with SMTP id ffacd0b85a97d-3a35caa324bmr12946075f8f.28.1747735430967;
        Tue, 20 May 2025 03:03:50 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db? ([2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a361b04236sm14646668f8f.28.2025.05.20.03.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 03:03:50 -0700 (PDT)
Message-ID: <5cd44751-19df-4356-a485-a7ba18a05482@redhat.com>
Date: Tue, 20 May 2025 12:03:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 14/15] tcp: accecn: try to fit AccECN option
 with SACK
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
 <20250514135642.11203-15-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250514135642.11203-15-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/14/25 3:56 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Ilpo Järvinen <ij@kernel.org>
> 
> As SACK blocks tend to eat all option space when there are
> many holes, it is useful to compromise on sending many SACK
> blocks in every ACK and try to fit AccECN option there
> by reduction the number of SACK blocks. But never go below
> two SACK blocks because of AccECN option.
> 
> As AccECN option is often not put to every ACK, the space
> hijack is usually only temporary.
> 
> Signed-off-by: Ilpo Järvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  net/ipv4/tcp_output.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index b630923c4cef..d9d3cc8dbb5b 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -982,8 +982,21 @@ static int tcp_options_fit_accecn(struct tcp_out_options *opts, int required,
>  		opts->num_accecn_fields--;
>  		size -= TCPOLEN_ACCECN_PERFIELD;
>  	}
> -	if (opts->num_accecn_fields < required)
> +	if (opts->num_accecn_fields < required) {
> +		if (opts->num_sack_blocks > 2) {
> +			/* Try to fit the option by removing one SACK block */
> +			opts->num_sack_blocks--;
> +			size = tcp_options_fit_accecn(opts, required,
> +						      remaining +
> +						      TCPOLEN_SACK_PERBLOCK,
> +						      max_combine_saving);

How deep is the recursion level, worst case? In any case please try to
avoid recursion entirely. Possibly a 'goto' statement would help.

/P

