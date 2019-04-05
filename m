Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C1D57D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Apr 2019 21:44:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfDEVoz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Apr 2019 17:44:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:51871 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbfDEVoz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 5 Apr 2019 17:44:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Apr 2019 14:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,313,1549958400"; 
   d="scan'208";a="140486246"
Received: from sjchrist-coffee.jf.intel.com ([10.54.74.181])
  by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2019 14:44:54 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] docs: add support for :nosymbols:
Date:   Fri,  5 Apr 2019 14:44:49 -0700
Message-Id: <20190405214453.18768-1-sean.j.christopherson@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Linux's kernel-doc directive for Sphinx allows .rst files to selectively
include "functions", i.e. symbols, but does not allow .rst files to
explicitly exclude symbols.  The actual kernel-doc script already
supports excluding symbols, i.e. most of the plumbing is in place, but
needs a bit of cleanup to get things working.

The intended user of this is SGX, which introduces a uapi header that
defines structs for ioctls and for a new vDSO function.  Ideally, the
documentation for the vDSO struct will be placed into a different
section.

I'm sending this as a standalone series as the SGX patch set is already
ridiculously big[1], but I can fold these patches into the SGX series
if that's preferred.

[1] https://lkml.kernel.org/r/20190320162119.4469-1-jarkko.sakkinen@linux.intel.com


Sean Christopherson (4):
  kernel-doc: Revert "scripts/kernel-doc: Processing -nofunc for
    functions only"
  kernel-doc: Rename -nofunction option to -nosymbol
  kernel-doc: Rename -function to -symbol
  docs: sphinx: Add support :nosymbols: to exclude specific symbols

 Documentation/sphinx/kerneldoc.py |  9 +++++++--
 scripts/kernel-doc                | 19 ++++++++++---------
 2 files changed, 17 insertions(+), 11 deletions(-)

-- 
2.21.0

