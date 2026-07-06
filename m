Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2546E25FA05
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 04:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783312921; cv=none; b=bSMnTnqe4MBlU59OOwBqnIINIyPCIXHvpmsXAXChFwAhL4kHO7136LbuNXhUG70oxtGQW5HJ3ovXUTa39QBO+PIlaEzGT/P+RM5R66OK6QbSInR37jmdSXyrnO/BLNIbZW4kzojAWitmmDqEfW9wfotgxgY8EfKxBHRd41Sb/pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783312921; c=relaxed/simple;
	bh=HO7j9d25A2cB1oMUga2zN18ssrjm2JjjQxJR7AEFmL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IyGlYT9uCRijE+fF7AAicmBuKTNR4Cd+TQOz9ja+/TQJl5dxRlgicJRrdvfiSU+IpZzGsm0u3EGcNjPIOJLAhI7k6ha+VybFnGLjPsaGNbG2v/aRGM0ERmhoip6k4smDPGOFT0/fymHOYat3ZgIVRKYRv6shD0MPJ8vF9nv/4qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/UgqI8l; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/UgqI8l"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8143daf89c7so21655657b3.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 21:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783312919; x=1783917719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=59VA+2WQhV/xwTEhpGDxGn1crd8YdD2r2kEXteaZhVU=;
        b=V/UgqI8lilwIDMg/DuHPVXsC6A2S0m/b1Au3SJQW3Pp6ZbRtFuv0WxLSdpbFo2sgMb
         FhwTcnxNeSjFEcwPxiPjWCAf1DMUEKdCdyLqrpTgGEVixGSlig5IPMJSbeqq5M7H5zoW
         WScc6NVIb6641rGI04+1bAaWYCox9uqItkfdp72o7e77+Zd6nt8/OdLbyd4otfRxMbmr
         ePaoxi+tc8qM9fjlymxaecn8Bo9+71O9iJ0suXcKlYQPp8xUc4I0I76Riq44hfEAkRD5
         v3tY6qzpX/xd8I9VuSIFptAsFW3gbrOvL33PXTjj4g9OJ8t2nPPLSo/p6J1e7SGu9Rlp
         o4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783312919; x=1783917719;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59VA+2WQhV/xwTEhpGDxGn1crd8YdD2r2kEXteaZhVU=;
        b=jp0VV4558n4tUry6TI3LUXbK1jWemW7Q/u9gHDvF+qJq6kJvWegdgRTYe3gRzgOSMI
         KnDrfj0z+dv03UDZZ3xvuk/5t+QOjMDNVLN2vKihxSDlWQ6fW8KGGwSZeg0yduxWp58i
         DBMlu8zJV0Qw5Nkj++9WF0qPvgpC1f4d2hVSN2j9GyXaL4LuZy7OJ9ZX+2K0LlUViEDO
         7hohMLiAJgXT+qLLnICKSgARv+hP+fuQobHxNo657QeTos6siJPfIHp5ynx4/DIMIVhF
         IsBNo4tQ+Xzpu/9JuhOr6NhBy24vl9msOZkHx8XF01FKZwz5Exnh+DqqsSIigYq7JoAC
         ve5Q==
X-Forwarded-Encrypted: i=1; AHgh+RozUJCKXkY7njYfa+oFu+x5G2G1wQJr4vvEo/fskbAvSCXIcJd2NHscEM4KasA2JCwS7Rlh9xVlDxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd1W3T2ybvv2cDXjp4Z7ycHEerp7p7nVJaICLsu1f2x/hzOVg+
	4+YHE1ul9FEvp9jmdVJ8Q55iuFXaxXmBpW2cny1ryUKUDMkQDhrej7+X
X-Gm-Gg: AfdE7cnaR2yy8C+r7yEEU17WG3ldwSnpJWXwFr/jhC0U0G1xBIe9yOYYRZl/cMCZYT9
	6q8OvFpvtBk7s3yOBf70rvstn5FrGPb3Yx4BqJP5tK1WRWbj80+xLP/Y9rSbltfuNLb6TPYi7KZ
	vhudqeCjZ657ufzCaW+9BEVQOzJXRkLr6f79I6L83F0hZEkfuuWOEJcMcZC3nQ6VDGuWhQgRpoF
	Pwcbe2ExyQjFKbspDOwjAR+MD43gktp3sWr2qmTEHK/tQLGv0pe1HKk2H2Q11nqaMgOsjCCLHSj
	USMwQKCjo95gQL4Xodr1mg6ZpsOxi9zga8XgeBnNUBOYF1F+yMDp8YVm4IqG/5aldeOrjimHEMj
	W/VQhF8h1iwmZhpIrLOQHYf7RI+OI0j/QbxwMyBBcQvxy8kmeMI4yU7HTfqhobtSzSWfc5y53Lt
	xn1kmI7gM1J2/XNuEDAk28fvOpCsoPLue7c3M78Hs=
X-Received: by 2002:a05:690c:c4d0:b0:80e:b611:7e1c with SMTP id 00721157ae682-817399eb0cfmr86927257b3.51.1783312919159;
        Sun, 05 Jul 2026 21:41:59 -0700 (PDT)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783cbcesm53037547b3.10.2026.07.05.21.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:41:57 -0700 (PDT)
Message-ID: <6f32b61f-b9dc-479b-ab8f-91f096570c4e@gmail.com>
Date: Mon, 6 Jul 2026 12:41:45 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] docs/zh_CN: add LSM/ipe Chinese translation
To: Fan Wu <wufan@kernel.org>, Yan Zhu <zhuyan2015@qq.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, mic@digikod.net,
 dzm91@hust.edu.cn, skhan@linuxfoundation.org, gnoack@google.com,
 linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
References: <cover.1781105672.git.zhuyan2015@qq.com>
 <tencent_DADDE291CA580302EB7BB40B83A552D6F006@qq.com>
 <CAKtyLkE3unhxMsH1LpqvjHQoKVgz1tcTsZWUxNHs+R6v2amf6w@mail.gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <CAKtyLkE3unhxMsH1LpqvjHQoKVgz1tcTsZWUxNHs+R6v2amf6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/6/13 10:54, Fan Wu wrote:
> On Fri, Jun 12, 2026 at 8:59 AM Yan Zhu<zhuyan2015@qq.com> wrote:
>> Translate Documentation/admin-guide/LSM/ipe.rst into Chinese.
>>
>> Update the translation through commit d7ba853c0e47
>> ("ipe: Update documentation for script enforcement")
>>
>> Assisted-by:Claude:deepseek-4-pro
>> Signed-off-by: Yan Zhu<zhuyan2015@qq.com>
>> ---
> Have you tried to refine the AI translation? IMO some are really bad translated.
> 
> Also how does the doc translation project work? I do notice there is
> another IPE design doc translation,
> https://docs.kernel.org/next/translations/zh_CN/security/ipe.html
> which has a wrong "original link".
> 
> -Fan

Sorry for response late.
Like other kernel patches, you are welcomed to submit a patch to fix it.

Thanks
Alex
