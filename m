Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157FAC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 11:01:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C684060C3D
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 11:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhBRK7R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Feb 2021 05:59:17 -0500
Received: from m32-153.88.com ([43.250.32.153]:9936 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232929AbhBRKd6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Feb 2021 05:33:58 -0500
X-Greylist: delayed 361 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Feb 2021 05:33:57 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=uDzP8jCx/OnrqWTorCyCTQKcj4DeAlgv+6FMs
        sngM3k=; b=MEZLTCdlLjupekRZQJl/NaroXm9SR5L1Ls6AIyXxU9pf96mKMawbp
        nWGAJKTeHfe33dSl0enKgOBlqk1IqtGPdtl6BY0D4WlzF1zc0nrOf9H+bzQUAJio
        ubBQl6FZIyITo7F/5noi+DEm14ezFf3cJhFFSok1VsE5x+t92Aesg4=
Received: from mipc (unknown [120.242.71.139])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDnCfRlQC5gq+8TAA--.52996S2;
        Thu, 18 Feb 2021 18:24:39 +0800 (CST)
Date:   Thu, 18 Feb 2021 18:24:37 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH 0/5] docs/zh_CN: Improve language in zh_CN/process/
Message-ID: <cover.1613643617.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDnCfRlQC5gq+8TAA--.52996S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF4DWF1kuF4DWFW3uFWDXFb_yoWkAwb_AF
        ykXayIkr4SyF9agFW8WF43CrW8Ar4Y9a4DJFn8ta98Grs7tFn8XFyDWF4vqr1rXFZIkry5
        Wry8ur1fAFnF9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbF8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
        GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8c6pPUUUUU==
X-Originating-IP: [120.242.71.139]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are some errors in some files in zh_CN/process/, such as grammatical 
errors, translation errors and improper use of words etc., which make it 
difficult for native speakers to understand. Many errors are caused by 
machine translation without manual correction.

This set of patchs aims to fix the above problems and synchronize them with
original files. Some structure modifications need to rewrite the whole 
sentences, so here are a lot of changes.

Wu XiangCheng (5):
  docs/zh_CN: Improve zh_CN/process/index.rst
  docs/zh_CN: Improve zh_CN/process/1.Intro.rst
  docs/zh_CN: Improve zh_CN/process/2.Process.rst
  docs/zh_CN: Improve zh_CN/process/3.Early-stage.rst
  docs/zh_CN: Improve zh_CN/process/4.Coding.rst

 .../translations/zh_CN/process/1.Intro.rst    | 146 ++++-----
 .../translations/zh_CN/process/2.Process.rst  | 296 +++++++++---------
 .../zh_CN/process/3.Early-stage.rst           | 120 +++----
 .../translations/zh_CN/process/4.Coding.rst   | 251 ++++++++-------
 .../translations/zh_CN/process/index.rst      |  10 +-
 5 files changed, 412 insertions(+), 411 deletions(-)

-- 
2.20.1

