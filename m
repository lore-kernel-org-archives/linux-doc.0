Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA332DAF8C
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969682; cv=none; b=C74WQ9/Uy0352OgcJQNR8r4dv0l7vtOQtsxRUXWs40V91SrVkpGRMDOvwGDG+s9LD4zPQc0+kOTudigaOvH+XzUx05T/3jFRx4A4z9agEa6UOaZOJY7XAz5A5bv/OPlTqiWB4IYM32RLj3mgzG+PvZDiGpE9GQv9aGyVI/RLbzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969682; c=relaxed/simple;
	bh=5PpGCLInumY79oCa5QN8pCEtkY3g3aL7RVIL8qW8exs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLEE1W0wPIeJRgr0Dw4nHLdDTUDxCo29HbYah4i98w4BO3Ixb2llt4n+OBY5lTvUpbUT/wXcohlXn/g7+STHJwiAqE2PDKg8AZG18dUoUrHYiQU83QX0mXpLrhK/W/KdvHUZbLylOojP3Naa/GnTtE0ZRWBQBl1KaeBgo3+e3eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FIjXBDyF; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FIjXBDyF"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d940c7ea71so21770425ab.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745969678; x=1746574478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4gYzRxDTMG8a8m2JVbMN+mLEBXzCwIBH9qxkDPGLkE=;
        b=FIjXBDyFl88sVU3HjaMuUwgelG7rsXRL05jT7yq7qmgYDFCRzIUGkqQBIruLmN2DoF
         agR23e3CeQ8m3xUBTJYcQ55vkNL/QIQcfTR1h7r+Z0zmQrb1hY4wZEeUCoFZwq5S4bEd
         CGoamXcOdUOqGF/Tk7w/hWcnH/lcA6zD11GjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745969678; x=1746574478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4gYzRxDTMG8a8m2JVbMN+mLEBXzCwIBH9qxkDPGLkE=;
        b=bCvKk4/3j6IiLDb4tBzJc063LiOjobayxh/D2Esx76n2OCuUx6wziWsYrbKfr61004
         erRkauH5jZpdtnYkOzXeGYebx4SzeE/2F3+iqO48DvQNNikR0Lnmol+dF5p1EBaJVUra
         0LDU9dawr0RfWQfdbcf45g10Nrn4ai/AB72hlSKKh5pcxC7QfxpnGQTF7qK5P3fwzv51
         qT9/9W421LrVeDJUTEuMDXeBtU22YSPx3B/Q0HWEmhm37Z1rEPyubuQrXk2crefUx0yu
         EWNvWV5Z6hnOD26lthmhTzQNRZc/o/Cim15FgVnBXMxGEKmsDWAnIemR/MoYon3BTu8c
         04HQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6u9DQU+aL7I1b53OaQu6+H9V/wdYI1q2twM6oaX9CBgPNARsvXgey8wsqa4m6Wyz2kzeVnQt9Pjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Hm4ptVvA/iTbK1I6PT9qO0RtlNqJPv+VcP5u/TC0AaHtX6YM
	NwvlowkUvEu/VhLCb1q+7tzWcPJMUYSCKXpcyvC/qBgmlphIAaCt6EVS2aR72ioqbRHk35bLfS8
	9
X-Gm-Gg: ASbGncv4D4DZN15SPtwD+/2mOjv2gKWamCThh0+CFrzA6HKK/htL3yMrH9/ex4Iuuvn
	df8oU1V1uPrqoYsEgyChYUUDIuYjSCY4p4LnNsqs2lgc2cnkxO/Q/JRwjEjqIsXzyvzCPQffZCJ
	mcoNGstsWrTTa+2iQ9msWzdMvOxNYuLeim44F9KldaiWXd8fLMQ9d8kgekoyUIBAemZQ49wFCrM
	S5QHA/ShxTXykx/yuddGzSa7OtvcTs2FWsunKbZkbUBqlCNxsRdFbZ0Ymg5IASNfZsVVsfrc9mg
	+p/TOgRzRCffbJ8hFxUh5q82wAV9lJFPHkeWrkK2FdkftaIvVdE=
X-Google-Smtp-Source: AGHT+IGOjy3LeocKf8YYHPxXWO9DsgVyLTc1222evmd5AAMOYmg3KWF6p2nXzH2m9ZsGo+Z4im+xEw==
X-Received: by 2002:a05:6e02:1a0d:b0:3d0:4e57:bbda with SMTP id e9e14a558f8ab-3d967fa17f0mr5478365ab.1.1745969678668;
        Tue, 29 Apr 2025 16:34:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f48030asm5366935ab.70.2025.04.29.16.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 16:34:38 -0700 (PDT)
Message-ID: <9477f8e9-b17b-49c3-a957-849198251082@linuxfoundation.org>
Date: Tue, 29 Apr 2025 17:34:37 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: add tips to clean source tree to build help
 message
To: Jonathan Corbet <corbet@lwn.net>, brendan.higgins@linux.dev,
 davidgow@google.com, rmoar@google.com
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <dc8f4035a8d493be9ddc0e868a3ffd67626cca00.1745965121.git.skhan@linuxfoundation.org>
 <87selqlh0q.fsf@trenco.lwn.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87selqlh0q.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 16:49, Jonathan Corbet wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
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
> 
> Nit: could perhaps that line be broken in a bit more readable way?

> 
>    	build_parser = subparser.add_parser('build',
>          	help='Builds a kernel with KUnit tests. '
>                    'Successful build depends on a clean source tree. '
>                    'Run mrproper to clean generated artifacts for prior '
>                    'ARCH=foo kernel build. '
>                    'Run "make ARCH=foo mrproper"')

It improves readability. Will fix it.
> 
> (fixed "artifacts" while I was in the neighborhood :)

Thanks for catching it.

thanks,
-- Shuah
