Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D355FBE6F
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728552013; cv=none; b=PQgbK4CvygCevBeayFVVtiFjOw5rCqYY0rtPbsTOsKvaIpOFAB2HyNlEBnvVt3oNL9c7d63fPqMW/E9ijpQoD6IU1kqZ6vk+EHzh3t8ydu9c3OrIzlK8bGVXK3GBfi/lI4tz8AKKoLr+1JlWOgfJwrV8fnwCtHsAh1tEfCHaoi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728552013; c=relaxed/simple;
	bh=gt2Q8i+/uL6SnPG+SqIIUvv4iq2wBJWCilwcTB+uC2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOONr+zbr0o6lSUisigajQNj0lg46TbzIJ6zZ3YSYKsq5YFT4DatRzKsXNxTZiQ6msyNKt4Frxj5oiw8DFYb7xTh5L0daoychFgAOZusf4AWIjZEaCvSmmuUxIWEQ9CbWP76m/t+VhxFx0976mXk82mduIDHTrETcfRbefETLDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qfq5Z4ss; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qfq5Z4ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728552010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c2EUHF55AVEM97e3j7jFpqy1lpH47XxEwMg8191duf8=;
	b=Qfq5Z4ss8SNfviHOBNkFQtqEnyK+uJqhTYUb8xcBOX8D579AFSS/1KSfxXlFxZX59JsuPD
	pIxDidy+gJRAQ0BibHr67O3cGVngYKSkwsYBFOVEM2EO7E8Ozl6Uq776vbCLHZFfOGzl+S
	l3b35MCco3Cw2JPHeI8NJ2uIytR5+rg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-PIs_Fvg2P0aR19CVWG5siQ-1; Thu, 10 Oct 2024 05:20:09 -0400
X-MC-Unique: PIs_Fvg2P0aR19CVWG5siQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d432f9f5eso376546f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 02:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728552008; x=1729156808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2EUHF55AVEM97e3j7jFpqy1lpH47XxEwMg8191duf8=;
        b=ebPWsZDfT7au/tpVgnCZqUQmzHwwg76fAewt23ng5qIE19ISComUurqcx5ofdNx1YW
         0LyQrDXazdmjpRj3jGPzzmG79XvO977IB6oWh72tmT0nlWymbOjHtmi22YOKMR44SgNF
         Bw1uUqKmVnsXPYoaITjYnkFa5LN42rP4CZtJ67erDe1lhDwJrcCEV5NWO/HMvGT05WZS
         cn409+/cXrSGq8HJWPTA2wfDsIw30V48zMpRma14Tpd92unqk9N+lkmY0HxYITsmfe9E
         gMwKDaqQ7I8/Vk39ZBJWrgvQcPJaLLzYJGFZSL744yywQZ+axjXHOymYJC0IqeeacBBb
         g+8g==
X-Forwarded-Encrypted: i=1; AJvYcCW0gPhy9Zg9xXAuOziJjmrFsnVhyzzpzOXnIk9ix/6PV5UCWY7nrxE6zwZO3mn06uL8RoSHaaigClM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg570GBkpWrOXBE8dS5b/FupMLLmCSFo1csUDARUe2dZ45+qFf
	6mA/FnN4PxhvPKJVisfZaBrxOjwCzTFbbLq8+vCTB3S5N4xggZSCsGU7Ng936R0SewuFpm0Ym8Z
	KadPcBzhUpDUdKHiccQ/oCMj3jY2k7AiME9AtwCg6MXzPvD0tpx2mjkAxhA==
X-Received: by 2002:a5d:6908:0:b0:374:b71f:72c9 with SMTP id ffacd0b85a97d-37d47e9d085mr2387114f8f.16.1728552008563;
        Thu, 10 Oct 2024 02:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdzmtcngiF6R3pU93/9HaNeh0a1Th7Q3WQBAnseARGFC78C7arTlWMQzmNNCWluBuGpiZQJg==
X-Received: by 2002:a5d:6908:0:b0:374:b71f:72c9 with SMTP id ffacd0b85a97d-37d47e9d085mr2387085f8f.16.1728552008187;
        Thu, 10 Oct 2024 02:20:08 -0700 (PDT)
Received: from [192.168.88.248] (146-241-27-157.dyn.eolo.it. [146.241.27.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa3bsm974757f8f.78.2024.10.10.02.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 02:20:07 -0700 (PDT)
Message-ID: <822f5875-5ec0-46e1-83f8-66ec1e31f0f2@redhat.com>
Date: Thu, 10 Oct 2024 11:20:05 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: Implement fault injection forcing skb
 reallocation
To: Breno Leitao <leitao@debian.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-team@meta.com, kuniyu@amazon.com, asml.silence@gmail.com,
 Willem de Bruijn <willemb@google.com>, Mina Almasry
 <almasrymina@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>
References: <20241008111358.1691157-1-leitao@debian.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241008111358.1691157-1-leitao@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/24 13:13, Breno Leitao wrote:
> +void skb_might_realloc(struct sk_buff *skb)
> +{
> +	struct net_device *net = skb->dev;
> +
> +	if (skb_realloc.filtered &&
> +	    strncmp(net->name, skb_realloc.devname, IFNAMSIZ))
> +		/* device name filter set, but names do not match */
> +		return;
> +
> +	if (!should_fail(&skb_realloc.attr, 1))
> +		return;

if you wraps the above 2 statement in an helper() taking an skb 
argument, you could wrap it with the ALLOW_ERROR_INJECTION() macro, for 
added flexibility, i.e. look at the existing should_failslab().

Cheers,

Paolo

