Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220E13B599
	for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 15:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721750001; cv=none; b=IbAt9KoV6PrMm3FNpcEp14XJ7P2T2JqhWrbFrsseo029T6Q+w27m0vcLAkzPKxlZEvhg+xFBgGVvDmdgD7hXY+Hb7tVbd5ZfcdriExmLqBFb/B8Qph+wCUW8MV47vMJI3gFJJcAYzBEPzdqv4ZwXdaLBVgFWZLJ25M0zrimYtlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721750001; c=relaxed/simple;
	bh=cxuOPsTIVtoU+nIhea6lh0wcnjl48qEYnpCrHtqYinA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NseebDwTVa3asULonVqBnFCcvJqlXs+0bZJ5UErcusTGi/9yXQN72GJivtdDNuc9bDaQeSHJOqUIeeONalIsHs/GYAADw+4xYqDcBa3RjzKy4Ea73DXz8nURH7SL8GCYXhhDXcv0WfLuy8VWMdbc3CVMyH7PKEJYxwryuh4IA+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R3UQ2PC9; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R3UQ2PC9"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7f7e24bac14so24797639f.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2024 08:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721749998; x=1722354798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rPHKaWJY2mpZEgSeoPY/GzPvEO+uYfseATdBA+mV+AA=;
        b=R3UQ2PC99paz0m38ZEVu3dJ6lmT8Si+lmPWH346FLInwH7wCc6iSQKsaqJjlkrEEp6
         OR+0frjPLwv9TYM4sgM7Apk1A+Ixx67AXq5qW/35uzGxxLdxzBHAEMhvoSHVCxFobjWn
         BQJcuLPqFroZh73hY5igdLfqmIlxqqHRD5OgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749998; x=1722354798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPHKaWJY2mpZEgSeoPY/GzPvEO+uYfseATdBA+mV+AA=;
        b=DPJ3ijnov7LwIk2NuXSUx7N9AZPHbs+ecrm8TVV/mjY3LbhxhfDI/0bT/giEwMN0X8
         VofNbYEvUQL8Q83e7hpZmWYieGPKF0aWZ3V+QBAHxrty5YmP/rYkZKGMHNzYN5Q0z0pG
         ZVcJL+g5T9g73zeXTRc7WKJSJ9/2AfMwF1cdpoZXSC0s8gLV/1edPy/vMqJossKVHQMZ
         Ottf9wrbgDVX91GvtoZkSvMy08VTibQ9qvzKb4yjQ5coEKiXmUO1Ua7JKj7rqz5HffqC
         vepE53nP2rB2ovygkIwZwHKRw/6DXAcb+DfA9GznfeJPFVFfyOwuXfiM+IlszgBdXBy2
         fqzw==
X-Forwarded-Encrypted: i=1; AJvYcCX2MAhBUNTqvUdy/D1oTrRhaUBLTFetLxuMliV/bGxJg20HKT+xTWCDiL+eYZxBRTl/bnT18XpDPZLRxjSBzxSbP6v+kexQY9Yc
X-Gm-Message-State: AOJu0YzMM3LamEK/auSXrvPOAcV+o5WIQH7wrmL4ZYKPFrEkCIV1B3n2
	DaYmH2SJapXDsTKx6hWuUqgjN+9kc8QLTDKL0h4LvzFsjk5mG84a9sjVlAXFENM=
X-Google-Smtp-Source: AGHT+IE7ycD7TYz7oqcaylu0gaJfyDmPbS42pZUQGNtj9sjcB8NR8ZYSi2laxswStpBXzqjkvfMuaw==
X-Received: by 2002:a05:6602:304a:b0:7f9:3fd9:cbb with SMTP id ca18e2360f4ac-81aa4bd5cd5mr641409839f.1.1721749998357;
        Tue, 23 Jul 2024 08:53:18 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c28669520csm120094173.25.2024.07.23.08.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 08:53:17 -0700 (PDT)
Message-ID: <b9e7e293-38dc-472c-9d53-5dfec5dc4a28@linuxfoundation.org>
Date: Tue, 23 Jul 2024 09:53:17 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix "WARNING: Title underline too short."
To: Chang Yu <marcus.yu.56@gmail.com>, corbet@lwn.net
Cc: pbonzini@redhat.com, linux-doc@vger.kernel.org,
 chang.yu.56@protonmail.com, Shuah Khan <skhan@linuxfoundation.org>
References: <Zp8xvjtQKdRSvJO_@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <Zp8xvjtQKdRSvJO_@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/24 22:29, Chang Yu wrote:
> Fix "Title underline too short" warning by extending the title line.

Please specify the subsystem this patch is intended for
in the summary - also check the correct format for the
summary in the submbitting patches document - you can
refer to other commits for the same file in "git log"
output.

example:

[PATCH] doc/kvm: Fix underline too short warning

Include the warning in the changelog

> 
> Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> ---
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

thanks,
-- Shuah

