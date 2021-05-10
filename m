Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAA1C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 04:40:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F054613DC
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 04:40:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhEJElV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 00:41:21 -0400
Received: from [43.250.32.171] ([43.250.32.171]:10208 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S230023AbhEJElV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 May 2021 00:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=/0xRrxMhvFXI92a54dLkvhBTL7O2KlHLsvfzk
        HvGGXk=; b=aY7ODTwTxCjLTQlnrvN8V4ikFJMGfII6Y6uvXykP8vwEwvb95Cduv
        sbj4/aQIcHihIw0+22IHVyrlFiMfDikCBbLyEiQYNOd1xG426bnK9X/arzIfWjsY
        m0gybgVHott2I4fuiYPHk+/LH7kxEJusyh4dpffwxkc5/dLkwTWIZo=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAHz0EhuZhgkl0iAA--.20686S2;
        Mon, 10 May 2021 12:40:04 +0800 (CST)
Date:   Mon, 10 May 2021 12:40:02 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Sanjeev Gupta <ghane0@gmail.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        Alex Shi <alexs@kernel.org>, Wang Wenhu <wenhu.wang@vivo.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Chucheng Luo <luochucheng@vivo.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] Documentation/translations/zh_CN: switch LWN links to
 https
Message-ID: <20210510044001.GA4949@bobwxc.top>
References: <baeb58d3.AUUAAC5sESEAAAAAAAAAAKAiBvYAAAAAAMcAAAAAAA6qeABgmKYT@mailjet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baeb58d3.AUUAAC5sESEAAAAAAAAAAKAiBvYAAAAAAMcAAAAAAA6qeABgmKYT@mailjet.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgAHz0EhuZhgkl0iAA--.20686S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw1rKF43Cw15XrW3ZrWDurg_yoWxury7pF
        97Kr93G3WIkwn0k348Gr4xXF18K3W7Ca9xGr17t3ZxXrnYka1UtrZxK3s8KFZ3Xry0kayr
        XF4F9rW5XrWIvFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqvb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMx
        AIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
        67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
        IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
        14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
        W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3U
        UUUU=
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 10, 2021 at 11:17:31AM +0800, Sanjeev Gupta wrote:
> Links have been checked to ensure that the old and new URL
> return the same page.
> 
> Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
> ---
>  Documentation/translations/zh_CN/filesystems/debugfs.rst      | 2 +-
>  Documentation/translations/zh_CN/process/2.Process.rst        | 2 +-
>  Documentation/translations/zh_CN/process/3.Early-stage.rst    | 2 +-
>  Documentation/translations/zh_CN/process/4.Coding.rst         | 2 +-
>  Documentation/translations/zh_CN/process/7.AdvancedTopics.rst | 2 +-
>  Documentation/translations/zh_CN/process/8.Conclusion.rst     | 4 ++--
>  6 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/filesystems/debugfs.rst b/Documentation/translations/zh_CN/filesystems/debugfs.rst
> index 822c4d42fdf9..4a519f78fe04 100644
> --- a/Documentation/translations/zh_CN/filesystems/debugfs.rst
> +++ b/Documentation/translations/zh_CN/filesystems/debugfs.rst
> @@ -218,4 +218,4 @@ dentry值可以为NULL或错误值，在这种情况下，不会有任何文件
>  如果将对应顶层目录的dentry传递给以上函数，则该目录下的整个层次结构将会被删除。
>  
>  注释：
> -[1] http://lwn.net/Articles/309298/
> +[1] https://lwn.net/Articles/309298/
> diff --git a/Documentation/translations/zh_CN/process/2.Process.rst b/Documentation/translations/zh_CN/process/2.Process.rst
> index 229629e305ca..12d028e36936 100644
> --- a/Documentation/translations/zh_CN/process/2.Process.rst
> +++ b/Documentation/translations/zh_CN/process/2.Process.rst
> @@ -358,7 +358,7 @@ Andrew Morton 为有抱负的内核开发人员提供了如下建议
>  	机器上始终完美运行”。通常的方法是和其他人一起解决问题（这可能需
>  	要坚持！），但就是如此——这是内核开发的一部分。
>  
> -(http://lwn.net/articles/283982/)
> +(https://lwn.net/articles/283982/)
404
should be
(https://lwn.net/Articles/283982/)

>  
>  在没有明显问题需要解决的情况下，通常建议开发人员查看当前的回归和开放缺陷
>  列表。从来都不缺少需要解决的问题；通过解决这些问题，开发人员将从该过程获得
> diff --git a/Documentation/translations/zh_CN/process/3.Early-stage.rst b/Documentation/translations/zh_CN/process/3.Early-stage.rst
> index de53dd12e911..47e145ce6883 100644
> --- a/Documentation/translations/zh_CN/process/3.Early-stage.rst
> +++ b/Documentation/translations/zh_CN/process/3.Early-stage.rst
> @@ -44,7 +44,7 @@
>  	试图向这些人传达用户需求是浪费时间。他们太“聪明”了，根本听不到少数
>  	人的话。
>  
> -（http://lwn.net/articles/131776/）
> +（https://lwn.net/articles/131776/）
404
should be
（https://lwn.net/Articles/131776/）

>  
>  实际情况却是不同的；与特定模块相比，内核开发人员更关心系统稳定性、长期维护
>  以及找到问题的正确解决方案。这个故事的寓意是把重点放在问题上——而不是具体的
> diff --git a/Documentation/translations/zh_CN/process/4.Coding.rst b/Documentation/translations/zh_CN/process/4.Coding.rst
> index 94f7f866f103..b277895c6d2d 100644
> --- a/Documentation/translations/zh_CN/process/4.Coding.rst
> +++ b/Documentation/translations/zh_CN/process/4.Coding.rst
> @@ -149,7 +149,7 @@ Linus对这个问题给出了最佳答案:
>  	所以我们不会通过引入新问题来修复错误。这种方式是靠不住的，没人知道
>  	是否真的有进展。是前进两步、后退一步，还是前进一步、后退两步？
>  
> -（http://lwn.net/articles/243460/）
> +（https://lwn.net/articles/243460/）
404
should be
（https://lwn.net/Articles/243460/）

>  
>  特别不受欢迎的一种回归类型是用户空间ABI的任何变化。一旦接口被导出到用户空间，
>  就必须无限期地支持它。这一事实使得用户空间接口的创建特别具有挑战性：因为它们
> diff --git a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
> index 6d0dadae13b1..668f4fe680f0 100644
> --- a/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
> +++ b/Documentation/translations/zh_CN/process/7.AdvancedTopics.rst
> @@ -98,7 +98,7 @@ Git提供了一些强大的工具，可以让您重写开发历史。一个不
>     你可以给我发补丁，但当我从你那里拉取一个Git补丁时，我需要知道你清楚
>     自己在做什么，我需要能够相信事情而 *无需* 手动检查每个单独的更改。
>  
> -（http://lwn.net/articles/224135/）。
> +（https://lwn.net/articles/224135/）。
404
should be
（https://lwn.net/Articles/224135/）。

>  
>  为了避免这种情况，请确保给定分支中的所有补丁都与相关主题紧密相关；“驱动程序
>  修复”分支不应更改核心内存管理代码。而且，最重要的是，不要使用Git树来绕过
> diff --git a/Documentation/translations/zh_CN/process/8.Conclusion.rst b/Documentation/translations/zh_CN/process/8.Conclusion.rst
> index 71c3e30efc6f..b0b6cc270aec 100644
> --- a/Documentation/translations/zh_CN/process/8.Conclusion.rst
> +++ b/Documentation/translations/zh_CN/process/8.Conclusion.rst
> @@ -27,7 +27,7 @@
>  不同的网站在各个细节层次上讨论内核开发。本文作者想谦虚地建议用 https://lwn.net/
>  作为来源；有关许多特定内核主题的信息可以通过以下网址的 LWN 内核索引找到：
>  
> -  http://lwn.net/kernel/index/
> +  https://lwn.net/kernel/index/
404 should be
  https://lwn.net/Kernel/Index/

>  
>  除此之外，内核开发人员的一个宝贵资源是：
>  
> @@ -38,7 +38,7 @@
>  关于内核开发有很多书：
>  
>    《Linux设备驱动程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）
> -  线上版本在 http://lwn.net/kernel/ldd3/
> +  线上版本在 https://lwn.net/kernel/ldd3/
404
should be
  线上版本在 https://lwn.net/Kernel/LDD3/
>  
>    《Linux内核设计与实现》（Robert Love）
>  
> -- 
> 2.30.2

Thanks!

Wu X.C.

