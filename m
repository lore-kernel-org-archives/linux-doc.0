Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68788213E66
	for <linux-doc@vger.kernel.org>; Wed,  7 May 2025 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613680; cv=none; b=QWyRDGPyAM/zNlvrbAYgHRNjo2jgu4lNNnORux5WECIUjZclI/8CfrkjcPpg/7bSFYoWFN0kD6W+TbFmf9p4KUafiwOghjNezyhEIvxu9fY7RqyQuKyQA/rPqkqeOs1makvMRaYC6y+ZXvYDHOkcIBu2xflnws03G+G4kshoi+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613680; c=relaxed/simple;
	bh=mN/SA7cybJrXxsBWCutgmdZPBRjmsXSS3+VC0dZT/vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc8Xw4tsfzfBS7VkTYbpgQN8z/3fTA6iFam6yJqriS7VU0OIGQog23JKeMjrv+qmfm04E08+Cu1ZHBE3p5TiIDqPcN78LTDwtAHaVlEuzstGhJeasJqZz4aMC4nuayi/NbIxwABogHk78Gk8+ViFvyyhBMKvcPitKHgb6s4dSTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPtQmXVo; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPtQmXVo"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad1e8e2ad6bso156223866b.0
        for <linux-doc@vger.kernel.org>; Wed, 07 May 2025 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746613677; x=1747218477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3m3Sg0+bVIJxu2EZBhejSmz5ffY//z82ft5OZBcPQk=;
        b=OPtQmXVoJmlB7jZKrSK31bjK61wQZOLxHyCnVBTgRm+13gRkZd2HtAnymC8nxqkWH/
         f8eTgLH3lq5QO/8J0dvYIfWHvy3zk9lUn/+kEpPvrAyx9IvQKvQ3abvKLn8OcwS+8oa1
         zmgMv5mSb6AmuZWdRbusC36OOolhq3DC5haJaRHpvKXLJAGWCxampxtihHvmVayTDJeT
         gOODWGTGcZgFo4/GM6yn/arAzd7ALAKSUvrvt2CJVt9Hc41O9OmZ+lmp++Kyt2IGr9+q
         f7a+MmuWHFsMBB+mytXTSeKM7OCXZqhKbGwYezmq503IeAbOCJV6GAvZVIgzRI23Zk0V
         N8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746613677; x=1747218477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3m3Sg0+bVIJxu2EZBhejSmz5ffY//z82ft5OZBcPQk=;
        b=Tk5G4pM0pUPJPw8rcZ4h4WnnexPbyZYtKZ98kFNyI9NXMDO+GGQW+P6KGQ+3EZsXdr
         FfEZCSUn/cW0HHeQuX9EdwCj3uq7zP1daR08gPGzRgkzKII7ZqDU5xdz/TffX55NCR32
         bRLxLlG3VegigqpPrrUG6YlXbTSmuUPXaT/v/NriwPeWRkhVnc44iEMt7v4PRvmPNQxQ
         zIFjChwRzJss/ZFBvHqGF6CuMm4ulTyNtEbFBzcbQ+C4Bi2+AJh1v0CtiU5dEBguWTGj
         WEyp9EQWe9VFQ0GuEM74C0c6xdan/cgaNndXMpXN/FA+Ez//cTNCi/O3912e0H8aDA75
         G9DQ==
X-Gm-Message-State: AOJu0Yy1p7c1yRmH+yJgobyCRD6N6lMlFrjJwSKA5pY8W3IfzvvxrJbQ
	rPe+sRLmTIIoQ89gPbCMz6P9cpWThKNyDqLjpEzugsJpbwwvi8U9LUhsM2hs5TU=
X-Gm-Gg: ASbGncsgOEKG6MFXQUGhxLw7+jNrn9Mp+NZ/vtECTxcAj3E2qfCXmBeqGTnBu9C5MeD
	9oZ65GLqqEHD9TZnwApFrR4Zt8SDxlVF9wVVrb3HO1FdHMMdowg3iyWX8CFXsLz074FhkBtDnUk
	zTZJLkij8u0aR28UBLOr2rWfuGsl1mFjMVsXMuOoRWAblmHiZfufM3EypYpHvnuzPQKlLWGXL1J
	fu44od3/FAjIARr7m1BOujP9ycb272XXY/MtcOtRuN24/cV+VCJ5NvySgU+YcOMQJrWJyvYfjj8
	TOExlNisFi1HIA0cTrfA8xWvOaA1Z7QMVELx2JqXkVzfQm9L
X-Google-Smtp-Source: AGHT+IGcySqujnpgP/KzWefd3PmSmn8wVFheaUVYXa/h4ueAk588Gd+cTopnd3x4abbh2j4LBSSshQ==
X-Received: by 2002:a17:907:1c9e:b0:ac6:fe8c:e7bb with SMTP id a640c23a62f3a-ad1e8e2bd6cmr275060366b.55.1746613676715;
        Wed, 07 May 2025 03:27:56 -0700 (PDT)
Received: from [192.168.0.32] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950ad15sm881835766b.154.2025.05.07.03.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 03:27:56 -0700 (PDT)
Message-ID: <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Date: Wed, 7 May 2025 13:27:55 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <87h61wn2qq.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/7/25 13:18, Thomas Gleixner wrote:
> 
> $Subject: ... See
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes
> 
> On Tue, Apr 22 2025 at 14:31, Eugen Hristev wrote:
>> Add function to register irq info into kmemdump.
> 
> What is irq info? Please explain explicitly which information is exposed
> and why.
> 
>>  
>> +void irq_kmemdump_register(void)
>> +{
>> +	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
>> +}
>> +EXPORT_SYMBOL_GPL(irq_kmemdump_register);
> 
> Are you going to slap a gazillion of those register a single variable
> functions all over the place?
> 
> That's a really horrible idea.
> 
> The obvious way to deal with that is to annotate the variable:
> 
> static unsigned int nr_irqs = NR_IRQS;
> KMEMDUMP_VAR(nr_irqs);
> 
> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
> kmemdump specific section and then kmemdump can just walk that section
> and dump stuff. No magic register functions and no extra storage
> management for static/global variables.
> 
> No?

Thank you very much for your review ! I will try it out.

Eugen
> 
> Thanks,
> 
>         tglx

