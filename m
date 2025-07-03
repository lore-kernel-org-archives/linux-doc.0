Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF6619CC02
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551460; cv=none; b=tsMABi5GUyqWMKLVa8sfj4D/tNcHRFl1Ky8XUhuShwrvvw5XOHQWFY5jgw6VR2DbkqiWZpphM4cE7pyVVDkjObkDbNY/SRMlqfyYKAd0d1u+SLDg0lJThxgA20bUJbhI52/RmJXZ7syfOaXu2Xx7JHFY+xAvfQTOIMcFKs8Ro+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551460; c=relaxed/simple;
	bh=2Ja0DRql3lathYbsnh14IuivZQ4FJiihEMyCBFg1y6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I9jtjY6W23lSnw1d3T1JykCq8K2trNFiNXLgsaGd1WS41yE010m2Q+KvhoUeXdeNddD6FtITvxGKBMuGzvxfqeHjCtk7/uqaL25ps96Lw3w1r/LmzJK7SQksa3gN1qqSI0BVp+uqRl9Q0Nxb6nNXaOJ7in1evR2pcuqbdcMU+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=TtSV7JHA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="TtSV7JHA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso1050021f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Jul 2025 07:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1751551457; x=1752156257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dDrJgI2UVALwAFMMfVSy2p69AmBm6S+zzAfjuuFd4NM=;
        b=TtSV7JHA98z6F4GHH35zpp4gDOAvs7W87NmDHqfSW96LSgYzE2ROJfELFFr+YWQLwZ
         t+ApmACziJ8WHArk3KjRI7peWUyiXamCAm0KTW0Rxngxz02dBm8L+euTcdeugX8tIyMC
         2dxFv3s9SJ+czqY1sFB42Ciyw2JENoadUcJlZZkAJTjk5w0cFesvYGin7PQVZWIvlDU6
         swCyJ27phZ0eGOUZt7nVNq3bXV4Bw1gyD872B886oIkPmtnK7xVi8gIU7D8GwicNJ7/U
         +/SANI61epMP3IuIEFIS3QISo4DwPMZxImRtfN6NiVFSNkC80xHGjDuiCc08mHxVaOBw
         H7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751551457; x=1752156257;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDrJgI2UVALwAFMMfVSy2p69AmBm6S+zzAfjuuFd4NM=;
        b=kU3tHfOe4jJBYEATdwLviXWRU5ILLJY7q4wLwkBLwIBma6VkR+R7/e69TQeVHd/3Wo
         Be2C+Z7KLD4nKLOlTQ7dfHEI7I3pVLFZmK6cGb0u9nH/Qh0wuz4mhbx3cRy263EkWfZU
         Nt2GQtoYpwiD6lQhZbutE5m/IsjERvXUG7d7GgycHOzE9wJ5Tk+F7CX8hcMSwfuuZP94
         M9cvrDHETBkOcr8i38BMck4A5k1OibS4vUzQNDdAsgoD+sxOSV/arP2NO/e2LygOKX75
         s5rH3/BWRvLbeRwRKq+TSkR+0r3Z7UCPHNwAYBK3tfKTXcrGmtjYYEWR+VidTyG77mtc
         uftQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJSWbMz76++rt1JdXHVi5CHblJkKHdQ718vohMp2lC7+RoSCDKLixTYJIvD1+OyUGJl7h/qSD2224=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsbxGlFCZeRniXpo4cv8/VhlAOvYfLL60EC6spSDD1WWPWKvlq
	t4uFUs+Yzc8QHyEsGKtD+RZVdyEuHFB35yFb2/rg3Qmv5HDx2yoSN7W3ppTZMLil9ps=
X-Gm-Gg: ASbGncuPq2zrn5yITSyTnO5QHWSIm1XdageW0KCzAdO+T6RhCQz+1W8WpKANNiAcxq0
	0dStaI+ariI90D1tkbvpBwcnhR/5b2cGWyRIhPdSBaPCHBN4g8+NITZWubMSumHZzcDhC/YahNa
	Id3TaBF3+wHKtjEN9KiGGfg8cyAGYcDuoBtY4V9D8bf/OTB44N8wLReksGJ9yTs/LFKiwwIPn+M
	9TXaSY6oRBydkepDEmutlYH4MtOoOwwSNjob9J5HS8VPAWgm82j4VExhlkt9YbwNnYq0RmDqVL+
	sLGXzAkLLApbObGz2l7RsooHW9YJtCX0qAwpMkktMPVTjpRPOvml/eZz5BD6qN3mxJlB6R1L86u
	nmsWK+tPqRlSfRuFjHbmbzCMy4soRVvJe/dpueKo=
X-Google-Smtp-Source: AGHT+IF5rCFDzUmRIqGfxH4DlbOtx7wQkmAk4Z9+J1BmQz88TZ603h5r95CnF2l2Jg+U+vKV4H4iEg==
X-Received: by 2002:a5d:64c8:0:b0:3a4:e740:cd6e with SMTP id ffacd0b85a97d-3b37b7687c6mr698382f8f.8.1751551457041;
        Thu, 03 Jul 2025 07:04:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:61e4:bb55:bb2c:ae50? ([2a01:e0a:b41:c160:61e4:bb55:bb2c:ae50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99c07fcsm27185885e9.35.2025.07.03.07.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:04:14 -0700 (PDT)
Message-ID: <1e896215-5f3a-40f9-9ab5-121109c48b3c@6wind.com>
Date: Thu, 3 Jul 2025 16:04:14 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH v3] ipv6: add `force_forwarding` sysctl to enable
 per-interface forwarding
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702074619.139031-1-g.goller@proxmox.com>
 <c39c99a7-73c2-4fc6-a1f2-bc18c0b6301f@6wind.com>
 <jsfa7qvqpspyau47xrqz5gxpzdxfyeyszbhcyuwx7ermzjahaf@jrznbsy3f722>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <jsfa7qvqpspyau47xrqz5gxpzdxfyeyszbhcyuwx7ermzjahaf@jrznbsy3f722>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 03/07/2025 à 13:04, Gabriel Goller a écrit :
[snip]
>>> +    // get extra params from table
>> /* */ for comment
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
>> Documentation/process/coding-style.rst#n598
> 
> NAK
> (https://lore.kernel.org/lkml/
> CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com/#r)

I will follow the netdev maintainers' guidelines.

If the doc I pointed to is wrong, please update it. It will be easier to find
than a 9-year-old email.


Regards,
Nicolas
