Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51326C04A94
	for <linux-doc@archiver.kernel.org>; Mon, 14 Aug 2023 17:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjHNRLn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 13:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjHNRL3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 13:11:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB5EE6A;
        Mon, 14 Aug 2023 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692033088; x=1723569088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5KydbXEvfYn/uPRun8gzokjqDD+u6EXaH58nS3MHzj4=;
  b=imhugZCein1en6l1UMHUD8TkMESUbHxlVWcfg8QOpGwDLgw4YvyDBkGY
   6RgWGLJod1D6REaFO+rnVys6GBowzqQ1rjyCWOAdM4NdQjLmko72PUtq7
   vJt0fMhCW1fc9eOPcVlnjY6hualBknz2oj4S5UPq07xrT6J0ZxnnPTM8G
   jAeN60P6NNt4WMsJxtJ6riCdmtwYlPRe75B0iN3pIekulI+4ssvfiBafO
   5lL8j7TxqTXwRYFONo3yjuKlCItIQFJdAbfI6QO3aqy1RDmCBxQCp1cVt
   UreoQymD+np47O9aJsVxbhRkf9MgxTctWnAPOc91sDQyTvtjYN5LmP4/p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="435983118"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="435983118"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 10:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="763011324"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="763011324"
Received: from unknown (HELO fedora.jf.intel.com) ([10.166.80.24])
  by orsmga008.jf.intel.com with ESMTP; 14 Aug 2023 10:11:18 -0700
From:   Pavan Kumar Linga <pavan.kumar.linga@intel.com>
To:     netdev@vger.kernel.org, kuba@kernel.org
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        emil.s.tantilov@intel.com, joshua.a.hay@intel.com,
        sridhar.samudrala@intel.com, alan.brady@intel.com,
        madhu.chittim@intel.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, willemb@google.com, decot@google.com,
        rdunlap@infradead.org,
        Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: [PATCH net-next v2 1/2] scripts: kernel-doc: parse DEFINE_DMA_UNMAP_[ADDR|LEN]
Date:   Mon, 14 Aug 2023 10:07:19 -0700
Message-Id: <20230814170720.46229-2-pavan.kumar.linga@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230814170720.46229-1-pavan.kumar.linga@intel.com>
References: <20230814170720.46229-1-pavan.kumar.linga@intel.com>
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

Signed-off-by: Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
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

