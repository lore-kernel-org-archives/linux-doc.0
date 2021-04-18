Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3912C433ED
	for <linux-doc@archiver.kernel.org>; Sun, 18 Apr 2021 16:11:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8919F610E7
	for <linux-doc@archiver.kernel.org>; Sun, 18 Apr 2021 16:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbhDRQMD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Apr 2021 12:12:03 -0400
Received: from [43.250.32.171] ([43.250.32.171]:17601 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229783AbhDRQMD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 18 Apr 2021 12:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=1kajdnY2kCe0esMz13iANGmUkF/RpwNNUiIMc
        D2DnR4=; b=fk0MWGBnRDG5qoeS2UZ4ZrctxqpGtGF22CG2ishU5ZomJZxCZKoBs
        LmYaSZeCc7cW09Blz5cE+NMRfEv2vAZvGousSlhO57DKwxCgb7CBcS4mcc4f7Nm9
        mLAuI0l7C9+9mpMu2napIbL+IFvN0OnnEJPQioZyibDAwrnMs7tSqs=
Received: from bobwxc.top (unknown [112.96.100.90])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnWdAzWnxgQcJjAA--.30310S2;
        Mon, 19 Apr 2021 00:11:32 +0800 (CST)
Date:   Mon, 19 Apr 2021 00:11:30 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-doc@vger.kernel.org
Subject: [PATCH 2/2] docs: kernel-hacking: Fix two ref links
Message-ID: <6a15b17d46f5db190fb10afc57ea59132b33c701.1618761749.git.bobwxc@email.cn>
References: <26979ff9c52fe352f117204b3c5b939e4fe0c58d.1618761749.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <26979ff9c52fe352f117204b3c5b939e4fe0c58d.1618761749.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDnWdAzWnxgQcJjAA--.30310S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1DXF1fKr4kJF48WFy3Arb_yoWkXrg_C3
        98Xay5Gry3Xr43Kw4UAFs8GF129a1IkF18Cws8Jr4UG34Fy3sxJa4DCryYvr4fZF47ur90
        k39xZrZxWFnFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb0xYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4UJr1U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
        vE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
        Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x
        0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWU
        JVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
        AIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU-KZXDUUUU
X-Originating-IP: [112.96.100.90]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a abnormal function ref link in locking.rst
Convert a path

Fixes: b1735296cef9 ("docs: locking: Drop :c:func: throughout")
Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
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

