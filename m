Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A6040FDB6;
	Wed, 27 May 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892800; cv=none; b=sOEdIMTEDQhQZIEfSsHDbTukhKuwEmgPoTn8Hm0zk3sqtlxmGaTuQxqEy3aoMAv8eqQEuP1N8l7dlf+3CaKgBO3haw8vsbH/w6XF+iEys/uyoTvHDtKSs1TWCEvjE9GMyptYxpIP8ZEpiHH3z9vZKviqXHA0SiMBZ755p+i+h+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892800; c=relaxed/simple;
	bh=B6DGaV+PsqBWQ356cPER93PZyi7OF01DpquoF41C9pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNT+s5fLFRU3qkJq/u0gUJxOoexwUeEsaI5GKk8F2dEOnPr0yiOekFCPefSIq9Q0XEhi5khKotZXl0+aZJtxw5lvMcwVTYQ58niE9lQmm+ubPiJ1/2mPxAKJw7fydfrvD/4u7dt1kbrQ0LFPAV9T8s8wE4fkSJWKAjOjM4IvBF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=jes9A1hC; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="jes9A1hC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1779892791; bh=gpSu00VTM5VM2r45dYzRAM4e4hgsadd5rFpBR9Oka60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jes9A1hC5BJiEi1TAwghZJbF2tL7s6lWhzVusd9iUtD1nNEaOHHiiOT9sOnqdTWUx
	 tZEUCniyvNRPYZIJhDCKitVqRWM4qrSuyld2cotR5iys6477XmD8ahjCERS9MRjk1b
	 2z/ty/nv1c6wRIAO4Tzp1iWKQk5vaKbzZfJWW5Uk=
Received: from [192.168.1.3] ([27.38.179.62])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 9F1080B3; Wed, 27 May 2026 22:39:49 +0800
X-QQ-mid: xmsmtpt1779892789tsen112mi
Message-ID: <tencent_C4732EE496B859887755478C63DC0836EF08@qq.com>
X-QQ-XMAILINFO: NTmFlKm683MuhvMtNwtEONMJhEewXPiyvQz3kUfETPVacob2OjllZpR3dHvnik
	 UGBkscRz90P8kOfIJzfD/uwfeSrFpe/y5c2vv8XO78cLMbDyix9gTYNUgdKCkK0UpNlkXtUlTBBO
	 iU3K90UVxbAAhHXnitoNboTkT+PCgo4mxvGMNlsP9phQQhE5wGqJC7Us77Ds724SuH1aFD0VlYvG
	 fBIxIebchEWNYJRCNkfa0jZr0khP41wOD9LxtxCvzH43EeaI85Nt6VhW+Rnpt+RFwvxG/N8I6EU7
	 bVJ8DOXZuqGk1//vveUZgJD83F1eP+HL/JDDFIg0/0YthP3hmF7fnUADJfGv6nPCi7dAuIzNVaIN
	 LlwhSWrlCXPPg/bQYyKLDHPazFopb5B+USH/bpAPKDSpQW8lFaIchZdJjyKq0wNjugdvD0IqFx8z
	 pHuexkh8omrV83Q92vbfSqNtN8l4YBLShmr+2W7bEkag/mvkh9NIDuka1ZH0/GqjTsWsarXdPY/R
	 MJ0IKIf5AhJiZqflq140MUwD+Nl0kSgL2TxyZxdNavWNPAQsTReC4wC1Svf1JU8CTE7mVkpyPZjD
	 a838pgEGRKTeIhbcN7Eakl1Tf89Ap/gVXv8oLHd/AnuuDxZgyG6FCx957AfA/WvY5My9QkZE8wLq
	 3uj1V/tzcIgeX8AMuJ0ond3yajtknhLvSenLPQjfa5suVSWQhnlKTRqO1ilcuRmPxzte5NUIVElh
	 dUJcHTUIjEAprOrVq9A8G4k6/sVYf+gxyS5G8MZeKmiN0f9fmn7uPHhfRfE/TvV9YFpZLq4lBmqX
	 DfZm9XG3FW00TzBDzPSTXvArLH4TL1Bm1UKH8NR/tFvy3N+08isYCe4nSBh3StgaVYqWhxrTg7sY
	 cf/v6a1xZiWce8zdOVRmPdCvcMpkKtDrXqjOgxeEo6kgLlZhSQtoWoEcMXzqIpCSquRypzPIvyqS
	 zhh6YVZ70UFFJL6BtBwNdJZwKgU0SEvnWvNj19GJmP/jGs85lGDn1T3/Z9qQ9FrN9f/B2TfeslNH
	 qTMCBT4aIlyg2qBGuMQDqcYKfY708yiZHWegAx/S7IDlK6C1E+/IyMA6Bv/EhuNOEc+CbsHE9cIr
	 +3DPpxW1XNuMeLggtYLLXm9mg8erCc4wv8jWvXBP3BqhBYOl9cOztHOKKH6U9+/u8EasD3
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-OQ-MSGID: <00fff473-f51e-4e1c-9ed3-1379f6c84a00@qq.com>
Date: Wed, 27 May 2026 22:39:35 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
To: zhuyan2015@qq.com
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, kees@kernel.org,
 dzm91@hust.edu.cn, tony.luck@intel.com, gpiccoli@igalia.com,
 frederic@kernel.org, jani.nikula@intel.com, longman@redhat.com,
 mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com>
From: Yan Zhu <zhuyan2015@qq.com>
In-Reply-To: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Ping.

On 5/10/2026 2:48 PM, Yan Zhu wrote:
> update Documentation/admin-guide/index.rst Chinese translation
> 
> Update the translation through commit f0efd29aa60c
> ("doc: Add CPU Isolation documentation")
> 
> Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
> ---
>   .../translations/zh_CN/admin-guide/index.rst  | 209 +++++++++++++-----
>   1 file changed, 159 insertions(+), 50 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index 15d9ab5993a7..575449b91916 100644
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
> @@ -20,17 +30,55 @@ Linux 内核用户和管理员指南
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
> +
> +Todolist:
> +*   sysfs-rules
>   *   sysctl/index
> +*   abi
> +
> +安全相关文档：
> +
> +.. toctree::
> +   :maxdepth: 1
>   
> -本节介绍CPU漏洞及其缓解措施。
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
> +
> +追踪和识别问题
> +--------------
>   
> -下面的一组文档，针对的是试图跟踪问题和bug的用户。
> +以下是一组面向试图追踪特定问题和 bug 的用户的文档。
>   
>   .. toctree::
>      :maxdepth: 1
> @@ -39,94 +87,155 @@ Todolist:
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
> +
> +   cpu-load
> +   mm/index
> +   module-signing
> +   numastat
>   
> -这是应用程序开发人员感兴趣的章节的开始。可以在这里找到涵盖内核ABI各个
> -方面的文档。
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
> +对非原生二进制格式的支持。请注意，其中一些文档相当古老。
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +
> +Todolist:
> +
> +*   binfmt-misc
> +*   java
> +*   mono
> +
> +
> +块设备和文件系统管理
> +--------------------
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

-- 
Thanks
Yan Zhu


