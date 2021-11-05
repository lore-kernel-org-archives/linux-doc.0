Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75100C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:23:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51460610E7
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbhKEC0K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 22:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbhKEC0K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 22:26:10 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CC1C061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 19:23:31 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id p11-20020a9d4e0b000000b0055a5741bff7so11044853otf.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 19:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D+dBKlPNp0ZCNy6NLsjTPXEpfacikm3CLHyeWERDDIY=;
        b=ZIDvO0v06BfADlJA6UuVf7d818mATppNPH1AtYn+U9zCTEIwAbmZ6rJK2j0QDoYgIq
         TdyhJej9zmx1xOqzkuG/7GMYJEqYIrtvFEkOtZZO6q8NqOHHPy5mLvHwOMxCmLhcpnFc
         qmtdjZoT+d+ul2iUs7cpOxaCfCMH0ijlj1ROWx46zzfS2rZGMK6VwLRBpZixPkBys67+
         WgNYTNtKb8VG9np1FPoePu1KoZ1H9bhzLbgpRPJ4H6x6JAuOHEcqnspIfTfPw0EQv1Az
         4K2vP6A39CQl0Yo04e6aOpCQMgTg4SF1+WGDuXgEzI7/L4LCJbt1GrGEThKw/FKG+UfU
         dcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D+dBKlPNp0ZCNy6NLsjTPXEpfacikm3CLHyeWERDDIY=;
        b=OZFbLGvR3STSQ0iMRXUm7coVWYH/41gm34Dcze2kI+Jz/K442zPViGNevEvDvl61fS
         W+iyee2vOzNo09759B78VjVgKEUDKUUEfEUgvEHdHMMCFVV60wEnLs+84R3Y8u43Y5PJ
         VDyx4pBKmKu8NBQ/yJrnTSyjZmfhf4oVcYp3sKb+BP43gQBtPSe0Cmm50FgFMB5qooUf
         J46MhwaSvOKZc5Z1O7gJ09SQKrR7xOHkTrPD2zIhM7d7ZQyqGl+0TgdRUr64a5Ba+ZmV
         QvU3aQBMMnrgziSLiUWF3q3x295Ypc0CyNpk2+73v2ABie3CQu246UaRwDcov5tKQDHB
         jdCQ==
X-Gm-Message-State: AOAM5319LB0Xj/ihIWNKaBMYqSLehyRJXA+SdfO3iH+6m07EFX71fzXg
        rZBJFO7b+IIYICe0CAercYNdvdqxXGq4unaR
X-Google-Smtp-Source: ABdhPJy3WCPOJ8VjLKQHC3WcXJTZTqQlBtFpOviSiinAO/o5wD28sUlF5f6Krjrl690TszO0YAXlBw==
X-Received: by 2002:a9d:7512:: with SMTP id r18mr27417159otk.0.1636079010670;
        Thu, 04 Nov 2021 19:23:30 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id m23sm1801160oom.34.2021.11.04.19.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 19:23:30 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        wanjiabing@vivo.com, bernard@vivo.com
Subject: [PATCH v3 0/2] docs/zh_CN: move and update sparse
Date:   Fri,  5 Nov 2021 10:22:48 +0800
Message-Id: <cover.1636078637.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:

* Pick Alex's Reviewed-by tag.
* Replace *是* with **是** at the suggestion of Leo Li.
* Fix a build warning.

v2:

At the suggestion of Leo Li:

* typo fix.
* recovert `` `` to “ ”.

v1:

The Chinese sparse documentation is too old, so let's update it to
the latest version and move it to ../zh_CN/dev-tools/.

Yanteng Si (2):
  docs/zh_CN: move sparse into dev-tools
  docs/zh_CN: update sparse translation

 .../translations/zh_CN/dev-tools/index.rst    |  2 +-
 .../{sparse.txt => dev-tools/sparse.rst}      | 67 ++++++++++++-------
 2 files changed, 43 insertions(+), 26 deletions(-)
 rename Documentation/translations/zh_CN/{sparse.txt => dev-tools/sparse.rst} (58%)

-- 
2.27.0

