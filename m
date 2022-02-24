Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18509C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 12:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbiBXMSu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 07:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbiBXMSu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 07:18:50 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997CBB2D72
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 04:18:19 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id s1so1519834plg.12
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 04:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hENfd9wYsM5U3DKbN/29cpB4UHmGrYVZB2/v/dWR5LE=;
        b=koGMcmotpKNnkxkpzJWK73k9ERBMkRmHUtBvlfxrGzG+GZa4ApZy/1HBZSHGvyRzGy
         e04wC4rTrDeA5BNz0EP3dbxO6n0ffe2ps3aOMzDbwwWQZq49S3CxbVwdsML4tlzitygr
         s9zBvftzAIkBvfuJVB7BBJ1rhqoqSIr3GQxbIc8bXnvIP+2NBR8gCHOC52aTEsfszMFO
         ZYpfQeD15hLe0rMzob4FTdormLLmawLdYNj6Wyg8nCB0wJMFg2TkfJvWahhp4hAsQWek
         9q5WKTUBusVQqMW4MMEZn8PwDjaFfX1gdnIUsQG1ea0Ck1nkrYhV56JbxLupiNVArU6S
         1CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hENfd9wYsM5U3DKbN/29cpB4UHmGrYVZB2/v/dWR5LE=;
        b=DBRttx+/M4YBi89hVdR1Tdu55sYjCeg7HSu8myysEQ1rs4L0LUPEznSYnFH13xP3ra
         ENzlMUZ4hVNyBOKwFT0qUq91/vfPbqhWJ+Hz0cCLIQfDAe8HL2RP42o+LPVRpL09TnAA
         KtJvEnOCVZ8VV5ZnqSHcDnBt16oLYYEoL+ouMVrt2tvUHNKAumgPwxCJT40smVsTlAF4
         V+RPD8qDXd7AIOHYKyuISB4BhC3BFOtp1wAABMEeqQWsA5HwiIa9DppihcL9ZP0+6k8A
         n3frSJlvnMEwPYC88j1tTs+U2eMKkx62mZthVlMKIkrMaapfy3QTXecKbXd5iY6UWW2w
         5HFQ==
X-Gm-Message-State: AOAM5315yNyirl/5AEnmAbb3WsGNY12Ts6skqk5YiZRdP6MDutAKZ7nl
        pe/aLRcKYIOGl9I6LBDbX8Q=
X-Google-Smtp-Source: ABdhPJz3256OcmtWZ7xo8crTYsVW+7KVLV+27+JvA8aEwen8WROHTwle5o9Vg5MjcaUvCJ/BB/lbKA==
X-Received: by 2002:a17:903:291:b0:14d:522c:fe3d with SMTP id j17-20020a170903029100b0014d522cfe3dmr2291920plr.100.1645705098787;
        Thu, 24 Feb 2022 04:18:18 -0800 (PST)
Received: from localhost.localdomain (pcd454219.netvigator.com. [203.218.244.219])
        by smtp.gmail.com with ESMTPSA id e3sm2577643pgc.41.2022.02.24.04.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 04:18:18 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 0/3] docs/zh_CN: add riscv vm-layout and peci translation
Date:   Thu, 24 Feb 2022 20:13:49 +0800
Message-Id: <cover.1645704571.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v1:
* Translate .../riscv/vm-layout.rst into Chinese.
* Translate .../peci/* into Chinese.

Yanteng Si (3):
  docs/zh_CN: add riscv vm-layout translation
  docs/zh_CN: add peci index translation
  docs/zh_CN: add peci subsystem translation

 Documentation/translations/zh_CN/index.rst    |  1 +
 .../translations/zh_CN/peci/index.rst         | 26 +++++++
 .../translations/zh_CN/peci/peci.rst          | 54 +++++++++++++++
 .../translations/zh_CN/riscv/index.rst        |  1 +
 .../translations/zh_CN/riscv/vm-layout.rst    | 67 +++++++++++++++++++
 5 files changed, 149 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/peci/index.rst
 create mode 100644 Documentation/translations/zh_CN/peci/peci.rst
 create mode 100644 Documentation/translations/zh_CN/riscv/vm-layout.rst

-- 
2.27.0

