Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDEAC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 05:37:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF73A64EED
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 05:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbhCSFga (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Mar 2021 01:36:30 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:46689 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231787AbhCSFgT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Mar 2021 01:36:19 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0USVzO8Y_1616132176;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0USVzO8Y_1616132176)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 19 Mar 2021 13:36:17 +0800
Subject: Re: [PATCH v2 6/6] docs/zh_CN: Add zh_CN/admin-guide/init.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1616050069.git.bobwxc@email.cn>
 <cd2fd8d0ea2ad50afc6bd2abe15eba73b6c7940c.1616050069.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <1edb67b2-0d34-817f-4c43-c09967614ef2@linux.alibaba.com>
Date:   Fri, 19 Mar 2021 13:36:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cd2fd8d0ea2ad50afc6bd2abe15eba73b6c7940c.1616050069.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>


在 2021/3/18 下午3:20, Wu XiangCheng 写道:
> Add translation zh_CN/admin-guide/init.rst, and link it to
> zh_CN/admin-guide/index.rst while clean its todo entry.
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
>  .../translations/zh_CN/admin-guide/init.rst   | 54 +++++++++++++++++++
>  2 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/init.rst
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index a671d16710f3..be835ec8e632 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -40,13 +40,13 @@ Todolist:
>     bug-hunting
>     bug-bisect
>     tainted-kernels
> +   init
>  
>  Todolist:
>  
>     reporting-bugs
>     ramoops
>     dynamic-debug-howto
> -   init
>     kdump/index
>     perf/index
>  
> diff --git a/Documentation/translations/zh_CN/admin-guide/init.rst b/Documentation/translations/zh_CN/admin-guide/init.rst
> new file mode 100644
> index 000000000000..fbaf6d97f86c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/init.rst
> @@ -0,0 +1,54 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../admin-guide/init`
> +
> +:译者:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +解释“No working init found.”启动挂起消息
> +=========================================
> +
> +:作者:
> +
> + Andreas Mohr <andi at lisas period de>
> +
> + Cristian Souza <cristianmsbr at gmail period com>
> +
> +本文档提供了加载初始化二进制（init binary）失败的一些高层级原因（大致按执行
> +顺序列出）。
> +
> +1) **无法挂载根文件系统Unable to mount root FS** ：请设置“debug”内核参数（在
> +   引导加载程序bootloader配置文件或CONFIG_CMDLINE）以获取更详细的内核消息。
> +
> +2) **初始化二进制不存在于根文件系统上init binary doesn't exist on rootfs** ：
> +   确保您的根文件系统类型正确（并且 ``root=`` 内核参数指向正确的分区）；拥有
> +   所需的驱动程序，例如SCSI或USB等存储硬件；文件系统（ext3、jffs2等）是内建的
> +   （或者作为模块由initrd预加载）。
> +
> +3) **控制台设备损坏Broken console device** ： ``console= setup`` 中可能存在
> +   冲突 --> 初始控制台不可用（initial console unavailable）。例如，由于串行
> +   IRQ问题（如缺少基于中断的配置）导致的某些串行控制台不可靠。尝试使用不同的
> +   ``console= device`` 或像 ``netconsole=`` 。
> +
> +4) **二进制存在但依赖项不可用Binary exists but dependencies not available** ：
> +   例如初始化二进制的必需库依赖项，像 ``/lib/ld-linux.so.2`` 丢失或损坏。使用
> +   ``readelf -d <INIT>|grep NEEDED`` 找出需要哪些库。
> +
> +5) **无法加载二进制Binary cannot be loaded** ：请确保二进制的体系结构与您的
> +   硬件匹配。例如i386不匹配x86_64，或者尝试在ARM硬件上加载x86。如果您尝试在
> +   此处加载非二进制文件（shell脚本？），您应该确保脚本在其工作头（shebang
> +   header）行 ``#!/...`` 中指定能正常工作的解释器（包括其库依赖项）。在处理
> +   脚本之前，最好先测试一个简单的非脚本二进制文件，比如 ``/bin/sh`` ，并确认
> +   它能成功执行。要了解更多信息，请将代码添加到 ``init/main.c`` 以显示
> +   kernel_execve()的返回值。
> +
> +当您发现新的失败原因时，请扩展本解释（毕竟加载初始化二进制是一个 **关键** 且
> +艰难的过渡步骤，需要尽可能无痛地进行），然后向LKML提交一个补丁。
> +
> +待办事项：
> +
> +- 通过一个可以存储 ``kernel_execve()`` 结果值的结构体数组实现各种
> +  ``run_init_process()`` 调用，并在失败时通过迭代 **所有** 结果来记录一切
> +  （非常重要的可用性修复）。
> +- 试着使实现本身在一般情况下更有帮助，例如在受影响的地方提供额外的错误消息。
> 
