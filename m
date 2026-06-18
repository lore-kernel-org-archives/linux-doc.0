Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC9E30567C
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802127; cv=none; b=PG8c8J1csdQQQTv+3VHbRDLZbiaVVs8HMzDrz3I/WtDJqbzVe40HVkPvAakZ5YUOtv+fTNYNc2D7KraJ0zwezpXyZKG9btAftXyFfLKvRxYcNw4r8Gh0CIzpB17qu8zEfOhikFTp5O1woicBeVrM1L5HcTnChSObcNMcLEaB8fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802127; c=relaxed/simple;
	bh=XaV8a3UQtqcjTbDhXEAibebtLvTrsKHIKVmJnslIQyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJsq2UtopN+G3gh7CD8r+MzMLcW+i1VHaOsh3xc0Eko+XRie1MlVJ1TzWbEMcyQlPs86NQVWWfg8VrHg8du26KxkuMCJGgnrK3RteS607geML77SYp3Mmc4cQk35A1hJg81Khf1BbEXBq4GgpUMrTLZXE8NziWvPSTQDS7Y+CfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XY3qaOTL; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XY3qaOTL"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e71198e0adso449062a34.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 10:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781802123; x=1782406923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Dshu88ZuhYuScihy4XNQcAaIDZZApNzfPKmeuN1s3E=;
        b=XY3qaOTL5nHAtTctQHjFSPN+I2t5UXwPxuyY43GODQNT/s8LfGp4wkkTMPCiW6vOB6
         M3u8bdy3hkKGuJlnWOSKVj9+GzlaGfiZ/Npd5QLIhj8colHGASNrm6vfdYUR2qhpU01V
         6HXzh0oYkR4sIOB2IXt9U/pYewbCNAPj2e3ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781802123; x=1782406923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Dshu88ZuhYuScihy4XNQcAaIDZZApNzfPKmeuN1s3E=;
        b=A6jL/87I+Emzh2Bogia0YWf+JUpgkz4o/g3yPlC8fVBIUVfJe4t8Mb7MezJfAwWFJI
         rmJGmyfMyUHXGJNxhwvfNxr79hAuycYA1yIir26ocP64QvEhpKGY1PBGWtgQeAcsZiSE
         QXddpmJwT8kQ+X4UtuSFQMb2zMgaiUO1qhB3HK7Qqct7Qjwy3+KbVIYIcNM7sl0OAha0
         F/184CFtCFg95DX75YIa72hpJzMvVMEdtRH1sHtYX8NS73UAsjv/8qRWMeUNpSEjf9WE
         5jzOu2nroN8u/jvU3a1HEdL5P9GXurAFm6XbKty98DTepcxmKezt83Amlqui8+kIOBVn
         p6jw==
X-Forwarded-Encrypted: i=1; AFNElJ9E09KCbsXCi+MveVANFb60lsaocXZ7sRg2AyKq0KAVi3kD+QNoE/uziwnBbCIgj2HPp6MJZLh44Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc8iHXSQZdKtDZIC+TcrmSorLmqy0ZUtzhS+Gp4fvxaiUmBGOm
	/wsicRrxL3Ig0iPqjoN255wR8Oxmcmc2HnC4Hzs/kKcBpN5YNPbEkUPvpwXxMCT6M1I=
X-Gm-Gg: AfdE7cmoCY/2tvifbYg13kbJplAKMOdF2qzz7MBi3kye8HnN3r3St2iJNQN0KLcyKcn
	5JmqTI8mPpwjTrREqCxLGxYi2ZPMp2CEhIJoJUxh/6HAqSb69lYC6RX+m4y0oUMOPi2bgU6lOBo
	DY+GvrOxOo/sYBVRpr+jdGL1FgfpEgQFLa4CsRD5zDdZgbpMlgZueGzKyfC8zaa4J7M6r8RW3aG
	RKt3MrDzaNV44iomkDpiyLCrOs8upVK8jnvm92skyQVeTMmoryJoMNJrfApqLg/sxbP/mmQ/Sr1
	al0XOb9p5Q8Y9Xh9GkhJ+oBNEH0hlwc5hMw1thD+P4H05UzEE1mmbAhe3eXvd8rrwDyAcjsyYTQ
	TQwAxz7UX+4LNlid+06oJgPxyCA5P1iryoNvIpAh+PxJk0usVfDxmagyP75mQ+y3rZbpRBEfhjn
	oairushaBF0uHfnk/bgoSu
X-Received: by 2002:a05:6830:6b04:b0:7dc:dd19:7f53 with SMTP id 46e09a7af769-7e90c8f263dmr7321421a34.14.1781802123216;
        Thu, 18 Jun 2026 10:02:03 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5a1b22sm12489190a34.2.2026.06.18.10.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 10:02:02 -0700 (PDT)
Message-ID: <1306d609-3375-4f52-8239-b4c2fffb7bec@linuxfoundation.org>
Date: Thu, 18 Jun 2026 11:02:00 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
To: Brett Sheffield <bacs@librecast.net>, Rafael Passos <rafael@rcpassos.me>,
 shuah@kernel.org, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ajOvQKne74gN-7Y2@karahi.librecast.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ajOvQKne74gN-7Y2@karahi.librecast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/26 02:41, Brett Sheffield wrote:
>> On 6/17/26 19:03, Shuah Khan wrote:
>>> On 6/17/26 17:57, Rafael Passos wrote:
>>>> This link in the docs point to a wiki that is no longer active.
>>>>
>>>> The wiki was moved to archive.kernel.org, and there is a warning:
>>>> "OBSOLETE CONTENT This wiki has been archived and the content is
>>>> no longer updated."
>>>>
>>>> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
>>>> ---
>>>>
>>>>    Documentation/dev-tools/kselftest.rst | 5 -----
>>>>    1 file changed, 5 deletions(-)
>>>>
>>>> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
>>>> index d7bfe320338c..64c0ec7428a2 100644
>>>> --- a/Documentation/dev-tools/kselftest.rst
>>>> +++ b/Documentation/dev-tools/kselftest.rst
>>>> @@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is important to keep
>>>>    code that can still test an older kernel and make sure it skips the test
>>>>    gracefully on newer releases.
>>>> -You can find additional information on Kselftest framework, how to
>>>> -write new tests using the framework on Kselftest wiki:
>>>> -
>>>> -https://kselftest.wiki.kernel.org/
>>>> -
>>>>    On some systems, hot-plug tests could hang forever waiting for cpu and
>>>>    memory to be ready to be offlined. A special hot-plug target is created
>>>>    to run the full range of hot-plug tests. In default mode, hot-plug tests run
>>>
>>>
>>> Looks good to me.
>>>
>>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>>
>> Jon,
>>
>> I can take this through kselftest tree as I usually do.
>>
>> thanks,
>> -- Shuah
> 
> Hi Shuah, Jon et al,
> 
> I've been trying to get the same change merged since August 2025:
> 
> https://lore.kernel.org/linux-doc/20250824075007.13901-2-bacs@librecast.net/
> 
> resent in January:
> 
> https://lore.kernel.org/linux-doc/20260115172817.7120-1-bacs@librecast.net/
> 
> It's great that this trivial fix is finally getting merged, but can someone
> explain why this patch was accepted in preference to the one I sent in August?
> 

Brett,

My apologies  for not taking your patch earlier. Considering the effort
you put in with a re-sending the patch and following up here, it is
only fair for me to take yours instead. Hope it will apply cleanly on
top of kselftest-next

Rafael, I am going to take Brett;s patch instead of yours.

Apologies to both of you for the mix up.

thanks,
-- Shuah


