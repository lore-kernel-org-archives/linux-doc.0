Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=207.46.229.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677727;
	b=z/Us9pU8owhUM2QMEqZnXUZKc9R7zXqIQ7bbZg1Qty0N3KeM5oAMy1Memhoq1cUJ1v9z
	 VDMvAYMa7wJxLaShL9wZOBu+owTGpplfXAwintyHfEDOSYkFAvkvzNSh+ioiLctHmc/HK
	 p7n9AZTmz0TGwh640P+eTIROPqTkteZh/a6SZHDSl7tBMRJzQbNvtbm9A8zuLqfHvx5Wu
	 8mug+ec6zw12JUkDyTF/7SZY+41eNMYaaTKNoKq9ywuVlopv8u0K5QBq2QrJ/UQ5/Io9k
	 GylCFKLmmYHaAlQPTTeicGEy2WG0ELN4TjzY+7dsZubeCXACIMDcBP6YMaxBt2rGMYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677727;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ZYN/9SfKtyRh0GiVpeRk/ZKeGLOSm4pL8Gdxw2bBCtk=;
	b=Wgr+hfrqVJsKRTk8vvGhAEz0GugU6jMQeMBwn0VrrJcQP7eqXprFvMy3XsUpts4AStxC
	 /e4lsm6kmFl7CDA7ckLdudMr5nDa8rl02/26d5vzlCxrC5/ORScAwWOVs6VUtOF+wNOj1
	 gqtM5aw4/RVmpB5k+G5wjdRCjz0IYgLM1xx9E4bQfUN/NrQYbZMHieQhMUpFuZoJdT2rP
	 Xv0YW1meyJlQgjVLU8Rl2IT9cwlI45dkjh5NVoQ5mOcc+9rJqN7lcRekln/GQtNpPu9iM
	 QMmiSZ4LPORsY1slhTiwVIyWH4GevKYrIaHwaBzH/iSc2sfw9/+of+aKiV8PKInIGHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=207.46.229.174
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C194E606A319
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 14:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C194E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDmK6JVF9pqnXsZAQ--.45528S2;
	Thu, 22 Oct 2026 22:01:57 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAX0+VLF9pqMSKxAA--.7934S2;
	Thu, 22 Oct 2026 22:01:49 +0800 (CST)
Message-ID: <89d978d0-598d-4870-adfe-0950e426ca2c@hust.edu.cn>
Date: Thu, 22 Oct 2026 22:01:47 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix typos in admin-guide/README
To: Yao Yiqi <yyaqia@gmail.com>, alexs@kernel.org, si.yanteng@linux.dev,
 corbet@lwn.net
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org, yaoyiqi3@huawei.com,
 linux-doc@vger.kernel.org
References: <20261022135949.361566-1-yyaqia@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261022135949.361566-1-yyaqia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMDmK6JVF9pqnXsZAQ--.45528S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7trykAryUJry7JryUKryDJrb_yoW8Gr47pa
	9FgryIvan7C3WakF4rWr47GF1fAF4xG3ykGF1Ig3W5Wan3JFZ2g3W2q3sFgFnxXrW09FW5
	XFs29FWYyrWjy37anT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQGb7Iv0xC_Xr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zRtCzZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/22/26 9:59 PM, Yao Yiqi wrote:
> From: Yao Yiqi <yaoyiqi3@huawei.com>
>
> "内个" -> "每个" and "愿意" -> "原因", matching the English
> version: "the reason for the rebuild of each target".
>
> Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   Documentation/translations/zh_CN/admin-guide/README.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
> index ee6dd3782f4a..32bda8f3e088 100644
> --- a/Documentation/translations/zh_CN/admin-guide/README.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/README.rst
> @@ -244,7 +244,7 @@ Linux内核6.x版本 <http://kernel.org/>
>   
>        make V=1 all
>   
> -   如需构建系统也给出内个目标重建的愿意，请使用 ``V=2`` 。默认为 ``V=0`` 。
> +   如需构建系统也给出每个目标重建的原因，请使用 ``V=2`` 。默认为 ``V=0`` 。
>   
>    - 准备一个备份内核以防出错。对于开发版本尤其如此，因为每个新版本都包含
>      尚未调试的新代码。也要确保保留与该内核对应的模块的备份。如果要安装

