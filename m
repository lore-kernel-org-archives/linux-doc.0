Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC76B258CE7;
	Fri, 30 Jan 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764069; cv=none; b=TzEvBINNIXSnc3SAACEAK/DPqRE4muX21ApSq7pbbOqG5KcvK1p7j0A+GFF4ngcm3gPXwrc83aRakWEn1t9iztCNZl+MEdeNN0bwE033UW3eCcMPWWrKLgUPTuPN2NmRas5mVSh/oHoybwDj3aYXMQGpnPHb4G2zP1ktnklR1GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764069; c=relaxed/simple;
	bh=jl2rsBx79PTuSW+KFZNWbc8V4s/xPyTG8GdE/Ec1md0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=oFiHnR++5S+FSnVsNUalQrDODduJ7jbhCBLYeX5gBM6qysk9OXJzsvKA4Rz7QJAPKMi2y1owqxlSVVvBCMQjRjl6nL3IOcZdu7doTUFCsb6vqD5fZLHAhIVSzcU9sIatabrI3wavbsoXFxSHf2RU8HWXbRif84yYRi/1MjdLRRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8BxcfDedHxp3jcOAA--.47041S3;
	Fri, 30 Jan 2026 17:07:42 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowJAxXcLVdHxp_0s6AA--.42164S3;
	Fri, 30 Jan 2026 17:07:37 +0800 (CST)
Subject: Re: [PATCH v9 3/4] irqchip/loongarch-avec.c:return
 IRQ_SET_MASK_OK_DONE when keep affinity
To: Thomas Gleixner <tglx@kernel.org>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260130025941.2140582-1-zhangtianyang@loongson.cn>
 <20260130025941.2140582-4-zhangtianyang@loongson.cn> <87343nmrzk.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <e36a4c6e-1113-ec35-56ee-3655004b64d5@loongson.cn>
Date: Fri, 30 Jan 2026 17:05:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87343nmrzk.ffs@tglx>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJAxXcLVdHxp_0s6AA--.42164S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur4DWrW3Zr4UWF1xKFy7CFX_yoW8Zw17pa
	yUCrn8Kwsxtr1xWFs7Ka1xZFy3CryfWw1UGF1Fk34xA3s8WFyjgr1I9w15uFyfWrs5C3WI
	qanFq34DZw1DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWx
	Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jFAp
	nUUUUU=

Hi, Thomas

ÔÚ 2026/1/30 ÏÂÎç4:20, Thomas Gleixner Ð´µÀ:
> On Fri, Jan 30 2026 at 10:59, Tianyang Zhang wrote:
>
>    irqchip/irq-loonarch-avec: Return IRQ_SET_MASK_OK_DONE when affinity is unchanged
>
> Note the space between 'prefix: ' and the shortlog sentence
Ok, I got it
>
>> When it is detected in avecintc_set_affinity that the current affinity
> Functions are denoted with fname() to make it clear. See
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes
Ok, I got it
>
>> remains valid, the return value is modified to IRQ_SET_MASK_OK_DONE.
> That's the very wrong order of explaining the change. You again explain
> the _what_ first without giving context and reason.
>
> See the above link. It provides guidance about structuring a change log.
Ok, I will rewrite this changelog
>
>> After the introduction of redirect-domain, for each interrupt source,
>> avecintc-domain only provides the CPU/interrupt vector, while redirect-domain
>> provides other operations to synchronize interrupt affinity information
>> among multiple cores. The original intention is to notify the cascaded
>> redirect_set_affinity that multi-core synchronization is not required.
> "After the introduction.." is confusing at best.
Ok, I got it
>
>> However, this introduces some compatibility issues, such as the new return
>> value causing msi_domain_set_affinity to no longer perform irq_chip_write_msi_msg.
>>    1) When redirect exist in the system, the msi msg_address and msg_data no
>> longer changes after the allocation phase, so it does not actually require updating
>> the MSI message info.
>>    2) When only avecintc exists in the system, the irq_domain_activate_irq
>> interface will be responsible for the initial configuration of the MSI message,
>> which is unconditional. After that, if unnecessary, no modification to the MSI
>> message is alse correctly.
> Spell checkers exist for a reason.

Ok, I got it

Thanks

>
> Thanks
>
>          tglx

