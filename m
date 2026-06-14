Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D9D21FF2A
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 02:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781403094; cv=none; b=k/66ANVeKwN/D1eUIg7YjTAZm0XyPniL1eI6Lijbufw1ZgzSrnH/Ed0z74R9k3eRTH1lJqR7VBYLWV6ueHIef/9XWmzKrcsn1pgANSQ1rkzB40XnhBXcmupp+Cf+skptBoskajj8kac54MAI3YwXaN0GRtndJki0lUO5oYi3Gl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781403094; c=relaxed/simple;
	bh=/TmpsURhEHqg14NcBlP2d3UQmMBclGEWmzmDYTVpvtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAj6fEvuweUH56W9Bc1PuXTDdDPfScCDIpeHqbwyve2rXGlY1P2yc64VKN/jOaq0K7L6cCbOmoeQ2EUgPYxoKBA2VeMc7UUkFWCXbr4oesTtvC1E9gqQklCqsD2Zkp0l9G0+Ti8y7c5PpTE/QQEAW7MA4CcQDtaiXy8GmM+CUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrAAnCQ6qDS5q0sAkAA--.37873S2;
	Sun, 14 Jun 2026 10:10:50 +0800 (CST)
Received: from [172.31.11.49] (unknown [120.236.78.138])
	by gateway (Coremail) with SMTP id _____wB3oBCpDS5q0SgeAA--.32977S2;
	Sun, 14 Jun 2026 10:10:49 +0800 (CST)
Message-ID: <0b7e4f61-c41c-4c15-9569-f059159816dd@hust.edu.cn>
Date: Sun, 14 Jun 2026 10:10:49 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix CONFIG_CGROUP typo for CONFIG_CGROUPS
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260613211300.86016-1-enelsonmoore@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260613211300.86016-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAAnCQ6qDS5q0sAkAA--.37873S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWrZF1xuFy7Gw1xKr47tw1UJrb_yoW8JF1DpF
	Z7KrWxJ3WftF15C3ykC3y8W3WrJan7Gw45GFsrt3Zrtwn3JFWrJr4Yyry2gasxWryfAFWf
	XrZ0kryq9asFywUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Xr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
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
	vjDU0xZFpf9x0zRK-e5UUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 6/14/26 5:12 AM, Ethan Nelson-Moore wrote:
> The Simplified Chinese translation of accounting/psi.rst
> contains a typo CONFIG_CGROUP for CONFIG_CGROUPS. Fix it.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   Documentation/translations/zh_CN/accounting/psi.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/accounting/psi.rst b/Documentation/translations/zh_CN/accounting/psi.rst
> index a0ddb7bd257c..703bc81ff9be 100644
> --- a/Documentation/translations/zh_CN/accounting/psi.rst
> +++ b/Documentation/translations/zh_CN/accounting/psi.rst
> @@ -148,7 +148,7 @@ psi接口提供的均值即可。
>   Cgroup2接口
>   ===========
>   
> -对于CONFIG_CGROUP=y及挂载了cgroup2文件系统的系统，能够获取cgroups内任务的psi。
> +对于CONFIG_CGROUPS=y及挂载了cgroup2文件系统的系统，能够获取cgroups内任务的psi。
>   此场景下cgroupfs挂载点的子目录包含cpu.pressure、memory.pressure、io.pressure文件，
>   内容格式与/proc/pressure/下的文件相同。
>   

