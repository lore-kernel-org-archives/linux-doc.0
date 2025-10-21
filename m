Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A746E30E0F5
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038206; cv=none; b=e1f65+kNeIRbPV31lgaLOqdGQ8i42amu/emmR/FZVgBPMqluLT4s/6loW2ISq4ViN4V0NJHEP+zBtEB1udftgwxq96uaxcAMEWswp9Pwz0hItbNge7aieGyfMsLgBsaG+Gdt+jQ8gO+kTcJXDL3byncjBgDk5+BM1QNtoZK00I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038206; c=relaxed/simple;
	bh=8LQ/nb9TyND2NxmnDu4kFEGAHzYL+AlzQNRURq4dY1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uinu/+5DTCxl1IMDx6sIuhTySXfnUFNEtj3JBGHwLFrTobMxcf7HG+lLregypUCGB6pJkpFFfOtYl9w8zkG4WGnILMpNHMWjUWLvSxshx4I5IvXBXwxOZTc7dtblb/tH/iHEb9V4lQF1LoImwznkcP86vZHgwkuowimkMBIpr2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bPzqLSp1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bPzqLSp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761038202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwhZk0idClOTokwdt1kB9ie+33phkwv0ROh+5vx+wgc=;
	b=bPzqLSp1yWuIm91GAVViKb95lw1FRwOtja3UySW039vmeRVPzmyRUGD44YAjnuV73thRdR
	gvVl0X25Y71NVOHJcttVlPvC4zKu/rFQ004izzNf1lfpzemUjaYE5C0GVeIlffTk4UlGP4
	F+JH6Tni/MesrsnBgSUONyW+mE25gwU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-nc-G1L0gOMSWofqTq8hmMg-1; Tue, 21 Oct 2025 05:16:41 -0400
X-MC-Unique: nc-G1L0gOMSWofqTq8hmMg-1
X-Mimecast-MFC-AGG-ID: nc-G1L0gOMSWofqTq8hmMg_1761038200
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-40cfb98eddbso3073592f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 02:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038200; x=1761643000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JwhZk0idClOTokwdt1kB9ie+33phkwv0ROh+5vx+wgc=;
        b=dO+Nlf02lPBvu5i2SgsfRyn6doqvx2SnfavtuOMec0A48Sp3lpwautgL2NbZ6WAYDM
         tgR2YTMWMzwHzLVcEkjBJGFq1jeeRrT2MmJOWGWwyXAA3/qEJKZ8aaunnso60+phg7k3
         ayrxpw9r2U8GuSieyJyARW9rZBL82Ju7LiE0QStVwPejW0haTmtSudIAV+k1BiMg9Wxh
         0ofgrFwPI7LHvhIWVyr8maDR3Bj0HeQqauR8bLEB/gt0ODNHacxyw1WI3U3iuz+QTFi9
         H9Ou5rC++IzPDpF02hPcoz9h4supZ6LWdhDA9UFhLXHwX6T5djfUyUGbOYbXEY0P7m9T
         VKbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsi8jOyHBAayFman9xr4OqIW5kqWXsEgaJF+IWIAn9BCz+pp7gzzbiALkZi0e3BfRlhQ1KFhuHCF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvlFFIX+ebAT/8qTewsPGtquUaPa/bmGlEZBQMLhCp6yiY2NX
	8cj0d/7IJM8wwsIUcrAOuJHv54ITmNRHVMZt4fuFR0VcC98Ye799/ZPgUnmLFz6OoVt25cvl+cs
	OToF1b/xmgzLNtEDEjL0OtDoI3u4ACSRO9CuLXxuGIu3Q/eG3OUrZfgD5vsFxbpMyyACEsw==
X-Gm-Gg: ASbGnctygLkQUY4vaSl373tfm+VNJB/miXYfnJHXMvnOT40oCCKYwQviUIZuu1S4wXg
	+qQHdYzJIAisd2DGOFp8iUDmc3RmF2wSMshLbDOhDBzfz5TuF254tWSUshPikH9CB9EtfHOTaox
	AtJBE62nXtzIYz6hzxRRhMfR4/vIyXsdMMb2nDmX9qIvIm1zrI7ciGmZSUJBL3+5c1x5nd2SWHk
	aKHAxUrcyczpmGtA3vDvclkfl4P29QbMcB7nDaBS+lm2lZNYOTQ3k1FaJsnfRZ2kXHtd6JsIrwY
	AjrQjPKMDrCo68f9aKGhZ2kCZdPcEpKAaFPVX5+MVvJ5w5KjgqyD4oUrt/70CYPeQ+rMkWZ1aZu
	c8xwOwu+K/wRjSXOTO63Zfgo47CR4UTiviO6yBUvZ7rjWp64=
X-Received: by 2002:a05:6000:4b08:b0:427:55e:9a50 with SMTP id ffacd0b85a97d-427055e9a5fmr14239063f8f.22.1761038199797;
        Tue, 21 Oct 2025 02:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7KVV1+IVlCnxGJa+IEfd9KjImXec2CvlmcZyIJuKYZXgdCm3LfUWHQiFa8o4QTz6lM+WKlA==
X-Received: by 2002:a05:6000:4b08:b0:427:55e:9a50 with SMTP id ffacd0b85a97d-427055e9a5fmr14239037f8f.22.1761038199343;
        Tue, 21 Oct 2025 02:16:39 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm17338241f8f.10.2025.10.21.02.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:16:38 -0700 (PDT)
Message-ID: <1674cec4-4270-43e9-ba32-07d058a79b56@redhat.com>
Date: Tue, 21 Oct 2025 11:16:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v02 1/6] hinic3: Add PF framework
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Markus.Elfring@web.de, pavan.chebbi@broadcom.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Luo Yang <luoyang82@h-partners.com>,
 Meny Yossefi <meny.yossefi@huawei.com>, Gur Stavi <gur.stavi@huawei.com>
References: <cover.1760685059.git.zhuyikai1@h-partners.com>
 <beb30a91e7d26245e3736285fe4ceb52d4f9c418.1760685059.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <beb30a91e7d26245e3736285fe4ceb52d4f9c418.1760685059.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/25 10:30 AM, Fan Gong wrote:
> @@ -431,11 +436,40 @@ static int hinic3_init_comm_ch(struct hinic3_hwdev *hwdev)
>  
>  static void hinic3_uninit_comm_ch(struct hinic3_hwdev *hwdev)
>  {
> +	hinic3_set_pf_status(hwdev->hwif, HINIC3_PF_STATUS_INIT);
>  	hinic3_free_cmdqs_channel(hwdev);
>  	hinic3_set_func_svc_used_state(hwdev, COMM_FUNC_SVC_T_COMM, 0);
>  	free_base_mgmt_channel(hwdev);
>  }
>  
> +static void hinic3_auto_sync_time_work(struct work_struct *work)
> +{
> +	struct delayed_work *delay = to_delayed_work(work);
> +	struct hinic3_hwdev *hwdev;
> +
> +	hwdev = container_of(delay, struct hinic3_hwdev, sync_time_task);
> +	queue_delayed_work(hwdev->workq, &hwdev->sync_time_task,
> +			   msecs_to_jiffies(HINIC3_SYNFW_TIME_PERIOD));

It looks like the above unconditionally reschedule itself (also
apparently it's not sync-ing anything?!?)...

> +}
> +
> +static void hinic3_init_ppf_work(struct hinic3_hwdev *hwdev)
> +{
> +	if (hinic3_ppf_idx(hwdev) != hinic3_global_func_id(hwdev))
> +		return;
> +
> +	INIT_DELAYED_WORK(&hwdev->sync_time_task, hinic3_auto_sync_time_work);
> +	queue_delayed_work(hwdev->workq, &hwdev->sync_time_task,
> +			   msecs_to_jiffies(HINIC3_SYNFW_TIME_PERIOD));
> +}
> +
> +static void hinic3_free_ppf_work(struct hinic3_hwdev *hwdev)
> +{
> +	if (hinic3_ppf_idx(hwdev) != hinic3_global_func_id(hwdev))
> +		return;
> +
> +	cancel_delayed_work_sync(&hwdev->sync_time_task);

So here disable_delayed_work_sync() should be used.

> +}
> +
>  static DEFINE_IDA(hinic3_adev_ida);
>  
>  static int hinic3_adev_idx_alloc(void)
> @@ -498,15 +532,19 @@ int hinic3_init_hwdev(struct pci_dev *pdev)
>  		goto err_uninit_comm_ch;
>  	}
>  
> +	hinic3_init_ppf_work(hwdev);
> +
>  	err = hinic3_set_comm_features(hwdev, hwdev->features,
>  				       COMM_MAX_FEATURE_QWORD);
>  	if (err) {
>  		dev_err(hwdev->dev, "Failed to set comm features\n");
> -		goto err_uninit_comm_ch;
> +		goto err_free_ppf_work;
>  	}
>  
>  	return 0;
>  
> +err_free_ppf_work:
> +	hinic3_free_ppf_work(hwdev);

I don't see a similar call in the device cleanup?!?

/P

