Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DCA32BF53
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755610619; cv=none; b=RawOHIG8lJt3gPo/LdfxgNkrIl1jguNc5b6MH0CzRm8S/grNG7Cr2Gctt+XgHYbijEdnMpMmgTP/4+HEMBVQOpMRIUyQNrhNeQqWzCjTUrdffIgJnqCBA8z8+0eG/QTFlrNDCRYt6G+GJpxP9hvVFW4KztgicjxSc/clSZtoENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755610619; c=relaxed/simple;
	bh=ses7cvDAgeLlulpRb7LhAvFTG6yY721+EVGzVkEhouY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hG/Na4LGBhFpY+QvneTAaoJUpxyhwCQvlyuyt+DRR8jtcjJ4TODsnmuNG2tyZvM4MXcRUV4yUvt89e3n9+0JW+zX9P32aqZcSwlIGq84uySzcNd87tyzE1DCx/fqBpL0iOErn5qBllZPdPbkX3/a+HrQ3Phy4JQITha4M/bKGSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W00kkBsg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W00kkBsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755610616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ug3+QB1kigmLvHdV+5tcNTutNLJ6/dvktxgLZPmeoKI=;
	b=W00kkBsg+YKhqV8IG2bmRnWgua80R3z6UlT/sWZKlZWWCosYUItLj7nvXXqSMI+RXRfHSI
	NOvJC6FZ3JXqBkvdsmIe6WPGuS9QYuoBM+EDIvTY9XC6BNt8BLmKxE/L75fEwWT7crXiHv
	nV8P043zvHzwdyyopy6cFpXYodCD+us=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-vR47AxqENeGiHfh4CY_qKg-1; Tue, 19 Aug 2025 09:36:55 -0400
X-MC-Unique: vR47AxqENeGiHfh4CY_qKg-1
X-Mimecast-MFC-AGG-ID: vR47AxqENeGiHfh4CY_qKg_1755610615
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109912a9cso239364051cf.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 06:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755610615; x=1756215415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ug3+QB1kigmLvHdV+5tcNTutNLJ6/dvktxgLZPmeoKI=;
        b=TF0IWQjYt+9tTqgoYLdb5tY/66AtHcWN5b+mtBYxGK0mKLnoBPKK4J6fu0JVmnBH6k
         6G6HyZs7ZYVhEyIAMlYYLLijpjktwMXbwZfdLoXbCoWmEc7c4giIXCTJicS1lRpHYiMG
         uL4OKETUF1/W+kb1iPHSlYNMN7/gtvwO94bFrqC0ruOiYeqlf5Za/IKhB84JaVKl8J9t
         xJ9/HTsfJUynCQ7BPVC9pJbipGF/MaDigfFdhRGmStwIavMfO9yv0BgbnLG0/rWGcq7C
         XbCpwdNRKfcw7NST0urfqN91iBwkIOx7z0+rWGik3NccWE1cufGOVNH8t/Sw36iecZ8j
         zHow==
X-Forwarded-Encrypted: i=1; AJvYcCX7ZZ7fTzuaPpT4n6HgPw27O0TpfRmMdpV99t81+5bHU1SGpXvHsXEP7PG1yLa8yuIs4eeO7gqHSkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJXsYb0bnD5bmkhjfmamRPKF3z0BkKHtqc8I175/gqQeLGZcFO
	GBPZHdOORF3RTzQQexEKG9aFis5Pmt6Z24l0oRtyvhJXBUpofBcsFDM0u8eSuzj/UXjljqZI+l3
	xZOWRgFto/6jlr0LUnbbLkYlbn8ki5Yd4H/gdyTLxr9Qq0Yas5GBrU8entmQE8A==
X-Gm-Gg: ASbGncsAHZy3+xQnRsd1f1pHYduSxsVTBS5vQHjrkjrS004MmdO3X3IwscQFPtPFKvY
	lvosEt8y5V33EgCCKmyWSKfFfoy3JWX4wpL6YU8Ee5F66KyAB9DB25Q9I48vAd8kee3UB5uvKu5
	9zmdJ+dlWbAQzmO+AjejP7nJQAKKa/ERF4Gc2WKIR4OIzhIWbA/hdCT2mIP23XxrUanCYsAAiGN
	a1QIPtrzs21BODVk+Y6ruOBN2850nPvTvdHiuiIOJzMD2lpJ33Q8hsMvXBxNYsim1Ds55WSZzKd
	9gEQKZQhauACsMRtm+jcxAjppIEjxa8/VHMUjbpC2+YupouEc5Lb918Wb93QjlXrHB5eWcq44W6
	JxzAKDtWC0sg=
X-Received: by 2002:a05:622a:4116:b0:4b0:75ed:bbf9 with SMTP id d75a77b69052e-4b286e18a44mr29730621cf.33.1755610614744;
        Tue, 19 Aug 2025 06:36:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcuikD+z1aBhWawTZB4Y8+HlULz2fYWJ/MqafPQ1f5iBf4eDR77H0oczmovLBnl4sHDv/v/Q==
X-Received: by 2002:a05:622a:4116:b0:4b0:75ed:bbf9 with SMTP id d75a77b69052e-4b286e18a44mr29730101cf.33.1755610614332;
        Tue, 19 Aug 2025 06:36:54 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de50e05sm66687671cf.53.2025.08.19.06.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:36:53 -0700 (PDT)
Message-ID: <37c9e5fe-e4c4-45f5-aae9-e949cfdc8902@redhat.com>
Date: Tue, 19 Aug 2025 15:36:48 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 6/8] hinic3: Mailbox framework
To: Fan Gong <gongfan1@huawei.com>, Zhu Yikai <zhuyikai1@h-partners.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <helgaas@kernel.org>,
 luosifu <luosifu@huawei.com>, Xin Guo <guoxin09@huawei.com>,
 Shen Chenyang <shenchenyang1@hisilicon.com>,
 Zhou Shuai <zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>,
 Shi Jing <shijing34@huawei.com>, Fu Guiming <fuguiming@h-partners.com>,
 Meny Yossefi <meny.yossefi@huawei.com>, Gur Stavi <gur.stavi@huawei.com>,
 Lee Trager <lee@trager.us>, Michael Ellerman <mpe@ellerman.id.au>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Suman Ghosh
 <sumang@marvell.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Joe Damato <jdamato@fastly.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <cover.1755176101.git.zhuyikai1@h-partners.com>
 <0b7c811da62813e757ac5261c336a9b7980c53a6.1755176101.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <0b7c811da62813e757ac5261c336a9b7980c53a6.1755176101.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/25 3:02 AM, Fan Gong wrote:
> +int hinic3_init_mbox(struct hinic3_hwdev *hwdev)
> +{
> +	struct hinic3_mbox *mbox;
> +	int err;
> +
> +	mbox = kzalloc(sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	err = hinic3_mbox_pre_init(hwdev, mbox);
> +	if (err)
> +		return err;

Given that all the other error paths resort to the usual goto statement,
this error handling is confusing (even there are no leak as
hinic3_mbox_pre_init() frees 'mbox' on error). Please use 'goto
err_kfree' here...

> +
> +	err = init_mgmt_msg_channel(mbox);
> +	if (err)
> +		goto err_destroy_workqueue;
> +
> +	err = hinic3_init_func_mbox_msg_channel(hwdev);
> +	if (err)
> +		goto err_uninit_mgmt_msg_ch;
> +
> +	err = alloc_mbox_wb_status(mbox);
> +	if (err) {
> +		dev_err(hwdev->dev, "Failed to alloc mbox write back status\n");
> +		goto err_uninit_func_mbox_msg_ch;
> +	}
> +
> +	prepare_send_mbox(mbox);
> +
> +	return 0;
> +
> +err_uninit_func_mbox_msg_ch:
> +	hinic3_uninit_func_mbox_msg_channel(hwdev);
> +
> +err_uninit_mgmt_msg_ch:
> +	uninit_mgmt_msg_channel(mbox);
> +
> +err_destroy_workqueue:
> +	destroy_workqueue(mbox->workq);

err_kfree:
> +	kfree(mbox);
> +
> +	return err;
> +}

And you can remove the kfree call from hinic3_mbox_pre_init().

/P

