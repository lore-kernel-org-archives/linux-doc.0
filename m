Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872E61A6820
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792242259; cv=none; b=E9wXv/XVNB+yQUFVJYZqX4ql2YY+ZprpTCWcWxI/FNtf//+QTXTP840kQRKxisV37JNkTl7EM+qrhqr6+ItztW9+JLL1TwvboEv3rbGtgAF0w+ZM3YsqDGlXWxmYokFAXW1405O9E4ZzLT5+uixV4IyUcYhY/7z7Sbz3qWlDII4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792242259; c=relaxed/simple;
	bh=WrcOTP7zX3vrijgMSAn0zL86bS4KTWLR6Wc/uJXajYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+iGiId9TPmbJsuOQdFirc3R5u9gaYwjliMUdTPgjvqanau8hT+mK2GwWor+kt6OaTXBrGuzhTpIN+jezQ6FvHtFbzoCOKIVIztFIm8Tzn9ZQAwIntZjhCPUpYVpSAvJLuyv8+H3vDrGe8hAiDoiJOt65hWQ+xHJGYFFBJ7t7yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAmTndNctNqJLpIAA--.37741S2;
	Sat, 17 Oct 2026 21:04:13 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBHQP9JctNqC1oQAA--.38634S2;
	Sat, 17 Oct 2026 21:04:12 +0800 (CST)
Message-ID: <cb697787-9479-4ddf-a8a0-fa33cb06fb32@hust.edu.cn>
Date: Sat, 17 Oct 2026 21:04:09 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] docs/zh_CN: add fault-injection Chinese translations
To: "wpeterYY@outlook.com" <wpeterYY@outlook.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Cc: "alexs@kernel.org" <alexs@kernel.org>,
 "si.yanteng@linux.dev" <si.yanteng@linux.dev>
References: <SI2PPFCA6543649B0752EFCF53C275A02E9DD9A2@SI2PPFCA6543649.apcprd04.prod.outlook.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <SI2PPFCA6543649B0752EFCF53C275A02E9DD9A2@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IQEQrMAmTndNctNqJLpIAA--.37741S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrtr1UZFW7ZFWrGr4UKw4rKrg_yoWDJrg_Wa
	4vgFZ8AayvyF47Ja12kr13Xr1I9w1rGr1UAr1xJrZ2g34a93yku397XrZ7XF18Gr4I9Fn0
	gw4vgwn3Jr17ujkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb9kYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r1Y6r
	17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xv
	s2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxVW8Jr
	0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE-syl42xK82IYc2Ij64vIr4
	1l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU0X_-JUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/17/26 8:41 PM, wpeterYY@outlook.com wrote:
> The fault-injection documentation has been on the TODO list of the
> Chinese documentation index for a long time. This series translates
> the whole fault-injection directory into Chinese:
>
> - fault-injection/index.rst
> - fault-injection/fault-injection.rst
> - fault-injection/notifier-error-inject.rst
> - fault-injection/nvme-fault-injection.rst
> - fault-injection/provoke-crashes.rst
>
> The first patch also references the new index in the top-level
> Chinese index and drops the corresponding TODO list entry.


It seems your patchset has a fatal issue: all the following patches 
replies the cover letter patch, please double check with your patch 
submission operation.

Dongliang Mu


>
> All translations follow the Chinese translation specification in
> Documentation/translations/zh_CN/how-to.rst, and the command lines
> and outputs in the examples are kept verbatim.

