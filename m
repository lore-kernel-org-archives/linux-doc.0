Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01173CF690;
	Sun, 16 Aug 2026 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786873337; cv=none; b=XxX6PAjGt4UH++Tmknwfn0q5l1RFzaehe8CnFTMilTmPtqoL+Jmnv+2NdxWGdEvMRCIkGswAcCzovT/qoEm7m0lHvvLPdyrgVqAGEpzwKAfOt0fUCP+iqvliUoAT/ftSAg7tSXo0aO8dpFVOGLJMbr08n8uO2WDVkxexFwvBjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786873337; c=relaxed/simple;
	bh=juBKSKHkSFIRhgr1rXGIasn6aag4NzieKnZ/Mnp/aiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYf92+sI9f/G2fokzVn4tpkEPhbYfpfM7aEG5jmarwcx0qS7k07fQ/u7hcEB5qQrQOTsG6NFgr9BN+64p4SZpDkoh7JAwEmplM1qY3gSBFDVpBqQQkDdTlrNJjFOIve3bzjh7OhX9LxTjh4RZwUGl3cohmuUOSUzzR6Ltx2KRKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAAHDirUhYFq8zJ3Aw--.6938S2;
	Sun, 16 Aug 2026 17:41:40 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAXks7OhYFqSyBFAQ--.4135S2;
	Sun, 16 Aug 2026 17:41:34 +0800 (CST)
Message-ID: <463fc2dd-4d79-434d-b138-f4baea93bc40@hust.edu.cn>
Date: Sun, 16 Aug 2026 17:41:33 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] docs/zh_CN: Add Chinese translations for five
 networking documents
To: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wy@wyuan.org,
 Siwei Chen <businiaoanka@anka1.top>
References: <20260811071200.54062-1-anka@stu.cdut.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260811071200.54062-1-anka@stu.cdut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAHDirUhYFq8zJ3Aw--.6938S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7try5WrW5tFWUGryUWFWDtwb_yoW8tw1Dpa
	15KFWfJa1xtF12yws7Gr47AF1rAa1xA39xGw12qwnYqrs8tFyrKrsFyr9I9a97trW0vFyY
	vFsakrW5Wa4jyrJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/11/26 3:11 PM, Siwei Chen wrote:
> From: Siwei Chen <businiaoanka@anka1.top>
>
> This series adds Simplified Chinese translations for five documents
> under Documentation/networking/:
>
>    - team.rst: Team devices driven from userspace via libteam
>    - sriov.rst: NIC SR-IOV APIs (switchdev model and legacy API)
>    - driver.rst: Softnet driver issues (probing, close/stop,
>      transmit path guidelines, and extack error reporting)
>    - ipv6.rst: ipv6 module parameters (disable, autoconf,
>      disable_ipv6)
>    - secid.rst: LSM/SELinux secid usage in the flowi structure

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Please remember to two small minor issues.

>
> Changes in v2:
>    - Add translated documents to corresponding index file.
>    - Link to v1: https://lore.kernel.org/linux-doc/cover.1784866896.git.businiaoanka@anka1.top/
>
> Changes in v3:
>    - Remove spaces before and after "（".
>    - Add a missing space after "IPv6".
>    - Update the translation of "secid".
>    - Link to v2: https://lore.kernel.org/linux-doc/20260727073538.56951-1-anka@stu.cdut.edu.cn/
>
> Siwei Chen (5):
>    docs/zh_CN: Add networking team documentation Chinese translation
>    docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
>    docs/zh_CN: Add Softnet Driver Issues Chinese translation
>    docs/zh_CN: Add ipv6 Chinese translation
>    docs/zh_CN: Add LSM/SeLinux secid Chinese translation
>
>   .../translations/zh_CN/networking/driver.rst  | 138 ++++++++++++++++++
>   .../translations/zh_CN/networking/index.rst   |  10 +-
>   .../translations/zh_CN/networking/ipv6.rst    |  76 ++++++++++
>   .../translations/zh_CN/networking/secid.rst   |  24 +++
>   .../translations/zh_CN/networking/sriov.rst   |  31 ++++
>   .../translations/zh_CN/networking/team.rst    |  16 ++
>   6 files changed, 290 insertions(+), 5 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/networking/driver.rst
>   create mode 100644 Documentation/translations/zh_CN/networking/ipv6.rst
>   create mode 100644 Documentation/translations/zh_CN/networking/secid.rst
>   create mode 100644 Documentation/translations/zh_CN/networking/sriov.rst
>   create mode 100644 Documentation/translations/zh_CN/networking/team.rst
>

