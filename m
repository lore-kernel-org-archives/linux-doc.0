Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD43C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 23 Nov 2022 23:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiKWXaI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Nov 2022 18:30:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiKWXaH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Nov 2022 18:30:07 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5095349B5D
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 15:30:06 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ha10so623061ejb.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Nov 2022 15:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6LMA2Q7Sd9YoQJrsC7M8vf0UTTXg6tg8Z/ivyNNtlI=;
        b=QVxOmbx5W8N8oI+CO+EoZM5UX+bfTXZuciRAEqxOAzgxuIIgnZlDZYUUdIgMv3XE/I
         pTnqe1fF5y/5zFy1RTKMy4pUmEVgUpwwWc5lupEmInFXY4okiXwTQzAU5HBfT8/CpW2s
         DdJ3850XAGqqoKuElIY93w8ZRcUw0UIHUJnrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6LMA2Q7Sd9YoQJrsC7M8vf0UTTXg6tg8Z/ivyNNtlI=;
        b=n6HsLg4jw7NuvWY3GZ8jHRK2gQYVPq2ctS3U/eeKKbTyhuy8ldD6mzXxBgTe88ZS+A
         eG6dTnX4b3atJv0qUET/qKGDCmEAyXeJhvxc25kU2j5WA2A+4uaebplh2yHW2NbPSAF/
         0ACXJJmyLNF4xV0/PgSjbzyPUMbXZanCFwtSyL5vbcYu+sKQYCm5f1nIQNYszgF1pv7k
         xr06mkwsw1iRttMQApUkzxZiaRbmAKxaTw1LlXtQdtLOxWLMsfaCgSMC2ApPRTotocf8
         62Q89c31HapzYn6+J/EJGgy6ULPQcrdWo41RpB3qBXkjAn5zUcYclfmBXDA01Hc2u0PD
         H0Fw==
X-Gm-Message-State: ANoB5pnxnw4LrXRJ8dJIUZQYE86zdU0HYXi6dH7RN/Xmudpp+Mng3vSp
        fAv3FxaaG52K2HYPl9PlS97HcF9cVmCWo01f
X-Google-Smtp-Source: AA0mqf6kJ1NiWMAw3V9kaPUJq2zIuJ/jntNiapgSvLSd4MHybETVGPrvoYm/b0CtQsiQdVir2dWh0A==
X-Received: by 2002:a17:906:583:b0:78d:9e18:b8f7 with SMTP id 3-20020a170906058300b0078d9e18b8f7mr24815322ejn.657.1669246204918;
        Wed, 23 Nov 2022 15:30:04 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n5-20020aa7db45000000b004618a89d273sm1846799edt.36.2022.11.23.15.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 15:30:04 -0800 (PST)
Subject: [PATCH v1 0/1] earlycon: Let users set the clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAPKsfmMC/xXLQQqAIBBA0avIrBvQCTG6zahDSmKg1Ea6e7Z88P+ALi1Lh10NaPLknq86YRYFIX
 E9BHOcBtJExtCKf88FQzlxs9E7bTiydTAHz13QN64hzaXepbzvB8BUHNhhAAAA
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 24 Nov 2022 00:29:54 +0100
Message-Id: <20221123-serial-clk-v1-0-1f0554a46ad1@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=886; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=r9k7xumMZXx17RDnVJJ/c5a94RiKP7pRkdNoriPB6QA=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjfqz1/bqULfgCPpUe/L4Qm9HvuKY5iLwBbVLJxZKJ
 6vAd/dOJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY36s9QAKCRDRN9E+zzrEiF/CEA
 CN6DO9jgh+m217z2h8lcawj1UjCSXYgyRRv8D//iWT0qGc4cAiFiloU4VE+EaRNmp0rC1R7pqrn6i6
 YJOVgRQniXL4PcGwWfQ+yGm3EVm1WxsLaGdZLU+6XDr4+Ayf3q1OERxNuzBBRz32vyesSxZ64GpzDq
 ngOxbprvJaTq3iyL21jOFXDJlMb9jiDphDvKCQzEFzsmOsAEMvGAFKGU0mJAZK98N4LOFvJXVU+q8+
 s5fCoXLW+PiNyCTrE89NzCBxNLl2Fdqw000Z2jPN5ShLlLYKyhlpyQFsx6ZL1NkfrPY48wwFf5XPJQ
 U9ffifURgtsXcI6gK2M1sku2Ju280pt9js4xhv477MGBACQoqJCDcQpUH/HHkU4S0B7a0dUir4wMp2
 NK/XxW+VrApVA3aZ/morg1NFLDSwPpXoZ4wtLhqbfhehXeAXSDPaz3reNM66cdzFcuSuAukr7lVduB
 P/z3vGhzCkkxpnM8s2DnSee5CijAvq1+Dj3nRWm9HG7bBP+4EwxM7Zr7Y+MrFboNDU5mb46DeFpYUQ
 uL4y20T5RiFhhFyH/cme6qI/7nKA6GZXrbRAkYXh1ORTlFTAlO/B1864FCl7tif/ZLYvxJFeXaafzA
 nHLSYKUk3IY9Hi5pLd1HVpgtrqCCKBJVRgwnnLnaolzAWyAqvHNl2mHhP3jw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some platforms, namely AMD Picasso, use non standard uart clocks (48M),
witch makes it impossible to use with earlycon.
    
Let the user select its own frequency.

To: Jonathan Corbet <corbet@lwn.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

---
Ricardo Ribalda (1):
      earlycon: Let users set the clock frequency

 Documentation/admin-guide/kernel-parameters.txt | 12 +++++++-----
 drivers/tty/serial/earlycon.c                   |  7 ++++++-
 2 files changed, 13 insertions(+), 6 deletions(-)
---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221123-serial-clk-85db701ada57

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
