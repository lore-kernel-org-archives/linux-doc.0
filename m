Return-Path: <SRS0=+dB3=DO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F78C4363C
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 08:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02E992083B
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 08:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgJGIWy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:22:54 -0400
Received: from mga18.intel.com ([134.134.136.126]:44318 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727896AbgJGIWy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Oct 2020 04:22:54 -0400
IronPort-SDR: xt5cVcWXarbAl1TtCBB2MF9xg3AmOtAaZe2PW8a/zeIiJlxRtDOep3YERJlA5xs64bI86h+fKl
 c+SUn8v+LiyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="152628612"
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="152628612"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 01:22:51 -0700
IronPort-SDR: 05ugYUlxo5ouPOyYQiwLdofSkck3UW7zEhZ3ydBjg8wP7VzFIzkUTg/+XfztGUA24kn5Maa6WQ
 HKmficnhWrfA==
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="461229991"
Received: from kneumaye-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.34.113])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 01:22:49 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [PATCH RFC] script: add a script for checking doc problems with external functions
In-Reply-To: <e40a32900dba6b8e7a1f41838ee8caeb1ef1c1b3.1601985151.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201005125920.27a7768d@coco.lan> <e40a32900dba6b8e7a1f41838ee8caeb1ef1c1b3.1601985151.git.mchehab+huawei@kernel.org>
Date:   Wed, 07 Oct 2020 11:23:11 +0300
Message-ID: <87tuv6igwg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 06 Oct 2020, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> While not all EXPORT_SYMBOL*() symbols should be documented,
> it seems useful to have a tool which would help to check what
> symbols aren't documented.
>
> This is a first step on this direction. The tool has some
> limitations. Yet, it could be useful for maintainers to check
> about missing documents on their subsystems.

Seems like this should be part of checkpatch.pl somehow.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
