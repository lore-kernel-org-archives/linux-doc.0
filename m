Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B187448391
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792771; cv=none; b=m5SFnKMZJthOiB+9EFttr60kaZ7ZU233BFuM8VSDTXhv7HKW7Orm9euH2579fRG/fehkBDMIzRHGMgVeYXY1c0C+hg6DkfT7tiJA8wtNTZQEeO6A5EHuX14cbBv7AcizUSIsHspbQA+Suf+FOgNp5E5eoi04/dzJQwlR9f8gz2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792771; c=relaxed/simple;
	bh=/S2OeMB+pVw0IsnX1n74+dfcpu2Keflp/VCkHim9+Cc=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=AwcMLEHiXTK6ipbI6WmUuAyOycJTIBaAWXtd0N4eaYWhruA4ikZ2D10gIdOktt/WRWLMEDK6p8vbrnBYqs9vgvPj+P3iz4nBV/Y7JdUUKqgo8o94xoXspUt6Plv538khfykXeR8++K1BY3KmXebOHRDkC0T1urhx4shL+2fU3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnh5wxRU; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnh5wxRU"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-836c8bde2dcso15065537b3.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788792738; x=1789397538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:to
         :content-language:references:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anfs5eR69uR3hgprcQRCB5kZHsZd0+SXQ4tCOJCunJw=;
        b=fnh5wxRUz3J1D8yRKvAOLlUD0kH2Dy25Nrqgl5ga0JBg+aXaMh7EtOyz1WdVRAy+IE
         CAg4426+d/Iw1GGUDsQXC6YQzR1WPwPLVvJcHEN+uXic6ee3Gt+l2s7iQAzcUInCMyrK
         BnNKmabG8zQkzo5H33W/w4b9tXXceBdZrMvxonOqRtS/z4za5x3U/pXB9niNSntKppNl
         1WB6AXK28fVz7gZLtt5rQmeB5gbNxcWSYcxizngu0ab3VuQ8ePOgsAvYwtnNS/qMGo3o
         2IP+wdyOCVTdrVYdIBRTZVzLfsT58TIl6909+qgTuEiZuAtd66ryblusT9YiZECWjlwt
         etnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792738; x=1789397538;
        h=content-transfer-encoding:content-type:in-reply-to:from:to
         :content-language:references:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anfs5eR69uR3hgprcQRCB5kZHsZd0+SXQ4tCOJCunJw=;
        b=nK2KEMdrvsEbU8LV+pEO07XZK8ubrmvSY67TO958D3EI34i6iSwgbi0vZroKlHwMji
         q3zQ6iRuBHIwzLVTLUxJZIE34tC8IleQHdt3ja0rPCoIjVuc2ocZwULts+U5b5my7SGw
         RiB+7I3BYxQ5/YYbGY7MnB9qsraI33iaJJ3Whny3fptUgEB1fRAS01dGwd2GzKOuOdD8
         CeWw/n3T6z89dJQhEvI2I+J0QveU2ZGKQi0B9sxKqe7znLhiYKyYOq6kgns+HjJsVSlZ
         B+lt209bcKVRiYH2LxJeGeCZIqicwJc+A3CBRQ1oXOOt14wGMk/2ovRkU/ssaEPlWgtP
         EnPQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5Bc10DlGeoGjICkfgYtxsxNibQGuhU35tCVCkJlyaRUKtcYWeVbJMgLdgh4+uvzWnuVJyPWsZblw=@vger.kernel.org
X-Gm-Message-State: AFuF++ke0zbrG9kxVB00rJlRCA0tTYf0EqPKXUI0oKgDiVYsVZb30Qd3
	Wc24SypLqZJIpnLE/AQoog9yFcPZm8R814P0h3XKDVu0KxGI1+ku0cZp
X-Gm-Gg: AYBFou0B4E2ZdNIQMzfdiYL5mRbDhQiqdt1YvjGvdzlYyCZwXz7f4QRJSvtzdhxpEJw
	wMfbtDGocB2M1wen84rTQ2SPtrrX5K/K4AzVpaj7s+VRiooe+RGBgQlcqzNGtum7QSlVhc6b3Ze
	LFOLKapLpu/aUnhj2cUGgBxx2bEt3EcOwoWcVHiGe+UHAQWlOELR9Fa32Y0OJ463w+DfjFnZxg5
	IHmAxDZS5dxh4Tyxg0+lCjFFzkZEwdXpaBPUEqds3OEg62UI7rLospzB4lIPkG24myBFg8sACL5
	t92RCEmCctc58BMlOdIbdALC4VBMdGwdALWPpUh8Spr2Zqt0sFj35Gd6/6toyYWe8oZL48XqglX
	RF2DWKT5GBX4W3/HyYcL/HRaxPHUcOPRK9cmC6LJYM5+8Oxo1m1mCMzsKl4lPjXhPgsGo2Tfi2B
	Rh7mfsPqOLypkF/UJ0Tu7Xqq5dFxJJXQ4AbNXv+nbSMRux/Bn1JwzcAcwq2muUjkVFPlneJoM4J
	BgLuNj45xYI1s+CZuKikJaUK73q
X-Received: by 2002:a05:690c:c00f:b0:836:ec4d:bb29 with SMTP id 00721157ae682-87128cc54d5mr72607087b3.34.1788792738337;
        Mon, 07 Sep 2026 07:52:18 -0700 (PDT)
Received: from ?IPV6:2806:10be:d:e8df:57b9:51e0:e022:41c0? ([2806:10be:d:e8df:57b9:51e0:e022:41c0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149315162sm72634707b3.12.2026.09.07.07.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:52:17 -0700 (PDT)
Message-ID: <f9b29422-5389-4522-83e8-538e5306b3fb@gmail.com>
Date: Mon, 7 Sep 2026 09:52:15 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 02/14] cxl/ras: Fix cxl_rch_get_aer_severity() wrong
 severity register
References: <20260803221810.3685703-1-terry.bowman@amd.com>
 <20260803221810.3685703-3-terry.bowman@amd.com> <anijY3eTVWSqHLxh@wunner.de>
 <apkxP_fydVjpULaT@wunner.de>
Content-Language: en-US
To: lukas@wunner.de, linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
From: Terry Bowman <ktbowman@gmail.com>
In-Reply-To: <apkxP_fydVjpULaT@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/3/26 03:35, Lukas Wunner wrote:
> Hi Terry,
> 
> You've submitted v20 of this series, but the following
> questions haven't been addressed yet AFAICS.  I'd be
> grateful if you could take a look:
> 
> On Sun, Aug 09, 2026 at 05:57:23PM +0200, Lukas Wunner wrote:
>> Am I missing something?  Is a scenario ever conceivable where the RCEC
>> receives a message with different severity than what is inferred from
>> the registers by cxl_rch_get_aer_severity()?
> [...]
>> These so-called Advisory Non-Fatal Errors set one bit in the Correctable
>> Error Status Register (Advisory Non-Fatal Error Status, bit 13) and
>> additionally one or more bits in the Uncorrectable Error Status Register
>> (see the commit for details).
>>
>> cxl_rch_get_aer_severity() is not able to cope with such errors and
>> will incorrectly infer that the severity is AER_NONFATAL.
>>
>> Now I *think* this is not a problem because Advisory Non-Fatal Errors
>> are masked by default and the commit only unmasks them on regular PCI
>> devices, not in the RCRB of a CXL device.  Only once bit 13 in the
>> Correctable Error Mask Register is cleared in the RCRB will
>> cxl_rch_get_aer_severity() fail.  Right?
> 
> Thanks,
> 
> Lukas

Hi Lukas,

I’m sorry for missing your August 9 reply. Also, I am currently on PTO 
this week and don’t have my work laptop, so I am responding from my 
personal email account. I’ll be back in the office Wednesday.

Thanks for pointing out the issue with CE and UCE errors reported
simultaneously. I agree this is a problem and have addressed it in v20.

In v20 I remove the unused `cxl_rch_get_aer_severity()` helper, take a
snapshot of the AER registers before calling `pci_print_aer()`, and now
handle the CE and UCE parts in separate blocks. The UCE status is logged
unconditionally, which prevents a fatal record from being lost under the
advisory‑non‑fatal path. These changes directly address the scenario you
raised for v19 and also cover any other situation where a CE and a UCE
are co‑logged. The patch ishere: <https://lkml.org/lkml/2026/9/2/1629>
(v20 3/9).

Please let me know if you see any remaining concerns or corner cases
that are not yet covered. Thanks again for your review and for pointing
out the issue.

- Terry

