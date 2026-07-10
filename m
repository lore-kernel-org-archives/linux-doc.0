Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0222F23D7C2;
	Fri, 10 Jul 2026 13:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691145; cv=none; b=hwp/o7XeLTbP5jMGG0W8kaqxz/Exy/PjdKUqFCDYOr8ianrXKyqvfVoNNzYhcZ8nca5Bxrw+qseO6OSO7HSOVab7J18sJuOOazREKcCupibQ7CvmaYDgJDld/NF4M+DwBGxpgh3URQOSovSe7v019bD0jhBVU6IxQXxCnQLWXBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691145; c=relaxed/simple;
	bh=nrylM+sMvqtFGfbzOsJ2r4RaFtMLa1+llkkLCgt30Qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iyc7+AwBeXOT4mPzAiD/zYVoeCKdedlIroezof2RMFCyjyhTlpaQyeNBeuniwcD8Y5rUYPYHuhsfOMVs1hgEdMJImKYf0SoJYM2ob/7DztIZcATFyjwlQjUc+ZmhS/YOmMDXJhtHkCYpKXe0g570yrsW0nmojuMK+ujuw1lcF/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrADH7KFP91Bq2o_OAQ--.48388S2;
	Fri, 10 Jul 2026 21:44:47 +0800 (CST)
Received: from [100.81.40.43] (unknown [222.20.126.216])
	by gateway (Coremail) with SMTP id _____wB3fxNN91Bqlzq0AA--.5918S2;
	Fri, 10 Jul 2026 21:44:46 +0800 (CST)
Message-ID: <f637a819-5596-4cd7-b2fe-be7293eedf14@hust.edu.cn>
Date: Fri, 10 Jul 2026 21:44:45 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
 <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
 <alD1b7O6KaIMqWpa@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <alD1b7O6KaIMqWpa@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrADH7KFP91Bq2o_OAQ--.48388S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxWw43GF1rXw15KF4kGF45ZFb_yoW5Zr47pF
	4rKF1xKFn5Jr1fCa1xKw40vFy2ga4rGa47XFn8WwsYyrnxtr95tr4ftrWY9F98Zr10kFWY
	vr42qa4xua45AFJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVk9NDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/10/26 9:36 PM, Weijie Yuan wrote:
> On Fri, Jul 10, 2026 at 09:21:16PM +0800, Dongliang Mu wrote:
>> On 7/9/26 11:25 PM, Weijie Yuan wrote:
>>> Hi all,
>>>
>>> Since cloning Alex Shi's tree from the HUST mirror may be unstable, as
>>> reported in [1]. I think adding one more option for beginners to get
>>> started might be a good idea.
>>>
>>> Thanks,
>>> Weijie
>>>
>>> [1] https://lore.kernel.org/linux-doc/4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1/
>>>
>>> --- >8 ---
>> Is this a special mark for LKML? If I understand correctly, the following
>> should be the patch content.
> Yes, the following is the commit message body.
>
> You can apply this patch by "git am -c" or "git am --scissors", which
> means: Remove everything in body before a scissors line (see git-mailinfo[1]).
>
> https://git-scm.com/docs/git-am#Documentation/git-am.txt---scissors
>
> Git community sometimes use it, for the cases if you want to swap the
> actual commit message and the supplementary information.
Understood.
>
>>> The Chinese documentation guide asks contributors to base their work on
>>> the docs-next branch of Alex Shi's tree. However, cloning that tree from
>>> git.kernel.org or mirrors.hust.edu.cn may fail in some network
>>> environments.
>>>
>>> Document an alternative workflow: clone Linus Torvalds' tree from a
>>> local mirror, add Alex Shi's tree as another remote, fetch docs-next
>>> from it, and then create a local branch that tracks alexs/docs-next.
>>>
>>> Signed-off-by: Weijie Yuan <wy@wyuan.org>
>>> ---
>>>    Documentation/translations/zh_CN/how-to.rst | 10 ++++++++++
>>>    1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
>>> index 9ec2384e1e76..fcfe0a4a8be2 100644
>>> --- a/Documentation/translations/zh_CN/how-to.rst
>>> +++ b/Documentation/translations/zh_CN/how-to.rst
>>> @@ -53,6 +53,16 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
>>>    这是 Alex 开发树的镜像库，每两个小时同步一次上游。如果您了解到更快的 mirror，
>>>    请随时 **添加** 。
>>> +或者::
>>> +
>>> +	git clone https://mirrors.tuna.tsinghua.edu.cn/git/linux.git
>>> +	cd linux
>>> +	git remote add alexs https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/
>>> +	git fetch alexs docs-next:refs/remotes/alexs/docs-next
>>> +	git switch -c docs-next --track alexs/docs-next
>>> +
>>> +这将先用清华源拉取 Linus Torvalds 的开发树，再增量下载中文开发分支中的内容。
>> This would make the envionment preparation more difficult. My suggestion is
>> to ask maintainers of some mirror sites to sync this repo like us.
>>
>> Dongliang Mu
> Makes sense. Could I kindly ask, for example, Tsinghua tuna team to
> mirror our repo, on behalf of our Chinese document team? I'm afraid they
> are unlikely to consider my request in my individual capacity. ;-)

I can help contact TUNA maintainers.

Dongliang Mu

>
> Thanks,
> Weijie

