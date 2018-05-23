Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8874A7D085
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 18:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933790AbeEWR6p (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 13:58:45 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:37938 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933791AbeEWR6l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 13:58:41 -0400
Received: by mail-pl0-f67.google.com with SMTP id c11-v6so13492413plr.5
        for <linux-doc@vger.kernel.org>; Wed, 23 May 2018 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IEAutE9cxB7orHhpJxLdqD0h2W4Uzw4lit8J9lEs0MM=;
        b=VKUBl2Dy4JUWpxpdT/o6e9f+mmpFVTExBm0kaOonR3O+ZQMw1vJr0JxJWDBAHYOfWu
         zHM8IczCvvESkFx1FBbEdTZFSyErGiGk8lJ2c/lFrvbY0bVze815ncHngUwKBEa8IhAI
         4aUcyk+tMkDx2o0++C5vnulHIY4bGUB4UJPXyMvRMQWc6r9OoRUOy55iVJVqTfhy5Ggy
         Upkxn2QCYg3zfRl3caHl36koc2vdnMZbbrHtA8HZBqvOMttFEkezu3jHOrYD4y9RQydq
         ixG0TPf6VoB7pOfNvcijS7fLAVFhjhmqrIhhtPN2Nc/WVf2FGb9qWMmdJUiha0DAfk+5
         PoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IEAutE9cxB7orHhpJxLdqD0h2W4Uzw4lit8J9lEs0MM=;
        b=bqTJvZ+XLWiNFE61JsQizrjkXeLjw2wr8ANwSjHHLq2K4l2IyFcZDktU8Ar94e5tp2
         +jfc62OSSJH1rXWkFXfZKfNKeeCLnLezPfxTWocAVF3h5P4WbIPiTa8tJZ5dDTStpN3X
         5D2YMFQlqvrJT7v2GI91p20hk6v1itOb3J9I82f2iGxTGn5fBbNiSjeAlMJ8Jv7QU2tD
         /VKY+1UTwnLw3UjIif2HPAC8ee+90YO0ZMwom7LZGzUEp0gaUu8aZrCtoMQHp4uhU578
         iObVonw41WFduNToLE/FVZ2w7Z6baIfUj478CUv3Y2Xfe/MvBo92Em+aEk3dnjC1bGW7
         exPw==
X-Gm-Message-State: ALKqPwcSBlrReDu9EGXjpXO89wn0pWDiTEj3+X6KHEFBxCFpY9ElZ3Pk
        FSCC71XFotWIf+ywEHOkhK01jQ==
X-Google-Smtp-Source: AB8JxZr+nXKflSzonvmuyIkHGZPogAXr2gS2wjHGixOAB9l52Sm6p8nx0ByFghoFr5nltfa5gAOS5A==
X-Received: by 2002:a17:902:d24:: with SMTP id 33-v6mr3885096plu.22.1527098320864;
        Wed, 23 May 2018 10:58:40 -0700 (PDT)
Received: from rajat.mtv.corp.google.com ([2620:0:1000:1501:dc81:9a9e:fdee:decf])
        by smtp.gmail.com with ESMTPSA id k186-v6sm41433025pfc.142.2018.05.23.10.58.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 May 2018 10:58:39 -0700 (PDT)
From:   Rajat Jain <rajatja@google.com>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajat Jain <rajatja@google.com>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jes Sorensen <jsorensen@fb.com>,
        Kyle McMartin <jkkm@fb.com>
Cc:     rajatxjain@gmail.com
Subject: [PATCH v2 0/5] Expose PCIe AER stats via sysfs
Date:   Wed, 23 May 2018 10:58:03 -0700
Message-Id: <20180523175808.28030-1-rajatja@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <20180522222805.80314-1-rajatja@google.com>
References: <20180522222805.80314-1-rajatja@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset exposes the AER stats via the sysfs attributes.

Patchset v2 has minor changes to v1 based on the review comments,
no functional change.
Primarily:
 * Fix license header
 * Use tabs instead of spaces
 * Remove use on unlikely() etc
 * Move documentation to Documentation/ABI/

Rajat Jain (5):
  PCI/AER: Define and allocate aer_stats structure for AER capable
    devices
  PCI/AER: Add sysfs stats for AER capable devices
  PCI/AER: Add sysfs attributes to provide breakdown of AERs
  PCI/AER: Add sysfs attributes for rootport cumulative stats
  Documentation/ABI: Add details of PCI AER statistics

 .../testing/sysfs-bus-pci-devices-aer_stats   | 103 ++++++++++
 Documentation/PCI/pcieaer-howto.txt           |   5 +
 drivers/pci/pci-sysfs.c                       |   3 +
 drivers/pci/pci.h                             |   4 +-
 drivers/pci/pcie/aer/Makefile                 |   2 +-
 drivers/pci/pcie/aer/aerdrv.h                 |  15 ++
 drivers/pci/pcie/aer/aerdrv_core.c            |  11 +
 drivers/pci/pcie/aer/aerdrv_errprint.c        |   7 +-
 drivers/pci/pcie/aer/aerdrv_stats.c           | 192 ++++++++++++++++++
 drivers/pci/probe.c                           |   1 +
 include/linux/pci.h                           |   3 +
 11 files changed, 342 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats
 create mode 100644 drivers/pci/pcie/aer/aerdrv_stats.c

-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
