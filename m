Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120974749DE
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317673; cv=none; b=C+f4dItWiWr0OURr7UGNS9VverjBNYYP4sob0E1YFjeEeDRMYXiC334np1MnlOuT9IRqWt/8szB+Nr4UX0Qk2B/04eOyVi9/mxTjkUtqGFdCSNCQYDhgJOylIrG2IeUJiV4thU4ibAQDnZjanOWYQZDw70apTPIuwd5f64Jr1PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317673; c=relaxed/simple;
	bh=KckKfrWYq6noduu7N6WSuzfIp5N2rWPnFyIEjz/0kvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJjtcmkk9st3Asitt1xDB/H7h1FY/ZbViV/Pb/DWzx3j5L9BNPdQkfasrl7tKBcCVAnBK9dt9a4kq63vPhusA6Ul/6cifm8rAO1hRUQgRy3+Fg+xGdWc1yPqDD8sBNRn+vC7a5CqNLgss3ibb6qp82k98mdyJyHYiqlklkHbSzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAB3naJwTYhqSwWrAw--.17382S2;
	Fri, 21 Aug 2026 21:06:56 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDHpNFsTYhqMO0CAA--.3988S2;
	Fri, 21 Aug 2026 21:06:53 +0800 (CST)
Message-ID: <01451650-af87-4362-bda2-3ba17fda386a@hust.edu.cn>
Date: Fri, 21 Aug 2026 21:06:52 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in Chinese docs (Aug 2026, #01)
To: Weijie Yuan <wy@wyuan.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Chen-Yu Yeh <chenyou910331@gmail.com>
References: <aoLkMBQszbzqYowy@wyuan.org> <aoWmQ965W4WxU4yZ@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <aoWmQ965W4WxU4yZ@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HgEQrAB3naJwTYhqSwWrAw--.17382S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWDJw47ZF4DZFyfWFW7Jwb_yoW8Aw1UpF
	4xJwn7KrWrJr4UAw1Ska1I9ayjqr95Cry3Jan8G3y5AF9IqF9Yqr109F4agFnrZw409rWF
	yF18X34Ygas8AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBYb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8x
	CEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0U
	Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr1j6F4UJwAv7VCjz4
	8v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uF
	yUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0dOzDUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/19/26 8:49 PM, Weijie Yuan wrote:
> On Mon, Aug 17, 2026 at 06:36:32PM +0800, Weijie Yuan wrote:
>> Here are the topics waiting to be merged.
>>
>> Sorry for the late update.
>>
>> Last time, a contributor mentioned that he did not want to be copied, so
>> this time I will only send it to the maintainer. Meanwhile, I am looking
>> forward to the emergence of an automated system for our work. ;-)
>>
>>
>> Copies of the source code to Chinese documentation development tree live
>> in here:
>>
>>      git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>>      https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>>      https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs linux.git
>>
>> Mirrors:
>>
>>      https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
>>      https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
> BTW, I just set up a mirror at github.com:
>
>    https://github.com/kernel-zh/linux-zh_CN

That's a good idea. I remember Haowen maintained his tree in the Github.

Maybe CDN is also worth a try.

We will setup a code hosting platform in the HUST. It's not a good idea 
to host git repository in the mirror site.

Dongliang Mu

>
> It uses a relatively bare-bones GitHub Action to sync from kernel.org
> every day (I guess it can do every 2 hours as well, but every day seems
> fine, as I'm afraid that if the frequency is too high, there might be
> problems.)
>
> I don't know much about GitHub Actions, so if you have a better solution
> or thoughts on this, please let me know. Or, I would be very pleased to
> invite you to take over the org account and set it up.
LLM helps here. It does not need any sophisticated technique.
>
> Although I know that people here may not be so fond of GitHub, this is
> what I can do now.
>
> Thanks.

