Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2731C04A94
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 21:07:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239691AbjHOVGe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 17:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240179AbjHOVGZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 17:06:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B54F2
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692133585; x=1723669585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rxMXZMUeEzFrLFIgcBRR8/8rAi9+EVFWN4oV+J9FpmU=;
  b=D1TIlvw27q5lOitJuYxeczozej/qe0nozIvXnlxf/c2QYWvzPjEBOoTL
   JDx+JzzwfsNtU2mo2To727z2XI63I1+2kC4HD2e+vvLBegBxBvBQnEXwY
   U4FcD4S4PF0Xd85QHyUokJ42w6xWg31zzfpAziv4ruh9HvNEbem9oDZZV
   vUvw5wJ6KEqaVfaLYyYry0WhFqPmpPn6SMGaCuqeW6Zcd5z7lbPmSdKTS
   GV5pbjgZWumYyYLhIzRWco78yCZvISfSw8RgsAsX4olvYnOj3PVJB8031
   l8UhHX4zAkK/2FH8Jde1vCmh8aYNKKiyOtmOb/Hxrk60QbrZyoZN0u893
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376109602"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="376109602"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 14:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="803957006"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="803957006"
Received: from unknown (HELO fedora.jf.intel.com) ([10.166.80.24])
  by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2023 14:06:22 -0700
From:   Pavan Kumar Linga <pavan.kumar.linga@intel.com>
To:     linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     kuba@kernel.org, rdunlap@infradead.org, emil.s.tantilov@intel.com,
        joshua.a.hay@intel.com, sridhar.samudrala@intel.com,
        alan.brady@intel.com, madhu.chittim@intel.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        willemb@google.com, decot@google.com,
        Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: [PATCH docs-next v3 2/2] scripts: kernel-doc: fix macro handling in enums
Date:   Tue, 15 Aug 2023 14:04:17 -0700
Message-Id: <20230815210417.98749-3-pavan.kumar.linga@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230815210417.98749-1-pavan.kumar.linga@intel.com>
References: <20230815210417.98749-1-pavan.kumar.linga@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

drivers/net/ethernet/intel/idpf/idpf.h uses offsetof to
initialize the enum enumerators:

enum idpf_cap_field {
	IDPF_BASE_CAPS = -1,
	IDPF_CSUM_CAPS = offsetof(struct virtchnl2_get_capabilities,
				  csum_caps),
	IDPF_SEG_CAPS = offsetof(struct virtchnl2_get_capabilities,
				 seg_caps),
	IDPF_RSS_CAPS = offsetof(struct virtchnl2_get_capabilities,
				 rss_caps),
	IDPF_HSPLIT_CAPS = offsetof(struct virtchnl2_get_capabilities,
				    hsplit_caps),
	IDPF_RSC_CAPS = offsetof(struct virtchnl2_get_capabilities,
				 rsc_caps),
	IDPF_OTHER_CAPS = offsetof(struct virtchnl2_get_capabilities,
				   other_caps),
};

kernel-doc parses the above enumerator with a ',' inside the
macro and treats 'csum_caps', 'seg_caps' etc. also as enumerators
resulting in the warnings:

drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
'csum_caps' not described in enum 'idpf_cap_field'
drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
'seg_caps' not described in enum 'idpf_cap_field'
drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
'rss_caps' not described in enum 'idpf_cap_field'
drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
'hsplit_caps' not described in enum 'idpf_cap_field'
drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
'rsc_caps' not described in enum 'idpf_cap_field'
drivers/net/ethernet/intel/idpf/idpf.h:130: warning: Enum value
'other_caps' not described in enum 'idpf_cap_field'

Fix it by removing the macro arguments within the parentheses.

Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
---
 scripts/kernel-doc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index cfb1cb223508..6e199a745ccb 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1353,6 +1353,7 @@ sub dump_enum($$) {
 	my %_members;
 
 	$members =~ s/\s+$//;
+	$members =~ s/\([^;]*?[\)]//g;
 
 	foreach my $arg (split ',', $members) {
 	    $arg =~ s/^\s*(\w+).*/$1/;
-- 
2.38.1

