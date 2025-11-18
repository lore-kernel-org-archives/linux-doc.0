Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53702221277
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 12:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469027; cv=none; b=DZpw/XvXbUlQ2L/1eVGBIZT0I5gSxw+9VD/RFFUxJbJjWV6HcHjT2vrIJr9IjVXJDZQMue8h6FcIt0IZHH5b1YQd9BVkKVIKko7iZUaN8DHx++MtErNkJgEgYgASVYr+B7slwwFhGnB5kGvenVoM4FDIYz6hFtx8r4j2/R0QYbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469027; c=relaxed/simple;
	bh=8B9ouElv+xeFaTKAh9MT9KBQGuCsWdhQ9skK5QulCOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ND9fyBnp2VNieXb716qmB8QOfT8acPIuCTteJlyKqXOke8L6uqJA72qkhJICAGbc+Whje/ATFJ6iULvvLbPqSAoBZ2vMsn7ryZuOSu304xdP8G4Zn1FFsNBXRmICZzjoqwl6S7ivpVf1y8Y52KGfoeVU0lf5osnQ7N+9/7sqe7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O83kRwuv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ib+GeaHr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O83kRwuv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ib+GeaHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763469024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m1y6PrlUAcuxkkEloRxo0vMvd5pujl1anuTqxEZ8o/Q=;
	b=O83kRwuvD5AKFvQbFu6mrpO9JcXSk/KF+Xooa27/DRka+F8uuo/EEMh6SfG2wgaRcXlfry
	DnpsEUkCjNiA/JwkIgf2SLruFZagfTWR69uUe3Y44BqT195CnNuzkUfl3SQT2OjKd0J0hT
	fizHXj0aec845wY6SgcWNuEH+rnenQ0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-x9h_rhUCNrirMSuoTyFGDg-1; Tue, 18 Nov 2025 07:30:22 -0500
X-MC-Unique: x9h_rhUCNrirMSuoTyFGDg-1
X-Mimecast-MFC-AGG-ID: x9h_rhUCNrirMSuoTyFGDg_1763469022
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477563e531cso45668975e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 04:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763469021; x=1764073821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m1y6PrlUAcuxkkEloRxo0vMvd5pujl1anuTqxEZ8o/Q=;
        b=ib+GeaHrpuu/avH9sUKzdMZIMuxV5MZqO5tDHbpN9aEOCFtPnmRi7sRZFCHcwhMshZ
         bhVdMgo2Z/C/8gNeQlA0vgLAfmwiEEGpd/g6Bq62EMLN1lRswsPVN+zLcrscKMW2Gdsk
         KYFv4V9Wp7weLllmBsnsnaTAvvH8a46HCyWDrPJzKUEf7kJiW6n34urmlZ1QU2BLF837
         wsOlAVG0mBJHydb7XzU38+hadvYD6sl1m7A6S+D41YSzlyu2vh1VBh8M3ZEjrLjLbwvH
         y8YhzUVSiwQ4+TThCmSBe8pn96Dpe0WnLL98wps+V9LWFDfkT61UmdX+txmP8p7L0Pld
         GIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763469021; x=1764073821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1y6PrlUAcuxkkEloRxo0vMvd5pujl1anuTqxEZ8o/Q=;
        b=Kx5xQFjShq0ISJhfrtClXA7HEi+5u4mSaD/j3su6PeJiknfVnti++KXUouPcTufXAp
         5rjfSmp5fufaRyNYth94rIlKzlXJEiRURJQaTpssLCi9Y1a1HXqta8UGEL709Ld2oVXz
         XvRoC7F10V2IdiWdp+/w10sSg/Z6kiNWU9QhKrcuGdJgLEnbzBBpXgIMJXgr7F2dFcPu
         MniJI2T8jGHZasLU6/0QeQQSfCvQi+iaK2QQzlbQ+6qNHn9Wf8qo5ei1U7C5d9O1swoz
         gH0dM31NY45zTQ4cnCRTcW7j3fcUsDGC3NqfXCK2aYZyYIhaVC9kCswfsfchaatk+T9V
         gefw==
X-Forwarded-Encrypted: i=1; AJvYcCXEkiXlE7Vmx1RAbfhmU6IEwgx3l6u3AJZeHHOIJFCHFPzOa2+i5Y2XME8z/X8k5ZYNRUS+tgzqUXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz33QfqVwx6cFMtnOPepEZKE+ur5vaA4GoySMLMs2fdjFxauaoW
	jJzfn0VETt7Y9OFWKltHixt4Zk6DVBMF+oMdLYVHHnkLDFPMmSdSAYSQR16oihu+JQPrOpaq8Ad
	v/xbtaHq4k/v+cxjHBue6sWjTM9fCuDsnIEUCJh6qds8SwwA898pwkCpmLtGD5w==
X-Gm-Gg: ASbGncvkhv2MPnLoKl2dkEkl+m/M5dwnwV7STww8mOMkLuUGpZfHoxGFBL2hzN8Usdi
	r/KoBHe1xed3SJOCZkNjc0Mla45vkwEhAVzjVnEZ5YeTuyczY6Owx6PMkwnijLmxTSyS3gmx//o
	wwv+KiNsgbIxjbEuzFFReIXYARF466lHMimqtCbfiaSGYkFVVI0uHmnE4WbpDLWYixz47YS1Ji7
	Hg961tSHB9iyWiwN5YusEoA4NT1ZKQJczb0ZF9B1Xa0l6BmmJgrBAjmZ4/8K9VhXG1TKgJiA0GF
	LZkTgDIQGh2uQDrUzz8hUs798bLx71JazFucKsHM61ND7YKJuATDLCPVL3s8gA+OJn1dvI2aHUY
	Aye5Fjb3RTI+U
X-Received: by 2002:a05:600c:4513:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-4778fe5c820mr175963395e9.10.1763469021619;
        Tue, 18 Nov 2025 04:30:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOZAD7E1uZGLJ36i/AdVTCJbTikjjEi/nzH5t0pOPTGX1/txTaGcM5dmDEUHhqBH4ogD1aHQ==
X-Received: by 2002:a05:600c:4513:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-4778fe5c820mr175962585e9.10.1763469021119;
        Tue, 18 Nov 2025 04:30:21 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dcd891sm15757525e9.7.2025.11.18.04.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:30:20 -0800 (PST)
Message-ID: <715746f8-d1f0-485a-ab83-2f768722698f@redhat.com>
Date: Tue, 18 Nov 2025 13:30:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 05/14] tcp: ECT_1_NEGOTIATION and NEEDS_ACCECN
 identifiers
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
Cc: Olivier Tilmans <olivier.tilmans@nokia.com>
References: <20251114071345.10769-1-chia-yu.chang@nokia-bell-labs.com>
 <20251114071345.10769-6-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251114071345.10769-6-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/14/25 8:13 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Two CA module flags are added in this patch related to AccECN negotiation.
> First, a new CA module flag (TCP_CONG_NEEDS_ACCECN) defines that the CA
> expects to negotiate AccECN functionality using the ECE, CWR and AE flags
> in the TCP header.
> 
> Second, during ECN negotiation, ECT(0) in the IP header is used. This patch
> enables CA to control whether ECT(0) or ECT(1) should be used on a per-segment
> basis. A new flag (TCP_CONG_ECT_1_NEGOTIATION) defines the expected ECT value
> in the IP header by the CA when not-yet initialized for the connection.
> 
> The detailed AccECN negotiaotn during the 3WHS can be found in the AccECN spec:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
> 
> Co-developed-by: Olivier Tilmans <olivier.tilmans@nokia.com>
> Signed-off-by: Olivier Tilmans <olivier.tilmans@nokia.com>
> Signed-off-by: Ilpo Järvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

