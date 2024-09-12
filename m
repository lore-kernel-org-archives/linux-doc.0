Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657AA3C39
	for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 01:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726104142; cv=none; b=prjtby5OpH914zYgd8gpRtynki1i+lnfw04rzY7O8fYxhDEmyjTeky6g+6O5Nhb4QsYrbRIxfEyiOqEn0oOevreyQoY+RdwbXRWQpNLC51Ze5mg+g6wDs7ltMMvuZQVFF1h2J+cBjMhzjxCdrR5t167MV/tEcw38kCdVa4J3Ytc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726104142; c=relaxed/simple;
	bh=vRSkSmYO8WmwUwfg7ohdSZR+53E6V7rsRYnlk/bjAas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKrYNbnIkOchmd+ujVA9dwblhkM2Z6o3TnrxKNVbgMLhA3LziZHw2PQeUB19r77Zl0PlSz7Q54n08xYY/xl7H/pIc8I1RWhgu71G5jtJFF/jLqjjF2pwazDDyX50LbexDEu0Mp+NIbqLo8tps4no05gFacUJJETsvIIZjD0YZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtGb6v7p; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtGb6v7p"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-206aee40676so4059145ad.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 18:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726104141; x=1726708941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3V5ePtrpD3YcQBIs0Utaf71h1PbMB20wA8EZdi/NDyI=;
        b=EtGb6v7pgMKpAG9Zb69jL2zBSH8rWRiTi+rORIjHbziAewgmd0XjbNVl9uEUKJj6j/
         Zb//t+dQcR6MdBqqOVY+D2azos2At6UJSeI3z5sCGSzXk9mLt4RArYttcNjsd6q6Om/S
         p9ds838KcA83RxEhNVuaaQ2/0kpuQB+9WSVszfQJFCc2DWEIp7HPaPXVnw401eiypaD8
         K9Bj89Q4dQnIoQSFj0bHxd9QcHAgi3MM/S9dAOkGgqqvn+Ffu4Xikosg3SFMfGniQM/s
         VPMtpins8L0YpW13EZVUG4N7EnUjMGGtaymhXKSuBnqmlPho8J4o/jXtAen5p99nKJ2x
         l+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726104141; x=1726708941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3V5ePtrpD3YcQBIs0Utaf71h1PbMB20wA8EZdi/NDyI=;
        b=TfyKhu8qWaDHYntsqrnUO2Oyzvd6q3o0kxj8dD/uyFhdmwvIHYRC70O8CQDj58ytb3
         eZ3PjPBIHYI3M6M/tiWDX0E3zHTzLh1Ah+NMIrh+sU/xD4fma7zmxlUcBdyM/pPprDAI
         znAo+iZyuj31cre7lbSLxtP/TTMrA5PoVvuM7HcOUFRZ1/g+K2TskqKx9QLlNrhwlcJk
         2Ehhea5BmP3Pwn0QmFww8jTuCz6OPnwrn9AUkl3LYCp0VQXrpesG+6eU2ozV0gzY5fcP
         VLm+6EUoaA4ds3aeDQSvzoZTt2K2Y+GhPBtrY8nduDY+7Bg7+5oWEtZWVEEmtUs5ZK/z
         vifQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh7Cd+E5V118ZARc7aSXW7sabViZ+FqgYv5YIe0T8go6aTBv/mvz8S3ooDmlXlo/0bn9hB56tpU9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIGcrBpvgfd26C9pH+cc8LTpX/c7V6/0wSACD6fQDaphf3eL5n
	al63T5BjFGr+h5s52jQ2eZ+a2DGNiS7y5n0+7aTPqEkl+AJ7UjJU
X-Google-Smtp-Source: AGHT+IHpWM3RXl0/krNQCr6ykmg/F0QPdXAStd+cON/kczT12gc2rMjSJupt2Yu12EQEb782Qb0EKw==
X-Received: by 2002:a17:903:987:b0:206:d73c:971b with SMTP id d9443c01a7336-2076e43ba28mr17441545ad.55.1726104140472;
        Wed, 11 Sep 2024 18:22:20 -0700 (PDT)
Received: from [192.168.255.10] (23.105.223.42.16clouds.com. [23.105.223.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af20e1csm5254015ad.5.2024.09.11.18.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 18:22:19 -0700 (PDT)
Message-ID: <c8eeba2b-99cf-4b4d-a8ab-145b7266cef4@gmail.com>
Date: Thu, 12 Sep 2024 09:22:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: original file finding
To: Dongliang Mu <mudongliangabcd@gmail.com>,
 Cheng Ziqiu <chengziqiu@hust.edu.cn>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <75028548-2c1b-4ffd-91e5-9f3ae72d9c3e@gmail.com>
 <CAD-N9QVuQ2+mG+S7Acp2HuUSOzqb2Bj4XW2UGWXKHx0zWbgBRw@mail.gmail.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <CAD-N9QVuQ2+mG+S7Acp2HuUSOzqb2Bj4XW2UGWXKHx0zWbgBRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/11/24 9:29 PM, Dongliang Mu wrote:
> On Wed, Sep 11, 2024 at 6:11 PM Alex Shi <seakeel@gmail.com> wrote:
>>
>> Hi Dongliang:
>>
>> In scripts/checktransupdate.py,
>> def get_origin_path(file_path):
>>     paths = file_path.split("/")
>>     tidx = paths.index("translations")
>>     opaths = paths[:tidx]
>>     opaths += paths[tidx + 2 :]
>>     return "/".join(opaths)
> 
> cc +ziqiu
> 
> Could you take a look at this function?
> 
>>
>> It use a different way instead of the ':Original:' line to find out the origin file.
>> That may cause file finding failed if we have a different dir map for translation.
> 
> Yes, this is more reasonable. BTW, is this enforced in the Chinese or
> other language translation?

It should be used in all language.

> 
>>
>> Yes, we have no worry since all of them are same. But could we take the ':Original:' usage for a possible dir map changes?
> 
> Yeah, at least we can take the current method as backup for original
> file location.

good idea!

> 
>>
>> Anyway, just a quick idea.
>>
>> Thanks
>> Alex
>>
