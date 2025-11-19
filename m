Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6823032ED39
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763548814; cv=none; b=CBuCosG0K/ALURbX3t+LU6+ucqOnb7yi9RpsKvdp7rYQwxpJjXD1zJSNQAbkBvWwOD40FKfdf+aea4uNWL4ePB8xExDRRwGYa5TBwi5xSZ1ll8LYzXVeq75gvLYaZsBpKgkqD0qIM+adeJZ16wyhP/l+PgPwpM0ru8hkbG9ujUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763548814; c=relaxed/simple;
	bh=DZIAcCTww0s4iWal9ociel47JWmGW4w6rucjX7XMwbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MZrvV2De34uw59HkR6RDb9hJ0OwldneeCwX5TZjw4GWx9RG4YBckl+8Dd52I32FGJz+iAtnD554XfarPJ4xfLRxrKNbxdM7EoBnn8t6e7SBiL9IPLAS2HyCh2ypts44Cj2OCBYGW+AVPY7/qE4WU3erkAlNzcitwmMneGUXh+18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFbsE+sL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bFgXU8vS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFbsE+sL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bFgXU8vS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763548812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0l9o/pX7rZdgzEzxtL69j/qja5gm9z4d5aM9fQ+O5cc=;
	b=eFbsE+sLoXWcfxX4eNox37FiBPERG7Xmzv6HczRwn4I7hja+t6Vt2OHxt5pWLdw/nwOwcd
	+1E2hWPYtZZRuvXMmGwz8WN6a85h6x8LXdPsXJF6FjmpNHUU6UwqbogWxDbK2/TXhNPLFN
	Jlz6lu1PCTBRlmkq2MAyanp+lXRJ6gk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-2px0_rJFNSuvH8ipri1ylQ-1; Wed, 19 Nov 2025 05:40:10 -0500
X-MC-Unique: 2px0_rJFNSuvH8ipri1ylQ-1
X-Mimecast-MFC-AGG-ID: 2px0_rJFNSuvH8ipri1ylQ_1763548810
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4779b432aecso21713775e9.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 02:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763548810; x=1764153610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0l9o/pX7rZdgzEzxtL69j/qja5gm9z4d5aM9fQ+O5cc=;
        b=bFgXU8vSey88dMC69sRh1ok7AdXRmRjMQ0kyKm8Ea+yeScTGNAm3ybq/7CkMLJqtYJ
         AL7qfkGv2IxH+Mpsd4LRpXTKOUoj2QMjHzFmXuKAuX1kjf4FOjOhnLVTEB9FKl43v1VU
         mCnZCZeqAdfbPgmJpMNrMHLwee/TI7SXAiXiu1E1mRiqK2iUGar+2NF1J9AWP4jUpjgb
         TxbCB9qPOthL01TnQVJta+H7yDHLjgARA2WU3zFWxmWzzLUeu+7w18L+dqGbm1xw9n9F
         dPaKhB7CgFBhQz5XxBlnq3koqDr0r08OS4q+JiUY9bqRYYhOS5a7V2IJTdC0MOwVN3ho
         xvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763548810; x=1764153610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0l9o/pX7rZdgzEzxtL69j/qja5gm9z4d5aM9fQ+O5cc=;
        b=YNhNIDQ9I5IFgErV5LwrGs8YPFIULfv8iHSa2k8LjlAPe5Kw+AND4lfQsIv6Z64yyh
         cfxSsG+xWVJhbkYZhSIjVju5B411MgyCqKnRwsRp85ANVoYwfGdUselx+8tp+1doH2qV
         YkbYjLPk7gRq2ebc99PNlinvH0Ss5x2Y9Q9mqk1410eNWOqqcatD9uh6zQ8uzAz/xmEI
         5VhxSVFKf5HumEN7YiOZrTi94EKO77Hymryal4D+4/KgDiSDFPgWAqK+r8QWka6D3CBi
         kG9KLqBlc7NhYswuniG2lSkPBplzI08rPwEOcg1nO0Lk8cgwj6MnRuOgeoXDASP0/1rC
         uxHw==
X-Forwarded-Encrypted: i=1; AJvYcCWd7TSR0tKdsT0vdqt5PCMXUzs8VZzkos9n9GsBhdcPlHSBPjjxcxOV6d69eiDBJ8IVZ3AY0HDoPXY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6y92PWIGkjunYBUrEVLGrDMtWjolfF9e3sIxqLonLYCizCTZK
	2Fxyhtm2Mwx70p4GWFaVaDNIP2jDEfGiBrjupOI1e8Ptq4uUFalqYwqkFBRIqTmgNotqqh7KUjy
	DoelkG/da9kbzr3on+dyA+hTVs6TffFEM3cfM9UDjpSgG+K/nu5jIhionh10Xww==
X-Gm-Gg: ASbGncs+VEcvD3M1Lb+ZFlpaLu39VLMB00USK7w6C33ByFxkRJBzt5eBlQTSP+aNy5g
	pFAQmzClHGJHsBUAK9Xfr6X3sVvAYNP6wu38ZHmFrl+1l2aDnYn+FBcGpW42j6aF2d5HMSqk9pI
	uccnP9uBy6B95Azav63Iki4VAAPNUFtUrvmc9qYOqbE0BKIVrL8lF6n404haOLXpGbUv/w5Q2Gq
	Bj9HESjbRlbUa0UyW/UyLO/lUEYtlco8D7IwwQ+9pfjmBkqVb9NZaVfjZ/iA3D6RXgYV2xe4ol+
	tAYoH9sUwaumxw3ttKHpSZbsUmqG8oLY7YqHKimg3Sg6AJWYcnmSaAOo9xRQ0lXZDd3Ql9EMSor
	lpE9li0Sz7HJO
X-Received: by 2002:a05:600c:4585:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-4778fe59a0bmr191362425e9.2.1763548809741;
        Wed, 19 Nov 2025 02:40:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQBsoVLIQABpPzBRMJso90plcaov7SPkZ+FeWQLc/AfXpX8X110BATx3cN1ed3w5TAESS3iw==
X-Received: by 2002:a05:600c:4585:b0:477:54cd:202e with SMTP id 5b1f17b1804b1-4778fe59a0bmr191361945e9.2.1763548809270;
        Wed, 19 Nov 2025 02:40:09 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1035c78sm40679485e9.11.2025.11.19.02.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 02:40:08 -0800 (PST)
Message-ID: <6d4aad6e-ebe0-4c52-a8a4-9ed38ca50774@redhat.com>
Date: Wed, 19 Nov 2025 11:40:06 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 03/14] net: update commnets for
 SKB_GSO_TCP_ECN and SKB_GSO_TCP_ACCECN
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "parav@nvidia.com" <parav@nvidia.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "horms@kernel.org" <horms@kernel.org>,
 "dsahern@kernel.org" <dsahern@kernel.org>,
 "kuniyu@google.com" <kuniyu@google.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dave.taht@gmail.com" <dave.taht@gmail.com>,
 "jhs@mojatatu.com" <jhs@mojatatu.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 "xiyou.wangcong@gmail.com" <xiyou.wangcong@gmail.com>,
 "jiri@resnulli.us" <jiri@resnulli.us>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "donald.hunter@gmail.com" <donald.hunter@gmail.com>,
 "ast@fiberby.net" <ast@fiberby.net>,
 "liuhangbin@gmail.com" <liuhangbin@gmail.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
 <ncardwell@google.com>,
 "Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>,
 "g.white@cablelabs.com" <g.white@cablelabs.com>,
 "ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
 "mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>,
 cheshire <cheshire@apple.com>, "rs.ietf@gmx.at" <rs.ietf@gmx.at>,
 "Jason_Livingood@comcast.com" <Jason_Livingood@comcast.com>,
 Vidhi Goel <vidhi_goel@apple.com>
References: <20251114071345.10769-1-chia-yu.chang@nokia-bell-labs.com>
 <20251114071345.10769-4-chia-yu.chang@nokia-bell-labs.com>
 <d87782d4-567d-4753-8435-fd52cd5b88da@redhat.com>
 <PAXPR07MB79842DF3D2028BB3366F0AF6A3D7A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <PAXPR07MB79842DF3D2028BB3366F0AF6A3D7A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/25 11:24 AM, Chia-Yu Chang (Nokia) wrote:
> I was thinking to totally remove ECN from Rx path, 

??? do you mean you intend to remove the existing virtio_net ECN
support? I guess/hope I misread the above.

Note that removing features from virtio_net is an extreme pain at best,
and more probably simply impossible - see the UFO removal history.

Please clarify, thanks!

Paolo

