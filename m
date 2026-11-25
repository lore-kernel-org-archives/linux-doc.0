Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573986;
	b=CsoNYkib0ierW+bmG5RZ8kVU7VZXYx7l3ZvLlSQxXmvO0O7QECCcCfmiQkYoRplrwzrH
	 8v24MEdPusL5VZyX3NiW/57ldbUJsgu0MsyaSBoVmcEqAKFPEp8+dcq+MmUqwTOZs/Qo8
	 UdSODKOM9xjghI6GKTuzekK99wt0UaMj0uFi+HCd8t7yAAH2QXCm4HogUXFBVgPKBqqMU
	 g+2LfIBZ8hY9le7dzX3Cw1Q4ywRLZCV/9s9b5j5xyiR725QmewzrUtlBF/eJxtSZWUTiE
	 ighRRveICKxf4NBSOopzLCtclzGcwcyNZheXLJyP61z12kXzU7NOtiJuHZtW+6Lx9fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573986;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=3AhUdEcgzKdrlwq2NAL1sur0NHocjLb2EjIt+CPfMxs=;
	b=F+CnI73S7N3Q06CnedjPVGxRmxRu+o9vhjVVVLAFULtS509Vm91olaBej9Hsu9/+A7sW
	 CvFrZrjxoGnslycG+wPuywbFENELsOcQaUEWFFm8T7y+AVxBOtYDXw/V7dlimWUQmrMzV
	 +VPVQLEe0s5DkxHY0w8GzAc97m2kAuu35+b7Nileg+BM447Iw68klxR/2yppbI4kbYFLt
	 C7KiQexIv1/n+W7z4c5Iv9HJnGOOmTDGfUIeDJxu3cxYIPUx+POFcX7rBbqz+PHI6/MMJ
	 Mt5U4VrOWqu9+Y9VZ+zBN34n386L+uE5Z9KjKEtjFB/C4kJyNa/UMxoxNdQYmEfPNrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UBmtl1yx;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC21606A321;
	Wed, 25 Nov 2026 02:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC21606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UBmtl1yx
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3AhUdEcgzKdrlwq2NAL1sur0NHocjLb2EjIt+CPfMxs=;
	b=UBmtl1yxYFymupFZOAEFI4z1Cf9TaUsd/cPKjSgEnYFDpyWAfedRZZgDfYq4VorYrn6yO00rJ
	qzmXQD9NXqqPTu8WZcSTJitpJzw4+04TE0uK59pqhHxanPOj43kmiUqfIGUBXwLOLxicGkB5HWA
	5qvJH8Jmj1uQoJBdP4KfrD8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jZ3bp36ZJz1T4Ky;
	Wed, 25 Nov 2026 10:32:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B53D740561;
	Wed, 25 Nov 2026 10:32:55 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 10:32:54 +0800
Message-ID: <3a8afc1b-ccfe-46d6-b577-fdcf44ff2795@huawei.com>
Date: Wed, 25 Nov 2026 10:32:54 +0800
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
Subject: Re: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI
 path reachable
To: Randy Dunlap <rdunlap@infradead.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <james.morse@arm.com>, <rppt@kernel.org>,
	<arnd@arndb.de>, <kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <bp@alien8.de>,
	<jlayton@kernel.org>, <catalin.marinas@arm.com>, <sean@starlabs.systems>,
	<will@kernel.org>, <jonathan.cameron@oss.qualcomm.com>, <tzungbi@kernel.org>,
	<kas@kernel.org>, <steven.price@arm.com>, <chenhuacai@kernel.org>,
	<tzimmermann@suse.de>, <wenst@chromium.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<vladimir.murzin@arm.com>
References: <20261123033222.1067923-1-ruanjinjie@huawei.com>
 <0cc7d474-adf2-46f8-bd4f-f352696313af@infradead.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0cc7d474-adf2-46f8-bd4f-f352696313af@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi Randy

在 2026/11/23 11:44, Randy Dunlap 写道:
> 
> 
> On 11/22/26 7:32 PM, Jinjie Ruan wrote:
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 176648941aec..9a3ce8ed18f4 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -6958,6 +6958,14 @@ Kernel parameters
>>  			1 -- enable.
>>  			Default value is 1.
>>  
>> +	sdei_nmi.disabled= [ARM64,EARLY]
>> +			Disable SDEI-based cross-CPU NMI and leave the GIC NMI
>> +			path in place. Requires the kernel to be built with
>> +			CONFIG_ARM_SDEI_NMI.
>> +			Format: { "0" | "1" }
>> +			0 -- enable (default).
>> +			1 -- disable.
>> +
> 
> Alphabetical order, please. Entries are a bit messed up in the s* world...
> Please add this one between
> 	scftorture.weight_all_wait= [KNL]
> and
> 	sdw_mclk_divider=[SDW]

That will be more cleaner.

Thanks,
Jinjie

> 
>>  	serialnumber	[BUGS=X86-32]
> 

