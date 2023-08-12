Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD1DC001B0
	for <linux-doc@archiver.kernel.org>; Sat, 12 Aug 2023 00:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236905AbjHLA0D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 20:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjHLA0D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 20:26:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E87B30FE;
        Fri, 11 Aug 2023 17:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691799962; x=1723335962;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4Hjl5ogh4rzaHBoES606WIZBISl2Q1mGKF+fQyelPu8=;
  b=cA83xzeKXMkh4NuT7eb1TEcqNYjJUAjFgGVP4rnhuefZtwo7ofKyqhms
   J9S2a0ou0kgceGx9QG1e3NE3outSkxSUsREWwhIos0SABcQOY6g9ojosT
   GNZg1BwQJVbbsZGnYDQp5IN3lO9Sa5h5oeL6L3BG7tafWSPlD98u+ETjj
   x7qz9zZSv0B1M2yPiG1CrO9OaKmQ1il+YChlMh/aeV8nhg3QmBuBzdTe0
   HbDW8M0PlkgCH/y4T2LO0mS57fz+actvCB2Y/EH9QIHUBl+7ohv62f7Fj
   evilOGJQm2s4dcCdvKPADGGHHBaD02toOnUDGK24jzSaWEPBktPZheTKD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375500075"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="375500075"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 17:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="979370605"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="979370605"
Received: from unknown (HELO fedora.jf.intel.com) ([10.166.80.24])
  by fmsmga006.fm.intel.com with ESMTP; 11 Aug 2023 17:26:01 -0700
From:   Pavan Kumar Linga <pavan.kumar.linga@intel.com>
To:     netdev@vger.kernel.org, kuba@kernel.org
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        emil.s.tantilov@intel.com, joshua.a.hay@intel.com,
        sridhar.samudrala@intel.com, alan.brady@intel.com,
        madhu.chittim@intel.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, willemb@google.com, decot@google.com,
        Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: [PATCH net-next 0/2] Fix invalid kernel-doc warnings
Date:   Fri, 11 Aug 2023 17:25:47 -0700
Message-Id: <20230812002549.36286-1-pavan.kumar.linga@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

kernel-doc reports invalid warnings on IDPF driver patch series [1]
that is submitted for review. This patch series fixes those warnings.

[1]: https://lore.kernel.org/netdev/20230808003416.3805142-1-anthony.l.nguyen@intel.com/
---
These fixes are needed for the IDPF driver patch series to have
a clean CI. So targeting the series to net-next instead of
linux-docs.
---
Pavan Kumar Linga (2):
  scripts: kernel-doc: parse DEFINE_DMA_UNMAP_[ADDR|LEN]
  scripts: kernel-doc: fix macro handling in enums

 scripts/kernel-doc | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.38.1

