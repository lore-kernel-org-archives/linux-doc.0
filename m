Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4CE967D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbfH2Vdc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:32 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39644 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfH2Vdb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id t16so4882037wra.6
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=lEmIC2brBwIOaUuTMoAwbZWVI4jzGGOcoWTA2PJKcu4=;
        b=qA0pk86YuNLLwtnHjHpwOu4qnlD1yVCUlvUZRQHaJHaxLtlG4RJd0myIPMbyIJh+0i
         Ol+PKLB1XeGkJW2uS+w07WAKFOVJpP+tRZXDf9vt8/u6izghP8qoLRcwTs6OHIMJ07Rs
         hvbfnysCV7hvXi0ZbAKqSr7+970hh4b5pBMtW/IrQeadbxHKJ/YvmkQxUwLlwdAv4ukh
         d3rTZzZWxZqFENfKBVT6urEY4IgEXOYWxMngsc9hVjuEPQ4K/OGh8zysEjTPhCtqPeS8
         48fZAGMcmijkjDUK/w21gDg1L2TPtBQ7tOoRY4nDbMkkQW7hJibk8IrjYsqVcRtXlvbl
         GmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lEmIC2brBwIOaUuTMoAwbZWVI4jzGGOcoWTA2PJKcu4=;
        b=hiPgxoBmgJ4Qn2qOkNgyDRRNFmxFVI2FCdF++cQHbeUxDAiSXcl+35cwxJe2Vyf577
         w/JmU8LOI/n+tEeDnjH1ADZHToJlcFYcpo0+PzgF1efKtlnKNg6Zug7aojJRgfxhtBrz
         E1lYz7qBERSTq4s4MQLWcF6UAYw+9xtwau9jLf6kXzxO+X0rzEBvPP0+Q70l7KXoPqdE
         HfmtaZ1TXVklpGwKQeeX9X7JN0cq9Cqwc09F5U7+jhbaSVu1LqnDNe6Ez+teg2I/WJ+G
         X9lpRCoc2D6QrYQSUwMKDPRysBFc4iBS7cpCK5O4+tEyAk2AufvTn93N6TU/tJ2d+Qv3
         3Bag==
X-Gm-Message-State: APjAAAWdfK9bFM1GA8ovYB/JrhF9Xmy7wSOoCo2jd+wBFR1DNEVcJmt9
        zxjf0D1hMRwJcbCXuRZO5DfmgQ==
X-Google-Smtp-Source: APXvYqw697zgUtyEhXttple1jGJzyCb+Z8FJUMg0WU7sKX+dMmN7ovEmc8FMXXeY7ccT03Aw4cVvrQ==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr14445024wru.177.1567114409799;
        Thu, 29 Aug 2019 14:33:29 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:29 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 00/11]  coresight: etm4x: Fixes and updates for sysfs API
Date:   Thu, 29 Aug 2019 22:33:10 +0100
Message-Id: <20190829213321.4092-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Review of ETMV4 sysfs code resulted in a number of minor issues being
discovered.

Patch set fixes these issues:-
1) Update for ETM v4.4 archtecture.
2) Add missing single shot comparator API.
3) Misc fixes and improvements to sysfs API
4) Updated programmers documentation and reference.

Changes since v1 (from reviews by Mathieu and Leo):-
  Usability patch split into 2 separate functional patches.
  Docs patch split into 3 patches.
  Misc style and comment typo fixes.

Mike Leach (11):
  coresight: etm4x: Fixes for ETM v4.4 architecture updates.
  coresight: etm4x: Fix input validation for sysfs.
  coresight: etm4x: Add missing API to set EL match on address filters
  coresight: etm4x: Fix issues with start-stop logic.
  coresight: etm4x: Improve usability of sysfs - include/exclude addr.
  coresight: etm4x: Improve usability of sysfs - CID and VMID masks.
  coresight: etm4x: Add view comparator settings API to sysfs.
  coresight: etm4x: Add missing single-shot control API to sysfs
  coresight: etm4x: docs: Update ABI doc for sysfs features added.
  coresight: docs: Create common sub-directory for coresight trace.
  coresight: etm4x: docs: Adds detailed document for programming etm4x.

 .../testing/sysfs-bus-coresight-devices-etm4x | 183 ++++---
 .../{ => coresight}/coresight-cpu-debug.txt   |   0
 .../coresight/coresight-etm4x-reference.txt   | 458 ++++++++++++++++++
 .../trace/{ => coresight}/coresight.txt       |   0
 MAINTAINERS                                   |   3 +-
 .../coresight/coresight-etm4x-sysfs.c         | 312 +++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x.c |  32 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |  18 +-
 8 files changed, 905 insertions(+), 101 deletions(-)
 rename Documentation/trace/{ => coresight}/coresight-cpu-debug.txt (100%)
 create mode 100644 Documentation/trace/coresight/coresight-etm4x-reference.txt
 rename Documentation/trace/{ => coresight}/coresight.txt (100%)

-- 
2.17.1

