Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0E62FE0F;
	Mon, 13 Jul 2026 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783914570; cv=none; b=DYBfaZFTbxk3Aw9EQHpleF02JFqEtBX+M2enkhTyiiyBqnBYQuwQUCKW7zwZFXtcGZQtHeDt87R4Ihhvg7zBpsGMG2JEBOOho90N5gf1HqVb4t83R0Ydo7HAe2lOCjLpIEPkUYvmVp18J84X2qgMKmK/sUI2v92WEtVtwkg42mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783914570; c=relaxed/simple;
	bh=YkQvlUuf7W56N4AAvcVJaggGquGpWiyKFWovdiMPNtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cl3+VGfFYovCVX11xEdwljK74flO3o3VRIQ02je3q+Fpu6jo3nYp5EYD2YfynSA32IqQ6oPbT5Mil4ABzsrS61Q3HlqgrTz/hi5jhT7UBYkRNSRmcuKOf3zM8GoqVpSo1bJyawEaXS6w4qoFzYgz64+Ph659HIfOLmLZJbyGeos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAC3jjU5YFRq9OhmAA--.13966S2;
	Mon, 13 Jul 2026 11:49:13 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wA3MMczYFRqGtmAAA--.23508S2;
	Mon, 13 Jul 2026 11:49:08 +0800 (CST)
Message-ID: <45167b0a-4c60-43a4-9c3d-b8ddcbb8679c@hust.edu.cn>
Date: Mon, 13 Jul 2026 11:49:07 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
 Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <seakeel@gmail.com>, Hu Haowen <2023002089@link.tyut.edu.cn>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org>
 <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
 <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
 <alJ7ocaqtpUkCGrd@wyuan.org> <40155119-b6c1-40cc-bbf2-5d1bbe5743e8@gmail.com>
 <alNBB1Ju2GGk6Uqu@wyuan.org>
 <CAKspUhJE-6NN7XnfG0iJAxEiV9PJx6pDbUEU5jgO__+qvuU5ug@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAKspUhJE-6NN7XnfG0iJAxEiV9PJx6pDbUEU5jgO__+qvuU5ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAC3jjU5YFRq9OhmAA--.13966S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4DZryrWrWxWry3XrWDurg_yoW5Zry3pa
	yrKr1akw4kJFyfAw42k3W8AFn5t397Aw4DJFyDK3s5GrZYqF97tF1xKaya9Fy5urs5Way2
	vay7Kr93Aa1UAaDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
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


On 7/13/26 10:44 AM, 葉宸佑 wrote:
> Hi Weijie,
>
>> I suspect that some contributors would run the get_maintainers.pl script
>> or b4 prep --auto-to-cc, so they did not cc Alex, as they didn't know
>> the current situation. Because I noticed that for both two versions,
>> Chen-yu didn't cc Alex or Dongliang or Yanteng. Am I right, @Chen-yu? ;-)
> Yes, exactly. For both v1 and v2 I ran get_maintainer.pl, which only
> lists Hu Haowen and the mailing lists for zh_TW files, so Alex and the
> zh_CN team were never on cc.
>
>> Given that this document has not been maintained for ~2 years and these
>> patches to the terminology actually don't have much significance, it
>> might be more appropriate to directly declare the status of Traditional
>> Chinese as "Orphan" provisionally for now, and remove it directly in the
>> near future, until Hao Wen's return and opinion. Or maybe, waiting for a
>> new good soul to take over, which is unpredictable.
> Before it comes to that: I would like to step up and help carry zh_TW
> forward. I am a native zh_TW speaker from Taiwan, and I understand
> this means staying with it, not a one-off effort.
>
> Dongliang, since you kindly offered to help review zh_TW patches:
> would you be open to doing this together -- either as co-maintainers,
> or with me listed as a reviewer (R:) first if that is a more
> reasonable starting point for a newcomer?

Chen-Yu,I would like to serve as co-maintainers to help maintain zh_TW. The 
script - tools/docs/checktransupdate.py can seamlessly work on zh_TW. 
This can help track the missing changes. But for the current situation 
of zh_TW, re-translation may be more efficient.

As discussed with Alex before, maybe zh_TW patches can first go to 
Alex's kernel tree and then push to Jon's tree. I am not sure if you are 
familar with the maintainer workflow. If not, this solution may be 
better for you to learn maintainer workflow.

Dongliang Mu

>
>>> To avoid scattering our efforts, I suggest we minimize fragmentation
>>> as much as possible. When it comes to technical documentation
>>> translation, not literary translation, a straightforward, unadorned,
>>> and free from misunderstandings is the best translation and easy to
>>> maintain. Let's keep thing simple, unless sth is really necessary.
> Alex, I think this concern is fair, and I have no intention of
> forking the translation effort. The scope I have in mind is
> deliberately narrow: keep zh_TW aligned with zh_CN in structure and
> coverage, and localize only where terminology genuinely differs
> (e.g. 軟體 vs 软件, 介面 vs 接口) -- exactly the kind of differences
> you mentioned. Plain, accurate technical translation, no literary
> rewriting.
>
> Weijie, as a first concrete step I will prepare a terminology series
> (rather than one-word-at-a-time patches, as you suggested) covering
> the existing process/ documents, and use it to build a small glossary
> that future patches and reviews can follow.
You can send a zh_TW tree-wide patchset to change them.
>
> Jon, if this direction sounds acceptable, I am happy to send a
> MAINTAINERS patch once the details are settled in this thread.
>
> Thanks,
> Chen-Yu

