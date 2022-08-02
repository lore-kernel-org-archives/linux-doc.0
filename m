Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB868C00144
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 03:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbiHBDC5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Aug 2022 23:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbiHBDCz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Aug 2022 23:02:55 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1624519281
        for <linux-doc@vger.kernel.org>; Mon,  1 Aug 2022 20:02:54 -0700 (PDT)
Date:   Tue, 2 Aug 2022 11:02:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1659409371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=ONjlSGJLMIi9XjElEyN1rFau5E4Tu+/AmpFbuBErAVc=;
        b=N5z1IrVxR2mbjpeJVcYKKC95wZ9YDfcjCtQWwKehC9tUVThTi68Brp57LFwy7TV0I5UfU4
        bAuGGWWouL4i/TpRpR05Urnkyugh/3+LxJWiDZJxpE4eCrzyLQvf9QOyw2Ijp/5dijzn/+
        HsxPg4L0IwZfKNTkDcS1ateBAA0BjTg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Li Yang <leoyang.li@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: [PATCH 0/2] docs/zh_CN: Update two file in zh_CN/process to 5.19
Message-ID: <cover.1659406843.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This set of patches aims to

    * Update zh_CN/process/email-clients.rst to 5.19
    * Update zh_CN/process/submitting-patches.rst to 5.19

Also deep clean these two files. I highly recommend to use a word-by-word
diff viewer like VS Code or Emacs to read such big diff files.

Note:

    Due to the special content of PATCH 2/2, checkpatch.pl will give a
    lot of warnings and errors, all be fine.

Thanks!

Wu XiangCheng (2):
  docs/zh_CN: Update zh_CN/process/email-clients.rst to 5.19
  docs/zh_CN: Update zh_CN/process/submitting-patches.rst to 5.19

 .../zh_CN/process/email-clients.rst           | 263 ++++---
 .../zh_CN/process/submitting-patches.rst      | 701 +++++++++---------
 2 files changed, 518 insertions(+), 446 deletions(-)

-- 
2.30.2


-- 
Wu XiangCheng
0x32684A40BCA7AEA7

