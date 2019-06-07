Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ECEFF7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 15:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728726AbfFGPOS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 11:14:18 -0400
Received: from foss.arm.com ([217.140.110.172]:42394 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728486AbfFGPOS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Jun 2019 11:14:18 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1CF6367;
        Fri,  7 Jun 2019 08:14:17 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.105])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B96793F718;
        Fri,  7 Jun 2019 08:14:16 -0700 (PDT)
From:   James Morse <james.morse@arm.com>
To:     linux-doc@vger.kernel.org, x86@kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Babu Moger <Babu.Moger@amd.com>, linux-kernel@vger.kernel.org,
        James Morse <james.morse@arm.com>
Subject: [PATCH 0/4] Documentation: x86: resctrl_ui.txt fixes and clarification
Date:   Fri,  7 Jun 2019 16:14:05 +0100
Message-Id: <20190607151409.15476-1-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While updating resctrl_ui.rst for arm64 support these things stuck
out as being unclear or no longer true.

(I've shortened the CC list to just RDT+Documentation)


Thanks,

James Morse (4):
  Documentation: x86: Contiguous cbm isn't all X86
  Documentation: x86: Remove cdpl2 unspported statement and fix
    capitalisation
  Documentation: x86: Clarify MBA takes MB as referring to mba_sc
  Documentation: x86: fix some typos

 Documentation/x86/resctrl_ui.rst | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

-- 
2.20.1

