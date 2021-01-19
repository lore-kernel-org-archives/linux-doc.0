Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8D9C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 03:04:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E1F920782
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 03:04:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388503AbhASDEA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 22:04:00 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38024 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388359AbhASDD6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Jan 2021 22:03:58 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxu+TmSwZgyiYHAA--.11835S2;
        Tue, 19 Jan 2021 11:03:04 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Lars Poeschel <poeschel@lemonage.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] docs: iio: Correct a typo
Date:   Tue, 19 Jan 2021 11:03:20 +0800
Message-Id: <20210119030320.2860870-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxu+TmSwZgyiYHAA--.11835S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFW3Jr4rWw1DZF1rKrW5GFg_yoWfWrg_u3
        Wvqa1fJa1Uua40vr4UAF4Fqwn5ur18Gr1kCw4DArs0ga4UtanxGFZrK3sxZrs5WFW7urn5
        GFWqqrWaqr9xtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbzkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
        I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
        xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
        jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
        0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
        7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are two EP9312, one of them should be 9315

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/iio/ep93xx_adc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/iio/ep93xx_adc.rst b/Documentation/iio/ep93xx_adc.rst
index 4fd8dea3f6b8..0af0e9040457 100644
--- a/Documentation/iio/ep93xx_adc.rst
+++ b/Documentation/iio/ep93xx_adc.rst
@@ -13,7 +13,7 @@ touchscreen/ADC module.
 ====================
 
 Numbering scheme for channels 0..4 is defined in EP9301 and EP9302 datasheets.
-EP9307, EP9312 and EP9312 have 3 channels more (total 8), but the numbering is
+EP9307, EP9312 and EP9315 have 3 channels more (total 8), but the numbering is
 not defined. So the last three are numbered randomly, let's say.
 
 Assuming ep93xx_adc is IIO device0, you'd find the following entries under
-- 
2.27.0

