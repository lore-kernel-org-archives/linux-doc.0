Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3869D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Jun 2019 12:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbfFEMfH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Jun 2019 08:35:07 -0400
Received: from mga18.intel.com ([134.134.136.126]:37444 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727273AbfFEMfH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Jun 2019 08:35:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 05:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,550,1549958400"; 
   d="scan'208";a="181915768"
Received: from gaia.fi.intel.com ([10.237.72.169])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2019 05:35:05 -0700
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
        id 98FF25C1F3A; Wed,  5 Jun 2019 15:35:04 +0300 (EEST)
From:   Mika Kuoppala <mika.kuoppala@linux.intel.com>
To:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     jani.nikula@intel.com, linux-doc@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: fix documentation build warnings
In-Reply-To: <20190605095657.23601-2-jani.nikula@intel.com>
References: <20190605095657.23601-1-jani.nikula@intel.com> <20190605095657.23601-2-jani.nikula@intel.com>
Date:   Wed, 05 Jun 2019 15:35:04 +0300
Message-ID: <877ea0rz0n.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jani Nikula <jani.nikula@intel.com> writes:

> Just a straightforward bag of fixes for a clean htmldocs build.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

