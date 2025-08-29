Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441891DF256
	for <linux-doc@vger.kernel.org>; Fri, 29 Aug 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463989; cv=none; b=en6me5kgrUnKmKbX/75+WoZJpRSCYTP59zzCuUAsbt5Z39T2kZsNJEU03oac39mQ4cdgK/omFNwV+3NGn+fb0K8OPDzxJhHwEJzviyOt+sa0iw4k5NLXcQtaSxq2J2oMOyhEsP/aLVXBxDoYlDkMsmJS4/pKiDavaco5wHkfQvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463989; c=relaxed/simple;
	bh=3lzTmy7xVBD89zOuvWh8RpEaNftCOkjhJm+gpVv0E3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lC2QktHuoZKcN8HuDqZ0Mxhhls498U8vzwc6hQIPr44qh4x2bMIxHFeQfS5p4ppQm0RPN0nwG9yuinZjeDVyUo9UG9C9p1MjbqRBh7TkUtqQF/tvvIBPa8YFnddJ2SwNfyDJ6JfpLVGsc+z5C0F3S74N/3Wa8UJ6OCEVbpPaVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IiNvMV5Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IiNvMV5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756463987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x28gXOyrOBBwbn+7Hidu1o/2yPp/npkyaA2lBQwPLSY=;
	b=IiNvMV5Zz4YZfCq9wPKdkEWWmY5Jg0mK0aPQDTZ2Y0H8D7lfCaZT/jE0We+yfWiGtO+I3R
	E13w2t5rkw9XkDnbC3AMhzuEuaDYfIN0tvksdMY0yL6ZCe2DS6+rBpnOoyTHACYFgFQ7Q1
	0a/sW9B1in+B7w29ANar3uXCCGQFlwc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-w12s1WqAPhO50-XDH3wlIA-1; Fri,
 29 Aug 2025 06:39:43 -0400
X-MC-Unique: w12s1WqAPhO50-XDH3wlIA-1
X-Mimecast-MFC-AGG-ID: w12s1WqAPhO50-XDH3wlIA_1756463982
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9D7D19560B6;
	Fri, 29 Aug 2025 10:39:40 +0000 (UTC)
Received: from [10.45.224.190] (unknown [10.45.224.190])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F36801800291;
	Fri, 29 Aug 2025 10:39:31 +0000 (UTC)
Message-ID: <94247dbc-4be8-4464-ad3e-5b81bba5f70b@redhat.com>
Date: Fri, 29 Aug 2025 12:39:30 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/5] dpll: zl3073x: Add firmware loading
 functionality
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Prathosh Satish <Prathosh.Satish@microchip.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20250813174408.1146717-1-ivecera@redhat.com>
 <20250813174408.1146717-4-ivecera@redhat.com>
 <20250818192203.364c73b1@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20250818192203.364c73b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Kuba,
sorry for the late response... (I was on PTO last 2 weeks).

On 19. 08. 25 4:22 dop., Jakub Kicinski wrote:
> On Wed, 13 Aug 2025 19:44:06 +0200 Ivan Vecera wrote:
>> +#define ZL3073X_FW_ERR_MSG(_zldev, _extack, _msg, ...)			\
>> +	do {								\
>> +		dev_err((_zldev)->dev, ZL3073X_FW_ERR_PFX _msg "\n",	\
>> +			## __VA_ARGS__);				\
>> +		NL_SET_ERR_MSG_FMT_MOD((_extack),			\
>> +				       ZL3073X_FW_ERR_PFX _msg,		\
>> +				       ## __VA_ARGS__);			\
>> +	} while (0)
> 
> Please don't duplicate the messages to the logs.
> If devlink error reporting doesn't work it needs to be fixed
> in the core.

OK, will fix this.

>> +static ssize_t
>> +zl3073x_fw_component_load(struct zl3073x_dev *zldev,
>> +			  struct zl3073x_fw_component **pcomp,
>> +			  const char **psrc, size_t *psize,
>> +			  struct netlink_ext_ack *extack)
>> +{
>> +	const struct zl3073x_fw_component_info *info;
>> +	struct zl3073x_fw_component *comp = NULL;
>> +	struct device *dev = zldev->dev;
>> +	enum zl3073x_fw_component_id id;
>> +	char buf[32], name[16];
>> +	u32 count, size, *dest;
>> +	int pos, rc;
>> +
>> +	/* Fetch image name and size from input */
>> +	strscpy(buf, *psrc, min(sizeof(buf), *psize));
>> +	rc = sscanf(buf, "%15s %u %n", name, &count, &pos);
>> +	if (!rc) {
>> +		/* No more data */
>> +		return 0;
>> +	} else if (rc == 1) {
>> +		ZL3073X_FW_ERR_MSG(zldev, extack, "invalid component size");
>> +		return -EINVAL;
>> +	}
>> +	*psrc += pos;
>> +	*psize -= pos;
> 
> what if pos > *psize ? I think the parsing needs more care.

This should not happen. strscpy copies min(32, *psize) from the source
to buf and sscanf parses buf and fills pos by index from the buf.
The pos cannot be greater than *psize...or did I miss something?

Thanks,
Ivan

