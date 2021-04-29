Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D8AC433ED
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 03:33:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F03E1613E8
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 03:33:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhD2Ddz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 23:33:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50600 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236837AbhD2Ddx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Apr 2021 23:33:53 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH+_kKIpgjVwPAA--.8366S2;
        Thu, 29 Apr 2021 11:32:54 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
Subject: [PATCH 0/3] docs/zh_CN: add parisc Chinese documents
Date:   Thu, 29 Apr 2021 11:33:32 +0800
Message-Id: <cover.1619665430.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH+_kKIpgjVwPAA--.8366S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr48tFyUZryUKryDKF45Wrg_yoW3WFgEy3
        WkXFWFyr47XF97KFW8CF1UZF409F40g34kXFn8ta98Jw4kWrWDGr1vqas3uay5XFsxCry3
        GFWkGr1SqrnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbxAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
        ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
        xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0J
        UdHUDUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This set translates Documentation/parisc/* into Chinese.

Yanteng Si (3):
  docs/zh_CN: add parisc index translation
  docs/zh_CN: add parisc debugging.rst translation
  docs/zh_CN: add parisc registers.rst translation

 Documentation/translations/zh_CN/index.rst    |   1 +
 .../translations/zh_CN/parisc/debugging.rst   |  41 +++++
 .../translations/zh_CN/parisc/index.rst       |  28 ++++
 .../translations/zh_CN/parisc/registers.rst   | 153 ++++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/parisc/debugging.rst
 create mode 100644 Documentation/translations/zh_CN/parisc/index.rst
 create mode 100644 Documentation/translations/zh_CN/parisc/registers.rst

-- 
2.27.0

