Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044ADC77B73
	for <linux-doc@archiver.kernel.org>; Sun, 30 Apr 2023 20:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjD3UCW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 30 Apr 2023 16:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjD3UCV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Apr 2023 16:02:21 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B0A18E
        for <linux-doc@vger.kernel.org>; Sun, 30 Apr 2023 13:02:20 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b50a02bffso1344925b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 30 Apr 2023 13:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682884939; x=1685476939;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1y0S2oMfjC2kdcOBWu7+EhJDVf4tBr6dxRmnci0CG5A=;
        b=IU/4WMfbb/gdnxRSnnQ4mAKqUJ3QhXmgg72Sz1hz5dNeC2qyKvK2TkLrCJdXtkA3fb
         oIs2VyixZGB8rmGr4fE2pW2geoosNtYVBvbt6aCbYJA/ujo+e0dqUV7XcCnH0/4ro+b6
         tlUYohQODNypaFHFWPAy5WpoPfgmV7huPqC92UTd8aJnGguiaL+5/lblKxAOKDvbBKln
         /TmLaEywZMsO1Who89iFFYNat6AcLnSFzDuYV+XwdH90jmmnSd+2FDT/SIq4+a18Dlr9
         dknKeTL02OFyF0NJ2N8TAexZeczNWKyto01139dmu7Gy/4QqDoEJwnG3MaQMseYIDNz5
         kTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682884939; x=1685476939;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1y0S2oMfjC2kdcOBWu7+EhJDVf4tBr6dxRmnci0CG5A=;
        b=FOlj3trqcXHhZXwBNf6WErxYn9fc2ln9/Q2x5HFHBH6dJB2KaneQOEuLZo9WHGf9eq
         9RbKwH/pBVvXG+AZ9pQ8bryTuaHH6+2XTVJX1WcDX0NCr1ie2MD75FkaFrMMYGboqhTt
         j6abBwBd74ZUfR5OAqIitpQrwqtr/EUdC/oIi2zX3taCy8eLv3IXbFsp9mZPdv+vvbHe
         BQv2lpolZ8zzSn39MJ89h8MNSQVhb6S0D1ONsV/eIQQikLXTKMCZNRsb4nDyYpmo9q4q
         fakvmLg82Q5cD28DJYXH4igNB7KFHA08+DIc4koX1A0T78GujIJMVlLXF4QKbeQiixl0
         vArg==
X-Gm-Message-State: AC+VfDyOhkRR+UokE+xKmLEzkMvRY+dXKjVkE6+uu9GxrWX6CO/2p0bp
        HZmElB2YSNIpbDhM6Le9ekpB9BEsXFHVew==
X-Google-Smtp-Source: ACHHUZ5qmMYpgEpwW2ckGBSMIXvYznqL8MGOtBf9Uf3i6jgAjnVQc+ouCuBOmtxGO+xa2FaXoByi1A==
X-Received: by 2002:a05:6a00:a13:b0:63b:646d:9165 with SMTP id p19-20020a056a000a1300b0063b646d9165mr17632688pfh.26.1682884938563;
        Sun, 30 Apr 2023 13:02:18 -0700 (PDT)
Received: from yoga ([2400:1f00:13:9c94:8766:46f:30c6:aabd])
        by smtp.gmail.com with ESMTPSA id i189-20020a62c1c6000000b005a8b28c644esm18635601pfg.4.2023.04.30.13.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:02:18 -0700 (PDT)
Date:   Mon, 1 May 2023 01:32:13 +0530
From:   Anup Sharma <anupnewsmail@gmail.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] docs: fix 'make htmldocs' warning in trace
Message-ID: <ZE7JRVqg8MoeO73e@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix following 'make htmldocs' warnings:
Documentation/trace/histogram-design.rst:
WARNING: document isn't included in any toctree

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
---
 Documentation/trace/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index fa9e1c730f6a..e28c2c2fff7a 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -19,6 +19,7 @@ Linux Tracing Technologies
    events-msr
    mmiotrace
    histogram
+   histogram-design
    boottime-trace
    hwlat_detector
    intel_th
-- 
2.34.1

