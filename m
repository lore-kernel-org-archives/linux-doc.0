Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4AC1118
	for <linux-doc@vger.kernel.org>; Fri,  3 Nov 2023 02:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B72318E;
	Thu,  2 Nov 2023 19:00:14 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.110.17])
	by gateway (Coremail) with SMTP id _____8AxZ+gqVERl9Z42AA--.5838S3;
	Fri, 03 Nov 2023 10:00:10 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.110.17])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxiuQmVERl5ts4AA--.59351S3;
	Fri, 03 Nov 2023 10:00:07 +0800 (CST)
Message-ID: <ad26e107-e7cb-4680-9548-7b4d8e84d174@loongson.cn>
Date: Fri, 3 Nov 2023 10:00:06 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: translations: add translations links when they
 exist
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>,
 Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@amd.com>,
 Alex Shi <alexs@kernel.org>, Hu Haowen <src.res.211@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20231028162931.261843-1-vegard.nossum@oracle.com>
 <bc41e32e-e899-427c-9aea-eba411e5bcef@oracle.com>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <bc41e32e-e899-427c-9aea-eba411e5bcef@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxiuQmVERl5ts4AA--.59351S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFW8WrW5tw4xtw4DKry5Jrc_yoWkCFX_J3
	yrZFs7X3Z3J39xtF45Gr17urZ7tay8Kw18trsYyay7uayUXFZ3Awn8Z3s3JF1xGw4xAFn0
	grn3Ja13A3ZruosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbVAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
	0xZFpf9x07j5xhLUUUUU=


在 2023/10/29 02:51, Vegard Nossum 写道:
>
> This went a bit fast... corrections below.
>
> On 28/10/2023 18:29, Vegard Nossum wrote:
>> Add a new Sphinx extension that knows about the translations of kernel
>> documentation and can insert links to the translations at the top of
>> the document.
>
> [...]
>
>> Testing: make htmldocs with v7.3.0.
>
> *Sphinx v7.3.0.
>
>> +all_languages = {
>> +    # English is always first
>> +    None: 'English',
>> +
>> +    # Keep the rest sorted alphabetically
>> +    'zh_CN': 'Chinese',
>> +    'it_IT': 'Italian',
>> +    'ja_JP': 'Japanese',
>> +    'ko_KR': 'Korean',
>> +    'sp_SP': 'Spanish',
>> +    'zh_TW': 'Taiwanese',
>> +}
>
> I went with my naive understanding of the language codes without double
> checking but I think these might be better names:
>
> 'zh_CN': 'Chinese (simplified)'
> 'zh_TW': 'Chinese (traditional)',

Yes, but we need to capitalize the first letter， just like:

'zh_CN': 'Chinese (Simplified)'
'zh_TW': 'Chinese (Traditional)',


see <https://translations.launchpad.net/ubuntu>


Thanks,

Yanteng

>
> Thoughts?
>
>
> Vegard

