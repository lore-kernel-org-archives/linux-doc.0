Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D57320FA81
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034937; cv=none; b=fS2RKVR7rUngKg7+VO2Y9TQOcsqGQsC8mxTdFVV6hQQitMN1ezIPyBiYXhJ5fWEW+68mB35lsMNExWJIgU/7bPhhq7d3N6vuG5T/Jp5od9wRgz5IfJXuaqEOjZYFnzQXUfew1kWRAbfsQLl+Ygkd2dfLVEtZy0a83HxQIaGUjr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034937; c=relaxed/simple;
	bh=UDUcWBLdkQJ0PrJglIQuf8xMgeDx13Tg1mFGrcLEd7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlxguTiQLVhDsQVtvHTnI9ZLNOIJVTZJBudxzZT5ANZT1IHF2Qb1LX6zG+xbeQcVKjM5cMNdSoaJLsATGkTnlVRW9iUxiWJPt9qtcgJKX7xDZAdND6waO7iplCv5q9fn5Eykvv3CZ8lHBlielDcfBIUT3h+UvhKGKQWoPAVXdX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAB3TTRBNlZqV0ZqAA--.64483S2;
	Tue, 14 Jul 2026 21:14:41 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAXks4+NlZqMIWIAA--.58678S2;
	Tue, 14 Jul 2026 21:14:39 +0800 (CST)
Message-ID: <53ffbf05-7b2e-4ffa-945d-2a415e843cff@hust.edu.cn>
Date: Tue, 14 Jul 2026 21:14:38 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in zh_CN (Jul 2026)
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <seakeel@gmail.com>
Cc: Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>,
 Yan Zhu <zhuyan2015@qq.com>, Doehyun Baek <doehyunbaek@gmail.com>,
 Jiandong Qiu <qiujiandong1998@gmail.com>
References: <alUXH8qRRjno2eZG@wyuan.org>
 <CAD-N9QVXqYxtsn7YuUtCDWrwwk5+iFAkT2jcs26zbDUfwhAwsQ@mail.gmail.com>
 <alYGtkVxW_0N-VqE@wyuan.org>
 <cc922c1b-49a5-4c3a-855c-af8eb6539f62@hust.edu.cn>
 <b664685e-6785-44ae-8005-443032508096@gmail.com> <alYomSIiGeUtQI1I@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <alYomSIiGeUtQI1I@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HwEQrAB3TTRBNlZqV0ZqAA--.64483S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1DWryfur47Jw1rZrWUJwb_yoW8Xry8pF
	ZxKr15CrWUJF4fCws7G340qF95uwnayrW5J34rWrWDCr45Xr4vg395Gayj93srGw1rG3sF
	qr4UZ3ykJayqyFJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVl4iUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/14/26 8:16 PM, Weijie Yuan wrote:
> I took a look about patchwork, it is basically like a mailing-list
> version issue tracker / pull-request dashboard.
>
> It can manage patch backlog, assign patches, record CI results, and mark
> patches as accepted, rejected, superseded, or under review. and record
> trailers. Well, pretty much like a mini version of Gerrit or SourceHut.
>
> But I think it's a little complicated for our needs, as it offers many
> features that we might not actually need, which involves learning costs
> and maintenance costs.
>
> Just now, while going through patchwork of other lists a bit, I didn't
> seem to find a way to filter out Chinese patches from the linux-doc
> list, if we were to use it.
>
> Dongliang, is the dashboard you want exactly like the one I sent in this
> email, which is read-only? Or perhaps wish there are other functions as
> well. For example, you can mark the patch series you have reviewed.


Actually I just need a list of patches which I need to review, which I 
reviewed before and be resubmitted, and which is applied.


>
> I can't find what IMA is btw.


https://ima.qq.com/

It is closed-source software from Tencent. This software cannot solve 
our problem.

I just put all the related linux-doc patches into the knowledge base, 
and ask in NLP about the activities in the linux-doc mailing list


Dongliang Mu


>
> [1] An exmaple of marking status of a patch in SourceHut
>      https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/70509

