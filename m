Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D59333F382
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 14:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762959061; cv=none; b=ZMRKla5dN24KfvIN8HHP/DblC86uoXyAs04EQbKwy6cQnw1+hZmcZglJrK9pqdnyZK+3aH6RkUqzmF4NlRH2in16mbFTflyV11IWZRUAhzoSpDY7ZyrFnEjoO86dHK88D09996wJlVxSVQDRw3FZoQuxaeGLHW0zw6Nj3DOGPyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762959061; c=relaxed/simple;
	bh=zMRRdX2owS8FdV/BiqPTU+IIEcG54+CqIM+8HoD1Ms0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVRye/WGy9xbsY3c3vfb8ieujJWf9fDw8X9XgkwlTuzxQL/Z99/9lcQiYvDfbbrMOby3vIVbBLzwa6wRge5JBhRv7oX1Kx3Gf5M9+DHbDSo8Mgwe3+k54Ji/lsQgnEvDqKHl/S5G97RrhNGLVR2s7RL1U+xk7dWby/UKpkQ1CGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EeireNWg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuJAD5LN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EeireNWg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuJAD5LN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762959058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJ/SnVy0i2WVmKdjO+8lXLUclnaJKnVKKCK+Fx4B9So=;
	b=EeireNWgogRNwrjOkd3FMlT0WjKZ2fmKTtlsRRetqWuPQ2NZwuKC53P/bZaLL6XMysU3gJ
	JOSkPlBJUE8y4j3ab8FjPKKtKC9OoX85mMQajWsdjBtWVnih3rRO1byDx50y53oVd+Cs6c
	C8JqPZSKwAu/IOt4VoBv1oD4xiGObK8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-vlZ98oxvO7mCXjkDfDiIJw-1; Wed, 12 Nov 2025 09:50:56 -0500
X-MC-Unique: vlZ98oxvO7mCXjkDfDiIJw-1
X-Mimecast-MFC-AGG-ID: vlZ98oxvO7mCXjkDfDiIJw_1762959055
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42b352355a1so414900f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 06:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762959054; x=1763563854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ/SnVy0i2WVmKdjO+8lXLUclnaJKnVKKCK+Fx4B9So=;
        b=VuJAD5LNRfTxWTKfLAa7aDsbHtoC/EchRMf+Q/NPebSfR5nnxJWsqZTxN2jGWKgpnm
         ONxKy7Qeb/NPfR//2ycVJjkI2qZEWFdOdiPqwvCm50n4bF3F149AyzI/bMKLawetjqpa
         KknIgVswgVn1Uu7G28tjQ/mXI0QqVRrzFhXk2HKvCdxPVS3+OfBZIb3GkZ0bgD9bicyv
         TgK/QoZvK2WPp6UHYnph8NCyrkEmpp4tgex/1YzhReW1fmFG/ZwcavXQ+kLyYTOaAPj4
         ULqTCdsbnN6OEQ4tOgoteTzRnTcFxJZZYjGc2TW20UHBsZDX/jPDuWvTYrDIzd1F9Ua2
         w6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959054; x=1763563854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJ/SnVy0i2WVmKdjO+8lXLUclnaJKnVKKCK+Fx4B9So=;
        b=teiwCeFafzK/WmKKx+ysqDCsEGMduqCqnJ5trZovk9OJdxRp/sZu0tLQ1aFgJ2+fCp
         vZT2KbhhsZlGznMXwE3vhWAXWXwoz7SBsb5xCJ25sG2Y8EcK+viNFxUkiBoPIottF/4/
         C2f/Y5qQDHfgu4OroXDuXO49qvPm4TwPEVvCusXe0RyzSCNJiY+y//gdj1JOFbtt0brz
         +6h/Uk5EvpABTP3vhTowSggEOKUH8h6+fEm1BRVYqsyiGheIvKkyr6mTi5vubsw0LxF2
         CCsHVdBn0vTqHMTXAFgcNWJ8ve+xGtchbMA6iYFnoA5MxN1e15gq3R705qIuHciQxlLK
         QIrA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Mh6BB/nMfKYasREpZK2c07OWSrEV+9GPdw1Eygn1USjqDAtngkv7zcVh4PwplfOL58EAIPnp/G8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqrwQAim/d2DOymeHCKlz9vUn2IiLKd1yIvYsr2cU5M7XrLjtQ
	FPeMkduwhcrvTdi+B70C8pD+Go2RrN/VzefcfP96/OwqcnzhBVjquNYHBOltQwx5gakO32JTJwZ
	ObE8oLEImz8fTwFwMY3GaXW3Ei/g4fINW5QaGo26jn0pe3KVJ2qx7jd26Mp1mhQ==
X-Gm-Gg: ASbGncsAKLaSMFTuaw4Gjs3//6TraOyxYTuqLKEuPw8kac2u1D6ej15Y/DvvkYUB9QA
	rIlS4AojcnrQ/nkS8/bm9DRX78TELEbpLFvtRbGdUDVnC1aFTJx/1vf3lHn3b8BJy12pAeEi57c
	b7NSY18OYXmB+O8wKx+dmF9K0JbwahOw8HAjgktdRxAB5afuvA4EKSpN3hUwItL2kRYQ0ty0omi
	8dVBbNgJiu3gqVSlJOKk7407fzZGpLqPSOctewpJEWfeffGGHjEkwatLlOT/bZ7rUlnRCB5Jhtm
	VGCc8ITIuZ/dNJFcbEfVtjEYHGhCbt5r13k5LAWhOEAgFSVesFvYMtNBIp1UcNeNuCuf0tXpGov
	N9g==
X-Received: by 2002:a05:6000:2891:b0:42b:2a41:f20 with SMTP id ffacd0b85a97d-42b4ba75470mr3031634f8f.18.1762959054586;
        Wed, 12 Nov 2025 06:50:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERB5IOiGOtuJUGWUEr7UkS6m3ACPJ8/nI92NfUrVDc35tes2Rnj+8LlolGWnYHhDlrIMnvBQ==
X-Received: by 2002:a05:6000:2891:b0:42b:2a41:f20 with SMTP id ffacd0b85a97d-42b4ba75470mr3031587f8f.18.1762959054156;
        Wed, 12 Nov 2025 06:50:54 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33392697f8f.35.2025.11.12.06.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:50:53 -0800 (PST)
Message-ID: <0944325d-158d-45a4-a1d4-d61e645b07ea@redhat.com>
Date: Wed, 12 Nov 2025 15:50:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 05/14] tcp: L4S ECT(1) identifier and
 NEEDS_ACCECN for CC modules
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
Cc: "Olivier Tilmans (Nokia)" <olivier.tilmans@nokia.com>
References: <20251030143435.13003-1-chia-yu.chang@nokia-bell-labs.com>
 <20251030143435.13003-6-chia-yu.chang@nokia-bell-labs.com>
 <bc1ebcd0-c42c-4b59-a37a-13ee214e90a6@redhat.com>
 <PAXPR07MB7984498C0F152D504B2AEC98A3CFA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <PAXPR07MB7984498C0F152D504B2AEC98A3CFA@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/25 12:02 PM, Chia-Yu Chang (Nokia) wrote:
> This bit will be set by congestion control (TCP Prague, which will be submitted after AccECN patch series).
> 
> It is intended to use ECT-1 rather than ECT-0, and we were thinking this flag can be irrespective to AccECN negotiation.
> 
> Shall I put in the Prague patch series?

Yes, please!

/P

