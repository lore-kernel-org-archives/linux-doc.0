Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F42149C50;
	Sun, 19 Jan 2025 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737315634; cv=none; b=BCybmXncchJq0yQ3YE82MD/CPChNKjMkmHzgLg5q78FPGanaP2mcFyTfN7aJ0mltdFm5Nv9Hm/UU/oQVYGh7R4r0HOU0D4FFYx/aQeapLaWjNQAGj+u+LkpOGWV8S/Ws8D7rUYrDzGWdDduQPja4EGSkgw2gW5oxrzZEH87/Ynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737315634; c=relaxed/simple;
	bh=UwU1UylnT5FER1TvUUwGviWgOofcG/Bz6hDioxaqVHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gra6pXMbAzIz1zsDUtNar4gcbwJdJtjObf9Wm33wNpdA8c/d9Whj8WwoddmJDl74I98FE05KObpDmkGXXCn0DSAikdTCCjFc6SYVLHNF254es9J5XM8YYvvvKhWaIoThoZDe6R3ykd1mW4qNzOAsOmIJBkyg5rR4WL99KJFv4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkhRazV0; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkhRazV0"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-724a5d04befso814825a34.1;
        Sun, 19 Jan 2025 11:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737315632; x=1737920432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4n7bHHbDtLDgoIoLR/tcabLLsd/0VdZK3lKcincwKs=;
        b=FkhRazV0hkBQX9c3yMzi+gbWbYVwCbOS+AxoBxj0nzrirPfjj2+IuF90jGJIuzrpa0
         rc65RQmcX8qbdBQpOq3H43r7M0dvyBEnB/BLFvxYSn7d43kWRut5IXYB4XgAstefKLXW
         HUPxb9RJIRN2cD/zbKI2P7raUtclItKgzu3hhgCuKdtNUN9VE6MniiA9ogtTvBU82oeq
         UR1E6VyLwE+C+BBde64qOGwDk4+kIoDV53E1OLSPLEUvjk3dbu0m6E1BQP/rYGN2Qi59
         hfBY2yR5UQ5pUhJndMTqRYW0REQsIHB9NQapJDxt/qXo9CZVi945OAyIWO48g80mvyi/
         E9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737315632; x=1737920432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4n7bHHbDtLDgoIoLR/tcabLLsd/0VdZK3lKcincwKs=;
        b=T07XeyFuX3nctFqZBaxuwS0VHlGrfkJ2Ic51ImyGkLIP8Wgu6IFqVZXe0hoDJW7IHY
         Xx8pxtEqa4aktbmA7HpDOSP9n8ejxhnPALCrTnRMeyZnn+745GBRBTU7wzTQM94pas+3
         K4SfetfH1F5KzK5Mjp4I+h9TCJD8HDyDtwNXbESGIuqECslhVDwcRcQuNX8lM56fxHB6
         wAsn0jfQe6oEPoAD8wRZyGYZVvr4xTTrrWgGMgkYtY/gfHy3TO2DEaNHAe6PPtGkqhSn
         DXypDcLjZTJmSlRZ+3mvvulsZJjpsVRJDXSFcOnK2n/TRjZaIsxB/8s/tBa51NSY6r9S
         66qA==
X-Forwarded-Encrypted: i=1; AJvYcCVdGk0Jp3gt7cwUi2BhfcWLckndCwWA0wQLnv3w4Cl/jq3ns+BpyDhsgAOrXx0jAPPlL6thBVrx9sESQ7T9@vger.kernel.org, AJvYcCXHU9j6vKCak+Un5iPm4KRwIyCvUo7GDb1PdRViGTI0YJHJRQZFD7vGC9G60RDTJFNu/iO+Go7W32w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW2NXutLckAKIL/gImQpvdtfgSWdaON4JfuF5vXQ1YPOYyMzei
	TGv3FAXcah1vXtvPLwiQCsZbjKBJSJroFxc6DXikvoxfVVXSt2ou
X-Gm-Gg: ASbGncuRqfvKa7wGPeAs1xRdLgNHahhf24nzNn443DuIhmKbfhao7dYpT5EVhPJDxk1
	iyTBY31lmXGlY7WoBo3IxaUXh7tqWDk0XdMKpj+1f3YAdiYr/d806s13ZE54DnX5AVKnn1C0hib
	hrRR3optQiDsHbo3KxePCFwLJAw9i0xw5FxiXJZxL+qSKSm3sc57d7TKnX41WC8ZBBodceLs6v7
	s4bzTs90c8NiGKNlzHDV+aUxIqy5Xh/DqAqxN682rubynMeWo5fPofI58SSmUqjDqLo5KI1EJA3
	kW0+OoRu2xtpZLMGlwSMNVH6nO4RHKHgFPA8W2U2PqaqPb0jjgzyyNg1Hw==
X-Google-Smtp-Source: AGHT+IHY5FgP8sRgW0FmyFnm9TxQvyfYTHJ4bQ2u2O5mWhw0rIG/lo4tPtc5PKfrsCsLdYRDBvWWCA==
X-Received: by 2002:a05:6830:6214:b0:71d:4d35:313b with SMTP id 46e09a7af769-7249d8e7acemr6379481a34.1.1737315631829;
        Sun, 19 Jan 2025 11:40:31 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7249b4b11d0sm2270059a34.65.2025.01.19.11.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 11:40:31 -0800 (PST)
Message-ID: <de9bf5aa-ef1b-4a12-8cf7-9fe0d050e4dc@gmail.com>
Date: Sun, 19 Jan 2025 13:40:30 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailmap, docs: Update email to carlos.bilbao@kernel.org
To: Jonathan Corbet <corbet@lwn.net>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250111161110.862131-1-carlos.bilbao@kernel.org>
 <87ikqiboqp.fsf@trenco.lwn.net>
 <6c8457ca-c43c-4d93-8493-bf4e5b22f3df@gmail.com>
 <87jzaqvfyt.fsf@trenco.lwn.net>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <87jzaqvfyt.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/19/25 12:03, Jonathan Corbet wrote:

> Carlos Bilbao <carlos.bilbao.osdev@gmail.com> writes:
>
>> Hello,
>>
>> On 1/13/25 11:35, Jonathan Corbet wrote:
>>> carlos.bilbao@kernel.org writes:
>>>
>>>> From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>>>>
>>>> Update .mailmap to reflect my new (and final) primary email address,
>>>> carlos.bilbao@kernel.org. This ensures consistent attribution in Git
>>>> history. Also update my contact information in file
>>>> Documentation/translations/sp_SP/index.rst to help contributors reach out
>>>> for Spanish translations.
>>>>
>>>> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
>>>> ---
>>>>  .mailmap                                   | 3 +++
>>>>  Documentation/translations/sp_SP/index.rst | 2 +-
>>>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/.mailmap b/.mailmap
>>>> index 5ff0e5d681e7..83837191affb 100644
>>>> --- a/.mailmap
>>>> +++ b/.mailmap
>>>> @@ -140,6 +140,9 @@ Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
>>>>  Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
>>>>  Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
>>>>  Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
>>> Is there a reason you didn't just delete the above line?
>>
>> My understanding was that .mailmap should keep older mappings for proper
>> record keeping, but it may have had the same effect, yes.
> I'm confused, which records are we keeping here?  It doesn't seem that
> mapping the same old address to multiple new ones will lead to anything
> good...?


By records I meant mappings of older to newer emails, which in my head
is .mailmap purpose with version control. Do you think some of the
mappings as I've added them are redundant and/or problematic?


>
> jon


Thanks, Carlos

