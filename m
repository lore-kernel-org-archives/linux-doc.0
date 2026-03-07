Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6882877CB
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772892438; cv=none; b=B9TBKfqspV8amLzZ7OVU1bl23u+parluq8SzMwc9jTqDJ/LjOGSpCQfSWH+CEneUGE4AwsurirQSwIFw1YkNS1uFS7RlkxbTBCHCKwxnVx7XR6wdc8Vija4F8FoWYwZh9odbiKOVUuMBC4iZ8pw3MCxtbDRD+UqNFjAN3YnkZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772892438; c=relaxed/simple;
	bh=VyaZ+rm/0GVNpCP0lJvpfoPu510nYPfhXJb+4WZRikU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHAfc+0LIx29kvmvGt3VGSLKrrohX1/sTQsJqj36awgvEgWWQqdcu7sQqTyq/raBeZ2NaJgHohAErqIve6jZaMBbuQFWOqZ8OlTbzXRt2L/p9/wqQxM8n5MPTAgn5h97B19W0O1DsneFG3v4FW6cacLJyinOMq9WibPLW2PbFZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNcl1B7Q; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNcl1B7Q"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-359866a1d02so5952522a91.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 06:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772892435; x=1773497235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WOd3l9PVkE2a24D4Gmj82SUZ1Y1JiN/IRysdT3922g=;
        b=eNcl1B7Q3SKf/qbkv0WJt1QABog1b1WW5fWcGxKfbqlVZczYTWCBL9iNuXNWzxGlEl
         M32gHOXtEr1gQqUJHyjw500pqgqz3c6G42mSAj7uv1epFhfNXjHOSEsGG28Xce8clkM7
         yuLKNlHRAwcAvlzj3S6xJ9gd2wMI+okiC6QOjCgYoUdDSMe7uwBCc9uyh70Nc4G4ixnI
         cM1S6wTgnJ3kle5nNr+5Xp2iYdCV43cb6+IbfjTUTIE8gwlBbbWqAugf7tQFHioMF1qh
         EvRSmWn3XGBJen4LnIS3v5lxTViS9ih+SO70LOnBkabb9Moxrnabdm0oXS574eUHb6ri
         N5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772892435; x=1773497235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WOd3l9PVkE2a24D4Gmj82SUZ1Y1JiN/IRysdT3922g=;
        b=mUfGby5bZi28YLI15KC6MAixthDTfVNS5C3a/qvgiFLWNTdL9WETrjbYtC56oSsRHN
         W/U4k/GHp1wpF68tAuvrEQwZkfojZGjqcJzUKurLf3SP2KhY9+JUjFOXQG+kVoGTPUWL
         My8hRWrkyWKhpvSdZvG70LLOkVdQHoNBkO3YcXiDfFf6dtzqFe8Ak2Z7JX/ht2NJ3Z9Q
         SLj6tT1WTc7Y5/qZNAzaPJQicogGvKaWtTbZk+sFdnLv4aTGr6WAJR2Ry74uqUgcSycd
         5S4pVGBle/+752NrtYGiTNgcxFNzROViw7XrbZeoH+n4zCm5KJtz+c0FVv1nFdE7//3z
         KG2A==
X-Gm-Message-State: AOJu0YzMDcczFiERQ+LxLLsNMEwI2s5Pn6oFAs1g0h01IpDenvJ7UyeG
	/irIWCZZqv9hWCAPxun5WPXwvc8hfrXLuslXh/E+oPThEcMpf4Z0sAVD
X-Gm-Gg: ATEYQzz8xq0hvkOh/E6DiXi8j3SyN3NVGEeTPTr4vS6k4cEVDmfcmLOZ7xhQvQ+YtPS
	msk03lQrKyX8KNZHz8kFh8VZZLNBBe47gQkZpECUItqq8sXKMT9mk99A5GuhukSVRzsABxTR6sX
	P+zRfR+wkwJV9sxscPYFvNcCempRC1Jw/NP9dphrs5weq7+P81/CnKZudiBjVM5EHrq3yh/niKG
	xJCj+g1IKcG4EcVMIfvzd/6iFHAGJnVdHFMDwNam8jB4Om/4DD9lBFxo9PePkxG+ZX/86ADrxOr
	eR72ClfF/DQvcGiO/t0y5jw8rkfGYvgZ6bcusWM31WWh54o/mOWY+dL253HflzQHgSsVXwkI/a2
	gCCCcXv81JZ9H9tNfiNXum22jgKFg8x9S1Xq6/s42ndb1QRjslZVF8srFav5xmPDhBOOmmYCAmK
	4mOEPdXHxMgLuc806GhRc7jdL8KtuAPOyPZSdA6NWo2n2oXx3ENFDqOf43ny8Er4sO
X-Received: by 2002:a17:903:2ac6:b0:2ae:7f49:dba6 with SMTP id d9443c01a7336-2ae8238d8abmr55439905ad.17.1772892435007;
        Sat, 07 Mar 2026 06:07:15 -0800 (PST)
Received: from ?IPV6:240e:38b:d99:bc01:341e:1c8f:2931:de35? ([240e:38b:d99:bc01:341e:1c8f:2931:de35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f751edsm70909075ad.50.2026.03.07.06.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 06:07:14 -0800 (PST)
Message-ID: <70d1d7d9-01f0-408a-a49e-e94f2208e421@gmail.com>
Date: Sat, 7 Mar 2026 22:07:04 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] docs/zh_CN: fix an inconsistent statement in
 dev-tools/testing-overview
To: Dongliang Mu <dzm91@hust.edu.cn>, LIU Haoyang <tttturtleruss@gmail.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305201100.10119-1-tttturtleruss@gmail.com>
 <062e7436-20dc-467f-9a4d-787eeec19228@hust.edu.cn>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <062e7436-20dc-467f-9a4d-787eeec19228@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, Thanks


On 2026/3/6 09:29, Dongliang Mu wrote:
> 
> On 3/6/26 4:10 AM, LIU Haoyang wrote:
>> This patch fixes an inconsistent describtion in testing-overview.rst,
>> which should be ``kmalloc`` instead of ``kmalloc_arry`` according to
>> the original text.
>>
>> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
> 
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> 
> This inconsistent statement is introduced in the commit 
> e07e9f22259ede8258c00cf3358a44eefa1ad7ff.
> 
>> ---
>> V1 -> V2: fix some typos in the commit message
>>
>>   Documentation/translations/zh_CN/dev-tools/testing-overview.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/translations/zh_CN/dev-tools/testing- 
>> overview.rst b/Documentation/translations/zh_CN/dev-tools/testing- 
>> overview.rst
>> index 286ed6b01f65..8bdc51b47b5e 100644
>> --- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>> +++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>> @@ -154,7 +154,7 @@ Smatch和Coccinelle的强项
>>   Coccinelle可能是最容易写检查的。它在预处理器之前工作，所以用Coccinelle
>>   检查宏中的错误更容易。Coccinelle还能为你创建补丁，这是其他工具无法做 
>> 到的。
>> -例如，用Coccinelle你可以从 ``kmalloc_array(x, size, GFP_KERNEL)``
>> +例如，用Coccinelle你可以从 ``kmalloc(x * size, GFP_KERNEL)``
>>   到 ``kmalloc_array(x, size, GFP_KERNEL)`` 进行大规模转换，这真的很
>>   有用。如果你只是创建一个Smatch警告，并试图把转换的工作推给维护者，他 
>> 们会很
>>   恼火。你将不得不为每个警告争论是否真的可以溢出。

