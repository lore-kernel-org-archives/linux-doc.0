Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212FDC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 02:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiBXCy4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 21:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbiBXCy4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 21:54:56 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492F323A1A0
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:54:27 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id z16so671415pfh.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j0NgqhdSuS9ROsjpAcMtijUh00D6A0iro0K6kVVrdg0=;
        b=I6OkGqemJNLTIA+JZwG2pWoKQjlQqJpmzDMj8Oz/O6I8xhGXjfRwIBnhMEXNfjw2+A
         ZSM9W7/0ddNr2rmID1jXMnlu/SX4fbS1jOf74HOAc8+x4Ghw6MHhl2khwpQjb1WpDbvI
         P/A0JWhKnC2XJsW5YRV6e4SWQOCnxD6TaJN+y3wDlLU//fdj0mj4kTZd6wFsYYXS2t7v
         VOzxqOYpNL9v8z3thFNKN4U4lTuhnUq5+cbsqF6XzpulKwY3SxO7tiFm9rAA1X4KljJR
         CowZIhmu4kcRJTCzOvoj/Vs3Ebo85Ccu967H1c06VPXeZKU547Gd9N3ADLYds9PaY+It
         DPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j0NgqhdSuS9ROsjpAcMtijUh00D6A0iro0K6kVVrdg0=;
        b=IyMoreQK2tZvqdkjJ6uX3eB9ef6bzPGGuAn6wnnKW/6345bpUcSq57gQt/+gazgcAD
         551xVKOGrpm7pS+v0BQKl1Wt5Z1P0X09IG133C4KhzMK7hRJ7B1hz6hDfQELAXOwcbuk
         b+QHrrWmGihHJcN1EgDbruHAyF5rxgMmibzF3sV+axshYpfbfHVlr6OZWCaoHcuCuzzv
         Dmorud1oiauc2Yh8R6GsevEwJngx0pr2ckv4GOjvulQjP5FnsZxMgqR0VxGhdK0eMzAf
         wqtTraeDYccmR263hBp1DBksz5uK5dAChN6QtsOF4f+cw9nfwWjFXJo9iLOwTO3UhZJn
         PloQ==
X-Gm-Message-State: AOAM533Sn4UZShNCqDMLs9uOx4KaMPN1WvW+PyFHMG4qM+9qOKS/7UsU
        whBecw1L1iZhtxGfkUAzi4hlxPU5Xr75Jg==
X-Google-Smtp-Source: ABdhPJyGuG2Zk6DtWVAXpYPAfHJ0wPK92s+++T+eh/ng1TghoA1gX64qVVen2JYnP5SufrQBc5g3AA==
X-Received: by 2002:a63:1c21:0:b0:374:104c:e4eb with SMTP id c33-20020a631c21000000b00374104ce4ebmr667956pgc.556.1645671266754;
        Wed, 23 Feb 2022 18:54:26 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id 132sm996595pfw.21.2022.02.23.18.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 18:54:26 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com, seakeel@gmail.com
Subject: [PATCH v4 0/3] Add Chinese translations for KSM documents
Date:   Thu, 24 Feb 2022 10:51:11 +0800
Message-Id: <cover.1645669457.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v4:
  Fix build error and build warning.

v3:
	Fix the patch '[1/3] Add Chinese translation for vm/ksm.rst'
	because its old version does not apply for the latest commit.

v2:

	According to the suggestions from Yanteng Si, Alex Shi and
	Jonathan Corbet, I have modified my patches. Here are my specific
	changelog:

	1. Remove Redundant Labels in added Documents like ``.. _ksm_sysfs:``

	   Yanteng Si said: Too many tags will cause a compilation
	   warning, because an identical one already exists for the Origin
	   document. Jonathan Corbet think so.

	2. Align with standard Chinese format on the 'original', 'translator',
	   etc.

	3. fix some translation error like “pages_unshared”, I remove  '独享'.

	   Alex Shi suggest to remove '独享'.

	4. Refactor translations/zh_CN/admin-guide/mm/index.rst.

	   Yanteng Si: Compile pass is only one of the basis for checking
	   through, we also have to check the html for any problems, as
	   far as I know, the above treatment is very ugly.

xu xin (3):
  Add Chinese translation for vm/ksm.rst
  zh_CN: Add translations for admin-guide/mm/ksm.rst
  zh_CN: Add translation for admin-guide/mm/index.rst

 .../translations/zh_CN/admin-guide/index.rst  |   2 +-
 .../zh_CN/admin-guide/mm/index.rst            |  49 ++++++
 .../translations/zh_CN/admin-guide/mm/ksm.rst | 148 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |   1 +
 Documentation/translations/zh_CN/vm/ksm.rst   |  70 +++++++++
 5 files changed, 269 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/index.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
 create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst

-- 
2.27.0

