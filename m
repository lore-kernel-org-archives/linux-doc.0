Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF3381AF
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 03:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783309283; cv=none; b=pU+XJnT5tfClJOhIk1sqBCriW4dKkqRs721DFycVV6/wzcP+eCl9ivQ+3sJFiPG/Yw+OjZnPAnwskUx6C2KtZkJ+SPynGR8oATVgoUTZ6gMYv6tg2noe0O1+ny+x+VS4MFIpHVF8sqhKSl5lprVgk8RUUfED9KgsYaIThikB+QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783309283; c=relaxed/simple;
	bh=QDWocMUXj1DjdyDumWeLX3GcsGYAGlap1XzZK5sYEcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AC8tJe3h06imvsr1utP2SUCMHIYEpf4yKES4O3udqZ9m6sIQr7g25y7Mzn/MqNo3VRX24bPeTUgj4m9kufAQEZuWgn+Futs6jfllkzW9ReQRyDkHaB58E8uRyFgwsvcPpM/p3F3vDvjeDFOP1Bgmx4glLycQQloV/Rl76k6w9Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Irmwrz+v; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Irmwrz+v"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37df72c9984so2251272a91.3
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 20:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783309281; x=1783914081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4xI2vNstjAg1+oCGXkBzd/Bl6APC2mTL6Vz9VUuJT38=;
        b=Irmwrz+vWchzb/iQmZdxmf6pSI/DHQw+qqVtQdWNI+j3Jiuz8jr1nv0BA4RQ4hR5Uh
         Y3NTHdWe1ZiUnX0+T0/N4kHUMHthz2hgG3P/HOcB+dN4x5N7orOUqlYu6NGoQi3aTRaO
         xIQX5iSL7TBKo/RT+sQxqPw/bo9w5+GSIWwJcvrrz4KVImfaMn8apfcLshwhhhwr/9yR
         VROgG4KL3TptQkcAy2c4lFhVRMvBjYvh/vmxfCsykqw/c97rTZOXn5dGohE1sFMK7ZhA
         B/3dBAQvbTIX9/n3RiuQ0iqw3OajG8LmCAu3uW6qJhAThGO42sCsCvDZ+oMS4ANJpR+S
         vvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783309281; x=1783914081;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xI2vNstjAg1+oCGXkBzd/Bl6APC2mTL6Vz9VUuJT38=;
        b=e7xsQBFRy5pcVVWBcwq8OlGVHV85ONlOutB79dO3hZKOJicJeqWF5nXlcCE8IgLpWo
         ODUO+i+XTVPn1X8MOQCHiE2olh9V7qLOQXgSgtJwL3OKnXNm0Rx3kWg8tom5uM1r1Iq7
         zCfudH/SERpYsZtA2LJbuac4BUCchQBegKODo2WvwlWOmoPhExqFN9v5cp6LgyFAFTbi
         mszXwpota3FaD0frQPdRS+ZnNu4kEj265XhgPj8d7BnidZLs/mIFflAV+E2V1jQL0JzF
         iborGiBbVO1cguL2I6l5rsRB0v+2CjNTMqyYSh5/hQqdDSPnyXpx9ul0NBtsYB8oUMTc
         o/pA==
X-Forwarded-Encrypted: i=1; AHgh+RrkxidGNTMVjEegxoJWiJARKJbopLSutrl6yYJix4QuYGRAUooZKQyVQ7c/r378rusL4BHO1GkZwqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXA1YAwrpVnsnhxHD33esWx0z0HcffOiZ721ABsdh1M9ry5cgL
	IVrSyounryxeWWGU4cO9QecGk3/TyY6ZQKSknfuawKp9T3NmLWjXyihh
X-Gm-Gg: AfdE7cnNotjAmIF1P5GmWzMPZ1/m24VGIk9ziscr3FxirDyJ2IBqNt3fyyyOdUiQrGq
	jJ5sibsMd/PGP6ePe6lkCT5/HYedpiqtq0kHP23J/qz8MuHTvIEt2ohqmPoKHMNpIyzzhAAHtio
	jYPGC151LPetQ5wR+d9UfeSykEQkXhaEff2JM5nC1qcQO2vjeeJi802tI9F8IuMsv5nWR3RQiYI
	03/Y9pPWih10cW5p1S6JjW3Bg40cItC8w9bbQ3PmKFPl1kDT23WSgd2rjH7FWLZJMZdDw8uwDc+
	YEeswU5NKtXYCvsmi6+Fwn6ty9c2FYsFREyRbOcj3GhdX2VjbHbxUzgqc/u/HYchdfF5/vz1rI2
	CZkmpXlvysOzvGMSx6hMerQJmysEpciT3YGJK69NjrAEkddqC1KX1Ioq9uM33vmReZmgSJAGxUi
	w4MEcvgUHRL4Ce
X-Received: by 2002:a17:90a:d44f:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-382807ae17bmr7926482a91.4.1783309281511;
        Sun, 05 Jul 2026 20:41:21 -0700 (PDT)
Received: from [192.168.71.21] ([116.6.102.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127c0c17csm4139110a91.6.2026.07.05.20.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 20:41:21 -0700 (PDT)
Message-ID: <a7b5f2ab-2249-44c7-8973-f6d668e202fb@gmail.com>
Date: Mon, 6 Jul 2026 11:41:15 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix CONFIG_CGROUP typo for CONFIG_CGROUPS
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260613211300.86016-1-enelsonmoore@gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260613211300.86016-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, thanks!

On 2026/6/14 05:12, Ethan Nelson-Moore wrote:
> The Simplified Chinese translation of accounting/psi.rst
> contains a typo CONFIG_CGROUP for CONFIG_CGROUPS. Fix it.
> 
> Signed-off-by: Ethan Nelson-Moore<enelsonmoore@gmail.com>
> ---
>   Documentation/translations/zh_CN/accounting/psi.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/accounting/psi.rst b/Documentation/translations/zh_CN/accounting/psi.rst
> index a0ddb7bd257c..703bc81ff9be 100644
> --- a/Documentation/translations/zh_CN/accounting/psi.rst
> +++ b/Documentation/translations/zh_CN/accounting/psi.rst
> @@ -148,7 +148,7 @@ psi接口提供的均值即可。
>   Cgroup2接口
>   ===========
>   
> -对于CONFIG_CGROUP=y及挂载了cgroup2文件系统的系统，能够获取cgroups内任务的psi。
> +对于CONFIG_CGROUPS=y及挂载了cgroup2文件系统的系统，能够获取cgroups内任务的psi。
>   此场景下cgroupfs挂载点的子目录包含cpu.pressure、memory.pressure、io.pressure文件，
>   内容格式与/proc/pressure/下的文件相同。
>   
> -- 2.43.0
> 

