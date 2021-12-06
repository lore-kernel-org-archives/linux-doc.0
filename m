Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D48C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 08:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238947AbhLFIQV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:16:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238917AbhLFIQU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 03:16:20 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21F4C0613F8
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 00:12:52 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id 8so9454171pfo.4
        for <linux-doc@vger.kernel.org>; Mon, 06 Dec 2021 00:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4BJ5/M+NqzTHTTUNX4IXNteYdTLMLsnliYAxHKpOvA=;
        b=TVp5OH5i9La0HbBQpygNDo+t5ztztLo49fNp221fEqlJDndmcGIfLUqWeTfGnYImoq
         X6rR4HU+qf91UFoaU6PYV6U3EoAoZk/Z0em5sWQuAsBpGDiVaIgkbwpc8fUOXiSqXf2A
         oMQbsu2qhT9DiChNsOLqZ4OjGH3DoEKabPIjYt5qyIfmg0LP8u2c+ObqbUL1gQ0TxRF/
         TD1vE3yigsk5IULTe5bj15RN/ap2iO5yTJYrleueVpCB05eKAJRbMht5N+Zvvl2kmHXC
         Be0W0wmUt3RD8BUuuQh8vjXP07z/NfGVudBUcdlugreDZSC1mofBGfULNooz2o36QJqI
         GGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E4BJ5/M+NqzTHTTUNX4IXNteYdTLMLsnliYAxHKpOvA=;
        b=rWjzC7aylTnmotqA1Nu4EnbxP0h17OcLw7zVNeMHJNMUc0lbITBR1MH//iT7HAdcuV
         q+hTsYLOQb7DX13wabjMU4RbnEsvSJW4ziyETDbKCCIibcw8ayikXDaD2+fn1huEJnHc
         LJY04Wwry+p8Rsnb1Q4dnA7eiuFtHI7ypyCleADJfjEm1a62w3aswgp6DvmKy1wqpfwa
         9X6H9cyiCm1c12NCcPtjskbL15pvJMGhSz2DdiNUKWnV9IsTBosRuBJUx3CpLNerrb1O
         8yhLCpyD/JGyPyETvcBZcPc/zegzmByCS7Yr80ahVnCr+AaFlwnpr/MVORu6sU6g3TK+
         bYNQ==
X-Gm-Message-State: AOAM530jWvDtqsZXgFn52JGgRfzLGmWMPz4MbsPFSwtewH8kpTUXiaOC
        dGjLDPoz7gleib5Hz8JctJA=
X-Google-Smtp-Source: ABdhPJzkxqS5S/noSr3vtKtPMlTAL0kJJ2mbpL22Xwhek0E7XPAbz35bIl6wDTySzBbodifq2A5ndQ==
X-Received: by 2002:a63:b66:: with SMTP id a38mr16789731pgl.367.1638778372088;
        Mon, 06 Dec 2021 00:12:52 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id r8sm9151652pgp.30.2021.12.06.00.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 00:12:51 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        tangyizhou@huawei.com
Subject: [PATCH v7 0/2] docs/zh_CN: add scheduler completion translation
Date:   Mon,  6 Dec 2021 16:10:48 +0800
Message-Id: <cover.1638777809.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v7:

* Move Yizhou's Acked-by tag in index.rst to completion.rst.

v6:

* Pick Yizhou's Acked-by tag,
* Fix a build warning.

v5:

* Modified some words under Yizhou advices.

v4:

* remove unused label.
* Modified some words under Yizhou advices.

v3:

* Pick Reviewed-by tag.

v2:

* Modified some words under Alex's advices.

v1:

* Translate .../scheduler/completion.rst and index.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add scheduler index translation
  docs/zh_CN: add completion translation

 Documentation/translations/zh_CN/index.rst    |   2 +-
 .../zh_CN/scheduler/completion.rst            | 256 ++++++++++++++++++
 .../translations/zh_CN/scheduler/index.rst    |  43 +++
 3 files changed, 300 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/completion.rst
 create mode 100644 Documentation/translations/zh_CN/scheduler/index.rst

-- 
2.27.0

