Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFE336A34D
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010167; cv=none; b=CX6WwuAPpWTlKQPRR+E0/rHTne7462ckaSjHFCsEbn4iZQf9dRln4hilZaLZAkK9op3QFRsF4cRwB/EUTyCc5yTwGBSxwtZnRpr3S+Rv6LqfQfqqA2i9LUGdCfcdyPsgQMWZHZHZa53PO3Pm7kbBt2iRNUt5DS+Nz3iJJzf9Rc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010167; c=relaxed/simple;
	bh=XlHGOKZswslkODk2r0egXIIH5+3CKyArCcDYl4+f0d8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKxRd8RrGuMnb13po4x3BMXuroJmsFp4Pt6i884taDGzoOX3VzPvAGh3UqLwqmdlfUOsvzEF1CIHD8+pN0lXsTNKCMKiIbXG0a5Ouyo5onBWh65SQU0q4tX11V0PhyVyuBpPF2jWFtBuA6JBvx4lH4uTs0XI91jnwvqXJui1mMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAGcH/Ae; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAGcH/Ae"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8454160043aso389180b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 23:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010166; x=1784614966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2VgQJFr2UTWG1v0PlJ15O3eqJ7UDzC7Y8+4htVAnpQ=;
        b=UAGcH/Ae204AiktJ7/fuF87XawV1JpBfnagFe1wBj3/DtyG/fj+0RookAQz8DJR/ZY
         C9Lav1PlkQCAg9MupNQzMFOVz6SwixuXCP9wepoe3KHh1B3nGMKigpPt9lGOn94Wm5Df
         4hthQ6zgTmdITTXtJJ6lR5vqQ9xJOefd0cFZrTrx2KkOJWluIDzt4t2S2F+X81VHbmR/
         D+eYE/toE0mp7T7N3iZY9W6GKsYxFuHQZ8rUvKeqAdbCFdaefkGVnE33zXZZ/e9isuXb
         t3HOX+6Uo9tDnMsXFyoPLAAYqbZif1zWlVnHtGF0A5d5g1x6pOWZEOcTpkUJsu5JX1/O
         z86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010166; x=1784614966;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2VgQJFr2UTWG1v0PlJ15O3eqJ7UDzC7Y8+4htVAnpQ=;
        b=lqnKjOSJSEA532zB2nUWf4EEUrrksgE3mVH7uhp+V+wnVuUFtjN0VZtV/6h++3KmZf
         bdEtBrHwvuJWulYJI4Lmzv9UDxWyhURVAyy6xALYSUmZMgcBvthESvFlkjncEt/Wxrex
         2sxux8Bxhz79qYGW5YXsvqIpHSPXEP1932N+90FHNGIloc6d+6skzfQ9S543H3LtTk4Y
         MqYOedPttQqyaAFIIWMBWfko0oe7ZeR1AhUNcUNb2MPwujMgoDWBnnR9ryfzHUMsIsp7
         TPl+yWCFasgTclOJX3JAcJT1kIoomThLykRmDUM9Eh125/odQ2IJ0/coGacxGap3pQYg
         G51Q==
X-Forwarded-Encrypted: i=1; AHgh+RqRAv5kr7Sdq2U6jDtyLSqN2mmCX0huA6Kbk7AyHMQkruCuaVCuuCL140+xDULKMEwV1do1c7MH2y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrBJf182TeGPQa7wO3pQVCp0t1cXDsDvwSofEBLoAEI3CVdSO5
	Eb0mBGDIVEFlfQkuJpTiWY4pxEEYebeiK314CXPc/xJAiv5L4A/AMaAj
X-Gm-Gg: AfdE7ckytuZ4wD0N3l4V4thkk8s1KEaAy2oKWYPPwRsSQGaDp9PfXKWLPOTpYLx7DBr
	iTW6J16cTiUc71YEULF6fBfhxQOLQjGvKqlPOkRTiZ7dl/O8XOAthzjw7RY/9TTMGBZKK8imfEV
	13KDvGiiLyPC5TM01HZLg+ifkqeBJR0PBH1TkTIJbMz9oSVWYKhMAlQUPKu7KZv+j8+rkex0JXe
	PkhrsoPDWYS4+4XWdGifLvf6+/VlS01bASBI+P+aX20q8uwfJ4GFMyJdaWaxl6w9nTjgJEduS0n
	NECzzVn5w6cQ+VQDuKWWbCKe5wskAlXQZwVY8tJn+HnQyUURziJOQ3sP+T0lYsaDl+ePOE+KZPz
	Sfv+eRFx59CI0K0J8rDkkfLENU2OOY8EAzvouVfHkfClsTdbmT38qZNJJmMWoO2sc5NMeaoPKhx
	YS79eDj3XlCQ42gBKzhI2SXdzIsouUj1XEUckP5s7MBxqXSjG4gNbDwHGIBzhj3QbR
X-Received: by 2002:a05:6a00:c88:b0:847:83bd:6676 with SMTP id d2e1a72fcca58-8488963aa37mr11134318b3a.17.1784010165742;
        Mon, 13 Jul 2026 23:22:45 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a01:ce86:5400:dbd7:7cc6? ([240e:38b:e68:3a01:ce86:5400:dbd7:7cc6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6c158bsm897150b3a.38.2026.07.13.23.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:22:45 -0700 (PDT)
Message-ID: <abd713e1-e415-4985-a358-359f20ffee4b@gmail.com>
Date: Tue, 14 Jul 2026 14:22:37 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
 Weijie Yuan <wy@wyuan.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
References: <21179a3c-60d6-40b0-a5b1-594e989ef508@hust.edu.cn>
 <alS8lLglyMqJEYZ4@wyuan.org>
 <CAKspUhJTGXzM=UeKTTZYX69NttBuCnAezz=ZOM9imPWLSP5g9A@mail.gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <CAKspUhJTGXzM=UeKTTZYX69NttBuCnAezz=ZOM9imPWLSP5g9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/14 03:47, 葉宸佑 wrote:
> Weijie: agreed, a zh_TW how-to (mirroring the zh_CN one, with the
> glossary referenced) looks like the natural follow-up once the first
> series settles the terminology. Adding it to the list.
> 
> So, to keep everything in one place, my understanding of the plan:
> 
> - Chen-Yu: terminology series for process/ (14 files), folding in the
>    pending 8.Conclusion changes, glossary included; adopt the
>    "update to commit HASH" convention from now on
> - Chen-Yu: read Jon's advice for new-language efforts (Spanish thread)
> - later: a zh_TW how-to document
> - Weijie: investigate which documents may not need translation;
>    monitor the CN/TW lists during the trial period
> - Dongliang: review; patches routed through Alex's tree (pending
>    Alex's confirmation)

It's ok. I will pick up tested and reviewed commit into my Chinese 
documents tree.

> 
> If I got anything wrong, please correct me -- otherwise I will get
> started on the series.
> 
> Thanks,

