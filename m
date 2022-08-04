Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3C0C00144
	for <linux-doc@archiver.kernel.org>; Thu,  4 Aug 2022 06:37:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbiHDGha (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Aug 2022 02:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiHDGh3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Aug 2022 02:37:29 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 014A73AB31
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 23:37:26 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax6swcaetiwk4FAA--.7084S3;
        Thu, 04 Aug 2022 14:37:17 +0800 (CST)
Message-ID: <42fd6e8d-62ab-911c-f84c-9b47eacd9b4d@loongson.cn>
Date:   Thu, 4 Aug 2022 14:37:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] docs/zh_CN: Update two file in zh_CN/process to 5.19
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>,
        Alex Shi <alexs@kernel.org>
Cc:     Li Yang <leoyang.li@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>
References: <cover.1659406843.git.bobwxc@email.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <cover.1659406843.git.bobwxc@email.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax6swcaetiwk4FAA--.7084S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFykXr4kWFyrZFy7XFy8Grg_yoW5ArWDpF
        yDK3Z7GF4UJF15uws7Gr48CrW0vF48Ca9Fyay7K34rXr15uw1xtr98trs8G3yqgr1rA3W7
        Zr4agFWDua4j9FJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv
        67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
        9x07jcR6wUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/8/2 11:02, Wu XiangCheng 写道:
> Hi all,
>
> This set of patches aims to
>
>      * Update zh_CN/process/email-clients.rst to 5.19
>      * Update zh_CN/process/submitting-patches.rst to 5.19
>
> Also deep clean these two files. I highly recommend to use a word-by-word
> diff viewer like VS Code or Emacs to read such big diff files.
>
> Note:
>
>      Due to the special content of PATCH 2/2, checkpatch.pl will give a
>      lot of warnings and errors, all be fine.

However, with some build warnings.  :)


sphinx_2.4.4 ❯ make htmldocs

...

linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:18: 
WARNING: undefined label: cn_submittingpatches (if the link has no 
caption the label must precede a section header)
linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:153: 
WARNING: undefined label: cn_submittingpatches (if the link has no 
caption the label must precede a section header)
linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:163: 
WARNING: undefined label: cn_submittingpatches (if the link has no 
caption the label must precede a section header)
linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:168: 
WARNING: undefined label: cn_submittingpatches (if the link has no 
caption the label must precede a section header)
linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:179: 
WARNING: undefined label: cn_submittingpatches (if the link has no 
caption the label must precede a section header)
linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:197: 
WARNING: undefined label: cn_email_clients (if the link has no caption 
the label must precede a section header)
linux-next/Documentation/translations/zh_CN/process/8.Conclusion.rst:17: 
WARNING: undefined label: cn_submittingpatches (if the link has no 
caption the label must precede a section header)
linux-next/Documentation/translations/zh_CN/process/howto.rst:98: 
WARNING: undefined label: cn_submittingpatches (if the link has no 
caption the label must precede a section header)
linux-next/Documentation/translations/zh_CN/process/howto.rst:334: 
WARNING: undefined label: cn_submittingpatches (if the link has no 
caption the label must precede a section header)
linux-next/Documentation/translations/zh_CN/process/submit-checklist.rst:14: 
WARNING: undefined label: cn_submittingpatches (if the link has no 
caption the label must precede a section header)


Thanks,

Yanteng

>
> Thanks!
>
> Wu XiangCheng (2):
>    docs/zh_CN: Update zh_CN/process/email-clients.rst to 5.19
>    docs/zh_CN: Update zh_CN/process/submitting-patches.rst to 5.19
>
>   .../zh_CN/process/email-clients.rst           | 263 ++++---
>   .../zh_CN/process/submitting-patches.rst      | 701 +++++++++---------
>   2 files changed, 518 insertions(+), 446 deletions(-)
>

