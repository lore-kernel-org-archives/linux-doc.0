Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D87C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 10:41:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B46061278
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 10:41:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237567AbhDLKlf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Apr 2021 06:41:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:60151 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237538AbhDLKlf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Apr 2021 06:41:35 -0400
IronPort-SDR: Gru3ZRsfCW0Tq/LwEKxq+N6ldXciJ9P38fSEznkMlju8l6x6ZuOJ9A2hSPinUQn+V9vAQM8S0a
 aXuVhYTBSNzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="194190798"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="194190798"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 03:41:13 -0700
IronPort-SDR: tNI5WA4lUnnhYEwTqyzhU9x1vctYG2Tzt/zuV0vn9G7iOFOx1KTzsXnZlONjBsBawB/IkPUHVV
 BvgU2X8cU8TA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="423741716"
Received: from cyeni-mobl.ger.corp.intel.com (HELO localhost) ([10.252.62.41])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 03:41:10 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, corbet@lwn.net
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/aperture: Add infrastructure for aperture ownership
In-Reply-To: <b635ebd6-c86e-761c-9bf3-0835fd3278f3@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210412090021.23054-1-tzimmermann@suse.de> <20210412090021.23054-2-tzimmermann@suse.de> <87mtu3kfo3.fsf@intel.com> <b635ebd6-c86e-761c-9bf3-0835fd3278f3@suse.de>
Date:   Mon, 12 Apr 2021 13:41:07 +0300
Message-ID: <87k0p7kcos.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 12 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 12.04.21 um 11:36 schrieb Jani Nikula:
>> Please test the documentation build before applying.
>
> I did and I'm pretty sure it looked correct. But I'll double check.

Cool, maybe someone added more smarts to kernel-doc. :)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
