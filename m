Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CAE3164B7;
	Fri,  6 Mar 2026 01:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772760599; cv=none; b=mSi2H3ZRMnT3JlI2V9OjiLDmZ70siAfRgwLs7s/0FvBuApK9xgyEPEJA0ivFLUDyMit+fyhcQ0HqEJdPLkEfEKHqCds0Cu3ldGI/NtWuGDvsno6D+sMJ0AEQ8XWM/qTxcTgyHaKJL7cA130bHWjMzIOC9dFv+Wy4c4OetKPr778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772760599; c=relaxed/simple;
	bh=eVakd0VG+eOI9Rxv2hQE0G9v+SlHcI0jlp5MPVh9BYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuX21O4Bn1LG0uY09XTMYnt8A7HiU6ncfx3Eehdz0YfznnQZ3dlI6Hlll+Qmkx08I9CTpAl6U5EzJ6uDWnp/NPv7nBkaqdPzmvhWLYcfJ7esNxOXwVY5ibYPPvOUC+aOCJIbGX1vR/gYK/0b79QIecUcDj9HpK2IHrolRuGDwwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrACXn9f8LapphwSPAg--.6012S2;
	Fri, 06 Mar 2026 09:29:32 +0800 (CST)
Received: from [10.11.69.52] (unknown [10.11.69.52])
	by gateway (Coremail) with SMTP id _____wCHx6j6LappWOEYAQ--.44842S2;
	Fri, 06 Mar 2026 09:29:31 +0800 (CST)
Message-ID: <062e7436-20dc-467f-9a4d-787eeec19228@hust.edu.cn>
Date: Fri, 6 Mar 2026 09:29:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] docs/zh_CN: fix an inconsistent statement in
 dev-tools/testing-overview
To: LIU Haoyang <tttturtleruss@gmail.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305201100.10119-1-tttturtleruss@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260305201100.10119-1-tttturtleruss@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrACXn9f8LapphwSPAg--.6012S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1fKr1rArW8WF13uFykKrg_yoW8AFyfpr
	yxKrn2yFyvkry3CrykuF18tr10kFZ7WF4UtFZxW34SqFy5trs7KrZFyFZIqFZIvrZ5ua4r
	ZF4FgrySvryqya7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPEb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	WxJVW8Jr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26F4j6r4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
	UjIFyTuYvjxUFCJmDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 3/6/26 4:10 AM, LIU Haoyang wrote:
> This patch fixes an inconsistent describtion in testing-overview.rst,
> which should be ``kmalloc`` instead of ``kmalloc_arry`` according to
> the original text.
>
> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

This inconsistent statement is introduced in the commit 
e07e9f22259ede8258c00cf3358a44eefa1ad7ff.

> ---
> V1 -> V2: fix some typos in the commit message
>
>   Documentation/translations/zh_CN/dev-tools/testing-overview.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> index 286ed6b01f65..8bdc51b47b5e 100644
> --- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> @@ -154,7 +154,7 @@ Smatch和Coccinelle的强项
>   Coccinelle可能是最容易写检查的。它在预处理器之前工作，所以用Coccinelle
>   检查宏中的错误更容易。Coccinelle还能为你创建补丁，这是其他工具无法做到的。
>   
> -例如，用Coccinelle你可以从 ``kmalloc_array(x, size, GFP_KERNEL)``
> +例如，用Coccinelle你可以从 ``kmalloc(x * size, GFP_KERNEL)``
>   到 ``kmalloc_array(x, size, GFP_KERNEL)`` 进行大规模转换，这真的很
>   有用。如果你只是创建一个Smatch警告，并试图把转换的工作推给维护者，他们会很
>   恼火。你将不得不为每个警告争论是否真的可以溢出。

