Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01202D543D
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753362667; cv=none; b=GMvqH7WRzFJD5UpkUflcQfFPjAZKQpT4qFBNMPgGgojudzQMKxRj8hHWxx5brblrZTWpgz91QcWMTLGjXGjhrqJGlfCY9TXF1fi7eDFZRIk4e0zZgeRF23AZUqZuuztwcgcXQ6t5OAruI50494+Si8W8KXmZrjLt/vqmJBxrKn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753362667; c=relaxed/simple;
	bh=keOlY8IaAAP4UK7nEyK2eSAQe1k4TUyTEO0v5TsdGIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uNnfBKpFOY7TRi1N3E8syxoiLkeGd56jeq+nH0rfJZfLQ900Nw6OMh4EJJeTOgrLxTRAIxMaQ7ixtgc5swq7LHpOu0wneWxiVOowr90qMhLkGDVgkn8EAu09kygG6W22jwslv9sbb07Ly0+GxXlANhlSJptaJ/Flr7HKH8oLKwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BB61TH7B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BB61TH7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753362664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzMToL0msrSZ/KKMxmuznJBdXGU3S4ZL56R4KdRa7go=;
	b=BB61TH7BPG1btsSu7D7dR3xBvBvLYcCcE/21W8XHYGHowQsP6fZS76T5cDEfNuIUreic+2
	L9STSFrUeWtdrvWE7FyEzLvSGZYk1KzXNS2+iidFQXlxxYGILRY5gX2oo480mydDDrv4B3
	e+fLceLxuc2atV+DaLHPxImnL70AGlQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-60yw0HH-PDuy8bkAZ6vO5g-1; Thu, 24 Jul 2025 09:11:03 -0400
X-MC-Unique: 60yw0HH-PDuy8bkAZ6vO5g-1
X-Mimecast-MFC-AGG-ID: 60yw0HH-PDuy8bkAZ6vO5g_1753362662
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso669558f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 06:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753362662; x=1753967462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzMToL0msrSZ/KKMxmuznJBdXGU3S4ZL56R4KdRa7go=;
        b=geS3j8mTFfG4FNyk92JEteKUcZFIjJFnJQ4fHdoaLjg64DjIUodoYUWbwaChmXVgNC
         gARKO8pga7dI9n7Gu2v0XtKRVjMgBNRpykIkzXLLoRiPRJ95TqekjvDzeaoLesey4EXr
         Jp4ITkNCLVVrfJZ0iwmhNcbZR0Sk97Juv/d4GjFi3UFZhjd7X8WviHtHFOGonVkzlMcV
         4J0N+Wik326hjnIFH2KMqQlZi5ZVkCZpimzraZmeEOyuMoaLMfCWPb+MzIvnAuvCigxX
         pF7wtJGquyGcKHHGUWY7tkzCbXPwNZqKEVWEMGlsdokQ44A8f2TkliokDNSa7yp1rhpE
         lb+A==
X-Forwarded-Encrypted: i=1; AJvYcCUcvmSpdnlw0KH2r7IfPWEau7ZIe9m4aRQ+rcGH0/M/AbRMW80kdI31veKD1ccrCDCOayEUToPeJ7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2fQ6F4TvkgPunLLr+kCmviJ5CP/HIO6mM+C8ezNoYmrGgtt2J
	g+fD6hCYDcCU5uk9tKktA+70Xv4agMqaCXMKx59Hy3O+r8G+1HtbdBW9iF532wFD05Yt3PnNc79
	K87GWz6f09Kf6BvFB6DjzUte/6So1bRcwgs53zlGbBU5yV9JvjzuGA3d/5PvQIQ==
X-Gm-Gg: ASbGnctB+v+MwcjarBZ2E2ZiXL7leLd9/KjkzuKg4TJuYZ5P4NZppwKYU2kca56JduE
	O3E9kfBwtSN693IL+s8OiUWezifokxSqlDqkfg6q1Qnwa5WwQ3HS5Rim0O6N2Dz38pWeHJd/STV
	zR1JmlzcV/c1szgIIFXME7lmnTBBSUwSvhKebMsPNY5bMRPmGLwywBDF4R0qi4+Cd1/ar9mbLHD
	FkfiUI4IitjA8PCIVV2ccD03FheuJKm5E4kRUPtmaOFmwxLAIJHiySDShJtZX3iqfXsYJ0wLRMP
	/7zlbWj/XJqQcAq2Uv4Z18eeKygZTk01XeFk6Q/CTxL9ngLMXpMsHNdoq0VkuRu0fq3YSTzH2DR
	LHKhV6GFA5YU=
X-Received: by 2002:a05:6000:40db:b0:3a6:d2ae:1503 with SMTP id ffacd0b85a97d-3b768ef6f18mr6952686f8f.34.1753362662170;
        Thu, 24 Jul 2025 06:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9uXjjqVyQTr1AvkZtxeDHHOZSkmpUhu0Uhy7GWwFd3tbgN6rpLR2iWPHM6a6vJBIw8pnGSQ==
X-Received: by 2002:a05:6000:40db:b0:3a6:d2ae:1503 with SMTP id ffacd0b85a97d-3b768ef6f18mr6952627f8f.34.1753362661709;
        Thu, 24 Jul 2025 06:11:01 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcc3ccasm2177679f8f.80.2025.07.24.06.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 06:11:01 -0700 (PDT)
Message-ID: <e79b4382-9421-498d-8b8c-6157ff070a34@redhat.com>
Date: Thu, 24 Jul 2025 15:10:58 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 net-next 00/14] AccECN protocol patch series
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
References: <20250722095931.24510-1-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250722095931.24510-1-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/22/25 11:59 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Please find the v14 AccECN protocol patch series, which covers the core
> functionality of Accurate ECN, AccECN negotiation, AccECN TCP options,
> and AccECN failure handling. The Accurate ECN draft can be found in
> https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-28
> 
> This patch series is part of the full AccECN patch series, which is available at
> https://github.com/L4STeam/linux-net-next/commits/upstream_l4steam/

I don't have any additional comments, but let's wait for Eric's review.

Also we are very far in the development cycle, likely this will have to
be postponed to the next cycle.

Thanks,

Paolo

