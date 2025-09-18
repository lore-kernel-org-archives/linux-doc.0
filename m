Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4DD21CC63
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758203632; cv=none; b=tNCl5JfAgr/D0yV175Ov0IAW1b4PxZ9pmVoXSPpS3LlnbsfTIPT5d8U5l3IIMfr2/eQPIQoyTCQkHOavJ68dNzz01mld2h3G1jSiHv9343TsqZ5PfMWRV/1k9QsPHf/FTVDKw5mIkErPJ4Jq4osj7Ms4nLMTctUxekQihd7Mzk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758203632; c=relaxed/simple;
	bh=W8d+rtW76hd2LNkPX2+QJLDJy6PBL5cszIE1g/3/9FI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MShGIE7zib7ePgmhP1dvKj/W0MaqEqwNjAAYEXHn0VKP39x3tPb1K81aX0DC8s13+BMyZackRrPh9i8hO+Ppvuij97I6Ni/kMhedXYF57Cfpz/ADk0MiPI+ZZ2GAb8Dr36HDJhft2jUQjYXPH9q4m2dCs894Olvz89Icra60kto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfQMeVPw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfQMeVPw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b07ba1c3df4so179936866b.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758203628; x=1758808428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7efdXg49cd0dO4HNsPgED93u6J0FRsteNdyMBWuRc0=;
        b=cfQMeVPwhlYmpXtRfT5BYz/T64TCrvFJH32cIptJYbfQCQtwjQsSKaALeXPvk33VpH
         arNXDWeQtAB702/agV1Yb32LnvTiUtMqTik2TaYQiQXOKm/pXZfcgDMDgXTbX3k+8A0y
         OaRPcDv3acaWTtrxzqWfSR7KIQ/pWUhzTwypH+zeKkK5pzI7Zjt4xFlqjNNLgyFIMmRT
         40MWju1htAXyxrvY9WduasEk6HQQXXrUbFxklSW+ghU45OQefJky7Yl77X2GMM7RIDRD
         b6hxehcLvwJwR1QDj0FxPKio+SUWdBrDk8SxtjjdvS9IxiLeQCsa5koecQdC1qlQah4D
         ywig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758203628; x=1758808428;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7efdXg49cd0dO4HNsPgED93u6J0FRsteNdyMBWuRc0=;
        b=xFhsNGOAnIhgbOp82bYo8DIxspK7qHSQQZ9cXKCovFgE9gJv0iS9k6c6+jhQ5MEOBb
         vPWwJOHNKib6wC25QEPlCmwfuLL8c09VEyeWZhe0chBkguF6H0QyKz9NP/YfarCBhGVT
         1FpTKtfyp9nQkTULxKcnkzSoKbpJUIJBlQGEnPk7JKVQNDV9UUBW4NEHUQAhAWnCSSlX
         A9sEDw6PIvlq570WkNqls8xWdkXkiOJJyWe1cAcAk6x1be/6fYGRidb7iZ4BV6KrG4xJ
         HO73kRtWGy77rK4Pd4crPlVGx9Q4NkCxf1Uhpw9nwD1oLXp9q+IOv21IiuPkXVrGql+5
         YOVw==
X-Forwarded-Encrypted: i=1; AJvYcCXrQmJwBTs37D+7kL0T2hwnsI+IeIq52hj4vOYtiba0KqFY5CNTuY4SvCRkbNV0EVQ9O8xJiQnoVA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmUjLcT672dveCefXpkgI9hgHNNOmkzeZVDDe2iaygTPlKY21v
	IxOjMY/0HPvQmGQK5uAAkndVteyzH8wfR0wu+0Yi4DuXAEba/qvqOue5LHZGk8JngFI=
X-Gm-Gg: ASbGnctiEr6ucByR4dtcc7KZQMn2tAINftMnzdijI0g/cBhnD4fsu5tvKea3kwkcjdn
	ZaKZMGhAHrhaTfNU5kI6yFm79G3OmcqP/8H+kqoYgi69axb1Bev7P1a/H5qeb6JNVBGwTIckwaX
	h8SQDNcexEQF9AIvNnkIm/nAdnvOrwn341k9U1znq/H1NIsWwjH8+jT++YwoDhxJJrDWetl20hf
	soPGU+kEVH+Yjl5Yjjcs+zKdlnroi0bnO1zaqu7FfpGbLxsD3mt3kjWp3hThseD+sl90DXZDGxV
	pxkloXl+1lBSLT6Eo7TTJA2d4khe5avtCae1IBpBdNBnZVXp4rlcc2AeUnwv1/4Q+FL0wLEm9SD
	uH6QsQKWfru1lg3PwzrWVB14O2iOVKdoa88P0EgU/IoP1M3omMDw=
X-Google-Smtp-Source: AGHT+IHnDWpjM1umgSyHsR6OREF3QxVVNfm6x8W+jII5XcXDsJKZeNe+EM7x++buErDbKkF9QmRQfw==
X-Received: by 2002:a17:907:7e93:b0:b02:a093:eac9 with SMTP id a640c23a62f3a-b1bc1169518mr637192866b.53.1758203628349;
        Thu, 18 Sep 2025 06:53:48 -0700 (PDT)
Received: from [172.20.10.3] ([109.166.131.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f44bbcsm203026466b.5.2025.09.18.06.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 06:53:47 -0700 (PDT)
Message-ID: <c3ab4a21-183f-495a-b3b5-cc74b392eebc@linaro.org>
Date: Thu, 18 Sep 2025 16:53:45 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 09/16] genirq/irqdesc: Have nr_irqs as non-static
To: Thomas Gleixner <tglx@linutronix.de>, David Hildenbrand
 <david@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <20250912150855.2901211-10-eugen.hristev@linaro.org> <87cy7q9k8y.ffs@tglx>
 <87a52u9jyl.ffs@tglx> <8df2cf28-c15e-4692-a127-6a5c966a965e@linaro.org>
 <2bd45749-e483-45ea-9c55-74c5ba15b012@redhat.com> <87v7lh891c.ffs@tglx>
 <95ff36c2-284a-46ba-984b-a3286402ebf8@redhat.com>
 <24d6a51d-f5f8-44d7-94cb-58b71ebf473a@linaro.org>
 <7f4aa4c6-7b77-422b-9f7a-d01530c54bff@redhat.com> <87segk9az5.ffs@tglx>
 <f8d3c2d4-8399-4169-8527-3c87922f2ef1@redhat.com> <87jz1w88zq.ffs@tglx>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <87jz1w88zq.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/25 11:23, Thomas Gleixner wrote:
> On Wed, Sep 17 2025 at 21:03, David Hildenbrand wrote:
>>> As this is specific for the compiled kernel version you can define an
>>> extensible struct format for the table.
>>>
>>> struct inspect_entry {
>>> 	unsigned long	properties;
>>>          unsigned int	type;
>>>          unsigned int	id;
>>>          const char	name[$MAX_NAME_LEN];
>>> 	unsigned long	address;
>>>          unsigned long	length;
>>>          ....
>>> };
>>>
>>> @type
>>>         refers either to a table with type information, which describes
>>>         the struct in some way or just generate a detached compile time
>>>         description.
>>>
>>> @id
>>>         a unique id created at compile time or via registration at
>>>         runtime. Might not be required
>>
>> We discussed that maybe one would want some kind of a "class" 
>> description. For example we might have to register one pgdat area per 
>> node. Giving each one a unique name might be impractical / unreasonable.
>>
>> Still, someone would want to select / filter out all entries of the same 
>> "class".
>>
>> Just a thought.
> 
> Right. As I said this was mostly a insta brain dump to start a
> discussion. Seems it worked :)
> 
>>> @properties:
>>>
>>>          A "bitfield", which allows to mark this entry as (in)valid for a
>>>          particular consumer.
>>>
>>>          That obviously requires to modify these properties when the
>>>          requirements of a consumer change, new consumers arrive or new
>>>          producers are added, but I think it's easier to do that at the
>>>          producer side than maintaining filters on all consumer ends
>>>          forever.
>>
>> Question would be if that is not up to a consumer to decide ("allowlist" 
>> / filter) by class or id, stored elsewhere.
> 
> Yes, I looked at it the wrong way round. We should leave the filtering
> to the consumers. If you use allow lists, then a newly introduced class
> won't be automatically exposed everywhere.
> 
> Thanks,
> 
>         tglx


So, one direction to follow from this discussion is to have the
inspection entry and inspection table for all these entries.
Now, one burning question open for debate, is, should this reside into mm ?
mm/inspect.h would have to define the inspection entry struct, and some
macros to help everyone add an inspection entry.
E.g. INSPECTION_ENTRY(my ptr, my size);
and this would be used all over the kernel wherever folks want to
register something.
Now the second part is, where to keep all the inspection drivers ?
Would it make sense to have mm/inspection/inspection_helpers.h which
would keep the table start/end, some macros to traverse the tables, and
this would be included by the inspection drivers.
inspection drivers would then probe via any mechanism, and tap into the
inspection table.
I am thinking that my model with a single backend can be enhanced by
allowing any inspection driver to access it. And further on, each
inspection driver would register a notifier to be called when an entry
is being created or not. This would mean N possible drivers connected to
the table at the same time. ( if that would make sense...)
Would it make sense for pstore to have an inspection driver that would
be connected here to get different kinds of stuff ?
Would it make sense to have some debugfs driver that would just expose
to user space different regions ? Perhaps something similar with
/proc/kcore but not the whole kernel memory rather only the exposed
inspection entries.
Now, for the dynamic memory, e.g. memblock_alloc and friends ,
would it be interesting to have a flag e.g. MEMBLOCK_INSPECT, that would
be used when calling it, and in the background, this would request an
inspection_entry being created ? Or it makes more sense to call some
function like inspect_register as a different call directly at the
allocation point ?

Feel free to throw your opinion at each of the above.
Thanks for helping out !
