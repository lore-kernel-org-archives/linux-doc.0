Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 055FD7DC63
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfJOVUw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:20:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38035 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfJOVUw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:20:52 -0400
Received: by mail-wr1-f68.google.com with SMTP id y18so16088521wrn.5
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gQc1r1ib/WAI/h8loP6CN8X5jrpz3S38qvA1z7LgOPY=;
        b=bbmlUFcW3Hlhbp/CMbhjjOr4SasG3lOEMH8bDrHAR9UUlKDgHAvfGJSv8+mRGUKMBk
         1lIcgmdXlK4U5TjVYJEuT9HjsOC7L0qgXMtuI0d4B5U1HvVKvhIHk5WuxdonpurZQUXW
         vS5fGv+VFj6hHpqShaW5Is33c7bthlwr6rVYZdhvB0emV5TySylAD5Wywog46vMxf2gd
         FEjF28f6P7EW/RtLPB7hYYwkSzyYdPAz+w45thbCQLCQ8RGXqvh6HhwcpJ0sdBt9b+cK
         IbzM609UKMyNjo6ZFc5u8ztqv/Pb1A/7IzWdtX2YFPMcwYz2lJZIo3kbDCLNdokDQUse
         5IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gQc1r1ib/WAI/h8loP6CN8X5jrpz3S38qvA1z7LgOPY=;
        b=ZIGVtfaOZuEog0uvOU5Rj/IkswPQYBEZZxOq+1WFST2MwwR8a7lKUtS0owm2koudZe
         iL9q+z6RnraUiNnu6uA4feI3VL1UE9LPj+oAJ5h2o0sftRiKLbIMUKemWv/Z+2jEKR3c
         weYkHTFMAOYg+ueOqWTwTmVSh5SQBkik0OSctBtnpfKg6cvaKvIViMmK+E+/anNPgng8
         3orT/jJtDIguRD7qNELViMYGQEArrb57nHi/4jopTGemV+aHpHw6m7GrodHw/XaIgkV6
         8fQ747RXZnJDNCAFYBU6Zz32I7aINGuYg9yupSfLmrCkIzBUPjL+FzFCDbx9a8ySDBPu
         SK/g==
X-Gm-Message-State: APjAAAUzewECwCev/4hrCM004JYicS5BrwrH771LtODH14TFRUB3Pfih
        JpOf7jzQgfVVZgdKu607dWoUew==
X-Google-Smtp-Source: APXvYqweUupN2R/PZTaLYqLXTlbWF/L6LtoymPyIcmk/AGFkqrkRyH8nw4C3r0u1Mi+6Gg/deRZYHw==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr32118497wrr.186.1571174450393;
        Tue, 15 Oct 2019 14:20:50 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:39d2:21a2:678a:9501])
        by smtp.gmail.com with ESMTPSA id g185sm517649wme.10.2019.10.15.14.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:20:49 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: [PATCH v3 00/11] coresight: etm4x: Fixes and updates for sysfs API
Date:   Tue, 15 Oct 2019 22:19:53 +0100
Message-Id: <20191015212004.24748-1-mike.leach@linaro.org>
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

Changes since v2 (reviews from Mathieu and Leo):-
  Patch 0002 now adds stable tag. Tested on 4.9, 4.14, 4.19
  Applies to coresight/next (5.4-rc1)
  Documentation changed to .rst format to match recent updates that
  converted other CoreSight .txt files.
  Misc typo / comment changes.

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

 .../testing/sysfs-bus-coresight-devices-etm4x | 183 ++--
 .../{ => coresight}/coresight-cpu-debug.rst   |   0
 .../coresight/coresight-etm4x-reference.rst   | 798 ++++++++++++++++++
 .../trace/{ => coresight}/coresight.rst       |   2 +-
 Documentation/trace/{ => coresight}/stm.rst   |   0
 MAINTAINERS                                   |   3 +-
 .../coresight/coresight-etm4x-sysfs.c         | 312 ++++++-
 drivers/hwtracing/coresight/coresight-etm4x.c |  32 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |  17 +-
 9 files changed, 1245 insertions(+), 102 deletions(-)
 rename Documentation/trace/{ => coresight}/coresight-cpu-debug.rst (100%)
 create mode 100644 Documentation/trace/coresight/coresight-etm4x-reference.rst
 rename Documentation/trace/{ => coresight}/coresight.rst (99%)
 rename Documentation/trace/{ => coresight}/stm.rst (100%)

-- 
2.17.1

