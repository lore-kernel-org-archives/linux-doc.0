Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B63E236A70
	for <linux-doc@vger.kernel.org>; Wed, 21 May 2025 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817693; cv=none; b=KBXRBhaXWrsYHZUoiVHNqI8rJwNNIl3GbT7n1aRUpFJYFiErmpu2nHEyIudy8iHR/ymF4tLrByfHUS4COmsNbYu/3mGDEbmPv2geBTVvvwOj0y/hPqtxZfvWTH5ASWSdXyUFfANhNaOlULkrWtLgl2sXCDdIub8/V7oAaYeeeCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817693; c=relaxed/simple;
	bh=w8uGtywi8FTT/FAgTCq7UeSzJ2Y+7StYHR09dw3aCDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+uitS+XQosgP+GIzkL/jofaxEbthOsmJuac3du2V+0WWhtfRRYOWkcdQeSO+MdHIRWELUh0YoB3LlHhzccHNYwiioh6dmCN41OTTNfnFoK1HpAFVC4wBuIzq7krLiAkpi5TJ7LfSIW5k65NkeewskkZa8j6iKAg1dpat/YWwUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ewsNB14l; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ewsNB14l"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a365a68057so3548419f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 21 May 2025 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747817690; x=1748422490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sbdPpdpIurd9SvA4bpOQHcg2N+24lyWEgW2cl5m4WjA=;
        b=ewsNB14lhBE66V9B5BVxfqogHrGpih0VYL2UXb9/UwKdwOGib6+eojxXeBxPWBcrqt
         Wyxq4yFvlw1PrRVE08nahKyWZMmU1rTqubKifmuad/CY+tLUBg3yky0N0qRjg+cBsSwF
         /xHqzLlcb5NLNF8g6Vm7jTVdWOWmFQSrnfL6Q02bgLbvQC8JgaEg9wYaduRY95IX0RaD
         o2xy7M0VI8j+/tvg0T7czT1IWI9NJAErowyglKfQAPmR26vTIm3vo/Ji+me4s1tItOHy
         Zkzqt9c/abDQBxCy6nfRJfM7KrXzV/mY1jXLzY+OORoxdUcht+zNBbuaoizdVM4LWKWD
         LOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817690; x=1748422490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbdPpdpIurd9SvA4bpOQHcg2N+24lyWEgW2cl5m4WjA=;
        b=BGcb1ZZpOZxB2R8wv5Pf9snmLmEqUxTlL2mlEvSuw/0CKIMqhCzdw+lLpjPjcNN8Tw
         0VFSLGYgHcnYCNLZizH6oFBhzIxDKhQo0gPirXjb+uZkXBisIjBtl/MvoUo1GMKfJ6ay
         Ig3FSw95LwdirHOctKM7mYcF9STGgWMjyZOMVCvM511xe1Gu+Br/HEfKUcu97C+LFDaq
         0386FsR0UkNIuXFGjr5W317ltSQ1O7G1nVdHkRsnMuvJXuEoXuexaC0Mw9IO6UJRexob
         mg9h8qT3iZl4WtLfRboSYmClrzcCvSDdOPB0xsNO8Gr01GgdW6erwLoDVMWf5akBp2mD
         JhZg==
X-Forwarded-Encrypted: i=1; AJvYcCW7DQnaTtw4KrGmGN6pB6PUKYPJ5Gh7HrriAbygfth6HVyZX8oxKME/conZ7vpZKERz070lPiPK8vg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd4DKxGJrj7iajrEcYuHGHMvChh7CsHXOcKesfhOfWd9TNNgLV
	G4c2BREy3+mxfQdxEn+6oaLlugYKYhbm6W5cBo4DiYZgoU1YnXwNF3tQ/nI8SnPMocY=
X-Gm-Gg: ASbGncsk44MafhodANoQ487uZE7IWzLvC7E/7OpoYme//YvdW5A2BP1STWBFVRTU9BR
	qsO+eQynH/mbl6BqSJUG4Yzf2EOsfG69Htw2WYUc6qWHiwks67WW/1bDRJwVburk7ZKEiwxl2IW
	BQZnUO4BQZdTUCqm/K2kq5MjdxEytQflgGJQLvhBpYfWLqkQ0uNymzlQVweNDelGV5P5seafeHm
	2u4C2WZi+m7HT8xi9aVLLv5Ebx+NSgpnwm5jrsq888DGUldj/dDC8bZ5F2hTcZqfxryAr7t6Uqn
	G6UUcpbwYadbjx8XfpV1k1G2rVv1tSrBxeAVgfjOxwr5J6tsb1C0aZhz
X-Google-Smtp-Source: AGHT+IHcXYGtM7XVHHJEdGmOY1yvOZ0EB0s4eDSPvPzqzTL5ClJRA8YIoq/xMdJkfTjyIFVgJ2bfQA==
X-Received: by 2002:a05:6000:18ac:b0:3a3:67c4:580b with SMTP id ffacd0b85a97d-3a367c45acemr12032252f8f.46.1747817690326;
        Wed, 21 May 2025 01:54:50 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a366e08747sm15804239f8f.95.2025.05.21.01.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 01:54:49 -0700 (PDT)
Message-ID: <5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org>
Date: Wed, 21 May 2025 09:54:48 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] perf: arm_spe: Add support for filtering on data
 source
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
 <20250506-james-perf-feat_spe_eft-v1-7-dd480e8e4851@linaro.org>
 <20250520134632.GR412060@e132581.arm.com>
 <443141db-6950-4a15-83be-ad9e9c0e03a0@linaro.org>
 <20250520161003.GT412060@e132581.arm.com>
 <20250520162243.GU412060@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250520162243.GU412060@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/05/2025 5:22 pm, Leo Yan wrote:
> On Tue, May 20, 2025 at 05:10:03PM +0100, Leo Yan wrote:
> 
> [...]
> 
>> If 'PMSFCR_EL1.FDS == 0 and PMSDSFR_EL1 == 0x0' is the init state, as
>> you said, when user passed 0xFFFF,FFFF,FFFF,FFFF for data filter, we
>> cannot distinguish it from the init state, as a result, we will fail
>> to handle this case.
> 
> Correct a typo. The case above, it means "when a user passes 0x0 for
> data source filter ....".
> 
> Sorry for spamming.
> 
> Leo

I'm thinking I'd rather leave it consistent with PMSFCR_EL1.FT and 
automatically enable PMSFCR_EL1.FDS for any non zero data-source filter.

This means we don't need a tool change to set some other flag when a 
filter is provided (even if it's zero) and it's much simpler. It also 
doesn't prevent the possibility of adding the enable flag in the future 
if someone comes out with a need for it, but I don't think it needs to 
be done now. TBH I can't imagine a case where someone would want to 
filter out any samples that have any data source. Surely you'd only be 
looking for a selected set of data sources, or no filtering at all.



