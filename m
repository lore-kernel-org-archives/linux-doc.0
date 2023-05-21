Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A709C7EE2F
	for <linux-doc@archiver.kernel.org>; Sun, 21 May 2023 17:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjEURNx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 21 May 2023 13:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjEURKp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 21 May 2023 13:10:45 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C40D1;
        Sun, 21 May 2023 10:08:01 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-ba82059ef0bso4479410276.1;
        Sun, 21 May 2023 10:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684688880; x=1687280880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cL856GI1pzwyeJ+uTrVpGny1Qys20KI1FWs9fUWurhE=;
        b=EDdtxRtjeAFyo6gY1uMNweOw+3fHVjIKanhSGB0XI9DlLyzG/tFbyg7NkmVne7EI7G
         AfaQEmql1cUot5pdrJibSJE1Yy278yGiGXGVrlf92HuPEX0uBqLgV+cm7G+6jbQDiNY6
         P1MNicSM3T/eizHL7v/D1kJO0094NKcbAB58S4wqLq4/CNxsK0XJV5WsYDbX626wDlbI
         WHGBuOQUTckhEK4WB8w+ZG/0ejItXkZpagqOqp/jknXIplsPvXujM0BaBrtKY9B6OhHo
         7FpGfgXMEXa4WkW7yo0Oj57n3dP7GxNM7mfA/N5acBMz1QtPOSv3rUMFk82r7b0UZJv2
         996Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684688880; x=1687280880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL856GI1pzwyeJ+uTrVpGny1Qys20KI1FWs9fUWurhE=;
        b=BD+eV9T5+9AkNxc2nRnvaeGk5VaQaGhLcTspa8ZaYNm1F6Lqw9gIJPjyOQ8a/sBav8
         nJ25I6/SEFU8M5+FYpG+mGYux9DotzHf08i8qpwWIZHdBism3TFKnXNwRe2Ggm42eK0W
         RKftMRY4JMZnvrB9yghfoskRE4ndQLGbjn3QeIGTMDM463RUWlImizMurAj203Ea+Zgq
         Id9smE8i+nca7BLCHTUktOhCP4sfv+uGtBFsEmIWOSO8RXlkbLtVzpqaaHsc8fzfFgec
         90bTV+9imB9QbH2VaGXT/DmLjSgtWOGxXnOzzjt1D0YPMtSLvIexVmZxVCliKC2DCq4Q
         ykUQ==
X-Gm-Message-State: AC+VfDxFQL+7Ii3gsEUouLPVZJrzuBNyzqxOrFgXtlXwT89TOc98OPOi
        3GtmJnzcuF2PzKQSPSG5VYgxKgtWCAnVPQ==
X-Google-Smtp-Source: ACHHUZ79rwPVKcaI8EiorSUoetDqMt4wLE6B0q0gkUtOZX2YN8Kv9OA4ZUD61ZDKR6T38eBI6eCs0Q==
X-Received: by 2002:a81:8746:0:b0:55a:574f:327c with SMTP id x67-20020a818746000000b0055a574f327cmr9116793ywf.13.1684688879899;
        Sun, 21 May 2023 10:07:59 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:7d01:949c:686a:2dea])
        by smtp.gmail.com with ESMTPSA id y185-20020a817dc2000000b00545a08184fdsm1420062ywc.141.2023.05.21.10.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 10:07:59 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [patch net-next v1 0/2] tools: ynl: Add byte-order support for struct members
Date:   Sun, 21 May 2023 18:07:31 +0100
Message-Id: <20230521170733.13151-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset adds support to ynl for handling byte-order in struct
members. The first patch is a refactor to use predefined Struct() objects
instead of generating byte-order specific formats on the fly. The second
patch adds byte-order handling for struct members.

Donald Hunter (2):
  tools: ynl: Use dict of predefined Structs to decode scalar types
  tools: ynl: Handle byte-order in struct members

 Documentation/netlink/genetlink-legacy.yaml |   2 +
 tools/net/ynl/lib/nlspec.py                 |   4 +-
 tools/net/ynl/lib/ynl.py                    | 107 +++++++++-----------
 3 files changed, 53 insertions(+), 60 deletions(-)

-- 
2.39.0

