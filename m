Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C45AC64EC4
	for <linux-doc@archiver.kernel.org>; Fri, 10 Mar 2023 09:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCJJ7U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Mar 2023 04:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjCJJ7Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Mar 2023 04:59:16 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2B210A112
        for <linux-doc@vger.kernel.org>; Fri, 10 Mar 2023 01:59:00 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id e13so4475799wro.10
        for <linux-doc@vger.kernel.org>; Fri, 10 Mar 2023 01:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678442339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9N7u6WJBnH3s1uxLB4f4sp22AWC3MvK06S0R8KPoZzU=;
        b=CHYchpCxA9hMoOAVvA/vXfxOjtrxAnwW6xrOY2POdw2yOvNIo9dpsMvwSSapENpW4s
         00I/nzMqZf4901Ueiu5wr+OeUhM4fYoVilmuYwzYuEhEJSwLT6uFVIboXe4SaqjO4766
         8mJXNo7yb6fsvroYqBMnL7F7c5TZikVadDab03IYaRQefiL+O8Rdg0CwuuyYVuPmsati
         zMZoN88K+QuppUzmH5zpIJQ+2ciK5zDPrywMs8t2H81GFJiEd5ENqyHI7hf4/nBgCXxd
         e2sXSgL/XiM4D+RSaallpyOfu5yK9CpIa1VElHrKNAFf1UythTFvw7RLM1O2j1WT+Ay5
         1pHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9N7u6WJBnH3s1uxLB4f4sp22AWC3MvK06S0R8KPoZzU=;
        b=pCZiMT/4nnJ85hOJ+rTK/LQwQwShHgi7v9kI/ECJIhKLl2Mu/dE5yrEbLZOOUz7vRW
         kdgcjFye9WdIAj6Nk+nzUNsRfKQPHcBX5ihwjQFPbHsPjmFdbAuxQPuxh21GIam9xTga
         1+xSXvd/AJGDTQ7sVmDgkLtrl3lluApqmJwX0BoCAQkXAql1zfxxWVOpQl/WTnEXSsFd
         rotu+2b0ilERY6kaDzuG0eHxUp5C5dJHTCq5qYhPaJxVHp5suAdwD/tc/VdhVBzEKBiz
         pn0E9RPmUUxpbnK5DoAS3QPqR7Cup+St3zp/z9BlCgNbUsLQ56vF2Izh+ZV/Hfk0JAlc
         0ywQ==
X-Gm-Message-State: AO0yUKX2ZEGOlJYAlPZp2qD7u8M9yxT8pv1AYYPhPXbozMXTnHYmacAo
        aFdDp6CZdDIw7lkiqEcZeRfVRA==
X-Google-Smtp-Source: AK7set++GFm8jqGl+OXdo6Ydv1Fz1ECYAPop4T6BWZZGqhBQ8z7WRNZ1B+7fVfa7MFzokMBqbJ4taw==
X-Received: by 2002:adf:e908:0:b0:2c3:e0a0:93f with SMTP id f8-20020adfe908000000b002c3e0a0093fmr15968908wrm.8.1678442338966;
        Fri, 10 Mar 2023 01:58:58 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id j17-20020a5d4651000000b002c573cff730sm1751453wrs.68.2023.03.10.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:58:58 -0800 (PST)
From:   Jiri Pirko <jiri@resnulli.us>
To:     kvm@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     alex.williamson@redhat.com, corbet@lwn.net
Subject: [patch] docs: vfio: fix header path
Date:   Fri, 10 Mar 2023 10:58:57 +0100
Message-Id: <20230310095857.985814-1-jiri@resnulli.us>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jiri Pirko <jiri@nvidia.com>

The text points to a different header file, fix by changing
the path to "uapi".

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 Documentation/driver-api/vfio.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
index 50b690f7f663..68abc089d6dd 100644
--- a/Documentation/driver-api/vfio.rst
+++ b/Documentation/driver-api/vfio.rst
@@ -242,7 +242,7 @@ group and can access them as follows::
 VFIO User API
 -------------------------------------------------------------------------------
 
-Please see include/linux/vfio.h for complete API documentation.
+Please see include/uapi/linux/vfio.h for complete API documentation.
 
 VFIO bus driver API
 -------------------------------------------------------------------------------
-- 
2.39.0

