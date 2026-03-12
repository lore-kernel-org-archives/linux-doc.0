Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5203BE63F
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317654; cv=none; b=Nc40b22vGduHCNllMJ8Zo8ab4Qdm8x8nIHh6A2fy0X0nhpVAO7dZHSmFVYsEAJ6keWfxXvgYjFulXyyrdoVfqqebn5yhL9IGXUVjjraj7kKdbrf84FNiqJxotZ9SDraJiK8SO9Rp5f3HGISz/JGLp52CUh16x12lyY1roKSsrIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317654; c=relaxed/simple;
	bh=/5WC4DtB+P33LkUFjXpc3RwWaJ5s/itNh44N3ZhlLkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iI3R/rHWtCGJRCaaMleUbEZXfnt7STgwn8BuG5YZZicBVPp+RsrozXrMPHg5B+l2LVdTKccSvrPS57C+weQuvwC61EIqelOfOTezdLWznhQVjYtAWy8YQmSOmhg38aWCKSnTNomenO7EovXCXaiompEu2TBmHkF+UE0B5nwU8B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O/TL+ZzM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V439FLrF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O/TL+ZzM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V439FLrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773317648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxIY7QiuvILNkB7fWkebqkMSgc5l1psPdBFz/v32Yew=;
	b=O/TL+ZzM0fGUbmMxCPz3eHEuMqUdoXtWOGlWIjGpUzbUVCCbDU9JmSV75wlQ202ou8CruN
	GoovoE5vAndgbdBFRoyrc12dZxb+NYLbDSfoBjFXce7kiKLfCtMPRGWOqX0Y4fnrkbMbWb
	fwxRbq7yV4qCK3hpnNp9lA5f3Wk0H68=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-OyftZnvhP_6_KHruSrrkUQ-1; Thu, 12 Mar 2026 08:14:07 -0400
X-MC-Unique: OyftZnvhP_6_KHruSrrkUQ-1
X-Mimecast-MFC-AGG-ID: OyftZnvhP_6_KHruSrrkUQ_1773317646
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4853b0af42aso12173335e9.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773317646; x=1773922446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxIY7QiuvILNkB7fWkebqkMSgc5l1psPdBFz/v32Yew=;
        b=V439FLrF8XBBlE3vLcl9B30V43O9fpcc9HlRhVEHpJkLHyXndCq04XxaMpboT6GZgc
         d5CyYhQcpllHE1hlTnABB+KDZhjDKZJN4LLqRSmyH5xeDr2MeTrIYL/4xSi/OKkG4vuQ
         X/NtIoBLkc+3FfA+3L32vbk8A6fc1JEPfn4fuETi643WVEI/9j+sBME6LS6Q8A//x9Yd
         lg3NOGVwEpXHtCbkteMauOnl+q51dAjidR3x1TZS1S2FFupkHzcqp43mHZ2sghP0y7Q5
         vN3uAUFowZBljocKKYMQvaaZ6th/+kSOJImVIw1riTwQJNdWCW+5o2z6P9SDv8Yn+60C
         uPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773317646; x=1773922446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxIY7QiuvILNkB7fWkebqkMSgc5l1psPdBFz/v32Yew=;
        b=GiaoOeFd73jpxh6gV7qjLiOKhYbdmk/ScoF9QCfqDECNJdLuNsF96eDb4iPBRze2Jx
         6kMUs/ZF++fZZv3U3pgBJIRFyQ12Z7y4sHzolGqUX+WnJWIUfpgFXgLS5D3IHAc6iA/j
         dfceDUBKvLCXB9B0RSKaJCaFWAGHPePkG8LxsEbeJM8xOZC5ovj4ZiiNOjqEFPwkNk4z
         /xH8ABPV+7uscXjAjvQNmPQhNMMc44Vr3d5Owt1g57g8mRFxG+rwEMjgfD4UqWcVNV6x
         +haq6ovF4Th6/AJkU4FicadlyhaCBp9D2qR/LpVncLpQXNvMP5V2MeDjnpG643pOmYch
         sJWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9W0iGP03MJoYNtKVuQkA2h11YBhlo9KFnKKvcHQYVrv4IlBAwUxYba6qzjbbUsg4WqTJ8Fcx0Vc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYO9PEZnF1XYBJOZkmTCm1EBwvuqKa/BI9hpUOpJ5IbyqpEtV6
	zoZf/BwOXo5Gkks4h8jH8LbOYGcV0E0gJmWxjW8xOxJjlJHSXQfI3Th5mtqHEe5EDTSIClIJgbx
	7V6vckgmjWhogPBonLPfHeG5a+gLm3XlqXtpmFM0o+4wz2h1i7VpYaRze57NNHg==
X-Gm-Gg: ATEYQzzPhZMljFtzrCPeKNJgnXYPSHx7lDATPBGmt5rn/yG2A1u36NJes3DSXNqfqGS
	cULeBe1HgkiO9E9oQAHkgAYTnK2lWZxPsm5KPYCgPhus5crwZilwoGG8wJIncK5SMicNXUcZ0e8
	Ix2pwqKePo10fkBGr5gtf3tZdVudGWuqct4vDWX1AYQNXRQrWqjNALNL6IysAVNuv9y/32pe18N
	CDtvaSvwDYYFdMgASQ3aF22GR2wLphIz46FYU3IGGSi09+g8DN80YKAfnrF89o9ZfLRSV2KkkVG
	w2qPOghJL7V32exuEMVNIQvw4XqDft45IqZfYQviu/TIx5zEdvt/RZuOz8UYbAXkEQ5pF96o5az
	OKjTQez0vYutOateJ+kx0Tx2xM/aMcMc/tRxpAnfgJrZnGHeDKgxe6pU=
X-Received: by 2002:a05:600c:46d3:b0:485:35ba:1d8a with SMTP id 5b1f17b1804b1-4854b111768mr102221225e9.27.1773317645574;
        Thu, 12 Mar 2026 05:14:05 -0700 (PDT)
X-Received: by 2002:a05:600c:46d3:b0:485:35ba:1d8a with SMTP id 5b1f17b1804b1-4854b111768mr102220745e9.27.1773317645070;
        Thu, 12 Mar 2026 05:14:05 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541acea11sm257299255e9.7.2026.03.12.05.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 05:14:04 -0700 (PDT)
Message-ID: <a4a6ae7d-fdab-4533-b56a-af9425bc2bb1@redhat.com>
Date: Thu, 12 Mar 2026 13:14:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 10/11] net/nebula-matrix: add common/ctrl dev
 init/reinit operation
To: "illusion.wang" <illusion.wang@nebula-matrix.com>,
 dimon.zhao@nebula-matrix.com, alvin.wang@nebula-matrix.com,
 sam.chen@nebula-matrix.com, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, corbet@lwn.net, kuba@kernel.org,
 linux-doc@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 vadim.fedorenko@linux.dev, lukas.bulwahn@redhat.com, edumazet@google.com,
 open list <linux-kernel@vger.kernel.org>
References: <20260310120959.22015-1-illusion.wang@nebula-matrix.com>
 <20260310120959.22015-11-illusion.wang@nebula-matrix.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260310120959.22015-11-illusion.wang@nebula-matrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/10/26 1:09 PM, illusion.wang wrote:
> +/* ----------  Dev init process  ---------- */
> +static int nbl_dev_setup_common_dev(struct nbl_adapter *adapter,
> +				    struct nbl_init_param *param)
> +{
> +	struct nbl_dev_mgt *dev_mgt = adapter->core.dev_mgt;
> +	struct nbl_dispatch_ops *disp_ops = dev_mgt->disp_ops_tbl->ops;
> +	struct nbl_dispatch_mgt *priv = dev_mgt->disp_ops_tbl->priv;
> +	struct nbl_common_info *common = dev_mgt->common;
> +	struct nbl_dev_common *common_dev;
> +	int ret;
> +
> +	common_dev = devm_kzalloc(&adapter->pdev->dev,
> +				  sizeof(struct nbl_dev_common), GFP_KERNEL);
> +	if (!common_dev)
> +		return -ENOMEM;
> +	common_dev->dev_mgt = dev_mgt;
> +
> +	ret = nbl_dev_setup_chan_queue(dev_mgt, NBL_CHAN_TYPE_MAILBOX);
> +	if (ret)
> +		return ret;
> +
> +	INIT_WORK(&common_dev->clean_mbx_task, nbl_dev_clean_mailbox_task);
> +	common->vsi_id = disp_ops->get_vsi_id(priv, 0, NBL_VSI_DATA);
> +	disp_ops->get_eth_id(priv, common->vsi_id, &common->eth_mode,
> +			     &common->eth_id, &common->logic_eth_id);
> +
> +	nbl_dev_register_chan_task(dev_mgt, NBL_CHAN_TYPE_MAILBOX,
> +				   &common_dev->clean_mbx_task);
> +
> +	dev_mgt->common_dev = common_dev;
> +	nbl_dev_init_msix_cnt(dev_mgt);
> +	return 0;
> +}

AI review says:

Is the 'param' parameter actually needed here? The function signature
declares it but never references it anywhere in the body. All the data
comes from 'adapter' and its sub-structures.

> +static int nbl_dev_setup_ctrl_dev(struct nbl_adapter *adapter,
> +				  struct nbl_init_param *param)
> +{
> +	struct nbl_dev_mgt *dev_mgt = adapter->core.dev_mgt;
> +	struct nbl_dispatch_ops *disp_ops = dev_mgt->disp_ops_tbl->ops;
> +	int i, ret;
> +
> +	ret = disp_ops->init_chip_module(dev_mgt->disp_ops_tbl->priv);
> +	if (ret)
> +		goto chip_init_fail;
> +
> +	for (i = 0; i < NBL_CHAN_TYPE_MAX; i++) {
> +		ret = nbl_dev_setup_chan_qinfo(dev_mgt, i);
> +		if (ret)
> +			goto setup_chan_q_fail;
> +	}
> +
> +	return 0;
> +setup_chan_q_fail:
> +	disp_ops->deinit_chip_module(dev_mgt->disp_ops_tbl->priv);
> +chip_init_fail:
> +	return ret;
> +}

The 'param' parameter is also unused in this function. This will produce
-Wunused-parameter warnings when compiled with W=1.

/P

