Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9742C2341
	for <linux-doc@vger.kernel.org>; Sat,  6 Sep 2025 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757141870; cv=none; b=mKOk8cNwuaDiXDKQMcSGazjfqYZO8BUZNNOaB+6llsHSD7ro9i5k8xXSuWKkU/+ff5I0nCYHXf5LaD/hyFSkdqF2Pk0/mdieHtifavAEBrI5xP5Z5MmzBJ3x2h9pdgw8zMHXQH1NYTyyDmYZixL66UTFUxvjiuNZlq5IBupkSfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757141870; c=relaxed/simple;
	bh=ZdjKkfJoHiNakSwH8vDlKRd1pmuPHtWQLHwJ3ze4QIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUvO8eWv1MZVB8vkgiVwHeRj+wQxItLbvJDcpIVJgdcRUTx7fU/kGbZyDb3kWyEnUaFFy7TiYso5P9aQ/3hIhmYv5ZzLfCsyeFL3yWl32Eq14UTeEKCU6anV6LVrX65MdTfqk0cTqCz4+S7RGIeHrqkM5vHKN7AHTSoF5mLrerM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MQVx3DSk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MQVx3DSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757141868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AMjDlR0sGCSb1S5XkqRhY0gCtJvKgV/eSaD7F6oVPO0=;
	b=MQVx3DSky79zmGThMagIXc7+QkOgzV6nbRUwNlhY2PG/rA3MpdLZFVmTMqrSvW4fkFOiB/
	JEPDmNmVCyuWgjhXpFHwnyFcQrVbxkP6XAig3Ov4RxODZeS2Bwape3ZShWFRDamAKQVihG
	0zoXAItnCsgNPNX2vvrRKPQuk8XYqYg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-DJjOIiObODGWwQ0SudJ6NQ-1; Sat,
 06 Sep 2025 02:57:46 -0400
X-MC-Unique: DJjOIiObODGWwQ0SudJ6NQ-1
X-Mimecast-MFC-AGG-ID: DJjOIiObODGWwQ0SudJ6NQ_1757141864
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B57119560B2;
	Sat,  6 Sep 2025 06:57:43 +0000 (UTC)
Received: from [10.45.224.31] (unknown [10.45.224.31])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 630641955F24;
	Sat,  6 Sep 2025 06:57:39 +0000 (UTC)
Message-ID: <2948c2d9-1600-444d-89c9-c129ddfba109@redhat.com>
Date: Sat, 6 Sep 2025 08:57:37 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/5] dpll: zl3073x: Add low-level flash
 functions
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Prathosh Satish <Prathosh.Satish@microchip.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20250903100900.8470-1-ivecera@redhat.com>
 <20250903100900.8470-3-ivecera@redhat.com>
 <20250905191905.05476586@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20250905191905.05476586@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17



On 06. 09. 25 4:19 dop., Jakub Kicinski wrote:
> On Wed,  3 Sep 2025 12:08:57 +0200 Ivan Vecera wrote:
>> +/**
>> + * zl3073x_flash_download_block - Download image block to device memory
>> + * @zldev: zl3073x device structure
>> + * @image: image to be downloaded
>> + * @start: start position (in 32-bit words)
>> + * @size: size to download (in 32-bit words)
>> + * @extack: netlink extack pointer to report errors
>> + *
>> + * Returns 0 in case of success or negative value otherwise.
>> + */
>> +static int
>> +zl3073x_flash_download(struct zl3073x_dev *zldev, const char *component,
>> +		       u32 addr, const void *data, size_t size,
>> +		       struct netlink_ext_ack *extack)
> 
> function name doesn't match kdoc, and "Returns" -> "Return:"
> 
> No idea why the kernel-doc script doesn't catch this..

Will fix...

>> +		rc = zl3073x_write_hwreg(zldev, addr, *(const u32 *)ptr);
> 
> you're sure data is 4B aligned? Otherwise get_unaligned()

Yes, this should be always aligned but you are right, using
get_unaligned() here is the safest.

>> +		if (time_after(jiffies, timeout)) {
> 
> time_after_jiffies() ?

I miss that macros, thanks for pointing out.

Anyway:
time_after(jiffies,...) -> time_is_before_jiffies(...)

Will use.

>> +			if (signal_pending(current)) {
>> +				ZL_FLASH_ERR_MSG(extack,
>> +						 "Flashing interrupted");
>> +				return -EINTR;
>> +			}
> 
> Is the flash dual-banked? Normally random signals interrupting flashing
> is recipe for bricked parts.

The download is safe operation... During this the driver downloads
block from host memory to device memory (RAM) and it is safe to break
this operation. (What should not be interrupted is flash itself (device
memory to internal flash memory).

> A little odd to use "timeout" for periodic check. check_time?

Will rename.

>> +	/* Return if no error occurred */
>> +	if (!count)
>> +		return 0;
> 
> Did I already accus^W ask you if AI helped you write this ? :D
> This level of commenting makes me think of code generators :)

:-D no, I didn't really use AI for code generation :-D

As the zl3073x is the first standalone DPLL driver I tried from the
start to write well commented code :-) But maybe I overdid it a bit :-)

> +	/* Enable host control */
> +	rc = zl3073x_flash_host_ctrl_enable(zldev);
> +	if (rc) {
> +		ZL_FLASH_ERR_MSG(extack, "cannot enable host control");
> +		goto error;
> +	}
> +
> +	zl3073x_devlink_flash_notify(zldev, "Flash mode enabled", "utility",
> +				     0, 0);
> +
> +	return 0;
> +
> +error:
> +	rc = zl3073x_flash_mode_leave(zldev, extack);
> +	if (rc)
> +		ZL_FLASH_ERR_MSG(extack,
> +				 "failed to switch back to normal mode");
> +
> +	return rc;
> 
> Should we be overriding rc here if there was an error on entering
> but we cleanly left? If so that _is_ worth commenting on..

Oops, this is an error, we should not override final rc here... Instead
of this the driver should make its best to revert back to normal mode.

Will fix this.

Thanks for the review,
Ivan

