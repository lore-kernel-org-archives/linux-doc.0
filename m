Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DB2C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 02:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5C5E64F80
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 02:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbhCQC5z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Mar 2021 22:57:55 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:17501 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229519AbhCQC5d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Mar 2021 22:57:33 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R611e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0USCjY17_1615949851;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0USCjY17_1615949851)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 17 Mar 2021 10:57:31 +0800
Subject: Re: [PATCH 2/2] docs/zh_CN: Add zh_CN/admin-guide/bug-hunting.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn>
 <fb00391d6c189ae5de19b410be5cb3b48b60dc4c.1615909052.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <da130f09-8ad2-99f8-5bc8-192d6b5deb59@linux.alibaba.com>
Date:   Wed, 17 Mar 2021 10:57:30 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fb00391d6c189ae5de19b410be5cb3b48b60dc4c.1615909052.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/3/16 下午11:41, Wu XiangCheng 写道:
> Add translation zh_CN/admin-guide/bug-hunting.rst, and link it to
> zh_CN/admin-guide/index.rst while clean its todo entry.
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../zh_CN/admin-guide/bug-hunting.rst         | 340 ++++++++++++++++++
>  .../translations/zh_CN/admin-guide/index.rst  |   2 +-
>  2 files changed, 341 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst b/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
> new file mode 100644
> index 000000000000..9261236ec3f7
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
> @@ -0,0 +1,340 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../admin-guide/bug-hunting`
> +
> +:译者:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +追踪缺陷
> +=========
> +
> +内核错误报告通常附带如下堆栈转储::
> +
> +	------------[ cut here ]------------
> +	WARNING: CPU: 1 PID: 28102 at kernel/module.c:1108 module_put+0x57/0x70
> +	Modules linked in: dvb_usb_gp8psk(-) dvb_usb dvb_core nvidia_drm(PO) nvidia_modeset(PO) snd_hda_codec_hdmi snd_hda_intel snd_hda_codec snd_hwdep snd_hda_core snd_pcm snd_timer snd soundcore nvidia(PO) [last unloaded: rc_core]
> +	CPU: 1 PID: 28102 Comm: rmmod Tainted: P        WC O 4.8.4-build.1 #1
> +	Hardware name: MSI MS-7309/MS-7309, BIOS V1.12 02/23/2009
> +	 00000000 c12ba080 00000000 00000000 c103ed6a c1616014 00000001 00006dc6
> +	 c1615862 00000454 c109e8a7 c109e8a7 00000009 ffffffff 00000000 f13f6a10
> +	 f5f5a600 c103ee33 00000009 00000000 00000000 c109e8a7 f80ca4d0 c109f617
> +	Call Trace:
> +	 [<c12ba080>] ? dump_stack+0x44/0x64
> +	 [<c103ed6a>] ? __warn+0xfa/0x120
> +	 [<c109e8a7>] ? module_put+0x57/0x70
> +	 [<c109e8a7>] ? module_put+0x57/0x70
> +	 [<c103ee33>] ? warn_slowpath_null+0x23/0x30
> +	 [<c109e8a7>] ? module_put+0x57/0x70
> +	 [<f80ca4d0>] ? gp8psk_fe_set_frontend+0x460/0x460 [dvb_usb_gp8psk]
> +	 [<c109f617>] ? symbol_put_addr+0x27/0x50
> +	 [<f80bc9ca>] ? dvb_usb_adapter_frontend_exit+0x3a/0x70 [dvb_usb]
> +	 [<f80bb3bf>] ? dvb_usb_exit+0x2f/0xd0 [dvb_usb]
> +	 [<c13d03bc>] ? usb_disable_endpoint+0x7c/0xb0
> +	 [<f80bb48a>] ? dvb_usb_device_exit+0x2a/0x50 [dvb_usb]
> +	 [<c13d2882>] ? usb_unbind_interface+0x62/0x250
> +	 [<c136b514>] ? __pm_runtime_idle+0x44/0x70
> +	 [<c13620d8>] ? __device_release_driver+0x78/0x120
> +	 [<c1362907>] ? driver_detach+0x87/0x90
> +	 [<c1361c48>] ? bus_remove_driver+0x38/0x90
> +	 [<c13d1c18>] ? usb_deregister+0x58/0xb0
> +	 [<c109fbb0>] ? SyS_delete_module+0x130/0x1f0
> +	 [<c1055654>] ? task_work_run+0x64/0x80
> +	 [<c1000fa5>] ? exit_to_usermode_loop+0x85/0x90
> +	 [<c10013f0>] ? do_fast_syscall_32+0x80/0x130
> +	 [<c1549f43>] ? sysenter_past_esp+0x40/0x6a
> +	---[ end trace 6ebc60ef3981792f ]---
> +
> +这样的堆栈跟踪提供了足够的信息来识别内核源代码中发生错误的那一行。根据问题的
> +严重性，它还可能包含 **“Oops”** 一词，比如::
> +
> +	BUG: unable to handle kernel NULL pointer dereference at   (null)
> +	IP: [<c06969d4>] iret_exc+0x7d0/0xa59
> +	*pdpt = 000000002258a001 *pde = 0000000000000000
> +	Oops: 0002 [#1] PREEMPT SMP
> +	...
> +
> +尽管有 **Oops** 或其他类型的堆栈跟踪，但通常需要找到出问题的行来识别和处理缺
> +陷。在本章中，我们将参考“Oops”来了解需要分析的各种堆栈跟踪。
> +
> +如果内核是用 ``CONFIG_DEBUG_INFO`` 编译的，那么可以使用文件：
> +`scripts/decode_stacktrace.sh` 。
> +
> +链接的模块
> +-----------
> +
> +受到污染或正在加载/卸载的模块用“（…）”标记，污染标志在
> +`Documentation/admin-guide/tainted-kernels.rst` 文件中进行了描述，“正在被加
> +载”用“+”标注，“正在被卸载”用“-”标注。
> +
> +
> +Oops消息在哪？
> +---------------
> +
> +通常，Oops文本由klogd从内核缓冲区读取，然后交给 ``syslogd`` ，后者将其写入
> +syslog文件，通常是 ``/var/log/messages`` （取决于 ``/etc/syslog.conf`` ）。
> +在使用systemd的系统上，它也可以由 ``journald`` 守护进程存储，并通过运行
> +``journalctl`` 命令进行访问。
> +
> +有时 ``klogd`` 会挂掉，这种情况下您可以运行 ``dmesg > file`` 从内核缓冲区
> +读取数据并保存它。或者您可以 ``cat /proc/kmsg > file`` 文件，但是您必须适时
> +中断以停止传输，因为 ``kmsg`` 是一个“永无止境的文件”。
> +
> +如果机器严重崩溃，无法输入命令或磁盘不可用，那还有三个选项：
> +
> +(1) 手动复制屏幕上的文本，并在机器重新启动后输入。很难受，但这是突然崩溃下
> +    唯一的选择。或者你可以用数码相机拍下屏幕——虽然不那么好，但总比什么都没
> +    有好。如果消息滚动超出控制台顶部，使用更高分辨率（例如 ``vga=791`` ）
> +    引导启动将允许您阅读更多文本。（警告：这需要 ``vesafb`` ，因此对“早期”
> +    的Oppses没有帮助）
> +
> +(2) 从串口终端启动（参见
> +    :ref:`Documentation/admin-guide/serial-console.rst <serial_console>` ），
> +    在另一台机器上运行空调制解调器然后用你喜爱的通信程序捕获输出。

"空调制解调器" is easy to be misunderstood, maybe just skip the 'null' word?

All others LGTM.

Thanks!
