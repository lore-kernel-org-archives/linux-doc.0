Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C23C48BCF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 17:27:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4100261357
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 17:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhFLR3R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Jun 2021 13:29:17 -0400
Received: from mail-yb1-f176.google.com ([209.85.219.176]:45829 "EHLO
        mail-yb1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhFLR3R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Jun 2021 13:29:17 -0400
Received: by mail-yb1-f176.google.com with SMTP id g38so9030238ybi.12
        for <linux-doc@vger.kernel.org>; Sat, 12 Jun 2021 10:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=mdShDFh44DQoGlwI+dvxyL6GCJidOL6s1il3eB3Db5E=;
        b=iPtym0DIBJjpViGTwM6yQjt4OX/1YIy6L0B15iDeX3k2Uc4iPNGu/6nfUNUx6aNVsE
         BMpBx3spSgD0rqiPkbs/Jwr0KV/bL8Ql3k8X5B6R5Hv9lAtlDeRf35OsQ9IdpgV5hBmi
         QjafuRbdS6sz4eFO5gH5F1j/KxACykh01I0iRmnUdzIngFf1wcl+IoQCAzRT32xCfKnB
         bRV5qv69uw5Ka2TSPlQsiYH9uS4mhaVMvO/tmk44xpEmvFKdRDcb90Cj7h8nPo4qZtfO
         kXiqdfIJ8ai0373HgY3CK4gFQqqK15ipQL9k0kATln0a+LbW+0Vrse6T1aF2xrkDKShu
         i0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mdShDFh44DQoGlwI+dvxyL6GCJidOL6s1il3eB3Db5E=;
        b=tU5t1gow3RYAEiYNU/619X9YZPUSat07PoFCTYv9MIAi97b9gyMnBfjDsNThRfMw1n
         hC2nXZwbu0OjSHMrrK/HSe9ikO/4OcAJMiYcDRtC0Fg2izm0bEE6R7M+Jz4vPrDl73AW
         Ookco9gAXrzFr9ANYoTFLXJoILKWp0QfMqlFGOKCKrxc89vAUkUr3qr9ivCvxIPmstGP
         Jwsjibv09H14MvvDA/DAlg/lOKZjkc2uL8M70bbgjJkBY6oDqNZ5rqpPoZADlFRi4L7X
         7rF+M/euPqXYAPoekmd5tOUJd8pZLS+Do/bWPSbJ7LAwHAgVpuNwDy/CmWU7RpPESDNY
         ZdnA==
X-Gm-Message-State: AOAM530azaU6Ss59hVqG+xzSgCakqSuCg4rbNvNLPHz8c8mXK7WobSBM
        Yusc3/R46LTiCPR1gJzqAzUU085Ck7M485HHrqx5smYgw0c=
X-Google-Smtp-Source: ABdhPJyaBSnYk1Y1zqmzJgBC5Li86cCCtrQ0fKmAAnz3yg8lpRd7FrG+hBZvOisuwoa7Z4kshVJH34RWUcy+YVzaci4=
X-Received: by 2002:a25:ba10:: with SMTP id t16mr13663327ybg.87.1623518776849;
 Sat, 12 Jun 2021 10:26:16 -0700 (PDT)
MIME-Version: 1.0
From:   Grzegorz Zdanowski <grzegorz129@gmail.com>
Date:   Sat, 12 Jun 2021 12:26:06 -0500
Message-ID: <CAAoDVDDCWKw9_uh6i70zW6uCH_bvuBWyQV7u=TW_ne9CaWA0rQ@mail.gmail.com>
Subject: Are documentation-only patches welcomed?
To:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi!

While dipping my toes in Linux kernel programming I discovered that a
lot of functions, even exported ones, lack any comment blocks or
references to documentation. Most of the time I have to resort to the
original commit message + LKML threads associated with a given
function.

Is this intentional, or is it simply a by-product of the lack of
developer's time? If it's the latter, are documentation-only patches
welcomed?

Regards,
Greg.
