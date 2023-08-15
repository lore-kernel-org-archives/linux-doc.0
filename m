Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BBDC41513
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 21:07:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239649AbjHOVGd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 17:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240181AbjHOVG0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 17:06:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E05B1B2
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692133585; x=1723669585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FxOewPIJIijETQwC2ijEyPDz9nWZlAMCOjoyN7JoPiY=;
  b=OuEZzkgwMbSiTdkAFNorAc+L1MKzlce32UA+05vx8u97rxchmYtP224o
   jfb+evvTaalEJqMzyGvOuXROPwlfr7H06SP1PB+++2WFqPoK3qLVUSfC3
   CS504cBTagkLIoCeo4dvfNnmHUyD2JpYMngHPuWFBV7SXypro6CfF5KjF
   PTY9F5Rf+eYruC8VWKYzyF9GY2aMSXkGF1xbe25JZeCiiQqQkO621VduF
   OxZFhMjdhEkFi3j/M+NyqdSXwE6n0J6U3nA+3T6mj1glNRSzvaDeBEASX
   l8xmDUzhW0jcE/B6I9BLl1j1eg2fgpOsOIZ7G5WLadfaL4aJt94xewzHZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376109596"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="376109596"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 14:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="803957003"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="803957003"
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
Subject: [PATCH docs-next v3 1/2] scripts: kernel-doc: parse DEFINE_DMA_UNMAP_[ADDR|LEN]
Date:   Tue, 15 Aug 2023 14:04:16 -0700
Message-Id: <20230815210417.98749-2-pavan.kumar.linga@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230815210417.98749-1-pavan.kumar.linga@intel.com>
References: <20230815210417.98749-1-pavan.kumar.linga@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

At present, if the macros DEFINE_DMA_UNMAP_ADDR() and
DEFINE_DMA_UNMAP_LEN() are used in the structures as shown
below, instead of parsing the parameter in the parentheses,
kernel-doc parses 'DEFINE_DMA_UNMAP_ADDR(' and
'DEFINE_DMA_UNMAP_LEN(' which results in the following
warnings:

drivers/net/ethernet/intel/idpf/idpf_txrx.h:201: warning: Function
parameter or member 'DEFINE_DMA_UNMAP_ADDR(dma' not described in
'idpf_tx_buf'
drivers/net/ethernet/intel/idpf/idpf_txrx.h:201: warning: Function
parameter or member 'DEFINE_DMA_UNMAP_LEN(len' not described in
'idpf_tx_buf'

struct idpf_tx_buf {
	DEFINE_DMA_UNMAP_ADDR(dma);
	DEFINE_DMA_UNMAP_LEN(len);
};

Fix the warnings by parsing DEFINE_DMA_UNMAP_ADDR() and
DEFINE_DMA_UNMAP_LEN().

Cc: Jonathan Corbet <corbet@lwn.net>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
---
 scripts/kernel-doc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index d0116c6939dc..cfb1cb223508 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1168,6 +1168,10 @@ sub dump_struct($$) {
 	$members =~ s/DECLARE_KFIFO_PTR\s*\($args,\s*$args\)/$2 \*$1/gos;
 	# replace DECLARE_FLEX_ARRAY
 	$members =~ s/(?:__)?DECLARE_FLEX_ARRAY\s*\($args,\s*$args\)/$1 $2\[\]/gos;
+	#replace DEFINE_DMA_UNMAP_ADDR
+	$members =~ s/DEFINE_DMA_UNMAP_ADDR\s*\($args\)/dma_addr_t $1/gos;
+	#replace DEFINE_DMA_UNMAP_LEN
+	$members =~ s/DEFINE_DMA_UNMAP_LEN\s*\($args\)/__u32 $1/gos;
 	my $declaration = $members;
 
 	# Split nested struct/union elements as newer ones
-- 
2.38.1

