Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423BCC001B0
	for <linux-doc@archiver.kernel.org>; Mon, 14 Aug 2023 17:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjHNRLo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 13:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjHNRL3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 13:11:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645A2E65;
        Mon, 14 Aug 2023 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692033088; x=1723569088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ysMqtPzA8PYAd9Hg+oD2xo4hcLn3pI1vfNhUHnEeKWo=;
  b=MOiaZOTIF8vjeRyc1xLRspqPB8oKX/16ZksDuA5hP0QhCVnyudAVhx3T
   f4qiREUVPYJ3mq6VX1RO30OnRfEUjqk+u9HOWcJ0hY/J8Nj2pArMGLAJP
   qk5/qKN+VeQlSjZffVbtPBkSU9Oo9dMf/qLmRbBulr/MMBwiKsFkhjUOi
   xWEVSuv7vCausB0Q1+XNaBUb4GX9qyTsWTafLER/ZSmj8Lvj4V0zS8RBg
   L8Gg/YdOSKaRFkXQGFUmWga17fcDyiK6EwKwLqqL4VPWOjEcnbDI4P3Qs
   4TBvqb17v/XV5lBD85Nr1LToBeTBBMVV5TevI5AHdL3WCtJ+kkG/ZNcjw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="435983123"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="435983123"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 10:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="763011329"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="763011329"
Received: from unknown (HELO fedora.jf.intel.com) ([10.166.80.24])
  by orsmga008.jf.intel.com with ESMTP; 14 Aug 2023 10:11:19 -0700
From:   Pavan Kumar Linga <pavan.kumar.linga@intel.com>
To:     netdev@vger.kernel.org, kuba@kernel.org
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        emil.s.tantilov@intel.com, joshua.a.hay@intel.com,
        sridhar.samudrala@intel.com, alan.brady@intel.com,
        madhu.chittim@intel.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, willemb@google.com, decot@google.com,
        rdunlap@infradead.org,
        Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: [PATCH net-next v2 2/2] scripts: kernel-doc: fix macro handling in enums
Date:   Mon, 14 Aug 2023 10:07:20 -0700
Message-Id: <20230814170720.46229-3-pavan.kumar.linga@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230814170720.46229-1-pavan.kumar.linga@intel.com>
References: <20230814170720.46229-1-pavan.kumar.linga@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

drivers/net/ethernet/intel/idpf/idpf.h uses offsetof to
initialize the enum enumerators:

enum {
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

Signed-off-by: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
---
 scripts/kernel-doc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index cfb1cb223508..bc008f30f3c9 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1353,6 +1353,7 @@ sub dump_enum($$) {
 	my %_members;
 
 	$members =~ s/\s+$//;
+	$members =~ s/\(.*?[\)]//g;
 
 	foreach my $arg (split ',', $members) {
 	    $arg =~ s/^\s*(\w+).*/$1/;
-- 
2.38.1

