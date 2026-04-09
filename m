Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EC2371CF5
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724997; cv=none; b=NTU0Y3vPC/yXUZLQ1W1A73D8WW3p3EeSyN3/P+02tsweeBKepluHN1QemIDEiudy6/vzW3lhxAjZZdcdq0fYey80c9w2ZE8nqHevbk/a1xGcfEQvyrp1/0Vxc9VZT2SjC+5+iTqJqmcTLEjJ3b9vHKPHA5tQ7eCbcsVrH/kMjOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724997; c=relaxed/simple;
	bh=WcwVq5/9fgi1xjKMepCQB56yilXqeTSjBbMxnY1af9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOjzVspUeo5h5bSZuPYSFQwNKN8nh8xxszy48MO6V1U/ESIqU18s7JelJIiWljN2CFaLTCmHrUnbrLKX2UWxZnqO3BIKecA3pCCAlQJC2UdCAxyQau6JsK5RBo+9RUrlmaSMJqq6lVrR3w9IigfbyLajWRigmRnzNXlfdP7GVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EH1byL64; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qtuI8GAG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EH1byL64";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qtuI8GAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775724993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zwk2fh7y+C0RrsYFO5wfxM8gZjDw/BYRnFc3e8tTqpc=;
	b=EH1byL64PgZzTjrV6qQp5EYdVmhfyxUHdmNxJZLhnJ+HkLcIjcAWOAYSOXRK+ENM9Sld9j
	qHCjla3MRpFYpqjhPG+BnfXj2YZ5VR01/EEFwZeZeut4Fnocr1+5xOmNNlMpp1llDjK07b
	pzNjVXUv6/oubOxsIp6lckwZMyU1Zys=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-Ddm_-HKmP4--G7I_WBv2qA-1; Thu, 09 Apr 2026 04:56:31 -0400
X-MC-Unique: Ddm_-HKmP4--G7I_WBv2qA-1
X-Mimecast-MFC-AGG-ID: Ddm_-HKmP4--G7I_WBv2qA_1775724990
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488c74405ecso4020235e9.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 01:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775724990; x=1776329790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zwk2fh7y+C0RrsYFO5wfxM8gZjDw/BYRnFc3e8tTqpc=;
        b=qtuI8GAGQ7UdYywZG8NRnAMt8A6hLwDwxFXdBbzlNjTa8Dm7QAiATssdm+YZAT8E2u
         A544SkTh8bg4oW1nu/tyxym6LL3Kz1FM2FQbLbt6H/vKgV68m2F6TrWS1J2OwfVsQQsn
         MHJhxWmZL+uF0Ujjt33xeX9mBCuboS6ITrffIu0t6nc63dq4LJG/EYBOSNsyP61Jnv9b
         kr+X1qjMBKx73dOktljrBGK7+49ZFpSIFDU5cibH9lpDHWrhzzNhKW8wOdbsK4pNBSI4
         MGVUvxYqASl9RbEjhgv7boQ3i6P9c0Zncrr2RHD4JjFRTHZmiou+EbG9ziHZR3l6LQWM
         L6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775724990; x=1776329790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zwk2fh7y+C0RrsYFO5wfxM8gZjDw/BYRnFc3e8tTqpc=;
        b=JmPJjJWhiFF4ai833uBklqVkxmbD+mkJOySrPXBvGXK+605WfNCQI8iBIjH/h8h9ft
         8BXztRj3bsGehQOu2A59P8QSI4cMZFmlKxd7q9Nd+Etf8hp6LHS7faO06UnT/Tt6EqG6
         Zi5QUGqu6mhbdHX2cGrAt/JsE2+Uv5IUMA+g/Zi3FqhcPY8a1wYRa3iIHIJY6Chz37gE
         eoSPx0y1FZE8JetOoF4BFxZZRkAuZJWuSiLvVOW/tjs29UNHB9Sd0t4q3oi8YtluFnW0
         ZzvoXVOSqaNLI/ew5nILM/4PrZwmOpyxp6GDW8TZfa1wppCWIahyjVrmo+0UZ+iVJYCT
         kwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTfcMohBvsTWZnHRfTyAI9jAu+9ItLouZIETQ9+IYxhJqt6yFeX6zLfTWeVwAV893J3uneEN5A0M4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL+edhMt//rIKQ/kVwT2NSzxIXn5GuGIjzYj2IEYJZgN+0I+24
	8BVBt2jvxw1jdIxvyw2CzqoNMLw18J6S+GWZ3MAqSrsnI7r3KxEJAuUBDCjpFSwnmCTWWl4ylAX
	ZiYjmJXoW7p9+QBFQ3eysqB5sPMsupUxC3i8onRetTeZOpUG4+ccPp6B6vr4WsA==
X-Gm-Gg: AeBDieu0AKbyc9g1cvklWcHhwwoithc19L3JuIt0QqBuJww7EqyxIr2MIvhdfpWSPHU
	b3Ti9i1+3lELdVBhL3MoDnq7+GgqHgOdrmJhZD/uCBkqmDXzjipL1nUYKtUw3+vfZBjaEHtNghF
	lasQw8WejNUvQM/DtoHNjCZKc6XpVcLFZD6sSFCWkLZ/qefKKmSlNl1Z6DIsanYGHaYwwOcRJN5
	aFoL4sFA91Qg7Tsa0Wwa6DWNAQn226wFCLbq5fZViv7H+FeecMrkQzKOkAjOEgEJkQrgRUn4dvl
	/ZWaD9HkryQsFQ2VoQLcSFmWscncwL/uhNfP+tZoCICypIn0MfAjRtcL1nGplBRAgVXWW+mIiz4
	4L6o7RcKIQ6jaBcSVVyZRUFUOlIskjuicrTovuTBuq5HSus7/mkmHBlHp
X-Received: by 2002:a05:600c:6384:b0:488:c282:e78c with SMTP id 5b1f17b1804b1-488c282e8a7mr126336495e9.19.1775724990110;
        Thu, 09 Apr 2026 01:56:30 -0700 (PDT)
X-Received: by 2002:a05:600c:6384:b0:488:c282:e78c with SMTP id 5b1f17b1804b1-488c282e8a7mr126335955e9.19.1775724989664;
        Thu, 09 Apr 2026 01:56:29 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd19ea26sm56602265e9.3.2026.04.09.01.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:56:29 -0700 (PDT)
Message-ID: <2e618260-2153-4c36-be61-d2329c9da13f@redhat.com>
Date: Thu, 9 Apr 2026 10:56:26 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 02/14] libie: add PCI device initialization
 helpers to libie
To: Tony Nguyen <anthony.l.nguyen@intel.com>, davem@davemloft.net,
 kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch,
 netdev@vger.kernel.org
Cc: Phani R Burra <phani.r.burra@intel.com>, larysa.zaremba@intel.com,
 przemyslaw.kitszel@intel.com, aleksander.lobakin@intel.com,
 sridhar.samudrala@intel.com, anjali.singhai@intel.com,
 michal.swiatkowski@linux.intel.com, maciej.fijalkowski@intel.com,
 emil.s.tantilov@intel.com, madhu.chittim@intel.com, joshua.a.hay@intel.com,
 jacob.e.keller@intel.com, jayaprakash.shanmugam@intel.com, jiri@resnulli.us,
 horms@kernel.org, corbet@lwn.net, richardcochran@gmail.com,
 linux-doc@vger.kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
 Bharath R <bharath.r@intel.com>, Samuel Salin <Samuel.salin@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
References: <20260403194938.3577011-1-anthony.l.nguyen@intel.com>
 <20260403194938.3577011-3-anthony.l.nguyen@intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260403194938.3577011-3-anthony.l.nguyen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/26 9:49 PM, Tony Nguyen wrote:
> +	mr = libie_find_mmio_region(&mmio_info->mmio_list, offset, size,
> +				    bar_idx);
> +	if (mr) {
> +		pci_warn(pdev,
> +			 "Mapping of BAR%u (offset=%llu, size=%llu) intersecting region (offset=%llu, size=%llu) already exists\n",
> +			 bar_idx, (unsigned long long)mr->offset,
> +			 (unsigned long long)mr->size,
> +			 (unsigned long long)offset, (unsigned long long)size);
> +		return mr->offset <= offset &&
> +		       mr->offset + mr->size >= offset + size;

Sashiko says:

---
Does returning true here without creating a new tracking object leave
the new mapping tied to the original mapping's lifetime?
If the driver unmaps the original region, iounmap() is called and the
tracking object is freed. Any cached virtual address pointers to the
sub-region would then become a use-after-free, and subsequent queries
for the sub-region would fail.
---

/P

