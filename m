Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA5B18872A
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 01:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784079914; cv=none; b=iHuJsElUmHXR2Jqbx29lR9xYnOx16Z3OVyzogLXZGd+n/fwQNYirMWTTOFt5a4uSDx9zPQa+bG3hqN+R3B32iNKtXDT8nIFOD+4dSBrCvot7B+SJ9WzsG1euQfvklOwuuL/yJrsADafub/mYEpxbY6bw4YgmHF66t3uYOLeQOoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784079914; c=relaxed/simple;
	bh=sI+tcKRdsQ7VT1k0mUR7wnLMSNPH9oU1FXsEc64e1bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCSvTYlieIVfIRJCm7zdGsDSpEw2U+kj1Cz7ygAeHPKiOnlLrXrGMh7GepFudEp7Km8G+X5Tk4/OKK4cblKxlX/m1T1bk+vRHnr2WflJhCIL7lTNeQZKmXwm+/k0wgfHqCArI/La9hx4HL548MVnxi6NppPi5UoPciGCG4E0u8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrADH7KHl5VZqZd0FAg--.8358S2;
	Wed, 15 Jul 2026 09:44:05 +0800 (CST)
Received: from [192.168.1.31] (unknown [183.94.132.115])
	by gateway (Coremail) with SMTP id _____wAXEMTb5VZqTXWLAA--.10837S2;
	Wed, 15 Jul 2026 09:43:57 +0800 (CST)
Message-ID: <52d302fc-ed86-4d5e-8b68-b8a99226bf98@hust.edu.cn>
Date: Wed, 15 Jul 2026 09:43:55 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
To: Doehyun Baek <doehyunbaek@gmail.com>, Weijie Yuan <wy@wyuan.org>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Ben Guo <ben.guo@openatom.club>,
 Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
 Jiandong Qiu <qiujiandong1998@gmail.com>,
 chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
 Haoyang Liu <tttturtleruss@gmail.com>
References: <alZK0i0HvxOvSKwj@wyuan.org> <alZP_6nAXNy_HfZi@wyuan.org>
 <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrADH7KHl5VZqZd0FAg--.8358S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7WFy8GF1DCFWfXw1UAF4rGrg_yoW8trW8pF
	WrGrn3tF4rXr48Jws7Ka109a1UWa4Fya4agwn8Jw15JF9IqF1SqF109r4a9r1qv34rCrZ3
	tF45Zw1vg34DZrJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHab7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYY7kG6IIYr7AKxVW8JVW5JwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU3fOzUU
	UUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/15/26 1:05 AM, Doehyun Baek wrote:
> Hi Weijie,
>
> Thanks for putting together the “What’s cooking” reports!
> I "cooked" up a small website this evening that attempts to automate them:
>
> https://doehyunbaek.github.io/cook-linux-zhcn/
> <https://doehyunbaek.github.io/cook-linux-zhcn/>


This is what I want. From this webpage, I can quickly locate patches 
which needs review and start working.


>
> Every hour, a GitHub Actions workflow scans recent `docs/zh_CN` 
> patches on the linux-doc mailing list, groups rerolls, and compares 
> their subjects with Alex’s `docs-next` tree to determine whether they 
> have been applied. Pending series with no update for more than 30 days 
> are classified as “Cold.”
>
> This is still an experimental prototype, and its heuristics may have 
> bugs, particularly when threads or patch subjects change. The source 
> is available here:
>
> https://github.com/doehyunbaek/cook-linux-zhcn
> <https://github.com/doehyunbaek/cook-linux-zhcn>


Let me take a look and think what I can help contribute.


>
> Issues, suggestions, and pull requests are welcome!
>
> Thanks,
> Doehyun
>
> On Tue, Jul 14, 2026 at 5:04 PM Weijie Yuan <wy@wyuan.org> wrote:
>
>     On Tue, Jul 14, 2026 at 10:42:34PM +0800, Weijie Yuan wrote:
>     > Here are the topics that have been cooking in Alex's tree.
>
>     This statement is incorrect. I will correct it next time.
>
>     Sorry for the noise.
>
>     > Copies of the source code to Chinese documentation development
>     tree live
>     > in here:
>     >
>     >   
>      git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     <https://mail.hust.edu.cn:8443/linkserver?dest=http%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Falexs%2Flinux.git&tid=_____wAnVXVDblZqsIeJAA--.51119S3&rcpt=dzm91@hust.edu.cn&ifnotice=1&rindex=0>
>     > https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     >
>     https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.git
>     >
>     > Mirrors:
>     >
>     > https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
>     > https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)
>
>
>
> -- 
> Doehyun Baek

