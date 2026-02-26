Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B235E38B7B2;
	Thu, 26 Feb 2026 06:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772085727; cv=none; b=Ep8pDuw8AnO/eDYYQzanuFgIoheIEpgZxHvdJ02oTex2dotsHoUYhoXarxkNkCBc3M1gIytT1/s7iAG9iVWyEoqnIVo+aVZ/RiS0xTrkZvgkZK6NOIJ/niE2Xd2xw4TOQnJwfszPSM+c3y/rVkNt+wS/G+XmICShgn6KuLRNr10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772085727; c=relaxed/simple;
	bh=aSImaKwDLOwMtHAtCgUvrtW6nbVJxatRl9CtEl4D6sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CknpATRLnyuc4JnqtrOfk7+8nR241UH6AUxR7TE8GQSUi6mtEgtlLas15HTX1BzWzDY5b1dJKIt9f0xu7sRpfu8T/HkM49TBEUp3NZYMUuzIgDacEl7NC4i+BtD2vdPr5mcr7lA0V8RV9BxKDJjo5ypJ5E9cGhXPVCcyC1co0GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAB3X9S74Z9pIDVfAg--.15440S2;
	Thu, 26 Feb 2026 14:01:31 +0800 (CST)
Received: from [10.12.168.130] (unknown [10.12.168.130])
	by gateway (Coremail) with SMTP id _____wCX16i24Z9pzyT9AA--.22492S2;
	Thu, 26 Feb 2026 14:01:27 +0800 (CST)
Message-ID: <9cc4a719-d6ca-4f15-b862-60fb862ba7b2@hust.edu.cn>
Date: Thu, 26 Feb 2026 14:01:25 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: sync process/2.Process.rst with English
 version
To: Song Hongyi <szpcq123@gmail.com>, alexs@kernel.org, si.yanteng@linux.dev,
 corbet@lwn.net
Cc: skhan@linuxfoundation.org, w1ndys@qq.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260225151013.200635-1-szpcq123@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260225151013.200635-1-szpcq123@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAB3X9S74Z9pIDVfAg--.15440S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxuFykGrWfXrW7GFW8WFWkXrb_yoW3ur4rpr
	Z7KF97Ka1xt3s8Zrs3Kr48KF1rAry7CFWakr97Aa4DXw10yrWvq342qry2yry3WrykCFyD
	ZF40yrWYvry2yrDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPKb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Cr0_Gr1UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74
	AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
	0xZFpf9x07jq1v3UUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2/25/26 11:09 PM, Song Hongyi wrote:
> The Chinese translation of the development process documentation was
> outdated. Sync it with the current English version to ensure consistency.
>
> Key changes include:
> - Update versioning examples from 5.x to the 9.x placeholder.
> - Add footnote [1] to explain the non-semantic versioning scheme.
> - Replace the obsolete LTS kernel table with a link to kernel.org.
> - Add a cross-reference for the "interleaved replies" section.

Hi Hongyi,

Please take a look at how-to.rst [1], especailly how to write a commit 
message for translation update.

This can help us track the translation status of each translated 
documentation.

---

	Update the translation through commit b080e52110ea
	("docs: update self-protection __ro_after_init status")
	# 请执行 git log --oneline <您翻译的英文文档路径>，并替换上述内容

---

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/translations/zh_CN/how-to.rst#n254

Dongliang Mu

> Signed-off-by: Song Hongyi <szpcq123@gmail.com>
> ---
>   .../translations/zh_CN/process/2.Process.rst  | 56 +++++++++----------
>   1 file changed, 25 insertions(+), 31 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/process/2.Process.rst b/Documentation/translations/zh_CN/process/2.Process.rst
> index 31b0e2c994f6..ca00672c313e 100644
> --- a/Documentation/translations/zh_CN/process/2.Process.rst
> +++ b/Documentation/translations/zh_CN/process/2.Process.rst
> @@ -23,21 +23,18 @@
>   总览
>   ----
>   
> -内核开发人员使用一个松散的基于时间的发布过程，每两到三个月发布一次新的主要
> -内核版本。最近的发布历史记录如下：
> -
> -	======  =================
> -	5.0	2019年3月3日
> -	5.1	2019年5月5日
> -	5.2	2019年7月7日
> -	5.3	2019年9月15日
> -	5.4	2019年11月24日
> -	5.5	2020年1月6日
> -	======  =================
> -
> -每个5.x版本都是一个主要的内核版本，具有新特性、内部API更改等等。一个典型的5.x
> -版本包含大约13000个变更集，变更了几十万行代码。因此，5.x是Linux内核开发的前
> -沿；内核使用滚动开发模型，不断集成重大变化。
> +内核开发使用一个松散的、基于时间的滚动发布（rolling release）开发模型。
> +一个新的主内核发行版本（作为示例，我们将其称为 9.x） [1]_ 大约每两到三个月
> +发布一次，它带来了新特性、内部 API 的更改等。一个典型的版本包含大约 13,000
> +个变更集（changesets），涉及几十万行代码的修改。最近的发行版本及其日期可以
> +在这里找到
> +`维基百科 <https://en.wikipedia.org/wiki/Linux_kernel_version_history>`_
> +
> +
> +.. [1] 严格来说，Linux 内核并不采用语义化版本号方案，而是将 9.x 这一组数字
> +       作为一个整体来标识主发行版本号。对于每一个版本，x 都会递增，但只有
> +       当 x 被认为足够大时，9 才会递增（例如：Linux 5.0 是紧随 Linux 4.20
> +       之后发布的）。
>   
>   对于每个版本的补丁合并，遵循一个相对简单的规则。在每个开发周期的开头，“合并
>   窗口”被打开。这时，被认为足够稳定（并且被开发社区接受）的代码被合并到主线内
> @@ -48,8 +45,8 @@
>   提前收集、测试和分级的。稍后将详细描述该过程的工作方式。）
>   
>   合并窗口持续大约两周。在这段时间结束时，Linus Torvalds将声明窗口已关闭，并
> -释放第一个“rc”内核。例如，对于目标为5.6的内核，在合并窗口结束时发生的释放
> -将被称为5.6-rc1。-rc1 版本是一个信号，表示合并新特性的时间已经过去，稳定下一
> +释放第一个“rc”内核。例如，对于目标为9.x的内核，在合并窗口结束时发生的释放
> +将被称为9.x-rc1。-rc1 版本是一个信号，表示合并新特性的时间已经过去，稳定下一
>   个内核的时间已经到来。
>   
>   在接下来的6到10周内，只有修复问题的补丁才应该提交给主线。有时会允许更大的
> @@ -84,11 +81,14 @@
>   开发人员的目标是在稳定发布之前修复所有已知的回归。在现实世界中，这种完美是
>   很难实现的；在这种规模的项目中，变数太多了。需要说明的是，延迟最终版本只会
>   使问题变得更糟；等待下一个合并窗口的更改将变多，导致下次出现更多的回归错误。
> -因此，大多数5.x内核都有一些已知的回归错误，不过，希望没有一个是严重的。
> +因此，大多数内核发布时都会带有一部分已知的回归问题，不过希望它们都不是严重
> +的问题。
>   
>   一旦一个稳定的版本发布，它的持续维护工作就被移交给“稳定团队”，目前由
> -Greg Kroah-Hartman领导。稳定团队将使用5.x.y编号方案不定期地发布稳定版本的
> -更新。要合入更新版本，补丁必须（1）修复一个重要的缺陷，且（2）已经合并到
> +Greg Kroah-Hartman领导。稳定团队将使用9.x.y编号方案不定期地发布稳定版本的
> +更新。
> +
> +要合入更新版本，补丁必须（1）修复一个重要的缺陷，且（2）已经合并到
>   下一个开发版本主线中。内核通常会在其初始版本后的一个以上的开发周期内收到
>   稳定版更新。例如，5.2内核的历史如下（2019年）：
>   
> @@ -105,17 +105,10 @@ Greg Kroah-Hartman领导。稳定团队将使用5.x.y编号方案不定期地发
>   
>   5.2.21是5.2版本的最终稳定更新。
>   
> -有些内核被指定为“长期”内核；它们将得到更长时间的支持。在本文中，当前的长期
> -内核及其维护者是：
> +有些内核被指定为“长期”内核；它们将得到更长时间的支持。请参考以下链接
> +获取当前长期支持内核版本及其维护者的列表：
>   
> -	======  ================================	================
> -	3.16	Ben Hutchings				（长期稳定内核）
> -	4.4	Greg Kroah-Hartman & Sasha Levin	（长期稳定内核）
> -	4.9	Greg Kroah-Hartman & Sasha Levin
> -	4.14	Greg Kroah-Hartman & Sasha Levin
> -	4.19	Greg Kroah-Hartman & Sasha Levin
> -	5.4	Greg Kroah-Hartman & Sasha Levin
> -	======  ================================	================
> +  https://www.kernel.org/category/releases.html
>   
>   长期支持内核的选择纯粹是维护人员是否有需求和时间来维护该版本的问题。
>   目前还没有为即将发布的任何特定版本提供长期支持的已知计划。
> @@ -320,7 +313,8 @@ Quilt 是一个补丁管理系统，而不是源代码管理系统。它不会
>     没有完成家庭作业的人感到不耐烦。
>   
>   - 避免顶部回复（把你的答案放在你要回复的引文上面的做法）。这会让你的回答更难
> -  理解，印象也很差。
> +  理解，印象也很差，详细请查看
> +  :ref:`Documentation/process/submitting-patches.rst <interleaved_replies>`
>   
>   - 在正确的邮件列表发问。linux-kernel 可能是通用的讨论场所，但它不是寻找所有
>     子系统开发人员的最佳场所。

