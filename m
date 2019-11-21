Return-Path: <SRS0=s6Rs=ZN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F7AC432C0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 00:03:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86E042075A
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 00:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JsQWdJHB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfKUADM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Nov 2019 19:03:12 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41654 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfKUADL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Nov 2019 19:03:11 -0500
Received: by mail-pf1-f196.google.com with SMTP id p26so630235pfq.8
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2019 16:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=kE4zc5h6g2FxYn8FExOX8denzzfy5tUjIQSu5KP5KmM=;
        b=JsQWdJHB+oNkBu7ELea7xobOL8sPLan0tvqfIXBGQb8cKhX2p5HOSu59C39cXn21E5
         /EEkVA+Px+gj1I2cR5vhwhVwJTxp6aYfMFvtRQxDIkHEDh/t7ThaOHgxiqtcu26y+tQB
         yK527WA4x8pmDhcJPggr5jOivZihBSKaHiFac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kE4zc5h6g2FxYn8FExOX8denzzfy5tUjIQSu5KP5KmM=;
        b=n1/p+O0BMXycF+KtnHoJgiO45xkpMg02dQI9LHOeF3v7AWk5CK/W4ZbrYvT2Untyou
         TWM/HApjLrKZKeUfnxAlkhmQBD8MwKg0rBlo5zrmlHppUEpGUNtNj7PNBQot4f6qulai
         NeTVvaehWzMFGYS6dj+AOTybA35ACtqXb1qq2NHuYkjfGW9fxRcMQw1QQtqZGzwkSgvX
         OAn03KEoqmY6DgpPdbEbAtPqJYkolk/BIMxhdrZOAGBfYyYlH7zgjxwf2gzhibtK/9oE
         71WdHR/qOE9ERNMOMeQxDAesNnfMJ5aQwGT0VpOpZPMLJLHrEKDVNzjphzs9q+zSd7JH
         nN7g==
X-Gm-Message-State: APjAAAWPw9InLw5wUgAmGs6moDxn7CVAWPNoxtPqHMELjGIB9syZPq/O
        DcEwVnKa/3wfC+SDagYN8f41E/1Qhwk=
X-Google-Smtp-Source: APXvYqy350K6RxOhGawpWh8zemjxoDaCUC89yo91oTtqYpdp242hU/Mj6Kh82KEizm35UJmtm2Igow==
X-Received: by 2002:a63:ce0b:: with SMTP id y11mr6074021pgf.338.1574294590899;
        Wed, 20 Nov 2019 16:03:10 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 7sm358842pgk.25.2019.11.20.16.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:03:09 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] docs, parallelism: Rearrange how jobserver reservations are made
Date:   Wed, 20 Nov 2019 16:03:01 -0800
Message-Id: <20191121000304.48829-1-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

As Rasmus noted[1], there were some deficiencies in how the Make jobserver
vs sphinx parallelism logic was handled. This series attempts to address
all those problems by building a set of wrappers and fixing some of the
internal logic.

Thank you Rasmus for the suggestions (and the "jobhog" example)! :)

-Kees

[1] https://lore.kernel.org/lkml/eb25959a-9ec4-3530-2031-d9d716b40b20@rasmusvillemoes.dk

Kees Cook (3):
  docs, parallelism: Fix failure path and add comment
  docs, parallelism: Do not leak blocking mode to writer
  docs, parallelism: Rearrange how jobserver reservations are made

 Documentation/Makefile                   |  5 +-
 Documentation/sphinx/parallel-wrapper.sh | 25 +++++++++
 scripts/jobserver-count                  | 58 --------------------
 scripts/jobserver-exec                   | 69 ++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/sphinx/parallel-wrapper.sh
 delete mode 100755 scripts/jobserver-count
 create mode 100644 scripts/jobserver-exec

-- 
2.17.1

