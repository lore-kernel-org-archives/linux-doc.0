Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5B025B0A3;
	Mon, 10 Aug 2026 05:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786340071; cv=none; b=j5g+bG444ZJcFWI83hXrJFYLJY3bZOgD5SjB/7Fk+2SnLc6SqcWQ9YqxK/HAcig/n3fM1HWm7b3IVkQJ3fPjrAG6w1vfMm8GSPPb4Ryw1VdDgWve9PWh1vbIjcR/JpaPkCia5l+cMGAgVbXNc17xOm+uXMTOnWwHNPaJzE3M3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786340071; c=relaxed/simple;
	bh=Oh7Aw4ihyWWhFGMeF8pKi+kZqY3CVLMKhRqAoywjbB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DheORwKpCzMHBUk1zbfn4ePtQWmJmkQf9BCKBOukthMbo0zko7JpPWJCJfWWFDd9Su8L0miKNTjnHZfnKkQq802vEDQHSMiSnyLU+FirgSu6x8SbdgvO8FswLkB+P3Z7CT8/0N4AedNXxqZLLEbVHpXqQPzyAe1spJcA4pfzoCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrACXn7PaYnlqKU2kAA--.21407S2;
	Mon, 10 Aug 2026 13:34:18 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAXks7XYnlqap0iAQ--.41849S2;
	Mon, 10 Aug 2026 13:34:16 +0800 (CST)
Message-ID: <f47c9427-10ac-4838-86ee-b377263b065e@hust.edu.cn>
Date: Mon, 10 Aug 2026 13:34:15 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] docs/zh_CN: Add Chinese translations for five
 networking documents
To: Siwei Chen <businiaoanka@anka1.top>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 Siwei Chen <anka@stu.cdut.edu.cn>
Cc: wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727073538.56951-1-anka@stu.cdut.edu.cn>
 <E0A8AEC487870DFA+12952253.O9o76ZdvQC@anka-20eya00ycd>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <E0A8AEC487870DFA+12952253.O9o76ZdvQC@anka-20eya00ycd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrACXn7PaYnlqKU2kAA--.21407S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry7uw47Xry8Xw15Jw13Arb_yoWfKFc_u3
	y5uFW7AF1UXr4qkw10k3W3Arnxtr18GFW5tFy0yFWfC3sxX3ySvF9rW390vwn8GrWxZrZx
	A3W8Xas3ZwnrXjkaLaAFLSUrUUUUeb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPAYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/10/26 9:15 AM, Siwei Chen wrote:
> 在 2026年7月27日星期一 中国标准时间 15:35:31，Siwei Chen 写道：
>> From: Siwei Chen <businiaoanka@anka1.top>
>>
>> This series adds Simplified Chinese translations for five documents
>> under Documentation/networking/:
>>
>>    - team.rst: Team devices driven from userspace via libteam
>>    - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
>>    - driver.rst: Softnet driver issues (probing, close/stop,
>>      transmit path guidelines, and extack error reporting)
>>    - ipv6.rst: ipv6 module parameters (disable, autoconf,
>>      disable_ipv6)
>>    - secid.rst: LSM/SELinux secid usage in the flowi structure


I will post my review today or tomorrow.

Dongliang Mu


>>
>> Changes in v2:
>>    - Add translated documents to corresponding index file.
>>    - Link to v1:
>> https://lore.kernel.org/linux-doc/54B9FF7CF7DE776B+6294277.lOV4Wx5bFT@anka-> 20eya00ycd/T/#t
>>
> Ping
>
>

