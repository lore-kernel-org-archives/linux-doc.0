Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33EAC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 11 Dec 2021 12:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhLKMNQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 11 Dec 2021 07:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhLKMNQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 11 Dec 2021 07:13:16 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40ACC061714
        for <linux-doc@vger.kernel.org>; Sat, 11 Dec 2021 04:13:15 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 8so10833230pfo.4
        for <linux-doc@vger.kernel.org>; Sat, 11 Dec 2021 04:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9fX1z9n7hNKS1CqiuNaYVS53BebZTH2YW6arWQG6ZY8=;
        b=Lgs1X3V/VzvCAiMmjQw3QQVv+t86RloyaEscMww062dJG38Oq8EKrIQdEkN4N+YwFW
         EL5IpZv8+tqp6yglW8cUwiiEI8++3QL2TMl+zz8BTvMGWKi1QDDPhWIax3dA0VAQebui
         O2Uk0J34NnBvXS4fKAukyrkZ2HtyvLvhBSqNxY2piEk80xZVCcGlobPFmQqNiA9Usxpf
         0Ar+FmCLWiTgEeqKmCepesGfhS8ycmibdxyh1DzkXqt1j4eIhtxjbNXT/v67cX8Ci++N
         52Li67Swsknp8vYPSij48hS7JSNNM3jmjcjt22gdUqSBfUx2uB9WurGi5VG82xc38d0I
         gquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9fX1z9n7hNKS1CqiuNaYVS53BebZTH2YW6arWQG6ZY8=;
        b=UndeYGK00AKJQgnOpN8KPXojcAg7SbzeoX1F0s5EU8Re3Lo6t2KZPaYt8DhGf9Flzj
         m0vE/DwDAC6YGeRvE2G5oTWyPKdDtmMxDF3EYxwiZX3oXCkBJCR4NxX4VJoelxF4sTbt
         poIXB9p04Fv8cBmCqmj3x1CsW/NIPxmGD/515NZZEnhj1f6e9BWxu/8RMZW350w6a3oQ
         JYFgjcsRjozdZIawHsNwB8ALQNqHs+I1sj9k5PGdoklubIrP0ZDTKyIQgRauAnemkwVC
         +2xM6GNWW8mQHzREYf1QXCroxFb6pvmXJc/A2apmSyttc/g1W3NVj5CGZeK0A4rEn7S8
         KPMQ==
X-Gm-Message-State: AOAM532yuTm8vxO346XtGVzsTYH+sdsPwg1doSGHzWbxivzJ08QbtPNJ
        ny3pdPvSLBabv72j/dM9CdE=
X-Google-Smtp-Source: ABdhPJydu7Ytkkkrc5WasI69IBDbin858tC+P1pXBAGhSVQsrN3Jly8/1vPKsRNpzeGbyZ98CUUoFA==
X-Received: by 2002:a63:211b:: with SMTP id h27mr43995296pgh.203.1639224795339;
        Sat, 11 Dec 2021 04:13:15 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.60])
        by smtp.gmail.com with ESMTPSA id qe12sm1966676pjb.29.2021.12.11.04.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 04:13:14 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v4 0/2] docs/zh_CN: add msi-howto and sysfs-pci translation
Date:   Sat, 11 Dec 2021 20:11:43 +0800
Message-Id: <cover.1639224005.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:

* Test in next-20211207.

v3:

* remove unused label.

v2:

* Pick Alex's Reviewed-by tag.
* MSI -> 消息标记中断。
* modify index.rst. (When applying the series, they depend on the **pciebus-howto and pci-iov-howto**)


v1:

* Translate .../PCI/msi-howto.rst and ../PCI/sysfs-pci.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add msi-howto translation
  docs/zh_CN: add sysfs-pci trnaslation

 .../translations/zh_CN/PCI/index.rst          |   6 +-
 .../translations/zh_CN/PCI/msi-howto.rst      | 233 ++++++++++++++++++
 .../translations/zh_CN/PCI/sysfs-pci.rst      | 126 ++++++++++
 3 files changed, 362 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/msi-howto.rst
 create mode 100644 Documentation/translations/zh_CN/PCI/sysfs-pci.rst

-- 
2.27.0

