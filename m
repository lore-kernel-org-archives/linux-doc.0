Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ABE28468C
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793248; cv=none; b=SCVtvbJOEJSS74TRce9vTqrReX6bn8UpZ4VVSHUZGhzd3vfQqEq2jaafpzG5SfrQnj8ClsIXq03/HEe5zhLAZHRBAV9SStCu26ce9Rp3dsR281ZzWflVIYsZFN+VGnLwHRc0x9x7wOGDIZLA+jeWXtC0FepmqGuWF0dGM+fYLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793248; c=relaxed/simple;
	bh=Ismx6yKHMCrWAtzO1V+zHu5cuIvgP8WRaG1URDkbiUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g3iWmtQqwD/8DSAymE8lJSD3FO7txQEt9Y25U+mXH4NEkac7BbHMf5pi2yu292DVnQZMRHoK69xhQiUdQKI3i7Xr5jvYfyEBydyPqdqYuZ4a1lK5tCBW1l5/ayOwoWZq96u6N/1v8AQOZYaHSvxI3DG0wlXCfFnizx6GzrVSTaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VM7nNPhU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VM7nNPhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758793246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2OC7o0y5NqDwPgeMke0PyEOvsv7ZIPwi/d2lkMqYclw=;
	b=VM7nNPhUVAk4Qs0rVVAmraMhV5ziteRXcRsjBOLHaOMjjc4E87QalvmqJGk16mNJNiamkI
	G0nfyRFDqsYqlKa7KOo9/qpKA6HpgANVOxoXFUzqXx9DPlTy1Ly+Zj4v/b+iTGEGTtGxKA
	T8tqfyY1zfmDcaab4okpd6icCpps9dk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-UDDLhS3mMhe3T3-PT9Fr5w-1; Thu, 25 Sep 2025 05:40:44 -0400
X-MC-Unique: UDDLhS3mMhe3T3-PT9Fr5w-1
X-Mimecast-MFC-AGG-ID: UDDLhS3mMhe3T3-PT9Fr5w_1758793243
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3f3c118cbb3so513158f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 02:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758793243; x=1759398043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2OC7o0y5NqDwPgeMke0PyEOvsv7ZIPwi/d2lkMqYclw=;
        b=QAgdapc+aCDgyNnzWZvn5WTSqIzN4d27CGpggwAplYOG67mvpQMzSv3Wx3Ly0AG2q3
         LtHDkatI3J/6EOQKw1StQvi37A2PY+wGLcPCFk7AGWZ2fbbVWQwSwG9hgrnsirWLVc6x
         Fg4jro4Acmcvbv0WBou82wE5Q02kKFBqnSGPZ3Ge/ResQGg6zqhxtXap8PKqewufGzzj
         pRXZ3hieVET0hHp1yXin1c9Xmz9ubotIcsdRtfke1HyL+oLuNpiefGcmJX/VCLRbFHhP
         SHpB4gMLP2SYu91x70H84VMo4kBPY1sp8Lvr7Y80Z+jK+cZPRzj6161OV+5m0VVW3bZ5
         P50g==
X-Forwarded-Encrypted: i=1; AJvYcCWyDEVjb3zxx1vxEF0Ps7DumQ2EXESgBTLXK2vsTzYcGEHt5Z9Yx6KqhqFJnIJn2u9vTi9aPfLXHgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1Iv8nj5znbZzmtnx0aL2Gu8JBaaxRhCBbLCgrJs6heUdhhIe
	JSJcsu/JINagxLAzAvgOW2y68WbT28qToajHqrFkDJyAaM7lFzQITnysxqVxmsuHeRRiy1fjfWl
	H5FA2jb+3qrUrP2nTkEtHiT5Sjd9fJLTAs1n7ymWFx/nsGAssPJUb4uOnkHZCdg==
X-Gm-Gg: ASbGncshVF4NzEq3xRCAFXStynUrB6CwQZd2u57RPiaSUqoWHO7OdGv6r8S7DKXy40J
	MeOxlg/M+nbvgjbwh2TchXkYie61tNXKOSo6yRpfuBbPZstcJO+sor7vUabuKi1WZiN98Abfi1E
	0+njt5zzMelUiW/fJbQTDz7K63+2pefb4T6shEQlEspiSqHprTp0TWPwgPOJUndl8sqx2gNOTtc
	AD/38US5Ir0BDF+gj3yyQaclmDyEY+gNrjZOy3RDpRwnAzAZYs2acuwQdR9HlBaW/fyJWUAAWF7
	oryzK8rI29Hz7300dVbbxcMcseVJqXH85Yi0Dg1XMkgH3G4d9Mdi5Cp75An+mavxftGSAP6N+4W
	bAjhVXfPqsZUx
X-Received: by 2002:a05:6000:3102:b0:405:3028:1bce with SMTP id ffacd0b85a97d-40e4886dea7mr2786413f8f.32.1758793243373;
        Thu, 25 Sep 2025 02:40:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrxeBRnYoMGSl0W8MRr9kJ35noutUmBpUjFhjol2reKWsJgQ/uDYSHftZAJXtiFbd/sSnPig==
X-Received: by 2002:a05:6000:3102:b0:405:3028:1bce with SMTP id ffacd0b85a97d-40e4886dea7mr2786379f8f.32.1758793242960;
        Thu, 25 Sep 2025 02:40:42 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33b9e902sm25724495e9.5.2025.09.25.02.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:40:42 -0700 (PDT)
Message-ID: <cd1c6040-0a8f-45fb-91aa-2df2c5ae085a@redhat.com>
Date: Thu, 25 Sep 2025 11:40:40 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net/smc: handle -ENOMEM from
 smc_wr_alloc_link_mem gracefully
To: Halil Pasic <pasic@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, "D. Wythe" <alibuda@linux.alibaba.com>,
 Dust Li <dust.li@linux.alibaba.com>, Sidraya Jayagond
 <sidraya@linux.ibm.com>, Wenjia Zhang <wenjia@linux.ibm.com>,
 Mahanta Jambigi <mjambigi@linux.ibm.com>, Tony Lu
 <tonylu@linux.alibaba.com>, Wen Gu <guwen@linux.alibaba.com>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-s390@vger.kernel.org
References: <20250921214440.325325-1-pasic@linux.ibm.com>
 <20250921214440.325325-3-pasic@linux.ibm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250921214440.325325-3-pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/25 11:44 PM, Halil Pasic wrote:
> @@ -836,27 +838,39 @@ int smcr_link_init(struct smc_link_group *lgr, struct smc_link *lnk,
>  	rc = smc_llc_link_init(lnk);
>  	if (rc)
>  		goto out;
> -	rc = smc_wr_alloc_link_mem(lnk);
> -	if (rc)
> -		goto clear_llc_lnk;
>  	rc = smc_ib_create_protection_domain(lnk);
>  	if (rc)
> -		goto free_link_mem;
> -	rc = smc_ib_create_queue_pair(lnk);
> -	if (rc)
> -		goto dealloc_pd;
> +		goto clear_llc_lnk;
> +	do {
> +		rc = smc_ib_create_queue_pair(lnk);
> +		if (rc)
> +			goto dealloc_pd;
> +		rc = smc_wr_alloc_link_mem(lnk);
> +		if (!rc)
> +			break;
> +		else if (rc != -ENOMEM) /* give up */
> +			goto destroy_qp;
> +		/* retry with smaller ... */
> +		lnk->max_send_wr /= 2;
> +		lnk->max_recv_wr /= 2;
> +		/* ... unless droping below old SMC_WR_BUF_SIZE */
> +		if (lnk->max_send_wr < 16 || lnk->max_recv_wr < 48)
> +			goto destroy_qp;

If i.e. smc.sysctl_smcr_max_recv_wr == 2048, and
smc.sysctl_smcr_max_send_wr == 16, the above loop can give-up a little
too early - after the first failure. What about changing the termination
condition to:

	lnk->max_send_wr < 16 && lnk->max_recv_wr < 48

and use 2 as a lower bound for both lnk->max_send_wr and lnk->max_recv_wr?

Thanks,

Paolo

