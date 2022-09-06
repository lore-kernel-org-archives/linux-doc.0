Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97253C54EE9
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 08:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbiIFI1b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 04:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbiIFI1a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 04:27:30 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 10090696E5
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 01:27:27 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.163])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OFpBBdjpJMSAA--.10497S2;
        Tue, 06 Sep 2022 16:27:22 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v2 0/5] docs/zh_CN: Add some dt and PCI Chinese translation
Date:   Tue,  6 Sep 2022 16:26:46 +0800
Message-Id: <cover.1662449105.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx5OFpBBdjpJMSAA--.10497S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4Dtry7tF4fCFW5uFy8Zrb_yoW8Gw1rp3
        Z7Kr93W3WxAF12gw4fWF4UZr1fAa4xuw4rKFy2qwn5tryktryrtrWDt34q9a43Jr1xXFy5
        XFs5KrWDWrWjyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r43
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUeHUDDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
* Modify some words under Alex's and Xiangcheng's advice.

v1:
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

