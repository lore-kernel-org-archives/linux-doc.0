Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F0199FB2
	for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 07:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765610589; cv=none; b=Rwj3Wt8dNtKG+eR7bWZ6n4jK/B3/LoCmJctDCDBoq5G2Qsf3VhccjWnZqQBzSNC98OybxvcJ1C2+zrehkCToKTyQrtKzBltowAdMxJVtBcnNlextrqdzriRqH+L3QT6+a1TOEESUBDYAesNFfbt+vQsZlaRmenN5frwjN9jvgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765610589; c=relaxed/simple;
	bh=9Qa+PthUmnTltiZTazohO99moG5pdpcX7qRMBsxF/ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EnJ2EbyZ/T+mUWr/RNnlp3haDMj32CgcNIndo0bFIf6V8y4pYBjijxVaCGWigoq4RkohOUhzAPHw6FWC1d9lDCgyJI1EV1ifyK0ommmYSySnpOF46VCy13CPmqUlZRl8C1cQzcBdESFhAkzxXf0ks/QJ9cYbvlt9ancUuoMViXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hd5IO/Ik; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hd5IO/Ik"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29f2676bb21so15904485ad.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Dec 2025 23:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765610587; x=1766215387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qS/a8O0BbZSZZsXyGtd7peZrK8putFww9+X+USFCeDw=;
        b=hd5IO/IkAS9Cts2py6hsAvieVf9h9ZCCP+wq7vdZv7lGLHc5Ult5/ZSoGo16bFFEi9
         IIUP5p/qP+Cq74AfbT8Ijn1rQt0YfoBujNP+PLlo3DLIZgqZe7QLOTGgzVNnX3XPq6y2
         OxFZMhGSuLqL7C7N7X12CxPkge2OnVhZsr7umtXcTGBiifiHTF4A/bT//HVcNSx+lxPM
         2SKqJ39F7qwfflmuEa+va62mlcfawqpEBCEFusZvUhYwhLYHjcTiAwl7s1RfyM8dQElg
         l5zPl8kSkv77Dr4s+Jtq4y76qqnXkYlH0D0Bu0RvCUpoVs2eiIwOW/k9hLe6EUNWi5O4
         F52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765610587; x=1766215387;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qS/a8O0BbZSZZsXyGtd7peZrK8putFww9+X+USFCeDw=;
        b=sr2aMBgb6XogkdZpac4LC3Ua8oyMd0JejZk9VNF+eVuhgLj1BD1ECXlWngHs2RHI0r
         IF44f0czDgCP6We4xeWyhxbTy2R5fkpUb8CaTbCcOCAPH+GqkpeYDpu2NXWHwGQtYkA4
         nkGDgm6QgNaILS2nTbxo50tA5JWWjVdKRw8YCKSrw9beY1jO46ys868dYU0zrEvAcjKB
         4NiBN0NoWY59BZBcchiYlqkYsi41bFkfAAI4TIExJYymquYP5dSBtRMYl5DweI1+jwBj
         Ll8wJANofbEbGBWWuXXFpHS123UxKng4KBMCVCmBRUE3LpLArJwh0kqpXuBY25p9WG3t
         lKGw==
X-Forwarded-Encrypted: i=1; AJvYcCXS3UTvV8LlQn/UxMeMqwl42nIX2XC1kmO9irlUNggavn22m5BRy5tiAclapkB1sQU3jLmT5cQZDSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe/8/rciXS/fLYSpAh6N1v+rS2xZjKXCVVDNS59RX77x7DVyms
	If7grCDXlEycgxEG7aTsvv+zwxkZcxQxfNo1q1RsKR6HGVv0g1CBC1e7heIUU/6fhqs=
X-Gm-Gg: AY/fxX6X80CrCkTJj//9ZC4slPsrenFC0ONzjthyY0nyL8cLjrcWi5rGhNwgylgTpyn
	E5dSA2kfLCco7W8ydWzSFmaYo6OumnZmnMJRKlbD0AySBWO5kCQXU9Hyr/cufgDLh4JzZdCb5jb
	89Hftp790TaIBkpo7hXJWKQZp+ICAf7NmwXz+Q5zgqWEe4IcYJ9C/ESL5VtuDKTjj2PLo8AfGII
	eJ1GTtqEaeD7zqq7JEZ2/xO4iDmaidLaHDFweuhKyQGWbPksKd2scSpx4w42JlJ4T2v/9Hf4Of9
	48narD+zNqA/dobyJTmD3uAqKfhbgJBhzyAkLoxPFSfIJC/CUxfRoDksnpjhAs7prowsMCSKmXU
	NH4cZwihfy7rcQuNLgbB89sXpqUfzOTGEPLbSG2gvwLwucrjS5VU2/slwoU+AiwP4p13CmN4gPe
	KBt49eLeJXmp7wsSvqCzNdh9DcnuR3m/gIMH8lw1aTu7k57tRK66E=
X-Google-Smtp-Source: AGHT+IF5ZAK05FTZM7z1I/Tfu2uwtqip2Rr6c/twbgvqZujsfkv8PIP29+IUmV2/Et+MT9YWs2FBBQ==
X-Received: by 2002:a17:903:2c07:b0:29d:df04:fcdf with SMTP id d9443c01a7336-29f2436dfb5mr47558295ad.42.1765610586985;
        Fri, 12 Dec 2025 23:23:06 -0800 (PST)
Received: from [10.200.3.203] (p99250-ipoefx.ipoe.ocn.ne.jp. [153.246.134.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f2563b116sm39121255ad.102.2025.12.12.23.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 23:23:06 -0800 (PST)
Message-ID: <c3db6ccd-dfc7-4a6a-82b7-3d615f8cab4f@linaro.org>
Date: Sat, 13 Dec 2025 09:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/26] Introduce meminspect
To: Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
 Trilok Soni <tsoni@quicinc.com>, Kaushal Kumar <kaushalk@qti.qualcomm.com>,
 Shiraz Hashim <shashim@qti.qualcomm.com>,
 Peter Griffin <peter.griffin@linaro.org>, stephen.s.brennan@oracle.com,
 Will McVicker <willmcvicker@google.com>,
 "stefan.schmidt@linaro.org" <stefan.schmidt@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <bf00eec5-e9fe-41df-b758-7601815b24a0@linaro.org>
 <5903a8e1-71c6-4546-ac50-35effa078dda@infradead.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <5903a8e1-71c6-4546-ac50-35effa078dda@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/13/25 08:57, Randy Dunlap wrote:
> Hi,
> 
> On 12/12/25 10:48 PM, Eugen Hristev wrote:
>>
>>
>> On 11/19/25 17:44, Eugen Hristev wrote:
>>> meminspect is a mechanism which allows the kernel to mark specific memory
>>> areas for memory dumping or specific inspection, statistics, usage.
>>> Once regions are marked, meminspect keeps an internal list with the regions
>>> in a dedicated table.
>>
>> [...]
>>
>>
>>> I will present this version at Plumbers conference in Tokyo on December 13th:
>>> https://lpc.events/event/19/contributions/2080/
>>> I am eager to discuss it there face to face.
>>
>> Summary of the discussions at LPC talk on Dec 13th:
>>
>> One main idea on the static variables annotation was to do some linker
>> magic, to create a list of variables in the tree, that would be parsed
>> by some script, the addresses and sizes would be then stored into the
>> dedicated section at the script level, without having any C code change.
>> Pros: no C code change, Cons: it would be hidden/masked from the code,
>> easy to miss out, which might lead to people's variables being annotated
>> without them knowing
>>
>> Another idea was to have variables directly stored in a dedicated
>> section which would be added to the table.
>> e.g. static int __attribute(section (...)) nr_irqs;
>> Pros: no more meminspect section Cons: have to keep all interesting
>> variables in a separate section, which might not be okay for everyone.
>>
>> On dynamic memory, the memblock flag marking did not receive any obvious
>> NAKs.
>>
>> On dynamic memory that is bigger in size than one page, as the table
>> entries are registered by virtual address, this would be non-contiguous
>> in physical memory. How is this solved?
>> -> At the moment it's left for the consumer drivers to handle this
>> situation. If the region is a VA and the size > PAGE_SIZE, then the
>> driver needs to handle the way it handles it. Maybe the driver that
>> parses the entry needs to convert it into multiple contiguous entries,
>> or just have virtual address is enough. The inspection table does not
>> enforce or limit the entries to contiguous entries only.
>>
>> On the traverse/notifier system, the implementation did not receive any
>> obvious NAKs
>>
>> General comments:
>>
>> Trilok Soni from Qualcomm mentioned they will be using this into their
>> software deliveries in production.
>>
>> Someone suggested to have some mechanism to block specific data from
>> being added to the inspection table as being sensitive non-inspectable
>> data.
>> [Eugen]: Still have to figure out how that could be done. Stuff is not
>> being added to the table by default.
>>
>> Another comment was about what use case there is in mind, is this for
>> servers, or for confidential computing, because each different use case
>> might have different requirements, like ignoring some regions is an
>> option in one case, but bloating the table in another case might not be
>> fine.
>> [Eugen]: The meminspect scenario should cover all cases and not be too
>> specific. If it is generic enough and customizable enough to care for
>> everyone's needs then I consider it being a success. It should not
>> specialize in neither of these two different cases, but rather be
>> tailored by each use case to provide the mandatory requirements for that
>> case.
>>
>> Another comment mentioned that this usecase does not apply to many
>> people due to firmware or specific hardware needed.
>> [Eugen]: one interesting proposed usecase is to have a pstore
>> driver/implementation that would traverse the inspection table at panic
>> handler time, then gather data from there to store in the pstore
>> (ramoops, mtdoops or whatever backend) and have it available to the
>> userspace after reboot. This would be a nice use case that does not
>> require firmware nor specific hardware, just pstore backend support.
>>
>> Ending note was whether this implementation is going in a good direction
>> and what would be the way to having it moving upstream.
>>
>> Thanks everyone who attended and came up with ideas and comments.
>> There are a few comments which I may have missed, so please feel free to
>> reply to this email to start a discussion thread on the topic you are
>> interested in.
>>
>> Eugen
>>
> 
> Maybe you or someone else has already mentioned this. If so, sorry I missed it.
> 
> How does this compare or contrast to VMCOREINFO?
> 
> thanks.

This inspection table could be created in an VMCOREINFO way, the patch
series here[1] is something that would fit it best .

The drawbacks are :
some static variables have to be registered to VMCOREINFO in their file
of residence. This means including vmcoreinfo header and adding
functions/code there, and everywhere that would be needed , or , the
variables have to be un-static'ed , which is a no-go.
This received more negative opinions on that particular patch series.
The annotation idea seemed cleaner and simpler, and more generic.

We could add more and more entries to the vmcoreinfo table, but that
would mean expanding it a lot, which it would maybe defy its purpose,
and be getting too big, especially for the cases where custom drivers
would like to register data.

How I see it, is that maybe the vmcoreinfo init function, could also
parse the inspection table and create more entries if that is needed.
So somehow memory inspection is a superset or generalization , while
VMCOREINFO is a more particular use case that would fit here.

Do you think of some better way to integrate the meminspect table into
VMCOREINFO ?

[1]
https://lore.kernel.org/all/20250912150855.2901211-1-eugen.hristev@linaro.org/
