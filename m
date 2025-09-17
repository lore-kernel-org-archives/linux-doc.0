Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0701826F46F
	for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758087831; cv=none; b=jaPlWNwNUFWMLier16iTH9HYsYNjlgM8Pzlf/4NMIIuO6fqMnOK7mpOvL46CYXZp9t2UnYNrC6FxDMuGs3EIu8AbUReA1dcEPikLJsTXCwsAUaXAtftrePy4uLL3y6T1G33su6AfZO3vwlXUFmFkIT1ikOMqsxegGf/HzZgRXGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758087831; c=relaxed/simple;
	bh=2Rj2GVVJeO3cElmAMzCe+vsZ7kk7vpWF5sm/8l3AHd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXh0l98v2poLaT7cJX5q+wod+R1aNQunynCpa3LKfMB1gflOj9Ndav4/bueEJdME53LPPxDO6lXfUg+d2QMLhti01egMz072YIjeSmP4foIO+GUkfhhhS/7D4gbxCt9KOq7EH1VRcyv7w0dx+3J6PnSnhs9MzQG+CaXykQCAiA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bahRn+WE; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bahRn+WE"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b07c081660aso912062766b.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 22:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758087828; x=1758692628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CW6YRUB7XWZg6Z0QvIr5Jdp9CvsPmVtxl4KHm6Wzt7g=;
        b=bahRn+WE6Dm9TwNA8fqpX/CAWNUyUdT37CPdrvoYBZ+zF3AfoojbVZDika7I2d/O5i
         JAzevz8or6hZBhQeCy0coOVyjpNdqev5KgTseH4dv7Jvt3zucPhrSIY+J9Z978FQdIS1
         UsJUHi9S/7gUvi9thBF9ASjWAHM1wpSbMAr4YgqJoGdidfVDNDwXxwf8OXlWWxl1aCtf
         +kv5AdUQOifw85GCvDvPo3AodUv3QVhtJuPWpNSGlPQACDKb8Bqk6RjU3pqLvH9odVY1
         8DHh68E5LeURTLUuzIyKHaI5qnAOF7vSJQe5EVlPSN7/3YABk4KBHq1+F2MBNV8GvzoT
         6Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758087828; x=1758692628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CW6YRUB7XWZg6Z0QvIr5Jdp9CvsPmVtxl4KHm6Wzt7g=;
        b=xF791W/LcTPFxtrrZ9H61EIeFynOnIWhroksIgGTboME0rT15Z/PjcKwL2TTnp7FoG
         HJeUiBv5LSyuNuV4K8ePwDM7DL2276msiAmtnLYjOnp+9aIBf4wHhxx83HaDHRhrjhON
         8k4TyFjgl4Cb3ctYZvk9iyIPXW70PtbpB2FGhqPgv95xmYv7s13LxnH25Hzp+f/xwlEi
         9K89tLO+it26mKlfzJtUu7lDsWtfGsRmtLS2+6RQ0PtF/tst2ayaA/2Uaf2FleEn8Nvv
         O5wG98wIgTipgVuVZltEiCi7Gl8doFZ9X9mi8Dg3oJ+aIgWofdGnGfSJe7fLYNODYsqV
         E2sw==
X-Forwarded-Encrypted: i=1; AJvYcCUvN41e0FUeHzuAOetXA22rz8Q+eQINIFlMdjPiH9IB6mtrUw5LG0r18xWI46gtqmXqkVlvIWvPrZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpRb/0whf/8HVjruB4u5d0TXCkytPv8TkS3eCKbkgnkWoNUQMB
	sacQibmybpzyQqFEYfVrBmu0xH/2zAQp9wH+NSzj+ZGEMo8gGN5wi+oD6fNR57T0aWY=
X-Gm-Gg: ASbGnculsHXuWBiJeka9coo73/zg5uiRbVgzYadZvRjbwodE+MPPen7b8nxlIRw8xFI
	fvVvwTxc6EISedMTAOHsifYP5VQLxCYXjVD1NrAtaTGND2YHiwXtl4B5Af01FS8uAXhEMuoDC6X
	uqz++6gK5O/YqSNndYKtQh5FAtCdxXLBiORrQL4tk3ODerpYfRUdbpFBZxgxgb5o1xTt4uEYgFF
	GsOPwuoHbJ6WBC05HC5Nc38ZMN0hqQtqadoSnMBFQVJEx4Svd8JidWvXQ8wMGdfNVASQ9nkaruM
	uISBLwLeRwMOVPSHUwyM8F0OYV9wvaJ5gPjC3ckBO7aheVmbAdj7aTE2Pj4OJIsv9fV6qozxWOc
	O3IoQy+Vom922CxGdvTEQ8SV/wK07nA==
X-Google-Smtp-Source: AGHT+IEwTeAqrWw3yRYXMNv2Kyom1bFBunp2rNawKurYFNJfFiYeBaBgK7tfvL+8o/YQVxm7ewmS1g==
X-Received: by 2002:a17:907:3f0a:b0:b08:85d0:3d8b with SMTP id a640c23a62f3a-b1bb73a69abmr108132766b.21.1758087828294;
        Tue, 16 Sep 2025 22:43:48 -0700 (PDT)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c6110c27sm1088029366b.66.2025.09.16.22.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 22:43:47 -0700 (PDT)
Message-ID: <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
Date: Wed, 17 Sep 2025 08:43:46 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <87a52u9jyl.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/17/25 00:16, Thomas Gleixner wrote:
> On Tue, Sep 16 2025 at 23:10, Thomas Gleixner wrote:
>> On Fri, Sep 12 2025 at 18:08, Eugen Hristev wrote:
>>> nr_irqs is required for debugging the kernel, and needs to be
>>> accessible for kmemdump into vmcoreinfo.
>>
>> That's a patently bad idea.
>>
>> Care to grep how many instances of 'nr_irqs' variables are in the
>> kernel?
>>
>> That name is way too generic to be made global.
> 
> Aside of that there is _ZERO_ justification to expose variables globaly,
> which have been made file local with a lot of effort in the past.
> 
> I pointed you to a solution for that and just because David does not
> like it means that it's acceptable to fiddle in subsystems and expose
> their carefully localized variables.
> 

I agree. I explained the solution to David. He wanted to un-static
everything. I disagreed.
I implemented your idea in the v2 of the patch series.
Did you have a look on how it turned out ?
Perhaps I can improve on that and make it more acceptable.

Eugen

> Thanks
> 
>         tglx

