Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27063C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 09:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbiGYJUd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 05:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbiGYJUb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 05:20:31 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0FC176275
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 02:20:28 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9JPYN5igls2AA--.13314S3;
        Mon, 25 Jul 2022 17:20:18 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH 1/8] Docs/zh_CN: Update the translation of iio_configfs to 5.19-rc8
Date:   Mon, 25 Jul 2022 17:20:46 +0800
Message-Id: <0e21e41f54f83c40b96e35d89f47003a2d3a60fc.1658740151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658740151.git.siyanteng@loongson.cn>
References: <cover.1658740151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9JPYN5igls2AA--.13314S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1kXF45uF1furykCr1UGFg_yoW5GryfpF
        sIvr9rtFyUGF18Aa18KFyUGryrG3WSya1UJFW8G3WrJ3s8Aryqkr4Dta18trykW392qay7
        K34xCF98u3ZrCaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUj-BMDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

update to commit dafcf4ed8392 ("iio: hrtimer: Allow
sub Hz granularity").

c1d82dbcb0a6 ("docs: iio: fix example formatting").

Remove some useless spaces.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

