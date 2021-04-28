Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A5EC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 10:06:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFDFD61424
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 10:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238942AbhD1KHa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 06:07:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41816 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238456AbhD1KH3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Apr 2021 06:07:29 -0400
Received: from localhost.localdomain (unknown [112.3.197.94])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb8urM4lgDPUOAA--.24784S2;
        Wed, 28 Apr 2021 18:06:37 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     maennich@google.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org, bobwxc@email.cn,
        chenhuacai@kernel.org, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/core-api: Consistent code style
Date:   Wed, 28 Apr 2021 18:07:20 +0800
Message-Id: <20210428100720.1076276-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb8urM4lgDPUOAA--.24784S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur47ZrWDCr1xZw4DCFWxWFg_yoWrZF18pF
        sayrZaqa9rXry2k3W8Xr17Aw17WaykXF4Iqr1kX34xA3Z8Wa4DAry2ywn8uFyUGr18Aa4j
        yFWjyFWUJa4DZa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
        r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

all `example` in this file should be replaced with ``example``.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/core-api/symbol-namespaces.rst | 26 ++++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index 9b76337f6756..5ad9e0abe42c 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -43,14 +43,14 @@ exporting of kernel symbols to the kernel symbol table, variants of these are
 available to export symbols into a certain namespace: EXPORT_SYMBOL_NS() and
 EXPORT_SYMBOL_NS_GPL(). They take one additional argument: the namespace.
 Please note that due to macro expansion that argument needs to be a
-preprocessor symbol. E.g. to export the symbol `usb_stor_suspend` into the
-namespace `USB_STORAGE`, use::
+preprocessor symbol. E.g. to export the symbol ``usb_stor_suspend`` into the
+namespace ``USB_STORAGE``, use::
 
 	EXPORT_SYMBOL_NS(usb_stor_suspend, USB_STORAGE);
 
-The corresponding ksymtab entry struct `kernel_symbol` will have the member
-`namespace` set accordingly. A symbol that is exported without a namespace will
-refer to `NULL`. There is no default namespace if none is defined. `modpost`
+The corresponding ksymtab entry struct ``kernel_symbol`` will have the member
+``namespace`` set accordingly. A symbol that is exported without a namespace will
+refer to ``NULL``. There is no default namespace if none is defined. ``modpost``
 and kernel/module.c make use the namespace at build time or module load time,
 respectively.
 
@@ -64,7 +64,7 @@ and EXPORT_SYMBOL_GPL() macro expansions that do not specify a namespace.
 
 There are multiple ways of specifying this define and it depends on the
 subsystem and the maintainer's preference, which one to use. The first option
-is to define the default namespace in the `Makefile` of the subsystem. E.g. to
+is to define the default namespace in the ``Makefile`` of the subsystem. E.g. to
 export all symbols defined in usb-common into the namespace USB_COMMON, add a
 line like this to drivers/usb/common/Makefile::
 
@@ -96,7 +96,7 @@ using a statement like::
 
 	MODULE_IMPORT_NS(USB_STORAGE);
 
-This will create a `modinfo` tag in the module for each imported namespace.
+This will create a ``modinfo`` tag in the module for each imported namespace.
 This has the side effect, that the imported namespaces of a module can be
 inspected with modinfo::
 
@@ -113,7 +113,7 @@ metadata definitions like MODULE_AUTHOR() or MODULE_LICENSE(). Refer to section
 4. Loading Modules that use namespaced Symbols
 ==============================================
 
-At module loading time (e.g. `insmod`), the kernel will check each symbol
+At module loading time (e.g. ``insmod``), the kernel will check each symbol
 referenced from the module for its availability and whether the namespace it
 might be exported to has been imported by the module. The default behaviour of
 the kernel is to reject loading modules that don't specify sufficient imports.
@@ -138,19 +138,19 @@ missing imports. Fixing missing imports can be done with::
 A typical scenario for module authors would be::
 
 	- write code that depends on a symbol from a not imported namespace
-	- `make`
+	- ``make``
 	- notice the warning of modpost telling about a missing import
-	- run `make nsdeps` to add the import to the correct code location
+	- run ``make nsdeps`` to add the import to the correct code location
 
 For subsystem maintainers introducing a namespace, the steps are very similar.
-Again, `make nsdeps` will eventually add the missing namespace imports for
+Again, ``make nsdeps`` will eventually add the missing namespace imports for
 in-tree modules::
 
 	- move or add symbols to a namespace (e.g. with EXPORT_SYMBOL_NS())
-	- `make` (preferably with an allmodconfig to cover all in-kernel
+	- ``make`` (preferably with an allmodconfig to cover all in-kernel
 	  modules)
 	- notice the warning of modpost telling about a missing import
-	- run `make nsdeps` to add the import to the correct code location
+	- run ``make nsdeps`` to add the import to the correct code location
 
 You can also run nsdeps for external module builds. A typical usage is::
 
-- 
2.27.0

