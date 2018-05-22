Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6BD717DF8A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 22:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753232AbeEVW2Q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 18:28:16 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:42453 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753105AbeEVW2O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 18:28:14 -0400
Received: by mail-pf0-f194.google.com with SMTP id p14-v6so9444324pfh.9
        for <linux-doc@vger.kernel.org>; Tue, 22 May 2018 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=027o/2OeYAs8ktRMQ23ZKyEtA1fOF6X7CAFwP/wwUdk=;
        b=Ph1bkmZ8pDg+VbmWSCrI3odz/jvWqXfjul11WJTGdya69YkeeNZKjcutb0FVoeMvSG
         W6t1ogDzUaauI3LEIn9Z7opi5N7vw4uVt3vczIyzQxBD6OVY9MjrO+Ea2jqTkqiv/Tnp
         gJj2zNBGOUDovwYB6KNNBVTbJMu5EDJQJCBijJF7GnBxcvoYm8B+ytatRyTcP9queLT9
         cqcMkv/nJXREjQcuzRiRXbvAgHx+HcrB8X+Dlx6sPO/Xq72v025lj1XDq0rynchoZzru
         YJF944Uxbvdh4tk3vE0nY7HqPqrGbCl6RmyNsPm6KCRH6NFyxV8fUiHIj1Md9U4RYVeN
         ki2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=027o/2OeYAs8ktRMQ23ZKyEtA1fOF6X7CAFwP/wwUdk=;
        b=OK+1wY6h0cG6ckH1PX9z6j0+OVMJ9PSj1LrSifyxGnMufI95BX2RhwT/MTj4u67Bob
         SxHLQgOQmaRKxN4qQctENHukDgGlXVd0vXmRsXdwucK4pF9v5ho3CxpBJTWBHL4CpxZK
         GpRu7aNqblgNQxDDIF7sPwohuem7+xg659pHnTYrE33pmC3RqwbLMXNMrPo6dPTFPWji
         c9yqx+1IeBCZEnYHIFkjUVTsZKIIK0kDsziu5BZuABD5akTWc+Tso0b1nGqz3sk0RlwE
         otfTICFuDtYrsDHEgU/h5n1nbVo6/CAovjb8o2/EIMlHc9xRqWro+kWaHm5QHMQ7s0OW
         hFJw==
X-Gm-Message-State: ALKqPwe+lM5cH3t3aNWaJui091Ro2zhbrH1QEGOV/+urk4Gb7Hdw0oZL
        qW5NWYry6jKTyPsOmEoESsNAtw==
X-Google-Smtp-Source: AB8JxZpmDDDauYpupl3mGmsjehKAbr9iHRtuGYnTUQ/6Vbp/DhiRPDAafLSSqi3pOFK+XJgzZzn7JA==
X-Received: by 2002:a62:6a0a:: with SMTP id f10-v6mr282795pfc.99.1527028093741;
        Tue, 22 May 2018 15:28:13 -0700 (PDT)
Received: from rajat.mtv.corp.google.com ([2620:0:1000:1501:dc81:9a9e:fdee:decf])
        by smtp.gmail.com with ESMTPSA id b72-v6sm34327852pfm.69.2018.05.22.15.28.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 15:28:12 -0700 (PDT)
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
Subject: [PATCH 0/5] Expose PCIe AER stats via sysfs
Date:   Tue, 22 May 2018 15:28:00 -0700
Message-Id: <20180522222805.80314-1-rajatja@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset exposes the AER stats via the sysfs attributes.

Rajat Jain (5):
  PCI/AER: Define and allocate aer_stats structure for AER capable
    devices
  PCI/AER: Add sysfs stats for AER capable devices
  PCP/AER: Add sysfs attributes to provide breakdown of AERs
  PCI/AER: Add sysfs attributes for rootport cumulative stats
  Documentation/PCI: Add details of PCI AER statistics

 Documentation/PCI/pcieaer-howto.txt    |  35 +++++
 drivers/pci/pci-sysfs.c                |   3 +
 drivers/pci/pci.h                      |   4 +-
 drivers/pci/pcie/aer/Makefile          |   2 +-
 drivers/pci/pcie/aer/aerdrv.h          |  15 ++
 drivers/pci/pcie/aer/aerdrv_core.c     |  11 ++
 drivers/pci/pcie/aer/aerdrv_errprint.c |   7 +-
 drivers/pci/pcie/aer/aerdrv_stats.c    | 192 +++++++++++++++++++++++++
 drivers/pci/probe.c                    |   1 +
 include/linux/pci.h                    |   3 +
 10 files changed, 269 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pci/pcie/aer/aerdrv_stats.c

-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
