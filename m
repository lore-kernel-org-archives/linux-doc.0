Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E272D1110
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 21:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048517; cv=none; b=S4jQivOHNPaGu3PxISZo1jCMQY8cvOX+3z37knJdOdNOt6DY2T8NU8Jz1Da/6fiJueHW34yU/p3OEUA12SyLCmCJTLTMu5juuYCuoEm75Mv5wv1SuvGvr7da/qcNkZw/HID02j00c/gbSUy7ae0NXC0DC/o/+XrS2Xcwd9Q+v2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048517; c=relaxed/simple;
	bh=YqAluL15fN3zgcGp6EDEaNIV2TWFeVKq3zBmJjBsYhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zm8mWYrMFgy2x7CpxQPbzIcLXucvfe9hRygyNoMNge1zqLcfND6CI9iDrxOb7hczQGrwD0pk06BYY9YRi+wjnz/LVjezd1vLGhdWXQiAZ5tIHX2Q07HidM9CeMla4vfYwivk8mz6Bzf7Qhdh4nhA9U03bAGxKGGG3JcMIqBzamk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T+NlcjjH; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T+NlcjjH"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d818add2a3so1374345ab.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746048514; x=1746653314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6Q234hicpNrTkMdew1fU6M9FGq8oUuHNboh5He87eU=;
        b=T+NlcjjHuHfA1JZ28bnYk/soZ1SoT13mYL4RaL40AWdUr1fAdgxW+Y8zzySFN80eAi
         BuVIIdlth/NTT9r+2viqQp+ypCmBLrNTAUzV4kB7IrtoddZ5DgQjgBtFD4drg1Rnpojs
         8ZZJvzvqoQCHVTm8gBT3SN8ZVjPkrc54FcLh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746048514; x=1746653314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6Q234hicpNrTkMdew1fU6M9FGq8oUuHNboh5He87eU=;
        b=SPBJctKizaf8iPe7+8ZovW3fFIf3kCDvTO6AL710wUbe7M7utFl1AVbJ5sODr6XUkg
         GUtkJG0pOJz7t1KICnHZ9VSydd8pyKNeGBFnP9htwV4aJev7v7n9tlyXRRB7/J5DypCN
         evnHYAes+Fg6fpUKm7y9LcMaznZtryBLDZ1v2LT9KOEKCeVjsiwrP3QqVq4RTzCrRIlp
         nHUtMvYWkDkaa3HBfqAkDkPYX0CklcNTG3XIMphN9TsEpvytlJ9lEjKHYkNarD3JxifF
         ANTlLwOCZaJw7dPMxNUE/9ph8c4m80PSBDXVxvmqREAyO+eacDLMJTU2u8Otfvd8k73M
         xqHA==
X-Forwarded-Encrypted: i=1; AJvYcCXaVrfNX0c3jJ4PhAbFFBV/Kd24ouWwwdSIARo4hq6X79qKQhfnDKaowf5vRItZlxde+CzKQpZxttE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkm5gTcymZMyJzt0ibJSLhGldA8MyzYWyTJcW60KwQROZ/aLUR
	S3hN5gka/GFVTvNe/yI4l7QjWp23fnvBdobhiuALgFSSzVCK6xtNv3fr3CBDdxI=
X-Gm-Gg: ASbGncvNEGe3aaWFSOhAMZnstyrozH855ElrjEsqn+2MiY2rdjFPb4x835gWChNinV6
	Bv/wPbsOt8yNuP7HBa/cJZck1m+fLNzU7X7z7DJrNYdJh/XAFq7BLOOa614b7G76cZjlQ6nLYt0
	nu+6MSBw2cF8x21UTZxQgQ/G5SKgfr+FBQoIp56tvutqCsAtVSb5BEc+4W3sQWeZn5qAeis8UXo
	zbJ3nMqeSDe0iAvFytwrhPYl8fMf/0LkNg1PVAm1OEjFYAhO/U1YC5qAdBNOXv4gHNFJkr4FiK8
	/haluBjBvxIi+eTcAmujQDdPrdBry7IDI1/rnxTTBAsN5MhDkN3PGz7l5jZVsQ==
X-Google-Smtp-Source: AGHT+IHr33UkYRxijRAM6C0PAuYUzQs+dTqaVy/R06IhM3g32uMluoDz2LA9U/xU2npCtEVgmVtjpA==
X-Received: by 2002:a05:6e02:1543:b0:3d9:6d60:709e with SMTP id e9e14a558f8ab-3d970a946afmr491905ab.4.1746048514197;
        Wed, 30 Apr 2025 14:28:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f40b9fesm10153365ab.49.2025.04.30.14.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 14:28:33 -0700 (PDT)
Message-ID: <041c11ba-476c-4a2f-b5ba-d686d403a023@linuxfoundation.org>
Date: Wed, 30 Apr 2025 15:28:32 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: add tips to clean source tree to build help
 message
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com,
 corbet@lwn.net, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <dc8f4035a8d493be9ddc0e868a3ffd67626cca00.1745965121.git.skhan@linuxfoundation.org>
 <20250430071825.1e196cb1@foz.lan>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250430071825.1e196cb1@foz.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 23:18, Mauro Carvalho Chehab wrote:
> Em Tue, 29 Apr 2025 16:27:12 -0600
> Shuah Khan <skhan@linuxfoundation.org> escreveu:
> 
>> Add tips to clean source tree to build help message. When user run
>> kunit.py after building another kernel for ARCH=foo, it is necessary
>> to run 'make ARCH=foo mrproper' to remove all build artifacts generated
>> during the build. In such cases, kunit build could fail.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   tools/testing/kunit/kunit.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
>> index 7f9ae55fd6d5..db86a396ed33 100755
>> --- a/tools/testing/kunit/kunit.py
>> +++ b/tools/testing/kunit/kunit.py
>> @@ -583,7 +583,7 @@ def main(argv: Sequence[str]) -> None:
>>   						'the options in .kunitconfig')
>>   	add_common_opts(config_parser)
>>   
>> -	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests')
>> +	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests. Successful build depends on a clean source tree. Run mrproper to clean generated artifcats for prior ARCH=foo kernel build. Run 'make ARCH=foo mrproper')
>>   	add_common_opts(build_parser)
>>   	add_build_opts(build_parser)
>>   
> Would be better instead to detect if the last build was not done
> by kunit.py and call "make mrproper" inside kunit.py?

Detecting last build and printing out the right "make ARCH= mrproper"
command is good. I don't think we want run the call make mrproper from
kunit.py - this shouldn't be a automatic step. It would be annoying
to loose build artifacts if it isn't what user would want.

thanks,
-- Shuah

> 
> Thanks,
> Mauro

