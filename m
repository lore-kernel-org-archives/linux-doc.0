Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE681E8331
	for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981373; cv=none; b=iEcBPAm9wYNGhW7KixAj8xn+X4mIjh3jTpKsK3w1dfPUH2g3EWh8lC4WEezxJwJGBkYcKuxIxwrzssN4pv+svm405ztwCyT1Vb3rLcuEgmPsTqCN5o3eE3Ne57cP5BKfDQoGbO1pCzRH/+jX73TxNpLOV+NMw/b8lRAL5ty6B80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981373; c=relaxed/simple;
	bh=/lekqJfKGMjw1dQxyTeqadS7uFPIGjGMoohx7NzndQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiMgEC8DuzCJDzcyX7c259HoeAXC4ryFdSeWgnvjo8l3kTwn44RIbLnY53Gueb1B+7jtl0RauOODNMZuHiVFPDRlH5nn5bgm1szlcJl+cgfzqWMP55w15M/OuDYVhR7FRKcfgsdOcWvlJf4fhpMjbrcEN6jlZxmaIrfenBLGR00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7YeYMf5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7YeYMf5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so4605670f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 08:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739981370; x=1740586170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EdBoFnuhqMD4bPK9q59QOYbccPf40KzMHKr/84iucLw=;
        b=u7YeYMf5dRram62SnlWh22KgU4LPjiB652elxEey2Q5REk8J2or/uo1C59oo64U4xR
         LmOp1sK/GmiMiifQFVO/Jk7UEZiEz6mpbSW4X7bxez3sLLW5n4P2DPUX1RLeWId8Kfm0
         8yuJVlHtV8MqU3THAwyNqumlIV2lqGRR2DOiIZKkoTi0Bia1gFt9nbhrFInaNpZwMEzq
         oSeuBCWfEjc/eDsOd37yHgcRQ6VBKf21sR2a9YSeT5ZE9GFTQNvkVd9bidGyNCwyr6aF
         rrwADKmcdlb5wcrenyH6j/JXFlT1Cfhia7LGCL11Zm3AIZBQGHh44RI5JiqIiTRfzG9M
         R4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981370; x=1740586170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdBoFnuhqMD4bPK9q59QOYbccPf40KzMHKr/84iucLw=;
        b=pr6frSABHp10v2setAsN4RVKcp+BdrujBTTfPTN3GiGTLDCDtyJf89eovELe6Nm0+F
         xS4qeBxk06/taJZ6GR5ARUgJtuCGw4sZBIAZYbMEexY2/Dy7xTbcbzqKaoagzPgaMkaO
         VUhkvZzZUp96QDzXVakbEbtNeD29p5G5qqjFJn5QdiUc/tqGK1DfkQSvuuSOhEdJfZ5E
         bk3wf2GVJ5D4jqj+P0YREOFnckuIgdEgkJNXFzy+Ag8xIBMTGrxOWmbVk3g0hihm87q2
         I1lEvz3iAWJLt5JKbzY47gNz0/0slaycEJZOgt/RmY3vKbsySkYfno6ZLkn+69KBtZMi
         aYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCYtyft7+ZVcAGo4WTz4DBgiv/miOWd3RtvCtfRzexdCpcfdBfSolDVIiZhrjF6KgNJb+HPUki9+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjzvip//+P1LvOiu4fXGF72yy9mYgq0Rth9FpmRaFRRsJd1eoC
	oGAJYfIllbBSH35sWMkog7MRfGH0A30uVXccfb/VeYhSDc1SSpZ5vCAVwQebHC4=
X-Gm-Gg: ASbGncuQQCtbqP3QvtBUf4zKQ5kV41PP3wEK/3L1J5Y/1oA+Az9YckD3B7a+fboG/80
	Xig3P17NgBZplTJI77RGlYNAWogEPnDntuvj2/QT07bbkDNigLwyUiExd8M5a5voQhpYBNWaT75
	Ewtak/ZozXLGVDz3fbFSObNtX9oFmhrhdKIKiArNUSsHKyW+nqQQIpBZ4AriQYISfTS7QEFigK2
	4ppz4Y/XGCro43L92LhNOJZ0AlR11zG4xse+v2Ag3NR5ozy2BdwWtQySdVGqVxHHjxW3vlNxhzY
	5l29TARo7nfl8jr6+Omml0meaw==
X-Google-Smtp-Source: AGHT+IG87mSbuSo594YlU8iwWTPKAQqVV2chSBKXzyuZ7LJ3HKDzFEKHoFoqCd1APAlb8lVP4Vl8fQ==
X-Received: by 2002:a5d:64a3:0:b0:38f:50bd:ad11 with SMTP id ffacd0b85a97d-38f50bdadd5mr6657402f8f.5.1739981370330;
        Wed, 19 Feb 2025 08:09:30 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f561bee3esm3617686f8f.21.2025.02.19.08.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 08:09:29 -0800 (PST)
Message-ID: <f8f5b7bc-0219-4891-9ffd-f54102b90b45@linaro.org>
Date: Wed, 19 Feb 2025 16:09:28 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 00/11] arm64/perf: Enable branch stack sampling
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/02/2025 8:39 pm, Rob Herring (Arm) wrote:
> This series enables perf branch stack sampling support on arm64 via a
> v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details
> on BRBE can be found in the Arm ARM[1] chapter D18.
> 
> I've picked up this series from Anshuman. v19 and v20 versions have been
> reworked quite a bit by Mark and myself. The bulk of those changes are
> in patch 11.
> 
> Patches 1-7 are new clean-ups/prep which stand on their own. They
> were previously posted here[2]. Please pick them up if there's no issues
> with them.
> 
> Patches 8-11 add BRBE support with the actual support in patch 11.
> 
> A git branch is here[3].
> 
> [1] https://developer.arm.com/documentation/ddi0487/latest/
> [2] https://lore.kernel.org/all/20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org/
> [3] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/brbe-v20
> 
> v20:
>   - Added back some of the arm64 specific exception types. The x86 IRQ
>     branches also include other exceptions like page faults. On arm64, we
>     can distinguish the exception types, so we do. Also, to better
>     align with x86, we convert 'call' branches which are user to kernel
>     to 'syscall'.
>   - Only enable exceptions and exception returns if recording kernel
>     branches (matching x86)
>   - Drop requiring event and branch privileges to match
>   - Add "branches" caps sysfs attribute like x86
>   - Reword comment about FZP and MDCR_EL2.HPMN interaction
>   - Rework BRBE invalidation to avoid invalidating in interrupt handler
>     when no handled events capture the branch stack (i.e. when there are
>     multiple users).
>   - Also clear BRBCR_ELx bits in brbe_disable(). This is for KVM nVHE
>     checks if BRBE is enabled.
>   - Document that MDCR_EL3.SBRBE can be 0b01 also
> 

Tested-by: James Clark <james.clark@linaro.org>

