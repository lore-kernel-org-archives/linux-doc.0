Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF832C3251;
	Fri, 21 Aug 2026 04:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285752; cv=none; b=B/dCG4OQ2KT2CHSrO8wwZyXpgTpwhr9mo1DVVqmT/DPIJRouhBM2hT2gKDpoket3xPgKzv5HkPkTTVldNG+fIgtKQv2D7Ip4V4X8trlsF/2jWN4GHpEpc3eQiLr8SdlC5JcF1aW7zeoDsO0Fx7d4pUO9kqPLoYqJ0xSOh1Nin3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285752; c=relaxed/simple;
	bh=LO0r4+Il1Wfu2lZIHRaSOjvjyJDWH4XX9th6qikyDWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDevj+hsC7DHI5LsI0UNNcKRUxQUxsOLvSXE6ce0aSLZX7ojM/w6Wug/Df5p0ZMkiYfiXtT0CS30B5bYm9T34//laZ/6ou7NHA5Gt8Y/hbLku2GcgG1UFRKnqfpsoeZcGxlZDVFpaFUxiPsYCGvb8HIfJ9x/MBkeE59XBmb/T4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAAX7qLI0IdqSQOnAw--.13212S2;
	Fri, 21 Aug 2026 12:15:04 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDHpNHB0IdqNLwAAA--.1127S2;
	Fri, 21 Aug 2026 12:14:59 +0800 (CST)
Message-ID: <821f84c5-9344-473d-91e4-998f183f96f3@hust.edu.cn>
Date: Fri, 21 Aug 2026 12:14:57 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] docs/zh_CN: add kernel.org trust repository reference
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
 <20260821-maintainer-pgp-guide-v1-4-08e5e3602c04@wyuan.org>
 <aoc7l-n861pdN71_@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <aoc7l-n861pdN71_@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAX7qLI0IdqSQOnAw--.13212S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr48JF4rAr4UJF15CF4fAFb_yoWkZwb_Za
	1kZa10kr47Jr97KF48Cr1j9r4DAF4xuFyUJFn5ta4UJw4kGFZ8uFn8W3s5JayrZFs09ry5
	GFs8ZrnIgr17ujkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPkYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26F
	4UJVW0owAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUOR6zUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/21/26 1:38 AM, Weijie Yuan wrote:
> On Fri, Aug 21, 2026 at 01:13:23AM +0800, Weijie Yuan wrote:
>> Add the kernel.org trust repository reference to the Chinese
>> translation.
>>
>> Update the translation through commit 54857c52452a
>> ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
>>
>> Signed-off-by: Weijie Yuan <wy@wyuan.org>
>> ---
>>   Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
>> index 12b3e8030364..f6e8ac2d11de 100644
>> --- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
>> +++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
>> @@ -767,6 +767,8 @@ SSH 的信任方法”。使用 SSH，第一次连接到远程系统时，其密
>>   
>>       trust-model tofu+pgp
>>   
>> +.. _kernel_org_trust_repository:
> It should be cn_kernel_org... My bad. Sorry.
No worry, fix it in the next revision.

