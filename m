Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5868629E05C
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917234; cv=none; b=t7NOVaYnJ3hb+LqQprsbQoKXdqQyLnGOI/Dx1m7OTmVdKNftI3tn+RnPypvi/pAz+LAwv0WcYoOT2CahqR9nSiBAKmqbUDd5QRUFCF3AcsYGdHHpVwMmX8+AcnHDi4FKRKJ6F4lbT0VmoYcufATv70SFdGdn80WmuQG/Hr3ZRoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917234; c=relaxed/simple;
	bh=2KIKuRu81xZaF2280xYX/+R5+wlu8WDBf1ye5GbVH/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laMDcZS2LDiTl9VKqlwLfMJb3KfJGsE0O1KglLAKHPzH8YjCUMpjSKkTDpTZHK7/IVZsp5eSNyPyKjVuPFy7qs8WkcH45nmA2u/qa+SXf9ngzLPBYY+fLXWhFmSL9tRk//24FWDH4PjAV82E5kEdczIqpRvXzUC7/AJJ00BtkHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MzsWoP1b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MzsWoP1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745917232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCHHHLvZcH3BVlqKXz9f7p7K33kY7dzdDWtjNHcUjrA=;
	b=MzsWoP1b+qyCz7qXJzrEMv1If0bRprgfGIQO5xl0G/tco8NYP55ROdsRVH8LP9sJsro7jv
	XzvmzNM9lQApp1Tz4GaCCuhmn/z6LL6VhVko8p2blqD6K9SLOjgTVUuHpEhF2uQqGqlWDa
	l2YUO1BjdSRPmSBbk5db3WEkW8oO1Zo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-fzSF2tSrNoq2oLK0Bw5ZVA-1; Tue, 29 Apr 2025 05:00:24 -0400
X-MC-Unique: fzSF2tSrNoq2oLK0Bw5ZVA-1
X-Mimecast-MFC-AGG-ID: fzSF2tSrNoq2oLK0Bw5ZVA_1745917224
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb2fdc6b29so129290466b.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 02:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917223; x=1746522023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PCHHHLvZcH3BVlqKXz9f7p7K33kY7dzdDWtjNHcUjrA=;
        b=SZgaQ8e7FlNgb8kr+IguNZJznOUbznkKc/qsCDdBTr8tABB20O78CI9hFnhG6pdmkc
         bYoFczoLjfygfDza/ZjELTXnUFssoUc67Ey4Hj+HZuBIZ0G/ilIMJ8M3Z8s2VfMKMiD8
         eao7VT8ifQ2zXV/KVNTIvJ3nmWoeqvjHNioyHgaK/bIu4QpImTThuH6dYniKmTQ25X3D
         eRGDOd8OUv4m9TXGaZLPDe9Conm7N97k+FsBCQP1vuZCIgHtHOzloMfh8gUUOTy8GCcl
         wMRC7vjhCvLLQ/M5hpOp/4ibYjOcuet0C3TThpB8SABQIXqjFZb9VUbYm2pXlOJuazDP
         dr8w==
X-Forwarded-Encrypted: i=1; AJvYcCUQLmXG6f+6rNVqJ2EyeUmOVRpna6oEYjPcsK7MXEw+XAe+rYyfzP57bwdHJSos8Td9wdBuFKHBAwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYGvWCFHbtWz3kJPYVw9asqp903xvzroFBdVJ3zhthO3TPzrrm
	5do4QDG6a+65vMzx73L9lpzfD6c6xFm/DIPD1uyXs28/NIwHcnFYuZlS7/J3XAWwvYzPo+ZzrzP
	AMgYKGgEGVS1RmEstcyy11vchTzqQvOD3pWP6f/gaXrIv3qRBiRMNFbHytQ==
X-Gm-Gg: ASbGncvE7s2uSAP9uOgv1rJhxvZMLpP6a1KxVwtXjb2RUj3iBNpX0dvCvlbE/HysdYL
	e37MKV5hCb+p/a1wMbu5dB892qHUUe0e0mcq5Zj8aC4pYXVvrJTyldkaRALKMDnYR1mGsm4v8Ow
	WkRJ3NUybzEqJQ8HNGUOLeSwtoXj1FHqekeaBOaJ2++9wE6C8Lu14fXZiBd+NaUyjwlx+a5FxMr
	pA+24ncioWw3nSYsSJ+vHXCB0jIc96yPQrGAnQLYFx4FqV6Gqg3SvrjOV3Fnuz1eE4B8QolnLid
	TuWREr9TS9qeOs2/YlWKuIPEJJrOt5LNOHNT6HtOcypPqW0IUxczu1CIlUw=
X-Received: by 2002:a17:907:1ca4:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-acec6a4958dmr218813466b.17.1745917223560;
        Tue, 29 Apr 2025 02:00:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkmrc9oaifrsbfBdKoTCsdQffffsFtg2dW8YPIfDy01PUM4CZM4fNcXpfPUjcXmTBPdpHaIA==
X-Received: by 2002:a17:907:1ca4:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-acec6a4958dmr218810366b.17.1745917223187;
        Tue, 29 Apr 2025 02:00:23 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897? ([2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1cbfsm741676566b.181.2025.04.29.02.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:00:22 -0700 (PDT)
Message-ID: <be2ae666-a891-4dee-8791-3773331ce7d7@redhat.com>
Date: Tue, 29 Apr 2025 11:00:19 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 02/13] net: pse-pd: Add support for reporting
 events
To: Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Donald Hunter <donald.hunter@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422-feature_poe_port_prio-v9-0-417fc007572d@bootlin.com>
 <20250422-feature_poe_port_prio-v9-2-417fc007572d@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250422-feature_poe_port_prio-v9-2-417fc007572d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 4:56 PM, Kory Maincent wrote:
> +/**
> + * pse_control_find_phy_by_id - Find PHY attached to the pse control id
> + * @pcdev: a pointer to the PSE
> + * @id: index of the PSE control
> + *
> + * Return: PHY device pointer or NULL
> + */
> +static struct phy_device *
> +pse_control_find_phy_by_id(struct pse_controller_dev *pcdev, int id)
> +{
> +	struct pse_control *psec;
> +
> +	mutex_lock(&pse_list_mutex);
> +	list_for_each_entry(psec, &pcdev->pse_control_head, list) {
> +		if (psec->id == id) {
> +			mutex_unlock(&pse_list_mutex);

AFAICS at this point 'psec' could be freed and the next statement could
cause UaF.

It looks like you should acquire a reference to the pse control?

/P

