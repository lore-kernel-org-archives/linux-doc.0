Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69330C32771
	for <linux-doc@archiver.kernel.org>; Mon, 26 Sep 2022 14:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbiIZOlI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Sep 2022 10:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiIZOkg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 10:40:36 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 412E7DE0CD
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 06:01:29 -0700 (PDT)
Received: from [192.168.100.120] (unknown [112.20.108.220])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OGiojFjqD4iAA--.62165S3;
        Mon, 26 Sep 2022 21:01:26 +0800 (CST)
Message-ID: <f5d792cb-133b-189d-4aaf-8523eaae6b44@loongson.cn>
Date:   Mon, 26 Sep 2022 21:01:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH V3 0/4] docs/zh_CN: core-api: Add some translations for
 the "Data structures" section(Part 1)
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org
References: <cover.1660881950.git.zhoubinbin@loongson.cn>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <cover.1660881950.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx5OGiojFjqD4iAA--.62165S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW8Wr1xurW8ur13WFy5twb_yoW8tF47pF
        4Skw1fW3WDAF1xCrs3WryxuFyUJFWfW3s0gw4Iqwn3ZrZ5AF4FvrsYyryavrWfJr92gF1F
        vr43KrWDu34jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
        IFyTuYvjfUYOJ5UUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ping?

在 2022/8/19 14:28, Binbin Zhou 写道:
> Hi all:
> 
> I have translated all the docs for section "Data structures and low-level utilities"
> of the core-api, and I plan to split them into two patchset submissions.
> 
> This patchset contains the following files:
> 
> idr.rst
> circular-buffers.rst
> generic-radix-tree.rst
> packing.rst
> 
> For more details, please see TODOLIST in core-api/index.rst.
> 
> Thanks.
> 
> Changes since v2:
> 1. Rebase patchset on jc/docs-next.
> 2. Take Alex's advices about circular-buffers.rst, thanks.
> 
> Details:
> https://lore.kernel.org/all/CAJy-AmkZFxNPL52M6Yuxu9prgdPSxkaO-FUs=tfY7ZB=YHoR1w@mail.gmail.com/
> 
> Changes since v1:
> 1. Rebase patchset on jc/docs-next.
> 2. Take the advices of Xiangcheng and Yanteng, thanks.
> 
> Details:
> https://lore.kernel.org/all/6904a35b-6425-36af-66a0-ecd0a222a15f@loongson.cn/
> https://lore.kernel.org/all/35121f9b-4dd7-4114-9242-caf2dcfa8f9c@loongson.cn/
> https://lore.kernel.org/all/86118122-2885-78e3-677e-b3a6ca47a20c@loongson.cn/
> https://lore.kernel.org/all/YtKy+z+iSA6D8r9m@bobwxc.mipc/
> https://lore.kernel.org/all/YtLF2g8fQdi4%2FaKQ@bobwxc.mipc/
> 
> Binbin Zhou (4):
>    docs/zh_CN: core-api: Add idr Chinese translation
>    docs/zh_CN: core-api: Add circular-buffers Chinese translation
>    docs/zh_CN: core-api: Add generic-radix-tree Chinese translation
>    docs/zh_CN: core-api: Add packing Chinese translation
> 
>   .../zh_CN/core-api/circular-buffers.rst       | 210 ++++++++++++++++++
>   .../zh_CN/core-api/generic-radix-tree.rst     |  23 ++
>   .../translations/zh_CN/core-api/idr.rst       |  80 +++++++
>   .../translations/zh_CN/core-api/index.rst     |   8 +-
>   .../translations/zh_CN/core-api/packing.rst   | 160 +++++++++++++
>   5 files changed, 477 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/circular-buffers.rst
>   create mode 100644 Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
>   create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst
>   create mode 100644 Documentation/translations/zh_CN/core-api/packing.rst
> 

