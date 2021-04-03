Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258B5C433ED
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 11:38:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4113611CE
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 11:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbhDCLiN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Apr 2021 07:38:13 -0400
Received: from m32-153.88.com ([43.250.32.153]:21587 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236506AbhDCLiK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 3 Apr 2021 07:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=vkOpUWJHp7drcs4JGSHRaXdMShhKZ+MO31bB9
        HfGks0=; b=KbkzgQCIRe0TCQaq+zB4jNiahcJQGDmYOWqLfHii9lzorJGGfaAHM
        8GpEWSoqODiPZbnXTV+zY0D5SGousChhK0wkGEOVue2041XHrrqfgwVZ0wtq0fSg
        Xm/YOKAnYP6xorv3svZm9FKVPe7QClV5zhSh7ze36sw1NCMeOPColA=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBX4iKSU2hgF2xZAA--.11998S2;
        Sat, 03 Apr 2021 19:37:56 +0800 (CST)
Date:   Sat, 3 Apr 2021 19:37:54 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Peter Oberparleiter <oberpar@linux.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] docs/gcov: Convert two tags to ref in dev-tools/gov.rst
Message-ID: <20210403113752.GA32236@mipc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBX4iKSU2hgF2xZAA--.11998S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF45ur1xuF15tFyUXFWUJwb_yoW8WFyUpa
        13WrW2qF1kZFyrXw1UA3W7WrW5Aa4fWa95GF97tws5tFn8Cr48Kry3tw10vFW5JFW8ZFWU
        uw1kKry7JwnrAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4kMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjxUf73vUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Htmldocs does not display the chapter number, convert the two manual
chapter number tags to ref tags.

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 Documentation/dev-tools/gcov.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/gcov.rst b/Documentation/dev-tools/gcov.rst
index 9e989baae154..5fce2b06f229 100644
--- a/Documentation/dev-tools/gcov.rst
+++ b/Documentation/dev-tools/gcov.rst
@@ -124,6 +124,8 @@ box for setups where kernels are built and run on the same machine. In
 cases where the kernel runs on a separate machine, special preparations
 must be made, depending on where the gcov tool is used:
 
+.. _gcov-test:
+
 a) gcov is run on the TEST machine
 
     The gcov tool version on the test machine must be compatible with the
@@ -143,6 +145,8 @@ a) gcov is run on the TEST machine
     machine. If any of the path components is symbolic link, the actual
     directory needs to be used instead (due to make's CURDIR handling).
 
+.. _gcov-build:
+
 b) gcov is run on the BUILD machine
 
     The following files need to be copied after each test case from test
@@ -211,7 +215,7 @@ Appendix A: gather_on_build.sh
 ------------------------------
 
 Sample script to gather coverage meta files on the build machine
-(see 6a):
+(see :ref:`Separated build and test machines a. <gcov-test>`):
 
 .. code-block:: sh
 
@@ -244,7 +248,7 @@ Appendix B: gather_on_test.sh
 -----------------------------
 
 Sample script to gather coverage data files on the test machine
-(see 6b):
+(see :ref:`Separated build and test machines b. <gcov-build>`):
 
 .. code-block:: sh
 
-- 
2.20.1

