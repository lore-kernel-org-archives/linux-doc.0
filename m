Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512032ED848
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767790; cv=none; b=ORYUE2qf/WVgbUWFfriOOBx7Oe9zNxJRANGl1htIgIPWeOEKoiheQGUbPsbqs5n++OJcbzxSBRZm/eL8kPOjotjS6ViMDskwzFESGCG9zyCps5KOsPBFIxm7nzq/pWuk/8cMt7tGexMWO1nsEVOvwdj6MkogIxa0QRj1FnEJx2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767790; c=relaxed/simple;
	bh=pm14elPZ5G/j4V8ktFwqsKYTPh/bNpFOvdQNitNlm24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lts5xmNRGuZGChVgJtdrmzrnMbsdmW6M6P5vbZPex9hmGNkknCRPuF7wCgTarFfQHm6qaWcijEXniyuVH4z7TpBIygPuAYdJ+MRk0ddaUyayYYUQ6Cy79Gq5xA06vUkUAnVPQO6D8tiqDAR7m6Qf0jNQ4Ie69WHs5Dw8IzTnKpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G+izUzgR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G+izUzgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755767788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QFV43Vjpw2YCtuBdkEV7d+CUzzBS4M8wrUUVCTOwfBI=;
	b=G+izUzgRIeKwnBKgK74Op0oIcKv2v3AFQG6NAqpOAZ/O85GJLw/CL0srpewae4XYsc+283
	LqS1y/HbCZYFwSF2CmdkDIHh0nhVflVmKuYzeZjfC79LJHlSxX3wReyj4jrj9JyI1ScU0g
	l6weMnr+s4N+aQlf9+WQTO0ZlTL4QNg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-bK3DUjFMOtm-q2T7k41Bgw-1; Thu, 21 Aug 2025 05:16:26 -0400
X-MC-Unique: bK3DUjFMOtm-q2T7k41Bgw-1
X-Mimecast-MFC-AGG-ID: bK3DUjFMOtm-q2T7k41Bgw_1755767786
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e8704ea619so181384985a.1
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 02:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755767786; x=1756372586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QFV43Vjpw2YCtuBdkEV7d+CUzzBS4M8wrUUVCTOwfBI=;
        b=AtwG26B6l6SpF8Nf9MmnaSufcBB2tny4VNIn6DBHHATNGKZ10NaJKJdLU+gpIm9iXY
         e0kX6IDZvmSGWySFDSncoO2jlt8P+tDbe92OwJmRwt1h4pL7HPpsF2azTy60wKvO6LMt
         7ZaQcEpx/LGSXinaVepEVMqYE3HPV8SQ0lPGIIwN9LGPJpejdYj2ueG2Nl3EJBxpcEtK
         l7tIkLrZznZNPMPgq7YUKkADse+s7ubNBfCWjaOOzMVSM/AXgf/RhRaPI5dSgXjgxw+u
         y353A+LkULGHq1EOlrICtMQ/lJuplvR9d7xE/d4UXMfU7oU0+AJhljSfChdIuNMHMiI+
         gEgw==
X-Forwarded-Encrypted: i=1; AJvYcCVq9DIt62MjUOjDGi94l/eKKGCUcP0+Sa4PaqS1vNC6xbD5XdFo/8HUr1wAEsa1dkBryzFNY/xgaFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW6Xtgx0p2+/HMJ9l0Hfkw4BrhzALCjH95bcVGcYsVmeON0LlN
	7diJpdwc+t84TSl5CY5l01Te2Q6IGUiYCtmV3n+xCjaBmxmMUpqn+t9PWGWAoq/IWkZtWGFY9eX
	fbyvWyssQtMYpwBCXLciJzl+6i+/lxNBYca/8NlaPPbYOP+oCiriikDl/YyG5mA==
X-Gm-Gg: ASbGncsF9RmYsfiIcsCymJ8smcUPF86gohaaJ8lh5qnrbHcUA1tkmsBINT8CBDJREbV
	kbyG1Z8SKG6SNGS2+VjUqoxnVD50sEaRpBv5nBHYg0QvXhmrhD9QOsY6+CLNYsrwmrddipQ8wtO
	yEpamObvXtuq+C/85YHHBOzviY1hsvicW+Q+9VvZrT1TEkikFx1Qz5ZRKxQV8v9tZpt64o55+4X
	oXG+HYnLLdPHTP6F/JLTfY6dryZoGOsorf4d4IRlZJJtYj3iiBx+hrAsM6HmNSuC+N2mw1wkA+1
	ZKf7RydUQaPdh6X3kY3kLJ6i8B8OHg79xcH3aCnfXVOWSgYJ5egguvroYGDnDWVNq6wL4hfLI9K
	0apSzpAvKIv0=
X-Received: by 2002:a05:622a:2607:b0:4b0:74ac:db35 with SMTP id d75a77b69052e-4b29fa00e71mr17490341cf.12.1755767786294;
        Thu, 21 Aug 2025 02:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO59+xn+TEz6syN109Tg/E9Y9908A1mTpsNgURB+UWGfNs8GFE2O7XylT4YucYAMPXkXfNRg==
X-Received: by 2002:a05:622a:2607:b0:4b0:74ac:db35 with SMTP id d75a77b69052e-4b29fa00e71mr17490011cf.12.1755767785777;
        Thu, 21 Aug 2025 02:16:25 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e1c9b9dsm1089675885a.70.2025.08.21.02.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 02:16:25 -0700 (PDT)
Message-ID: <1ba2c580-6401-4f95-8d63-48634b834234@redhat.com>
Date: Thu, 21 Aug 2025 11:16:21 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 net-next 2/3] bonding: support aggregator selection
 based on port priority
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Petr Machata <petrm@nvidia.com>,
 Amit Cohen <amcohen@nvidia.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 David Ahern <dsahern@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250818092311.383181-1-liuhangbin@gmail.com>
 <20250818092311.383181-3-liuhangbin@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250818092311.383181-3-liuhangbin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/18/25 11:23 AM, Hangbin Liu wrote:
> @@ -1707,6 +1719,9 @@ static struct aggregator *ad_agg_selection_test(struct aggregator *best,
>  	 * BOND_AD_COUNT: Select by count of ports.  If count is equal,
>  	 *     select by bandwidth.
>  	 *
> +	 * BOND_AD_PRIO: Select by total priority of ports. If priority
> +	 *     is equal, select by count.
> +	 *
>  	 * BOND_AD_STABLE, BOND_AD_BANDWIDTH: Select by bandwidth.
>  	 */
>  	if (!best)

Minor nit: I think the comment would be more readable placing
BOND_AD_PRIO before BOND_AD_COUNT, so that each value documentation
references only the following one.

Thanks,

Paolo

