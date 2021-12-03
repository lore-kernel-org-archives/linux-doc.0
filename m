Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C77AC433F5
	for <linux-doc@archiver.kernel.org>; Fri,  3 Dec 2021 08:05:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350605AbhLCIJP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Dec 2021 03:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242383AbhLCIJO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Dec 2021 03:09:14 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B9FC06173E
        for <linux-doc@vger.kernel.org>; Fri,  3 Dec 2021 00:05:51 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id k4so2281420pgb.8
        for <linux-doc@vger.kernel.org>; Fri, 03 Dec 2021 00:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K1mkNip3xKyUPd4tup6bWI4ZGviLhFqez1CJUaxyZRk=;
        b=F9Wi5cx/p4WgYHu3eWK6dFv4UOmiNJIthNeXZYwW0ydItRF8dcHToBWOOC9mYvD+Gp
         5+SJwsjNWO2HcBk4io+2ZHKeoLnNOVte5Xk2j8taiKM05dzpJhl7NwPEwVLe1D6aQzGY
         h2K8tZPbK2XSOwTUBNBM4FHll1Z1oYUVVgbrsI+4rG08omDzVQi9ITpkCxWqr25HIEr/
         pVx7Os6/cBgyG3cfMMFb3ev9c8TZ10w/5MivQ8f9cwyrdURFK6pttEdlridt53Vp62pQ
         2hWR7rUK51+qArTRJYhaEACM3m7JN5vsXmFhXKmvf5+KtjLoaP7XreykrqZBfpe8KHwx
         2AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K1mkNip3xKyUPd4tup6bWI4ZGviLhFqez1CJUaxyZRk=;
        b=bO+UEhKPeRN3Wrxegfxs0sO0tEV9An4TqNLiy2y66nm/RhpNEhpiCrUMH5YF/IwHNk
         v7fn5FbJkzKWnOHcRMFIzj4PrVqA36KjaCc8cTKZRa595+Zmi4VmJt8YLbNn8sj38BhY
         drtNOMfS/E/T6cipfp3U3Vtw5mmsfqoX3b91Ms6pY0mF9xZIt+XOl8UaMxumPoTmRNwM
         iix+nPQBNWse0yJk5ijmahf/IvoB7pICfpN/s9S4kfFqX77rJGV1ZKEN9RJQJurv+ITY
         sljfyR9vHZ307iN7QuGBsPYuw5Wb5lESLr7IfbxdpNclt7wu7hW/5k0mpI2zYGoZpYb1
         TXmA==
X-Gm-Message-State: AOAM531wEQayg3SmGXV32wygYfTOWygNbtrYQUCwKpIU0iYfKnHFrrnR
        25AGi6MXTrDzVlyeJqm2rmk=
X-Google-Smtp-Source: ABdhPJw9iuVKtjRpyCdUYOCvIg05odLyNWaoVOJ1rvmhTmL1Dn9imgFF9iDetYGPhJVyWJJJLyt1qA==
X-Received: by 2002:a65:464e:: with SMTP id k14mr3385789pgr.493.1638518750621;
        Fri, 03 Dec 2021 00:05:50 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g189sm1671593pgc.3.2021.12.03.00.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 00:05:50 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com
Subject: [PATCH v3 0/2] docs/zh_CN: add msi-howto and sysfs-pci translation
Date:   Fri,  3 Dec 2021 16:04:29 +0800
Message-Id: <cover.1638517487.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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

