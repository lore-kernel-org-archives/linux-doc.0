Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A4A1D8E10;
	Tue,  6 Jan 2026 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678516; cv=none; b=kLPXktnVoUOJrAcB6t9XRah+P+WJFc9XsxjA0wrcB3rTjt0TYMi3t0c6Aab2U8U7ZmRjZKCCaw5DSt3GWGOwct9FzkltyK3Zbq6DqOy1R4TUh0/N051Yr6fxnUyUzw5YmdSRzSe+o3ECdW4CCHGV24Fic3ZEg2Dtc0wMGkMVunU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678516; c=relaxed/simple;
	bh=KBQwvTSaUIV9GWRhyP/5lfRDCNdl+kQgwpEBCS6IsaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kl80/3dc1F+zFFWi+zJufo5h6FgNYzKf9Vj//ap/HSmMQm+ygkwYNrBYCW+Kne/9dqUvJoe+DxOydwk6steDx1GQoF1FBzKAJJCjJvVvE9NbumI/RQ3SGWKAHR9qKxBH+Xyl1dIztFtpKwjlCfT2WlN7NSxgDsAOdZ/QHihJrl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAC3vt4KolxpDFXpAA--.21383S2;
	Tue, 06 Jan 2026 13:47:54 +0800 (CST)
Received: from [10.12.169.108] (unknown [10.12.169.108])
	by gateway (Coremail) with SMTP id _____wCX9qkGolxpd8EgAA--.49096S2;
	Tue, 06 Jan 2026 13:47:51 +0800 (CST)
Message-ID: <f10db744-d447-41d2-b9f8-1c137e22e0fa@hust.edu.cn>
Date: Tue, 6 Jan 2026 13:47:50 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] docs/zh_CN: Add timers subsystem translation
To: Xingqiu Xu <hilbertanjou83@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1767118457.git.hilbertanjou83@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <cover.1767118457.git.hilbertanjou83@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HgEQrAC3vt4KolxpDFXpAA--.21383S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxtF4DCFy7ur4rtFWkZr43Jrb_yoWfGryrpa
	yjkr1IqanrJry5Cr4Sqw48Zr13uay8W3y7JFW7K34vkws3JFn5tFZ8tr90qa97XrWfAF17
	Z3WFyF98Wr4Yy37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmjb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcV
	Cjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	XVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU0X_-JUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 12/31/25 3:02 AM, Xingqiu Xu wrote:
> This patch series translates the complete timers subsystem
> documentation into Chinese, including:
>
> - timers/index.rst: Main index with file structure
> - timers/timekeeping.rst: Clock sources and events
> - timers/hpet.rst: High Precision Event Timer driver
> - timers/hrtimers.rst: High-resolution timer subsystem
> - timers/highres.rst: High-resolution timers design notes
> - timers/no_hz.rst: Reducing scheduling-clock ticks
> - timers/delay_sleep_functions.rst: Delay and sleep mechanisms
>
> Also updates subsystem-apis.rst to include timers/index.
>
> All translations are based on the latest English documentation.
>
> Changes in v2:
> - Remove trailing blank lines at EOF in all translation files
>    as pointed out by Dongliang Mu
>
> Xingqiu Xu (7):
>    docs/zh_CN: Add timers directory Chinese translation
>    docs/zh_CN: Translate timers/timekeeping.rst
>    docs/zh_CN: Translate timers/hpet.rst
>    docs/zh_CN: Translate timers/hrtimers.rst
>    docs/zh_CN: Translate timers/highres.rst
>    docs/zh_CN: Translate timers/no_hz.rst
>    docs/zh_CN: Translate timers delay_sleep_functions

Please fix the compilation warnings and send the v3 patch:

Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:32: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:32.
Declaration is '.. c:function:: void udelay(unsigned long usec)'. 
[duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:32: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:32.
Declaration is '.. c:None:: unsigned long usec'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:69: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:69.
Declaration is '.. c:function:: void ndelay(unsigned long nsec)'. 
[duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:69: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:69.
Declaration is '.. c:None:: unsigned long nsec'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:35: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:35.
Declaration is '.. c:macro:: mdelay'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:67: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:67.
Declaration is '.. c:function:: void usleep_range(unsigned long min, 
unsigned long max)'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:67: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:67.
Declaration is '.. c:None:: unsigned long min'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:67: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:67.
Declaration is '.. c:None:: unsigned long max'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:81: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:81.
Declaration is '.. c:function:: void usleep_range_idle(unsigned long 
min, unsigned long max)'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:81: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:81.
Declaration is '.. c:None:: unsigned long min'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:81: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:81.
Declaration is '.. c:None:: unsigned long max'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:345: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:345.
Declaration is '.. c:function:: void usleep_range_state(unsigned long 
min, unsigned long max, unsigned int state)'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:345: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:345.
Declaration is '.. c:None:: unsigned long min'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:345: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:345.
Declaration is '.. c:None:: unsigned long max'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:345: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:345.
Declaration is '.. c:None:: unsigned int state'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:283: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:283.
Declaration is '.. c:function:: void msleep(unsigned int msecs)'. 
[duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:283: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:283.
Declaration is '.. c:None:: unsigned int msecs'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:323: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:323.
Declaration is '.. c:function:: unsigned long 
msleep_interruptible(unsigned int msecs)'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:323: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:323.
Declaration is '.. c:None:: unsigned int msecs'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:96: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:96.
Declaration is '.. c:function:: void ssleep(unsigned int seconds)'. 
[duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:96: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:96.
Declaration is '.. c:None:: unsigned int seconds'. [duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:110: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:110.
Declaration is '.. c:function:: void fsleep(unsigned long usecs)'. 
[duplicate_declaration.c]
Documentation/translations/zh_CN/timers/delay_sleep_functions.rst:110: 
WARNING: Duplicate C declaration, also defined at 
timers/delay_sleep_functions:110.
Declaration is '.. c:None:: unsigned long usecs'. [duplicate_declaration.c]

Dongliang Mu

>   .../translations/zh_CN/subsystem-apis.rst     |   5 +-
>   .../zh_CN/timers/delay_sleep_functions.rst    | 135 +++++++
>   .../translations/zh_CN/timers/highres.rst     | 270 ++++++++++++++
>   .../translations/zh_CN/timers/hpet.rst        |  43 +++
>   .../translations/zh_CN/timers/hrtimers.rst    | 187 ++++++++++
>   .../translations/zh_CN/timers/index.rst       |  30 ++
>   .../translations/zh_CN/timers/no_hz.rst       | 337 ++++++++++++++++++
>   .../translations/zh_CN/timers/timekeeping.rst | 202 +++++++++++
>   8 files changed, 1205 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/timers/delay_sleep_functions.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/highres.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/hpet.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/hrtimers.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/index.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/no_hz.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/timekeeping.rst
>

