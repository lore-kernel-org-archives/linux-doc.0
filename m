Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F9132ED30;
	Mon,  5 Jan 2026 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631560; cv=none; b=Tf0yin3ueOCnNVj8CK/6A2e7o2aCUCe9z4kjtXaMcgnuILyGixzJ4IT0QX+C+36XhWh8E/3iVsImXIG4oJaMnT7WeOJk1Zc4iBySEWhPvswTRdOUWQLUApYi9wVKcXzK3h6RR5IWztqH82UJnAMEhbcSzETRG/gifZ8bNVwVI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631560; c=relaxed/simple;
	bh=tQB5oJABSzhsUPf3nRPKGFZEd1OreLPdRjQRSwv90ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BujuBRB3C9dRPY8/pxwhmYneYuFdWnFL8cZvzghZwZldJtHTa1bf7GIqo0kaCHkpZEjVLlKHZbsJO4XAAbAC/QwQtIxNxbvs0wOHs1LpY3xGIpStPEjTS5oVLAXixSOMboDR2twPpTnJTxK4K4+IhlTEZAODXSYgJPCrsvLu8Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C0BD339;
	Mon,  5 Jan 2026 08:45:50 -0800 (PST)
Received: from [10.57.65.127] (unknown [10.57.65.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 722B33F6A8;
	Mon,  5 Jan 2026 08:45:55 -0800 (PST)
Message-ID: <53e92af3-67cb-425a-a9c0-5746ce349247@arm.com>
Date: Mon, 5 Jan 2026 16:45:53 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
To: Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
 <176763112483.1193329.14214589661973805304.b4-ty@arm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <176763112483.1193329.14214589661973805304.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2026 16:39, Suzuki K Poulose wrote:
> 
> On Fri, 28 Nov 2025 11:55:12 +0000, James Clark wrote:
>> Do some cleanups then expand the timestamp format attribute from 1 bit
>> to 4 bits for ETMv4 in Perf mode. The current interval is too high for
>> most use cases, and particularly on the FVP the number of timestamps
>> generated is excessive. This change not only still allows disabling or
>> enabling timestamps, but also allows the interval to be configured.
>>
>> The old bit is kept deprecated and undocumented for now. There are known
>> broken versions of Perf that don't read the format attribute positions
>> from sysfs and instead hard code the timestamp bit. We can leave the old
>> bit in the driver until we need the bit for another feature or enough
>> time has passed that these old Perfs are unlikely to be used.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/13] coresight: Change syncfreq to be a u8
>          (no commit info)
> [02/13] coresight: Repack struct etmv4_drvdata
>          (no commit info)
> [03/13] coresight: Refactor etm4_config_timestamp_event()
>          (no commit info)
> [04/13] coresight: Hide unused ETMv3 format attributes
>          (no commit info)
> [05/13] coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
>          (no commit info)
> [06/13] coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
>          (no commit info)
> [07/13] coresight: Don't reject unrecognized ETMv3 format attributes
>          (no commit info)
> [08/13] coresight: Interpret perf config with ATTR_CFG_GET_FLD()
>          (no commit info)
> [09/13] coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
>          (no commit info)
> [10/13] coresight: Remove misleading definitions
>          (no commit info)
> [11/13] coresight: Prepare to allow setting the timestamp interval
>          (no commit info)
> [12/13] coresight: Extend width of timestamp format attribute
>          (no commit info)
> [13/13] coresight: docs: Document etm4x timestamp interval option
>          (no commit info)

Indeed they were applied, ;-)

https://git.kernel.org/coresight/c/19214ad0a4e3
https://git.kernel.org/coresight/c/6c75940eb76d
https://git.kernel.org/coresight/c/f4d2f5fec06a
https://git.kernel.org/coresight/c/3285c471d0c0
https://git.kernel.org/coresight/c/afed86e6e141
https://git.kernel.org/coresight/c/b945d3677754
https://git.kernel.org/coresight/c/d633fd22e810
https://git.kernel.org/coresight/c/a1d19cd2b1a6
https://git.kernel.org/coresight/c/458db6257149
https://git.kernel.org/coresight/c/20bc2ea23774
https://git.kernel.org/coresight/c/b02450de6ba6
https://git.kernel.org/coresight/c/38f4c4273499
https://git.kernel.org/coresight/c/10d4dbdc8fbc


Suzuki
> 
> Best regards,

