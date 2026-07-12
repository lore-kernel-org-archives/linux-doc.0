Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07E52BDC26
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 04:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783830828; cv=none; b=VDrP6vY+fnk2+Cl+NRV1CjlsFAHi0LMMpMrKK0irPw4I6dAgdBZpstwKcR+RfXCTOUxkxE1ItFVb9vmEx8w5XDtnQF8iZqHBUr2DLqUUWUeZjhdzId49dlrh3mT5K121vUxjDMpQojZGlfhRRZzF/XgCqx4mTiWkBd/frg/86c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783830828; c=relaxed/simple;
	bh=8J5HFwTOL0hAEEQYkTFwTFDExbt6v5qTfma9p+0sAPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tck+KK+Ew2BHhewNT/rocTQUC+5mR1PWeBt20UT9Br9ScuhEtC0yVTNMCiZOdqouPvkDL3JZezCRw0e1612+45Mje+IBws3n5Y3klRpsgO7siy5fnck0kasWHaULV+OGumZdOZprugPEGBeL5DzlqqS4dhnxp3DslHS4mN/iBZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2LwWpDI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2LwWpDI"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84a2dcec51cso226438b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 21:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783830826; x=1784435626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vda1xnTOZd1wuechtYioOaYBebfyC/yXFuQlfaQigM8=;
        b=P2LwWpDI2g0/EKq2l2la3+vNxsY3p2TR35VXvhDWBEhPl9mc2orcfwAQkUeulaKmlO
         hj/itLJFYzk1w2PYaHjN5h6wYyGC5o3eKGtCXkxfPkV0k4PRn7O7Bs29FcVZ6bINFQ6O
         PSO34UEw8FnYlfDT72m+TdVxAHRVWsge35UY85AjoSrqmKRAFQSlxeXdqzyuCHYBh0TA
         2bUCt78oVCOYnhUVdvpLLmfdI2vJGbAWC56T+aCM+jjChU30wpV22PmywSCQtV6xcnfz
         bIzqwY0OQHiqX/tOndY3mTekYVoIRoy1mepBlHGcZRV2UasrLq2EhsPY/dLEWp7+gCX0
         tDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783830826; x=1784435626;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vda1xnTOZd1wuechtYioOaYBebfyC/yXFuQlfaQigM8=;
        b=rA83RVDl2+eWa7fFz0Z+l0+jSQj/zYwwRj0SSd5mFY5QBhDg5qt+rNnA7J1AaFFZDA
         4uFFbH8tIRm+hleT3hAgCtP6VOKe7gr79XSl1fMuHSisQsgtJM0rrtaS5TaNexzwzx7W
         lub7mzLJHsicmxf8KoQGkm5A+CaOKHkXGaAi7HMnKUsWF67oFahZKFoDcTGgEPAkbLvQ
         DwOY9TesCYS0dhUbQDJeaZkFiSNB7Tp5N8GUob+JDw9s2zUl1byCxhU54OT4up+6hYpR
         vbuaESxFmQnN3EiDcg38TRMrtEcMtxsnS/3+cy7oJbiErq0aQ8HnnnDe0Por5Uw3+ZEY
         dZlg==
X-Forwarded-Encrypted: i=1; AHgh+RrgzT+hvMIom7A6ybr1j+GgaWD9Sv1jqbKTgLnVoVmNUN2IFGAMQflbVj6lyK0esSassVGpd2OHiPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUtrKrTpXd+hpd3kHOcdAvKwqeTWJBmmmEmXGGLDLTBwAKo9s
	R4eHaFAOuTpkRVqVGDMAqBupCxULh+bFcMoLKsxZqTwjXqpnqe5cHP1d
X-Gm-Gg: AfdE7cmXUTlCnf/WmjEAsb5nOvwoaDdsJzfAKwICZ52vylzd7PZc5omXBE0upEFfDxX
	w5liKwXPZRrDwNg/CRwPsYO5N/IwnPFvtVgIzgWGC/X/z0h0C/zHd29H3k8noi5jy70LuRsjOHn
	SOCu7PsGV/PWiT8+Q7u+swdE8ZtZoa2ElOgtX0sD0DwH4GK8+Ddc93pyfbclW5QVB7uzH8BTPUo
	d+X0Y1eVNGNLzmYUJr9XrrgcqCIdgnJ9skm8yJznDDK0teGyfyFkPvvKoYGC4ooAXynSRoQ5kvL
	tAHLUdTWtDISeoIlYOPHsOAVSEXUn1PGSpuz80gWKSoWSAcQpuJFgHnTnzg6eyZ5QegiPozLuIA
	I/huL2z5u0mUt2TNPpw0UbvV95yCE7cVsFOxrFsE3ZgALk/t5AF8+G/2iEThfDTnlKR5Xe+4lmH
	E0wvVxJz53hTHc28jrLo+JALKirMWN/Go3lwq3EEj2X+f6l46B7hRuCA==
X-Received: by 2002:a05:6a00:2d02:b0:848:587f:8ac7 with SMTP id d2e1a72fcca58-848898a7653mr4429488b3a.52.1783830826161;
        Sat, 11 Jul 2026 21:33:46 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a01:122e:6182:a598:483c? ([240e:38b:e68:3a01:122e:6182:a598:483c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-849000ae480sm1251329b3a.6.2026.07.11.21.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 21:33:45 -0700 (PDT)
Message-ID: <40155119-b6c1-40cc-bbf2-5d1bbe5743e8@gmail.com>
Date: Sun, 12 Jul 2026 12:33:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: Weijie Yuan <wy@wyuan.org>, =?UTF-8?B?6JGJ5a645L2R?=
 <chenyou910331@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org>
 <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
 <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
 <alJ7ocaqtpUkCGrd@wyuan.org>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <alJ7ocaqtpUkCGrd@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/12 01:21, Weijie Yuan wrote:
>> For what it's worth, I am from Taiwan and a native zh_TW speaker.
>> That is actually what motivated this patch: much of the current text
>> reads like converted zh_CN rather than natural Taiwanese Mandarin,
> So, back to my confusion again, and quote myself:
> 
> How exactly we define the position of Traditional Chinese or zh_TW?
> 
>    1. Simple conversion between simplified and traditional Chinese
>       characters
>    2. Taiwanese localized traditional Chinese
> 
> This issue needs to be confirmed by the senior maintenance personnel.
> (I will review the archives to confirm. If there is already a clear
> definition, please forgive me.)

Hi Weijie,

Regarding this issue, we also have Hong Kong and Macau Traditional 
Chinese. While they are mutually intelligible with Taiwanese Chinese, 
there are slight differences. If a Taiwan-specific Traditional Chinese 
translation is required, does this imply that we would also need other 
corresponding localized translations? This is similar to English—the 
English used in the UK, the US, Australia, and so on all differ 
slightly, yet the kernel documentation does not maintain separate 
versions for different countries.

Furthermore, aside from a few differences in computing terminology, 
there are no significant differences between Taiwanese Chinese and 
Mainland Chinese that would lead to misunderstandings. In fact, many of 
the current Simplified Chinese translations were contributed by people 
from Taiwan, like Haowen and others. To avoid scattering our efforts, I 
suggest we minimize fragmentation as much as possible. When it comes to 
technical documentation translation, not literary translation, a 
straightforward, unadorned, and free from misunderstandings is the best 
translation and easy to maintain.
Let's keep thing simple, unless sth is really necessary.

Thanks
Alex
