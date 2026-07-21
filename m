Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5793C060E
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623985; cv=none; b=oxhZcdiS4SXuIbdvUxO9LmZg7vv2nBo7KRi66z1DjTwvpitsojorcdiKZd6eDnf/kCF99+oABVxajAwV+uIFP4Ij2O1+839BnWCLpCwKtj5KJx4JY7DX3erLq3Wwgi497NC08Rin0GWjCm4aszf8H3Xb//pgnicc/ChW1TsydxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623985; c=relaxed/simple;
	bh=1MHRIePTbHHk9xjWYi87u8AUAEPnxZmCw9kRQrxCc/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFP4jUnsS2SvLLdpt+j5qqiLM/1yuQkIGqy3+/c9DWHNGCeuu7+eWDdWVHbq3FlDP+sPU/vKaWf/2xdRFHUw4j93zcIcj63ELbh4YDwmz3n6suyEzslTIC9GrBMZSup51EYgiSrl0/Oj9qD8MkuDurh2z7D8Z6r/blkGCh1W55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SXMdEDLk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oL4BLraz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SXMdEDLk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oL4BLraz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784623982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=motssK5KBh9ULfnUG/euYaWhuODun2kccAtLo6xRXEw=;
	b=SXMdEDLkAYaeqX2bEGVt4MxCQjHAgEpWZbbWYw0oVd5VW0E3INk1c66e4OUjH6Q91GW4Y1
	SvKB88o3bZzA0P/VbXXS1bOjnm5ioFmWMwBuKmS1oyBd1NaB2Kcx6Y3Z1Sses0D2rqn5Kg
	WZmV0nApoMqqk4N1hLTXPXtmRCcbM9o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-qyDSfeOoMri329gBjUhaLA-1; Tue, 21 Jul 2026 04:53:01 -0400
X-MC-Unique: qyDSfeOoMri329gBjUhaLA-1
X-Mimecast-MFC-AGG-ID: qyDSfeOoMri329gBjUhaLA_1784623980
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49545071724so53483015e9.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784623980; x=1785228780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=motssK5KBh9ULfnUG/euYaWhuODun2kccAtLo6xRXEw=;
        b=oL4BLrazkPAuEUYGRLa5AFFm+2RNBSIRl7r8e5KienT82BpkqpLZbbOdnyHEVQ8fJX
         lxpE2X2o/WNbq+AIQ9Hi15X/m4m1XXWVjRkXhfbNj69lULVl+mkd4TT6dxJDU2ickzTF
         GflATpaE+nFPIPukYESqJuQOVy1hSQu1TbjfeFjvrVaMzGfYcVZxCe1088kUrLPAtSFm
         Lf6znKPKbUyX5CKjrO0WCsKysXDuDapjYLsUXjmNm1cJDL/yxOKTvcf07KuZ3Oulgi24
         VLvzkfGpXwTLK2TOcPqmRuS2RGtA9H9go2q0bx4D24i/3sR3C4z3INDjBv6V6n1nKJoL
         qhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623980; x=1785228780;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=motssK5KBh9ULfnUG/euYaWhuODun2kccAtLo6xRXEw=;
        b=JgjJSPr68WbkC0zm5BJ7k8vqye4cYGM3TjDPqyCreS+Ul0bOnn7FA4PDod26cWraQK
         ssCpL2BF3Zv7S9H0MGsEjM3mbJTCAvklku+gp3sz9kNu/4dkCuQV0m38Ov3O4yGhdNiY
         QNM3E9/pwTU6j0Vv/nmcAF254LTPFGcIv1WNtxAfRaZ7Rrqz0vrI6oROD99tOkf8NdOt
         /ngm6QeypdtSs8ihmQBs9KbAbb6SUx2IGNDoE9L+B+tWna3v4z27KKqINmzvNTOG8r9v
         yqZ7gqiAG6Yrdtpgh+fEUAuSlcotO4DvUuacwgvv7kGmgDcCwHQH2n5YZwlIzHj8qGlS
         +hpw==
X-Forwarded-Encrypted: i=1; AHgh+RphVCXL5Wps2CP6nK0lzJilq4pLXohh8dwAXLkgGUVAlIYSnwCFlQzwAkdxv0PN2cJxKZQIClpJR6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk3VQQyNG6DOcTXFSW1R45bJNCEifgdzpcif/tMLufyDvKfFTX
	rk86oUzCNePnPQOepVixNPfvXaUbdY5IIhM9TtXqp6I7zOdaW+qusJ4oCTAOx1inbUrYrdyNsW5
	k0ZUM7QGIXEwvLtTZBNE89DpeVOkccMaJVyYltG9mhRz+7/wOWjCwjxoFlCid7Q==
X-Gm-Gg: AfdE7cmo1s+DPZPJEpOne/6lAmLpyPV9PuBRpONinwjtIrwqBBN0zHI778mX/b3hyYG
	U5sKjI8IcsnpzH1Avrl7Za2G0tEqUkWvyRJgxm5d8vg4Qxn28zD0JTKNchZ5yTWuqdXFNSJoL8z
	iOwzjn2kRhrR6LgXkU5OgnQ3ZJTaAbEEjr7zVzsdSwoJXTvcHixcA0tWGCz5uDxrVjW5XEIQNh0
	QUaMAmW9x3oNZKpdkcHEM5tddzHEuJTm7+S8WWeXDJfNR1PGbDXAIi7Uzzpp053h/r6A9zaPXOM
	k0RFy3sQgjI3Hp2yDOHK0eBuLD+IVQflo3X0cq1wX5f5qu3EVnUnJ9/PKto3aok53fuRUAbnkDD
	WnsK/axh0dQ4DoZM24EsjKiVk0ViECiadLQKb0Yhotc0d22zOZ+cbyXDH8FrRNoiqAt7UXXAGW/
	CnLg==
X-Received: by 2002:a05:600c:1d1b:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-4954a3db7dbmr188111825e9.15.1784623980311;
        Tue, 21 Jul 2026 01:53:00 -0700 (PDT)
X-Received: by 2002:a05:600c:1d1b:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-4954a3db7dbmr188111425e9.15.1784623979848;
        Tue, 21 Jul 2026 01:52:59 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563969482sm145264925e9.3.2026.07.21.01.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:52:59 -0700 (PDT)
Message-ID: <4793fa8e-36d0-48fb-95a4-f22549b5e1cf@redhat.com>
Date: Tue, 21 Jul 2026 10:52:57 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 13/13] net: ethernet: adi: Add a driver for
 the ADIN1140 MACPHY
To: ciprian.regus@analog.com,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-adin1140-driver-v5-0-4aca7b51a58b@analog.com>
 <20260708-adin1140-driver-v5-13-4aca7b51a58b@analog.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260708-adin1140-driver-v5-13-4aca7b51a58b@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/26 12:33 AM, Ciprian Regus via B4 Relay wrote:
> +static void adin1140_get_eth_mac_stats(struct net_device *netdev,
> +				       struct ethtool_eth_mac_stats *mac_stats)
> +{
> +	struct adin1140_priv *priv = netdev_priv(netdev);
> +
> +	scoped_guard(spinlock, &priv->stat_lock)
> +		__adin1140_eth_mac_stats(priv, mac_stats);

I understand that past reviews suggested scoped_guard usage explicitly,
but FYI this is not the netdev preference, especially in trivial case
like the above, where it has very little - if any - advantages over
plain spin_lock.

Not a blocker anyway, just a note for future submissions.

/P

