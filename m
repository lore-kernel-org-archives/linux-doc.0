Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE783C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  2 Nov 2021 21:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C675860F5A
	for <linux-doc@archiver.kernel.org>; Tue,  2 Nov 2021 21:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhKBV4B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Nov 2021 17:56:01 -0400
Received: from mga09.intel.com ([134.134.136.24]:30055 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231308AbhKBVz6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 2 Nov 2021 17:55:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231226446"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="231226446"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 14:53:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; 
   d="scan'208";a="489283551"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 14:53:20 -0700
From:   ira.weiny@intel.com
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Ira Weiny <ira.weiny@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-kernel@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
        linux-doc@vger.kernel.org
Subject: [PATCH 0/3] Improve Auxiliary Device documentation
Date:   Tue,  2 Nov 2021 14:53:14 -0700
Message-Id: <20211102215317.3676782-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ira Weiny <ira.weiny@intel.com>

The auxiliary device documentation was not wrong but it was a bit difficult to
follow.  Add clarifications to ensure that details are not missed.


Ira Weiny (3):
  Documentation/auxiliary_bus: Clarify auxiliary_device creation
  Documentation/auxiliary_bus: Clarify match_name
  Documentation/auxiliary_bus: Update Auxiliary device lifespan

 Documentation/driver-api/auxiliary_bus.rst | 136 ++++++++++++++++-----
 1 file changed, 107 insertions(+), 29 deletions(-)

-- 
2.28.0.rc0.12.gb6a658bd00c9

