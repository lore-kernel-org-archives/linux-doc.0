Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.142.27])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D13243371
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.142.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448046; cv=none; b=elVUopi6Ud0M8N9uHrPk32eKOGDuUIAbCnRoKY99Gvi5gtKuFAHh8Kg5wHCUON7T6RHZUA4sO0QsD+iP6I3zEVu37A5OG74k5VS8ZCbRyVtxuDHr4aya5tGGwsGqXTiUuajkZmuUFzffkGF6q0eLtuRT3FFEt+by+2wRDD9TgA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448046; c=relaxed/simple;
	bh=CLV92Ym9vsLn1Xtanzk0hIdWSOmZPygB3biLMRm+AOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/i33kMJz7kqP3Zj8WTpnmUoPd2Vs7kWpjC0d9Fb3VROm7Zc7Bzn2JoH1aCNcGDwTe+fXp79zRdfFELcz2oj+w3GLThiXQCh627XD9w30DAKzOVWs4Ak2g5iNonNcVf079oV7of11+pVjNGFMYafimPRp5mP3sduCLoY9PzzNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.76.142.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAD3_hbe+WRogkwBDA--.23863S2;
	Wed, 02 Jul 2025 17:20:30 +0800 (CST)
Received: from [10.12.169.104] (unknown [10.12.169.104])
	by gateway (Coremail) with SMTP id _____wB3YJrZ+WRoVAfBAA--.16151S2;
	Wed, 02 Jul 2025 17:20:27 +0800 (CST)
Message-ID: <66a384bb-724c-4036-b6a8-379caffc7b1e@hust.edu.cn>
Date: Wed, 2 Jul 2025 17:20:25 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add translation of scsi subsystem
To: =?UTF-8?B?6YOd5qCL5qCL?= <doubled@leap-io.com>,
 Yanteng Si <si.yanteng@linux.dev>
Cc: alexs@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250630022934.1600937-1-doubled@leap-io.com>
 <70da9d7d-9040-41fb-8af3-33723b650d83@linux.dev>
 <220d7401030e8c57cb19a90642e0e0ae27071c38.9f9c8c60.2744.44cc.bd7a.c6eb47a4a3f8@feishu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <220d7401030e8c57cb19a90642e0e0ae27071c38.9f9c8c60.2744.44cc.bd7a.c6eb47a4a3f8@feishu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAD3_hbe+WRogkwBDA--.23863S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1ftw1kArWxCw4ftrW3trb_yoW5JFW8pF
	W0g34Yka4DArn3Gwn29r4UAryrJay8Xwn8tFy3X3Z5Cr98JrW0gw12qr9Y9a48Grs5WFnr
	trsFqF9I93y5ZrJanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jfpndUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 7/2/25 5:10 PM, 郝栋栋 wrote:
> Hi Yanteng,
> Thank you again for your kind suggestion.
>
> Sorry for the mistake. I will split the original patch into a patch 
> set with one patch per file and resend it soon, to make the review 
> easier. Since this is my first time submitting patches to the Linux 
> kernel, I’m still learning the process and might not fully understand 
> all the best practices. I really appreciate your guidance.
Great!
>
> Do I need to do anything to withdraw the previous single patch?

No

> Or can I just submit the new patch set directly as a replacement?
It's fine to directly resubmit your patch set.
> Should I mention in the cover letter that it supersedes the earlier 
> version?

No need to mention it.

Dongliang Mu

>
> Best regards,
> Dongdong Hao
> From: "Yanteng Si"<si.yanteng@linux.dev <mailto:si.yanteng@linux.dev>>
> Date: Mon, Jun 30, 2025, 11:04
> Subject: Re: [PATCH] docs/zh_CN: add translation of scsi subsystem
> To: "haodongdong"<doubled@leap-io.com <mailto:doubled@leap-io.com>>, 
> <alexs@kernel.org <mailto:alexs@kernel.org>>
> Cc: <dzm91@hust.edu.cn <mailto:dzm91@hust.edu.cn>>, <corbet@lwn.net 
> <mailto:corbet@lwn.net>>, <linux-doc@vger.kernel.org 
> <mailto:linux-doc@vger.kernel.org>>
> 在 6/30/25 10:29 AM, haodongdong 写道:
> > This patch introduces the Chinese translation
> > of the following SCSI subsystem documentation
> > files:
> >      ../scsi/index.rst
> >      ../scsi/link_power_management_policy.rst
> >      ../scsi/scsi_eh.rst
> >      ../scsi/scsi_mid_low_api.rst
> >      ../scsi/scsi-parameters.rst
> >      ../scsi/scsi.rst
> >      ../scsi/sd-parameters.rst
> >
> > Signed-off-by: haodongdong <doubled@leap-io.com>
> > ---
> >   .../translations/zh_CN/scsi/index.rst         |   92 ++
> >   .../scsi/link_power_management_policy.rst     |   32 +
> >   .../zh_CN/scsi/scsi-parameters.rst            |  118 ++
> >   .../translations/zh_CN/scsi/scsi.rst          |   48 +
> >   .../translations/zh_CN/scsi/scsi_eh.rst       |  482 +++++++
> >   .../zh_CN/scsi/scsi_mid_low_api.rst           | 1174 
> +++++++++++++++++
> >   .../translations/zh_CN/scsi/sd-parameters.rst |   38 +
> >   .../translations/zh_CN/subsystem-apis.rst     |    2 +-
>
> Would you mind splitting the patches into a patch set,
>
> with one patch per file? I think this would make the
>
> review much more convenient.
>
>
> Thanks,
>
> Yanteng

