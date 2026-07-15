Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB5D26FD97
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784080004; cv=none; b=WAVGrO9cmM8ERhIlCnnpW4C0hl17xS4V6ClzSzOeebicZzIbo0iE33ir9KcP99SzqJOdSVrKWssXheQ6Z54Pi55gODi0pFVBh0eYunMDjIIN/chB8Grmd0RwoQbwdoUsi+Lp4T4YsfayEytntqIn6q13sOanDJjYT+wUaqps1rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784080004; c=relaxed/simple;
	bh=vCSrvrkYwx28hq+AFT33m/jxT655qwkbgRv/3T9/2Ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i82rZKismB+Y/fdhmDmf0NRiKCPTW5zs6LOCCw1pH1MXxAAHRK2zAsnJIy1tEjkEFkx81rm7+dO3MJBDhX+6QQ3OnVzKrrgbb1Cbj3tdcE4r5C1a1mXClbLXljNIO8xMdYpXPFPRIcOs+8Y2ecY+4CsQACPibDjj1Ufvep3lGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrABnSQ505lZqn2lrAA--.65524S2;
	Wed, 15 Jul 2026 09:46:28 +0800 (CST)
Received: from [192.168.1.31] (unknown [183.94.132.115])
	by gateway (Coremail) with SMTP id _____wCHj8dy5lZqLXqLAA--.57379S2;
	Wed, 15 Jul 2026 09:46:27 +0800 (CST)
Message-ID: <d9e57996-f71a-4cda-b1c4-ac375429c180@hust.edu.cn>
Date: Wed, 15 Jul 2026 09:46:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
To: Weijie Yuan <wy@wyuan.org>, Doehyun Baek <doehyunbaek@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Ben Guo <ben.guo@openatom.club>,
 Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
 Jiandong Qiu <qiujiandong1998@gmail.com>,
 chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
 Haoyang Liu <tttturtleruss@gmail.com>
References: <alZK0i0HvxOvSKwj@wyuan.org> <alZP_6nAXNy_HfZi@wyuan.org>
 <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com>
 <alZ1AzLX8LrB-JFK@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <alZ1AzLX8LrB-JFK@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrABnSQ505lZqn2lrAA--.65524S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWDGw4xWw18WF17AFyDAwb_yoW8Ww4rpF
	ZxKayFka1rGrs3Aa1xtayrGF1Yqw1FkFZxX3W5X3WUA3Waqr1xtr18Krya9r98Arn5G39I
	vrW5A34DGa45ZFDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVk9NDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/15/26 1:42 AM, Weijie Yuan wrote:
> On Tue, Jul 14, 2026 at 07:05:28PM +0200, Doehyun Baek wrote:
>> I "cooked" up a small website this evening that attempts to automate them:
>>
>> https://doehyunbaek.github.io/cook-linux-zhcn/
>>
>> Every hour, a GitHub Actions workflow scans recent `docs/zh_CN` patches on
>> the linux-doc mailing list, groups rerolls, and compares their subjects
>> with Alex´s `docs-next` tree to determine whether they have been applied.
>> Pending series with no update for more than 30 days are classified as
>> "Cold."
>>
>> This is still an experimental prototype, and its heuristics may have bugs,
>> particularly when threads or patch subjects change. The source is available
>> here:
>>
>> https://github.com/doehyunbaek/cook-linux-zhcn
>>
>> Issues, suggestions, and pull requests are welcome!
> Hi Doehyun,
>
> Wow, at first glance, it seemed quite good, as a prototype.
>
> I feel like your UI is kind of similar to sashiko? I'm fine with it.
>
> I guess this might be the thing that Dongliang had in mind. Let's
> wait for the comments from those in the UTC+8 time zone after they
> wake up ;-)
Yes, really awesome.
>
> Btw, for example, my patch (Weijie Yuan · docs/zh_CN: add docs-next
> checkout workaround) is actually directly discarded after we reached
> a consensus during our communication (with Dongliang). But it's
> obvious that we didn't say it explicitly. So your website can't
> recognize it automaticly right now. Perhaps we can think about how
> to deal with this situation later.

We can set a terminal instruction like "Applied, thanks" to automate the 
end of patches.

Dongliang Mu

>
> Thanks for your effort,
> Weijie
>

