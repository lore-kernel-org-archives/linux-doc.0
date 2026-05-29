Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F4342CB3;
	Fri, 29 May 2026 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780069212; cv=none; b=YyGtIPio+6gjX3r/INL+HHUpl9AV3kjjNy7c398WCnc1XsJXLWIMzfXKlLqOObFm6CdwTSEyEbXS0nezH+X0/2f76H+nXIUJ2P8PoKQZHWNNrceXmSvxTxB+aF0fxco9zaBl4pW1/rt50uqpsAnj7R5KjmYBZdG1gSXaH7aBPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780069212; c=relaxed/simple;
	bh=WxVe7N234pzRHr8b8MP3czsHk7xfj5KzuUeavO5f1+o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X1ZRQfflrqQOnfv89Qd2F0soN83c4TGcqx3jy9BY4pV1OZdsaSv17pQlfsLYt7p3+E2Cw7W3BdBu31k+F+qinqyuIzWDyr2LQcv+CgkxST2qE0qwySy+heUUEjyOzMuwzl/Emt3NksmEJ1GiZLPnQf/ZvCwb0knxkSmBKL669P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=TovD9sAX; arc=none smtp.client-ip=43.163.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="TovD9sAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1780069208; bh=qAH/JGvne86oZtx6uOZeX6fbkx+C+c2y9H5WGTBcbvQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TovD9sAXfBcWA6itHtosl0cAA3gELL21QhuchxLU0b3f+1k1MsyrmYxE3GaAjPTO4
	 Lu9Ws0KmC6X9ZHmN4QvRq0kxsabEQm+AMOITYQbk7zEdggkg3ps4MIIKeNJGpOjCZO
	 rCDItdRvcdOknZbDdS3T3Hi3OdOaykIlxMGEc4Es=
Received: from [192.168.1.3] ([27.38.179.62])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id A05308E9; Fri, 29 May 2026 23:40:05 +0800
X-QQ-mid: xmsmtpt1780069205t9nu7nq0b
Message-ID: <tencent_72BE1FB988583A645DDE811E758F7521880A@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJYFlSljMsc5+bj4wxlBuSewjewBicsBsrOlFN15JhYtP3w5UWGw
	 2CniICjN6VqaqkOFqsCOGbIAjquwucVTo34TckT+7ckIjCkS3TwMl/2z4In2YU+vXOy1jnusrA7q
	 fR1esoklbhH6LvLmmcaOU2OppncVAbnZMcRg4y/xtDcHBbjFeSvNkrANrwMKK+1PM3mj0Swb/xJH
	 2f425KYoNzLR9JrJHXSnRrgQ5u//Gs+llw7/Rzj+EetRkY7toGEpb+JO/PCAGGoZ0jl7kMUbW4if
	 e5mbTEMR2DGiQZzrFcuUyGF1mjuCqL6Th+42iyUbSpldrfDOjLyo7vQX3G6HMgMmHeRTolP/NXCs
	 E1Qz4+xu2DFHk8wTtxcGr4iTCnbRfMJygPWZEgfmad9rE1+r1uOrkuK1kLvo0BpjVOFEOE9JHnuV
	 kJnkc1RehWms6sX4zsC6F31SOQysIUaJlxXPAPOYX9aUz60cz/w9tHnGu4Khua2pO8TXNtyZKxTU
	 79AjYuiooOU6jjMYkalHT8HjkA0sygObO2L9k66IOi/2f4imyEkWf3dVHUd+UvRXt81rQUofROU1
	 zgPluWUQ41wcDW+/3PgT8uvcx8HuwzzvploN3+ge0mPHRt1O2LlvHGw/AznwK5JRF2lqvH6r6Yts
	 Nd9P0cVQiOYXnh5swxvFqztZ15Z9GLa1R1stUfhAweSk2pxhycBc2ivSNeFjTi6BOP1KuvF/oKIM
	 40sNSXAfMO4Lc/OYPBqWe77lZqv2Kv2E+yGIKglYnqtTHBrpPnRj9+GSjh+tQgxArbfNGGTyIkN/
	 v8jv2yHB7U9d+uBYJ52bqBQklaIDOJ+SIwJEvpZX2rW7WKwN4bIvrwCJkSxxZ5IkXV3A8NS64jkV
	 haMeDfyquTxF3pM2/yaXO/1fnA2s6b7zuSz27Z6EKSgWiKJ3Auef1WZqrrHAQT7fie4H/yO7r28c
	 UGRGfUQFstkV/TRgZq5p17KJdNpMVlo5yy7WZaTft44E5SlBQoR8jrVke9G0j6qTFnoJtUEri3Xp
	 WGmeNlozgfa1NEDmQEuHwe9pah1TiSK9Suqb63cjb330qPr+Xqo/BhvPRs30702+k5AOmnTb+E14
	 ssbEypcOvzCxOKVq0v1nxi0TQN2Q==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-OQ-MSGID: <e7ca439a-fbe7-4db2-be5a-e343f822da13@qq.com>
Date: Fri, 29 May 2026 23:40:05 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yan Zhu <zhuyan2015@qq.com>
Subject: Re: [PATCH] docs/zh_CN: update admin-guide/index.rst translation
To: Dongliang Mu <dzm91@hust.edu.cn>, corbet@lwn.net, alexs@kernel.org,
 si.yanteng@linux.dev, kees@kernel.org
Cc: skhan@linuxfoundation.org, tony.luck@intel.com, gpiccoli@igalia.com,
 frederic@kernel.org, jani.nikula@intel.com, longman@redhat.com,
 mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_7ADF2D1EBD8EAD2028BC93BA7858EA655D0A@qq.com>
 <09fb5801-dd23-4ad4-aebf-fa4216b7527e@hust.edu.cn>
In-Reply-To: <09fb5801-dd23-4ad4-aebf-fa4216b7527e@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/28/2026 10:46 PM, Dongliang Mu wrote:
> 
> On 5/10/26 2:48 PM, Yan Zhu wrote:
>> update Documentation/admin-guide/index.rst Chinese translation
>>
>> Update the translation through commit f0efd29aa60c
>> ("doc: Add CPU Isolation documentation")
>>
>> Signed-off-by: Yan Zhu <zhuyan2015@qq.com>
>> ---
>>   .../translations/zh_CN/admin-guide/index.rst  | 209 +++++++++++++-----
>>   1 file changed, 159 insertions(+), 50 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/ 
>> Documentation/translations/zh_CN/admin-guide/index.rst
>> index 15d9ab5993a7..575449b91916 100644
>> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
>> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
>> @@ -1,7 +1,13 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>>   .. include:: ../disclaimer-zh_CN.rst
>> -:Original: :doc:`../../../admin-guide/index`
>> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>> +:Original: Documentation/admin-guide/index.rst
>> +
>> +:翻译:
>> +
>> + 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
>> +
>> + 朱岩 Yan Zhu <zhuyan2015@qq.com>
>>   Linux 内核用户和管理员指南
>> @@ -11,7 +17,11 @@ Linux 内核用户和管理员指南
>>   整体的顺序或组织 - 这些材料不是一个单一的，连贯的文件！幸运的话，情 
>> 况会随着
>>   时间的推移而迅速改善。
>> -这个初始部分包含总体信息，包括描述内核的README， 关于内核参数的文档等。
>> +
>> +内核管理通用指南
>> +----------------
>> +
>> +本节包含总体信息，包括描述内核整体的 README 文件、内核参数文档等。
>>   .. toctree::
>>      :maxdepth: 1
>> @@ -20,17 +30,55 @@ Linux 内核用户和管理员指南
>>   Todolist:
>> -*   kernel-parameters
>>   *   devices
>> +*   features
>> +
>> +内核管理接口的重要组成部分是 /proc 和 sysfs 虚拟文件系统；这些文档描 
>> 述了如何
>> +与之交互。
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   cputopology
>> +
>> +
>> +Todolist:
> Add a blank line here.

I have fixed it in patch v2.

>> +*   sysfs-rules
>>   *   sysctl/index
>> +*   abi
>> +
>> +安全相关文档：
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> -本节介绍CPU漏洞及其缓解措施。
>>   Todolist:
>>   *   hw-vuln/index
>> +*   LSM/index
>> +*   perf-security
>> +
>> +
>> +内核启动
>> +--------
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   bootconfig
>> +
>> +Todolist:
>> +
>> +*   kernel-parameters
>> +*   efi-stub
>> +*   initrd
>> +
>> +
>> +追踪和识别问题
>> +--------------
>> -下面的一组文档，针对的是试图跟踪问题和bug的用户。
>> +以下是一组面向试图追踪特定问题和 bug 的用户的文档。
>>   .. toctree::
>>      :maxdepth: 1
>> @@ -39,94 +87,155 @@ Todolist:
>>      reporting-regressions
>>      bug-hunting
>>      bug-bisect
>> -   tainted-kernels
>>      init
>> +   clearing-warn-once
>> +   lockup-watchdogs
>> +   sysrq
>>   Todolist:
>> +*   quickly-build-trimmed-linux
>> +*   verify-bugs-and-bisect-regressions
>> +*   tainted-kernels
>>   *   ramoops
>>   *   dynamic-debug-howto
>>   *   kdump/index
>>   *   perf/index
>> +*   pstore-blk
>> +*   kernel-per-CPU-kthreads
>> +*   RAS/index
>> +
>> +
>> +核心内核子系统
>> +--------------
>> +
>> +这些文档描述了核心内核管理接口，这些接口几乎在任何系统上都值得关注。
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   cpu-load
>> +   mm/index
>> +   module-signing
>> +   numastat
>> -这是应用程序开发人员感兴趣的章节的开始。可以在这里找到涵盖内核ABI各个
>> -方面的文档。
>>   Todolist:
>> -*   sysfs-rules
>> +*   cgroup-v2
>> +*   cgroup-v1/index
>> +*   namespaces/index
>> +*   pm/index
>> +*   syscall-user-dispatch
>> -本手册的其余部分包括各种指南，介绍如何根据您的喜好配置内核的特定行为。
>> +对非原生二进制格式的支持。请注意，其中一些文档相当古老。
> I think you can emphasize 古老 with bold in RST, which can match the 
> English documentation.

I have fixed it in patch v2.

>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +
>> +Todolist:
>> +
>> +*   binfmt-misc
>> +*   java
>> +*   mono
>> +
>> +
>> +块设备和文件系统管理
>> +--------------------
>>   .. toctree::
>>      :maxdepth: 1
>> -   bootconfig
>> -   clearing-warn-once
>> -   cpu-load
>> -   cputopology
>> -   lockup-watchdogs
>> -   numastat
>> -   unicode
>> -   sysrq
>> -   mm/index
>>   Todolist:
>> -*   acpi/index
>> -*   aoe/index
>> -*   auxdisplay/index
>>   *   bcache
>>   *   binderfs
>> -*   binfmt-misc
>>   *   blockdev/index
>> -*   braille-console
>> -*   btmrvl
>> -*   cgroup-v1/index
>> -*   cgroup-v2
>>   *   cifs/index
>> -*   dell_rbu
>>   *   device-mapper/index
>> -*   edid
>> -*   efi-stub
>>   *   ext4
>> +*   filesystem-monitoring
>>   *   nfs/index
>> -*   gpio/index
>> -*   highuid
>> -*   hw_random
>> -*   initrd
>>   *   iostats
>> -*   java
>>   *   jfs
>> -*   kernel-per-CPU-kthreads
>> +*   md
>> +*   ufs
>> +*   xfs
>> +
>> +
>> +专用设备指南
>> +------------
>> +
>> +如何在 Linux 系统中配置硬件。
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +
> Remove one blank line. Only keep one blank line here.
>> +Todolist:
>> +
>> +*   acpi/index
>> +*   aoe/index
>> +*   auxdisplay/index
>> +*   braille-console
>> +*   btmrvl
>> +*   dell_rbu
>> +*   edid
>> +*   gpio/index
>> +*   hw_random
>>   *   laptops/index
>>   *   lcd-panel-cgram
>> -*   ldm
>> -*   LSM/index
>> -*   md
>>   *   media/index
>> -*   module-signing
>> -*   mono
>> -*   namespaces/index
>> +*   nvme-multipath
>>   *   parport
>> -*   perf-security
>> -*   pm/index
>>   *   pnp
>>   *   rapidio
>> -*   ras
>>   *   rtc
>>   *   serial-console
>>   *   svga
>> +*   thermal/index
>>   *   thunderbolt
>> -*   ufs
>>   *   vga-softcursor
>>   *   video-output
>> -*   xfs
>> +
>> +
>> +工作负载分析
>> +------------
>> +
>> +这是一个章节的开始，其中包含对从事 Linux 内核安全关键性分析的应用程序 
>> 开发人员
>> +和系统集成商感兴趣的信息。这里可以找到支持分析内核与应用程序交互以及 
>> 关键内核
>> +子系统预期的文档。
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +
> Remove one blank line. Only keep one blank line here.

I have removed it in patch v2.

>> +Todolist:
>> +
>> +*   workload-tracing
>> +
>> +
>> +其他内容
>> +--------
>> +
>> +一些难以分类且通常已过时的文档。
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +
>> +Todolist:
>> +
>> +*   highuid
>> +*   ldm
>> +*   unicode
>>   .. only::  subproject and html
>> -   Indices
>> -   =======
>> +   索引
>> +   ====
>>      * :ref:`genindex`

-- 
Thanks
Yan Zhu

