Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC364C19F2B
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 05:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiG1FFn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 01:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiG1FFl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 01:05:41 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A66F201AF
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 22:05:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT+MZGeJiBDk+AA--.39258S3;
        Thu, 28 Jul 2022 13:05:30 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH v2 1/8] Docs/zh_CN: Update the translation of iio_configfs to 5.19-rc8
Date:   Thu, 28 Jul 2022 13:05:56 +0800
Message-Id: <1c0ae3e0932d813d41de666c1c65379786e79ba6.1658983157.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658983157.git.siyanteng@loongson.cn>
References: <cover.1658983157.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT+MZGeJiBDk+AA--.39258S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1kXF45uF1furykCr1UGFg_yoW5GFy7pF
        sIvr9rtFyUGF18Za18KFyUGryrG3WSya17JFW8G3WrJ3s8Aryqkr4Dta18trykW392qFW7
        K34xCF98uwnrCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUUMq2tUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

update to commit dafcf4ed8392 ("iio: hrtimer: Allow
sub Hz granularity").

c1d82dbcb0a6 ("docs: iio: fix example formatting").

Remove some useless spaces.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/iio/iio_configfs.rst          | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/iio/iio_configfs.rst b/Documentation/translations/zh_CN/iio/iio_configfs.rst
index d5460e951804..eccaf1c644b4 100644
--- a/Documentation/translations/zh_CN/iio/iio_configfs.rst
+++ b/Documentation/translations/zh_CN/iio/iio_configfs.rst
@@ -37,10 +37,10 @@ configfs轻松配置的对象（例如：设备，触发器）。
 3. 软件触发器
 =============
 
-IIO默认configfs组之一是“触发器”组。 挂载configfs后可以自动访问它，并且可
+IIO默认configfs组之一是“触发器”组。挂载configfs后可以自动访问它，并且可
 以在/config/iio/triggers下找到。
 
-IIO软件触发器为创建多种触发器类型提供了支持。 通常在include/linux/iio
+IIO软件触发器为创建多种触发器类型提供了支持。通常在include/linux/iio
 /sw_trigger.h：中的接口下将新的触发器类型实现为单独的内核模块：
 ::
 
@@ -76,10 +76,10 @@ IIO软件触发器为创建多种触发器类型提供了支持。 通常在incl
 	.ops = &iio_trig_sample_ops,
   };
 
-module_iio_sw_trigger_driver(iio_trig_sample);
+  module_iio_sw_trigger_driver(iio_trig_sample);
 
-每种触发器类型在/config/iio/triggers下都有其自己的目录。 加载iio-trig-sample
-模块将创建“ trig-sample”触发器类型目录/config/iio/triggers/trig-sample.
+每种触发器类型在/config/iio/triggers下都有其自己的目录。加载iio-trig-sample
+模块将创建“trig-sample”触发器类型目录/config/iio/triggers/trig-sample.
 
 我们支持以下中断源（触发器类型）
 
@@ -102,3 +102,5 @@ module_iio_sw_trigger_driver(iio_trig_sample);
 ----------------------------
 
 "hrtimer”触发器类型没有来自/config dir的任何可配置属性。
+它确实引入了触发目录的sampling_frequency属性。
+该属性以Hz为单位设置轮询频率，精度为mHz。
\ No newline at end of file
-- 
2.31.1

