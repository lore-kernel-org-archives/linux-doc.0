Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4772C2E8B9A
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040988; cv=none; b=ZCl+uJNfYNYO44XGVkFeXm+3cp8yiqo+WKdC5KhEhIKQ3Z4AkmIFkcNkQ+Jl+otXsQHvKA6OkKnAAfsH5SWb3ujxsB1ux1AVSjAPwuzceOEl1+e6UtmUfSBP2+ohq1I1XdgZ9T2sT8MAeGMuzHpnFQmSjHxr2Lt4UDoTOpy/2Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040988; c=relaxed/simple;
	bh=4X3PCzTUi+t6U3Xb46bofkEjcpM45wzgycTZWdrLVKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAZklRupHVIkkB9Syaz41wS64EGaKMNRqwo+fKf4nvczpe0OzKj4zUCyKgTPoHmaBBICCH/3VxjjftlpkkayYJbxmQ8l1rqPz8xHLyo+N96p5BnEyJZi4q3Ue1dJolFOpJcXrb2pMKmNel+nI2eWNDjpaYZRWLX8wKsBggzKBNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GLnzlatY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GLnzlatY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761040985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dh9VBIDeD1YW+winnmo1WNn0Q66KIhY7uXc+kNmNSe8=;
	b=GLnzlatY42FrIqeYIhY/ghCzjUFt3cmQeuj6tegzQik8DHK3MGofPC86Y7YXPLd72hNuC2
	URT7lGP6nM60X1A6x3pHMeFksiYR/puCPGraGloBKwucTjhRgC/9Qr89YuvXgzOUDHDNig
	iXbFT0NZdijTgFgyM4bR2xTA6FcVnRI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-JwpsC6Q8P0y4-MXN1DGigQ-1; Tue, 21 Oct 2025 06:03:03 -0400
X-MC-Unique: JwpsC6Q8P0y4-MXN1DGigQ-1
X-Mimecast-MFC-AGG-ID: JwpsC6Q8P0y4-MXN1DGigQ_1761040982
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-471148ad64aso22202605e9.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 03:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761040982; x=1761645782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dh9VBIDeD1YW+winnmo1WNn0Q66KIhY7uXc+kNmNSe8=;
        b=w7YcPYQXTF0XB/QEMoGwu7ppJSHw5qItbAhGb0CoBYuK/AYW3gGcZUOHrMzNBnfo05
         +HNsOmxzgS3El2v17WhP4wNzHFUFGf1ZSQQ4EL1sXAYBLUh6Ffnhfx20HqVfBcRSAaYY
         hVsPJG5r4BGYejac2Gt6T0w+4z23xL2kLcGRXDdEAc0qFVUBcv339gRpSvG2+x79tM0x
         9a5Ltvdv5oPRX8VE6UM32BOVBsvOpEQVgnEgSpyD21CF1zKmT4UyqTFGPlXnyqk1Lp68
         poUC7+agyxvBQ9a/67fIqdqAVFDVhi/jP7/qYGPhaRlBcCDDNEPoLjcwP8FdhdgZmvLl
         mtmA==
X-Forwarded-Encrypted: i=1; AJvYcCULnVUR5N/YWt5ZYJCOjuXXozZxKkguBf/m1QIRY5LZMIgL3Qz/Q+F4DjnHD+0fG+QKs5OZCREOWkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlEl6DoN7gAzOIEv7fXH98apzJvDT1ywxXJ4LarUjFrTbTET0V
	RWipshWeHIkDzwS+9biJx33k9t749+qF6r2ypEJ2fyt5jH1qxTk7nMMPSiT+gMeKZ7OuBHwBlv0
	b9i2ob3ICbYVj0aZmwwjlcaKynjVn3QMVIw4nPOAl/OsIUTA/Cji9PRpDEtB45A==
X-Gm-Gg: ASbGncuj65QwCawn8vzVcVwnfYO+Lo0YB7JFASVPy7xW5SPfo9SeCKwaOcP3FELmFhk
	tUehwY0PlP2sLwWWqFcsAASo6fEjDmnpWxwQnFK660Wtv8qQFmIlV5OBUUbiY7V2jYsBOIXRI/q
	T2FbgFQMeC+y0isHb3wgheiJRRLFAMQT8IMcI7yh/+x+Xd23/osEu7uIID4OERs4ye8iwGm0T2v
	bUD+h9ex3VJlsbyC9K+yDsGdWnJ67l3+pw0i9vtXJGW2yjNphg6BRmPACjqUFpx0BeMWXjOI9V4
	lGvUoAAsgeTN3+X1U+TavUJrCYEK4YTZkBrW8WmjWhSL38Es+Ys0hLOkks14kdEN8/E7zY3eEX9
	VyKRWLRdym0HuzyRfuHDbs+ke/zvk0SgT/rlkiDLynvYVPkY=
X-Received: by 2002:a05:600c:4e89:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-471178a236cmr113650975e9.10.1761040982368;
        Tue, 21 Oct 2025 03:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz0MIaxzEx8MqXNj7QakxLNajYTx+Vzevf5zqj7jjSvfZ+GyZLrKl3dgVva61Mp2iFS2TUNA==
X-Received: by 2002:a05:600c:4e89:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-471178a236cmr113650685e9.10.1761040981961;
        Tue, 21 Oct 2025 03:03:01 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471553f8a3asm218799785e9.16.2025.10.21.03.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:03:01 -0700 (PDT)
Message-ID: <465d5a38-abee-40b4-9026-aefaf47a943c@redhat.com>
Date: Tue, 21 Oct 2025 12:02:59 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v02 3/6] hinic3: Add NIC configuration ops
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
 <b5b92e0bdc2bd399c56ee356a7b6593f3ddf69c2.1760685059.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <b5b92e0bdc2bd399c56ee356a7b6593f3ddf69c2.1760685059.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/25 10:30 AM, Fan Gong wrote:
> @@ -368,12 +407,16 @@ static void hinic3_nic_remove(struct auxiliary_device *adev)
>  	netdev = nic_dev->netdev;
>  	unregister_netdev(netdev);
>  
> +	cancel_delayed_work_sync(&nic_dev->periodic_work);

periodic_work unconditionally reschedule itself, I think you shoudl use
disable_delayed_work_sync() here.

> +	destroy_workqueue(nic_dev->workq);
> +
>  	hinic3_update_nic_feature(nic_dev, 0);
>  	hinic3_set_nic_feature_to_hw(nic_dev);
>  	hinic3_sw_uninit(netdev);
>  
>  	hinic3_free_nic_io(nic_dev);
>  
> +	kfree(nic_dev->vlan_bitmap);
>  	free_netdev(netdev);
>  }

[...]> @@ -406,6 +418,8 @@ static void hinic3_vport_down(struct
net_device *netdev)
>  	netif_carrier_off(netdev);
>  	netif_tx_disable(netdev);
>  
> +	cancel_delayed_work_sync(&nic_dev->moderation_task);

Same here.

/P

