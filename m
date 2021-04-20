Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1157C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 16:02:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3AE5613C0
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 16:02:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhDTQCs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:02:48 -0400
Received: from [43.250.32.171] ([43.250.32.171]:32697 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S232504AbhDTQCs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=1PRT40JHGWmj4Ghd2UqVWZKMt1UiyVUe8P2RP
        qaiUl4=; b=Cg2akBecjpvuRVBYCq0iOPvIosD37qoS5ZmYstTNWSTN8Ag5xUyu+
        gTWTMvkqy64LwKd01xPR1yVwHd74MWXmDxGM+/QRbZVgsAz0xqKQyRmyvBYN7NqV
        XZm2A/ComT8bBKjy/StjxvsjzS0rEk/obhk84zyGrmSqNaRnPjrQl8=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBnLkED+35gOY8AAA--.1936S2;
        Wed, 21 Apr 2021 00:02:12 +0800 (CST)
Date:   Wed, 21 Apr 2021 00:02:11 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-doc@vger.kernel.org
Subject: [PATCH v2 2/2] docs: kernel-hacking: Fix two ref links
Message-ID: <2b855d05ab1da0635b88bfb8e65cac36260fba64.1618933932.git.bobwxc@email.cn>
References: <e81dbd91c0afab466d6274ea7c27d20baea75141.1618933932.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e81dbd91c0afab466d6274ea7c27d20baea75141.1618933932.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgBnLkED+35gOY8AAA--.1936S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kry3GrW3Aw13Zr1rZrW5ZFb_yoW8JF43pF
        sYgr93Xr45Z348Zw4DJFyIqr17Aa97Ca17G3Wktr1kXrs8W3WqvrnxKF45Xa48CFyIyFWY
        q3ZavFyFvry2y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg0b7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r4UM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWxJr1U
        JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r1l42xK82IYc2
        Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
        IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZE
        Xa7IUet73PUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a abnormal funxtion ref link in locking.rst
Convert a path to bare path

Fixes: b1735296cef9 ("docs: locking: Drop :c:func: throughout")
Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
v2:
* No change.

v1:
<https://lore.kernel.org/linux-doc/6a15b17d46f5db190fb10afc57ea59132b33c701.1618761749.git.bobwxc@email.cn/>

 Documentation/kernel-hacking/locking.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index ed1284c6f078..9bcd70aa8411 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1323,7 +1323,7 @@ from user context, and can sleep.
 
    -  put_user()
 
--  kmalloc(GP_KERNEL) <kmalloc>`
+-  :c:func:`kmalloc(GFP_KERNEL) <kmalloc>`
 
 -  mutex_lock_interruptible() and
    mutex_lock()
@@ -1364,7 +1364,7 @@ Futex API reference
 Further reading
 ===============
 
--  ``Documentation/locking/spinlocks.rst``: Linus Torvalds' spinlocking
+-  Documentation/locking/spinlocks.rst: Linus Torvalds' spinlocking
    tutorial in the kernel sources.
 
 -  Unix Systems for Modern Architectures: Symmetric Multiprocessing and
-- 
2.20.1

