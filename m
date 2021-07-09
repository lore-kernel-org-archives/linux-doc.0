Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFBFC07E99
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 13:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B91C6135C
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 13:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbhGINp3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Jul 2021 09:45:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51377 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231454AbhGINp3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Jul 2021 09:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625838165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=spNjQtptlEVcvrozmGO/HwieAqlxhlgOeqNnoaP4BpY=;
        b=Tdog0RHJg9yXq4pyHOpmw7wnLh4e8au/BLYmvKGO+d5mFsZlnyq7z9HQTbHsWOXMu4ADVU
        LRdEhjdgFmbeuS69gzt0apKVHgk9CYtQ5JaG1+liSrn7bgFG2aIbPehoQloFynMabQuTho
        vfy6bf+OJXIWPJMpIASOjjts4nw6g7o=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-beneFJmZPL6O9oPyusecmQ-1; Fri, 09 Jul 2021 09:42:44 -0400
X-MC-Unique: beneFJmZPL6O9oPyusecmQ-1
Received: by mail-oo1-f69.google.com with SMTP id j3-20020a4a94430000b029025c2496941aso2446398ooi.10
        for <linux-doc@vger.kernel.org>; Fri, 09 Jul 2021 06:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=spNjQtptlEVcvrozmGO/HwieAqlxhlgOeqNnoaP4BpY=;
        b=r1oJjVJXjeNs4Tmp4Ni96cP9XVQE3OEmC41mcogBjkA38LsC97o3UIU4Y9EXxMaytJ
         +rX2s/10gbQR3kFow/ib0arEmQB0X1FxbFIG28QXLub7M6xvEKzT98u7ZfM0AbHe9SxW
         HRm50bosHKxFj0c0e0PmdEUe9FOovihSYRKABqkqH4QHBl40fZrfUboe/k7pLLk1QKWc
         tbkXrK1gdC48AWJtcM/s7i7/a0IfTQfeYCeDOxXgve/FPMbarms6wjOHlFOule2Q6Q8N
         TBVuIJhMgabvIFniMgiqYwKDi+cTSiovEtyD5UtMVIja8F8qpWtx3FEx96WbEUgl3rps
         tyTw==
X-Gm-Message-State: AOAM531vpktzQ6R3/NvntblfsYwP0jKTvo8R2ka74Dvceq72COJEurQN
        LDDVI0dFBAznkhO4TLg9o9MNWsDf6+wJK/uoADUe/mRLZYvq0la2b9f0VBYR3vBkSRNkU/X2Bbu
        6HXCZw4S7MXLmubePe4S2
X-Received: by 2002:a05:6808:1309:: with SMTP id y9mr8090797oiv.112.1625838163812;
        Fri, 09 Jul 2021 06:42:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/AJPAkUCZeXsxN5RuvbhEljezHAASCYfU2JIHa1+Afjzzn229yEybXEiXgtKE1cfhbxzfzw==
X-Received: by 2002:a05:6808:1309:: with SMTP id y9mr8090778oiv.112.1625838163596;
        Fri, 09 Jul 2021 06:42:43 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id j23sm1215948oie.9.2021.07.09.06.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 06:42:43 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, corbet@lwn.net, hao.wu@intel.com
Cc:     linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2 0/4] fpga: fpga-mgr: move compat_id from fpga_mgr to dfl
Date:   Fri,  9 Jul 2021 06:42:24 -0700
Message-Id: <20210709134229.2510349-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A followup to
https://lore.kernel.org/linux-fpga/aa06a7ca-eff3-5c0d-f3b0-f1d9ddb74526@redhat.com/
The current storing of compat_id in fpga_manager is dfl specific.
This makes the refactoring of the release()'s complicated because there
is a dfl specific flavor of register().

Keeping the compat_id sysfs abi, each implementation through the new
compat_id_show() fpga_region op can print out whatever value they need
to the sysfs.  Currently only dfl does.

Since there are now two ops for fpga_region, give fpga_region its
own ops table.  Add a wrapper for get_bridges().

Changes from
v1
  Completely written to keep sysfs abi

Tom Rix (4):
  fpga: region: introduce fpga_region_ops
  fpga: region: introduce compat_id_show op
  fpga: dfl: implement the compat_id_show region op
  fpga: remove compat_id from fpga_manager and fpga_region

 Documentation/driver-api/fpga/fpga-region.rst |  6 ++-
 drivers/fpga/dfl-fme-mgr.c                    | 23 ++++++-----
 drivers/fpga/dfl-fme-pr.c                     |  2 +-
 drivers/fpga/dfl-fme-region.c                 | 21 +++++++++-
 drivers/fpga/dfl.h                            | 14 +++++++
 drivers/fpga/fpga-region.c                    | 40 ++++++++++---------
 drivers/fpga/of-fpga-region.c                 |  6 ++-
 include/linux/fpga/fpga-mgr.h                 | 13 ------
 include/linux/fpga/fpga-region.h              | 26 +++++++++---
 9 files changed, 99 insertions(+), 52 deletions(-)

-- 
2.26.3

