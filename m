Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E72FD1A1
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814952; cv=none; b=cLsFOGPq/e61G1Wt3bDzz69rJY7UEoEfvoGLTa29+JMA8x/iXZNX9J4dB81BN7mRt1HOrwwhayANCZNiK1o+CmOmQQKs2fawcF5GN9e9nRPMohfynhEc5jdTBX5IOkKHeq7vPtmUee6Gq1Q5Op6/16CaPf8i2Hz8h/7WJ6C8gBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814952; c=relaxed/simple;
	bh=LhDkyJuwGceVSUcNSeREAlWI1ETmNdprkTkUlk7sbNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4iVBMeRKpyCCdyJCfZpXIBz4wfwRWaUxQlvjjh02S9d5ryhLabnEizmCE/ge7zcW+ktixPk0R5Y9FJLD/FeP8Y/MUmQiqdjsJ+p4s3yKTYvCgTv8W6yKaeQQsmzbJvywmBeey4cZOPk0ERzdjNC75mZg9DgkssBjrH1knurgi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9U9lZj6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9U9lZj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758814949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoWyNGq2+WEDxr2I8yMYU8hP5EE3I7EnsFFg3yAOwPM=;
	b=R9U9lZj6Z4bjbumJu6vLtKi+Twv5FhiCDYXP0/t3WbZ8xuxssOmaxmeKtLmACZx44wXp7q
	FgpAyh5WvkVmM7S0MQTiYUEAzX7y+8AhGCbeSAM0rtisPILbBJkpJOKv23irKfo8viDDoh
	DzjrDdbAjIPKJ9nthWbOLrYJ4Uoco24=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-oYxpede5MoOk1hILX2zRXA-1; Thu, 25 Sep 2025 11:42:28 -0400
X-MC-Unique: oYxpede5MoOk1hILX2zRXA-1
X-Mimecast-MFC-AGG-ID: oYxpede5MoOk1hILX2zRXA_1758814947
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e303235e8so8058605e9.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 08:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814947; x=1759419747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SoWyNGq2+WEDxr2I8yMYU8hP5EE3I7EnsFFg3yAOwPM=;
        b=cpjIZIuhTAI8iKZ83ghHyYLv2T8FqLKL8VA29PXTGMAEZbDlmiSCm+ugD/TXT9R3zH
         CdoA4RLjhkN8PZ4PXbnOqUMqe1bRr8lGoL79qyES5VyXZsDhJNZErjyYkOmPoIBvkjzt
         L/1gpxc209f9psQ03HlPItitUK/UdiefHRDcVjORIdvDr+xduBOs+bdID42IZab+QsKK
         HVEHj1CftHU2Gom6g4cTotV4KhkfPkHo2gtGjApsmYUxTvNE5aHQWxoOAqCv1BLVH8OD
         KI1e3InCAaMefP8sNGmqKamNxOsJcNW3mgrPFt9QFLCr/bkHEg3p+kwfDKGuq5R2MOSV
         0t4A==
X-Forwarded-Encrypted: i=1; AJvYcCUklivr8xDVr31KwCDIiAPrZwB9Vk4Irp0OHTSlyxwOMFSMBdiFbLDPqRyb3xysSRo+2fHVE1kwkXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdV77u6l0I5gBzjWgjRD2SptzYVyWIFUz/8OjvBBAslQBpWVPw
	9VPcTk0d8ZBVi2RrcmnHhpcT7hEgOTXCH3X9Ikizy3qa8um2F3XBW/xHgHtDRCbFoumT63Ay60m
	qUAu3rOidpYbqSjvsS+BqBXrGWFhvgLqyI/BREMMfwWkruWJgL1iN9FeFTLUjtw==
X-Gm-Gg: ASbGncsd3g3Rr22Wj4bywQcpWyQY/7B0zNhfrJAj8CZtvrNVawngUVF3p1YKL7VKX5W
	JDlf+PWYsDZkzjxpLtBV9uHnWnd5MO3XWM1nRE22q6Oc0qnixDSDejw6LPOLvXo1ru34RU9Zgf/
	MEjb5epg4ZHgO+3UCrDows7m3q0i2pAID+LIWQGArBH+87F92W/hOl0NymJsnCq9ShZv49G5lYd
	x/HqCu4dto26+/Jay960D4Mw+bU6oK3i+vUz3QJF3H7JVAOcCBWIMgTx3l63elnL/CX5isF11y9
	r11+hBrFJx89Hldgs2/ZVSAGN7VNIKpx7XJT2ziIPqKQMt4Hka1Fptql2kkPocu3od/ZldsjE3H
	RLj+07mmSqXYx
X-Received: by 2002:a05:600c:5290:b0:46e:394b:4991 with SMTP id 5b1f17b1804b1-46e394b4b1emr8852085e9.11.1758814946524;
        Thu, 25 Sep 2025 08:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY7q5cCEKSY5G+qO3YdgamXeF+8HAdkjrLynzDo9gNcCUiRa67Z8FZ6kXO+htyHwA/0LS8Aw==
X-Received: by 2002:a05:600c:5290:b0:46e:394b:4991 with SMTP id 5b1f17b1804b1-46e394b4b1emr8821345e9.11.1758814896033;
        Thu, 25 Sep 2025 08:41:36 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33bef4b4sm37808335e9.20.2025.09.25.08.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 08:41:31 -0700 (PDT)
Message-ID: <30a1dc4e-e1ef-43bd-8a63-7a8ff48297d2@redhat.com>
Date: Thu, 25 Sep 2025 17:41:29 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net/smc: handle -ENOMEM from
 smc_wr_alloc_link_mem gracefully
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 "D. Wythe" <alibuda@linux.alibaba.com>, Dust Li <dust.li@linux.alibaba.com>,
 Sidraya Jayagond <sidraya@linux.ibm.com>, Wenjia Zhang
 <wenjia@linux.ibm.com>, Mahanta Jambigi <mjambigi@linux.ibm.com>,
 Tony Lu <tonylu@linux.alibaba.com>, Wen Gu <guwen@linux.alibaba.com>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-s390@vger.kernel.org
References: <20250921214440.325325-1-pasic@linux.ibm.com>
 <20250921214440.325325-3-pasic@linux.ibm.com>
 <cd1c6040-0a8f-45fb-91aa-2df2c5ae085a@redhat.com>
 <20250925170524.7adc1aa3.pasic@linux.ibm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250925170524.7adc1aa3.pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/25 5:05 PM, Halil Pasic wrote:
> On Thu, 25 Sep 2025 11:40:40 +0200
> Paolo Abeni <pabeni@redhat.com> wrote:
> 
>>> +	do {
>>> +		rc = smc_ib_create_queue_pair(lnk);
>>> +		if (rc)
>>> +			goto dealloc_pd;
>>> +		rc = smc_wr_alloc_link_mem(lnk);
>>> +		if (!rc)
>>> +			break;
>>> +		else if (rc != -ENOMEM) /* give up */
>>> +			goto destroy_qp;
>>> +		/* retry with smaller ... */
>>> +		lnk->max_send_wr /= 2;
>>> +		lnk->max_recv_wr /= 2;
>>> +		/* ... unless droping below old SMC_WR_BUF_SIZE */
>>> +		if (lnk->max_send_wr < 16 || lnk->max_recv_wr < 48)
>>> +			goto destroy_qp;  
>>
>> If i.e. smc.sysctl_smcr_max_recv_wr == 2048, and
>> smc.sysctl_smcr_max_send_wr == 16, the above loop can give-up a little
>> too early - after the first failure. What about changing the termination
>> condition to:
>>
>> 	lnk->max_send_wr < 16 && lnk->max_recv_wr < 48
>>
>> and use 2 as a lower bound for both lnk->max_send_wr and lnk->max_recv_wr?
> 
> My intention was to preserve the ratio (max_recv_wr/max_send_wr) because 
> I assume that the optimal ratio is workload dependent, and that scaling
> both down at the same rate is easy to understand. And also to never dip
> below the old values to avoid regressions due to even less WR buffers
> than before the change.
> 
> I get your point, but as long as the ratio is kept I think the problem,
> if considered a problem is there to stay. For example for 
> smc.sysctl_smcr_max_recv_wr == 2048 and smc.sysctl_smcr_max_send_wr == 2
> we would still give up after the first failure even with 2 as a lower
> bound.
> 
> Let me also state that in my opinion giving up isn't that bad, because
> SMC-R is supposed to be an optimization, and we still have the TCP
> fallback. If we end up much worse than TCP because of back-off going
> overboard, that is probably worse than just giving up on SMC-R and
> going with TCP.
> 
> On the other hand, making the ratio change would make things more
> complicated, less predictable, and also possibly take more iterations.
> For example smc.sysctl_smcr_max_recv_wr == 2048 and
> smc.sysctl_smcr_max_send_wr == 2000.
> 
> So I would prefer sticking to the current logic.

Ok, makes sense to me. Please capture some of the above either in the
commit message or in a code comment.

Thanks,

Paolo

