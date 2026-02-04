Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4579723AB9D;
	Wed,  4 Feb 2026 01:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770168488; cv=none; b=AKOnGQemzfgv2DHYdW4CK0PvxzA3FHIDW7PZcz+8+kmbgLjUMOyRR1a9Ing8b5xtGAEPrjp4n2zGzdMNpSYwi+hB5mUDQApphpduKoW4sreh2J379Q52AhOosYkWClheyYHBwbLNsxSjtglsTime1RHARr8PDbOe2lHDtDhTL4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770168488; c=relaxed/simple;
	bh=OFxd1GrBys77zioOdyfC6ks98+Ht3t6RYfgESLqbAUs=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=O/6NCt7K89EsFqS5r5yGr/Y29r4IpGqz/H7rPBo+iV5O/zMYUaQMIHHJD8vnnIiPzzza+VHHVi2ancltUfG0Y0Q+BQmLWyqfK011804mGgrpXbMlQU7Aj32HRXGfDCDVzZmdS2hI6Wzs690H3uc4fzA8KgLOLNEGJpDa2CnK5bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8CxLMOboIJpxJkPAA--.50669S3;
	Wed, 04 Feb 2026 09:27:55 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowJCxOMGXoIJpQ3A_AA--.38473S3;
	Wed, 04 Feb 2026 09:27:54 +0800 (CST)
Subject: Re: [PATCH v11 2/4] irqchip/irq-loonarch-avec: Prepare for interrupt
 redirection support
To: Thomas Gleixner <tglx@linutronix.de>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, maobibo@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260203124522.2288900-1-zhangtianyang@loongson.cn>
 <20260203124522.2288900-3-zhangtianyang@loongson.cn> <87tsvx3fxq.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <ccd4a8be-23e2-45f2-5b90-8a8e8f9ae6d6@loongson.cn>
Date: Wed, 4 Feb 2026 09:26:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87tsvx3fxq.ffs@tglx>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMGXoIJpQ3A_AA--.38473S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw4kGw1rXF47Ww15GrW7trc_yoWkCwb_Wr
	y5Krs7G34DWFWfWFZxGrZ3Xr9xGFyruFyDArW5uF12qryFyFWkCF1qgryS93yrC3y2vrn3
	ur98Xw1fWw1a9osvyTuYvTs0mTUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8h0ePUUUUU==

Hi, Thomas

ÔÚ 2026/2/4 ÉÏÎç1:17, Thomas Gleixner Ð´µÀ:
> On Tue, Feb 03 2026 at 20:45, Tianyang Zhang wrote:
> 
> $Subject: irqchip/irq-loonarch-avec
> 
> I know you blindly copied my suggestion and obviously you failed to spot
> the missing 'g'.
......ok......
> 
>> Interrupt redirection support requires a new interrupt chip, which
>> needs to share data structures, constants and functions with the AVEC
>> code.
>>
>> Move them to the header file and make the required functions public.
> 
> But then you still keep this nonsense around, which has no place in the
> change log as I explained to you before:
> 
>    "Enumerating the details of what is moved is a pointless exercise
>     because that can bee seen from the diff itself."
> 
> What's so hard about that to understand?
> 
> Just in case I'm not able to express myself coherently, this means:
> 
> Remove the following 4 lines:
Ok, I got it
> 
>> including:
>> 1 marco AVEC_MSG_OFFSET
>> 2 struct avecintc_data
>> 3 Make avecintc_sync public
> 
> Sigh. Though I have to admit that 'loonarch' gave me a good laugh at
> least.
......Maybe that's a happy little accident
> 
> Thanks,
> 
>          tglx
> 
Thanks
Tianyang

