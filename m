Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9EE037D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Oct 2018 10:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbeJISLE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Oct 2018 14:11:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:44022 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726727AbeJISLD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 9 Oct 2018 14:11:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E1EEEACAD;
        Tue,  9 Oct 2018 10:54:40 +0000 (UTC)
From:   Juergen Gross <jgross@suse.com>
To:     linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org, linux-doc@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        corbet@lwn.net, boris.ostrovsky@oracle.com,
        Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 0/3] x86: make rsdp address accessible via boot params
Date:   Tue,  9 Oct 2018 12:54:34 +0200
Message-Id: <20181009105437.5471-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the non-EFI boot path the ACPI RSDP table is currently found via
either EBDA or by searching through low memory for the RSDP magic.
This requires the RSDP to be located in the first 1MB of physical
memory. Xen PVH guests, however, get the RSDP address via the start of
day information block.

In order to support an arbitrary RSDP address this patch series adds
the physical address of the RSDP to the boot params structure filled
by the boot loader.

Juergen Gross (3):
  x86/xen: fix boot loader version reported for pvh guests
  x86/boot: add acpi rsdp address to setup_header
  x86/acpi: take rsdp address for boot params if available

 Documentation/x86/boot.txt            | 32 +++++++++++++++++++++++++++++++-
 arch/x86/boot/header.S                |  6 +++++-
 arch/x86/include/asm/acpi.h           |  2 ++
 arch/x86/include/asm/x86_init.h       |  2 ++
 arch/x86/include/uapi/asm/bootparam.h |  4 ++++
 arch/x86/kernel/acpi/boot.c           |  6 ++++++
 arch/x86/kernel/head32.c              |  1 +
 arch/x86/kernel/head64.c              |  2 ++
 arch/x86/kernel/setup.c               | 17 +++++++++++++++++
 arch/x86/kernel/x86_init.c            |  3 +--
 arch/x86/xen/enlighten_pvh.c          |  2 +-
 11 files changed, 72 insertions(+), 5 deletions(-)

-- 
2.16.4

