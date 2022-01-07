Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ECFC433F5
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jan 2022 02:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344692AbiAGCmq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jan 2022 21:42:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344689AbiAGCmq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jan 2022 21:42:46 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88ACAC061245
        for <linux-doc@vger.kernel.org>; Thu,  6 Jan 2022 18:42:45 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 205so4082041pfu.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Jan 2022 18:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vWgh2opoznRAmuDChGmGzKGvHLj9e5RH7dZiwtXI98Y=;
        b=ZZ8oEfwO6cpEe8psLoS5DdEoodLsS3ca0kPuKiuek4fT9QKMrGvjZG6PGHS8dglmfj
         cNsY/d0dsCPKY3/QOs+RPrxrPsX7uan4AGz+TRdbnsTgomhEHQnzQSQF9doEgIfb39Bh
         gX2z+UEZkZeEvf3C3kDCBRK1OdDwpsduhlkxMlVK7CQ0MTPjXlKTJ9OpF43E4ahV77Pp
         hC4Va0snd8Y7kKu2OAS/CP7TtB4jVWOUZNntbIRFT5ehDVF8OLwSDlNiZ23pAHhxr0Gu
         J90JnGSr9uFvXB9iiDtFTqbdxQI7S0lh+WauOc/ZX3q9VGHuawhMZQA3VvNBsxXvkZ/2
         Gnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vWgh2opoznRAmuDChGmGzKGvHLj9e5RH7dZiwtXI98Y=;
        b=0Z+XhjNQJZzLgB2xmgaZr08rxgWg5y3jYl9OwPU9QGpd1vj026+QLF9sNtbxsbvJxD
         PNLzpgaZlrzpmHyhFkC2gC1JqeGCmgw/h6saBWNo0+klGM2rzkwB7mdd4W4t/2h2k9d+
         3TNCZiulgGFd4YRTSp+wlkVMR8zU/v9Gxe17umkLSa4Vr5vn28HCeyVveFPsLJDpZka7
         F2oV+6RGQRQ+C2Qr1PMcBOXooaznCAazNj+AelrcLLtYFEy5J6hQhBDmhYeFQKcVOxz7
         kdi8N64vG7DoLPDJ6DIOKZLhjK+sskVtROtYRlP+S6drsTxtrujRJghEbe7wC6QAtxBb
         0JuA==
X-Gm-Message-State: AOAM531MyX/eANNQeQUMHKweb62gEfZcYxYdNzsrrpL3HkellHWIR/FN
        h7IbKCAMeCOpNL8knMjdm6Q=
X-Google-Smtp-Source: ABdhPJwrBNVlDNUNi9LaaA046QBFekwNrjwSXXg0hPVQ4KoPfUVcrq9W0AzSBCuWUF0WKlna5mnvrA==
X-Received: by 2002:a63:b959:: with SMTP id v25mr49631232pgo.573.1641523365070;
        Thu, 06 Jan 2022 18:42:45 -0800 (PST)
Received: from localhost.localdomain ([45.11.1.11])
        by smtp.gmail.com with ESMTPSA id g22sm3874833pfc.130.2022.01.06.18.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:42:44 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 0/3] docs/zh_CN: add active_mm and balance translation
Date:   Fri,  7 Jan 2022 10:40:30 +0800
Message-Id: <cover.1641522956.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

* add vm into zh_CN/index.
* Translate active_mm and balance into Chinese.

Yanteng Si (3):
  docs/zh_CN: add vm/index translation
  docs_zh_CN: add active_mm translation
  docs/zh_CN: add balance translation

 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/vm/active_mm.rst       | 85 +++++++++++++++++++
 .../translations/zh_CN/vm/balance.rst         | 81 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst | 52 ++++++++++++
 4 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/active_mm.rst
 create mode 100644 Documentation/translations/zh_CN/vm/balance.rst
 create mode 100644 Documentation/translations/zh_CN/vm/index.rst

-- 
2.27.0

