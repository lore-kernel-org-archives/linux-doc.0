Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAD5C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 11 Oct 2022 06:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiJKGAc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Oct 2022 02:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJKGAa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Oct 2022 02:00:30 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319267B1FE;
        Mon, 10 Oct 2022 23:00:28 -0700 (PDT)
Date:   Tue, 11 Oct 2022 13:59:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1665468027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=2uhVIJR21mBxYjBJewJlZllGU5bD+kBUVatkqgaDOzY=;
        b=pQW6dlOQyo/yq3Itl17MquiRcq2Qt0mGo/min0OTGHrWW2yIcvAr4kbPiaPMfFf9OSVuYs
        3IjmsElk+JSpG9PEbG05osRLkK7KPfuBrLzfZiSq1Tk0VN8oGLOHBQJWV/9/cUGaRdP5tr
        G6J9hPpA+rxzXJdQTQGYdVMZYbc9IDw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] docs/zh_CN: Rewrite the zh_CN/index.rst
Message-ID: <cover.1665467392.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Follow Jonathan's steps[1], rewrite the entry point of kernel's Chinese
translation documentation.

[1]: https://lore.kernel.org/linux-doc/20220927160559.97154-1-corbet@lwn.net/T

v2:
	* remove blank line
	* fix typo
v1:
	https://lore.kernel.org/linux-doc/Y0EHBw9C1UpVA49k@bobwxc.mipc/T/#t

Thanks,

Wu XiangCheng (4):
  docs/zh_CN: promote the title of zh_CN/process/index.rst
  docs/zh_CN: add zh_CN/arch.rst
  docs/zh_CN: Rewrite the Chinese translation front page
  docs/zh_CN: add a man-pages link to zh_CN/index.rst

 Documentation/translations/zh_CN/arch.rst     |  29 +++
 Documentation/translations/zh_CN/index.rst    | 169 ++++++------------
 .../translations/zh_CN/process/index.rst      |   1 +
 3 files changed, 82 insertions(+), 117 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/arch.rst


base-commit: df39f6bb3c59784acf0c31f2c5e7eee3a4fea354
-- 
2.30.2


-- 
Wu XiangCheng	0x32684A40BCA7AEA7

