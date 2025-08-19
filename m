Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3782EB85E
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609733; cv=none; b=JXeSFVyt06FaZyel6U1WzzcyXEOBoTI053Jcgzp30fe77xNaTrGKyTi6AxsMvKZIFUwO+VCcv3Onbvpcf+6nk4KsHfflHug7NNX1++SGr3lIIbV72PjGHcctVyQ4WoJ/bIA7a7ubjKn+4R3ZOg6JnboJjQ2YJIC/ECPF1DdScLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609733; c=relaxed/simple;
	bh=YGquTGErfZMK4Z8mlgqCJLtgMJkYfu1aCh6sBFItdVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsVBU27CTA+onHn7C4Nj//vWlmRGo80DoY7+m3m7QhQwvAfBcWEl1XwqSrpE6fqpJ62KDBGcH51FQAeuS1Lj16bpF9qH4Gnbt+RlL675zUIBRcWEcCIJFyRgUuCIxT5iBRKE+vfEupQpk3g0IThClv3bFGcyjBilqQ3x/RUMK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQAdYmvL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQAdYmvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755609731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nywEW2vKiMccWYiE9n53wSFHnhrNtVEYY4SxrJi2fuI=;
	b=eQAdYmvL95Lqd5ITzVEqumkwp0DR4dRxAg3Yzn8hLICAfKbVuVNuKQk26YkfhOZSOtjrKs
	qm4xjW/VgbqoS0sYYVksl0h0PPVLI8tmZCybelMMzGfQasPen/RfkZ4s9JKhv0X5Ic5RH0
	W5bnKkO6zotVxtRfKCGuzkk1yYTc3nI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-p59-dcE1PjiQ6qh4uL-Ipg-1; Tue, 19 Aug 2025 09:22:08 -0400
X-MC-Unique: p59-dcE1PjiQ6qh4uL-Ipg-1
X-Mimecast-MFC-AGG-ID: p59-dcE1PjiQ6qh4uL-Ipg_1755609728
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e8704a883cso1342867885a.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 06:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609727; x=1756214527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nywEW2vKiMccWYiE9n53wSFHnhrNtVEYY4SxrJi2fuI=;
        b=Wfgt30x4zgqAx1OPLBNIvXd94fG8JhFiFLTvOUWuMIa/TR2kzEqMEa1l4UIjjbJRrz
         Ut+0cKZL/GwRf7PWfi7NHFKhd6VX1Hkl3grMnW2naGEd9n8Dn6A2aooJvjySgyZiY2yK
         y0oAJrPpBtcNfA26KHF+wFSqjYprbLLVzhYCaS0VA6r9aJg0JsnglBlkgmUjwIlC+/kE
         UKQ7Lc4PNBU/xlI0kjD830Re4sq2VAEO2WkFlou9rv+7imdiMTljm/o9IFceN3W80cZp
         gsROxDYdIucOnFfAOc2RmiXENGHG5Bd1gqFrb3/d4e5bSizYjMcvFbE+HMHpitBLyDZW
         kxvw==
X-Forwarded-Encrypted: i=1; AJvYcCVI7CAI6IqMjjqPqgUXMHWagfyYbqPYP23WTrsRQns2UTISLeKBYX2jj3R8Avp4FVYpnwiUTA9TzmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbxBiO9hUnQCE/CpKO2WS9lUyQ9FiHkr5mgWkOW1tmG/NCdSw7
	nurUO2EOYxQFg+hSCDwt9cO9npiWcqZFxZFqpIEPRQ7AioIP/U+oqZp6cg7SRkmDpAWojaViiAu
	NfFgT2gk6q9/PnZiXE98o6gS+y4uSxZytBsB3oO4mEKk9fhSruMEUeNAT2BFuaA==
X-Gm-Gg: ASbGncsRK8L2UXg+DymWpD3VQ+NCLvSBYYejgkkXPmYKbw/CqczNnc4s6L3s+xAj7fL
	xZhE4ZzeRkbOjs8XkXcz4NG5EOXwaC/oVvAbzusDGJtmKwUncy9nGHQoUoYKYEv/5viKI4+mHMI
	TV+lYyq7GAlYmYRp5IbN9Znp984rCmzl4xawxUYZ7kXGAY69eRc7cevFXeidhU2WiW6m74UIyvD
	+w5Kb92xBpclDEHeE2jLbzDdECN6Xu7vNzPHpdyhECmLJxBxnHTvsvPTh6uiFxMOiEEqcWW4WSI
	aAAA5A9qt1ygQRp6iibQBvyNDflbex5tnE9rv5dX0qUlreO3JmD5MNsYPQS3l2CYt+8CuqTj+km
	+MS/IxWN4txk=
X-Received: by 2002:a05:620a:a48c:b0:7e9:f81f:cea5 with SMTP id af79cd13be357-7e9f81fd1d2mr96852285a.83.1755609727393;
        Tue, 19 Aug 2025 06:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6F35u3T+eC+dnHWwSRfGoWO9IfLlxyoh2o8GvCu/FrVeuc4uL/zQUhn/LcS2bYYks3YKIOA==
X-Received: by 2002:a05:620a:a48c:b0:7e9:f81f:cea5 with SMTP id af79cd13be357-7e9f81fd1d2mr96848185a.83.1755609726732;
        Tue, 19 Aug 2025 06:22:06 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de50b31sm67890121cf.51.2025.08.19.06.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:22:06 -0700 (PDT)
Message-ID: <715111b5-6cd1-45c0-b398-b5d8bec7f24f@redhat.com>
Date: Tue, 19 Aug 2025 15:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 1/8] hinic3: Async Event Queue interfaces
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
 <4a3fbb9455305898257760e2a13cc072b475489b.1755176101.git.zhuyikai1@h-partners.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <4a3fbb9455305898257760e2a13cc072b475489b.1755176101.git.zhuyikai1@h-partners.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/25 3:01 AM, Fan Gong wrote:
> +static void remove_eq(struct hinic3_eq *eq)
> +{
> +	hinic3_set_msix_state(eq->hwdev, eq->msix_entry_idx,
> +			      HINIC3_MSIX_DISABLE);
> +	free_irq(eq->irq_id, eq);
> +	/* Indirect access should set q_id first */
> +	hinic3_hwif_write_reg(eq->hwdev->hwif,
> +			      HINIC3_EQ_INDIR_IDX_ADDR(eq->type),
> +			      eq->q_id);
> +
> +	cancel_work_sync(&eq->aeq_work);

The above should be 'disable_work_sync()' to avoid the work being
re-scheduled by the flushed handler and later UaF.

/P

