Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8191EFF8D
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764231863; cv=none; b=b9+JZKdlqxp3TtGKrmwNWciMxszJyKvbT4p04ibsXLw0J8cCwx/DjLHP6yM3dWYNuAyUteBMGxsgQ7PHTXMG8uotoVPL9cbHETknqq6tY+y3Xfb8UDf9r6MiBj/mxBaEs1T4P/N226FtFxZL0e/vfOyr5iW5et+z8hgKyjvU2XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764231863; c=relaxed/simple;
	bh=dnQSLqfX0zGavAQraHWIWlX32/F12Xpr0C/EiVk4nsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kK9UOvK0rSY0O3KHmnycjyhK7I4xj9wLARz2DBcDzGTU4q7DG1NxTSuHdi4ulgzIyITsmHr9jkk1nn6V7BIp9gWW4FYrDwMt12QO4e323r4GVRPaPHAPh83mwV00hpDhhJ+89HkPCB9iZiZehvkbh0m2NZMp18Zqrb8C/x4eVRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpIEBJUg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=luWlKylI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpIEBJUg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="luWlKylI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764231860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oh9tIL6xVGFoq0wzCwtNFdsSlYysZSo3HuXen4Lsmus=;
	b=MpIEBJUgKfQD2DI2xYJD2RWHV7z6y5Emfmxq4J95IgsDanjA0uBZWOOybVzrSFJznEStRk
	n7PB60b2r5HaROKDAMY64RAdCCmyhWbq24oQmPf+qudX/NqTep5E39R4GoE8ywAs4L14u1
	rS4az/PXmplA0PhmXZ3il5OY1zsS4iM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-JGk0JnSXOnqQ--a9N3nEtg-1; Thu, 27 Nov 2025 03:24:18 -0500
X-MC-Unique: JGk0JnSXOnqQ--a9N3nEtg-1
X-Mimecast-MFC-AGG-ID: JGk0JnSXOnqQ--a9N3nEtg_1764231857
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42b570776a3so309474f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 00:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764231857; x=1764836657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oh9tIL6xVGFoq0wzCwtNFdsSlYysZSo3HuXen4Lsmus=;
        b=luWlKylI9WKW20ZhASOshpvYV2cKLc8t1JeULR9wQI5CUiECbdudj7w4V7k1DjeaEC
         tFhar3iIcPCxIRD7Ny2MYWsirPqw6xIK3o6OlWMOjAxogCeCLH8Nl/MEh7dBJuAXS5U/
         ywwDitcAP2kncJhMUWTi8BdSNxW1EISNmEnHhj08pUXr3IZ/w5d8s3WpK69t9x0f3fwi
         yE7blrcgiQRDqStGFr/TRS0laSWAJrDn1xz+CPF4UIorI6nBObQ3FWQgFnvuvrJNplRo
         H27yiN6ObtNqUDyPtvXfzRUNLatk4+/8M6GVmGAbj+U+IYsFVLNcyD+0/3bu4xUo5sed
         oS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764231857; x=1764836657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh9tIL6xVGFoq0wzCwtNFdsSlYysZSo3HuXen4Lsmus=;
        b=URFCTGkJUDzwkBzqUuDa412sa2KhVRG0qkXHnIBtHwv2EAZMCsJhL2oxTQQ3KUID6u
         3UBIpICg5gzj4ocU0O/MnP19BnA0NAh2dIFSER3QQcUlHBkjf/MNLWgqiuf9+mXh3Z7b
         B4xInOZhiVFAWVaaVTkay1vsk8opI6Ij12IMd/Y4k7zwxPRv4fAa7iBwmY5d/g4NzHef
         v0pT2R8PduApw6L+pGfrzwr9/q3u/YQCss3XxXSS6NOh7kphzHW1QtCcEbDU7IZaNeoq
         dnRugZaYEwt3mYxj2kBkuC6Ns2YPUrRIWaObAOfvZIH3MdO9Ji6ZoIlYXdneXGbGZ9zZ
         oMIA==
X-Forwarded-Encrypted: i=1; AJvYcCW3+C+QUvGO83Rg0kRjjQVQ0IVN6HbaZzrrmXsmrTfoI49RFMiXbwJhTf41nn136km94wgw6uYalQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBZ3CRi7c5JR8LJgVjyJuEZyoRmfPRj5qPFXmpGheEhehcsczO
	45Yf8u79frKc1f8+KgxQptgWLVFkTZksT59J8p6uPqLDUZx+BabtK8QjODZu4cQeCWZlPYjfQq8
	OYfvMAbwjOPqa9uewG6or7q1fUFAhTVmO+9IRiSgBPXbmDDmCICy9C9rerO9I8g==
X-Gm-Gg: ASbGncteceFZU3NalrhOpHshMPkMGvjeHTadL5Xl0diqSRA/koQJCLRBhL0hfUZm1Pk
	wkQDGUB5p58beSU2nM86LEumLXXZa8n6BMf80Fp/ZZZcL9s/1opNbJP8xKH5HYHMf1Nm2AiQRlK
	7HX+9CEmQKIv4KEn8+PQn/9uk3tpprmMQGD6ApYZZ2E2DLBRrwOlZwaj94dbv3K/HI98z9YH5u6
	+BlJqaKv/PLBg3MViUsdrCyYmXwjH5/VQqwAi1NSuZMtUNdlaQbdnIwpLXwxZB5Tin1Po4kU4EN
	xFouAiy8Xa7doTbW1ifuSj4B0Jkf6wMHKifGY0PbYViv0s8df5GYf2ZBtZ/M3Pk0FHJaX3VA7I0
	dwNdd9tqKHmq21w==
X-Received: by 2002:a05:6000:601:b0:42b:4219:269 with SMTP id ffacd0b85a97d-42cc1d0cf4amr22389292f8f.41.1764231856903;
        Thu, 27 Nov 2025 00:24:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAOizx0rWwPYosIKVqg+o1AjQe2dAxiQeCyuhdEDI/AZ/ORHXtIrnYoAB5FiiWxhXFn0qHKA==
X-Received: by 2002:a05:6000:601:b0:42b:4219:269 with SMTP id ffacd0b85a97d-42cc1d0cf4amr22389246f8f.41.1764231856484;
        Thu, 27 Nov 2025 00:24:16 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a6fesm2280190f8f.20.2025.11.27.00.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 00:24:16 -0800 (PST)
Message-ID: <8e3dc2e5-cf5f-483a-9119-8b1ac958e425@redhat.com>
Date: Thu, 27 Nov 2025 09:24:14 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 01/12] ipvlan: Support MACNAT mode
To: Dmitry Skorodumov <skorodumov.dmitry@huawei.com>, netdev@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Xiao Liang <shaw.leon@gmail.com>,
 Guillaume Nault <gnault@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Julian Vetter <julian@outer-limits.org>, Stanislav Fomichev
 <sdf@fomichev.me>, Etienne Champetier <champetier.etienne@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andrey.bokhanko@huawei.com, "David S. Miller" <davem@davemloft.net>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>
References: <20251120174949.3827500-1-skorodumov.dmitry@huawei.com>
 <20251120174949.3827500-2-skorodumov.dmitry@huawei.com>
 <3d5ef6e5-cfcc-4994-a8d2-857821b79ed8@redhat.com>
 <25e65682-9df4-4257-94cd-be97f0a49867@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <25e65682-9df4-4257-94cd-be97f0a49867@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/25 9:13 AM, Dmitry Skorodumov wrote:
> On 25.11.2025 15:58, Paolo Abeni wrote:
>> On 11/20/25 6:49 PM, Dmitry Skorodumov wrote:
>>> @@ -597,6 +690,9 @@ int ipvlan_link_new(struct net_device *dev, struct rtnl_newlink_params *params,
>>>  	port = ipvlan_port_get_rtnl(phy_dev);
>>>  	ipvlan->port = port;
>>>  
>>> +	if (data && data[IFLA_IPVLAN_FLAGS])
>>> +		port->flags = nla_get_u16(data[IFLA_IPVLAN_FLAGS]);
>> This looks like a change of behavior that could potentially break the
>> user-space.
>> Hm... What am I missing? The intention was to know "mode" a bit earlier
> and generate MAC as random for macnat-mode.. it's supposed to be just
> a simple line move a bit upper in the code

I misread the code, and I wrongly thought that the new location was
before `port->flags` initialization, but it's not the case.

The comment removal did not help. Please preserve the comment above the
relevant statement/assignment.

Thanks,

Paolo

