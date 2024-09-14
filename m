Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72711CCEE7
	for <linux-doc@vger.kernel.org>; Sat, 14 Sep 2024 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726310316; cv=none; b=aYD5Ajaw+HvDmT3kymbGLG4yt48nIbiD4Ob1HcH4gdBZXD1AGEsL4b5pAcHWKgMWr70vAw3i9Zj+chOiItrpZI/jrY2Da6XGQabVQPVfN2aom+BMBmwRQKICFFlPEd8MT8Su4ejV8DbO4WQL3NSOtOgXMc1aCwC/XOwNtbHcrMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726310316; c=relaxed/simple;
	bh=57/2GphAPx5obXHWPZWIax5Wgl8eLu5f9xixLf1PWAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+JhQBUSXkYeHArh2gIZjT0F6ZZKjGB/a77w2DFQTqZT7CrL3WGx+mztMolY7C5srUuEWIWrcHIzv+JsdtNj4kIoXRg4B36toe0aJoH3KhUCCFNARL4OhMVB2yUZB10wUQTZ1sWo153XNeiYthGLUAoGM1v5uRIyKWODbLG9LwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Miht6sw4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Miht6sw4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-206bd1c6ccdso15826305ad.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Sep 2024 03:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726310314; x=1726915114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mvaai/+JCpmPqW2psbUiimtH3qzxaNWO/Y/3QNW92XI=;
        b=Miht6sw4YAbg+iWFhkewJ7sSx4LKEWnqF9N3ATfSvu8sBuD8tekPZZupFq0Wjb7cOe
         lOLizPEgL/+Mu/nlO6qQnbdnKVFU/mvEDn58Er9J8SX1UKvpiSLAo+a1JAsly/52MWBw
         m2CXVyZS02Yn2f8+vjC5F/uvE85CSVYCYFAm9gRytZMXQU1oFOqUR01VFJr/vHjwngFC
         X3aJuOJR44A5WI4pCQ5ek0sEBSHttaci6GjTvNsoHPZnS0N4YlO+f+thpRmuA/AcmzYP
         NShls4Z1ix/zt824M3bCs9lcAa4fvURLIU81kiZq6Pl4HvarjtS6qnZGEavwxzjitwBM
         AwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726310314; x=1726915114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mvaai/+JCpmPqW2psbUiimtH3qzxaNWO/Y/3QNW92XI=;
        b=ocrtUyKS+fnElHiRN5cji6E+HdLq04VmjDx1MPnjaSjV3ioqIB+Un+0FpGsAk4m23q
         9LK8ZCN8KlAuKLu646+UnP1OFBft+QPrCvIoVtNXWbFdxrJWiB5yPSvH2PSY1XB98ZGt
         GpZLPbo9JuMHwy5Mpv+pXzZDKa5AkXmnpHeTR2Bjk/w3IWz6IWGmbR4HOcylO8/61D8c
         x2C6oJ/27KVJV1MtX5/t+wd8kn5Tl6x4VP5i0m72Ux4RbhWN06lrT/fKuTTX+Q1sbI0l
         5iuw/GWNwKdl6exoTkUx2J3dXXneEvMIUck0RiEEHr5HKDm6/OpM7NjK/ZOTcgpc5cJM
         PS8w==
X-Forwarded-Encrypted: i=1; AJvYcCW7poAXrCXot0YnEDaiA9w3XKRnjsOEopLmA5SL1viiRnH1q/VAww/0HouNypq/qoH0QXErY7b4csk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzftWdrVczUcSbLWz2j6qYaDfhDUTs5WXptgKD3mCYp54YyLjv3
	ZSaxJIQsfAk8BxVoS+F7WAPxU0YTqSnp48dzT8SLeS9bBjCLxe4NvHziwxYr
X-Google-Smtp-Source: AGHT+IHYkiiIVTJ5azBltAs72VUOrvrThLwulsLaF3RiIYojWOIz25/OGeOjSsZFTgxNZSrADHfMog==
X-Received: by 2002:a17:902:e54e:b0:206:c43f:7896 with SMTP id d9443c01a7336-20781d5f7a7mr76393165ad.21.1726310313549;
        Sat, 14 Sep 2024 03:38:33 -0700 (PDT)
Received: from [192.168.255.10] (23.105.223.42.16clouds.com. [23.105.223.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794731a30sm7684915ad.268.2024.09.14.03.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 03:38:32 -0700 (PDT)
Message-ID: <bc5e5979-7c8e-41e0-9c94-9877fde9caa6@gmail.com>
Date: Sat, 14 Sep 2024 18:38:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: original file finding
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Cheng Ziqiu <chengziqiu@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <75028548-2c1b-4ffd-91e5-9f3ae72d9c3e@gmail.com>
 <CAD-N9QVuQ2+mG+S7Acp2HuUSOzqb2Bj4XW2UGWXKHx0zWbgBRw@mail.gmail.com>
 <c8eeba2b-99cf-4b4d-a8ab-145b7266cef4@gmail.com>
 <CAD-N9QW1cdpmcXEb9bWj-ezvH3Mi52KGcAyq_6iqqTjr8tVjDw@mail.gmail.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <CAD-N9QW1cdpmcXEb9bWj-ezvH3Mi52KGcAyq_6iqqTjr8tVjDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/14/24 9:25 AM, Dongliang Mu wrote:
> On Thu, Sep 12, 2024 at 9:22 AM Alex Shi <seakeel@gmail.com> wrote:
>>
>>
>> On 9/11/24 9:29 PM, Dongliang Mu wrote:
>>> On Wed, Sep 11, 2024 at 6:11 PM Alex Shi <seakeel@gmail.com> wrote:
>>>> Hi Dongliang:
>>>>
>>>> In scripts/checktransupdate.py,
>>>> def get_origin_path(file_path):
>>>>     paths = file_path.split("/")
>>>>     tidx = paths.index("translations")
>>>>     opaths = paths[:tidx]
>>>>     opaths += paths[tidx + 2 :]
>>>>     return "/".join(opaths)
>>> cc +ziqiu
>>>
>>> Could you take a look at this function?
>>>
>>>> It use a different way instead of the ':Original:' line to find out the origin file.
>>>> That may cause file finding failed if we have a different dir map for translation.
>>> Yes, this is more reasonable. BTW, is this enforced in the Chinese or
>>> other language translation?
>> It should be used in all language.
> Hi Alex,
>
> Why can't I find this thread in the LKML? We have cc-ed the linux-doc
> mailing list.
>
> Jon has different ideas about this origin file finding.

Hi Dongliang, 

I just copy to linux-doc, not lkml. but Jon could see the thread in linux-doc too. He reply there may just because more people in LKML. :)

As to his and others' comments want to do further check, to confirm if the Original file exists. That further checking make sense too, and could be easy to add, isn't it?


Thanks

Alex

>
>>>> Yes, we have no worry since all of them are same. But could we take the ':Original:' usage for a possible dir map changes?
>>> Yeah, at least we can take the current method as backup for original
>>> file location.
>> good idea!
>>
>>>> Anyway, just a quick idea.
>>>>
>>>> Thanks
>>>> Alex
>>>>
