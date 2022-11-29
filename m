Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20147C43217
	for <linux-doc@archiver.kernel.org>; Tue, 29 Nov 2022 01:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234994AbiK2Byp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Nov 2022 20:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234773AbiK2Byn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Nov 2022 20:54:43 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3DF4B3C6EB
        for <linux-doc@vger.kernel.org>; Mon, 28 Nov 2022 17:54:42 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8Axz+thZoVjNOEBAA--.4444S3;
        Tue, 29 Nov 2022 09:54:41 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+JeZoVjwtkdAA--.10346S2;
        Tue, 29 Nov 2022 09:54:39 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     chenhuacai@kernel.org, corbet@lwn.net, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, kernel@xen0n.name,
        wu.xiangcheng@linux.dev, jiaxun.yang@flygoat.com,
        liuyun@loongson.cn, linux-doc@vger.kernel.org,
        loongarch@lists.linux.dev, siyanteng01@gmail.com
Subject: [PATCH v4 0/2] docs/LoongArch: Add English and Chinese versions of booting
Date:   Tue, 29 Nov 2022 09:51:59 +0800
Message-Id: <cover.1669686320.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+JeZoVjwtkdAA--.10346S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoWruw1DJF1fWryfXw1kGw45KFg_yoWfWrcEvF
        n7J3y0y3y7GF15Jayvqr47JF93uF40y3Z0yFn0grW8GF90y39xWF97X3s8ury0qFWDZwn8
        CrZ7trySyF12gjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
        y7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
        AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
        6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
        xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
        w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
        6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
        0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
        c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
        v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
        07jFE__UUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:
LoongArch supports ACPI and FDT, so let's add the description of fdt.

v3:
* Add a description about boot parameters (a0=efi_boot a1=cmdline a2=systemtable),
  and then rename the file to booting.rst.
* remove some blank line.

v2:
* Fix magic start address.
* res14 -> res4.

v1:
* Add boot image header.
* Translate boot-image-header into Chinese.

Yanteng Si (2):
  docs/LoongArch: Add booting
  docs/zh_CN: Add booting Chinese translation

 Documentation/loongarch/booting.rst           | 89 +++++++++++++++++++
 Documentation/loongarch/index.rst             |  1 +
 .../translations/zh_CN/loongarch/booting.rst  | 86 ++++++++++++++++++
 .../translations/zh_CN/loongarch/index.rst    |  1 +
 4 files changed, 177 insertions(+)
 create mode 100644 Documentation/loongarch/booting.rst
 create mode 100644 Documentation/translations/zh_CN/loongarch/booting.rst

-- 
2.31.1

