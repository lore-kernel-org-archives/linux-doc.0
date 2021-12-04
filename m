Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FF1C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  4 Dec 2021 03:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384130AbhLDDTR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Dec 2021 22:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384126AbhLDDTQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Dec 2021 22:19:16 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D98C061751
        for <linux-doc@vger.kernel.org>; Fri,  3 Dec 2021 19:15:52 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id n8so3377756plf.4
        for <linux-doc@vger.kernel.org>; Fri, 03 Dec 2021 19:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2wTOEuZBnB0qRlk+2MLZw6h/ppkXT3Ml8FuzQWrg5s8=;
        b=dNqiaAxZ+iS4Sl1zO/vRdvSbxVLhuvqh81r4EWufsGoenx53bAY7WvMShAb+c4S3XL
         fTh9Sra2wIFRJ+McknTfiAfhzDEmvHYQIUAOjK8yLSv2VWXS6wzVJg+dY+fqU1Ngodb9
         ZhipKvis7hDpGEKIn9X+6kdLELOD+BDbEyNGtynhgeA7KhgkFPn4QIe4jT0OQAt/DVn7
         +OB3D/D3Fx/G4ffHYPpWhC/2OW6kXnHEA9j/O5I/Trpf73NbQTO+b0yhrtYznqLSP1RJ
         GAUaidaLNN1dnNUf/PhECCXRxFnZf6KrukV7ZiLWB2XCDzj5qcg+KDeREENb1i/oGjij
         W+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2wTOEuZBnB0qRlk+2MLZw6h/ppkXT3Ml8FuzQWrg5s8=;
        b=totuv6roKH/coXP2h9qiEqF4OaG5yTBF2mTpzIr7xEFOkS0wBVQZNMl5LPkvbcAzXP
         lJtMKASD6DmsNB0Xh03cWhGnU3rclzSmgndFzhuaSERtnWVPyHx0W+pyYe4lQ8KBP5hk
         R60ZJP4O1YB//AMP+YT9wSsu/n7Mgq/1ym6lFEl7y2R0rUJv4afyUNPhV48V9w0fOysf
         LCntUKqd53EVgCLgu3ROECA4WgI5Zs1bQDMQI1xhCoZYd+ank58e9EKkTtrodQb9iBSu
         hzrJZX/Zg7VXfAqFYXjEI52Wt23d2BBzS0FRao6EJuywf0i3iaRxPoB9vlHu9lpE2pNi
         oSUg==
X-Gm-Message-State: AOAM533yHHYKu81eXIsqR/C7fxoewXfiqApVUqKM88K4qQ+x/cig0+IO
        m2fxpwWpKCYhYXTvjNcd614=
X-Google-Smtp-Source: ABdhPJzxFcu9V7JxaIyI9eOn8Hy7h0puKo79utqcMc2OT4mkLl7qyV3hj0O6mcxzhYS0yUcQsl6+ug==
X-Received: by 2002:a17:90a:1f45:: with SMTP id y5mr19513454pjy.138.1638587751466;
        Fri, 03 Dec 2021 19:15:51 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id y32sm4803262pfa.145.2021.12.03.19.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 19:15:51 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, tangyizhou@huawei.com
Subject: [PATCH v5 0/2] docs/zh_CN: add scheduler completion translation
Date:   Sat,  4 Dec 2021 11:14:25 +0800
Message-Id: <cover.1638587477.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

