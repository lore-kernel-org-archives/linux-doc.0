Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1CAC54EAA
	for <linux-doc@archiver.kernel.org>; Sat, 21 Jan 2023 22:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjAUWxv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 Jan 2023 17:53:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjAUWxv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Jan 2023 17:53:51 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BCD2687A
        for <linux-doc@vger.kernel.org>; Sat, 21 Jan 2023 14:53:49 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h16so7719438wrz.12
        for <linux-doc@vger.kernel.org>; Sat, 21 Jan 2023 14:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tSQMjpLqxlyV/AeOHFU8Kl5AtTNzyiZytNA84R4H8U=;
        b=VselyI+Rxhj1maKsS7acb/KOEAEc12inHHaVwGYRRSiG3Tci1x8s+XNLYhf3UV4Sqh
         3t9I+I7Vhz76KqoyRCIkqpsAlZDIohJSuueU/EW604zElUmEFpInpL5Nt12daNTaAl4s
         yUJsbYJsOBMUUkhir8MmlT8qwZY3TLZtn9/VFRCcmi89AGKeUuUYaHLQKyUjK1279xcJ
         X9/whaRy24MyTumtTDvZPs0K8y03pQm4CWG5k4kbvzEWsEKzvEs40+Jh3t5BYQ8YzdR6
         P4nAKQkJ0lZI37hk/7qQSmVnUvWmhV+B54Cmq8ZgO0JVSISbiv8ym0skmlhDfJDVk91i
         Of1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tSQMjpLqxlyV/AeOHFU8Kl5AtTNzyiZytNA84R4H8U=;
        b=Aq5Je+bp4o7D7L36Rybf5P3CajoNE+EhlqqgLnMA9NxCUnJuROfta3/eVwmXQHNZB5
         t73Rjekuz2KbI/P4ijn0KHWVcat8eN6QQ+AMiIpRChu4JX00YU1A2WztVuqfAKhVWoJI
         FL8q2vSpozKyxrPHa4KyQQlSIYOCtZmk/TT+YFnpscxxs2vMeRioAFJlM1Jn5Kcr9OxW
         KDKoYeMq99ZTo5expyx5lOu8Hb1I80Nuba4Kp44iqs2XOkUfPPAEmbo6/vvZa8xme+HJ
         tJWO0vgBygLRZYiFhZqiLnT8q1OvcOYr75kpA6L4e+6xuDbOIModfekZmhbtXSBLx90A
         0MHw==
X-Gm-Message-State: AFqh2kok0Btm78als9078khi255eVIW2BFsRUrP639THO1DSv4Mv07Kq
        y4dqjXVRtIYMqBsPBXWG98WMZA==
X-Google-Smtp-Source: AMrXdXtEzCvm02XQTQ/MaAdjG9Fzdj7CqMzDxCHMnQmsfedFXkdWYHjUmGsIwI3loI0tyvEmqQBX4Q==
X-Received: by 2002:a05:6000:1c6:b0:2bd:e40d:98d5 with SMTP id t6-20020a05600001c600b002bde40d98d5mr14581375wrx.0.1674341628408;
        Sat, 21 Jan 2023 14:53:48 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bcaa47bf78sm29531001wrr.26.2023.01.21.14.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 14:53:47 -0800 (PST)
From:   Yoann Congal <yoann.congal@smile.fr>
To:     linux-trace-kernel@vger.kernel.org
Cc:     Yoann Congal <yoann.congal@smile.fr>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 0/3] Documentation: kprobetrace: Improve readability
Date:   Sat, 21 Jan 2023 23:53:02 +0100
Message-Id: <20230121225304.1711635-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Version 3 of this series of small readability fixes on kprobetrace.rst.

v1: https://lore.kernel.org/linux-doc/20220915153358.813993-1-yoann.congal@smile.fr/

Changelog 
v3 -> v2:
* fix 2 bytes hex -> 2 byte hex typo

v1 -> v2:
* Removed all ``markup`` additions
* Split commits

Regards,

Yoann Congal (3):
  Documentation: kprobetrace: Fix some typos
  Documentation: kprobetrace: Fix code block markup
  Documentation: kprobetrace: Split paragraphs

 Documentation/trace/kprobetrace.rst | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

-- 
2.30.2

