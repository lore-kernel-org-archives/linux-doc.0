Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EA81A275;
	Mon,  1 Jun 2026 01:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780278371; cv=none; b=e1coELE9GSFnzpO5dZawidhqj2PrlKFtc4+kqAQWtBNGcCI1GEZIs49t/XBD/LzukBwS3Iz126p/9VqE8P6is0ZmWu1eIE1QC3f/uk1efXo6zpFZNvdnqKtVK2SXEkcbXvjENWVwH6LQjiRNCw+sMIVUDlSzVLCQmkex5uxKg/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780278371; c=relaxed/simple;
	bh=iaR7eaOJSG2uTm5N4QNAQt0vHmQvka2P1S4T1C1PtOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XG6oLFIB1JbjRnjvMJresaHxjNRbelcKW4LkXQlyMVay7eLGhcBAchEay7pSqkTWYInBl1j6nxHxTH90SQalHnLwxm3Z1QKizVL5kfHWWigsXLQIBhlkpriQndjbZqGz7xMnXPv69s1Znuaby2qH9ZLap/XSHq20ywBill+jbJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAC3jjVK5Bxqu_AHAA--.35725S2;
	Mon, 01 Jun 2026 09:45:46 +0800 (CST)
Received: from [10.12.169.70] (unknown [10.12.169.70])
	by gateway (Coremail) with SMTP id _____wCnnglI5BxqXekNAA--.17155S2;
	Mon, 01 Jun 2026 09:45:46 +0800 (CST)
Message-ID: <4534170c-700d-43b5-ad32-6b91455b3f14@hust.edu.cn>
Date: Mon, 1 Jun 2026 09:45:44 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: update admin-guide/index.rst translation
To: Yan Zhu <zhuyan2015@qq.com>, corbet@lwn.net, alexs@kernel.org,
 si.yanteng@linux.dev, kees@kernel.org
Cc: skhan@linuxfoundation.org, tony.luck@intel.com, gpiccoli@igalia.com,
 frederic@kernel.org, jani.nikula@intel.com, longman@redhat.com,
 mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_FCA3F4312E849777081742CBAF2CD6BBA007@qq.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <tencent_FCA3F4312E849777081742CBAF2CD6BBA007@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAC3jjVK5Bxqu_AHAA--.35725S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3XryfJw45tr43Gw4xZr4fXwb_yoWxGr1Upr
	nIkryfKF43XF17uFyxGFWIgaykG3Wktw1xK345Gr95Jr1UAFs7tr4Ygas7G3yDWrZYka48
	JFW5trWjkry2yrDanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4UJVW0owA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j-8nOUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 5/29/26 11:37 PM, Yan Zhu wrote:
> update Documentation/admin-guide/index.rst Chinese translation
>
> Update the translation through commit f0efd29aa60c
> ("doc: Add CPU Isolation documentation")
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
> ---
> v1->v2:
>   - Remove any unnecessary blank lines.
>   - Add necessary blank lines.
> ---
>   .../translations/zh_CN/admin-guide/index.rst  | 202 +++++++++++++-----
>   1 file changed, 152 insertions(+), 50 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index 15d9ab5993a7..bd01cf6474c8 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -1,7 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: :doc:`../../../admin-guide/index`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
> +:Original: Documentation/admin-guide/index.rst
> +
> +:翻译:
> +
> + 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
> +
> + 朱岩 Yan Zhu <zhuyan2015@qq.com>
>   
>   
>   Linux 内核用户和管理员指南
> @@ -11,7 +17,11 @@ Linux 内核用户和管理员指南
>   整体的顺序或组织 - 这些材料不是一个单一的，连贯的文件！幸运的话，情况会随着
>   时间的推移而迅速改善。
>   
> -这个初始部分包含总体信息，包括描述内核的README， 关于内核参数的文档等。
> +
> +内核管理通用指南
> +----------------
> +
> +本节包含总体信息，包括描述内核整体的 README 文件、内核参数文档等。
>   
>   .. toctree::
>      :maxdepth: 1
> @@ -20,17 +30,54 @@ Linux 内核用户和管理员指南
>   
>   Todolist:
>   
> -*   kernel-parameters
>   *   devices
> +*   features
> +
> +内核管理接口的重要组成部分是 /proc 和 sysfs 虚拟文件系统；这些文档描述了如何
> +与之交互。
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   cputopology
> +
> +Todolist:
> +
> +*   sysfs-rules
>   *   sysctl/index
> +*   abi
>   
> -本节介绍CPU漏洞及其缓解措施。
> +安全相关文档：
> +
> +.. toctree::
> +   :maxdepth: 1
>   
>   Todolist:
>   
>   *   hw-vuln/index
> +*   LSM/index
> +*   perf-security
> +
> +
> +内核启动
> +--------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   bootconfig
> +
> +Todolist:
> +
> +*   kernel-parameters
> +*   efi-stub
> +*   initrd
> +
>   
> -下面的一组文档，针对的是试图跟踪问题和bug的用户。
> +追踪和识别问题
> +--------------
> +
> +以下是一组面向试图追踪特定问题和 bug 的用户的文档。
>   
>   .. toctree::
>      :maxdepth: 1
> @@ -39,94 +86,149 @@ Todolist:
>      reporting-regressions
>      bug-hunting
>      bug-bisect
> -   tainted-kernels
>      init
> +   clearing-warn-once
> +   lockup-watchdogs
> +   sysrq
>   
>   Todolist:
>   
> +*   quickly-build-trimmed-linux
> +*   verify-bugs-and-bisect-regressions
> +*   tainted-kernels
>   *   ramoops
>   *   dynamic-debug-howto
>   *   kdump/index
>   *   perf/index
> +*   pstore-blk
> +*   kernel-per-CPU-kthreads
> +*   RAS/index
> +
> +
> +核心内核子系统
> +--------------
> +
> +这些文档描述了核心内核管理接口，这些接口几乎在任何系统上都值得关注。
> +
> +.. toctree::
> +   :maxdepth: 1
>   
> -这是应用程序开发人员感兴趣的章节的开始。可以在这里找到涵盖内核ABI各个
> -方面的文档。
> +   cpu-load
> +   mm/index
> +   module-signing
> +   numastat
>   
>   Todolist:
>   
> -*   sysfs-rules
> +*   cgroup-v2
> +*   cgroup-v1/index
> +*   namespaces/index
> +*   pm/index
> +*   syscall-user-dispatch
>   
> -本手册的其余部分包括各种指南，介绍如何根据您的喜好配置内核的特定行为。
>   
> +对非原生二进制格式的支持。请注意，其中一些文档相当 **古老**。
>   
>   .. toctree::
>      :maxdepth: 1
>   
> -   bootconfig
> -   clearing-warn-once
> -   cpu-load
> -   cputopology
> -   lockup-watchdogs
> -   numastat
> -   unicode
> -   sysrq
> -   mm/index
> +Todolist:
> +
> +*   binfmt-misc
> +*   java
> +*   mono
> +
> +
> +块设备和文件系统管理
> +--------------------
> +
> +.. toctree::
> +   :maxdepth: 1
>   
>   Todolist:
>   
> -*   acpi/index
> -*   aoe/index
> -*   auxdisplay/index
>   *   bcache
>   *   binderfs
> -*   binfmt-misc
>   *   blockdev/index
> -*   braille-console
> -*   btmrvl
> -*   cgroup-v1/index
> -*   cgroup-v2
>   *   cifs/index
> -*   dell_rbu
>   *   device-mapper/index
> -*   edid
> -*   efi-stub
>   *   ext4
> +*   filesystem-monitoring
>   *   nfs/index
> -*   gpio/index
> -*   highuid
> -*   hw_random
> -*   initrd
>   *   iostats
> -*   java
>   *   jfs
> -*   kernel-per-CPU-kthreads
> +*   md
> +*   ufs
> +*   xfs
> +
> +
> +专用设备指南
> +------------
> +
> +如何在 Linux 系统中配置硬件。
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +Todolist:
> +
> +*   acpi/index
> +*   aoe/index
> +*   auxdisplay/index
> +*   braille-console
> +*   btmrvl
> +*   dell_rbu
> +*   edid
> +*   gpio/index
> +*   hw_random
>   *   laptops/index
>   *   lcd-panel-cgram
> -*   ldm
> -*   LSM/index
> -*   md
>   *   media/index
> -*   module-signing
> -*   mono
> -*   namespaces/index
> +*   nvme-multipath
>   *   parport
> -*   perf-security
> -*   pm/index
>   *   pnp
>   *   rapidio
> -*   ras
>   *   rtc
>   *   serial-console
>   *   svga
> +*   thermal/index
>   *   thunderbolt
> -*   ufs
>   *   vga-softcursor
>   *   video-output
> -*   xfs
> +
> +
> +工作负载分析
> +------------
> +
> +这是一个章节的开始，其中包含对从事 Linux 内核安全关键性分析的应用程序开发人员
> +和系统集成商感兴趣的信息。这里可以找到支持分析内核与应用程序交互以及关键内核
> +子系统预期的文档。
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +Todolist:
> +
> +*   workload-tracing
> +
> +
> +其他内容
> +--------
> +
> +一些难以分类且通常已过时的文档。
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +Todolist:
> +
> +*   highuid
> +*   ldm
> +*   unicode
>   
>   .. only::  subproject and html
>   
> -   Indices
> -   =======
> +   索引
> +   ====
>   
>      * :ref:`genindex`

