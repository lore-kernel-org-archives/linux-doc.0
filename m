Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A4DC433ED
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 12:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F29E361208
	for <linux-doc@archiver.kernel.org>; Sun, 25 Apr 2021 12:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhDYMPS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Apr 2021 08:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhDYMPS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Apr 2021 08:15:18 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80AEDC061574
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 05:14:38 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id l22so53442734ljc.9
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flodin-me.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ui/oKByGj6/AJm7hu4VFd9WZLUmRk81ykuLYPnPSCVY=;
        b=QfR2dSBul9bd4vawyBhHnAhxghgs9zgb5zm9HQNdEKpvJF08HpKKwgdsxw/oFypow/
         iA6q9df2izTHyTKuVP8I5Ssmfve1clMRcR4kPXA8ScofYh15h1WpCN92rJPAROJwwE4v
         uPvacEfZGbL4ozFMtAguSTb2P6vrTde2voRA5xj8Zhz2QWgIo+6klPmRXvxmZjY5mL6P
         KqZgV9aArJsRx6Ytqp/GZC1lfMxs6to7CyhofTzawv0MmTLoNUCOlT/DILVakckIgveU
         pRXvKTkKe+GrxfYLHLvGE5XaT3HC/5afn6AoggxDJ7RY41YWoW37Qe2uefr0wByNktIL
         FuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ui/oKByGj6/AJm7hu4VFd9WZLUmRk81ykuLYPnPSCVY=;
        b=DzB2W0lHFYCyCN33j59fHp5OpuFnQcJ+3U6ZRIcyH+m4iy7EOz3fdRZkjFZ5BoJxPJ
         rfieJ9hyawWlBVhx97gDAuPGxCFYAT/fyflfzuCqskPqvoUl2vLovm3X3bXWnYPAeeo+
         +/ZNEdWDwsNzO6Uxl6OTCRPp2U65mS/ZuQo03loqVTemLPED669LDV3JJ4hVGIOEOCUx
         2z8RkrLZAvcG0ryF5FLVza6/TdAMQ+g2m7bycGMdvQ64O4r5r34hRi8RRvuVYcI3vPNz
         2oGE3Y44A9c5UENTcXNO8lAxO0yFy7nnWlhH6zDozOS7w8Ias9fa+P0PK0iEnfIehi1v
         X8NA==
X-Gm-Message-State: AOAM532fqDyM5aAranBAfkjCZnNl7KFCsd5d5hbx39WysWOQTYN+xYta
        JheTrc3EaQpMELU0RhYSKbnXBI8ROFXqdiMn
X-Google-Smtp-Source: ABdhPJysUMW1n1S3Gnnmo3ezhuxasYZ3BykSEP6aSrzva9nEPyssRGHfrrAzM+qFPgtsgJi0X1Ao1A==
X-Received: by 2002:a05:651c:106f:: with SMTP id y15mr9654599ljm.145.1619352876770;
        Sun, 25 Apr 2021 05:14:36 -0700 (PDT)
Received: from trillian.bjorktomta.lan (h-158-174-77-132.NA.cust.bahnhof.se. [158.174.77.132])
        by smtp.gmail.com with ESMTPSA id w16sm1120049lfu.160.2021.04.25.05.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 05:14:36 -0700 (PDT)
From:   Erik Flodin <erik@flodin.me>
To:     socketcan@hartkopp.net, mkl@pengutronix.de
Cc:     davem@davemloft.net, kuba@kernel.org, corbet@lwn.net,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, Erik Flodin <erik@flodin.me>
Subject: [PATCH 0/2] can: Add CAN_RAW_RECV_OWN_MSGS_ALL socket option
Date:   Sun, 25 Apr 2021 14:12:42 +0200
Message-Id: <20210425121244.217680-1-erik@flodin.me>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a socket option that works as CAN_RAW_RECV_OWN_MSGS but where reception
of a socket's own frame isn't subject to filtering. This way transmission
confirmation can more easily (or at all if CAN_RAW_JOIN_FILTERS is enabled)
be used in combination with filters.

Erik Flodin (2):
  can: add support for filtering own messages only
  can: raw: add CAN_RAW_RECV_OWN_MSGS_ALL socket option

 Documentation/networking/can.rst |   7 +++
 include/linux/can/core.h         |   4 +-
 include/uapi/linux/can/raw.h     |  18 +++---
 net/can/af_can.c                 |  50 ++++++++-------
 net/can/af_can.h                 |   1 +
 net/can/bcm.c                    |   9 ++-
 net/can/gw.c                     |   7 ++-
 net/can/isotp.c                  |   8 +--
 net/can/j1939/main.c             |   4 +-
 net/can/proc.c                   |   9 +--
 net/can/raw.c                    | 101 +++++++++++++++++++++++++------
 11 files changed, 152 insertions(+), 66 deletions(-)


base-commit: f40ddce88593482919761f74910f42f4b84c004b
-- 
2.31.0

