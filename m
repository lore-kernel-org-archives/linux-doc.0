Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE779C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 15:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhLIPPI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 10:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhLIPPH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 10:15:07 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74196C0617A1
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 07:11:33 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id u4-20020a5d4684000000b0017c8c1de97dso1497690wrq.16
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=LBECnREKPHDRg4E+pCsN1I2d9IcImWBPu4S35mqNBKU=;
        b=qi9qUTtTlW/2AeraLiOjix04O2Oby2w4PlV+g8wG73UkSDlX1bpswEXC/PfRH9WUSh
         q0fyMUJ8EuHqUC4qyYU9I0+odvpizV7hJU6/K9AteffBtI3wE1W+4gEfchpVUzoJffCe
         65ToPSigml+wiXpZgE1WLrszCfY/vPtOOxHQ+jeSd0pDeUUo0d7K0lFmb74ev1a4GUh1
         VQDxa/WLtvbspIAkDezALjWdylXPksfUWFlG4O+9iuqV7jIkfeSJKoN8dz2pnbH69dDV
         k78e4zS1c5LIRbYuImK+nSHx0zzCsY4KcaLXvzRisFih6doHEwDmKjE64C11ylIfiRvw
         7rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=LBECnREKPHDRg4E+pCsN1I2d9IcImWBPu4S35mqNBKU=;
        b=YPo6DU2x4S6j7NGq1t514VNB4NHkK99oQh/jHiApDZWT0JV7ZjkikWJcqVmBFu9KFT
         6NAVVI1Rgea1uMYavGztMhtbCjWRqJ2I/BnsIfexyPfbMPSSz+jWatJlMx/luu64114G
         oE9iSNqFAQsTntWhn+YsRxTiVzROUQrlndiMk0XmxS08Ump4CJ6AwHCJBdt8c7rzLltb
         mFzL082UBfQ6ky1QUTk54X8sO8rBc9rr6njL7nloYILoxfMjTUt8Icqp7e/YeOCQ3VN0
         ONEmPAwl7RqQyEZhynnT98zBVKJv3IItoFKXke3hAwxedZ21kT8ExKKedRCImi/K33uw
         nOgQ==
X-Gm-Message-State: AOAM531vvGyPvjQlAfM8cqApwpcfpztmpYo1buJa+FA4in2LPJK1seHZ
        0PFUlDDeta/5iAndmJ5/U5WNTh8M5JENwA==
X-Google-Smtp-Source: ABdhPJxefyUfmKB1JnifoUejTcXsS/4eT0tMAE1ICnNUQrSJ8Xh9cZtVmSfLkneejLBVmE/Hg5LMsux6iA130A==
X-Received: from dbrazdil.lon.corp.google.com ([2a00:79e0:d:209:8f9e:94f7:810:211b])
 (user=dbrazdil job=sendgmr) by 2002:a1c:9d48:: with SMTP id
 g69mr8247086wme.188.1639062691952; Thu, 09 Dec 2021 07:11:31 -0800 (PST)
Date:   Thu,  9 Dec 2021 15:11:21 +0000
Message-Id: <20211209151123.3759999-1-dbrazdil@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
Subject: [PATCH v2 0/2] Driver for Open Profile for DICE
From:   David Brazdil <dbrazdil@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        David Brazdil <dbrazdil@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Andrew Scull <ascull@google.com>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Open Profile for DICE is a secret derivation protocol used by some
Android devices. The firmware/bootloader generates the secrets and hands
them over to Linux in a reserved memory region.
See https://pigweed.googlesource.com/open-dice for more details.

This patchset adds the corresponding DeviceTree bindings and a driver
that takes ownership of the memory region and exposes it to userspace
via a misc device.

The patches are based on top of v5.16-rc4 and can also be found here:
  https://android-kvm.googlesource.com/linux topic/dice_v2

Changes since v1:
  * converted to miscdevice
  * all mappings now write-combine to simplify semantics
  * removed atomic state, any attempt at exclusive access
  * simplified wipe, applied on ioctl, not on release
  * fixed ioctl return value

David Brazdil (2):
  dt-bindings: firmware: Add Open Profile for DICE
  misc: dice: Add driver to forward secrets to userspace

 .../devicetree/bindings/firmware/dice.yaml    |  51 ++++++
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 drivers/misc/Kconfig                          |   8 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/dice.c                           | 161 ++++++++++++++++++
 include/uapi/linux/dice.h                     |  14 ++
 6 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/dice.yaml
 create mode 100644 drivers/misc/dice.c
 create mode 100644 include/uapi/linux/dice.h

--
2.34.1.400.ga245620fadb-goog
