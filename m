Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8981862
	for <linux-doc@vger.kernel.org>; Mon, 16 Sep 2024 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726492867; cv=none; b=hesHcymv6Vic9VL+0vUNMOE45FovghaR26wUfQE2vGITEvuCoP9acpohDSBrM2hb0a8mOf63opVLlhS26i/shEWFDDPHVa4jXiBvStcLpf8XQ14Rfbsa/VdPi1oyDOcLnYdSdYqAL6Ds3cwuhWF3T8aGm7sIwrJF4sqn37A6Sj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726492867; c=relaxed/simple;
	bh=fzzMdMoVFp/EtI5oIKyJUrJ3zdZEzrKEW9RDoBpHNTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQwQKQ/XEi1776nBYZsDwxY/8Nk77SP+pDOCuE5tENTnmGu5bU+5IaM1WE1AHX8Ijs4464cnKOObg94cxjdftck7+bYUUXW8M8LLi+LkTsCD/OrhJv7Dr96HfcdQX4j9EBtsy4OIggzHu/B1nyhk03CylyP5X9KwoO60zEACmng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/is73YR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/is73YR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d88edf1340so2182510a91.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Sep 2024 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726492865; x=1727097665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zAyvGx5aEaJXRY5Pbgx+YJG1BpUdu6j1WkHCggwb0C8=;
        b=j/is73YRMiYHhDmUnsPJURgVXoTMhS6FIqjinPGCZ9hyPRa7Q+4C31Rz81lIA9Q7TS
         nPbPMIAldLW67HEbSbW1s+TJY7okbDkG14XBgqY91Zd6l5h2so0xiQTmfE/K7uRg2dBQ
         nW3ldiS8vASBh/yPYBaW9PPvm83wiW2+VjeF4al78QKymOg4pX+2P7rKCxo1++rU/QlH
         S/D7JZbSlGQOFK0Z4ckc9wrEqfSedPn7Fl8nDAPliszO3NA4fV3J8pgRwEEc/woYZLOh
         ki6ZTHgLfukKEbq0XpK2ZvyIV1bJDRypajWJE4motTb8JynLOMHF2eYRrbq/E3D9vFqY
         GPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726492865; x=1727097665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAyvGx5aEaJXRY5Pbgx+YJG1BpUdu6j1WkHCggwb0C8=;
        b=tmIOUJmDcKrlfVPaXfmZ1iJHlPM6TGKZRwpBUmFXR1wNOfikPckVAQPnrP9P34Wgvs
         evmVYVwOxnypOIkivtDfHDF2UATnPXUrLgjDX2idHjOtgoIgt3WwqJGswPlkjG4NXyds
         bZRUnzmwaSXeOaD9ZTpHxVPsJRoAZwjFVqWj1ko60USf3rFEWjxshDH/TOQDTr+G+Spb
         YJTWB/+IzGRWbgAzCPIz2vsZ85QMshdbiEySokdWrx5GabgpAK8sPX8UWprCrMwtWLt0
         i2547x52vwiVHdnOwzux5eCMcrNOY5HkgriXXue+H7UhydijfRalTTcHY3FojzYPe1ym
         caIg==
X-Forwarded-Encrypted: i=1; AJvYcCXkIffC5uHB8xLqDPK1oUAFRUQ1CMYy3F6IoTP6g5XrqMNLzXjPWnxuftlMt0UjqisJUYbpZuRTAIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRbiEAYKHFWtOrPAoJhXUA8seiSiD8HUrxrOKIPAM6qHzhAmQh
	GCwTz/P4yNTAieq0SamwI2Gp6OTP5ozoPTvIhY5KGwJKFak+Z1za
X-Google-Smtp-Source: AGHT+IG6KZBLYW2VrpUrtar47vnch7z17JDzJtpNeoqudFUHbTe5dVm1mRPeUxL8RjXwpidNq499qw==
X-Received: by 2002:a17:90a:e7cb:b0:2d8:7561:db6a with SMTP id 98e67ed59e1d1-2dbb9e207a2mr17000165a91.22.1726492865057;
        Mon, 16 Sep 2024 06:21:05 -0700 (PDT)
Received: from [192.168.255.10] (23.105.223.42.16clouds.com. [23.105.223.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfd252b1sm5088727a91.29.2024.09.16.06.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 06:21:04 -0700 (PDT)
Message-ID: <6427e098-f18e-429f-8c5e-99e7d12e12bf@gmail.com>
Date: Mon, 16 Sep 2024 21:20:58 +0800
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
 <bc5e5979-7c8e-41e0-9c94-9877fde9caa6@gmail.com>
 <CAD-N9QX1iE0kvf2sApyQ__PBY0PeeCbyCfvT-g+Ktz0BaY-4hg@mail.gmail.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <CAD-N9QX1iE0kvf2sApyQ__PBY0PeeCbyCfvT-g+Ktz0BaY-4hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/15/24 9:20 PM, Dongliang Mu wrote:
> On Sat, Sep 14, 2024 at 6:38 PM Alex Shi <seakeel@gmail.com> wrote:
>>
>> On 9/14/24 9:25 AM, Dongliang Mu wrote:
>>> On Thu, Sep 12, 2024 at 9:22 AM Alex Shi <seakeel@gmail.com> wrote:
>>>>
>>>> On 9/11/24 9:29 PM, Dongliang Mu wrote:
>>>>> On Wed, Sep 11, 2024 at 6:11 PM Alex Shi <seakeel@gmail.com> wrote:
>>>>>> Hi Dongliang:
>>>>>>
>>>>>> In scripts/checktransupdate.py,
>>>>>> def get_origin_path(file_path):
>>>>>>     paths = file_path.split("/")
>>>>>>     tidx = paths.index("translations")
>>>>>>     opaths = paths[:tidx]
>>>>>>     opaths += paths[tidx + 2 :]
>>>>>>     return "/".join(opaths)
>>>>> cc +ziqiu
>>>>>
>>>>> Could you take a look at this function?
>>>>>
>>>>>> It use a different way instead of the ':Original:' line to find out the origin file.
>>>>>> That may cause file finding failed if we have a different dir map for translation.
>>>>> Yes, this is more reasonable. BTW, is this enforced in the Chinese or
>>>>> other language translation?
>>>> It should be used in all language.
>>> Hi Alex,
>>>
>>> Why can't I find this thread in the LKML? We have cc-ed the linux-doc
>>> mailing list.
>>>
>>> Jon has different ideas about this origin file finding.
>> Hi Dongliang,
>>
>> I just copy to linux-doc, not lkml. but Jon could see the thread in linux-doc too. He reply there may just because more people in LKML. :)
>>
>> As to his and others' comments want to do further check, to confirm if the Original file exists. That further checking make sense too, and could be easy to add, isn't it?
> +1
>
> @Cheng Ziqiu , can you take care the v2 patch which checks the
> existing of original file instead of using original tag?


As my understanding, Jon want the ':Original:' file, and next he want to check if the file, which get from tag,  exist ? :)

Thanks

>
>>
>> Thanks
>>
>> Alex
>>
>>>>>> Yes, we have no worry since all of them are same. But could we take the ':Original:' usage for a possible dir map changes?
>>>>> Yeah, at least we can take the current method as backup for original
>>>>> file location.
>>>> good idea!
>>>>
>>>>>> Anyway, just a quick idea.
>>>>>>
>>>>>> Thanks
>>>>>> Alex
>>>>>>
