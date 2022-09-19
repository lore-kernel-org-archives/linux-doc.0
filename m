Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6A9ECAAD3
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 21:04:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiISVEH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 17:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiISVEG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 17:04:06 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EB03F1FA
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 14:04:06 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id d1so716248qvs.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=dvXGvZx2U/2EUHL9GBalzzZ8Uvv1FCiUppnZPtGzkEM=;
        b=XUpZ54rmxzEigGryi0F0KKf/yANaaHZXyqxEvdJYl0we87zT5B1k92rYuPQ51ErGkR
         F4UP2Uf5ZAII5yx25bQ7w2GLSE1x+1/rqH9g7f8erWi2nBQaLyeMdvdZtgUPZPbf9Edw
         MVqEWYZ6fO18yZZgUF9nCott0g4EgjcNipQQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dvXGvZx2U/2EUHL9GBalzzZ8Uvv1FCiUppnZPtGzkEM=;
        b=5vbMXPKfrxuO6nBfUVEGvE4jRC1nCwaWOlcRTxc+18KFL0Yc5H+y3CUAOXpiGPbXS6
         TVtkv+IsjV50zAVdysk1v7yBtCpxuDaIbCJk1lWwoIhucaNpts8rRrOK7ALlMAf6mntd
         RV8wlsn+PpgEAE8s9+e4dNHtLVvfJ+xEm37oTquKtxE7vaBmes27TdVVyUJdoO3ukSoq
         F6TrOGus98a0tNRnJiKHwXEPks68+k2BIuVnM8rbRRIBti+amx53x/8CEL/0/1fNVc1z
         rCDlve7VGioIONmzrCHIR/CsMEVUmK8iHOgKojnhHNnU5sVF4NII7n+3oHVLKkr/OJ9m
         nVSA==
X-Gm-Message-State: ACrzQf0+QxvgM7CCeX69ZEdh37lw27TeKGeZAMS4pO6iUOKIe1NQaOVN
        78YtISIwdrjtGWr+n9y1BhebiPp6OC3xAQ==
X-Google-Smtp-Source: AMsMyM4ip2Ag17K1fVQ8NlUedJotKii5jJjOfU8rVDfm/L1i1ytdiYBxdPdIpa696UicPth/SQEN7g==
X-Received: by 2002:a05:6214:c48:b0:4ac:b18d:c101 with SMTP id r8-20020a0562140c4800b004acb18dc101mr16534651qvj.107.1663621445118;
        Mon, 19 Sep 2022 14:04:05 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bb18-20020a05622a1b1200b0035bb84a4150sm11117724qtb.71.2022.09.19.14.04.04
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 14:04:04 -0700 (PDT)
Date:   Mon, 19 Sep 2022 17:04:03 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-doc@vger.kernel.org
Subject: Overriding kernel version in built docs
Message-ID: <20220919210403.jxvql3lwpeyhz7h4@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

Upon suggestion from Jakub Kicinski, we now build linux-next documentation and
make it available at https://docs.kernel.org/next/. However, I want to make
sure that we override the version string in the built docs so it doesn't say
"6.0.0-rc6" but "next-20220919".

What's the proper way to do this, preferably via passing something to the
"make htmldocs" command?

Regards,
Konstantin
