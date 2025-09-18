Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00EF226CE0
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758206892; cv=none; b=RrICEieLTTHMSNDVmsWKdoocDzgr3Qj8zUdSGPuwzyv5hMaHg1t98xuA/4YeWGFtA05Z0eQej0QUsR9Eh1VIf/Ms4cLcThlefNmsqekrBVXZistZiQkNY4D/z2WWglPl2JnNNsmDVHOB4can+JieHpxxMqtv/wdC7YGUYeuiUuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758206892; c=relaxed/simple;
	bh=+6Pm7oe860827VjuzLws11HsAxMWZ3KkG/LCw0TwnQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8Zxs+8uHLASY1lvFyJww9T+YxUh1JMW6/3KUmLeZZQf2bUhnZ1cIkGakQFkb13UBPo4FYRcT7piatcx7Cg3c3UdOC8vX00p9uBp4c4YthuZS8lKNQOI8XIrttSgDBT6wWPfWtbatp1dAVUQ3xN2bUAJRTZvKWW3cSz+GD96aJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=De9Oh+La; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="De9Oh+La"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3391c94c615so339291fa.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758206889; x=1758811689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAxT3fVcqeuUfVjtRTsWYQE3cdG0LYpzTMO+2TQXp/o=;
        b=De9Oh+LaCTXV0rIHvODfatPxtQcXzKgovpQp58geWHtEpE9JdD3hgB59dsRCUoizBo
         2S0W73jXkVl9E4poR5bBI8Gh8KBCI87W92cS0pOv3GPF0Tvf7g++EscyLpcptHH7vYdm
         1NqjMkS8YYKQ884xJom+tvzgNHoiELqWsmZXZDpMOQBzb4VgjiAeVORrApQs+pYC0ghR
         uCiw61jExlnb99GG3dpCUjLPxG/QMqpwWzK39SnloLB4oBnEILHHJVYXCga+ISKSY66v
         PB6MuXFJsjJuADbvdQNU2kB4R6UpDvFNRsyzTdwK/Hqq1aZuENtrZOMgI9fLxyXGTQQY
         m+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206889; x=1758811689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAxT3fVcqeuUfVjtRTsWYQE3cdG0LYpzTMO+2TQXp/o=;
        b=rRCP/iGBSbVx583Ob+WrG024Ib8xJu+b9f+HzMDvDBSE5hkE0EXA1RcrRR7CowpBvn
         FZP/7PCZ5VHdC3Gc6XfNtl74l6SkIVHtH1T45oh7nxZHcBSOCIQxZJ6h894ycQU0Mt5W
         Vkb/+I5+OEGdgtd/KqA1A6PmtyY9xRpQxCoSw7PEVUk/u0C/d9S/RaqOnSuRARHxQsac
         OPrCp2CFdPjJty/NzViulPoa6Kud85LW5lrZcFDVzGmAqa5bWTMeLVAHEJ9aA7cpsKpl
         oVYt02SqZFEVCbIW87SO2jJrqFC0IKff94Xyj5WdxSXbBVnF4lxBIS50g5yzuybQ3sbY
         VGpA==
X-Forwarded-Encrypted: i=1; AJvYcCUxz9uR4x1nfBYcebsTutw4gg8/HP4nPnQKAdN9bBW9cTe+YsV0xHTggY1DgTuL2dHQXJiBiZiy928=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGqkgWzKmsHfQ0C6XtymdKCAJ7dlV9X1tdY2Lbfl2yrdLqjtS
	R6k3WfVmMIl/vp+UrzLZA+YB5Q1Ujwp3JFqZD7WTxzdVLPnVyn/DdV91
X-Gm-Gg: ASbGncv0PVr7z55j4u4RpIGQs8z2+MR0G08bAHQXDlmqb7Z0C6jK4ckn/yn9RuU63cN
	uzTUGL7VOd063z8w/GDW574NsK2qBBrF9Rqomohmdj0z2zQC2LG152WE4e9ZH8vuwMZjaOrroU6
	M2CcROlgh/00G7ik63XEYbZMHNO+arh5rEKSq2nZxwXmrIZGixiPiSOSweXoDxYveJ1/u/wQMel
	D66Aj8n/ml6gDluGGwKbZGtgtNYRk2u4Bv/KHvZEdeWOnzq88diChflR8plfz7PNLPeEtYtgD/b
	15GLhqg4eRIxe2RgScLOKueHMIco0vrDymSQ+mlQcWmXyw/D/+3IDS32LIJM+BIp3u23vZp8bOm
	Q8Wv67nYqvpNfWO/KpvFqdOolVg5VwhZaM/SJNNs1IqKTDahX76/mZmQDNg==
X-Google-Smtp-Source: AGHT+IGHEzqw59r0e8igL1+CPPVfjvLXVyO+/F/7yKLyQTtxPDFzXxzv7jI8gfftK+xRhHpq+exTSA==
X-Received: by 2002:a2e:b8c5:0:b0:356:25da:89eb with SMTP id 38308e7fff4ca-35f64fef9cfmr8254611fa.4.1758206888768;
        Thu, 18 Sep 2025 07:48:08 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e07947sm6404731fa.12.2025.09.18.07.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:48:08 -0700 (PDT)
Message-ID: <9f332ea7-4210-42f8-b640-3135cdd808be@gmail.com>
Date: Thu, 18 Sep 2025 16:48:05 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] kasan: apply write-only mode in kasan kunit
 testcases
To: Yeoreum Yun <yeoreum.yun@arm.com>, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 akpm@linux-foundation.org, scott@os.amperecomputing.com,
 jhubbard@nvidia.com, pankaj.gupta@amd.com, leitao@debian.org,
 kaleshsingh@google.com, maz@kernel.org, broonie@kernel.org,
 oliver.upton@linux.dev, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
 yang@os.amperecomputing.com
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
References: <20250916222755.466009-1-yeoreum.yun@arm.com>
 <20250916222755.466009-3-yeoreum.yun@arm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250916222755.466009-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/17/25 12:27 AM, Yeoreum Yun wrote:
> When KASAN is configured in write-only mode,
> fetch/load operations do not trigger tag check faults.
> 
> As a result, the outcome of some test cases may differ
> compared to when KASAN is configured without write-only mode.
> 
> Therefore, by modifying pre-exist testcases
> check the write only makes tag check fault (TCF) where
> writing is perform in "allocated memory" but tag is invalid
> (i.e) redzone write in atomic_set() testcases.
> Otherwise check the invalid fetch/read doesn't generate TCF.
> 
> Also, skip some testcases affected by initial value
> (i.e) atomic_cmpxchg() testcase maybe successd if
> it passes valid atomic_t address and invalid oldaval address.
> In this case, if invalid atomic_t doesn't have the same oldval,
> it won't trigger write operation so the test will pass.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>

