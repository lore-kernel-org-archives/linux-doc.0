Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB0221F0C
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038714; cv=none; b=UTirHTR5+m+wkADYwr4ZC0BADEzKe4g83GC0mmD+84zaChqX7rA0rBexUbl0Jf82xtpqAfFgH222+oQQbXTFuBYhLQwhRd8ZTO694Dd10tkm5AtQZEHhrqMEZjq5bXoCTPI6F0zz/0gULiAzCghlosVHm63bRMnKbF1/3p3skV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038714; c=relaxed/simple;
	bh=70fh7l0TLwEingT0Dlsm17GX58QH+efSGCknR2mPUfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOlBcxEj3OK1IkNbVMJdsPM9UUghBLcCW5cTQkngZ5df3C2eFXqPBSjPbh81biyW0d6Rsd47AOfES8astCVbt5230tsWDAw2mPSd9oH57r55u+pPsSWUckZM7p4LlcLxVESKc/y8zCoyVj3ioM73iAj2iFqkNJbOgsSl3Fr9KFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Waxd1GKO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Waxd1GKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761038711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4RANMdE5VJt3ZJzx3yGMY3tj7r6cm2tCoc3fFUR1o9c=;
	b=Waxd1GKOmZORm9wGxuuEenpLRd2wDC8mu12YYx9O64VnlQmArRyZP/38VnH+9QcmD1ejBF
	wVVFwo9qQw+Gk8hULL+UHrAKCLqwUEFyhxfweH3nZtxRq7XGYlYiDDq4W2TTzyppgwI3+i
	FDXLq/h0uoF/SAtrHp8q4asvx5CPbM4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-CtaTFyhGPSm0q8UVj9BnlA-1; Tue, 21 Oct 2025 05:25:10 -0400
X-MC-Unique: CtaTFyhGPSm0q8UVj9BnlA-1
X-Mimecast-MFC-AGG-ID: CtaTFyhGPSm0q8UVj9BnlA_1761038709
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3ee888281c3so9800511f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 02:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761038709; x=1761643509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RANMdE5VJt3ZJzx3yGMY3tj7r6cm2tCoc3fFUR1o9c=;
        b=epwujE+mc/gRPCswQyQEFHOW5GcWmalgmVm3o+x6PnRsvlv6vnNzXn3n9X/Fa5/QBL
         DJEVua/l15Xlj9AfmjC81iAfMBZZgNDyyMdVpfhkQ45PYG+TQX95o3DfYsNKe59hwlXL
         2hD10RHyoW+O2oA9E6s7E6DewsQcU/TDGe9chZfVTTMxlPU+TOLzcRmVj2agoOqw8GKo
         9uLschV/KKR4YNY6j0BueGq5s31tqPYKOC/vs5xtiXssSKcXtVtkpuI6hieUirMk4cgD
         vGuaQ+zy1ob0peSle9KeYfaHWEe4oDX7j+eZMP1R5MLhPSM4+DG/p5kHXz5y6JcvY28k
         U7Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXGMhH7IieS1zpURFjbfz/4EBy0NR1yzs4jPe3BhvNTsX2j6s8WE6JZN77tVBg+ueyvr+jorVILia4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyctdkJb05pEYumW2v5xD9iV09iI1lv4aXSZc50P6eEKHi7HOmo
	deFc3ir/wT4RLtu5Kyrsp5UqIVCpRLb/sm5Kj2obWAqAqjVa8vGRIrYQqQAxOku3Nzzoe492q7q
	K2oFGnyebqauiQmdnSU2AOGgtIlq2RjOrZ7aXnHBxky6Y060wvO2sIcUYEUqYnA==
X-Gm-Gg: ASbGncsfNYA9m7VxFclOzf7Ob7+DmMJgeRlR92UhW+J/dSR+wvhGKkQTGlnXKyuz7ry
	nPrnTMh7BO5EA3RZGNAlmel9ycmifO6Tbrmze1Qzps5lvChOlFhAFXPPgbw1F9NV03uzThxoH8h
	unzkfE3HAE/E0pQs4xvo1gre/gJiQKk1Rn6CHUhdnNUfPpf1Zt3+yBHUrg8FuZm7FCEkyLWAiUK
	0R4edZbEI0dSz6+sQV9xOYgU3OTdfAtoiwgIWC3jpHTRHfbCz5kWNhNRgNQsUZx1KO8n+sC0xj0
	u1a8DegDqW3JMh8sN2MbMZyMIjAZ2upxzYTwmq6Co5V3tfZDR9Fc68n+vvLsUlVkVxd/9fqkRJZ
	Sax+r9GJJLebkPYL3/e6qHFxfaz2s5DB5eCdLhN8RRjINN20=
X-Received: by 2002:a05:6000:22c6:b0:3ec:db18:1695 with SMTP id ffacd0b85a97d-42704dc9395mr11530732f8f.45.1761038709183;
        Tue, 21 Oct 2025 02:25:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW/8VpN7+oRVVI2gacXOhu1lhYOkSBU8WbVYkhEZvqfdiTjdCOVwmyWkwuv1K6C+wnD9GcTg==
X-Received: by 2002:a05:6000:22c6:b0:3ec:db18:1695 with SMTP id ffacd0b85a97d-42704dc9395mr11530698f8f.45.1761038708787;
        Tue, 21 Oct 2025 02:25:08 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f88sm18692002f8f.7.2025.10.21.02.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:25:08 -0700 (PDT)
Message-ID: <c2534ab3-a843-43db-9447-19954467e2ed@redhat.com>
Date: Tue, 21 Oct 2025 11:25:00 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v02 2/6] hinic3: Add PF management interfaces
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
 <8ad645360ce86569ec9c2c6532441352c06bc44a.1760685059.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <8ad645360ce86569ec9c2c6532441352c06bc44a.1760685059.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/25 10:30 AM, Fan Gong wrote:
> diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_hwdev.h b/drivers/net/ethernet/huawei/hinic3/hinic3_hwdev.h
> index 78cface6ddd7..58c0c0b55097 100644
> --- a/drivers/net/ethernet/huawei/hinic3/hinic3_hwdev.h
> +++ b/drivers/net/ethernet/huawei/hinic3/hinic3_hwdev.h
> @@ -39,24 +39,25 @@ struct hinic3_pcidev {
>  };
>  
>  struct hinic3_hwdev {
> -	struct hinic3_pcidev        *adapter;
> -	struct pci_dev              *pdev;
> -	struct device               *dev;
> -	int                         dev_id;
> -	struct hinic3_hwif          *hwif;
> -	struct hinic3_cfg_mgmt_info *cfg_mgmt;
> -	struct hinic3_aeqs          *aeqs;
> -	struct hinic3_ceqs          *ceqs;
> -	struct hinic3_mbox          *mbox;
> -	struct hinic3_cmdqs         *cmdqs;
> -	struct delayed_work         sync_time_task;
> -	struct workqueue_struct     *workq;
> -	/* protect channel init and uninit */
> -	spinlock_t                  channel_lock;
> -	u64                         features[COMM_MAX_FEATURE_QWORD];
> -	u32                         wq_page_size;
> -	u8                          max_cmdq;
> -	ulong                       func_state;
> +	struct hinic3_pcidev         *adapter;
> +	struct pci_dev               *pdev;
> +	struct device                *dev;
> +	int                          dev_id;
> +	struct hinic3_hwif           *hwif;
> +	struct hinic3_cfg_mgmt_info  *cfg_mgmt;
> +	struct hinic3_aeqs           *aeqs;
> +	struct hinic3_ceqs           *ceqs;
> +	struct hinic3_mbox           *mbox;
> +	struct hinic3_msg_pf_to_mgmt *pf_to_mgmt;
> +	struct hinic3_cmdqs          *cmdqs;
> +	struct delayed_work          sync_time_task;
> +	struct workqueue_struct      *workq;
> +	/* protect hwdev channel init and uninit */
> +	spinlock_t                   channel_lock;
> +	u64                          features[COMM_MAX_FEATURE_QWORD];
> +	u32                          wq_page_size;
> +	u8                           max_cmdq;
> +	ulong                        func_state;

The above is a nice way to hide a single line addition. Please either
avoid the reformatting entirely (preferred) or do the re-indentation in
a separate pre-req patch.

/P

