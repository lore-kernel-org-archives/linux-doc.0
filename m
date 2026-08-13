Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00C5468C12
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786619663; cv=none; b=IrrM6s4/QflW7kcSKjBnJJyyVnnYXPdA4Juu3FTatBKxaAqBxkJsuFjUT+tZZo/u3xgEYICxBdjk7pOyARFL8XsDAKCJmrZPDHPRGuyFrr528Fra8dWNFgeuwoxq1biFhy9PU53fXM0Sp/1uVaX9jSJTmb31+GAFhGWxmuNiMAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786619663; c=relaxed/simple;
	bh=Aj4uWrqLw8ecuucPKgqfSL8VkJ9OiwNvC2LumEsVYZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nhdd20LWe/16wv9E5eVLa4szey6wVHzYuxZa4rFKtg/crC73gj5WmsR9i7GJVRFmDw+ooRVPwcFYafy8aQQqPeZP7hZT/987d3dpVdJBoQaM5sJ5v06Qt6fOadNHESGgRuM1Ns6Y4dIkE92ZTTqDWSIFG6YGaUhHyyb1/ChZv3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRoKRGpJ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRoKRGpJ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso465647a12.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 04:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786619658; x=1787224458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PssWSj29fvJq3bLy1YWLSl20NHDQ4J1Oke/aZ47KbsI=;
        b=dRoKRGpJCiJIc6mlojn2RYLQGnNHPI4e4Rdy1XtP+f5r4IHgY9OeURw1NqsGdyU5uD
         +Lz8bM1NzXImfG42xm5w9TL7RZFrxOcRr8p4JowqzijvMfZYejmtPx067O+pnaoc1G15
         vQHSTIs2cTy1gvVqGmvO9FU/vNP64SitIVfMymbk8n2lpgjgM+T55SRkudlw/bVuEvmU
         QtxZ6tblbV+JrQN7Vxl3EbpfErExUcjRRvhMBPbJOV4PSLki5JaBLMeaggcQLs19+G32
         3VWf+mvhz8vTayokHyhiiK6/5whq/3MHxHCTg63OUIhOAb1E49Vi84zx7WVZOpeAtdj3
         EeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786619658; x=1787224458;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PssWSj29fvJq3bLy1YWLSl20NHDQ4J1Oke/aZ47KbsI=;
        b=ct+HNM3PjwJpIG5EHfdfQh97jWvXQJWL1NeOFJEJnrToIBPCSHZ7uc0mbm4/snZfRp
         6kmNE3ycdMlhR01XkjO4jaHGLhLN4lMECenUtveRC2i/EUzCPG4bZ/Clh4837JdEHySu
         BS4HnEgGJO4WshYaFi8+kXQggJF4rpKe5dM4t0uNc47VJ8alKMQayA9EKJfuwEOMLmg1
         1oHzRnZzKmc+JKh5X0IZKOpx5TQsFa0VjzPUnS7gj5Bu42GWKTewFJWwGJykELmO5LLG
         KlI6ZkFGhBgC5KuztCTcJqhZl6GLHe+N00Zh4X8r+nFqDOkK+5emEuFJSNNbRdAl+SEy
         cuvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCSDSDcjClXfuLWFVYHfRIvpXtqWhToikV8GLO50ZDDx5QehhBFBschteaCXDeTMBs+jIJXqsKW+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh0iyNQx8gF+7ZSPyXan1DDa7gIBw5ah2WYAhzbZ3Y9IOWgsMk
	ifljCPc9jRZUmNDIodr3cCd5QKPbOFDpGCjqU/iNdp14BF90QNVOcmQ2zR0H0g==
X-Gm-Gg: AR+sD10TW23izggTJPzrjUBm9hYL0vBksn/9Vlul9ccrJw3JEB+FdlVIjFodEVINlfv
	dzD/Z+dqKv4FHw0q4j1rIRVLitEe9OtGbule1MZGHTd5xveWNnp3ZCYV1YPS82AoETLElwgD4p0
	1BD+YEeEoZgpSZfjp2hxz6h+c7a+i7XjAFI1NBo2L8QuRlrXyAT2/poF6uWSs263Eym/egCrJNI
	6UKabODQqp/WAOP6bJDDWcvspW8motWnjDqW+2uFfTuUYgrTHv3JD2B0Xnz1mDBRoyFV/0Bu6Sx
	TtRJi+C8YRGlo7aZGSZx0G7my/McGBcoj64wpEEq1ktlvj99ralxBnbxCYfnOy9Iz5jhd4HYvk7
	OHpwnOBFsxfKDteBjGzu2dvMPQcE/FmM9F2mLjPB3erlC3ullIdpnZ1LMc/ozyrt0xuFYiOzGQD
	im7GiikAsgKTCJa6+dYqYq/Wb6RKUDoBO73/ut2dwQcDvb6sQS/g+DLVZOdBsj3OZxAt1uDCz9V
	BwcNl9jqIRNxhEKUfSs23P4IEd08nZHOMF/T2wuQ+cJWm4X
X-Received: by 2002:a05:6a00:440c:b0:846:a26:8e0b with SMTP id d2e1a72fcca58-84fc6e286f5mr5066244b3a.18.1786619658386;
        Thu, 13 Aug 2026 04:14:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4787325sm688974b3a.23.2026.08.13.04.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 04:14:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <746d6546-0239-41af-abf2-2631beefc85c@roeck-us.net>
Date: Thu, 13 Aug 2026 04:14:16 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device
 configuration
To: Arimil <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
 Will Smith <github@notthatwillsmith.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-2-renari@arimil.com>
 <bdc11dcc-ec6a-4951-9348-1c60a3be94ad@roeck-us.net>
 <CADBHdQ2up=rcwC=GgVBO382H41uxep-Z7XD6gtnTpZBi-KcpJA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CADBHdQ2up=rcwC=GgVBO382H41uxep-Z7XD6gtnTpZBi-KcpJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/13/26 03:07, Arimil wrote:
> On Thu, Aug 13, 2026 at 12:57 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> This is introduced by this patch and thus irrelevant for the commit
>> message.
>>
> 
> Do you want me to make a v4 to fix this?
> 

No need; I'll drop it when I apply the patch.

>> We are too close for me to accept this series without independent
>> Tested-by: and/or Reviewed-by: feedback. I plan to apply it after
>> the next commit window closes.
>>
>> I won't mandate that the issues reported by Sashiko are getting fixed,
>> but I wuold strongly suggest for the users of this driver to have a look
>> and consider fixing them. The issues look very real to me.
>>
> 
> I have already started looking into fixing them but since this is my first ever
> kernel contribution I was avoiding expanding the scope of this series
> unless you explicitly asked for them to be resolved.

As I said, not as part of this series, and I had hoped that Aleksa would step in.

Thanks,
Guenter

