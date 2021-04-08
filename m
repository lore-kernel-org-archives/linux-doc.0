Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C157BC433ED
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 15:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 980D161103
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 15:14:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhDHPOu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 11:14:50 -0400
Received: from m32-153.88.com ([43.250.32.153]:33006 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231843AbhDHPOt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Apr 2021 11:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=x8WJTVJudueR+q4gfp0Z8l1iJZ0FYhJI+b3KU
        J0FE+s=; b=DMXFe+zVzUyWFQ+ahUssDRSqvfDYpkMifIuXpBiNCzEtVe+8v1F+0
        hfpS+MuhWcyw5LmWu2fQiDtCMvVypkzy0szKS0gls+wVXNjVJZ5wEafC5QZrXb/Z
        h4PlZnsoiqLpWZiKywv2+6IzDMIT/7pSd2S+G/CKHnC6V2H5NaYaiE=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAnsyPUHW9gJ71jAA--.36086S2;
        Thu, 08 Apr 2021 23:14:30 +0800 (CST)
Date:   Thu, 8 Apr 2021 23:14:27 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <seakeel@gmail.com>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: sync reporting-issues.rst
Message-ID: <20210408151427.GA10705@bobwxc.top>
References: <20210408135659.GA6747@bobwxc.top>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210408135659.GA6747@bobwxc.top>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAnsyPUHW9gJ71jAA--.36086S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr4rJFWkur1fWry7Jr47Jwb_yoW3Wrc_ur
        4kAw17AFWkur18Ka18AF9xKwnFkw4IkrW5uw15ta43Aa43Cws8X397Kan0vay3JrW7Cw1U
        A3y7Wr48Kr13ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYkYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_XrWl42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07jC6wtUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 08, 2021 at 09:57:00PM +0800, Wu XiangCheng wrote:
> Sync zh translation reporting-issues.rst to
> commit 58c539453b71 ("docs: reporting-issues: reduce quoting and assorted
> fixes")
> 
> Drop reporting-bug.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> Hoo, too many changes.
> You may have to do a lot of checking.
> 
> Thanks!
> 

To make review easier:

* diff file of En version:
  <http://fars.ee/3IQ2/diff>

* zh reporting-issues.rst applied the patch
  <https://www.bobwxc.top/cgit/linux/tree/Documentation/translations/zh_CN/admin-guide/reporting-issues.rst?h=zh-doc>

* highlighted patch
  <https://www.bobwxc.top/cgit/linux/commit/?h=zh-doc&id=d510474c31e3bd7d4fefacffd7f382112a05d548>

