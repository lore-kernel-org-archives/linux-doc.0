Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C1CA07D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 21 Jun 2018 23:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933067AbeFUXsf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 21 Jun 2018 19:48:35 -0400
Received: from mail-oi0-f73.google.com ([209.85.218.73]:35220 "EHLO
        mail-oi0-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932994AbeFUXse (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jun 2018 19:48:34 -0400
Received: by mail-oi0-f73.google.com with SMTP id t133-v6so2778767oih.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Jun 2018 16:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:date:message-id:subject:from:to:cc;
        bh=y1udrjP1twkh5X8TRWSu0vDRks7gYPJTY6Qaf3t3Lqw=;
        b=QR6A6ScV+coQOPPsWkWM2/a5m2IFe/UVe0en/irSHJT/2nkKzCfLanPmfLr+B2JgB6
         nslrYb4G7lC1zGWbumkcAi2FBpfR7J2BcZz6ploXmYm+8d3EAQ5AzgJR0swPsK6EqQUN
         zht5VKXV1S3eqmdpLnFUo9uH0mei7VjtS+I1rb+UpoAezdVKI7wX8AmQfcohNbLaSbsY
         yXR73PQcZii1KwZgUgEBYByZ/Y+n/T69SVasIWKbvrshar1zJcJJ3n7rpbiM+IcWsPFO
         cb9GMpU1WYUJduY1vCELgFNHcIems4HbNYarMS5GRRudjAcgLgKPwLgUVW9STmHmXKFE
         NzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
        bh=y1udrjP1twkh5X8TRWSu0vDRks7gYPJTY6Qaf3t3Lqw=;
        b=twRUjjIPTKnzhAuXjc90L7ptGsUam5RpYQh/DHkou9h+E9sM1BwVoF5zMt6WBjBplq
         7xdIfbEVmVqIAEetZGRt1aSdUDRGbRT2FdBUxnA+lg3bpIdfye9WF7/QY+yhH+OehlWX
         TOmsh6pjH22JJqj93L1fLi4N0rfg7IVipg5VGFWsYzIt51AF9zD1VDDTbufNKGKQJjYv
         t3rptLsHWFNW6pohYIv5pKpZxm6N0zxetzPYIxhCEesfJqBH9rUsP+1jY3wHdg9pE+xF
         MbzhsDkrIk4NJvWbBoc6j7HXFabxgk2reMUmW/RYsDrnN/huWQ/kv8dvK58ooGfn/1R4
         Dz8w==
X-Gm-Message-State: APt69E2uyy/x63dyEirpyjX6eE5BklArAkNfUwY42LGI/+9UXuJp9FA6
        UNM3aSa2W4GLlLUWuEiIqCZn3up3fV8e
X-Google-Smtp-Source: ADUXVKK+HL44wPWhOl3Q9jEVMTYR7K3JNxFZ5dVXLQ4FBSWKh1vGaX9BNfGvtcka9j6ajsgOmXpZ6TgTCr7L
MIME-Version: 1.0
X-Received: by 2002:a9d:57c1:: with SMTP id q1-v6mr12237109oti.38.1529624913894;
 Thu, 21 Jun 2018 16:48:33 -0700 (PDT)
Date:   Thu, 21 Jun 2018 16:48:25 -0700
Message-Id: <20180621234829.224566-1-rajatja@google.com>
X-Mailer: git-send-email 2.18.0.rc2.346.g013aa6912e-goog
Subject: [PATCH 0/4] Expose PCIe AER stats via sysfs
From:   Rajat Jain <rajatja@google.com>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jes Sorensen <jsorensen@fb.com>,
        Kyle McMartin <jkkm@fb.com>, rajatxjain@gmail.com,
        helgaas@kernel.org
Cc:     Rajat Jain <rajatja@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a follow up to:
https://lkml.org/lkml/2018/5/22/1057

Respinning as a new patchset because the old one has been refactored
to include new patches (that were not part of original), and dropping
some patches. The major changes are:

* Provide breakdown of Fatal / non fatal errors separately
* Include the "total" in the same file
* do some PCI cleanup before the actual aer_stats stuff
* Include documentation in the main patch
* Rename variables / attributes to better match the newer reality.

Rajat Jain (4):
  PCI: Move pci_aer_init() and pci_no_aer() declarations to
    drivers/pci/pci.h
  PCI/AER: Define and allocate aer_stats structure for AER capable
    devices
  PCI/AER: Add sysfs attributes to provide AER stats and breakdown
  PCI/AER: Add sysfs attributes for rootport cumulative stats

 .../testing/sysfs-bus-pci-devices-aer_stats   | 122 +++++++++++
 Documentation/PCI/pcieaer-howto.txt           |   5 +
 drivers/pci/pci-sysfs.c                       |   3 +
 drivers/pci/pci.h                             |  11 +
 drivers/pci/pcie/aer.c                        | 198 +++++++++++++++++-
 drivers/pci/probe.c                           |   1 +
 include/linux/pci.h                           |   5 +-
 7 files changed, 337 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-aer_stats

-- 
2.18.0.rc2.346.g013aa6912e-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
