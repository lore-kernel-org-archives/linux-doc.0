Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C08C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 09:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbiJTJ33 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 05:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiJTJ3C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 05:29:02 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 453B51C19FD
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 02:29:00 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8BxWtjbFFFjAwEBAA--.3168S3;
        Thu, 20 Oct 2022 17:28:59 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxn+DYFFFjmNgBAA--.7770S3;
        Thu, 20 Oct 2022 17:28:57 +0800 (CST)
Message-ID: <8fb7cb49-2a4f-649a-d344-143a15b23a72@loongson.cn>
Date:   Thu, 20 Oct 2022 17:28:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH V2 0/3] docs/zh_CN: core-api: Add some translations for
 the "Data structures" section(Part 2)
Content-Language: en-US
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
References: <cover.1666171735.git.zhoubinbin@loongson.cn>
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <cover.1666171735.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Cxn+DYFFFjmNgBAA--.7770S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFy5AFy5Kr45uw13Cr4rKrg_yoW8tFWDpF
        43Kr1fJ3ZrAF17Cws7WrsrJF15JayxW3yqgw17Xwn3AFs8tryFyrsYyryYgFWUZr92qF1S
        vr43Kr98ua4jyrJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
        AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
        1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I
        6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
        0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
        cSsGvfC2KfnxnUUI43ZEXa7IU8EeHDUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/19/22 17:32, Binbin Zhou wrote:
> Hi all:
>
> As a continuation of the previous patchset
> (https://lore.kernel.org/all/cover.1660881950.git.zhoubinbin@loongson.cn/),
> this patchset contains the Chinese translations of the remaining three files.
>
> As follows:
>
> this_cpu_ops.rst
> timekeeping.rst
> errseq.rst
>
> So far, the docs for section "Data structures and low-level utilities" of
> the core-api has been translated completely.
>
> Thanks.
>
> Changes since V1:
> - Take Xiangcheng's advices, thanks.
>
> Details:
> https://lore.kernel.org/all/Y0wsWoI+BXXCuRbF@bobwxc.mipc/
> https://lore.kernel.org/all/Y02EcgD3E0%2FlML5H@bobwxc.mipc/
>
> Binbin Zhou (3):
>    docs/zh_CN: core-api: Add this_cpu_ops Chinese translation
>    docs/zh_CN: core-api: Add timekeeping Chinese translation
>    docs/zh_CN: core-api: Add errseq Chinese translation

Hi Binbin,


When I apply your patch set, git says:


git am 
./v2_20221019_zhoubinbin_docs_zh_cn_core_api_add_some_translations_for_the_data_structures_section_par.mbx
Applying: docs/zh_CN: core-api: Add timekeeping Chinese translation
error: patch failed: Documentation/translations/zh_CN/core-api/index.rst:49
error: Documentation/translations/zh_CN/core-api/index.rst: patch does 
not apply
Patch failed at 0001 docs/zh_CN: core-api: Add timekeeping Chinese 
translation
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


Thanks,

Yanteng

>
>   .../translations/zh_CN/core-api/errseq.rst    | 145 +++++++++
>   .../translations/zh_CN/core-api/index.rst     |   5 -
>   .../zh_CN/core-api/this_cpu_ops.rst           | 285 ++++++++++++++++++
>   .../zh_CN/core-api/timekeeping.rst            | 177 +++++++++++
>   4 files changed, 607 insertions(+), 5 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
>   create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
>   create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping.rst
>

