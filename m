Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647416;
	b=mRxWCj0E06I4G875CLGGxnO9feJZGy6naXKwmZHhIACiLpibGmj4hhJuqF0HG/xvQnYJ
	 wB6JulQA2mWTbWxrvM8kPgC+SRboZJ3e3Y3QveZ3FzrKzP6FYRj+Ajk7Bnmtm7M1hTnhh
	 +F26DSR5xMy7km5+1GOolpWoK3n9L2wPfsyl268Z3GJ2dgMqZ37sjrov+yg7AEgPe0X8S
	 VtjuceHckmAcwKfCNwRdru1h9GM9hPI4Tku+eD9Hadbng8Oe8Lwz8oFw/Zm9IquhAzoKd
	 YrmXGJZ6ypNraeqHymXqYhaup0+QFhiL4MUIwsd8tlrgsqfiFrOa5rcZJwqjvGzWPpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
	b=pVPsifn6vHnh0UC7KGqEskG8VbQBtLT0lMTj1HNEMCor587abK+/TYBBDWuRHyVYaglu
	 kHdQ6UjL45aVEEV9sjjG9K+JYxcGquO3FGpXdTVQR8/m69QmbTcXlW735pYSlX+MWKPNl
	 orbbl18/UYRjVX/7FxVj6SAGXycSSC81ETJnVNgi9h5jKT9s/FioPNLi9ogusH8i5amUs
	 q/fxft3hpXZGyHU1qFU7CSbyROBZilGUG6VDjnq7kKWzolOlr5s47V3aVo9sND16kGVLL
	 xxZXQ74Km01TVSuWps/ccTPoKrRj0Wv1kswyQY6x9efUAqnNET0oD7zt91V9jUQsJHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R24Rs4io;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFBB606A333
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 22:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFBB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R24Rs4io
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb606491faso33972495e9.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 14:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795647414; x=1796252214; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=R24Rs4iordavR6xw7FQ0o/DZGxqlMi1qPyiseaTCiFjx7grVaeSX5uEyVemQjN4std
         P3Qbx8EGfB7TEqZl5LYeeUmy2V929SvoaF4xo/+uvBBSlDWcVu+jT/Q+pridMe32kf5c
         3iIK8HUn9cq/1cMPqfqd/w9fZfkHQZYpRRLJang2Ujxh6V6RKnk8txMDjYJpobo70uDT
         2/Ia9ALqMOcv+hs6xhhqW91UbgncBeY8wxwlb+TPGWgASMR55W2Cy87d6A56nmzgMwMZ
         fSNjTzium6njFnxG5ATdvgIUt01ncWzg7+Sknc4eQvy1E5rZmoq4ucFg1964Tx+DKk5p
         0pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647414; x=1796252214;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=R+D4WCrX+kxSwlB16d+uEmb8wpppu6vZUa4MyrxuCMtj9IoJz5B04umedHgvwnMbLN
         TAY5S5YkPJw3ui3WZy3gLUMs83ohOT0CZqfpnBzJzvck+zAyhVgUMUKtDZRsyV93meN0
         fQVEEDge7XevRcwOvTtb8xorOwgF428jGo9OTxvfDt1YCq/R0NJ8OSBa0k5jBMUsnmDV
         rOaAoM+3OjjfaVFuPfCln5BK5QPfDfG+oLWUQWu4ZGu5CdVvGG9ceUig6u1yfWXVcio2
         qkOYiFn+68vmmf41DTDVrZwUuk1wwj8Yq+bEdggAdvBUj3hF5vJfNUJA4UVSp5OVBSG+
         QAJg==
X-Forwarded-Encrypted: i=1; AL+hErGXtNXl/IJd2pyERpiz74vrgLiZwwLpey201RjfoIys9/Nd5tI0LaftsmLwOjsoyhLathPWBfawjyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TlJpWSCesxiRoyLa9QvpalyfFRWvrDWedZum5lbkXurtQk7G8
	NZw0sA6YHVsuNDeelljNv5ql+cJu5mQRcRNDvBKkfXazfnGnoGjDpXo+
X-Gm-Gg: AZFdTZefoS1FWlE9rkupWIZkgA2oRxs4Cbnxwqv9wXlR6ZHusB3ZK4xTJHX9fcXr3ga
	HMAiNB3fHVXbaB8BvdFbLNC9BDySF3MzHDhZRMl6ybjg9S8HXNf9H8uns+ZA9W40R2ZClvvXZ/d
	ZifYa9b56evcb8B4wmFM9tSzVO/pIdmVu18wKNgfpHH8zoHcFRQ+yGDXTFdkmEXYtoUEq8oGglR
	L4OzbkvpW/PYlyhUqZi3mGCg1Oocr+5D1BHCiy0LNwOk89J5eZL5O9INmobke3eDNuGtglgNRi1
	r6d3o6ldaWyeRgAs8Yt5vRI/mSPEEO84BjSFyyoeUebkt9RMUExGhQJ+gzVrg9vZnS9z3wa02JN
	GO0vy5I0UH+hi6EvFAD2m6RUGS47J9xP/tVYfjiiD/93545uZan65i8CqYo3sE23sKgfd9Y6j4N
	aisSEO7LB1NpZ1EOH23rwsoclQ9aFyHw9+My6/qwmeLfTFwYZhsu0LBhYn+0sJw5jjnnuvCBh0z
	lLorOSaQImRxtO2rL2j1hZw3sOX32D4H1yi4ApYJvYDTRlYnrM5LByOejV9zadX2jGklOGTq9+Y
	vGk/WKDN2Z5RqYmOeujwhs049R656bMGO7lIEWUGFGcEfcpG0TD2278=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr402625445e9.12.1795647414193;
        Wed, 25 Nov 2026 14:56:54 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm865695085e9.14.2026.11.25.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:56:53 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/7] net: cortina: CS7542 wired IPv4 hardware
 flowtable offload
In-Reply-To: <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
 <179564372798.5.10006827612276789857@gmail.com>
 <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
Date: Thu, 26 Nov 2026 01:56:38 +0300
Message-ID: <179564739825.6.2717872099061772018@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

Understood. I will focus on getting the basic Ethernet series reviewed
and ready first, and hold further offload RFC revisions until that
foundation is settled. Further offload development will stay local in
the meantime.

Thanks,
Fil

