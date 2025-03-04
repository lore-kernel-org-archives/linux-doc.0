Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF982066EF
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741098238; cv=none; b=pLxsI0eD373q/sWSWB+dIlJ5CHNEUAQQ0HY5PdEei7KWmQJ7UQbyXTA9mgibceUg10//nTynBgINtcZS0+/YFpeGIOF3XgBIKIOYFnN/jc22963A4aqfuRAW24CW8Sgciqq4y4CUsrMVwpDYPZwqzAN4pmIrfCiIOAvCzs57M88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741098238; c=relaxed/simple;
	bh=YToWRXI3ojp5Qpx1iSipk79vN6Czw/zLodfp8xVJwD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nm92hspqssL6xoqU4o1VkBkFTv1V6MmMqx746Rr3EDtZqY6g5iLHKCPH1zSvyFYfcaOJJXEQYtTmRgywdROf2+Yw6PdOrT7b67FDHfOFxhUBC5iTtvq4ToEW1ozcBDgBfIP9X2l2n1Eil+FvuT6cgeS7orelJ6Hfz1wjhiL5m64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YaremDqS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YaremDqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741098236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7Jl6RqLE4ySPh0n2/0y55XdmikJ9fMRlsEGtfokKwE=;
	b=YaremDqSP+N9Wl1S4+ndYVYhhdtys1MLavK4Nyii017faBf/Oy09SeFfLiWAKQgD94yVXP
	+B/2XRN8shxK1K5HeqwLQXUIILZsuh2uQPHuTHcthZbRD3k6iMbvT9lTvShNRGggj0p/O7
	2ciXS3M6kVCOusOyctX6+XXG8kkUBEM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-J9lyT0kYP2KPhkUJIHiwFA-1; Tue, 04 Mar 2025 09:23:45 -0500
X-MC-Unique: J9lyT0kYP2KPhkUJIHiwFA-1
X-Mimecast-MFC-AGG-ID: J9lyT0kYP2KPhkUJIHiwFA_1741098224
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4399d2a1331so28211575e9.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 06:23:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741098224; x=1741703024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7Jl6RqLE4ySPh0n2/0y55XdmikJ9fMRlsEGtfokKwE=;
        b=mHf1/qCUN0B0TdwtJGUFC82eIyxuAx+/BofadzOL+gJOblbPZxdxXNVr1Fmvu3Hf9P
         6ZkNuapIhoo48dRlB3FC7XcwifDSMONXLEwDGge8TRXeGFmL3HFoUBCuHcgOw0VOPb+0
         hNgiMt8uA4Ts9Tu6aPmOZA3YrNUmyOOhjG5YWdS+wB5/u1bDcgswGDA448uwCiNN8W6W
         rFQSfdLzdQkP1AwPKw++po/xqVuFFatgPY5XkO4IOwkaZ/bp4R7kjJpxULdWk8ajjJ6e
         g4TmOq8FIPCkKwxvNHHgy5+VLAt3ZyW26I0I8GwITwoUXjdzYMHtuI0LPP7KcJoO95tR
         lolw==
X-Forwarded-Encrypted: i=1; AJvYcCVCo781uk0PATVQ0L7c303bH4TAbloBqeYCieqUX3uIsTkGe6mwFbIyFJC/dScF5PgJLkfxDEAwlzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeF6yfkk+6V5vkNkIz6g4xRKbJpJvzTxlZVwTdDHjIf75ZkwMm
	58ESoxn/laF9yE4rYr6JO58OjwgIuR1RuD/wLLEYetKBDyMT9IeVoOZ3EsBF3rqUUtM6zkPXOeA
	WZJBAegQ1oemlNBT2mzGJ74gGUFhiiqkDMsxbbYY7pPKCdQKl24i0aR+QHw==
X-Gm-Gg: ASbGncvBlBdRTZuwxLYlNrXmhFg6CGceKh3GK9/HlUHyMjh32jWYQ9FTURHPmDvpCMb
	cmMxO5NYorbZu6fGYFP22efHvCaTF2NIrUsCd1aPPSi4HOmTsL8l5iMEaIgcUKK8545JlGhVXF5
	sXv+Pi+CL00kD2M0bMARGxfmE4asUZVDe1Z838YDq1QXLyCxstEYbgSu8PeDTbZR2iPMa4xfUms
	Cc9iJbppO/Wx152O0Y7tSRC8XLUqpqUFkI2VIvdb29gLtPXwUSUMlXxDU2M4RYxOcfvxiUUBXll
	/GRdZYv6FqI2NMxO/Pdr891rVSrOpzGUyh4b8nB/txMjMA==
X-Received: by 2002:a05:600c:4793:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-43bcae04e19mr29901265e9.1.1741098223614;
        Tue, 04 Mar 2025 06:23:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF52Rx16VjlDS72aosnmdGbcCI7vGQKO/XsIiTckVodJ9P2N/4wxflyj/DJe6Sib08YfVkUAQ==
X-Received: by 2002:a05:600c:4793:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-43bcae04e19mr29900945e9.1.1741098223266;
        Tue, 04 Mar 2025 06:23:43 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f75ebsm199915175e9.3.2025.03.04.06.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 06:23:42 -0800 (PST)
Message-ID: <278118b1-eae8-401a-8501-e0a777852fcf@redhat.com>
Date: Tue, 4 Mar 2025 15:23:40 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/7] netconsole: add task name to extra data
 fields
To: Breno Leitao <leitao@debian.org>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
References: <20250221-netcons_current-v1-0-21c86ae8fc0d@debian.org>
 <20250221-netcons_current-v1-5-21c86ae8fc0d@debian.org>
 <20250225101910.GM1615191@kernel.org>
 <20250225-doberman-of-scientific-champagne-640c69@leitao>
 <d0e43d0a-621d-46ee-8cb7-1e5c41e76b8c@redhat.com>
 <20250225-bright-jasmine-butterfly-aa1bb0@leitao>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250225-bright-jasmine-butterfly-aa1bb0@leitao>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/25 2:11 PM, Breno Leitao wrote:
> Ack. I will remove the check then, and check if the UDP stack has been
> initialized before calling netpoll helpers.
> 
> What is the best way to make sure taht the UDP stack has been
> initialized?

[brosers!] Sorry for the latency. My statement was intended as a
negative example: "adding such check would be as misleading as checking
if the UDP stack has been before calling netpoll helpers". The UDP stack
is always initialized when called from netpoll, due to the relevant
"init" order.

/P

