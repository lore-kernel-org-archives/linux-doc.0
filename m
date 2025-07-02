Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BABC26A1CC
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456500; cv=none; b=WJbdczHoNow0sniSzdQRLcR/p07NEK0vCkIdzbRbWnaFYISzBwkk929LC45fLlC9CYAYzwYqDDBPDZ2Yd+9vdik80kDfy2DSbW21SCq2xIODDEYsBT2rd3c41KQ46HF90TMY7xRaNq5lx1aPNATgqZmWJIJTXXr8ygK2E4RFmCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456500; c=relaxed/simple;
	bh=pLB/CoHkptOL4qWVMaQUjQV5ZTKskQstiuecHdpzjpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTTPGP8z08X0o0R0iW3s40KA7k8WcGav38pGsOIdfP0FawQyIJBSRt4WFbz1GKa3PZWkQ8MllP0/yQFWZG26NhlB3FNYQivVCl+3fEwhanBlJZE1gYCb65+Il5Em6HSopAlsUdibFTI2eQVSMmNcz31aWObkB3yU/K6/PeyS6/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=XyU9H6Zw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="XyU9H6Zw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so4235880f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 04:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751456497; x=1752061297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GzZXJPE+pCDN2n4VgGUurGvnQ9PWiAa/jKqR630GwDM=;
        b=XyU9H6Zw1aG5keWErGbyoFWjRVrTo1hqfUrKHZIfidYmKS87DC/6k0IQg6Ams0l/3t
         6q1+jj51LVxjYD70W5IIlKhH42dzVrdRKagRPDVd7ijGd2ibCwXjlvsl0E4zQxwBumHO
         /ywWF+HffUZrTNOwY93qpX5yZUllgCNU/EwNpxWcmLU9jzXJrpl/vXht0V+O5+8nX3J9
         pP67r8wFXKu9U6d1T32qJZEQl+ag2NyahJpnwiPKmUVCWzD3byVoiX6AuzlOOI6ydxIZ
         X/5Cd8V2c3tZDUldojEldYkQHLzdHuRGPWEP0FzuWC9dzwblexrH/GyDjcTUJhNmTx2H
         EOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456497; x=1752061297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzZXJPE+pCDN2n4VgGUurGvnQ9PWiAa/jKqR630GwDM=;
        b=jCtk+QwV5J7oDiQloxf6gMSin7peZzXCnZBqogkjIVFqk4rC6ipVvFobCfv1yjxeyG
         hBNBCXDZG8IhRgoq0DaMMKjnovLC2TkAb0J3SSm0xPqPx/DVRnzEteaDvrITiN3OlyPx
         SIyCLUIRAvAmGaa28/o2+U7Q+W0qsZuC9Pjur8UDv1b2Fi+8YhNOKB6ipiySQgF1P8TY
         FbJNZv/HmA2V60zyMEj2l88pu45HDmBEbT+yqzd7rzCAA1U9LBPVFIu4SLkYXruNXc+P
         Yp60rD8PUJBQ9DS7yvy9e36BKVyGaccOY6GcdM0R9pUdB7cPJXyeMdSRrxz7XJaaPSZr
         JAvg==
X-Forwarded-Encrypted: i=1; AJvYcCXIc2pnrRUhZm8e+juXUy812RfXrul9jumTOqmh3VijJdQVEvounZGeHl9w9AN7ulHpC8WR5/C/1os=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE9v9He14l42TvFyOFOLQ7dUIAc2T8wXD4kNo5bD1UI4nItAWW
	Wic5vAsTFrI7cWfTsqWJ3HIdWjDeSJSKcirC1gzGUs9eHqGW2aarLUd646r2PQWwMus=
X-Gm-Gg: ASbGncvbfoWZyPAX86zHFO5SY+vmlsHVin8ks5qqQnNK3F+C6WumI82tvq+BTOf75+q
	QnTmU+dZek2gcl2AFVnAKtK8eFKWDMUXsFwXnC5KlXxyB6j6qua/XLqlGhWuCfWEozjl4lFTI3B
	ORIX+8OJv/ZKcm3sOjo0Vsc49Ip0m4qvY1ZQqAb+CT8HthTC00u1HBIrmk4m+X39o2ppp0f3IZO
	3D4ENypfgDmjRf+c+42qXkGnk962e3yd3o/8EaB2hcqSNKILvBJSGsUCuo982EiZDhURhDfp7lK
	zqJvc/ypcDmFKrPK7ra/oyI9+hjOqty+H60cZMfrZNo+jHnriLk7GIRhCwj8QpmjAYAKI3H7DcZ
	KPafm
X-Google-Smtp-Source: AGHT+IEPNXHtekgkaTeh2otpe/2mD8BVkUglqfnjvgS0sOGRxpc82/oHrtuGTxrVpXcyjzzBFMM9rg==
X-Received: by 2002:a05:6000:2406:b0:3a5:7944:c9b with SMTP id ffacd0b85a97d-3b1fe2dde08mr2085098f8f.16.1751456497314;
        Wed, 02 Jul 2025 04:41:37 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59aaasm15549022f8f.83.2025.07.02.04.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:41:36 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:41:26 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 04/14] dpll: zl3073x: Add support for
 devlink device info
Message-ID: <vhv3wdiaphtilm7w3v5iro4aojo5go5vlacwfmsycimxnljhsl@itc567adbkey>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-5-ivecera@redhat.com>
 <x23jvoo4eycl5whishhsy2qpb5qajsqcx36amltwkqwu5xuj7s@ghg47je4hbjt>
 <351c8eb7-26b2-4435-a6cf-6dac36e55ad9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <351c8eb7-26b2-4435-a6cf-6dac36e55ad9@redhat.com>

Wed, Jul 02, 2025 at 01:38:03PM +0200, ivecera@redhat.com wrote:
>On 02. 07. 25 12:25 odp., Jiri Pirko wrote:
>> Sun, Jun 29, 2025 at 09:10:39PM +0200, ivecera@redhat.com wrote:
>> 
>> [...]
>> 
>> > +	snprintf(buf, sizeof(buf), "%lu.%lu.%lu.%lu",
>> > +		 FIELD_GET(GENMASK(31, 24), cfg_ver),
>> > +		 FIELD_GET(GENMASK(23, 16), cfg_ver),
>> > +		 FIELD_GET(GENMASK(15, 8), cfg_ver),
>> > +		 FIELD_GET(GENMASK(7, 0), cfg_ver));
>> > +
>> > +	return devlink_info_version_running_put(req, "cfg.custom_ver", buf);
>> 
>> Nit:
>> 
>> It's redundant to put "ver" string into version name. Also, isn't it
>> rather "custom_config" or "custom_cfg"?
>
>As per datasheet, this is configuration custom version.

This is UAPI, we define it and we should make sure it make sense.
Datasheet is sort of irrelevant.
