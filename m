Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22AE30148B
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623574; cv=none; b=ccGufQM2e6xCegmhAGKOhE1GixH/K7eYAbXXuOZAm2DRzfpaETYZCOKrPS0JjOlZ7AxKLoTnD+ncXkIrLIBg5lUHmUezUuBiA4/9OzvpV3cOkyh9PqG5diiYYME90JKy004H0O5M+Tk1lOlkOoRtSCuQzUYKRBh04MuGSnQOpbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623574; c=relaxed/simple;
	bh=YuamI1BxG38RiHIYx/SIZEAvWsuh5tk+e8yJqhhWbvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXzjAAqvg2YxyMQyQEA9uhrR9FUGUd6jvu+tWPF0sABzt9eP+lZk5fHLisrkuG6NWSThFdKkf7Qr++tSm4+8McywRHE0jRhaxhxpWGXsvjvKlQmBl3LCbCmJopAQngvMmJB23QNJUA93DvxpMpfFy/zDK7HNJ45wQRHEYcymYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ICJSko3a; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ntyTg/i+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ICJSko3a";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ntyTg/i+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784623569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j1h/8U8rGpm6km9e/8IbvCjZFi5T4w4REAp5AhAlIpE=;
	b=ICJSko3ax9oDOQ4UCJ236jp41OBwXMyp8t9/njji9e5vei0rKVaqOHD47ugZ094eCVFfdr
	HAkif5OgR8OtIA8CJmehPnFQnRG0Hkfpa5Tjjeg1f/DQNXrw8Fd72IXb6uUkYU497w3Dri
	A3rgwkIfowF6JrF4rYT3wZmqAoAy5E4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-HT7ee8UiMEmZ7tsZiSnS3g-1; Tue, 21 Jul 2026 04:46:07 -0400
X-MC-Unique: HT7ee8UiMEmZ7tsZiSnS3g-1
X-Mimecast-MFC-AGG-ID: HT7ee8UiMEmZ7tsZiSnS3g_1784623567
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4926fa2cb17so33281355e9.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784623567; x=1785228367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j1h/8U8rGpm6km9e/8IbvCjZFi5T4w4REAp5AhAlIpE=;
        b=ntyTg/i+5ykeTfLvaR2ntxf4XHqtUYb5Znkho2SzZBIWVUwRZgaQaPvWLE4YDZ5g5T
         uLKR8HWJ5oV+D0xf7WW5JYnzQTMsHbROBg+tYmuQWez8HTr60xY7A3PVAGZRVoS2aaCP
         t8Nztcv3voAw9TkKhPoqyyIC8pvp65mGLSQnHMYXaARAQkfeddZR+yY0TwBozJ0+vsH+
         QUwT1xIszumUB2IONEF4FtJq2nFgtCBaOkehS9AEPu/RXEQKmekSU/E7NTpFYgYACWg7
         jaLl3CyOg6fbQTvoOjMbvyBN2cTgyV+czU1f+efwlaYvB9ue9w+Czx7i2djSWlvTl5wM
         eHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623567; x=1785228367;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1h/8U8rGpm6km9e/8IbvCjZFi5T4w4REAp5AhAlIpE=;
        b=RYl4RxVWxQINlHJK0DZLgm7VN7ZmUmt4eclN9/CYmI4xaN401LL4RXds4AlwHpvfwc
         arXdkOK+Ys99fYvaFAfq/WNcFan/faD7V8G166EUZvewFeTGgycZL5CalLNH3+aUCwtJ
         ncotUbvFt1Qt1BWPSqymOa6ZkILY5IWoYcgPtYpcKdJgVydlHmQ/GkPQuSnvBJotUJgr
         OhFLfq5NvSODELFzOAD0UT1yiikmIhOhYhpEFV80OjkSNH02A8EKMcGikTvf2t+uRteN
         Ftd498DjqQ1V+va0dHjpb9VwDi7cSqJ7tVtueC3JABYC6TXz+1d3BZQ2l+sZUr/KHcJR
         Vp5w==
X-Forwarded-Encrypted: i=1; AHgh+Rp7l3+0BdQqx2+pinbFN/PCK3QMqm7nvFz7sCHcgyJe3r8r1whUwCw8wlnwBLh4ASe5ek9bdGmNqQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWQBTLQuVJX5NfLSxXzYFFzwxrqytAvz92o/uVB4VQ9MpcJw4j
	1TIc6DvqaLI6nnficUbjVNzmBqq0xlH31HhgEy9rNqI8m+FGCAVUBePllcYiQjW6ofKTg6pVRgq
	yKsQq8a3mUORBPkHhW2xP5BR8j299xpwjwt/JvsUujs8QprsDhE62P2wWRkagyQ==
X-Gm-Gg: AfdE7cmhLVu3iM6LA5/We50o9bH/xbTJL0dGbWI7dPJYLz/ZxuG7b9qcopdeQdf5VP6
	T6eWO1QOOS6ec64WguvckLdQxKdLxbuvbv38t78t+WXU+7AtAihvlJNJvfkRUvycGmHveZwny8W
	JOnQrwxG5xvZG7lxoM/i+KIRpjGDtdCx0JcscIjiOG6QDqTk2BaNPRlTsWQQY1Qf8vaItlNFp9O
	OODckgtOm9LP5BKWeasd/SGlW1PeuqRooX9ciieC6KXSsNVAqtB7RvJ/27AUTyYnecRtgaaDMHi
	9AQ1FNuJmYKYhFF/FpktBVxs01fVxqqAyciT3vn4Q8GsRkKOraJ2lNvrmAkkcj4gauec8aEZHFv
	guFbv0duyFvQRvlPNqnTzk0hm0yY7r3YJNkhSGYkUA8RsB5vtCP6gjhbLKmlnMrJV8fHwwfcGKt
	rDjg==
X-Received: by 2002:a05:600c:3485:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-49561a30bb3mr70805125e9.18.1784623566666;
        Tue, 21 Jul 2026 01:46:06 -0700 (PDT)
X-Received: by 2002:a05:600c:3485:b0:495:6193:c6c0 with SMTP id 5b1f17b1804b1-49561a30bb3mr70804755e9.18.1784623566185;
        Tue, 21 Jul 2026 01:46:06 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm227108515e9.2.2026.07.21.01.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:46:05 -0700 (PDT)
Message-ID: <4793400b-958d-429d-b2db-d39b7d757338@redhat.com>
Date: Tue, 21 Jul 2026 10:46:03 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 10/13] net: phy: add generic helpers for
 direct C45 MMD access
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>,
 "ciprian.regus@analog.com" <ciprian.regus@analog.com>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-10-4aca7b51a58b@analog.com>
 <CYYPR02MB9828A0F83559EF025D01A14C83FE2@CYYPR02MB9828.namprd02.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <CYYPR02MB9828A0F83559EF025D01A14C83FE2@CYYPR02MB9828.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/26 4:29 AM, Selvamani Rajagopal wrote:
> 
>> +int genphy_read_mmd_c45(struct phy_device *phydev, int devnum, u16 regnum)
>> +{
>> + struct mii_bus *bus = phydev->mdio.bus;
>> + int addr = phydev->mdio.addr;
> 
> You may want to insert the lockdep_assert here. That'll ensure that read/write APIs are called
> after the mdio-lock is taken. Andrew's suggestion.
> 
>    lockdep_assert_held(&bus->mdio_lock)
Since this looks like the only pending item and has no functional
implication, I think it's better handled as a (separate) follow-up.

/P

