Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D210B3236
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 04:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721362696; cv=none; b=C/uXaOpWOEWjDVp4YhBN0dxcCTIzK4LIGyQI1h3spHRkICkXWrqydMCtug+7p/YK2F+MTTzfAil/zz8H9iR/VDUOjjJMFyhc2gXsDjCXKiwiO8D9IM1d1SM1dxmZ2o7Xx7eI6ao4whhgGt0GIFIrdeaNEdP4Y+Nw9UhjzZ191vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721362696; c=relaxed/simple;
	bh=LE3/f6duBFPu0vIb34drDDB06LjrQV/Lo+MYstXpeII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GCbXCtRuHc268Fn3XNngMbUODBZ204tlIZcWMDFL4TP+Uac9GUx7f3sGHkA+ioBb8C+4jI9p35K6ewRwLX4TdODQ+UG6Nuk3KDUP8AQMv7HeLMyjCKtMHGfcSV/ysLjbQfcy6qFum1NCYT18fP5QnwoD/53D8+xv/B109YUDeOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrACH6G3d6JlmcXZ4AQ--.45837S2;
	Fri, 19 Jul 2024 12:17:33 +0800 (CST)
Received: from [10.12.169.159] (unknown [10.12.169.159])
	by gateway (Coremail) with SMTP id _____wC3WXfc6Jlm0iBZAA--.34697S2;
	Fri, 19 Jul 2024 12:17:33 +0800 (CST)
Message-ID: <c03055c6-5c96-48a6-9d2e-60110f144d36@hust.edu.cn>
Date: Fri, 19 Jul 2024 12:17:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Fix checktransupdate.py and add help documents
To: chengziqiu@hust.edu.cn, Yanteng Si <siyanteng@loongson.cn>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>
Cc: linux-doc@vger.kernel.org
References: <20240719041400.3909775-1-dzm91@hust.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20240719041400.3909775-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HgEQrACH6G3d6JlmcXZ4AQ--.45837S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyrWr15Jr13ZFWfuF1kuFg_yoW8GrWkpF
	yYkr1fu3Z5tw13Zw1fG3yDZr43CrW8AF4Ygry7Xwn8ZF4qqwnYvr43Ka1F9FWDGrWfZayY
	vFWjkrW2kr9ayFDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcV
	Cjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jfpndUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2024/7/19 12:13, Dongliang Mu wrote:
> This patch set fixes all the issues in the checktransupdate.py reported
> by pylint, and add help documents in both English and Chinese.

It seems to-cmd and cc-cmd cannot handle cover letter. Forward by hand.

>
> v3:
> 1) fixes all the issues (not most) reported by pylint,
> 2) add the functionability to tackle documents that need translation,
> 3) add logging to adjust the logging level and log file
> 4) fix some issues by Yanteng and Jani
>
> v2:
> fix some issues according to Randy
>
> v1:
> This patch fixes most issues with the following contents:
> - add or revise comments for all functions
> - use format string suggested by python
>
> Add help documentation of scripts/checktransupdate.py
>
> Dongliang Mu (2):
>    scripts: fix all issues reported by pylint
>    doc-guide: add help documentation checktransupdate.rst
>
>   Documentation/doc-guide/checktransupdate.rst  |  53 +++++
>   Documentation/doc-guide/index.rst             |   1 +
>   .../zh_CN/doc-guide/checktransupdate.rst      |  55 +++++
>   .../translations/zh_CN/doc-guide/index.rst    |   1 +
>   scripts/checktransupdate.py                   | 214 ++++++++++++------
>   5 files changed, 251 insertions(+), 73 deletions(-)
>   create mode 100644 Documentation/doc-guide/checktransupdate.rst
>   create mode 100644 Documentation/translations/zh_CN/doc-guide/checktransupdate.rst
>

