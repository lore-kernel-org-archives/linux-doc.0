Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88005268C4B
	for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733675; cv=none; b=sqeLoeC3/i0ep7rB4fGYTP6d4XxAiPHtS9pKFEH7O1pqKVOiyl34qUT8B4Etja0w2Ec/LaCk+h5AjiAIVd8XGoZR4R3VMyS+a2NxMyqNxVDvt6FvHk6SMLwm2OmkkUko0ulCuhwS8KqCOS+ayg5ysAh0DPCSvGGtJUnvwSFDV9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733675; c=relaxed/simple;
	bh=PCd7B2CKJamE+lIGpi1n0g7Z4216i/A7aPBeHZSzo10=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U0+rlh/Ocmud9iCXCTb3mWDn2VSkIpWqiAxaHQ0a9WbhKChDBKOVCJGFVaimQJSqn56fmZTwOBx1/KvrxfEuh0nbTXey3Lg5RIL45FOdgfexwEcx4stDlxiz5oZk52wv1F0KdiDoOMdHsoATrevBldyAvV55AP6upUShVMmQLg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CqBQ3zdi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CqBQ3zdi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747733672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2NE/+J7lqNQA/ShV5FIY+NGVs5/A/4r4zhgGDuUCRS4=;
	b=CqBQ3zdiaNNuBS59/THA7LgUSYr7VNe0qPGf5aMPz+Ym+k008NhhIWctWGUwGtm2r7HWRa
	J+86sDW7S6kD+APKUUeWSg6LdKiB+yJKheFrOcHU7hrAo2yJaloChygOEnHbE8Pv/S9y5A
	xj1Ci0tzEavi7Bu7Y00jcOxwtLXc/nc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-_jDxMlenMMahJgQOYi0_1Q-1; Tue, 20 May 2025 05:34:30 -0400
X-MC-Unique: _jDxMlenMMahJgQOYi0_1Q-1
X-Mimecast-MFC-AGG-ID: _jDxMlenMMahJgQOYi0_1Q_1747733670
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a36c58ef62so1303699f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 20 May 2025 02:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747733670; x=1748338470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NE/+J7lqNQA/ShV5FIY+NGVs5/A/4r4zhgGDuUCRS4=;
        b=ZYRJ+HTbUJHbKw8bGYdWg8vJr+sEUFi/H9Kl0ki9E+Xhnr25fThxlH+4WHFSeH7JGF
         OGVQ9GDNZ9nH1vXWj18RYDPnDzL6D1Dfxkwr2UUt2PMVPYRRPbz0dp7Hm2m5F3Uds+t+
         kOhCUj5hxEXUa/dKvs/JfaRfaqX2W4iKRm/Wb0/dpK5l5iZZpaxTlg/T1De+UhSs9NFl
         NlRsbPd8j9jEINjHa4DaTiBM7ZHaSFj6Gt+KzfOrkEfdYOMWuNhKepN4Zcy31969gS+0
         4YMlG/POfWRAellSG0ffFX19P6xfvq9pmakvpBeW+ph8o4e4CGISdksoAHmmr0v4tuOL
         JSXw==
X-Forwarded-Encrypted: i=1; AJvYcCUXpxN9Y7dFk4L3PsEo16qcOqYCdyySIo3YoIjX1+oGMRqwFIOkY1zkBnOz8UD2BuR3iQLKshEOSqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YweAuo7oTDP9vQm0uFxiOSaJC+AdfyY6K/aUqa5yLOBioh6NNY8
	kHw/Bk0QyMU0cR7jNearN9/6jHA9LmqPWqxAZSJC0XjDd7CVnZTQ52WqDM/Co9tkNyai3w8L3t0
	tbZF9ClsTDGYt/U8ptQG3fBD7Z+nbzTcQXUJOemBgHpM7wGEqe3L8/OwcZu8SOQ==
X-Gm-Gg: ASbGncsMyteS4WMCS54kCrfMAFsAglPeNWMIUw2nHrd2wqNDkM0ed8Z0njxCUIk7zdq
	lSbw8WwuJExpofwkg7/tj0Mw+U44hWSE/7cjzMV9/uNT6B+lKrb80Gx5u9nVIWPPV9k1Xe+qblP
	DniibcVSB0gY5JSe5yUujFlEpApbuYJE/BOHFt/Y4LmOFn33uBmlW++Mu2xHNeOOuU0siqNqF4L
	XXmKgVLE1Wz3E8DgMGiyGCT0Pus3Ct7PFnEvQ7aEN6GSwHlXxKyPnpEyNAKVolhVFVqRevRRlaj
	A0jf2Wji7vvHWZucrKsx0g1X90OYWp7kqGMFl4SbnKC4iTbFJn1EzvM8OgA=
X-Received: by 2002:a05:6000:1ac8:b0:3a3:6cf3:9d63 with SMTP id ffacd0b85a97d-3a36cf39e6bmr7068884f8f.34.1747733669703;
        Tue, 20 May 2025 02:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuVkjVQJ2eOY0GRr+yrteefyL9sA1r4XDiPPnflkR/rXOi3fp9tCEjol8O9cOiuqNwVG19PQ==
X-Received: by 2002:a05:6000:1ac8:b0:3a3:6cf3:9d63 with SMTP id ffacd0b85a97d-3a36cf39e6bmr7068828f8f.34.1747733669229;
        Tue, 20 May 2025 02:34:29 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db? ([2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a84csm15787427f8f.31.2025.05.20.02.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:34:28 -0700 (PDT)
Message-ID: <14d6af16-c93d-4b38-b748-76c894c0cdf2@redhat.com>
Date: Tue, 20 May 2025 11:34:26 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 08/15] tcp: sack option handling improvements
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
 <20250514135642.11203-9-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250514135642.11203-9-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/14/25 3:56 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Ilpo Järvinen <ij@kernel.org>
> 
> 1) Don't early return when sack doesn't fit. AccECN code will be
>    placed after this fragment so no early returns please.
> 
> 2) Make sure opts->num_sack_blocks is not left undefined. E.g.,
>    tcp_current_mss() does not memset its opts struct to zero.
>    AccECN code checks if SACK option is present and may even
>    alter it to make room for AccECN option when many SACK blocks
>    are present. Thus, num_sack_blocks needs to be always valid.
> 
> Signed-off-by: Ilpo Järvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  net/ipv4/tcp_output.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index d0f0fee8335e..d7fef3d2698b 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -1092,17 +1092,18 @@ static unsigned int tcp_established_options(struct sock *sk, struct sk_buff *skb
>  	eff_sacks = tp->rx_opt.num_sacks + tp->rx_opt.dsack;
>  	if (unlikely(eff_sacks)) {
>  		const unsigned int remaining = MAX_TCP_OPTION_SPACE - size;
> -		if (unlikely(remaining < TCPOLEN_SACK_BASE_ALIGNED +
> -					 TCPOLEN_SACK_PERBLOCK))
> -			return size;
> -
> -		opts->num_sack_blocks =
> -			min_t(unsigned int, eff_sacks,
> -			      (remaining - TCPOLEN_SACK_BASE_ALIGNED) /
> -			      TCPOLEN_SACK_PERBLOCK);
> -
> -		size += TCPOLEN_SACK_BASE_ALIGNED +
> -			opts->num_sack_blocks * TCPOLEN_SACK_PERBLOCK;
> +		if (likely(remaining >= TCPOLEN_SACK_BASE_ALIGNED +
> +					TCPOLEN_SACK_PERBLOCK)) {
> +			opts->num_sack_blocks =
> +				min_t(unsigned int, eff_sacks,
> +				      (remaining - TCPOLEN_SACK_BASE_ALIGNED) /
> +				      TCPOLEN_SACK_PERBLOCK);
> +
> +			size += TCPOLEN_SACK_BASE_ALIGNED +
> +				opts->num_sack_blocks * TCPOLEN_SACK_PERBLOCK;
> +		}
> +	} else {
> +		opts->num_sack_blocks = 0;
>  	}

AFAICS here opts->num_sack_blocks is still uninitialized when:

    eff_acks != 0 &&
    remaining < (TCPOLEN_SACK_BASE_ALIGNED + TCPOLEN_SACK_PERBLOCK)

/P

