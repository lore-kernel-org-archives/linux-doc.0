Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720F9C4321E
	for <linux-doc@archiver.kernel.org>; Mon,  7 Nov 2022 17:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbiKGRdO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Nov 2022 12:33:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232588AbiKGRdL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Nov 2022 12:33:11 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245E12180C
        for <linux-doc@vger.kernel.org>; Mon,  7 Nov 2022 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667842391; x=1699378391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W3zR3ozQVaFaXeQbgRXKBUOwQlqXOEQHKQq2JdzbNp8=;
  b=IynQWQiZrILFwraQYX0o0y1Jzwz3ZsHVhPPTJF8jXDWAKwH99f+v5ecU
   v4MJajQNBwESmoCc/NXTkWC/6FY64Pd9YX4HvfP+ohfVADRNngdal2u1Y
   IPWnOg2Ri18ZCHtmz/gJeNUyac+ZosHg9NXNqXC8q/qvlDz0R696gLn3J
   IOqty50QmLCW55I/jx4ffZ+/cPA/Ll3uVeTCDpjUJvYxcIHXLov6uQUlD
   ipMbwoixAcE4EuEU3fCkHKkkTgJGogtcK+XbGlH5bVp5ASFiq6lJ4b8oe
   APKU83yB808kjNcYwu+x1xAqCXmLWe16YlpjdEEj0aJY25SNA5KgNeYbB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308096797"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="308096797"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 09:32:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630568322"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="630568322"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 09:32:58 -0800
From:   Lucas De Marchi <lucas.demarchi@intel.com>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Cc:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/3] Documentation/gpu: Limit index to maxdepth=2
Date:   Mon,  7 Nov 2022 09:32:08 -0800
Message-Id: <20221107173209.2219571-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107173209.2219571-1-lucas.demarchi@intel.com>
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With a lot of sub-section it's a little bit hard to find the information
needed in the main GPU index. Limit the maxdepth to 2 so it doesn't get
poluted with noise from each driver and from other sections.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index b99dede9a5b1..1d9402d519be 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -3,6 +3,7 @@ Linux GPU Driver Developer's Guide
 ==================================
 
 .. toctree::
+   :maxdepth: 2
 
    introduction
    drm-internals
-- 
2.38.1

