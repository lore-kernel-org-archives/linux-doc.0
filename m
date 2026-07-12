Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.175.55.52])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CFD322A;
	Sun, 12 Jul 2026 04:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.175.55.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783831705; cv=none; b=XN9Y9Fhg5f1v+IYPSlKdniinI9FweUzYYXNuSU43FeYckAi2438nX13TN1ryhTNOwzjVbmgRIsH0fY5FviMIE1QJB7x93RyZHw+ELUBGz3R4abTdkgR8EeZQ2JCtTjIoDZT6rQQjSRLVUQNRvQu9GS+9HY9aMXQ45YDrZD6r61U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783831705; c=relaxed/simple;
	bh=ZNLHHHO3BzecojunocHGXGHYxt8A6X/rrUaFJ7NT/TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWvUfoEi33tyJ1qvTBFoa5bgi0gNcOlGdbCPUYtcNoQTVTkjEFFORMI3cFiLFc6fn9c/F05GL6YDZSNrMu2WXFxLOqsNDs6PfAbNRnwMq0ACmbjSpe2Wh93PEjPj7w0V+Q4NvuTKBD+QE5cENPrNsK6cSApbAEcRBl25z/4nT/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.175.55.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAA3DjVbHFNqWBFlAA--.6772S2;
	Sun, 12 Jul 2026 12:47:23 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wD3_+tYHFNqkMK9AA--.12741S2;
	Sun, 12 Jul 2026 12:47:22 +0800 (CST)
Message-ID: <91ea31b9-4154-4769-a620-43fea87cb949@hust.edu.cn>
Date: Sun, 12 Jul 2026 12:47:16 +0800
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
 <f637a819-5596-4cd7-b2fe-be7293eedf14@hust.edu.cn>
 <alD6UJw1Y2VNK3x1@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <alD6UJw1Y2VNK3x1@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAA3DjVbHFNqWBFlAA--.6772S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4kGF45KFy7Cw4kXF1fWFg_yoW8tFWxpF
	45JFyqyrs5Jr43tF48tw4fXF15K345GF4UJFn8Xay8Cws0gF1vgF4ft3yF9Fy7Zw4UGr1j
	va1j9asru3W5ZaDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPEb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxUvO6JUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/10/26 9:57 PM, Weijie Yuan wrote:
> On Fri, Jul 10, 2026 at 09:44:45PM +0800, Dongliang Mu wrote:
>>>>> --- >8 ---
>>>> Is this a special mark for LKML? If I understand correctly, the following
>>>> should be the patch content.
>>> Yes, the following is the commit message body.
>>>
>>> You can apply this patch by "git am -c" or "git am --scissors", which
>>> means: Remove everything in body before a scissors line (see git-mailinfo[1]).
>>>
>>> https://git-scm.com/docs/git-am#Documentation/git-am.txt---scissors
>>>
>>> Git community sometimes use it, for the cases if you want to swap the
>>> actual commit message and the supplementary information.
>> Understood.
> Sorry for any confusion.
>
>>>> This would make the envionment preparation more difficult. My suggestion is
>>>> to ask maintainers of some mirror sites to sync this repo like us.
>>>>
>>>> Dongliang Mu
>>> Makes sense. Could I kindly ask, for example, Tsinghua tuna team to
>>> mirror our repo, on behalf of our Chinese document team? I'm afraid they
>>> are unlikely to consider my request in my individual capacity. ;-)
>> I can help contact TUNA maintainers.
>>
>> Dongliang Mu
> That would be great! Apparently your words carry more weight than mine
> ;-) So do you mean that I just need to wait quietly for your good news?
Hi Weijie,
Could you please try cloning 
https://mirror.nju.edu.cn/git/kernel-doc-zh.git/ 
<https://link.wtturl.cn/?target=https%3A%2F%2Fmirror.nju.edu.cn%2Fgit%2Fkernel-doc-zh.git%2F&scene=im&aid=582478&lang=zh> 
and verify whether this mirror is stable?
TUNA has limited storage capacity and has asked the NJU mirror site to 
host this Git repository.
We are currently diagnosing network issues on our mirror site. The 
classic architecture — Nginx (serving static frontend, HTTPS, and 
caching) → Apache (reverse proxy + CGI execution) → cgit / 
git-http-backend — appears to be functional in principle.
The clone failures with large Git repositories are likely caused by 
insufficient or inappropriate parameter configurations rather than the 
architecture itself.
P.S., I am the mentor of HUST OpenAtom Club, and our club is maintaining 
the hust mirror site.
Dongliang Mu
>
> Appreciate it!
>
> Thanks,
> Weijie

