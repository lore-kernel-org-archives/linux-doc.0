Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE4628B4F2
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516730; cv=none; b=JB/M0AiVIZJI7r4DFD7fLvJnEia7I5tsn0m4qEdaxYmPFyXYQ+qCLYT73DSXO6F17Egrs8uvtFAZMIkjhdkGLfUPa1pzNme/BfPKCaI4kV2l1M7ld5RZ7aj0vOTKs3ZRmaIoZddw3jwj+TT+BfmLw3lCudpq7fROwggSGLIxGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516730; c=relaxed/simple;
	bh=ND4m9bPg+iM1syHn8/Bf538DBuLnMYvEB/m4ME88IrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1HiIUZi0UY1rWw3IJnAtGCYGBICvg7yJpffoGRM1WzmPJMybgy/gjAiiWb/S50K141VYSwgAybLwHOZfb4GaeFZOjiWJb6X66dvnxzgyaYEKduF+Do6gXeKc45WXIbh8YPb8KBl0mFROEflwqrHuuumK7a6XOAV6pnjYJVYHrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GOGsVSXk; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GOGsVSXk"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85d9a87660fso120936639f.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 10:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745516726; x=1746121526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2OwxtPAFkf3XrlDWJwmZs/Kh2+IQd2f8j2jxQ1L7aDo=;
        b=GOGsVSXkjCrDq0G+JKKproLmncNN/ZWCGCBcd5/efzNSXCqy40G8qLRMSEIQI+uVMK
         nVuj/TypvcxGCBHzdLheChfEKuhjVu+QQW9noF8EQHfRV+1NzFEb0Cf37r/09eHyM9ZM
         QU7ZYbFZWveb1GZHB/amFHH3jzSDxiWlrjftI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516726; x=1746121526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2OwxtPAFkf3XrlDWJwmZs/Kh2+IQd2f8j2jxQ1L7aDo=;
        b=oFOiSA77gGe3SM8mUXt2MnngRxZiYV/3cRvckPCOewokDM2lj5SaDhGz+7fF8LQLUP
         d8rxqy4nFE87Uft46LjDSuTaF0BRJEee9UQxBQr7vFADn4VoZSYDhK5rD0qtQ1U/va8Z
         DABvGa0/pc9AfGEc7PQPWksl9rWLdJ5hFzDi6f/RsnIV1Ish1e8/RKq00fiNNA+OMq5G
         VeuOtx3yWh268ezwOUF1rFm0DvSo7AX15w3qAUg1wjlur4eMsYeGC9CmGpXsFUppMC2t
         MmeUD5nsPPH0/2QobuFJPRMFpq7WBrd0EXUBRv4Xak0GXVPHhTxsfG0uQn6gh4ftUWO4
         19oQ==
X-Gm-Message-State: AOJu0YzgxPst9P3e4QiJtLaEzTgY7eVpSNnXwASJ0mJhtPs6Afd2x9wH
	k2fDrdV6rsf5YEq3yTD/okl55PvyRCCPVqxlRlj+zKhHnEpqoFHJj1z2GRDjhTJv5ZG5hO7NKcp
	P
X-Gm-Gg: ASbGncuphzjYPommiXsaRj29Inj7m/loTBEjxXnF8RS+YedD5tcMJxWUQP72Uo8yiov
	k9KdU3cURaMApcbWzAfW6A2ytHZbQyJeTsxfNvs+eBBWQEaeKB72Up2Rag4EFHK/WNr7W42hp4d
	0eYEi8X92uwMkK43rPmMtRQ8m1JKk3wiW0quN6Z1Hu1oMFufueeKwfSHA3f0nMqCb6cUYHNXN4o
	mA9iq/57CfMiBfZPiUdKIyfpUbccNnXCcEldrMi8ECmfZguaAKoLPLStZcp8BB+37CEG/rdM/rB
	WsAVQHUJw9c5abthvmJHlJ0yINRwWWfgP36bdXpemZskuZZePkgsvodu0GojLg==
X-Google-Smtp-Source: AGHT+IF9FoP+ZidZW0TMFX8sg9UdCZmkNLbWfQj5wlu0Ef6Nwqhw2dX4Kxph+I3zVm1kAL964XS7PA==
X-Received: by 2002:a92:ca48:0:b0:3d0:1fc4:edf0 with SMTP id e9e14a558f8ab-3d938efc0a7mr6397105ab.15.1745516726415;
        Thu, 24 Apr 2025 10:45:26 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d9314f6021sm3348155ab.34.2025.04.24.10.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:45:26 -0700 (PDT)
Message-ID: <058ef2a1-4378-471f-ba2b-ba30c56c8e45@linuxfoundation.org>
Date: Thu, 24 Apr 2025 11:45:25 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix plural form of "firmware" in top-level
 index.rst
To: Alexander Shatalin <sashatalin03@gmail.com>
Cc: linux-doc@vger.kernel.org
References: <CAKWAyWnda9_SAKb-EbCzVYTrMNaYxhNefzEYJTu-cJJDfmKvew@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAKWAyWnda9_SAKb-EbCzVYTrMNaYxhNefzEYJTu-cJJDfmKvew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/25 11:15, Alexander Shatalin wrote:
> Hi Shuah,
> 
> I hope you're doing well.
> 
> Please find attached a patch that fixes a minor grammatical issue in the top-level kernel documentation (index.rst). The word "firmwares" was changed to "firmware" since "firmware" is an uncountable noun and should not be pluralized.
> 
> This patch is part of the documentation task. Feedback is welcome.
> 
> Thank you for your time and guidance.
> Best regards,
> Alexander Shatalin

Hi,

Don't send patches as attachments. Read submitting patches
documentation for details on how to send patches.

thanks,
-- Shuah
