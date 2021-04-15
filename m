Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082D0C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 06:37:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C251161152
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 06:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhDOGiU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 02:38:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58364 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229503AbhDOGiU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 02:38:20 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxCco+33dgfjIIAA--.15262S2;
        Thu, 15 Apr 2021 14:37:51 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v5 0/4] docs/zh_CN: add core api and openrisc translation
Date:   Thu, 15 Apr 2021 14:38:34 +0800
Message-Id: <20210415063838.2341827-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxCco+33dgfjIIAA--.15262S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrW3uFy5uF1fAF1UKr1rZwb_yoWDXwc_u3
        Wvva9YyrW7Jas7tFs5GF4jyr40vFsYg3s09an0qrWDCa4DArs8Xr1vq3ZYvF4UJFZIvrya
        krykXryrCrnrtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI
        42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUb2Nt3UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series of patches translates core-api/irq/* and openrisc/* into
Chinese

v1 -> v2:

Modify some words under Xiangcheng Wu's suggestion. Thanks for his rewiew!

v2 -> v3:

keep the signs number equal to the title char under Alex's suggestion. 
Thanks for his rewiew!

v3 -> v4:

Add Xiangcheng Wu's review sign to 0002、0003 and 0008; Thanks for his rewiew!

v4 -> v5:

Split 8-11 into a separate series


Yanteng Si(11):
docs/zh_CN: add openrisc openrisc_port.rst translation
docs/zh_CN: add openrisc todo.rst translation
docs/zh_CN: add openrisc index.rst translation
docs/zh_CN: add translation to zh_CN index

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
Documentation/translations/zh_CN/index.rst                  |   1 +++++
Documentation/translations/zh_CN/openrisc/index.rst         |  30 +++++
Documentation/translations/zh_CN/openrisc/openrisc_port.rst | 124 +++++
Documentation/translations/zh_CN/openrisc/todo.rst          |  20 +++++
4 files changed, 175 insertions(+)

