Return-Path: <SRS0=sBCo=3S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56E3C33CB2
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BA6F20702
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAjvipnB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgA2Et1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jan 2020 23:49:27 -0500
Received: from mail-qt1-f178.google.com ([209.85.160.178]:38488 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgA2Et1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 23:49:27 -0500
Received: by mail-qt1-f178.google.com with SMTP id c24so12293433qtp.5
        for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2020 20:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IZ3ee3HA5FGNMPp1POF1PbflP34bzuh54UlBmDuMnQk=;
        b=dAjvipnBvb5CsniavW+3Pks6+541jqQrHWk/yzYRuwbS7QBBGWb9Z4G8KCJFiyYzHh
         A5vVAo2VxSPv7LIHvIj/rlNDsDF5PCiGhskdE7uyor6uz3D5GIgWLtz/n5Nnhp7rr1iD
         6Z4iTxXwtiXuueR4CQ3iIpYeAo5CZTA6vUKRVcqzHMlCo7ZqRjQqClA7KXyMrsMq5jAp
         WLXJinhmMMemyj7bRS2K9efVaUPbYFrmHv9HQT3j8tIAnxMs+H73Lgy1cQdY4QrADeoo
         QFcd4RqfdrPk76/p2Aos/XjCVgP6T/fwo3u1+FFzhDmQ3kpWzq/d3exnAwwM9wMhQf62
         Q5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IZ3ee3HA5FGNMPp1POF1PbflP34bzuh54UlBmDuMnQk=;
        b=LYCPid+uxvTBcqtUgwe4iVQbHgp8UH0wSNxEXSyxuWpTsWBSe3KC1rXj6HCxL0Eaoq
         4Ln3cQiSuOzgwKwT4KgLB8t/TMJFRGqqQ2bEVJUhPLIH0PAYQeeGkn46J9mpIJGVZz6Y
         B7DD9iNrulOdj1Ium0yY3mCO26x9P7pun1i6q7sAazTghBlLzqW/XhavHmRm5DajGi84
         KrkG97ItpBhu/r15q120wz0+BD+JgYNkA0qFKTYRo81Io4SPA8GoJsbYBdAGEaubd5ND
         eET/xBEpQoxSvSD3Rqwj8J1X7nouL/+wXFtajIieu9I9LP0snbed4SgbW//L+aXRwDcy
         Y/0Q==
X-Gm-Message-State: APjAAAUmA5/Ack3SPZ94/QZ9s0EFn73XXhUW0CpNU6gRqIbzAIsNT66m
        o8N+RIrsmiEakgbTgws98vg=
X-Google-Smtp-Source: APXvYqzGfJZfHYczpRZSw+KoyZO3wH/tQru4hxWTOFGn/E0Bvhx67vqwzUvv0iydajOvVEli/wJ7Iw==
X-Received: by 2002:ac8:7b24:: with SMTP id l4mr25051550qtu.3.1580273365688;
        Tue, 28 Jan 2020 20:49:25 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id a22sm487320qtd.48.2020.01.28.20.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 20:49:25 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     corbet@lwn.net, mchehab+samsung@kernel.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 0/5] Documentation: nfs: convert remaining files to ReST.
Date:   Wed, 29 Jan 2020 01:49:12 -0300
Message-Id: <20200129044917.566906-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This series completes the conversion of Documentation/filesystems/nfs to ReST.


I did not think these rst files were supposed to be
in admin-guide, so I left them where they are.

Changes in v2:
	Change csv-table to ReST grid table format
	Remove "#." syntax

Daniel W. S. Almeida (5):
  Documentation: nfs: convert pnfs.txt to ReST
  Documentation: nfs: rpc-cache: convert to ReST
  Documentation: nfs: rpc-server-gss: convert to ReST
  Documentation: nfs: nfs41-server: convert to ReST
  Documentation: nfs: knfsd-stats: convert to ReST

 Documentation/filesystems/index.rst           |   1 +
 Documentation/filesystems/nfs/index.rst       |  13 +
 .../nfs/{knfsd-stats.txt => knfsd-stats.rst}  |  17 +-
 .../filesystems/nfs/nfs41-server.rst          | 256 ++++++++++++++++++
 .../filesystems/nfs/nfs41-server.txt          | 173 ------------
 .../filesystems/nfs/{pnfs.txt => pnfs.rst}    |  25 +-
 .../nfs/{rpc-cache.txt => rpc-cache.rst}      | 136 ++++++----
 ...{rpc-server-gss.txt => rpc-server-gss.rst} |  19 +-
 8 files changed, 381 insertions(+), 259 deletions(-)
 create mode 100644 Documentation/filesystems/nfs/index.rst
 rename Documentation/filesystems/nfs/{knfsd-stats.txt => knfsd-stats.rst} (95%)
 create mode 100644 Documentation/filesystems/nfs/nfs41-server.rst
 delete mode 100644 Documentation/filesystems/nfs/nfs41-server.txt
 rename Documentation/filesystems/nfs/{pnfs.txt => pnfs.rst} (87%)
 rename Documentation/filesystems/nfs/{rpc-cache.txt => rpc-cache.rst} (66%)
 rename Documentation/filesystems/nfs/{rpc-server-gss.txt => rpc-server-gss.rst} (92%)

-- 
2.25.0

