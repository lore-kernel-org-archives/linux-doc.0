Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC4D15252D
	for <linux-doc@vger.kernel.org>; Thu,  1 Aug 2024 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510100; cv=none; b=Z/Ph/Mcs81Q2xNXx/O0Bq1Y7GyggTOjN2ZGFVZVWqChsciyGjysaGTFHgrm0iXdlpeeb6BkVul+Zi6rMv7eaCoJ4s/1yX8QQ8Maaiu0teHp79IsIgxDNWjszDB8vLtAhpCh3Ytx419BjlydSOv6jM11GHQuL9GUKj3Dk+pRSJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510100; c=relaxed/simple;
	bh=gJyqndJlsZd25AEeawI9Gm3JE0f8nU5ng+m2CSIKFTg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OYQ2i9aOd6nUV6LrQSCLcPBM0/W43BbPQlDOdtSMs5kg9xJ2OR3ykiNDlQBcwp8LtC0CdydQoAC1ZCYVAS4J7yYz7+qDv47tBwfhKH+YT5Tf2L8MEkFVpmvAadTDBpmR4/4fvlrEaMGPeTSRjlpuNLpnXmpqirUs3FjL6DWYWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5G8bwoz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5G8bwoz"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d1d6369acso1448155b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2024 04:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722510098; x=1723114898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G8V5Gq9jWtJAcpqxL/ibCzCHR2W/JBS18p+I/Sq+cjY=;
        b=A5G8bwozp8LCrYyJVURTCEwNAvaYe4kBom6QFTsVV3QIV9gFcgSdWPeb2EDCU+L3ap
         7AZwsC7mSAKIyfFVRhgi1cNLOZ2Wsr7oK2TyedtIHFn1Tyhokm9zir5dB1QCJ+JqyY9+
         oDlVli7xTC9vWi14dK/1AmPA+FhcQRQEofqi06HiKSuOWCGN7ZmmOq/PzGARJfj5TXef
         F4WCkHeK6MhjoQs3sYbxY4AE9OSN0c8XwG0xV4G6A3gvgdwcWsM71PjP95njERjMtIps
         ofnvhV0YxkkUq5q6ZBCtauyRBSAQ8QtNzYudW5U8qPwnRKpQLYpgbhAfeCCI1IZ1bO5g
         IS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722510098; x=1723114898;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8V5Gq9jWtJAcpqxL/ibCzCHR2W/JBS18p+I/Sq+cjY=;
        b=SrLxdvCfixfgD0fzYVZib0WFJ8Jhu2dx53C1kJYx+W7/C6IZLz+eM4DyI91j5FxHQz
         k+CsKqI3swN0SsCNkgxjOThlQyuzOOJTkBAF71NVNaC/P7I6PD1D+vsemSma88EVEWV0
         qLDocpoZQaYQxt4sEXiufzDUxR7Ezzz9AqqMzRrAhTeQDUNTEld3r0FUB6PrXPCyYrFu
         /jy4AsLDVtd05qoJnzNJEsfJGduT+9GasbBJD7GNBvZhwnl5AKvIYrsGpGsresTTuRHS
         9eU8/wVPua/NVWjWAdf7gyi3BdDaDCrPPJhZpaS9GRLV85Rp2vMRoOWFAjofto2xKCG+
         1Ukw==
X-Gm-Message-State: AOJu0YxdW4Cmulud8uZZ6Qy2YjU+dk9/pT6iXlGrPGA4pWdWlF48LHpE
	yEedZqS/BeRAA/9e2JoovJGCSigheMhdLbREQ3app+mGB1cuh9qpWpm61CJOlyU=
X-Google-Smtp-Source: AGHT+IEu0e2+9ZS3N3cbiTYLTpdoJWdmPpEzx695WbcAbt7es+AwgOyiJKuERjZPm44T9p1JlIXASw==
X-Received: by 2002:a05:6a21:58b:b0:1c4:85a2:9958 with SMTP id adf61e73a8af0-1c6942c3e54mr938337637.25.1722510097662;
        Thu, 01 Aug 2024 04:01:37 -0700 (PDT)
Received: from [10.113.19.163] ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead7156easm11274437b3a.85.2024.08.01.04.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 04:01:37 -0700 (PDT)
Message-ID: <ec6e3d88-b98e-4fce-9f7a-73c8ff82f8dc@gmail.com>
Date: Thu, 1 Aug 2024 16:31:34 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Siddharth Menon <simeddon@gmail.com>
Subject: Re: [PATCH v2 1/1] Docs: Update LSM/apparmor.rst
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240801102356.93591-1-simeddon@gmail.com>
Content-Language: en-US
In-Reply-To: <20240801102356.93591-1-simeddon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Docs: Update LSM/apparmor.rst
>
> After the deprecation of CONFIG_DEFAULT_SECURITY, it is no longer used
> to enable and configuring AppArmor.
> Since kernel 5.0, `CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is not
> used either. Instead, the CONFIG_LSM parameter manages the order and
> selection of LSMs.
>
> Signed-off-by: Siddharth Menon<simeddon@gmail.com>
> ---
> V1 -> V2: Removed historical information and addressed review comments
>   
>   Documentation/admin-guide/LSM/apparmor.rst | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
> index 6cf81bbd7ce8..47939ee89d74 100644
> --- a/Documentation/admin-guide/LSM/apparmor.rst
> +++ b/Documentation/admin-guide/LSM/apparmor.rst
> @@ -18,8 +18,11 @@ set ``CONFIG_SECURITY_APPARMOR=y``
>   
>   If AppArmor should be selected as the default security module then set::
>   
> -   CONFIG_DEFAULT_SECURITY="apparmor"
> -   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
> +   CONFIG_DEFAULT_SECURITY_APPARMOR=y
> +
> +The CONFIG_LSM parameter manages the order and selection of LSMs.
> +Specify apparmor as the first "major" module (e.g. AppArmor, SELinux, Smack)
> +in the list.
>   
>   Build the kernel
>   

I had accidentally added an extra '=' before the recipient mail
and linux-doc@vger.kernel.org while using git send-email.

Really sorry about this.

Thanks,
Siddharth

