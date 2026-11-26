Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706989;
	b=SvKf+2EprkV0u7Xmi1CA6o/AVQzpkMhVNXR9vEOBRcdNDVz8ul6tc8lty9XhrHGNKiar
	 tzs4LDaV9nCCbSdgmVOziP5TOQ9EVsVUqr3b5X8buF34Q7MaP6W4pDDvztQ9jI5LSTvOD
	 AS5lO72Z1s5nyqxIJgepVACcyyVrFRRiFe2Uno99ekjmDTqSINY5+fr+/oCrqTzpHoz8D
	 BVnMfe3KCWAf77v+mXE8+XGdEEwD8TQyeEViwk9y0hNFa32O2FurYSbnxyKlmccwcGOap
	 TsMs4fxHdXNYdfBx4MYYkjUdtP1BktpmzaPUg9opsJI1R0vMjulg2adALfpXgHgT9zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3Z7nPEaoyhJ41r3bk+azLIXCJVO4Tkbh+/BIA8Q8SWo=;
	b=haek5AXBg8RpUalQA3ReaJRBFowXTDpBC5O3aNfRPKqqAFITPpoFqs9VF4rj35wAZ7DP
	 PFA/KEn/ESia6IqhzXTR7CWalpOYYW9VORirgKIoB5eUH9rOV4abGxi1Er9ZsW5FrKOjY
	 fOfKy8LcwHs06akqVakC6081p+JQEt2jahY37K7OaRehhl2Asy5JSLd9MzY8C3QVaEeqt
	 Y+7MTGkqHw+66tiituCew4C18XIjD9vpJh2tnzVxUIpmcD0dkUqP63OCB7UVvT/FplnJb
	 wUC+wdvv1GY1cZh/mDKasQconyuPBORIuXBvx36/YKsATnzgA9WYIdwPvf790JI+jDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=GjMdjqQ2;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9207B606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 15:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9207B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=GjMdjqQ2
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05b210703so3415731b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795706988; x=1796311788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Z7nPEaoyhJ41r3bk+azLIXCJVO4Tkbh+/BIA8Q8SWo=;
        b=GjMdjqQ2XrzHynrZkiyhonkCN8ImWYx7PiVDtrnvlMytNmMKcItTmoYy1yvs/VA0Jl
         GFnghbePsp/ef/ngLSGU+sQbm5hEn3sDd3mzDRlwc5LcKseyYcB3BW6e6c6iHBSdd035
         olFy8QGW/0j2acreNbQV7pWYc/rG20jU93MejM2AOpJ40k9vXqye01MLIDXMJUzM1thK
         47ErhQkoTzsZv6h0WAMeCigHqaTiQnV/JiVWKUPWFbV6RtgJvAe3YXpvYYjIU0gResRq
         cyTTOVXAIa6Zgg5TWvh6Esin+9Qc5WygvuRczrtFPhd3y0vb0uHhaqYtZakLA6grvD+E
         qm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706988; x=1796311788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Z7nPEaoyhJ41r3bk+azLIXCJVO4Tkbh+/BIA8Q8SWo=;
        b=E4aGxFehpY3Pv3gg9N6vl+qPZTOSL/137Hk6vewnT6uFRL6kOAMSx3beJEx8Pi6pql
         x7cZezZ/xW7qOv/UGSoNKegdPx5S3t626oTOQ0a4gBuzvIIbSU7RS7osrvw2jygA87An
         02FKMCDjk2VyNF4uUsczZYc8GqPC1L74N1P3MaXV8fKvUbkc+afqtPe/6cn2pj68sdoN
         HaIupx/Mlfgs8RoYOJufQyhZ22Qi84pDiQB1ofU5q1XXf5YAd/btQ213fHjRB6o/60Ad
         Xxdm+pstT81+op7ZkpTgnkB72EZ4Yh00s/Yd8bauIDxD55jh7wd8loTcGEp7VBqbmwtV
         iFgw==
X-Forwarded-Encrypted: i=1; AL+hErHJr27UoYNuyiJ2OiAvWO2j1kr7VacmOYaEV05p+fIzC2PFCwLp4jaC77+JNj+xKUrBz6SSa9ElrEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mFhsgY4SJJCawyhInuF9jxlFw+Dd8HIbHZdI4vVWJ/EtePjqO
	s6YK4fUQaiXLlCycFnB7cMXIkmZPdveLU/0zHwC1ULaqoR8p+lDLbuqEvCOZwyin6iw=
X-Gm-Gg: AZFdTZfk46Q/QsQK6ZpDrHUIcR4NAXVZjeH8qC2hEMbTOuaZPg4yvefZcw0YU2c6tr+
	0d49JRpk+hozw3On2FhHYfDOT6znGSV5RMS+s6DLGcUT+ap5WeLqOBAuBVCxQXOfvv5ASiRFBei
	GyYWER09Cj6GUOJWqtyEIvrQ6g/AIgZeVp5WpOhpil43jF8b6v6u9B3kTPO4jBPzVmYU/Fu+wfF
	hHX0Pq2XabldO2Q8ejGG7n+CGoa7ye1GnDS8qx6iEx9Hhcz2PwmsSWBEOXZ7qbqW+4rTqMMxsVy
	zCxykFkFi2CRnTHI2ikUqKxwv2dQYT2+V5QwLHHGkQPUZNEhTTNE/e22q8vJPJpfm8lG2Rp9L8Z
	vymZBrT7xt64zTyKTZMUvlqLx4ljq/i0kVOlLx2TiiJQT+AzBFQ/bwrwVS9aj9eelMVAsRQfRDB
	MzWunLGEQipJDtN2a7lSn9SEfv16nA6Smo7r21vgQI1J5UXW4LkdxkJ6jRkmiUTch39TuaEO9HF
	4dCLBOtN0r4sKM9BgjbF4ULovgejJDc70O6VRzhRHKSWyB8Hw8ItWXXw7sLI8pyWCvra03KwTCi
	KLFtZ1J+C/Wkovp8xX3dsOocNE+sapmdcLndk1rlw/TVFounZWHDeHVHba/N8nQj90aYiYa0ifZ
	Da1bC55+26JcbKBfS6zwLREVm5Pi8alSXbcnGT3IYzMAp/TnHDZIM6Y+ohB5eUdVDJDXqth4=
X-Received: by 2002:a05:6a00:170d:b0:885:e2eb:23b6 with SMTP id d2e1a72fcca58-8c87b9cfab5mr20410631b3a.11.1795706987829;
        Thu, 26 Nov 2026 07:29:47 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285ccf4sm10534872b3a.12.2026.11.26.07.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:29:47 -0800 (PST)
Message-ID: <970946a8-855e-4d65-97d9-71c7cb2ceb20@kernel.dk>
Date: Thu, 26 Nov 2026 08:29:46 -0700
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 0/3] block: delay support for error injection
To: Christoph Hellwig <hch@lst.de>
Cc: Haris Iqbal <haris.iqbal@linux.dev>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20261111215838.103356-1-haris.iqbal@linux.dev>
 <179501806989.17649.3138860274842922761.b4-ty@b4>
 <20261120164416.GA32719@lst.de>
 <edb8249a-7bc3-430e-bbb7-243e1881a0b8@linux.dev>
 <1cf30693-44c6-4761-9900-e36259082e4e@kernel.dk>
 <20261126083421.GA7403@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261126083421.GA7403@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 1:34 AM, Christoph Hellwig wrote:
> On Wed, Nov 25, 2026 at 06:49:59PM -0700, Jens Axboe wrote:
>>> I can resend with the fix, or send just the fix to be patched above
>>> this, since these are already picked. Let me know whats preferable.
>>
>> Send a fix please, that should always be the default as otherwise
>> I have to rebase the tree.
> 
> Unless it is at the end of the branch.  And looking at your tree, it
> seems like you have queued this up at the end, but in the 7.4 branch.
> Which I hadn't noticed before, and which seems wrong.  Not only is
> this a brand new feature and we're at -rc4, it also makes it really
> hard to get the tree in sync for other features pending for 7.5.
> (which we plan to send after this lands).

Gah, yes that is certainly a mistake, in my mind I had it staged for 7.5
of course. But looks like that ship sailed, as it's now in Linus's tree
as well as part of updates from last week. How broken is this right now,
in terms of what fix(es) we need? We can always just disable it. For
7.5, we can just pull in the block-7.4 branch and resolve the conflicts
that way, fairly straight forward and usual approach.

-- 
Jens Axboe
