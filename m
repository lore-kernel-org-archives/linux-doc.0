Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7CA33345B
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861302; cv=none; b=BMDvi1VBrP3kYFD2FMI1A3yBbb7KYZHwhwcihjyRrvK3KwZ5PHdrFu1Qi8EFvyl0jfH+H/vEzFqNPWgTqIHqIrWx14Lh8WT7pLNJ15Wax0V85ZWH9K9+pZtEuHYHhvulPcJy+5EFCZWf7PRg6laLaGozxEUg/Rt/OeIy+a0j5d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861302; c=relaxed/simple;
	bh=vOqy1647WRoRymxOMyXMEG8qnGN00OXJpzkXEokwITs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XMUHg2BrI9xtbtMRvJpZF5TPikYDb2WSeAObcvV+s5p/U6iIoPgm3VgAnNjFTW4mH2MB6TL55xuz6y7jfq5R/d/RB2GyMCTUyeiwLAC48/Cm+Qw5p1Pt1m2Tuxi+IQhnQ4ymQzXsL186iQaeWCY+cB5ivGwuEU7U22mzonvbnOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GQFhnX22; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K6pYkrNq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GQFhnX22";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6pYkrNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767861292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3izPdtqXaA4EZIquGKpD4hKmpzGXchWnG6uLb78MGE=;
	b=GQFhnX22O+Txw9S2KPtVot3iGYRaOF+wGaNDPDhD8Ln1AEAVt4jJP1pToS0fuDTYSiqxe6
	JjQEbvi5clIX7l3lP1niQ8/oCOg2wO0LsKBKhaSFaYoul5vzbg2PNRqys6tNdM0uqL5l38
	Do/D/34Q8lVyxGNbaLupA0GOJsD85p8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-G66xyaAkPn-cfd8wOM70Sg-1; Thu, 08 Jan 2026 03:34:51 -0500
X-MC-Unique: G66xyaAkPn-cfd8wOM70Sg-1
X-Mimecast-MFC-AGG-ID: G66xyaAkPn-cfd8wOM70Sg_1767861290
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430ffa9fccaso2150817f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 00:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767861290; x=1768466090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3izPdtqXaA4EZIquGKpD4hKmpzGXchWnG6uLb78MGE=;
        b=K6pYkrNqcNjfA68oKoBMJy8uzKTXCn1nNZmV+13XHevU8yk/NRVpLmCk9w7lRu4zFm
         +/s7VDAzU6q6sCJoXsKT2J2hmeclRtBW7KDV1iU4yG4HJlbFJVRepTmoMG/mdVYMkS5/
         m5Xd+frci9SzO/ainVdYma5C852c7iXOeDxSuK3rz85E9wzIR+ubxiwuxbl9zXmOYiNP
         rEvuakL7XG0h3K5xwOvr2gA/wZHljxGbLXBi8qWOSVZOAEXa258q6djz8A9yNii6N8f3
         Zd5PLJm2PV02rGuK+KLI6D373ptOvMFsdRhQq7EaCmd+NP9waUv9PGG/7pbadVYjS75F
         IV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767861290; x=1768466090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3izPdtqXaA4EZIquGKpD4hKmpzGXchWnG6uLb78MGE=;
        b=GyJ2zZVX3yJYSSiD5MaLfhusUYj/Mx0Ueiu3ut/VfO04CYm+aJEhm1SzJ6OzyJN0Na
         1AIyrVfXkCCKW/AQyla8QludtzmaTGZYG5pqPu2ndUNKtzqF5UmB8Np62r0SmExZg0F0
         lnCrydMm1sRZ9ff/rcxNaW4dHyhAsL5b2ly0QwCeCujQubRhuIVAtmmvp5ckdS4rgFRi
         Rm3U+aaZTdgyeCnZHp5T0oidd4pUYJT0QpwVPlsfT3chAe2jHBerQbhv6/2mORbDijWx
         aeUM7mvZYz1+jel+vqyp7H4a+6TZhW00J/5IxpkQiNq5mN9KEaKFj3SJmgjiAGyQmPNG
         iFMA==
X-Forwarded-Encrypted: i=1; AJvYcCWpG92PwdFuRa2hkN30kuHTegvopfhOukeR1dvjwVDlV7mU98hoIef5um51iOyRMB7IAFgdxdfwKk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+TvAAfqFqRRHuM/1gfcA3GcK1QuGLQ83cMrt2PFPrrTnDWaoQ
	G977ONWHUCg0r2e+zhK+RjssIBFFrr2OKmMkltIJ15NlrtCvyNBppnwKHUyimsN6aZO4ACSaU3R
	RSiv7K2DwqqSNwKSXoiZhb1dNv/fctU3IzmsWZtJuoICuv7DFk5Szvyx4bsgIXA==
X-Gm-Gg: AY/fxX4un00oE1TFQSd0nY9MY2yz84RWJb57PHe98oIqoCDaHDJlailPhti0/U5h3z2
	CuhePczUqyHfdfS5NEdNc4htfrKuKpTA/aNXmflf2q7D2I6OQHD53sUI5FIxdbXSgIRfE5dRka8
	G8UL3As45KUpvf/etVYfPv6ACJV2bgZZSwvCoCzdYalDVlrLhrCNkbvOoDmg7telQgOBP7gtIbA
	H5PLO9gi9XR2Ync7keYYL/30zbA0vlHBySrJmG4PjIuEaB9B1//uS3ja1ULLTS3ixWYg8gYaVVJ
	I+Kxs23QBNwPr46wHhDO7TZhgPOo5T8dGwkhjaMIiV28oZ0bzZOf5khc9PP6JNaRLiNmyPVuMwr
	6Z3eVRhkrMMIf/A==
X-Received: by 2002:a5d:64c4:0:b0:430:fbad:687a with SMTP id ffacd0b85a97d-432c378a4cfmr7270511f8f.13.1767861289889;
        Thu, 08 Jan 2026 00:34:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJdXnc4ULpa81FnMPK+JkotChAGavVuM3yRwe+jMFsfmaDecitohHZqOK7h9/y3DI6QU+Rqw==
X-Received: by 2002:a5d:64c4:0:b0:430:fbad:687a with SMTP id ffacd0b85a97d-432c378a4cfmr7270478f8f.13.1767861289456;
        Thu, 08 Jan 2026 00:34:49 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm14917323f8f.32.2026.01.08.00.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:34:48 -0800 (PST)
Message-ID: <6491258b-0ef5-4789-b856-3e9cd9a3fbd5@redhat.com>
Date: Thu, 8 Jan 2026 09:34:46 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 10/13] tcp: accecn: unset ECT if receive or
 send ACE=0 in AccECN negotiaion
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
References: <20260103131028.10708-1-chia-yu.chang@nokia-bell-labs.com>
 <20260103131028.10708-11-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260103131028.10708-11-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/3/26 2:10 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> @@ -1103,6 +1104,9 @@ static void reqsk_timer_handler(struct timer_list *t)
>  	    (!resend ||
>  	     !tcp_rtx_synack(sk_listener, req) ||
>  	     inet_rsk(req)->acked)) {
> +		if (req->num_retrans > 1 && tcp_rsk(req)->accecn_ok)
> +			tcp_accecn_fail_mode_set(tcp_sk(sk_listener),
> +						 TCP_ACCECN_ACE_FAIL_SEND);

Minor nit: AFAICS the above block is repeated 3 times and could deserve
landing in it's own helper.

/P

