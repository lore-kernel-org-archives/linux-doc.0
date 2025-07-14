Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB61DE892
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752492017; cv=none; b=hm/GgdgMSvwFr+BPQ1ovAsf8kc0P9AmgdnOYUdG/ks0usUG56K2qUbnrPWWFHh56IayP0HJkIJWNe1Hm07ak5IkHJZNR8j2kMlsIK9SzCuo75sE83ajGAkgUxxyGwc8UM8pdZfs1NU/IfzEDL5KThLnA0/40TeuK8gLo4Ucnkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752492017; c=relaxed/simple;
	bh=U+ABV2Z/K8FhS1tVsDtWSNLoxl2AP1Zy78uF8iTobqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h5e0EGXwMfjwUT53yKbM2EIz2NnlNyO7jKwftEIjzQiSq8esDmGR/g5mfmfePQW0La/iIySGnLXxzPs/R5FBbeSDl+QU6K6telUwvUTyosEhD36qqZGqppJ02c12ZYwKKQp0QielPf1vXtitG0+3bRDV/a9Z/00GYxW6sJ6t+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TCo43i71; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TCo43i71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752492013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Y2GjFqzQOcWBUPguZ9USD97IUATEowPrFd5x574Jlc=;
	b=TCo43i71mxbIFTPT/vwzSGnUEtXb3Hjb3IMFYn40LP3/UAwGr6K87DzTxp0oOAmFl9kFk1
	NlwV8UxpB5h5APA2ZXySSL3XxSEfiF4IoWX1qbRRA84gXQDCY5A8KeQ+rTy6U4ejmhwrho
	le56Hs2AM2PXctT+f8WTI+lT0ZV3AJI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-37GUHGmvOcaAVo8BOF9izQ-1; Mon, 14 Jul 2025 07:20:12 -0400
X-MC-Unique: 37GUHGmvOcaAVo8BOF9izQ-1
X-Mimecast-MFC-AGG-ID: 37GUHGmvOcaAVo8BOF9izQ_1752492011
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5780e8137so2792445f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 04:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752492011; x=1753096811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y2GjFqzQOcWBUPguZ9USD97IUATEowPrFd5x574Jlc=;
        b=KA9I6FIUdM1jxDhGNbrEp4fLfb5CdbnVajnkwTPHAgH6UDgeUwBUvgm9iIpuCgHDkX
         xCjbCjYooI1U4eNaXGFzHbxxfspA9ALXNRk819EZEcZkp+4HcC2tGT2t+G4KHZvK/B0I
         8ERrQvCnCFobJGYuc5umAofshBMM9l232EcW1Wceis8+jhr93qubXuNcPrI7fHuLhtH7
         vi7g+rWWOjptHpmC3y+cRxcedR9n3q+lBXF1Juv/iwfapOOtqJ3XJoUZ6I+FO7GBSwcl
         3FJnITW4hTykH+DgKzLknxC+F3fHFs8bU9TLdraEKeyU4MAE16lQsDb2G3cORjdAszqt
         Bwtg==
X-Forwarded-Encrypted: i=1; AJvYcCUe3DiUWTunSUCl+NuBf0Ow3hIfBhRYQioYrRbFsKZX7YA8AKwaZHl5kMRoCkM5kqiBIfo61nloQTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+zPXb12Pmo6bQAsJBmY02Mf4vWekSrM0USKEPB5NFjhiOUN6
	gAShRDbDwD5aPkKlMlmY0X0sM3fIyh7/LqnDp2urqbgc4BpThjFS4jJFwoUUMsREb7EME8QKx6H
	dV6OXQ4cfiLoea7pP9j/NQUKRFrXpPgjvDDkrdhXfks0rmn8nFQwp2Fjk5wjo6Hk3+Y7RRw==
X-Gm-Gg: ASbGncvCg+vl1oH0Wr4760Ixtb73eem765JJtJrmtk5pSja4uHtNjTv8XS9cNcrp7Uf
	7lclEJi2JyCOlENkcarTzoDqyhirA2+GtcsFa0XSAfLbWPEMdSSyZcVBYL81b0GpQRhDRRDxbVw
	qjU7qBE91yUUAK4YCTilsCOZImYy0c2w3Tu4wtoo8Wq90OlEYF7Wuw8rAjSv3y5SoBY/LxyLYoW
	6GSnRllCqU/04pCWGgAa6vVDhiJigDnbn00uClgQBSwnA9JSyC+9Szgv6nt7Sd7zd0RNLRTJXJK
	0MEgCcTKlUjulTEb8mW7P3UuK7VgsXEcezdAt54xB5w=
X-Received: by 2002:a05:6000:240e:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3b5e7f13a0amr13230110f8f.12.1752492010726;
        Mon, 14 Jul 2025 04:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY5XrOya3yhJllGztjovrFQKpCxb10L3EkWzmPKdKNg7g1cHqucJ9l4yQULMvIkstPwMqvTQ==
X-Received: by 2002:a05:6000:240e:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3b5e7f13a0amr13230053f8f.12.1752492010098;
        Mon, 14 Jul 2025 04:20:10 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.155.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc201asm11984844f8f.22.2025.07.14.04.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 04:20:09 -0700 (PDT)
Message-ID: <b8f0ae48-b059-4137-9b74-f69c122f98f9@redhat.com>
Date: Mon, 14 Jul 2025 13:20:06 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 net-next 04/15] tcp: ecn functions in separated
 include file
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
 <20250704085345.46530-5-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704085345.46530-5-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/25 10:53 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> The following patches will modify ECN helpers and add AccECN herlpers,
> and this patch moves the existing ones into a separated include file.
> 
> No functional changes.
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

