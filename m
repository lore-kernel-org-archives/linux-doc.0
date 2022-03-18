Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68ECC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 18 Mar 2022 10:11:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbiCRKNM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Mar 2022 06:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiCRKNL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Mar 2022 06:13:11 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DA08A2CC346
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 03:11:50 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.139])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxLxPhWjRiMoALAA--.9602S3;
        Fri, 18 Mar 2022 18:11:47 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 1/3] docs/zh_CN/damon: update outdated term 'regions update interval'
Date:   Fri, 18 Mar 2022 18:12:56 +0800
Message-Id: <b996bc4cc9db7517d9938c19edbab86313d0dc7f.1647598049.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1647598049.git.siyanteng@loongson.cn>
References: <cover.1647598049.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxLxPhWjRiMoALAA--.9602S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuryUKry3JF4fKFW5Aw1UJrb_yoWrXw15pr
        92k34Ika42yFyUXr4xKryUKF18GF97Ga17KF95Cw1xXFsIyrZ5trWkKayjkF97XFyxAFW7
        CrW0kFW8ta4Ivw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw1l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5UUUUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since 072fd1b47215("Docs/damon: update outdated term 'regions update interval'")
use update interval,zh_CN should use 更新间隔, so let's sync update.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/admin-guide/mm/damon/usage.rst      | 6 +++---
 Documentation/translations/zh_CN/vm/damon/design.rst       | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
index 5d7533347216..10b9ac7664d3 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
@@ -46,7 +46,7 @@ DAMON导出了八个文件, ``attrs``, ``target_ids``, ``init_regions``,
 属性
 ----
 
-用户可以通过读取和写入 ``attrs`` 文件获得和设置 ``采样间隔`` 、 ``聚集间隔`` 、 ``区域更新间隔``
+用户可以通过读取和写入 ``attrs`` 文件获得和设置 ``采样间隔`` 、 ``聚集间隔`` 、 ``更新间隔``
 以及监测目标区域的最小/最大数量。要详细了解监测属性，请参考 `:doc:/vm/damon/design` 。例如，
 下面的命令将这些值设置为5ms、100ms、1000ms、10和1000，然后再次检查::
 
@@ -108,8 +108,8 @@ DAMON导出了八个文件, ``attrs``, ``target_ids``, ``init_regions``,
             1   20      40
             1   50      100" > init_regions
 
-请注意，这只是设置了初始的监测目标区域。在虚拟内存监测的情况下，DAMON会在一个 ``区域更新间隔``
-后自动更新区域的边界。因此，在这种情况下，如果用户不希望更新的话，应该把 ``区域的更新间隔`` 设
+请注意，这只是设置了初始的监测目标区域。在虚拟内存监测的情况下，DAMON会在一个 ``更新间隔``
+后自动更新区域的边界。因此，在这种情况下，如果用户不希望更新的话，应该把 ``更新间隔`` 设
 置得足够大。
 
 
diff --git a/Documentation/translations/zh_CN/vm/damon/design.rst b/Documentation/translations/zh_CN/vm/damon/design.rst
index 05f66c02740a..46128b77c2b3 100644
--- a/Documentation/translations/zh_CN/vm/damon/design.rst
+++ b/Documentation/translations/zh_CN/vm/damon/design.rst
@@ -77,7 +77,7 @@ DAMON目前为物理和虚拟地址空间提供了基元的实现。下面两个
 ========================
 
 下面四个部分分别描述了DAMON的核心机制和五个监测属性，即 ``采样间隔`` 、 ``聚集间隔`` 、
-``区域更新间隔`` 、 ``最小区域数`` 和 ``最大区域数`` 。
+``更新间隔`` 、 ``最小区域数`` 和 ``最大区域数`` 。
 
 
 访问频率监测
@@ -135,5 +135,6 @@ DAMON的输出显示了在给定的时间内哪些页面的访问频率是多少
 监测目标地址范围可以动态改变。例如，虚拟内存可以动态地被映射和解映射。物理内存可以被
 热插拔。
 
-由于在某些情况下变化可能相当频繁，DAMON检查动态内存映射的变化，并仅在用户指定的时间
-间隔（ ``区域更新间隔`` ）内将其应用于抽象的目标区域。
+由于在某些情况下变化可能相当频繁，DAMON允许监控操作检查动态变化，包括内存映射变化，
+并仅在用户指定的时间间隔（ ``更新间隔`` ）中的每个时间段，将其应用于监控操作相关的
+数据结构，如抽象的监控目标内存区。
\ No newline at end of file
-- 
2.27.0

