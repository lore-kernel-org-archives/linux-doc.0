Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169B6C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 18 May 2022 03:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiERDZJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 May 2022 23:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiERDZI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 23:25:08 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B6A6EC5D
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 20:25:03 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id q4so558245plr.11
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 20:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=w0bgf612SplFc6qE4KIbXTRROjvqJO4EIjvM5MOQR5c=;
        b=W9XhHQYbU3DYxo7b48NIMPVHehohsVVpOu47Zl3u/iBPYaeRH+E1uEMRGtedsN0KzL
         zb+K4D8minMCbIeu3uh0CaLuKW6q/2zbNuPV9Ag607JmoUjLRMMSGR7zvgZnj/f0qlPT
         hByf3kARlSRBkI7X1U+5cpJtgsDt3t6ymEBcRpm2hWV0MeG894famtd8zo+Y3zNaAZrf
         N4HGnBxrwceqxrDZkaxWjyJwkeix7YB1pL7lM2TI60etbJSYEB/f3JDUEmgaf/jQWO+s
         Vu/lUmsteY4UPOb6l2FAntudR3sjE2A7fA0ew5AEoiMLkYSOnteOmm8XA6/HUpyLFwtX
         bSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w0bgf612SplFc6qE4KIbXTRROjvqJO4EIjvM5MOQR5c=;
        b=NiTBYyPy2gMk5/m6sEnrX3FUhmjpwbJrtgw9veXDniMYpfH3PNjrsjmzCo0Ctzl3wd
         HaIpdRvwnglnEpxUhFwQmnwgkNVLfaPuiJvxg9J8dF1ENFBz5QKlQAXkhjQgPaV+feLh
         VnctV9VxPzAJqKdm/raq0SxRKGG6u0E3PCa3dPlyF7JREh0a9oetdxBQQyeMeIWPIjon
         2R4sNWJcX2Hv56wkG1SKRQJORnNNO/P1R2YE9wzhbaElz//Rlc0zkygaggCr7Bk//zlU
         oiAzTffLEfC5pKJGZhDQI/c4UCfYXgIHqhbu25t0tL1MqspKejNJX88cZ0Nw3N42+qFb
         zOgA==
X-Gm-Message-State: AOAM530pwKH7qsedEIPDptlZ61SX9+kVt2gqWXkRpJRg5za5qPSmigWA
        wd5VmRhVhLRbEa6mxT1a9oI=
X-Google-Smtp-Source: ABdhPJx18HXC8C7A4ZbgHSeBvKA16PIFqCb9Zoj+XhmhuILFSLu3beo20FFU9HM2dvmoTNBBt9UP+Q==
X-Received: by 2002:a17:902:e84c:b0:161:a1a0:73fa with SMTP id t12-20020a170902e84c00b00161a1a073famr7113734plg.125.1652844302445;
        Tue, 17 May 2022 20:25:02 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id f14-20020a65590e000000b003c6a71b2ab7sm324046pgu.46.2022.05.17.20.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 20:25:01 -0700 (PDT)
Message-ID: <404a6c8d-11b0-252f-9bed-a7a0e8804dd7@gmail.com>
Date:   Wed, 18 May 2022 11:24:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] docs/zh_CN: Update translation of reporting-issues.rst
 to 5.18
Content-Language: en-US
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <cover.1652792205.git.bobwxc@email.cn>
 <YoRlDOUl/eg+h/Cc@bobwxc.mipc>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <YoRlDOUl/eg+h/Cc@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 5/18/22 11:16, Wu XiangCheng wrote:
> Update zh_CN/admin-guide/reporting-issues.rst to newest English version
> 
> commit 247097e2bbff4 ("docs: reporting-issues.rst: link new document
>                        about regressions")
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>

Thanks
Alex
> ---
> v2:
> * merge former two patches together
> * give the commit a better name
> 
> v1:
> <https://lore.kernel.org/linux-doc/cover.1652792205.git.bobwxc@email.cn/T/#t>
> 
>  .../zh_CN/admin-guide/reporting-issues.rst    | 125 +++++++++++-------
>  1 file changed, 79 insertions(+), 46 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst b/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
> index 6b4988da2c5a..59e51e3539b4 100644
> --- a/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
> @@ -1,13 +1,6 @@
>  .. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0)
> -..
> -   If you want to distribute this text under CC-BY-4.0 only, please use 'The
> -   Linux kernel developers' for author attribution and link this as source:
> -   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/admin-guide/reporting-issues.rst
> -..
> -   Note: Only the content of this RST file as found in the Linux kernel sources
> -   is available under CC-BY-4.0, as versions of this text that were processed
> -   (for example by the kernel's build system) might contain content taken from
> -   files which use a more restrictive license.
> +.. See the bottom of this file for additional redistribution information.
> +
>  
>  .. include:: ../disclaimer-zh_CN.rst
>  
> @@ -29,7 +22,9 @@
>  请搜索 `LKML内核邮件列表 <https://lore.kernel.org/lkml/>`_ 和
>  `Linux稳定版邮件列表 <https://lore.kernel.org/stable/>`_ 存档中匹配的报告并
>  加入讨论。如果找不到匹配的报告，请安装该系列的最新版本。如果它仍然出现问题，
> -报告给稳定版邮件列表（stable@vger.kernel.org）。
> +请报告给稳定版邮件列表（stable@vger.kernel.org）并抄送回归邮件列表
> +（regressions@lists.linux.dev）；理想情况下，还可以抄送维护者和相关子系统的
> +邮件列表。
>  
>  在所有其他情况下，请尽可能猜测是哪个内核部分导致了问题。查看MAINTAINERS文件，
>  了解开发人员希望如何得知问题，大多数情况下，报告问题都是通过电子邮件和抄送
> @@ -46,9 +41,10 @@
>  有使用附加模块）。还要确保它是在一个正常的环境中构建和运行，并且在问题发生
>  之前没有被污染（tainted）。
>  
> -在编写报告时，要涵盖与问题相关的所有信息，如使用的内核和发行版。在碰见回归时，
> -尝试给出引入它的更改的提交ID，二分可以找到它。如果您同时面临Linux内核的多个
> -问题，请分别报告每个问题。
> +当你同时面临Linux内核的多个问题时，请分别报告。在编写报告时，要涵盖与问题
> +相关的所有信息，如使用的内核和发行版。如果碰见回归，请把报告抄送回归邮件列表
> +（regressions@lists.linux.dev）。也请试试用二分法找出源头；如果成功找到，请
> +在报告中写上它的提交ID并抄送sign-off-by链中的所有人。
>  
>  一旦报告发出，请回答任何出现的问题，并尽可能地提供帮助。这包括通过不时重新
>  测试新版本并发送状态更新来推动进展。
> @@ -156,9 +152,10 @@
>     存在问题，因为问题可能已经在那里被修复了。如果您第一次发现供应商内核的问题，
>     请检查已知最新版本的普通构建是否可以正常运行。
>  
> - * 向Linux稳定版邮件列表发送一个简短的问题报告(stable@vger.kernel.org)。大致
> -   描述问题，并解释如何复现。讲清楚首个出现问题的版本和最后一个工作正常的版本。
> -   然后等待进一步的指示。
> + * 向Linux稳定版邮件列表发送一个简短的问题报告（stable@vger.kernel.org）并抄送
> +   Linux回归邮件列表（regressions@lists.linux.dev）；如果你怀疑是由某子系统
> +   引起的，请抄送其维护人员和子系统邮件列表。大致描述问题，并解释如何复现。
> +   讲清楚首个出现问题的版本和最后一个工作正常的版本。然后等待进一步的指示。
>  
>  下面的参考章节部分详细解释了这些步骤中的每一步。
>  
> @@ -296,17 +293,14 @@ Linus Torvalds和主要的Linux内核开发人员希望看到一些问题尽快
>  报告过程中有一些“高优先级问题”的处理略有不同。有三种情况符合条件:回归、安全
>  问题和非常严重的问题。
>  
> -如果在旧版本的Linux内核中工作的东西不能在新版本的Linux内核中工作，或者某种
> -程度上在新版本的Linux内核中工作得更差，那么你就需要处理“回归”。因此，当一个
> -在Linux 5.7中表现良好的WiFi驱动程序在5.8中表现不佳或根本不能工作时，这是一
> -种回归。如果应用程序在新的内核中出现不稳定的现象，这也是一种回归，这可能是
> -由于内核和用户空间之间的接口（如procfs和sysfs）发生不兼容的更改造成的。显著
> -的性能降低或功耗增加也可以称为回归。但是请记住:新内核需要使用与旧内核相似的
> -配置来构建（参见下面如何实现这一点）。这是因为内核开发人员在实现新特性时有
> -时无法避免不兼容性；但是为了避免回归，这些特性必须在构建配置期间显式地启用。
> +如果某个应用程序或实际用例在原先的Linux内核上运行良好，但在使用类似配置编译的
> +较新版本上效果更差、或者根本不能用，那么你就需要处理回归问题。
> +Documentation/admin-guide/reporting-regressions.rst 对此进行了更详细的解释。
> +它还提供了很多你可能想知道的关于回归的其他信息；例如，它解释了如何将您的问题
> +添加到回归跟踪列表中，以确保它不会被忽略。
>  
>  什么是安全问题留给您自己判断。在继续之前，请考虑阅读
> -“Documentation/translations/zh_CN/admin-guide/security-bugs.rst”，
> +Documentation/translations/zh_CN/admin-guide/security-bugs.rst ，
>  因为它提供了如何最恰当地处理安全问题的额外细节。
>  
>  当发生了完全无法接受的糟糕事情时，此问题就是一个“非常严重的问题”。例如，
> @@ -390,7 +384,7 @@ Linux内核破坏了它处理的数据或损坏了它运行的硬件。当内核
>  核未被污染，那么它应该以“Not infected”结束；如果你看到“Tainted:”且后跟一些
>  空格和字母，那就被污染了。
>  
> -如果你的内核被污染了，请阅读“Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst”
> +如果你的内核被污染了，请阅读 Documentation/translations/zh_CN/admin-guide/tainted-kernels.rst
>  以找出原因。设法消除污染因素。通常是由以下三种因素之一引起的：
>  
>   1. 发生了一个可恢复的错误（“kernel Oops”），内核污染了自己，因为内核知道在
> @@ -591,7 +585,8 @@ ath10k@lists.infradead.org”，将引导您到ath10k邮件列表的信息页，
>  搜索引擎，并添加类似“site:lists.infadead.org/pipermail/ath10k/”这
>  样的搜索条件，这会把结果限制在该链接中的档案。
>  
> -也请进一步搜索网络、LKML和bugzilla.kernel.org网站。
> +也请进一步搜索网络、LKML和bugzilla.kernel.org网站。如果你的报告需要发送到缺陷
> +跟踪器中，那么您可能还需要检查子系统的邮件列表存档，因为可能有人只在那里报告了它。
>  
>  有关如何搜索以及在找到匹配报告时如何操作的详细信息，请参阅上面的“搜索现有报告
>  （第一部分）”。
> @@ -802,10 +797,10 @@ Linux 首席开发者 Linus Torvalds 认为 Linux 内核永远不应恶化，这
>  重现它。
>  
>  有一个叫做“二分”的过程可以来寻找变化，这在
> -“Documentation/translations/zh_CN/admin-guide/bug-bisect.rst”文档中进行了详细
> +Documentation/translations/zh_CN/admin-guide/bug-bisect.rst 文档中进行了详细
>  的描述，这个过程通常需要你构建十到二十个内核镜像，每次都尝试在构建下一个镜像
>  之前重现问题。是的，这需要花费一些时间，但不用担心，它比大多数人想象的要快得多。
> -多亏了“binary search二进制搜索”，这将引导你在源代码管理系统中找到导致回归的提交。
> +多亏了“binary search二分搜索”，这将引导你在源代码管理系统中找到导致回归的提交。
>  一旦你找到它，就在网上搜索其主题、提交ID和缩短的提交ID（提交ID的前12个字符）。
>  如果有的话，这将引导您找到关于它的现有报告。
>  
> @@ -823,10 +818,10 @@ Linux 首席开发者 Linus Torvalds 认为 Linux 内核永远不应恶化，这
>  当处理回归问题时，请确保你所面临的问题真的是由内核引起的，而不是由其他东西
>  引起的，如上文所述。
>  
> -在整个过程中，请记住：只有当旧内核和新内核的配置相似时，问题才算回归。最好
> -的方法是：把配置文件（``.config``）从旧的工作内核直接复制到你尝试的每个新内
> -核版本。之后运行 ``make oldnoconfig`` 来调整它以适应新版本的需要，而不启用
> -任何新的功能，因为那些功能也可能导致回归。
> +在整个过程中，请记住：只有当旧内核和新内核的配置相似时，问题才算回归。这可以
> +通过 ``make olddefconfig`` 来实现，详细解释参见
> +Documentation/admin-guide/reporting-regressions.rst ；它还提供了大量其他您
> +可能希望了解的有关回归的信息。
>  
>  
>  撰写并发送报告
> @@ -959,11 +954,19 @@ Linux 首席开发者 Linus Torvalds 认为 Linux 内核永远不应恶化，这
>  **非常严重的缺陷** ：确保在主题或工单标题以及第一段中明显标出 severeness
>  （非常严重的）。
>  
> -**回归** ：如果问题是一个回归，请在邮件的主题或缺陷跟踪器的标题中添加
> -[REGRESSION]。如果您没有进行二分，请至少注明您测试的最新主线版本（比如 5.7）
> -和出现问题的最新版本（比如 5.8）。如果您成功地进行了二分，请注明导致回归
> -的提交ID和主题。也请添加该变更的作者到你的报告中；如果您需要将您的缺陷提交
> -到缺陷跟踪器中，请将报告以私人邮件的形式转发给他，并注明报告提交地点。
> +**回归** ：报告的主题应以“[REGRESSION]”开头。
> +
> +如果您成功用二分法定位了问题，请使用引入回归之更改的标题作为主题的第二部分。
> +请在报告中写明“罪魁祸首”的提交ID。如果未能成功二分，请在报告中讲明最后一个
> +正常工作的版本（例如5.7）和最先发生问题的版本（例如5.8-rc1）。
> +
> +通过邮件发送报告时，请抄送Linux回归邮件列表（regressions@lists.linux.dev）。
> +如果报告需要提交到某个web追踪器，请继续提交；并在提交后，通过邮件将报告转发
> +至回归列表；抄送相关子系统的维护人员和邮件列表。请确保报告是内联转发的，不要
> +把它作为附件。另外请在顶部添加一个简短的说明，在那里写上工单的网址。
> +
> +在邮寄或转发报告时，如果成功二分，需要将“罪魁祸首”的作者添加到收件人中；同时
> +抄送signed-off-by链中的每个人，您可以在提交消息的末尾找到。
>  
>  **安全问题** ：对于这种问题，你将必须评估：如果细节被公开披露，是否会对其他
>  用户产生短期风险。如果不会，只需按照所述继续报告问题。如果有此风险，你需要
> @@ -980,7 +983,7 @@ Linux 首席开发者 Linus Torvalds 认为 Linux 内核永远不应恶化，这
>  报告，请将报告的文本转发到这些地址；但请在报告的顶部加上注释，表明您提交了
>  报告，并附上工单链接。
>  
> -更多信息请参见“Documentation/translations/zh_CN/admin-guide/security-bugs.rst”。
> +更多信息请参见 Documentation/translations/zh_CN/admin-guide/security-bugs.rst 。
>  
>  
>  发布报告后的责任
> @@ -1173,14 +1176,18 @@ FLOSS 问题报告的人看，询问他们的意见。同时征求他们关于
>  报告回归
>  ~~~~~~~~~~
>  
> -    *向Linux稳定版邮件列表发送一个简短的问题报告(stable@vger.kernel.org)。
> -    大致描述问题，并解释如何复现。讲清楚首个出现问题的版本和最后一个工作正常
> -    的版本。然后等待进一步的指示。*
> +    *向Linux稳定版邮件列表发送一个简短的问题报告(stable@vger.kernel.org)并
> +    抄送Linux回归邮件列表（regressions@lists.linux.dev）；如果你怀疑是由某
> +    子系统引起的，请抄送其维护人员和子系统邮件列表。大致描述问题，并解释如
> +    何复现。讲清楚首个出现问题的版本和最后一个工作正常的版本。然后等待进一
> +    步的指示。*
>  
>  当报告在稳定版或长期支持内核线内发生的回归（例如在从5.10.4更新到5.10.5时），
> -一份简短的报告足以快速报告问题。因此只需要粗略的描述。
> +一份简短的报告足以快速报告问题。因此只需向稳定版和回归邮件列表发送粗略的描述；
> +不过如果你怀疑某子系统导致此问题的话，请一并抄送其维护人员和子系统邮件列表，
> +这会加快进程。
>  
> -但是请注意，如果您能够指明引入问题的确切版本，这将对开发人员有很大帮助。因此
> +请注意，如果您能够指明引入问题的确切版本，这将对开发人员有很大帮助。因此
>  如果有时间的话，请尝试使用普通内核找到该版本。让我们假设发行版发布Linux内核
>  5.10.5到5.10.8的更新时发生了故障。那么按照上面的指示，去检查该版本线中的最新
>  内核，比如5.10.9。如果问题出现，请尝试普通5.10.5，以确保供应商应用的补丁不会
> @@ -1190,7 +1197,9 @@ FLOSS 问题报告的人看，询问他们的意见。同时征求他们关于
>  前一段基本粗略地概述了“二分”方法。一旦报告出来，您可能会被要求做一个正确的
>  报告，因为它允许精确地定位导致问题的确切更改（然后很容易被恢复以快速修复问题）。
>  因此如果时间允许，考虑立即进行适当的二分。有关如何详细信息，请参阅“对回归的
> -特别关照”部分和文档“Documentation/translations/zh_CN/admin-guide/bug-bisect.rst”。
> +特别关照”部分和文档 Documentation/translations/zh_CN/admin-guide/bug-bisect.rst 。
> +如果成功二分的话，请将“罪魁祸首”的作者添加到收件人中；同时抄送所有在
> +signed-off-by链中的人，您可以在提交消息的末尾找到。
>  
>  
>  “报告仅在旧内核版本线中发生的问题”的参考
> @@ -1207,7 +1216,7 @@ FLOSS 问题报告的人看，询问他们的意见。同时征求他们关于
>  
>  即使是微小的、看似明显的代码变化，有时也会带来新的、完全意想不到的问题。稳
>  定版和长期支持内核的维护者非常清楚这一点，因此他们只对这些内核进行符合
> -“Documentation/translations/zh_CN/process/stable-kernel-rules.rst”中所列出的
> +Documentation/translations/zh_CN/process/stable-kernel-rules.rst 中所列出的
>  规则的修改。
>  
>  复杂或有风险的修改不符合条件，因此只能应用于主线。其他的修复很容易被回溯到
> @@ -1333,3 +1342,27 @@ FLOSS 问题报告的人看，询问他们的意见。同时征求他们关于
>  向 Linux 内核开发者报告问题是很难的：这个文档的长度和复杂性以及字里行间的内
>  涵都说明了这一点。但目前就是这样了。这篇文字的主要作者希望通过记录现状来为
>  以后改善这种状况打下一些基础。
> +
> +
> +..
> +   end-of-content
> +..
> +   This English version of this document is maintained by Thorsten Leemhuis
> +   <linux@leemhuis.info>. If you spot a typo or small mistake, feel free to
> +   let him know directly and he'll fix it. For translation problems, please
> +   contact with translators. You are free to do the same in a mostly informal
> +   way if you want to contribute changes to the text, but for copyright
> +   reasons please CC linux-doc@vger.kernel.org and "sign-off" your
> +   contribution as Documentation/process/submitting-patches.rst outlines in
> +   the section "Sign your work - the Developer's Certificate of Origin".
> +..
> +   This text is available under GPL-2.0+ or CC-BY-4.0, as stated at the top
> +   of the file. If you want to distribute this text under CC-BY-4.0 only,
> +   please use "The Linux kernel developers" for author attribution and link
> +   this as source:
> +   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/admin-guide/reporting-issues.rst
> +..
> +   Note: Only the content of this RST file as found in the Linux kernel sources
> +   is available under CC-BY-4.0, as versions of this text that were processed
> +   (for example by the kernel's build system) might contain content taken from
> +   files which use a more restrictive license.
> 
> base-commit: b86f46d5ce3e7497930be931a9a9e57480f0baff
