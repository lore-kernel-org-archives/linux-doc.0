Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BAE26E702
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067615; cv=none; b=Hi/gSy2WM3iDi27ZCOJKjElm8ouHnMyLOQb1004kT64Blppurg2+Ivzy7i107N2JDo+t1xM8jscUNf6ovVYEZ6Qh+7OEYM/JRZ9u8fDpCR9cBceQgxBLezDbgnENLhbhI7mceoRuee0jN4kTc1rDc/SIvDfe6WoyPjpTQTsos7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067615; c=relaxed/simple;
	bh=Ud7pIRA4Z7Jly5QQoFb0O3a9JDsvXMxAHCyvat1w0jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7QptqTDctwMnYjUmCr7ZqHFX87TsymSOiBEX/1z6kNcec7kADcCSG8BHFcWM2gxKHtpeBrfAbuva4k1U7hloAKEQNrqv0XKznUEGsiZGVX46pJQIxvPWTE4O+5dEDRR66EQ2BQB/dgowrmFxiL5ZklfvvkcI/EmVPCBeChWaFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ghL6TZui; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oHZjatak; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghL6TZui";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oHZjatak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764067613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYAYVMsEi+5ZQ8xw/QuX6lwcbwAan3VcdA5SJfLfCOE=;
	b=ghL6TZuivVoTNuDCLWiN+PfQCL3hHsDiZ2/hTRI9uDm5vq5+Bnej51ctDu0or2n/8R0OGf
	V/VuLhxiP15uAG8xI8tEN8cozt0GZ1EQCnspVQ8VQ9qVg7YUj5cPXLeRvS6Jf3jktPABGg
	iJj01/3u+99dm+N/mhNXzPRl0B6Uhv0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-gHfu6lImNYydj-ONMOj6SA-1; Tue, 25 Nov 2025 05:46:51 -0500
X-MC-Unique: gHfu6lImNYydj-ONMOj6SA-1
X-Mimecast-MFC-AGG-ID: gHfu6lImNYydj-ONMOj6SA_1764067610
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so51112695e9.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 02:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764067610; x=1764672410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OYAYVMsEi+5ZQ8xw/QuX6lwcbwAan3VcdA5SJfLfCOE=;
        b=oHZjatakuPeV9Qp6wNj7qNB1rm6l/8BHxa84ez2rXOUc2LDeUx9HDBdPNCKB4ybKIV
         bmBWs1Y2Y2O6+DAYYlDz/51mm9sRItFL7bXvGNWPPDci5WEu8XQVBt9LiqEzKwCkDut6
         Lmc3aK8sddHkX73etYNi8db2vBj4kYbU6p8DuWjQrLu7ehtOptml6GkCIhfCzFUb+DlM
         IBQdsUNcQaL0Pxg0mYVMh86+8PBoT9Sp4+6ozpTKxQXtEJOtIz9u9LnUJxeFKqYpYqLQ
         FFumIpWl3T8rc4Izdq77rVa3pmG/DSBmLuc++VXnrcficEbfmPoOHrQs41/seCQsh/ab
         SGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764067610; x=1764672410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYAYVMsEi+5ZQ8xw/QuX6lwcbwAan3VcdA5SJfLfCOE=;
        b=nll/QuRMO8eIihIh2Ch08QaTT6X8kEWgloOCPly9cuNL0QbzQ4Bv9sDZlOknxb0x7F
         G0kaPydj4dHaoWTe0kdqC5UqQAlnfJGdGZLUPWZy7mtzig1Tc42KySyJSt5jak/s6nL+
         ygaC2OpMf0bj8SX77lbAlDVa33FO+iG3+xsoAbNnt/OHFR0LCwtBQwqSVu1JB8JIXHCy
         33c6JudgTnEAk3cSnT9tup5hux/Ktal9LXmD47ViTGV7ALxsNWP8X+1A/ShYZjNHpk17
         5f5FHDyWpeX9u45tvRHb2MNN54wQn7xWqvEU7io3iZuNOD6aNoDpQ77ZALTVJ4cnp6JM
         YRcg==
X-Forwarded-Encrypted: i=1; AJvYcCX7IxWr1AzwIfPle3HtLsMSNs1K6s+zJqnSkdXWQ3F1Dw/HthgMmfwmuP9HexouYB7Bxdz8L6ghN5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrVFHbM/eGZ+wRs3gMh8qlRME28yDwcRNcwdDODJzJ6WTzmD34
	EU4rUunVm09WwGJlUpCoDGRI4CV+m8wh4T3wzAgiNt92kULz+x40KSErKxZJqJANaGLKXly4cjY
	TNCT4dv04ExBmX8yqlY1upDaLRjNuIErACUh9cPjfGZyhLOOIU4iBoHp17Zd83A==
X-Gm-Gg: ASbGnctOGz/ReDRxmTID9YHFT51LG1KI9YLuk9ag74C4VgQhq8q+cb4GgRXKJt2P2cN
	ERZnA62BckBHigymMiO5bMm/p7ktLxxxzh1Fp5hnq661Ncrv2y6xDVXxldviS9Mq+7IRu/Xd/6p
	aSaXLzZv3Ir9sOiR7sPqSoiC7IgULjZPsML+1PJQgDcU4IW6VeJC79zajAfOuHJ/ZZDGEB/IdiZ
	Q8fAS1or0JDINCBNlqU7vUb0XumgRw+lfwMTGPti6V5JrwSIdEXhdavGeGCbgjXIWVjGjynAf/J
	ubyAUvA8SuEJpfD4kahY33Olu7aPlUsTms7WJFoQnJlW278qZEPS86Yz0G2WmFQ9XZXYC5cUW+l
	JVLeVgDYqT0LEBw==
X-Received: by 2002:a05:600c:3ba4:b0:477:95a0:fe95 with SMTP id 5b1f17b1804b1-477c1123ae7mr218159535e9.24.1764067610107;
        Tue, 25 Nov 2025 02:46:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAJfWhKgd09T2car/i+8ldH3Cwh2rfeHteEUcaudCDaxCulu+WwtnB46ubUTkQ9KQ4y6UHUw==
X-Received: by 2002:a05:600c:3ba4:b0:477:95a0:fe95 with SMTP id 5b1f17b1804b1-477c1123ae7mr218158975e9.24.1764067609714;
        Tue, 25 Nov 2025 02:46:49 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm34315468f8f.40.2025.11.25.02.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 02:46:48 -0800 (PST)
Message-ID: <ea2ce128-537a-4718-aa70-d9192cfb94b8@redhat.com>
Date: Tue, 25 Nov 2025 11:46:46 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v07 8/9] hinic3: Add netdev notifier interfaces
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Markus Elfring <Markus.Elfring@web.de>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Luo Yang <luoyang82@h-partners.com>,
 Meny Yossefi <meny.yossefi@huawei.com>, Gur Stavi <gur.stavi@huawei.com>
References: <cover.1763555878.git.zhuyikai1@h-partners.com>
 <ff986bcacacf77b6d86a241139eedee9fce4145c.1763555878.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <ff986bcacacf77b6d86a241139eedee9fce4145c.1763555878.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/25 1:43 PM, Fan Gong wrote:
> Add netdev notifier interfaces.
> As we stipulate that netdevices with a vlan depth greater than 1
> should disable the offload feature, Layer 1 vlan netdevices use
> notifier to modify vlan_features.

As mentioned by Jakub in the previous revision, the net stack can send
packets with multiple stacked vlans. You need to implement
ndo_features_check(), check for the problematic packet layout there and
ev return a smaller features check excluding the relevant offloads.

> +static u16 hinic3_get_vlan_depth(struct net_device *netdev)
> +{
> +	u16 vlan_depth = 0;
> +
> +#if defined(CONFIG_VLAN_8021Q) || defined(CONFIG_VLAN_8021Q_MODULE)
> +	while (is_vlan_dev(netdev)) {
> +		netdev = vlan_dev_priv(netdev)->real_dev;
> +		vlan_depth++;
> +	}
> +#endif
> +	return vlan_depth;

AFAICS the above can return any number >=
HINIC3_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT ...

> +}
> +
> +static int hinic3_netdev_event(struct notifier_block *notifier,
> +			       unsigned long event, void *ptr)
> +{
> +	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(ndev);
> +	u16 vlan_depth;
> +
> +	if (!is_vlan_dev(ndev))
> +		return NOTIFY_DONE;
> +
> +	netdev_hold(ndev, &nic_dev->tracker, GFP_ATOMIC);
> +
> +	switch (event) {
> +	case NETDEV_REGISTER:
> +		vlan_depth = hinic3_get_vlan_depth(ndev);
> +		if (vlan_depth == HINIC3_MAX_VLAN_DEPTH_OFFLOAD_SUPPORT)

... so here you should use '>='> +			ndev->vlan_features &=
(~HINIC3_VLAN_CLEAR_OFFLOAD);
> +
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	netdev_put(ndev, &nic_dev->tracker);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block hinic3_netdev_notifier = {
> +	.notifier_call = hinic3_netdev_event,
> +};
> +
>  static void init_intr_coal_param(struct net_device *netdev)
>  {
>  	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> @@ -309,6 +364,36 @@ static int hinic3_set_default_hw_feature(struct net_device *netdev)
>  	return 0;
>  }
>  
> +static void hinic3_register_notifier(struct net_device *netdev)
> +{
> +	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
> +	int err;
> +
> +	mutex_lock(&hinic3_netdev_notifiers_mutex);
> +	hinic3_netdev_notifiers_ref_cnt++;
> +	if (hinic3_netdev_notifiers_ref_cnt == 1) {

Why do you need this notifier accounting? Instead you should be able to
call hinic3_register_notifier() only once.

/P

