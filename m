Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374D4C43217
	for <linux-doc@archiver.kernel.org>; Mon, 28 Nov 2022 09:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiK1J4q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Nov 2022 04:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiK1J4o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Nov 2022 04:56:44 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 069ED193F3
        for <linux-doc@vger.kernel.org>; Mon, 28 Nov 2022 01:56:41 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8Cx6+rYhYRj7qMBAA--.3896S3;
        Mon, 28 Nov 2022 17:56:40 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxn+DWhYRjXzUdAA--.9071S2;
        Mon, 28 Nov 2022 17:56:39 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     chenhuacai@kernel.org, corbet@lwn.net, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, kernel@xen0n.name,
        wu.xiangcheng@linux.dev, jiaxun.yang@flygoat.com,
        liuyun@loongson.cn, linux-doc@vger.kernel.org,
        loongarch@lists.linux.dev, siyanteng01@gmail.com
Subject: [PATCH v3 0/2] docs/LoongArch: Add English and Chinese versions of booting
Date:   Mon, 28 Nov 2022 17:54:01 +0800
Message-Id: <cover.1669628226.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxn+DWhYRjXzUdAA--.9071S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7XF1kCF18AF4fXF18ZF48Xrb_yoW3urbEvF
        n7J3y0y3y7GF15Jayvqr47JF93uF40k3Z0yFn0grW8G3Z0y39xWr97X3s8ury0qFWDZ3s8
        CrZ7tr1SyFnFgjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
        A7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
        AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
        6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
        xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
        e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
        kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
        1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
        6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
        0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
        cSsGvfC2KfnxnUUI43ZEXa7IU0b6pPUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

