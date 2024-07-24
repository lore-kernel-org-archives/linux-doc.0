Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F967173C
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721853739; cv=none; b=GGUNAGNHbt97IwKhhAYHa/pMJT92itf1SUhF4BXr5e2nYekajkUtHGQaURFyC1REhWaNKkrdIuUw4U4xvuWCnONwAJTFVwhXXon2XE5Xslv9Jqiw4EAnvD+LrwE5x5kXsjeHa1A3Y6uqDUWLLWLo63uWbgDMOCogCdxh9AH5Lk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721853739; c=relaxed/simple;
	bh=VFIouTgzioPnV8PxR8/n0LUJ2CqqqOt9c1k3KYsJ+RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pf0KrG9z6WX9OD64K8Pt+B92M0WjfqsUoczXBZaKVFgj1mauvnknfMORY2Dus09uhmeTs1akg8UDXjQEnVN62G45lowk3IG6Np1m/ZiVPbwfsxbFJCjBTvuuJ91K21zw7HCJMh3pHhXqSPJA+W2MqjQmR6uXffTgAdiAgFo7NLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ial28SqH; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ial28SqH"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2635abdc742so10059fac.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721853736; x=1722458536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwfIRXOiJ/heI64+FQNlpZPVBndoeV1RDDhZJ9SjarM=;
        b=Ial28SqHYFLrCG9iuiDdtO25WPHoYZVH9wltjdc+WoNWIu0j77cI4Rn7hgHeYqz/s5
         Tl0ufAIfVMuATzHgOLx2RLnLk5StqxboNsrtzlka3/iB4hh5Hdop/UzO8a9lXrbkprlm
         ZuFObHVaeU/+xbASA9+gc7TmrvwzqvMneNMZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721853736; x=1722458536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwfIRXOiJ/heI64+FQNlpZPVBndoeV1RDDhZJ9SjarM=;
        b=iM/hu9urXot7o67KqYs7NaxWcMoqDGpg1yc2mCK6efQ43zko2T9zR5Dlnz89BWFNJ3
         wOS9p567P7dcZCUF+W0Zd6Nyz3yf6ycJmuq1FWd2x/bYhxHeEYfSnIKTfTpPp/bgKOHH
         ei+/1c3+hhJePW7VAb/yDokia6E1tpbrYF6RKNypUsf7e1t0U83nBGPnovdY9mWC17Ui
         OvaI8NCkVl332TPCldW2IRCGw4VjA2jKLKdmCOPvGBh6LpDjzDsdpIZFkOy0hT/Y62ZW
         1HlOixKbG0eCB/VSLmdYeHOsjkhRz6kAmw7GXPeOwihXxrQSNlvQpy+xXVdzPH31HlJA
         lMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9UPjcRmT1NTb9x0nF9fRG3T3UUBGOgupQGVlt9SW8mQJsZdCv1ynRW8A19zea+9zji8eoDKC1ZcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWUK3CoW3lvFk/u+yIKougs52f139IFFN/xtx+eSEYd2bT5LpS
	FhL8vt/MasdgiO5gdBcKv0NJwle9csTFtcR8SRKXP2hfmSci79neaD5f1qwdWtA=
X-Google-Smtp-Source: AGHT+IFmjQM/tsv5clvcDuEEZcPj/WQfIe3Hmew0qHt87NCUlyPGfYsebGMK7/9TgEQGvEpYbVMdPg==
X-Received: by 2002:a05:6871:e2a3:b0:260:f1c6:2586 with SMTP id 586e51a60fabf-264c4538997mr198897fac.10.1721853736344;
        Wed, 24 Jul 2024 13:42:16 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f9ec428bsm18707a12.63.2024.07.24.13.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jul 2024 13:42:15 -0700 (PDT)
Message-ID: <49d2134c-20e2-4042-9d01-9d7ca28af052@linuxfoundation.org>
Date: Wed, 24 Jul 2024 14:42:14 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] KVM: Documentation: Fix title underline too short
 warning
To: Chang Yu <marcus.yu.56@gmail.com>, pbonzini@redhat.com
Cc: corbet@lwn.net, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, chang.yu.56@protonmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ZqB3lofbzMQh5Q-5@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZqB3lofbzMQh5Q-5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/24 21:40, Chang Yu wrote:
> Fix "WARNING: Title underline too short" by extending title line to the
> proper length.
> 
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---
> Changes in v2:
>   - Fix the format of the subject and the commit message.
> 
> 
>   Documentation/virt/kvm/api.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index fe722c5dada9..a510ce749c3c 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6368,7 +6368,7 @@ a single guest_memfd file, but the bound ranges must not overlap).
>   See KVM_SET_USER_MEMORY_REGION2 for additional details.
>   
>   4.143 KVM_PRE_FAULT_MEMORY
> -------------------------
> +---------------------------
>   
>   :Capability: KVM_CAP_PRE_FAULT_MEMORY
>   :Architectures: none

Look good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
