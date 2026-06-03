Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB86238C2A;
	Wed,  3 Jun 2026 01:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449219; cv=none; b=WcL8a5sXJNDVftsY4hjK+iqxtLkq/5I+G9cjP6xyGIVahQG6MrkpZO/F+J+Tx9ik9F/GaVMzixpvCcyoY6nzJfYppOzUnBLd/0vt/5mNmlVW36SJijnL7bfHqjltnmAhVsra3PsaArZKXVV1BVqQ9Y7bN7wPW23zH2TqULydQBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449219; c=relaxed/simple;
	bh=p3/3AvGX2rBu1tPxzqAAPnk/vvADQ3tKuTbJ0QuFbig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBrs4YmyCPFhGfnLL4Li36zvu7yM8Fjz+i5s47PB+aUQ0G7djq1gypZbHlmklHRMWny92xdQbMSFsaO+qv2vuIpRIs46hO+GDBcSD6dN1cqvM0wQY986VtR4tgs0Uymwi1Kmxf7t+J3k0mjExW/y8i653ygefg978nI1LVPJE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gVV7N1WnjzKHMdp;
	Wed,  3 Jun 2026 09:13:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 4D32840577;
	Wed,  3 Jun 2026 09:13:29 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP1 (Coremail) with SMTP id cCh0CgAndzy0fx9q9xuvAQ--.52112S3;
	Wed, 03 Jun 2026 09:13:26 +0800 (CST)
Message-ID: <77b7ee79-65e5-0c81-664c-2b6777f583ff@huaweicloud.com>
Date: Wed, 3 Jun 2026 09:13:24 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
Content-Language: en-US
To: Will Deacon <will@kernel.org>
Cc: vladimir.murzin@arm.com, xuwei5@huawei.com, wangyushan12@huawei.com,
 yangyicong@hisilicon.com, maz@kernel.org, yeoreum.yun@arm.com,
 miko.lenczewski@arm.com, james.clark@linaro.org, corbet@lwn.net,
 skhan@linuxfoundation.org, kuninori.morimoto.gx@renesas.com,
 lucaswei@google.com, catalin.marinas@arm.com, broonie@kernel.org,
 lpieralisi@kernel.org, thuth@redhat.com, kevin.brodsky@arm.com,
 tongtiangen@huawei.com, oupton@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, Sascha.Bischoff@arm.com,
 linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, zengheng4@huawei.com
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
 <20260601112000.1145391-3-zengheng@huaweicloud.com>
 <ah78iIqAqzfofnIG@willie-the-truck>
From: Zeng Heng <zengheng@huaweicloud.com>
In-Reply-To: <ah78iIqAqzfofnIG@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:cCh0CgAndzy0fx9q9xuvAQ--.52112S3
X-Coremail-Antispam: 1UD129KBjvJXoW7JF18Xw1xZF45uFy7JFy5urg_yoW8Jr18pr
	4UAr1UJF4v9r1a934kZ3Z8X3ZYkFZ8Kr4Fka4qg3WSyws0qFy3AF10gw4jgan29rykW3y0
	vFn09F15Ja1jy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUIF4iUUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/

Hi Will,

On 2026/6/2 23:53, Will Deacon wrote:
> On Mon, Jun 01, 2026 at 07:20:00PM +0800, Zeng Heng wrote:
>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>> index b0db946568b7..02e0ee5c948c 100644
>> --- a/arch/arm64/kernel/cpu_errata.c
>> +++ b/arch/arm64/kernel/cpu_errata.c
>> @@ -608,6 +608,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
>>   };
>>   #endif
>>
>> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>> +static const struct midr_range cnp_erratum_cpus[] = {
>> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
>> +	{},
>> +};
>> +#endif
> Sashiko [1] points out that this means that
> CONFIG_HISILICON_ERRATUM_162100125 now affects NVIDIA parts and
> vice-versa for CONFIG_NVIDIA_CARMEL_CNP_ERRATUM.
>
> The easiest fix is probably to guard the entries in the array above with
> their respective config options? Otherwise, this all looks good to me.
>
> Will
>
> [1] https://sashiko.dev/#/patchset/20260601112000.1145391-1-zengheng@huaweicloud.com

Yes, that makes sense to me. Thanks for the reminder.

I'll apply the changes in v4.


Best regards,
Zeng Heng

