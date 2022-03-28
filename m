Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03017C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 12:47:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242622AbiC1MtK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 08:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242621AbiC1MtJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 08:49:09 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF19506C0
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:47:29 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id o8so12157953pgf.9
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmN0lkigAdSP23DU+airZ8K26iJisVnnX39LeSovalc=;
        b=BlVLADe6oh7wCIP2e1a63O+VueQgqJUADIUvzUw+UXKKPP8ECuP46RMndXD5IrFgvP
         IlF1pc7afnwcA3cAmLkYbhggWpyRcYkERvLrXYCVz6z1OYnM5IHdeS7ebo0M1IXuwg6H
         IfZ6u3pCTtkKnKypu0wUV/ZomME/4LP9jycyHU8seOTFgAPNX20jNJW8Nf+CM/83tjya
         guHPxhgqrCcR+gutXjbwouK3vVA1Xcw7k8IIwk4ILRVEHaw19Z+PySWv06Anw/dJ4r8d
         jwzxzAI8UVJPoufhChy37TlyCiYYe9+hVCix/S+j9P/qo3604busydJLcLzOlq7iFxbZ
         zpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lmN0lkigAdSP23DU+airZ8K26iJisVnnX39LeSovalc=;
        b=L3MOM+KRmcLYqUAFeiSAdxNMnVdtRIsofWpzngsCXqivgLycVKyqFyDe1yDUMxt4Pj
         tQJhxKNXfzIs8R0FrVuyEGKfQNSvZKvnVWff0LW/WvErp7KZI2pe8fA0vqNBerw46X14
         xxHFIlpPVWdfP8bbbqlvVyV4BeG/977U+hPQWtlnMkaI9xkMBW32FyxBmdyc2mSfMs35
         KWCzteiU0bObxYazjG7USNQ7IX97YMJCY/3xPT3Y+E1P0wfSxMw/aJRWTp0w6ltvZXYY
         T++ebJEqCgjex1umy8DwFmEHm0qKk1tZ9Yw/yKKutDFAAw5dXiB4B9wp9Kv9v5g+dC5C
         27cw==
X-Gm-Message-State: AOAM530DCga07rGEIHLI3Q0t2loNLTLRrRgt1z1K+0n8YtznlFAWsLSB
        a5tqaVfwMK7rchvHVA2KpK4=
X-Google-Smtp-Source: ABdhPJzJJG46jf/1bTdhv+6hV/dgF5h5PrmHBSVG8WGXEF01+K3N4xcN2aMnqDu4ybAGqYzqqR7yQg==
X-Received: by 2002:a63:5f4e:0:b0:382:3b02:a4a with SMTP id t75-20020a635f4e000000b003823b020a4amr10272596pgb.451.1648471648594;
        Mon, 28 Mar 2022 05:47:28 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id ck13-20020a056a00328d00b004fb1414476bsm11339079pfb.200.2022.03.28.05.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 05:47:28 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 0/3] docs/zh_CN: update damon translation
Date:   Mon, 28 Mar 2022 20:48:32 +0800
Message-Id: <cover.1648471647.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
* Pick Alex's Reviewed-by tag.

v1:
* Sync update .../vm/damon/design.rst and .../admin/mm/damon/usage.rst.
* Add sysfs interface translation.
* Typo fix. (enable -> enabled)

Yanteng Si (3):
  docs/zh_CN/damon: update outdated term 'regions update interval'
  docs/zh_CN/damon: add sysfs interface
  docs/zh_CN/damon: typo fix

 .../zh_CN/admin-guide/mm/damon/reclaim.rst    |   4 +-
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 291 +++++++++++++++++-
 .../translations/zh_CN/vm/damon/design.rst    |   7 +-
 3 files changed, 287 insertions(+), 15 deletions(-)

-- 
2.27.0

