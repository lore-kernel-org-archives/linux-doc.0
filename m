Return-Path: <SRS0=/7E3=6O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D674BC47247
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 23:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA985208CA
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 23:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="YGZmQ8GW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgD3W6f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Apr 2020 18:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727092AbgD3W6f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Apr 2020 18:58:35 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F552C035495
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 15:58:34 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id s9so4950413qkm.6
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 15:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JwaXAKuRd0apGvpDhNCHAFUyDcZ/LeyJTl3LHyQWiwI=;
        b=YGZmQ8GWP6O2iWZDHWeYV+qL8FMiaRmtsxbz69scygNhquADfQVsbpoVBYM3QC0dTU
         t5BMZa9/cc51xVx9QZvTbTJKFYFMfHriP4veaT5UB1//NnNg7+0XPqI0B8qA/YQO6Trs
         ODWlwi/Z2xJ4g4HRNN3Netfxfe+l11nBgKK667Wd1jhRlghv5U0KJyh72j8quYtLvJZx
         0S39woQfT0AwekP+ecAruBhm6CQ6qE30TOGK5VA9fla/qOS9SJIQLCq2k3OVPxwNTv/m
         eYrZ+OE+SPFO4cOZPNgCwAYmgE4M6ypCY8+z1qT9xJv4CKfUdR8JecebIhlyL8KRHsYu
         85Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JwaXAKuRd0apGvpDhNCHAFUyDcZ/LeyJTl3LHyQWiwI=;
        b=hLCKaNSeIh2hjr0vGH4+hgY0yA9oC/Rtqocq3Kf7awNtVMCkLjvLVYoMi+sfIEj6zd
         TKHWoOJimuCS3C4x7ZrL+njzaWe1kxe14DROpTv3a67rRqw7h23Z6GbKFGHb2AGqo0M0
         hWZG1rMSJdQ+GBvKspWWX82ChCGz1tH+OG+XrDl6VqgZ5TUl8X+3cCDtxk09oId9D6LR
         sSaIkxez5FXJ0EDd4UKVXqANHcT3KuCJ4fWrQd75zSIuXllSGB0nm5rg15tZRw+ujlQx
         KL4JTXOgoq7KgPk+2rpH6DbnlShY5LLd29162IHOPVPhozprlrFm4joGroybR++LZbUO
         EzQg==
X-Gm-Message-State: AGi0PubNO/y0OlypsoCBwAKq/wApGlFgjsJTVl263TJ44OnnZUg6WfhR
        mXUsG//ourDxgheZSUYSEpDyB59EeOdPnw==
X-Google-Smtp-Source: APiQypLfhmjyRVuRf2Lt6npZZiun6EfqTX4lxs32lNtxWW7GfoDXIAI1rIkPsqMKP/JogVM2TtNnpg==
X-Received: by 2002:ae9:e10b:: with SMTP id g11mr926581qkm.449.1588287513228;
        Thu, 30 Apr 2020 15:58:33 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id s50sm1165641qtj.1.2020.04.30.15.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:58:32 -0700 (PDT)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     linux-doc@vger.kernel.org
Cc:     mchehab@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
        brendanhiggins@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RESEND] doc: misc-device: add uacce to toctree(index)
Date:   Thu, 30 Apr 2020 19:58:28 -0300
Message-Id: <20200430225828.114033-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This fixes:

Documentation/misc-devices/uacce.rst: WARNING: document isn't included in any toctree

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Documentation/misc-devices/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index c1dcd2628911..1ecc05fbe6f4 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -21,4 +21,5 @@ fit into other categories.
    lis3lv02d
    max6875
    mic/index
+   uacce
    xilinx_sdfec
-- 
2.25.1

