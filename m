Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED63330305
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 17:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260721; cv=none; b=djH5WXjYc0FjTAMN8bn8Dq7BgZnFck/eBDpploJzum7Jid9sU1U8o5um971fLYyawWjUVr1MEy38OKuibMRglKAxSOVFpvYm+70bfD23t5lQibcoIOn7o+XHv8tA2wK8VG55cFDc9WvVs4qHAdbk3uzk/B1CCYwaBb+LAw6XL3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260721; c=relaxed/simple;
	bh=kEkPEojWz3AAqcVu8a+KdT+NbzcoSP/4uQqn+HpYoVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CAHUm1zn5Du0+btyXZWZ+Ub9kF9TaUGkDxGrQVfW2osL+4AYA02Zt44UNOlg4JjJAGBvSXJBvoevjC2RA+AQuAM5BST4fZ49ijiEQ9W877Q1BdVMInHljTMCb5gHfVXgWABo8CNSBFNCY58FHNIUVR+Dv87J1ahy1EXq3SGQ0Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W3/7wFSE; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W3/7wFSE"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4824176bbbeso151995b6e.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 10:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778260718; x=1778865518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V83uRMo5W5vge1dn+47go5ARLmDf4mEAHcGcOSCIYG0=;
        b=W3/7wFSEx8hsFCgzQZa8aanvQwnB52avPVsRAkXMZhbKr3sbA+hqJS9/4ywnP0H9UM
         1FChZxQnFs7Pe+tI6CdEcjIKgKV+J82HbaSGjb56VRmGxA7ir//LOf4H/nsxYx6A4ad8
         Kx72kjBguZweVdqgR16Ipk9DZN4fQTbUeqF3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778260718; x=1778865518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V83uRMo5W5vge1dn+47go5ARLmDf4mEAHcGcOSCIYG0=;
        b=deKK0K0zLgH+/qyTh0fpkuaUsNhuhzXTzAX5CkGKHvgOeovOwtXZHQz49la/rmgDK1
         vcgxuIMG3oa8NrHDdpCUB3mD92wEO711NpCCTcQjK5QDj0eHYAloQIU/oKIxUM71i9D5
         +jT1/tq6uS6WKwl00kkCJn0nMYYMaMiL8W974W68cg3gOJlwotpOum+9zKoymFXUdTSd
         3Vw76UzjVpNyATlM8RMdgYVk4ubwFeMyKkiAFW4rCxd1GBRRaotS6Fil9aJMJOetGQq0
         GREBCkJeWjgrqpUwxSPUst1c+KBG0kckkwp7bmkB/3JUF3aRASxnNF3QNsDC5pHTvtlZ
         T1Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9Y8QHCDhM1cvQS0s3YkGRAhsOmDRSvHAtSeymFqWEJKY62u8/0zgmnm1wEIR2iWqRbFkwyL3BS5V8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjCJ7FaRl76AoehX1T+3R08hNwGteALCVBwKUcMjEJXA4dipCY
	xZAsr4cLgnk876nRQKC8uCVuZTv1m6ZdQZJoSiwrisryTY9kUnT3N3OEvhwmrZB5L0g=
X-Gm-Gg: AeBDieu6UFaydJrTetgKznBQjsf+3rX27PO2Lm03rwYx4v42yz5M0fbLcUjCrJHKG58
	u7a71xX2cRfpt/jenMO/EvnGO6nH2E7N2TCNHIzoED8XHcFon3nPIeXsR5FuSwBg03G3iGhVBuA
	JmOI3mGIuZKDgxKEmr8qzJfm+/AOuCfIL+ZJMDr2OHjXHvcRUlsEZMg67VvuUgLvYFsekyyhYiv
	XrlsonzaGz5BKi9PdSh+kKs7RCc2cyAgDHODZYE5sYO/4fKAItlmr5BP39p/vI6XaIGjXPqgeX7
	cZfWfPZdgHafrDhy9FIak9+8Ebh9pFXa5udkMVQVTZzZ6PleKdOcTisZKG9euXqYBtrLhQ8bkhM
	CH08YcxUuhHs8HN1lyeWJml77Ocm3rERpy/VbMTsOauhowifkNrWt9Zg4nGBOZLxGWX4LuD0Jp1
	XlGkKsxfG1OJUWX7cJxuT6Ic/fwo4g7LuWVcV2cm7HOQ==
X-Received: by 2002:a05:6808:15a4:b0:479:d25e:9065 with SMTP id 5614622812f47-480420d6cebmr7886811b6e.2.1778260717916;
        Fri, 08 May 2026 10:18:37 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c763b33c1sm15055762b6e.1.2026.05.08.10.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 10:18:37 -0700 (PDT)
Message-ID: <89177fce-8bc3-40bf-a06d-fcf2e95fad8c@linuxfoundation.org>
Date: Fri, 8 May 2026 11:18:35 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] docs: fix repeated word 'as' in dax-hv-api
To: Adrien Reynard <reynard.adrien.08@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260508163802.16249-1-reynard.adrien.08@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260508163802.16249-1-reynard.adrien.08@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 10:38, Adrien Reynard wrote:

Missing commit log

> Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
> ---
>   Documentation/arch/sparc/oradax/dax-hv-api.txt | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/sparc/oradax/dax-hv-api.txt b/Documentation/arch/sparc/oradax/dax-hv-api.txt
> index ef1a4c2bf08b..297515ceb697 100644
> --- a/Documentation/arch/sparc/oradax/dax-hv-api.txt
> +++ b/Documentation/arch/sparc/oradax/dax-hv-api.txt
> @@ -485,7 +485,7 @@ Offset   Size   Field Description
>                                the virtual machine to use when accessing this data stream
>                                (checking is only guaranteed to be performed when using API
>                                version 1.1 and later). If using a virtual address, this field will
> -                             be used as as primary input address bits [59:56].
> +                             be used as primary input address bits [59:56].
>                   [55:0]       Primary input address bits [55:0]. Address type is determined
>                                by CCB header.
>   24       8      Data Access Control
> @@ -576,7 +576,7 @@ Offset   Size   Field Description
>                                                        the virtual machine to use when accessing this data stream
>                                                        (checking is only guaranteed to be performed when using API
>                                                        version 1.1 and later). If using a virtual address, this field will
> -                                                     be used as as symbol table address bits [59:56].
> +                                                     be used as symbol table address bits [59:56].
>                                           [55:4]       Symbol table address bits [55:4]. Address type is determined
>                                                        by CCB header.
>                                           [3:0]        Symbol table version
> @@ -815,7 +815,7 @@ Offset   Size   Field Description
>                                the virtual machine to use when accessing this data stream
>                                (checking is only guaranteed to be performed when using API
>                                version 1.1 and later). If using a virtual address, this field will
> -                             be used as as bit table address bits [59:56]
> +                             be used as bit table address bits [59:56]
>                   [55:4]       Bit table address bits [55:4]. Address type is determined by
>                                CCB header. Address must be 64-byte aligned (CCB version
>                                0) or 16-byte aligned (CCB version 1).


Looks good to me. With the commit log added,

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
