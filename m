Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3755B1E32CF
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 01:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781744706; cv=none; b=LPC/t5iZ9D7SraaUQNv/jDrPYPGiuIRD349skx9wzn7VLl+YaXx7WkP+9dId+B+DM/RQ4kXIZ7uBD5Yjkv9wPcluYdO4n8QO6NK0u7AyGd9HxRbCmBUdjR1udXK/W5UqYaL69SpSAlD4LGAnsD/dVnxaE9gD6pdqKTSsQ2F96BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781744706; c=relaxed/simple;
	bh=lP/UWIR6XD0RATLTWtMbingCRoKAeXTmwz1I63Z3kDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvsiSWU8AmmNuvktsBPDepj+ftKDckzsBSMlbmDpoli77dscFgFaMF8muuccWJE8m7m5V5myeK+G9CHFnjFChhjiF7EfWpwNnoB3cFBXn+7PIdRBNTsKBn/HA8lDf3cdogE61ITE1EH21pac12fZzEJOMNa5p8BZCkglG9zBASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=idDDb4L7; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="idDDb4L7"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-69e7dfcea4dso987888eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 18:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781744704; x=1782349504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DG4WfrI5uGpYpp/RrAn3uAACKhpvlfwH7HOXG2FaZec=;
        b=idDDb4L7ipCbnD0ibjAwix2SbZX0dI4x24YOG+7nA+mBV3LmZAuoB/nIGnUUSbBR4D
         JezRBF5y0utmz16ldF8D2PE3gbM3vCIxVWBZFwPrTEXMEAdpncJMMqmQvEdux9G4UYG+
         oCxn7H4eHCBRFF0+g5dUpB/0dAy9Bmf0Xhxw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781744704; x=1782349504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DG4WfrI5uGpYpp/RrAn3uAACKhpvlfwH7HOXG2FaZec=;
        b=K5FnvKLsvwLphs0bgiLktRh1Bg5z5f0vmEAN8b36mH79DejyeZuxJKc2XJn/f6JGIb
         6eau2ITEkSoqVJztt9UBNJuOyJ08iIAYRhN9cWwP/0VJdBMzwYu3qi1oNNqvn7MBRaHb
         Y2V9hq82/vjChPUa0baewi5PEkimQ+5T0/ggXYiWG7aDY68A8iC4q7PSKEXI3O5OA9PM
         CtcW3edO4nyGemSaIcke9Vxso4BmTyFH0WfAC0D9iKEYYsRqTHgKW9YpAaKYoGao2ROZ
         Ydac5VqC6dYbPTdi24LMjkCQoPG/o47hAePL6sLAvz4gou3gezu0HHkSODOTj+RlUVRZ
         a+Ag==
X-Forwarded-Encrypted: i=1; AFNElJ9aXKFUAfFQ1c43Wf/qGgbSkGhczQSMaZ1uQBCJeWhaQKnxQUQmfUvLeTqXtd/Ie9t2dXWADP32olU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7o1WccLHV7NZYmOsBqVbo0PC26bxkZ6tRuFQZKmHV8+alV5W2
	XXdM+jMhcBAzxT5LQIJlwobTrxQnlk9MEa0NUAwhJ6d/dw/lmXXxPNhkl6r0ypPqIbQ=
X-Gm-Gg: Acq92OEUvvXmxXAWdrByxVm53oS7CyI7dWVrtlPG7DeuyEvonFY+15T6tz/x8H8N1Fh
	a7CJ8uGp9Vs1r3lTuLpTMxmrNh49pCD1THY4AXRgoIg6d7Sz3rA8Kik1oha6ZQCuGu//+zfGlH2
	+PdTlmdm1IGO2LJ9i+0zJdKHsy4qFnNXtye974rwig9hZdyKUTxzLe15ubI+0SI2S00Bs56lOMT
	FfS1i+roore1bWydMFDiCnr699305M4gGy7hKUG9OgUOtJ6nCtapPjr/zow3brW6yVU3t725uw8
	o+n2PeI+9Z/np8WOI37ZApYGyyWhPzh3+s8Lq/2rQ83I4BOQEGPZeD5iR4p9xNJ6y86eUb/FyqM
	y0HSPZ97ngrbCuo5yCbbDVwuCk7Ch7ZzdNYrpfzMnngt8bp6Xv+mbiwXUwsOyYzblERpTYzNNP2
	zT79BMMGlCh+qkNtVi5rc3
X-Received: by 2002:a05:6820:f022:b0:69e:98c0:a91 with SMTP id 006d021491bc7-6a0c744dbb1mr1461703eaf.36.1781744704016;
        Wed, 17 Jun 2026 18:05:04 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44308f09405sm5479598fac.12.2026.06.17.18.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 18:05:03 -0700 (PDT)
Message-ID: <20868e21-ea0d-42f7-921c-987625b4e471@linuxfoundation.org>
Date: Wed, 17 Jun 2026 19:05:02 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
To: Rafael Passos <rafael@rcpassos.me>, shuah@kernel.org, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260617235740.74029-1-rafael@rcpassos.me>
 <865def83-a07e-4eba-b795-7da66e0e2d69@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <865def83-a07e-4eba-b795-7da66e0e2d69@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/17/26 19:03, Shuah Khan wrote:
> On 6/17/26 17:57, Rafael Passos wrote:
>> This link in the docs point to a wiki that is no longer active.
>>
>> The wiki was moved to archive.kernel.org, and there is a warning:
>> "OBSOLETE CONTENT This wiki has been archived and the content is
>> no longer updated."
>>
>> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
>> ---
>>
>>   Documentation/dev-tools/kselftest.rst | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
>> index d7bfe320338c..64c0ec7428a2 100644
>> --- a/Documentation/dev-tools/kselftest.rst
>> +++ b/Documentation/dev-tools/kselftest.rst
>> @@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is important to keep
>>   code that can still test an older kernel and make sure it skips the test
>>   gracefully on newer releases.
>> -You can find additional information on Kselftest framework, how to
>> -write new tests using the framework on Kselftest wiki:
>> -
>> -https://kselftest.wiki.kernel.org/
>> -
>>   On some systems, hot-plug tests could hang forever waiting for cpu and
>>   memory to be ready to be offlined. A special hot-plug target is created
>>   to run the full range of hot-plug tests. In default mode, hot-plug tests run
> 
> 
> Looks good to me.
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Jon,

I can take this through kselftest tree as I usually do.

thanks,
-- Shuah
