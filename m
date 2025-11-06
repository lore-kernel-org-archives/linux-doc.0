Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA6930FF34
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429346; cv=none; b=mFOpuKCmLKCQd1LS2Hz5xxDWFRNY6it2E85MGjOyhddk4N5OJUdGG0HxF+TDf9B0hRY1pME3AFshk25byZzAAKqesyV9ODtx0zvZ6rSjkZrT43Ol3Cl0/dM0OKRYHTjxbQDICQrMP4mD75MsYvqZyHhTVT+fyyP8876/s5795lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429346; c=relaxed/simple;
	bh=skC26cRzfhs694yk1GvmPhOCKjrsCkj5WGjm2V3nag0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bao8Aci2U4yGUhwvWspIWGNWPx4UxMI2EwgPxvrQ3b5I15rcsqpm21bVuCGdrSi8ljX10P7rHG7UW9sLtvnSmfPHZ/RJYxFh/3BxMEjz1uAvYYQKIZetgT5iYS6DZw0PmmlNhcXBAT+UYUGpX2UkECx9cg4Dn1DkEFRidc4Mbns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YdEyq71R; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lnvYLxbr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YdEyq71R";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lnvYLxbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762429340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2yI4sLrgM9n4bdj8hOJQf5//skDa3nIIok/oPWCQb8k=;
	b=YdEyq71RCqFAJgz6OBuuP0L5rIylrDW2XGpa3TRB8cM2kg2ZJ16bcBrK4INvzCGmaDRpln
	8NmXaQOf3uBxYgVR9JX5jVeBeqP84tr5dapc66jDyL8We145yR2bioCKhQ5ZSIahoZLoMr
	H78m8atfbyXFd/FhuR0u5QWpSzuK1ZU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-BiirqlvDMVaNwojQjKsmEw-1; Thu, 06 Nov 2025 06:42:19 -0500
X-MC-Unique: BiirqlvDMVaNwojQjKsmEw-1
X-Mimecast-MFC-AGG-ID: BiirqlvDMVaNwojQjKsmEw_1762429338
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b70b2a89c22so160660266b.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762429338; x=1763034138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2yI4sLrgM9n4bdj8hOJQf5//skDa3nIIok/oPWCQb8k=;
        b=lnvYLxbry/U9OU0LBYf5XlgU6ioCAzO2geBEsRSwpVkyfcxFo7PB8igo5pBex/t5Nr
         mQS76EBVyKHa8HMEf/zrL6c2Xm3dSs/KDGQq6F7gPC9gGvYCeeKrZmWb1flnQLlJVCgg
         zNgxJ1f6ZccUjKsUp9lZBqeYMLuy0szITyR5laghUJdL9Xriz2uMUE8/Tk/mz+20mwFV
         OL/zZ5csXkRH8Fz1N+n4qz3pnbBiRq0CtcOjOM4Ni5nhQbirr1gY3c4qUGWWobimbozM
         lz+vaURRuW6IbKx4uzcsglhScB2ybHUKjqSsIboOMCtl/5HchlUHgN5H4I9LtFYxviRV
         YK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762429338; x=1763034138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yI4sLrgM9n4bdj8hOJQf5//skDa3nIIok/oPWCQb8k=;
        b=YtXl3Xu5c1GSenMqNs7lWSmZXQmg1QKEd4n6Pf4+WYzvUuEbogcVHXXIK8YTfYcPkb
         aL4W9cGFcqXS4TOFzqRt/yySrKE0N3fjOPgyXUg4jGkullwcmWfRk3Y4VJnQlfFN7osx
         NbwUMLlIRGvovirTZX/l4mgxDJ3qQAbxNeCmAFAR9XRlJ9ZnnD658Fz1LDtZuv1chwwy
         UtnKqKMRXddbE8KIcCfAHSEEIYBeGtyJVTWJwHvmw0Od6UKqfXrPySHway5fU5QCe7pV
         p/tz1kZCnXLoeyUTuOMDWsXqjUZqMtsgyCHFNaY+cT82SVcCpbuPzeWR8VIBdX0VBnle
         ibVA==
X-Forwarded-Encrypted: i=1; AJvYcCWC3CDdoM5u8nBJ+0sag93gwiB/iILj1YXPjGoBOkrRh0xbs9IemPE1jcuW74J99HIvE7r7jtB+dUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTm3sPu1+/iMLHr6kRH02lgz4v/Lj5Sdh+SbpZtn88Z3cq+Jle
	l0qhOq9BZ6RA2GXlIGfbWEimZMVg0zKiur05wFYYSndt3r2QcanhdMg19a8+hvFK66oUrwMSyfp
	PEqP1Lz4do6O03TLUz+s8QU8C+AoP20bC/LIDC4VGytHczypRiIn8S/52dSJpVA==
X-Gm-Gg: ASbGncst9sUP9v1jjL9StvUGritVgraOyuBxw+G6QtxyPrjgeHmGQwsd65zCPDqc8zs
	MCqXYCvJHYDrrJpTydZLQLDVXcpBQmocY370A/ViIKh5nVM0hdmYdR7kIex7EbVvpQr0C/lOsz/
	ygjY81h651+ox9igvr3keWiMvr2hf/JXptKf6nwLdZ3BsuqWiv9VTLz+/FiliL/uhmwTW2p71AS
	RHIofKJndI1xF1vbqpqDeDTlHg7T7j1gOeWDeRbJM62toG6LV4Z9yzFvj1QlUfhuXI59hSg5CWo
	2qyVomgSUD0umxCrjjSYu/iMOF1DZx2WJifylJwuuO/22s8RR60wQK3iigKPi6mAuGlNxFn26tP
	Wyg==
X-Received: by 2002:a17:906:f591:b0:b70:c6ee:8956 with SMTP id a640c23a62f3a-b72893d8e8fmr339800466b.12.1762429337652;
        Thu, 06 Nov 2025 03:42:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOB8p8VKAkDWd7Zb5ZOoLgXt76WYCHhozdvWiOM8SoWc4iM6IK84Od+ej6rTPGojaDwrxUhw==
X-Received: by 2002:a17:906:f591:b0:b70:c6ee:8956 with SMTP id a640c23a62f3a-b72893d8e8fmr339798666b.12.1762429337263;
        Thu, 06 Nov 2025 03:42:17 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289645397sm194955666b.41.2025.11.06.03.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 03:42:16 -0800 (PST)
Message-ID: <aeaa5b5f-8697-4431-82b1-c890d67ebd41@redhat.com>
Date: Thu, 6 Nov 2025 12:42:14 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 06/14] tcp: disable RFC3168 fallback
 identifier for CC modules
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
References: <20251030143435.13003-1-chia-yu.chang@nokia-bell-labs.com>
 <20251030143435.13003-7-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251030143435.13003-7-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/30/25 3:34 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> When AccECN is not successfully negociated for a TCP flow, it defaults
> fallback to classic ECN (RFC3168). However, L4S service will fallback
> to non-ECN.
> 
> This patch enables congestion control module to control whether it
> should not fallback to classic ECN after unsuccessful AccECN negotiation.
> A new CA module flag (TCP_CONG_NO_FALLBACK_RFC3168) identifies this
> behavior expected by the CA.
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

