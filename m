Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41F0C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 10:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9D6F61B29
	for <linux-doc@archiver.kernel.org>; Thu, 18 Nov 2021 10:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244514AbhKRKOW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 05:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244690AbhKRKNH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 05:13:07 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6496AC061570
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 02:10:07 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id o29so4771892wms.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hWNhiX6bB5vn1ElEnQO6B/cg9A4IQLsVK4bqd9DyTr0=;
        b=eOalXv+AyJsxPK+O6jWk/WgswNphSGFTT8upec/RswcJ/xfbCyOK7hh5SFiBKrBrn5
         VSpwJlnmuilaoyhSWDrCMC1wr7dz3ZEZxuvUwyR7iq7sktTbaSXUUGQU0oUl0Tl1g1q8
         xCDDrTAlvVvaaa92jbwpq0untoIzFm/A4dJZwREcDPTFnb6JYFDg79bE9DS6Mu3qi6Ev
         Bnql1opDC6+/iXmGej5yXcYHjhIiJz4ZkUlsjhxH97uI9zHNZtuWFO+9QS/pIftphNAF
         +yR04ptr0UL93T+OJW74HQiAMlvg2KZxI8LYOiD/WYbELx9aiDggyzymz9alaYL1FzZV
         3qaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hWNhiX6bB5vn1ElEnQO6B/cg9A4IQLsVK4bqd9DyTr0=;
        b=3fY8S2QfSK3gqmsA66wbz3FZcBl86QnPx3e3JwIdeD8vN7fCKA5I3T0Y6nNgbvjthz
         fhaCtmF26nP7q9NMxovwSExKc3xCJ2W+WuUmTWiL5jMdo7dKxzWsCV+hhHJL1CKvwcMc
         x3vp5PRzm8vLcXnyB52LQ/zCcjIKYruOfDs2e8rrJ4kVNgVFQCzVkyKzl1JVMJMQLpKP
         xji6lKXx768rbF/RlkENyjYG1VtfeWXFc+S0xCgvjkXTuewwBjbUXCGPH/e/DKFLGX8s
         jGhfn+V5gPeyDM+J7nBL8BRUxxsOpSaxdcdbel1Gr16uxvOp7hgWm4XAaAwcmdJGDvsS
         yfVg==
X-Gm-Message-State: AOAM531ICWnJdkWqVJf7S5DZuKjA2h4AzpqomS5CHduN2cilO4ARK6GE
        /hD/zomR4+2naiH7R1Qyesa7CQ==
X-Google-Smtp-Source: ABdhPJxpat917FvWsOmCoXI5oxhj+WaxTyPEzzgel9kNKZkK5ZRuvgrAFUuV4lF/yjdiRTjIBDoENA==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr8658332wmi.90.1637230205913;
        Thu, 18 Nov 2021 02:10:05 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id z15sm2525846wrr.65.2021.11.18.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 02:10:05 -0800 (PST)
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@linaro.org
Subject: [PATCH 0/2] Documentation: dmaengine: Tweak dmatest docs
Date:   Thu, 18 Nov 2021 10:09:50 +0000
Message-Id: <20211118100952.27268-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A couple of small improvements to the dmatest documentation.

The first provides a description of what the test actually does.  The
second corrects the description of how the test behaves if the channel
parameter is not configured.

v2: Remove Haavard's SoB: from the first patch (Andy S., Vinod K.).

Daniel Thompson (2):
  Documentation: dmaengine: Add a description of what dmatest does
  Documentation: dmaengine: Correctly describe dmatest with channel
    unset

 Documentation/driver-api/dmaengine/dmatest.rst | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)


base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
--
2.33.0

