Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74492C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  8 Nov 2021 13:00:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55E6D610F7
	for <linux-doc@archiver.kernel.org>; Mon,  8 Nov 2021 13:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239746AbhKHNCw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Nov 2021 08:02:52 -0500
Received: from mga18.intel.com ([134.134.136.126]:35777 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238770AbhKHNCv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 8 Nov 2021 08:02:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="219118356"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="219118356"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2021 05:00:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; 
   d="scan'208";a="503010130"
Received: from mschuett-mobl2.ger.corp.intel.com (HELO localhost) ([10.249.33.194])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2021 05:00:05 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     "Artem S. Tashkinov" <aros@gmx.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 (RFC)] docs: discourage users from using bugzilla.kernel.org
In-Reply-To: <0b78b74e-5c72-1258-8373-5385d5709a6c@gmx.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210110121033.130504-1-linux@leemhuis.info> <6abc7248-efda-b569-9030-5384e5ce1f29@gmx.com> <87mtme98l6.fsf@intel.com> <0b78b74e-5c72-1258-8373-5385d5709a6c@gmx.com>
Date:   Mon, 08 Nov 2021 15:00:02 +0200
Message-ID: <871r3q950t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 08 Nov 2021, "Artem S. Tashkinov" <aros@gmx.com> wrote:
> It does *not* help one bit that we have different bug trackers and
> mailing lists for a *single* component which is the kernel. No other
> software project under the sun makes the user rack their head trying to
> understand how and where to post bug reports.

I suppose the kernel is a single component only from a fairly narrow
user centric view. Sure, it would be nice, from a user perspective, to
have a single bug tracker for everything. But behind the scenes, the
kernel development community is so broad and fragmented it's basically
impossible to get people to agree on a tracker that would suit everyone
and that everyone would use. Furthermore, there are users that insist on
reporting bugs on their own terms anyway, refusing to sign up to any
trackers.

Arguably "the single bug tracker" most users should report their kernel
problems for triage first is their distro bug tracker.

> Can we shut down bugzilla.kernel.org completely? In its current form
> it's nothing but disgrace.

Works for me, ymmv.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
