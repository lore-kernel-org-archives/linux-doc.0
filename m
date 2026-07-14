Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD131F3BA4
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024157; cv=none; b=WA/yfcD7OYCurQq/Z8jKtfPEiJigVQb4s3+1n/RQChzY+/sc/psgF9+uLO0/bwl3sgRvaKf3niQE0ui8YxmXv2EZYPsUvqSAHgrrwQiQ0pF6BuAhitvNDq2aJ6G9NShHO9V0PrA4uPdnV4J6G8wsoH9al+JR04nBKSa8sXzxaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024157; c=relaxed/simple;
	bh=hEVhFeAcHvH/aZGtAcwRKKTAgVoX/BkHcr7Mu00tItw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZXnqvwVVexhT89wjio/I7FlyJcPY6QWHBwThvHoF5aFhO+f0CkiXuZmhlb74EWdbp0aDRZVL5vfCwae3PYhkLcHWshDJlYp3+mdE5GImKZcznTQBJcytGGoGVUIbEG+nlqbRcA41U6o/XcpjeDI/mXVWNOyrIdEQtwosg3igw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imybyfb4; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imybyfb4"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3976278a91.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 03:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784024156; x=1784628956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zlfRyXSi9xNEFSL0XUB0wgZUdzuVWaB2zH0YiT0w7lo=;
        b=imybyfb4/ZZUC1pmwKJdt5U3qppWAkCAy4yO0ZMk0rby9kAVOwb7oZOvI+lgxw+7ef
         rQ+pDXRpvOM+lGalywvWOudCY7+X/vIpEWnc+aFdxuulv1B9UuqvZ0QuIpMLMiVDJfGp
         KvglTXkGnojyi8TAUoLqJ3DzNyuIV28AclWXZ7y0c+lzgnLqLnYhxpcmBMDiTSRM5it4
         /QEf+cos1HRntwsnWXefWrvQSDg37StaH6h1PJEXgjAx5ALr1yUPdwVhRrhQilmixGhe
         KdcfiEv3m6saDxE+0CmGODc5BMUZ4XgP7FEi9E6BR1TTkrGziayh5vUksHInFr1qqHEU
         yfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784024156; x=1784628956;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlfRyXSi9xNEFSL0XUB0wgZUdzuVWaB2zH0YiT0w7lo=;
        b=LB/SbbEAAaQtZXH49d8730fxse03cuCaRYweDpbskXVaaCsiaJwSR3pOvHTo5q6A0/
         kP8U2s9PrgPXX9d55bXwMpwCoeDkBt7KtnLGspSVLc6zLLGVByt25GoWPTiClGIuPXZq
         C2/x9JGuuDtFiivasy0HDiXZXBq/pPPDFWLOUYNqHQiYfASjTGbSr47VX/A9429nMtWs
         YW5RoPz0wO0MOg8AX/X4/Hpe6Uli59EI5WjYwIDtekHVTsoybp85Ab6YDSAN05B/iYcq
         pxX9kruwZDQSuDoR+RPpz6TyEOfPuFsSU1FuzudoPiyrRXiDOhB4O2QajfqqK71s99XU
         NA4w==
X-Gm-Message-State: AOJu0Yy/HyNlrdgr0XJ5GI4nRUud0Ixj5PlUtkZcxR1k5E1l4e+4s4kg
	aawLn3uN8IRZTq8aAerOx/fWn4RTRaaZ8bDWnjwjTkWOtwQBYInRAxpB
X-Gm-Gg: AfdE7cnJ74bvXXPbb+i64IFaEs4kfcU3OSElyn0aKyrEAfv/4EI5EG4F8PBcF6wqqsa
	Zptl5cRsnt0Kh3EZQmZEzbLo7CDzqBztdCburKJFYrMHL2tYNT7xFVn6e3nixs2E0wXc2syFJpi
	yvXzXcuZ9B3R4HU5GJNEhJt5xLpGvpKw9JceVMI9dNk23gYeY4z5zkyVmHIbO/pdvb+ANsDWyYm
	pkI9l5QA/+CdVSV0v+bcOJ86pGFLQG31IA/UCPQpnLdGYnQHI9XaUwSM/BLO6J9EwFgMsWfNFUT
	6DLhoZWKtiaMLvHPYNZEthUIQ0lg6C/4+XrRFQoXheaRc4SsK4Up4d407+RxsJdrRTcDKuBPDJe
	7vDGb0VLrcP237dp8JgOv5pNUOPKOwIeqnSVl+8Di28VXB7/YJpPtEt7tPi9zYJDoUzIUQGi/1k
	xo9fQfdgH1sGCXAyQvUYWP+mEMH35RaKv21h/S9nFSoE2PJTQF6dPotg==
X-Received: by 2002:a17:90b:4fd1:b0:38e:d3b:436f with SMTP id 98e67ed59e1d1-38e0d3b4495mr4808903a91.36.1784024155916;
        Tue, 14 Jul 2026 03:15:55 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a00:5c02:dd08:7909:78d5? ([240e:38b:e68:3a00:5c02:dd08:7909:78d5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1745a86esm1212662a91.16.2026.07.14.03.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 03:15:55 -0700 (PDT)
Message-ID: <b664685e-6785-44ae-8005-443032508096@gmail.com>
Date: Tue, 14 Jul 2026 18:15:49 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in zh_CN (Jul 2026)
To: Dongliang Mu <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Ben Guo <ben.guo@openatom.club>,
 Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
 Doehyun Baek <doehyunbaek@gmail.com>,
 Jiandong Qiu <qiujiandong1998@gmail.com>
References: <alUXH8qRRjno2eZG@wyuan.org>
 <CAD-N9QVXqYxtsn7YuUtCDWrwwk5+iFAkT2jcs26zbDUfwhAwsQ@mail.gmail.com>
 <alYGtkVxW_0N-VqE@wyuan.org>
 <cc922c1b-49a5-4c3a-855c-af8eb6539f62@hust.edu.cn>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <cc922c1b-49a5-4c3a-855c-af8eb6539f62@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/7/14 17:54, Dongliang Mu wrote:
>>>> Since I made many noise these days on the list, which took up a lot of
>>>> maintainers' time. This email summarizes the patches for zh_CN that are
>>>> currently pending on the mailing list.
>>> This is awesome. Maybe we can establish a dashboard for the activities
>>> in zh_CN/TW related patches of linux-doc.
>>>
>>> I personally kept a knowledge base in the IMA (an app for storing
>>> knowledge base in the cloud) in our club to monitor these activities.
>> I remember kernel.org itself already provides this:
>>
>> https://patchwork.kernel.org/
>>
>> Is this similar to your idea? But I haven't look deep into patchwork
>> before.
>>
>> Of source, having our own thing is definitely okay.
> 
> 
> I am not familar with patchwork too. How about Alex?

I don't know if the patchwork has a similar feature like this email, 
does it?

Thanks!
