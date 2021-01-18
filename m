Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9CAC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 11:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE265221F8
	for <linux-doc@archiver.kernel.org>; Mon, 18 Jan 2021 11:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389949AbhARLJh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 06:09:37 -0500
Received: from mga17.intel.com ([192.55.52.151]:16103 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389921AbhARLJf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Jan 2021 06:09:35 -0500
IronPort-SDR: EM95qc39Kh84LQLeEABwGGsw222w3ddFdZWJ+uwtSeLMPz0tvKMl+n3pv1csqVkgqzqgKUrwEh
 N5XtUvCEGEMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="158562681"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="158562681"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 03:08:54 -0800
IronPort-SDR: hrPNsvtljp3wRPO7t9KVKPA+99ng+jcgKo5UiIMIUtXSQeTSd5zb1oe0PehhWZ7Na+WkGro9Rm
 b33pNXPLw81Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="406186038"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2021 03:08:52 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com (mwajdecz-MOBL.ger.corp.intel.com [10.249.143.57])
        by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 10IB8pCj023113;
        Mon, 18 Jan 2021 11:08:51 GMT
From:   Michal Wajdeczko <michal.wajdeczko@intel.com>
To:     linux-doc@vger.kernel.org
Cc:     Michal Wajdeczko <michal.wajdeczko@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] scripts/kernel-doc: add internal hyperlink to DOC: sections
Date:   Mon, 18 Jan 2021 12:08:13 +0100
Message-Id: <20210118110813.1490-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While DOC: section titles are not converted into RST headings
sections and are only decorated with strong emphasis markup,
nothing stops us from generating internal hyperlinks for them,
to mimic implicit hyperlinks to RST headings.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 scripts/kernel-doc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 6325bec3f66f..272f70c9fb13 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -833,6 +833,7 @@ sub output_blockhead_rst(%) {
 	next if (defined($nosymbol_table{$section}));
 
 	if ($output_selection != OUTPUT_INCLUDE) {
+	    print ".. _$section:\n\n";
 	    print "**$section**\n\n";
 	}
         print_lineno($section_start_lines{$section});
-- 
2.25.1

