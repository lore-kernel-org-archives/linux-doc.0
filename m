Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F033C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 30 Dec 2021 02:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbhL3C5N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Dec 2021 21:57:13 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:60596 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234683AbhL3C5N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Dec 2021 21:57:13 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0V0HsN6B_1640833023;
Received: from e18g09479.et15sqa.tbsite.net(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0V0HsN6B_1640833023)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 30 Dec 2021 10:57:11 +0800
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
To:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     linux-doc@vger.kernel.org,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [PATCH] docs/zh_CN: Update and fix a couple of typos
Date:   Thu, 30 Dec 2021 10:57:02 +0800
Message-Id: <20211230025702.186158-1-shile.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.33.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to the original README.rst and fix some typos.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 .../translations/zh_CN/admin-guide/README.rst         | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index 980eb20521cf..d20949e8bf6f 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -133,7 +133,7 @@ Linux内核5.x版本 <http://kernel.org/>
 
    即使只升级一个小版本，也不要跳过此步骤。每个版本中都会添加新的配置选项，
    如果配置文件没有按预定设置，就会出现奇怪的问题。如果您想以最少的工作量
-   将现有配置升级到新版本，请使用 ``makeoldconfig`` ，它只会询问您新配置
+   将现有配置升级到新版本，请使用 ``make oldconfig`` ，它只会询问您新配置
    选项的答案。
 
  - 其他配置命令包括::
@@ -161,7 +161,7 @@ Linux内核5.x版本 <http://kernel.org/>
      "make ${PLATFORM}_defconfig"
                         使用arch/$arch/configs/${PLATFORM}_defconfig中
                         的默认选项值创建一个./.config文件。
-                        用“makehelp”来获取您体系架构中所有可用平台的列表。
+                        用“make help”来获取您体系架构中所有可用平台的列表。
 
      "make allyesconfig"
                         通过尽可能将选项值设置为“y”，创建一个
@@ -197,9 +197,10 @@ Linux内核5.x版本 <http://kernel.org/>
      "make localyesconfig" 与localmodconfig类似，只是它会将所有模块选项转换
                            为内置（=y）。你可以同时通过LMC_KEEP保留模块。
 
-     "make kvmconfig"   为kvm客体内核支持启用其他选项。
+     "make kvm_guest.config"
+                        为kvm客户机内核支持启用其他选项。
 
-     "make xenconfig"   为xen dom0客体内核支持启用其他选项。
+     "make xen.config"  为xen dom0客户机内核支持启用其他选项。
 
      "make tinyconfig"  配置尽可能小的内核。
 
@@ -229,7 +230,7 @@ Linux内核5.x版本 <http://kernel.org/>
    请注意，您仍然可以使用此内核运行a.out用户程序。
 
  - 执行 ``make`` 来创建压缩内核映像。如果您安装了lilo以适配内核makefile，
-   那么也可以进行 ``makeinstall`` ，但是您可能需要先检查特定的lilo设置。
+   那么也可以进行 ``make install`` ，但是您可能需要先检查特定的lilo设置。
 
    实际安装必须以root身份执行，但任何正常构建都不需要。
    无须徒然使用root身份。
-- 
2.33.0.rc2

