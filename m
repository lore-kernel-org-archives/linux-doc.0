Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1E205AB9
	for <linux-doc@vger.kernel.org>; Fri,  2 May 2025 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175572; cv=none; b=UDAsRvHLSpAMSE+ngg/M2Ry40LJAoL7F9DG0TnuipcHXcb2JJ7OvLO0zzEgOhKQE6XYIy+rrFHGpR+Qx+gcoWK3HLI4mbKFI8lDFHHafVs/WmS1vMNimz4YlQLwLQiEO1uA8hAelKLhY35fSSWe4D4ZIa98r1A3ALgDnaSoO37w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175572; c=relaxed/simple;
	bh=K4n6OSMgmZzGwORvCnmeTSGEVj5+u7yaqDjtdKdNNnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIo+AfbW1FD2iTxY4jMxERR+H0GUpDKugW1HQW4bRpCL2EpHT2md01f/7p8uuSR/F/j1J/khj+2c4tV5RUudaxERv3pSuoXpVN3UvN1gLImenB7X2RdDJtaRMzN44NbCWpXJPbPsXQ28QWLSxrzJoI9ATg4tcZypnEcu2CU6lwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=emOgguZZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emOgguZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746175568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0S/o6xgo9t+7UAMzIJWxBv0bL1jmctzRzHr37NpFa0=;
	b=emOgguZZlmsR3bxc8we6J/YEcF/z2QxjCkj8rHLWb1MUqHVDkfHLF/kxD0kTgDScd4k/pG
	jrHWtHRiRdp10sjDpeh5kc8ySyu4oP6O7Oa7aIQdPa9KCS5Tnb6+UW3evQcOClOQO9bKSx
	SNyF9XD3YNh59wLNnR9AeACYFYA6tx8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-WDCDmOQFNjGVq62byipeAQ-1; Fri, 02 May 2025 04:46:06 -0400
X-MC-Unique: WDCDmOQFNjGVq62byipeAQ-1
X-Mimecast-MFC-AGG-ID: WDCDmOQFNjGVq62byipeAQ_1746175565
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39141ffa913so839416f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 02 May 2025 01:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175565; x=1746780365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0S/o6xgo9t+7UAMzIJWxBv0bL1jmctzRzHr37NpFa0=;
        b=FkiZSr3vXh2sD2u4ZcNb1QVrVj0KOBMYppBKarqqDyAn88iE12hjb4KWygPHBtbi6n
         N2q5jT/y4uE++tw1ETax1Zfd1pMOcKfcus/0Ny1EnCoNWuk3NbZdC3AmKitJ1otRQ/Gp
         Bd5cx76w6UYR1Johh0L9dTivHVkC2k8X8sQw3kzac1Cr2CppfRRNG1AcknRyBEp9kbwF
         15tPZEr1aN9lzbO0vkSZycNfBQW5d30G9CEMtJph/MKNkYNUBcT4hsEYWyMoWjskIvzV
         AnG7BOu6Ojmqi9mShu0hyH/GrZ/2W7oW7a75zJ4tM0qwaYs/Ysz/FKaH4oD76gB/Bd5W
         zkzw==
X-Forwarded-Encrypted: i=1; AJvYcCVB4YXdwX3Ua5dxDNhlQ0hnLsP3A+5RWssjRki8IFZE6pei5k5yUIm6O1hNR6m7N1rFOmlSXlyVYQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6MFPQJWdLkFfnThjAFh3GRo5+z10lEARDikTQRCivGvTP8eA4
	MsanzEL/2OtCl4lqLTNFB9jQ4/HcWpTRwNSxQWjrYTc7lYNUV99Q0x1AhT965ptekQYzrBv/PWg
	tCDY8/aCDcVQ6XvvayLmtEjtvRj+EgAlhUuMtn8mH5xp1xVxQ8knbzXSblQ==
X-Gm-Gg: ASbGncsZcOhjfX6tu+WACky3tVl4vQXZxekUpakdBrcEFU3boICVLPy1eQXsIewJRBC
	kL7tZIE+qNpO9lgHaBc5OyoOvaVdnreRqU4dXFnU8jiO1lsT9O/qOzV7yA6yMDifXjy7YgwYqih
	QlL7w6SVenqolB+pXT7sUd7lqZ0/u9wH+Us99ie2/yKOQGg0aSJBj0ns1CTbiQdt65LNnuMVX6m
	o3X1Fl1YDf2WqAVnhzTiE5caockV1XMEJO5qB05ybl6pDh4QmMonOHQPmnEpAv/TbD5PDOK8zyt
	zO/3RwQFPBhir/NGqJM=
X-Received: by 2002:a05:6000:4008:b0:38f:2766:759f with SMTP id ffacd0b85a97d-3a099ae9d04mr1137183f8f.41.1746175565328;
        Fri, 02 May 2025 01:46:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTEziSGfOUv+JnuXr70r6TvcxY29K/JkxO4QYwaYI++/LoyBYIanXjyXfHCszu7xVy4fBf6Q==
X-Received: by 2002:a05:6000:4008:b0:38f:2766:759f with SMTP id ffacd0b85a97d-3a099ae9d04mr1137168f8f.41.1746175564990;
        Fri, 02 May 2025 01:46:04 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:246d:aa10::f39? ([2a0d:3344:246d:aa10::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3b62sm1534788f8f.34.2025.05.02.01.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 01:46:04 -0700 (PDT)
Message-ID: <f82fe7ac-fc12-4d50-98d4-4149db2bffa0@redhat.com>
Date: Fri, 2 May 2025 10:46:02 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/1] Documentation: networking: expand and
 clarify EEE_GET/EEE_SET documentation
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-doc@vger.kernel.org
References: <20250427134035.2458430-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250427134035.2458430-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/25 3:40 PM, Oleksij Rempel wrote:
> Improve the documentation for ETHTOOL_MSG_EEE_GET and ETHTOOL_MSG_EEE_SET
> to provide accurate descriptions of all netlink attributes involved.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

This looks like an almost complete rewrite WRT v1, a changelog would
have helped reviewing. I'm unsure if it captures all the feedback from
Russell,

/P


