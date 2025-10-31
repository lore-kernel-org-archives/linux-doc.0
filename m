Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D45723BD1A
	for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 01:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761873960; cv=none; b=U/XXnOcPZ6q/9gBaxcpw75YhsP1MpwVxBaGYdr9kRp3KGyKKVYLnU8fWR+qdcYLAd4MjfYhw0/j0+9/zVDtmNzyogBbsXXfMs7MmrUbWqA4a5rrkz73mQpbTag93J2n5e0/8foQn3pW/QZFsc+B84oUq+2vUGuN2bwlh8jlV41s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761873960; c=relaxed/simple;
	bh=Kcz27g9RhnajAiqnu1FKlzrH3hpZMXkQTHtiteG54GI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sZ5swy8Cnvvn6vii0pZwNZ3uZsPpFMMo+aha4qR6RUDj0WlFTj2IeODy2VW47eIj2VWLqtvl/8it/h1ZDXdj1E5wRJ478mo9kvBs3jjlwhXQqR57rPcUBs32kxTfJxw2E5UVxbDg/vKs24Cub1ulK6JSXETZ+oD3z+8WnQsR4R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7nC4wvK; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7nC4wvK"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7a26ea3bf76so2467943b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 18:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873958; x=1762478758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VaURaIP5+TX7dlIxvAmW+dQaSllGF7Unqu0q5FGyxEM=;
        b=e7nC4wvKFwKMIakXHi4my2ZfJq+/T2In5ggVvkDxqm2W9wrKdBAhDHMhPB7axotbI4
         tXzWS5yZ7h8suo1Ib5OeVMixMsDtce/QYqQvrSfeCcam6fGIa0XE6RV+JislNXU7BS/B
         Nw2IFZVMDlkRvYLPv4qQpJpcBTnrr6rul+RopGRqSpz2HcJKbJkYqmBLMGxNt/A/Z+84
         8dvkF2Ccq2dqPTWoRCXgXRaqKvd/pda0Eyw6xxwlfeg9thLLjPo4cKr5lkAPjEmSkP9j
         GHa4XnVNwLs3zecNmEE8zoqnO5CpP08SL4eiocesMovV9SETmT6q6opMzEXUHlTyY0aY
         xCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873958; x=1762478758;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VaURaIP5+TX7dlIxvAmW+dQaSllGF7Unqu0q5FGyxEM=;
        b=VCxDNDVFVrLEQSFpUamFEvuglKVGoWEGWl4gauf+PpyQE+TcNxTJgCOQo1B3AW9Rro
         310YAsC+WvNyfwAVTkUoeVmFQyMztJyoI0ixVsha2aI+lNLiuviyjUiKkmQPPEgUx7vA
         GL1gc+SsMSVabiVF52YzhW7gUYpQHj8uKZ/tqhtAdS6c8uYiXBstwwUAMa39aKSfZN01
         mSKZWqbBithbgLFw0+TwwtGnj3FefU8mOCODGHH0XaVfMI6swYJvNzQGC2xHJJ0mfq+p
         1KPqaMGT4jUZwQxDAnx0IgomKL4WJ7mu9UoejPZaO8+MeSh622V8eOXv46NgSo/rq6UN
         YZ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpASSLkUfJf5doyE/zYvE3SawBdRQyUsbWA5pzMSw2bq/AbjN+Rj7LqlQ3F/iLdcMQkREW6nfGXyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH0uIEZ0kV5MyRMAWJe67icWofkREEiFfsLKZVy4rEs0uQosHp
	cz7TbsTgXAdsi3cT1Wy9bRIEiaQOH5x/BwjX8FYzGNbgbGxU1d6IH9a4lJ3GWg==
X-Gm-Gg: ASbGncuOU6Q6Q+xmajzPkw/WBRfYM/lCUI4esehriprdQVu9AOTpxl6yBNlEhmFuuvF
	Kv1nCPDUd6iG1R0TgKPviCtGmPHROEfcW8tgZwy8pD7zl52TTaPoyfY/wIxTqNpnwBGhtEAZWCh
	VNRWstiCToA2zLtGgGkJLMlW1pT9wYL3g4S7403CvR77dAmYBXPIfCUuY4lFeQdckjd+U7/vgez
	RM4L7cB+ft7/KgBkXKDn3XnN+esnodwRFv3y0UqQ+hy7nq+3JXdLBe/+fbMI5T6W6qMW7hXVP5F
	gTJDouWmF1tV0tFip8Iag+NhHRgAMipvR+dX1T7NvUCRNAnmFgtEilBJ5QJ7gLiKSoPl5pDFM8x
	VFeX254Mj5RMcZU5MLRkvFJ1M7IK3bpxTw8AMiAsA0bureEqCgSEiXoNtWHCy0cFbWJ5D3BOg5T
	e8ZOzUHg40u7/tTcfH2zcUIRh6eDMbLry6IyUJHnaxN5nn5w==
X-Google-Smtp-Source: AGHT+IGmzLDvZJcuGnh6xArRWggVABpY+14Hel5RqBZtEIKeuXbtVlzzsUxuU4mKWetkjjJ3yhLZhw==
X-Received: by 2002:a05:6a20:3d07:b0:334:a93d:83ad with SMTP id adf61e73a8af0-348ca253b8amr2335824637.8.1761873958571;
        Thu, 30 Oct 2025 18:25:58 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d7273fsm194639b3a.24.2025.10.30.18.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 18:25:58 -0700 (PDT)
Message-ID: <51a7cad1-e0c6-44fa-a7f7-50ecc95a58f4@gmail.com>
Date: Fri, 31 Oct 2025 10:25:56 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/docs/sphinx-build-wrapper: Emit $SPHINXOPTS later
 in args list
From: Akira Yokosawa <akiyks@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <eaf4bfd8-fb80-45d0-b3ec-4047692ebbed@gmail.com>
 <91aef821-6355-4135-b179-69b845a827f6@gmail.com>
 <87v7jxr9hd.fsf@trenco.lwn.net>
 <d1ade088-30d3-4ee3-8df6-ba240adf2ec4@gmail.com>
Content-Language: en-US
In-Reply-To: <d1ade088-30d3-4ee3-8df6-ba240adf2ec4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, 30 Oct 2025 18:55:04 +0900, Akira Yokosawa wrote:
> [-CC: Mauro and Randy]
> 
> Hi,
> 
> On Wed, 29 Oct 2025 09:52:30 -0600, Jonathan Corbet wrote:
>> Akira Yokosawa <akiyks@gmail.com> writes:
> [...]
> 
>>> Jon, could you consider applying this fix and making it be tested
>>> directly at https://www.kernel.org/doc/html/next/ ?
>>>
>>> The custom "next-2025mmdd" tag there would be helpful for us to catch
>>> regressions in linux-next docs builds.
>>
>> It doesn't seem like there should be any regressions ... I've applied
>> it, thanks.
> 
> Today's build at https://www.kernel.org/doc/html/next/ still has
> "6.18.0-rc3" as the version tag.  Other new changes in docs-next are
> reflected there.
> 

Now, the version tag reads "next-20251030".

Nice to see it working again!

Thanks, Akira

