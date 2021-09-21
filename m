Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A79C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 21 Sep 2021 09:58:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 621BB61175
	for <linux-doc@archiver.kernel.org>; Tue, 21 Sep 2021 09:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhIUJ7k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Sep 2021 05:59:40 -0400
Received: from mga07.intel.com ([134.134.136.100]:5338 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231435AbhIUJ7k (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Sep 2021 05:59:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="286994559"
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; 
   d="scan'208";a="286994559"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 02:58:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,310,1624345200"; 
   d="scan'208";a="549421132"
Received: from unknown (HELO localhost) ([10.251.218.108])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 02:58:09 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Markus Schneider-Pargmann <msp@baylibre.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: gpu: drm-internals: Create reference to DRM mm
In-Reply-To: <20210920140326.ygodeun2qokb6wcw@blmsp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210920101334.249832-1-msp@baylibre.com> <874kafv7bu.fsf@intel.com> <20210920140326.ygodeun2qokb6wcw@blmsp>
Date:   Tue, 21 Sep 2021 12:58:06 +0300
Message-ID: <87ilyutfm9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> Hi Jani,
>
> On Mon, Sep 20, 2021 at 02:01:57PM +0300, Jani Nikula wrote:
>> On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
>> > This short sentence references nothing for details about memory manager.
>> > Replace it with the documentation file for DRM memory management.
>> >
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>> > ---
>> >  Documentation/gpu/drm-internals.rst | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
>> > index 06af044c882f..bdcdfc4ede04 100644
>> > --- a/Documentation/gpu/drm-internals.rst
>> > +++ b/Documentation/gpu/drm-internals.rst
>> > @@ -126,8 +126,8 @@ Memory Manager Initialization
>> >  Every DRM driver requires a memory manager which must be initialized at
>> >  load time. DRM currently contains two memory managers, the Translation
>> >  Table Manager (TTM) and the Graphics Execution Manager (GEM). This
>> > -document describes the use of the GEM memory manager only. See ? for
>> > -details.
>> > +document describes the use of the GEM memory manager only. See
>> > +Documentation/gpu/drm-mm.rst for details.
>> 
>> Please use rst references instead of a file reference.
>
> Thanks for your comment. Could you please explain it a bit more to me?
>
> I am new to the kernel sphinx documentation so I looked it up in
> Documentation/doc-guide/sphinx.rst 'Cross-referencing'. It is listed as
> the preferred way to reference other documents if I understand it
> correctly.
>
> Should the doc-guide be updated then if a rst reference is preferred?

Please go with what the doc-guide says, sorry for the noise.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
