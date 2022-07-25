Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBEFC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 09:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234375AbiGYJUc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 05:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbiGYJUb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 05:20:31 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 100A2627A
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 02:20:28 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9JPYN5igls2AA--.13314S5;
        Mon, 25 Jul 2022 17:20:20 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH 3/8] Docs/zh_CN: Update the translation of sparse to 5.19-rc8
Date:   Mon, 25 Jul 2022 17:20:48 +0800
Message-Id: <4019a3a01f63f6486cae1708d699d48edfd4c793.1658740151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1658740151.git.siyanteng@loongson.cn>
References: <cover.1658740151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9JPYN5igls2AA--.13314S5
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr45Cw4xXr43Ar1DAFyxKrg_yoWftwb_Cw
        s2qF4vyF13tryxWF4rCr1rXr4xZF4Fkry8Crsav398Gw45GFZxG3Wvg3ZY9F4UWF47ur1Y
        k3ykZr1FvrnrJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbyxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY02
        0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
        v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUekucDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit179fd6ba3bac ("Documentation/sparse:
 add hints about __CHECKER__")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/dev-tools/sparse.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/translations/zh_CN/dev-tools/sparse.rst b/Documentation/translations/zh_CN/dev-tools/sparse.rst
index 556282437aad..0664c634bc4f 100644
--- a/Documentation/translations/zh_CN/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_CN/dev-tools/sparse.rst
@@ -106,3 +106,5 @@ __releases  - 指定的锁在函数进入时被持有，但在退出时不被持
 
 make 的可选变量 CHECKFLAGS 可以用来向 sparse 工具传递参数。编译系统会自
 动向 sparse 工具传递 -Wbitwise 参数。
+
+注意sparse定义了__CHECKER__预处理器符号。
\ No newline at end of file
-- 
2.31.1

