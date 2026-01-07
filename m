Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.168.213])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4A921E0AF;
	Wed,  7 Jan 2026 03:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.168.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767757762; cv=none; b=fU+A9KUmyty4k+hr68JvZudnKTZVKErVyYDzVgAICUSo6dwxFsstReqqVTQ9MCoxJy1QuIr171RRbC2YgxOzLuCFG0dSVWR92cnNXut33nDXAANL25MMUFazuwvn+/VDivxBrwNx6uuiNOrvmDHc5HBm63fcm99OTBzz/cT6Tvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767757762; c=relaxed/simple;
	bh=Of0JLBB6sAdzNSqz5ThoGF8soVR0895442s7vvwS69w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgzivW4BjG5nvftLF/LJYssuQdoYDA5ZpKkN10Dbyv36WlkTEd8AaTuo8nFoq1Cjc8sOMkilk3osEicCAYvF6CcOPSXzGUKB5dUHYZufQxm44xNlaL3RaHDJKpbXFxC2QTZxhwIcWDRI3bVIuVVfXN7VFFoN9ql/wsa5n9z3IGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.229.168.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrABnGTqd111pmRMtAA--.41487S2;
	Wed, 07 Jan 2026 11:48:45 +0800 (CST)
Received: from [192.168.3.3] (unknown [115.156.217.161])
	by gateway (Coremail) with SMTP id _____wC3jR2a111pPFdTAA--.42991S2;
	Wed, 07 Jan 2026 11:48:42 +0800 (CST)
Message-ID: <d58c6b3a-72fe-43d6-9725-0dab530c2ae8@hust.edu.cn>
Date: Wed, 7 Jan 2026 11:48:42 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] docs/zh_CN: Add timers subsystem translation
To: Xingqiu Xu <hilbertanjou83@gmail.com>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1767725479.git.hilbertanjou83@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <cover.1767725479.git.hilbertanjou83@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrABnGTqd111pmRMtAA--.41487S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWrWF1fGw4fGF15CryDJrb_yoW5uFy8pF
	4jkryfK3ZrAF1akr4xKF4DJr13Ca1xG3yUJr12qwnYyrZ3tF4rtFn8tryYga9rJr1xA3W2
	vrWrtrW5Wa1UA3DanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmYb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU3oqcUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 1/7/26 3:47 AM, Xingqiu Xu wrote:
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

After applying this patchset, timers/index.rst has different orders from 
the one in English, like

======
定时器
======

.. toctree::
     :maxdepth: 1

     delay_sleep_functions
     highres
     hpet
     hrtimers
     no_hz
     timekeeping

I suggest the order in patchset can be exactly the same with the one 
in timers/index.rst.


Besides, after reviewing the first file - timers/highres.rst: 
High-resolution timers design notes,

I found some common issues, also found in other files.


1) In the how-to.rst, it requires "每行长度最多不超过 40 个字符"。It means 
40 Chinese characters.

Each line in the translation is too small. You can make it longer.

2) If you use AI to translate kernel documentation, that's fine. But 
please proofread and double check

all the translation results.

> All translations are based on the latest English documentation.
>
> Changes in v3:
> - Replace kernel-doc directives with :c:func: and :c:macro: references
>    to avoid duplicate C declaration warnings as pointed out by Dongliang Mu
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
>
>   .../translations/zh_CN/subsystem-apis.rst     |   5 +-
>   .../zh_CN/timers/delay_sleep_functions.rst    | 136 +++++++
>   .../translations/zh_CN/timers/highres.rst     | 270 ++++++++++++++
>   .../translations/zh_CN/timers/hpet.rst        |  43 +++
>   .../translations/zh_CN/timers/hrtimers.rst    | 187 ++++++++++
>   .../translations/zh_CN/timers/index.rst       |  30 ++
>   .../translations/zh_CN/timers/no_hz.rst       | 337 ++++++++++++++++++
>   .../translations/zh_CN/timers/timekeeping.rst | 202 +++++++++++
>   8 files changed, 1206 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/timers/delay_sleep_functions.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/highres.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/hpet.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/hrtimers.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/index.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/no_hz.rst
>   create mode 100644 Documentation/translations/zh_CN/timers/timekeeping.rst
>

