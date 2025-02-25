Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9242267B9C
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483718; cv=none; b=NnJBg0/+a1AktUaySMELum/DmKYuCZp/9DKxPWtoxyXN01drGZPLv4r7quJlz28eBCdgawl1D5GiTeuKJTyFkSObwRoFaHJQZseDlsn28eCq/aUcJBPTucybNaimVQ4+xtvMO/uhPdh0qgW0x1+FeCu7/BuLFw2ESNfeL8uJ73Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483718; c=relaxed/simple;
	bh=CKyOL0dq4XhTxXKNvgQCDaAmo0Z3lBdpUJRyRETK/1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sK4vqpBuWPuGxkPa/P4RKrmudkdR/JMCYk9gmrpuj+oXVG4SZIfW/mVyiinw7QLjtEQwW0dP2n3IfL7qFuA4ZhYfS1uXwvc+Bi/GxSd9w2syDSGIUmhXAsCKna2lH9BDVGW3haCoGqlQwAFiArTjmag4k/TydJ5oGTsAxqpniV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekGeUskx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekGeUskx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740483714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6ggdA4Yip2z1d3LHS7C+TUR3rF6w0Xoc1I30vx9XO4=;
	b=ekGeUskxTslKGZrfBQ3Ud4pF/uWl2rT7RGOJM3BPbcliLgP06JAM1OMqHjaIVQfswJzWlz
	lFasX9IZEjm0GCtHrJ7l5CyHhiPsqm19+OKsXNcZxTRlXqc5V8tGROmhdigZGEh5TSyuU3
	x9eomhwpo9pi2L+2RJhSj2gSWsB80Tg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-rpvAQc67N2-I-fQvCOmSxA-1; Tue, 25 Feb 2025 06:41:53 -0500
X-MC-Unique: rpvAQc67N2-I-fQvCOmSxA-1
X-Mimecast-MFC-AGG-ID: rpvAQc67N2-I-fQvCOmSxA_1740483712
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ab456333aso3837265e9.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 03:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740483712; x=1741088512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6ggdA4Yip2z1d3LHS7C+TUR3rF6w0Xoc1I30vx9XO4=;
        b=CHMLJaWjLRE22y0C5+ako+5eAFtA6QGdOZmMCufJOenF3m2FkRQPKcJEeVIW7TJXQe
         qcCg137UJcBmKEzXp53ZaDcxnqTaIuevOa5WT52+YAkuw6bmDeu8I55c6rl12FRLUDju
         m9KGgNhPA+UBgQWfXXmOgPWS1LQZwmHGlgdTMk5wQXy+DD/ciUDnV/36/OL362pB8L4G
         k/ZFJJwoWmVxkDKBDCul1QFx18I7bvAn6UtbqbaLega/iqtX7KM7jcad2ZMWI8HKPCgT
         J59nIY7TV6hu38eIVwzIZ++fiAAIY4vfa6WMS5wxj+qL4LkAhDD/R48IdLlt8S8vzVVZ
         hQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXs6zYukNbLvcTOVCTlaTyyPv5Qc/9UEQrnSSJAWVRiEBwn65ooYK6YmTg+PuhQnV3UqFYs15TEhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5w4LC5ObSZgjhFpeMGws+tYSkmxKQQRKBTa2xpXIi8xnJCes3
	3PJpTVEnMgG7sZqbXbn+bNNofOynWqZ6p9PAw+6HcGeobJkBtOWFHfI+Ei3tqSCYs5aNbFrjtjz
	dItlpANy4Y95Dx/wYDjKWBHExtk4m3qPI0Rzi0KodcdrV+s/G/ebyfbAzgQ==
X-Gm-Gg: ASbGncvc7P4H0skjfBbVOBGlAb2+TPCH+4nl8lpbaugpwaCSptpYMd9ccpZrgYYVxdr
	WJXVyC6mxC3Wv8FOCO5nsGfRLl5z+3tCw8MbY/j+c6lDUEybaZOsXU4KmiwMN8jDChkQSyIBIs/
	m8NRul692tyR0xSXYFmK8Z9L2PbTBkJdjEGe6wl+zAImpvDCdiFEDlriAp9uafywuuyka3vrjxG
	nzyNWLsrLgSh5An3RPA7F/zwfkkFUj4DMVXhZwKgSywTDuwpeJL4uWyeJTDPxpcvDOfqqnfoXM2
	VR7SPnfWZVU6HF+7XJ0yI0B9tG6n2uAafE0aSrnWCN0=
X-Received: by 2002:a05:600c:468b:b0:439:9eba:93bb with SMTP id 5b1f17b1804b1-43ab0f42a24mr30046785e9.18.1740483712368;
        Tue, 25 Feb 2025 03:41:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhUzCsKXyrBcsIL02vOqLDaHj/LvRegxo7XAQO9jd0Q3JP7pHTLj0XRvx0x5fW0Mplj5/KsQ==
X-Received: by 2002:a05:600c:468b:b0:439:9eba:93bb with SMTP id 5b1f17b1804b1-43ab0f42a24mr30046415e9.18.1740483711879;
        Tue, 25 Feb 2025 03:41:51 -0800 (PST)
Received: from [192.168.88.253] (146-241-59-53.dyn.eolo.it. [146.241.59.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab1569e84sm22373085e9.33.2025.02.25.03.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 03:41:51 -0800 (PST)
Message-ID: <7309e760-63b0-4b58-ad33-2fb8db361141@redhat.com>
Date: Tue, 25 Feb 2025 12:41:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/7] netconsole: add configfs controls for
 taskname sysdata feature
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@meta.com
References: <20250221-netcons_current-v1-0-21c86ae8fc0d@debian.org>
 <20250221-netcons_current-v1-4-21c86ae8fc0d@debian.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250221-netcons_current-v1-4-21c86ae8fc0d@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/25 2:52 PM, Breno Leitao wrote:
> Add configfs interface to enable/disable the taskname sysdata feature.
> This adds the following functionality:
> 
> The implementation follows the same pattern as the existing CPU number
> feature, ensuring consistent behavior and error handling across sysdata
> features.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/net/netconsole.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
> index 1b109f46512ffb7628c6b34c6efdfc301376dd53..5a29144ae37ee7b487b1a252b0f2ce8574f9cefa 100644
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c
> @@ -426,6 +426,20 @@ static ssize_t sysdata_cpu_nr_enabled_show(struct config_item *item, char *buf)
>  	return sysfs_emit(buf, "%d\n", cpu_nr_enabled);
>  }
>  
> +/* configfs helper to display if taskname sysdata feature is enabled */
> +static ssize_t sysdata_taskname_enabled_show(struct config_item *item,
> +					     char *buf)
> +{
> +	struct netconsole_target *nt = to_target(item->ci_parent);
> +	bool taskname_enabled;
> +
> +	mutex_lock(&dynamic_netconsole_mutex);
> +	taskname_enabled = !!(nt->sysdata_fields & SYSDATA_TASKNAME);
> +	mutex_unlock(&dynamic_netconsole_mutex);
> +
> +	return sysfs_emit(buf, "%d\n", taskname_enabled);
> +}
> +
>  /*
>   * This one is special -- targets created through the configfs interface
>   * are not enabled (and the corresponding netpoll activated) by default.
> @@ -841,6 +855,40 @@ static void disable_sysdata_feature(struct netconsole_target *nt,
>  	nt->extradata_complete[nt->userdata_length] = 0;
>  }
>  
> +static ssize_t sysdata_taskname_enabled_store(struct config_item *item,
> +					      const char *buf, size_t count)
> +{
> +	struct netconsole_target *nt = to_target(item->ci_parent);
> +	bool taskname_enabled, curr;
> +	ssize_t ret;
> +
> +	ret = kstrtobool(buf, &taskname_enabled);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&dynamic_netconsole_mutex);
> +	curr = nt->sysdata_fields & SYSDATA_TASKNAME;

Minor nit:
	curr = !!(nt->sysdata_fields & SYSDATA_TASKNAME);

would be preferable, and more robust if later on other SYSDATA_ bits are
added, 'moving down' SYSDATA_TASKNAME definition.

Also it would be more consistent with previous usage in
`sysdata_taskname_enabled_show()`

Cheers,

Paolo

