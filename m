Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DD8ECAAD3
	for <linux-doc@archiver.kernel.org>; Thu,  1 Sep 2022 11:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbiIALQW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Sep 2022 07:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbiIALQT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 07:16:19 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C29E81243EA
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 04:16:16 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx32t4lBBjyrkOAA--.58656S2;
        Thu, 01 Sep 2022 19:16:09 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v1 0/5] docs/zh_CN: Add some dt and PCI Chinese translation
Date:   Thu,  1 Sep 2022 19:15:41 +0800
Message-Id: <cover.1662022757.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32t4lBBjyrkOAA--.58656S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4Dtry7tF4fCFW5uFy8Zrb_yoW8GryDpF
        n7Kr93W3WfAr12gw4fWF4UZr13Ja4xuw45Kry2qwn5tryktryrtrWDt34q9a43Jr1xXFy5
        XFs5KryUWrWjyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUka14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUqZXOUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translation some dt documentation into Chinese.
Translation .../PCI/acpi-info.rst into Chinese.


Yanteng Si (5):
  docs/zh_CN: add PCI acpi-info translation
  docs/zh_CN: add dt changesets translation
  docs/zh_CN: add dt dynamic-resolution-notes translation
  docs/zh_CN: add dt overlay-notes translation
  docs/zh_CN: add dt kernel-api translation

 .../translations/zh_CN/PCI/acpi-info.rst      | 139 +++++++++++++++++
 .../translations/zh_CN/PCI/index.rst          |  13 +-
 .../zh_CN/devicetree/changesets.rst           |  37 +++++
 .../devicetree/dynamic-resolution-notes.rst   |  31 ++++
 .../translations/zh_CN/devicetree/index.rst   |  13 +-
 .../zh_CN/devicetree/kernel-api.rst           |  58 ++++++++
 .../zh_CN/devicetree/overlay-notes.rst        | 140 ++++++++++++++++++
 Documentation/translations/zh_CN/index.rst    |   2 +-
 8 files changed, 415 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/acpi-info.rst
 create mode 100644 Documentation/translations/zh_CN/devicetree/changesets.rst
 create mode 100644 Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
 create mode 100644 Documentation/translations/zh_CN/devicetree/kernel-api.rst
 create mode 100644 Documentation/translations/zh_CN/devicetree/overlay-notes.rst

-- 
2.31.1

