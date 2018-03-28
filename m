Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF62D7DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 14:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752945AbeC1OrN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 10:47:13 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:45794 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752237AbeC1OrM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Mar 2018 10:47:12 -0400
Received: by mail-pl0-f66.google.com with SMTP id n15-v6so1697475plp.12
        for <linux-doc@vger.kernel.org>; Wed, 28 Mar 2018 07:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DUJ2iyNdNzH5R2CpWBW0zo3hk45GmGQZcRRm0OtPF9I=;
        b=sjFQcDts10t/X8tTmzRKtjkjVZSvUvA6w+VP3C4F4s4jlcKTjBfOzg4EbDow2bCwQ1
         psTKS9+HjRfRMdcfoAwDr0O7oYF6NohZuJpVZsmCz9QK6lyLuBRlBKWds+dUwVkB8Kg/
         ErqmRzgwzmUkTXe77h3Xc0ZIEzm+lUu8/OoMmyaR/dOaxFzK6EAwhWWMttBsnxxTOV/q
         k9u/WVHMXmRsaWP9B1ggxWCpcUDtq/mbj3zEsFPbbT6oH09mnJVUh7V4RRomrVvKkct7
         WO/cx6jgSGUB19hyeIp6SPR8N7hindO4+OzadlaQIxNEkaDrR/v+A/4KZtezAES6fySX
         jPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DUJ2iyNdNzH5R2CpWBW0zo3hk45GmGQZcRRm0OtPF9I=;
        b=i4oh/c9tzMFa7Cug6mWgSnu+q/KTr41rpAtd2ZUdKWTGtetMDfFx2cHgiAWe6MlWR/
         6JKGESmCJNMdDLvoah1KiQzX3eaITsVT3fEnvWy1f3lJ2OeXvb7eYew6zemUJiJq0Jvp
         WloFynF49Z+8N8v4CV70oxdxyP1B095N9IoGv87PZmy/s41+BOijpojvtVh3NDJr6Bc/
         J7/B6o6r+S4xkP5h5w/Z9T/h/qEXVy8cQDQbbvhnseXwVVSgwc20qdTBUVoWBtB4arTq
         OVCZ/EzAKS0XK4lX/bF5qZ1xEwrDZ0zprCzguDBBGiI5UWKokFD5s8Yuv59mATh78G0f
         NUaA==
X-Gm-Message-State: AElRT7FOAvDRoI/v8SRVPUUt8KULE5RRky/Gsug1ykqq2/K4+YBcprvA
        AMcuBiFYmjz6BfHEWlnMUZ4hQA==
X-Google-Smtp-Source: AIpwx48q10BvFtEAZEeD0unsmRenzWDOY/odCO+V2azu9Z7uOwZT2vK9aOb+DwTTbqIT8caEC/NgmQ==
X-Received: by 2002:a17:902:161:: with SMTP id 88-v6mr4091470plb.212.1522248432164;
        Wed, 28 Mar 2018 07:47:12 -0700 (PDT)
Received: from arty-430G2 ([2001:470:36:117e:a038:3853:c974:4e7])
        by smtp.gmail.com with ESMTPSA id a82sm8725185pfj.153.2018.03.28.07.47.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Mar 2018 07:47:11 -0700 (PDT)
Received: by arty-430G2 (sSMTP sendmail emulation); Wed, 28 Mar 2018 22:47:07 +0800
From:   Sanjeev Gupta <ghane0@gmail.com>
To:     corbet@lwn.net, linux-wimax@intel.com
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/wimax: Point dead link to working copy
Date:   Wed, 28 Mar 2018 22:47:07 +0800
Message-Id: <20180328144707.13103-1-ghane0@gmail.com>
X-Mailer: git-send-email 2.15.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The linuxwimax.org domain, registered by the Linux Foundation,
no longer has any DNS entries.  Locate a copy on archive.org and
update the documentation.

Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
---
 Documentation/wimax/README.i2400m | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/wimax/README.i2400m b/Documentation/wimax/README.i2400m
index 7dffd8919cb0..d11502d17818 100644
--- a/Documentation/wimax/README.i2400m
+++ b/Documentation/wimax/README.i2400m
@@ -61,8 +61,9 @@ $ make KDIR=/path/to/kernel/dev/tree
 
 3. Installing the firmware
 
-   The firmware can be obtained from http://linuxwimax.org or might have
-   been supplied with your hardware.
+   The firmware can be obtained from
+   https://web.archive.org/web/20101224002849/http://linuxwimax.org/
+   or might have been supplied with your hardware.
 
    It has to be installed in the target system:
      *
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
