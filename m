Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ECC12F38E
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 18:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714762798; cv=none; b=QZ7LD+Zolzwk1ioqA1B5Tb2d41zgcI+dVNxAE4UXQwUHhO5MQ+a5ck4vI6sdz/qY7dG96d285n/qiT2ZnamYUdtplSgr198l1erz3kNw6oQ4ji8gqwHSgCL1LuE+IgqaZQY1JOJKVAI9FWqbDwkIAO/GN5fBQRsviOoz/0MpF3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714762798; c=relaxed/simple;
	bh=vstfoZvHsAcXCZCvOZqSg5KA/bwkjUFboyKSn6palj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNL0PRVVwjYq+uS3DmR9w11Z5iFeYlqU7DozbZPgD7gyzFJmJR+APC3b7dThU2cKF9TljmHBADgDyVwg/pjvjD/OzJ2Ql9nM0onhm4h10SX3CAS3RBFtI5n3WBuUNnk5djXC5ffSh9fMHUtSYjgqP5ZGIUhs0NQWlno7TR/6c48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ddj8Fw3h; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ddj8Fw3h"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7da55194b31so83095439f.3
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1714762796; x=1715367596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zK7EjngVwHxCdqRBj4DTZ+w1kW00DuCOALFXYA7wuDI=;
        b=ddj8Fw3hiXbVeHPP9J7nRpOtbBZlfSnozmvrikXmssHMvCnr64VwE6TdZ61Hh5CwJi
         SV371pAmkbO99or4+RbvwMoqL1ytIvrofc+Rm52r2de+6gnq6qGXFLC6/bjGRV+sosMa
         MZpm3UqL8o5O13UafPKy/yX/cVlgBBj2nSsLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714762796; x=1715367596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zK7EjngVwHxCdqRBj4DTZ+w1kW00DuCOALFXYA7wuDI=;
        b=FZJObwIxghlUgWoTptTMF5GvayqSnkzPgIpks/OXsYHWPu3f1f/FBhfKgKM5R+Jy1t
         OwwJGYtMOv8asXpn7iu4COGn6wgKhX4JxC3i0cgZOpqoHe4ckH51HKEFFizp+1ANG8N3
         CmJanoi9UtdNgmnrKcj62vTlZ6MEJa3kj0XQC/BIAEhGHDEQMddFDr8RZ4GKp8/7e+U5
         XsfEqrFF8i9i/GfhWBZ2mIzjMV4sD6D/gj8HJ4kNDmZuDMoUaIRPXIKzy2+36txxfUFD
         dCaZ/m5+Bte+0PwittcfFWsQ5U/megxprQ9dAjQJnNuAvgYVaO5ZmvMoyOvIq4fBih0f
         zxFA==
X-Forwarded-Encrypted: i=1; AJvYcCXjFsi2+MHop6xddhSV/G6cxFmnou/J46eOAe3xzoCAlmz8tJQfp15L3HxcEZSqbpll7JagM9T3wow3CY7JM8kzzkA9uzLCaW3X
X-Gm-Message-State: AOJu0Yx4LmMIgg1P8sbIowQPDQhwlbV1FB5bRl1lz+NHjKjP5YDY0g+H
	TSLQYQplvIZ9qAObvGSJgjcR94Htp7ZjMruDuau7a5oQ/gNSRKqiQh0xn4AZS4U=
X-Google-Smtp-Source: AGHT+IGKOG2BRFN59lfSUvaPMYRftU2oCo3evPUBOi38lV7vpEyniKA6Hz/kFSVNmS0ClAbtZJsuug==
X-Received: by 2002:a05:6e02:188d:b0:368:974b:f7c7 with SMTP id o13-20020a056e02188d00b00368974bf7c7mr4362981ilu.0.1714762795516;
        Fri, 03 May 2024 11:59:55 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ix13-20020a056638878d00b00482c2bcabd5sm933236jab.2.2024.05.03.11.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 11:59:55 -0700 (PDT)
Message-ID: <6a54d332-c13f-4d9c-93c7-7700baf951f9@linuxfoundation.org>
Date: Fri, 3 May 2024 12:59:54 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: kselftest: fix codeblock
To: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240429165047.16088-1-0xff07@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240429165047.16088-1-0xff07@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/24 10:50, Yo-Jung (Leo) Lin wrote:
> Add extra colon to mark command in the next paragraph as codeblock
> 
> Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> ---
>   Documentation/dev-tools/kselftest.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index ff10dc6eef5d..dcf634e411bd 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -183,7 +183,7 @@ expected time it takes to run a test. If you have control over the systems
>   which will run the tests you can configure a test runner on those systems to
>   use a greater or lower timeout on the command line as with the `-o` or
>   the `--override-timeout` argument. For example to use 165 seconds instead
> -one would use:
> +one would use::
>   
>      $ ./run_kselftest.sh --override-timeout 165
>   

Thank you. Applied to linux=kselftest next for Linux 6.10-rc1.

thanks,
-- Shuah
