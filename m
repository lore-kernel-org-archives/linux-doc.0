Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E4BC43334
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jun 2022 15:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348988AbiFOPey (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jun 2022 11:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349528AbiFOPex (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 11:34:53 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 29899275D8
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 08:34:51 -0700 (PDT)
Received: from [172.20.10.6] (unknown [117.136.68.182])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr98U_Kli7RlEAA--.21634S3;
        Wed, 15 Jun 2022 23:34:48 +0800 (CST)
Subject: Re: [PATCH 0/9] docs/zh_CN: core-api: Update the partial translation
 to 5.19-rc2
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, bobwxc@yeah.net
References: <cover.1655258291.git.zhoubinbin@loongson.cn>
From:   Yanteng Si <siyanteng@loongson.cn>
Message-ID: <0ae5b49b-8756-4b6c-0ec8-6cba35d5a5a5@loongson.cn>
Date:   Wed, 15 Jun 2022 23:34:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cover.1655258291.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr98U_Kli7RlEAA--.21634S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFy8XFWkuFyrurWfWFWktFb_yoW8Cw48pr
        WfKr93X3WkCa45uw1xWrWkAFyrZF4UX390kw4IqwnIywn5KryUtr4Ut34Ygay8Jr92vr1F
        yr43trWDuayUAr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6ryrMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
        IFyTuYvjfUnwZ2UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/6/15 下午5:24, Binbin Zhou wrote:
> This series of patches updat the contents of the translated files
Hi Binbin

what is "updat"? ;)

BTW,
Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.

--CC bobwxc@yeah.net

Thanks,
Yanteng
> in the core-api directory to 5.19-rc2.
> 
> In the next step, I plan to translate the untranslated documents
> in the core-api directory. For details, see TODOLIST in the
> core-api/index.rst file.
> 
> Binbin Zhou (9):
>    docs/zh_CN: core-api: Update the translation of cachetlb.rst to
>      5.19-rc2
>    docs/zh_CN: core-api: Update the translation of cpu_hotplug.rst to
>      5.19-rc2
>    docs/zh_CN: core-api: Update the translation of irq/irq-domain.rst to
>      5.19-rc2
>    docs/zh_CN: core-api: Update the translation of kernel-api.rst to
>      5.19-rc2
>    docs/zh_CN: core-api: Update the translation of mm-api.rst to 5.19-rc2
>    docs/zh_CN: core-api: Update the translation of printk-basics.rst to
>      5.19-rc2
>    docs/zh_CN: core-api: Update the translation of printk-format.rst to
>      5.19-rc2
>    docs/zh_CN: core-api: Update the translation of workqueue.rst to
>      5.19-rc2
>    docs/zh_CN: core-api: Update the translation of xarray.rst to 5.19-rc2
> 
>   .../translations/zh_CN/core-api/cachetlb.rst  |   6 +
>   .../zh_CN/core-api/cpu_hotplug.rst            | 435 +++++++++++++++---
>   .../zh_CN/core-api/irq/irq-domain.rst         |  22 +-
>   .../zh_CN/core-api/kernel-api.rst             |   3 +
>   .../translations/zh_CN/core-api/mm-api.rst    |  23 +-
>   .../zh_CN/core-api/printk-basics.rst          |   3 +-
>   .../zh_CN/core-api/printk-formats.rst         |  13 +-
>   .../translations/zh_CN/core-api/workqueue.rst |  21 +-
>   .../translations/zh_CN/core-api/xarray.rst    |   4 +-
>   9 files changed, 459 insertions(+), 71 deletions(-)
> 

