Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855995;
	b=qBv+FdmJ3ceERUThzsmAj5IJtPtLpqohLXMhmCsU1qfjdx4DFuJt3Fd5O9xikx5ivc3u
	 ECzZwZS9yL4EivRV48c3I60FhCGp0ZKYtL3mMFzO0USTQsyP3PMqwkpe3rLbzSq54UloI
	 I6tpJFm8Y4GkSbZ/2D6hPtPXEdCCRiRa5UoURaofvt3r3Z9k7h970Y1GClEcWzpyYTkPW
	 lnNiWsjiL4j+k9FGPwgAHBs0T0Tgh9DZSr8b0mfXbC5k3ZagwJjYjbwH+mQBxp6zdstku
	 Ku54xpY5dQxtoMfW/hjr/Y5xBupt4gjJH4DGsdqb2Rtt4FJXgfu2Ds++rkk1kzMOXiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855995;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=oN0PycvjY8g6vJ2m8JWBzwLv01on3NPAsKCTSYG9D1Y=;
	b=3wjtY8ai/9CUFHdhtEfm6Xd/mRxmzR9le2e5Hfnzmlnd4NlXSYQLiMwiWfRXuA6MRtXM
	 wUSLDIHyDr9HY5sNvBTFguvDCvNjIoMpASBbsSljzF7bGUiYZLG9qOA7EsQ2zV4ZyBS2L
	 ZlPazfIbMba9Q8f/lEySTDDHHzf+yifdjg/RRDhv1IDgXUQqdlf3qCADYzZYhqV1U9u8Q
	 czW212npF3PbH04eBfJG9TMf18cCGqfRi6oSekw9dQuN3FVV+xRn9+fFSIbFNPUHOWmJK
	 nQwKfWRTfnT0RZnzVGyAcyaaklh9QtER6FjHykvJWbunMAdNa+K+DyduQ6J0Ihx1EWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A639606A31C
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 08:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A639606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMAGT9B4lgprEfUhAA--.16870S2;
	Sat, 28 Nov 2026 16:53:12 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wBH0jx3lgpr0GJ_AA--.18571S2;
	Sat, 28 Nov 2026 16:53:11 +0800 (CST)
Message-ID: <7ba1f62a-5d1d-4474-a6cb-6816e70ff7ab@hust.edu.cn>
Date: Sat, 28 Nov 2026 16:53:11 +0800
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
Subject: Re: [PATCH v2 0/4] docs/zh_CN: Add four process translations
To: Yikun Wei <YikunWei@126.com>, Weijie Yuan <wy@wyuan.org>
Cc: alexs@kernel.org, si.yanteng@linux.dev, linux-doc@vger.kernel.org
References: <20261117115527.27937-1-YikunWei@126.com>
 <avxh6NCMrsJI3f_x@wyuan.org> <363BC4B1-D712-4EAE-96A3-6F4A15BE6377@126.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <363BC4B1-D712-4EAE-96A3-6F4A15BE6377@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IAEQrMAGT9B4lgprEfUhAA--.16870S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWruF48Jw15Jw45try3urW7Jwb_yoWfArc_Za
	ykWrWjyw47JrZxGanYkr43AF45A39YqryDJrW0yasrG3y8ArWDZr4kWws8Ars5JF4FyFy5
	KFZ3G34UXw17WjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbBkYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK6svPMxAIw28IcxkI7VAKI4
	8JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
	07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	CVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfpndUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

* Yikun Wei 2026-11-17

   [PATCH v2 0/4] docs/zh_CN: Add four process translations
   [PATCH v2 1/4] docs/zh_CN: Add contribution maturity model translation
   [PATCH v2 2/4] docs/zh_CN: Add deprecated translation
   [PATCH v2 3/4] docs/zh_CN: Add backporting translation
   [PATCH v2 4/4] docs/zh_CN: Add botching-up-ioctls translation

   Waiting for response.
   cf.<avxh6NCMrsJI3f_x@wyuan.org>
   cf.<avx-ZOPV3q1VmSvm@wyuan.org>
   source:<20261117115527.27937-1-YikunWei@126.com>


 From the cooking email, it shows "waiting for response", therefore I do 
not comment.

When you receive this comment, please first resolve or reply in the 
thread and resend a v2 patch.

Dongliang Mu


On 11/28/26 4:09 PM, Yikun Wei wrote:
> Hi all,
>
> Gentle ping on this patch. It has been a week since the first
> review comment from Weijie Yuan. Happy to address any further
> feedback.
>
> Thanks,
> Yikun Wei

