Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26A2C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 16 Oct 2021 04:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 902C661211
	for <linux-doc@archiver.kernel.org>; Sat, 16 Oct 2021 04:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239428AbhJPE1Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Oct 2021 00:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhJPE1P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Oct 2021 00:27:15 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594C9C061570
        for <linux-doc@vger.kernel.org>; Fri, 15 Oct 2021 21:25:08 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id o204so15982553oih.13
        for <linux-doc@vger.kernel.org>; Fri, 15 Oct 2021 21:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=onuY29ffSlf/9Yrbe2U1vhDkkufgzzk9inhMiACXOhg=;
        b=dVzDFKg2sukPPWsrKY14Ym79lg5TNMYCtcSt8bh4TPdId+A/rT23Joe7dHXTI2T5/L
         RhJAJnz0bP4929cyKrUlCq54auBXTH9MQmZS3M5EoGeK7A7Ff+wy0BD1+WjbqXr6yrel
         Q/Vn/5Jo3mhb57f1XpvUtMovjhINuSZ7em0DwQsi6Hf7NXXFiQwUw8K4UWOy5Ok3gqpp
         oSRqZHqV07NmsyaLOksRUNu9yiZwkIWWj6XXe4ZArY6cE2CdhiJJg4EYiAJTRO+kWbYa
         3EOKcZMT2XBaKo3ebmx3GKp90hjHxRuFanw++dP0qIkxUT2nUa3+MqJXq6Aw4Uv4IgbS
         u95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=onuY29ffSlf/9Yrbe2U1vhDkkufgzzk9inhMiACXOhg=;
        b=uOze90Yfoh1nIRVw923AyI4PL+3dq1YA1hU8/ONdyz/JA0ekR1Oah3jke/PjX+qOwh
         Ki0c5DLLV+DgAfxUkbOhuPN7wp2q0h1GsusCjHYfeWTG07rpZFByoOaMM27LYsv+BD5H
         hUEMDMkVAmUpr6yBrX7/LHUKafVGWeQQ3SIUe1UOQV5ub17dDxQQ/qmIethTXO8cbxOU
         IDvYkLz48pRRJWRdunLqVS2ZKsnQ6Fqdg2/FoY+R/RYIwCb+VdIbNfCYKyKJZeIZDss+
         NRBrJU9rUnxG+4TsEY2iCrIbF45hPLnLwCCUjmB2v0dW7UQPmE/gMxxTqzWlFD7pa77X
         HdJA==
X-Gm-Message-State: AOAM53102XCQcHGZ6ZcPMcFfEbO9f1032Do1moUU3erC912BPbjluWpE
        YYFNHJpcu0Ssx5geU8MpFX0=
X-Google-Smtp-Source: ABdhPJxUaCMC0ccqD6ajcFHYV77A8SmrjvlmveSC27TcZz2izymcA1jdSWItUYFsbCNDkDCe6mJy1g==
X-Received: by 2002:a05:6808:bc5:: with SMTP id o5mr10770756oik.129.1634358307530;
        Fri, 15 Oct 2021 21:25:07 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.34])
        by smtp.gmail.com with ESMTPSA id e23sm1633558oih.40.2021.10.15.21.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 21:25:07 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 0/2] docs/zh_CN: add core-api assoc_array and xarray translation
Date:   Sat, 16 Oct 2021 12:24:45 +0800
Message-Id: <cover.1634358018.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

* Modified some words under Alex's advices
* pick Alex's Reviewed-by tag.

v1:

Translate .../core-api/assoc_array.rst and ../core-api/xarray.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add core-api assoc_array translation
  docs/zh_CN: add core-api xarray translation

 .../zh_CN/core-api/assoc_array.rst            | 473 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   5 +-
 .../translations/zh_CN/core-api/xarray.rst    | 371 ++++++++++++++
 3 files changed, 847 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/assoc_array.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/xarray.rst

-- 
2.27.0

