Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB0AC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 17 May 2022 03:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238146AbiEQDZJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 May 2022 23:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbiEQDZH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 23:25:07 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7EA45539
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 20:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=/8vfYOiAMKVI1M/MLTGFb7KPdV3be7y5Ohdqd
        l4dAbg=; b=XkfOWGZ7Q8rmiy+BTNUYv90tIIFmU0FO7ASLeKQPdgnAA7xyCBJB+
        5p4vCuGEppoNrJ76vIT/I5DSCjetIHL6bSgoJ36L0/i3xoh9Y/H/45Nc3ALTm4SW
        lwJfvvJVA0XhYLVeLj9kAHXAm5Cq3n+VxDL5OlNl4HgNo4yYoJEUmo=
Received: from bobwxc.mipc (unknown [120.242.69.144])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgB3Y4uDFYNiRJaVAA--.28888S2;
        Tue, 17 May 2022 11:24:53 +0800 (CST)
Date:   Tue, 17 May 2022 11:24:49 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v3 1/2] docs/zh_CN: add vm page_migration translation
Message-ID: <YoMVgfGXMSyLdCPK@bobwxc.mipc>
References: <cover.1652713779.git.siyanteng@loongson.cn>
 <2c85bf903171b61d69aea0345913c89a740f1a86.1652713779.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c85bf903171b61d69aea0345913c89a740f1a86.1652713779.git.siyanteng@loongson.cn>
X-CM-TRANSID: GiKnCgB3Y4uDFYNiRJaVAA--.28888S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFW5CrWrWFWfGryrurWxJFb_yoWrXr4UpF
        92kayIga17Aw1jyw12gF4UXw15JryfWF47Gr1kW3Waqwn3XFZFkr45KasFvrZ3Jry0kFWU
        XF4rKF429r10k3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_Gr4l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUjU3ktUUUUU==
X-Originating-IP: [120.242.69.144]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 16, 2022 at 11:56:31PM +0800, Yanteng Si wrote:
> Translate .../vm/page_migration.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/vm/index.rst |   2 +-
>  .../translations/zh_CN/vm/page_migration.rst  | 228 ++++++++++++++++++
>  2 files changed, 229 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/page_migration.rst
> 
> diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
> index a1c6d529b6ff..551f58bf7b55 100644
> --- a/Documentation/translations/zh_CN/vm/index.rst
> +++ b/Documentation/translations/zh_CN/vm/index.rst
> @@ -36,6 +36,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
>     numa
>     overcommit-accounting
>     page_frags
> +   page_migration
>     page_owner
>     page_table_check
>     remap_file_pages
> @@ -47,7 +48,6 @@ TODOLIST:
>  * arch_pgtable_helpers
>  * free_page_reporting
>  * hugetlbfs_reserv
> -* page_migration
>  * slub
>  * transhuge
>  * unevictable-lru
> diff --git a/Documentation/translations/zh_CN/vm/page_migration.rst b/Documentation/translations/zh_CN/vm/page_migration.rst
> new file mode 100644
> index 000000000000..417861fbc3e0
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_migration.rst
[...]
> +
> +非LRU页面迁移
> +=============
> +
> +尽管迁移最初的目的是为了减少NUMA的内存访问延迟，但压缩也使用迁移来创建高阶页面。
> +
> +目前实现的问题是，它被设计为只迁移*LRU*页。然而，有一些潜在的非LRU页面可以在驱动中
> +被迁移，例如，zsmalloc，virtio-balloon页面。
> +
> +对于virtio-balloon页面，迁移代码路径的某些部分已经被钩住，并添加了virtio-balloon
> +的特定函数来拦截迁移逻辑。这对一个驱动来说太特殊了，所以其他想让自己的页面可移动的驱
> +动就必须在迁移路径中添加自己的特定钩子。
> +
> +为了克服这个问题，VM支持非LRU页面迁移，它为非LRU可移动页面提供了通用函数，而在迁移
> +路径中没有特定的驱动程序钩子。
> +
> +如果一个驱动程序想让它的页面可移动，它应该定义三个函数，这些函数是
> +struct address_space_operations的函数指针。
> +
> +1. ``bool (*isolate_page) (struct page *page, isolate_mode_t mode);``
> +
> +   VM对驱动的isolate_page()函数的期望是，如果驱动成功隔离了该页，则返回×true×。

*true*

> +   返回true后，VM会将该页标记为PG_isolated，这样多个CPU的并发隔离就会跳过该
> +   页进行隔离。如果驱动程序不能隔离该页，它应该返回*false*。
> +
> [...]
> +
> +   * PG_isolated
> +
> +     为了防止几个CPU同时进行隔离，VM在lock_page()下将隔离的页面标记为PG_isolated。
> +     因此，如果一个CPU遇到PG_isolated非LRU可移动页面，它可以跳过它。驱动程序不需要
> +     操作这个标志，因为VM会自动设置/清除它。请记住，如果驱动程序看到PG_isolated页，
> +     这意味着VM已经被虚拟机隔离，所以它不应该碰page.lru字段。PG_isolated标志与

Emmm, I mean 虚拟机 -> VM
Sorry for the miss leading, seemis only strict mono font could understand
it.

Please fix these two, and pick my review-by :)

Thanks,
	Wu

> +     PG_reclaim标志是同义的，所以驱动程序不应该为自己的目的使用PG_isolated。
> +
> [...]

