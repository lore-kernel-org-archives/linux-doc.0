Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A971C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 19:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08429613B7
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 19:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236282AbhDPTE1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 15:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235998AbhDPTE0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 15:04:26 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C22C061574
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 12:04:02 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7C9EA491;
        Fri, 16 Apr 2021 19:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C9EA491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618599841; bh=ANcJnljUldBfsxwsJejbZ737Ohmx9wXvzi8Qa6QBl98=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Xf0bamRDwfDUT5VKqoL3n5oG7fN6htj2nmVM3f7KJIQgSjV61DH4/Q+en10rlpbeU
         iIw+m9Ba21xBcMRswRfp7+R8JuJ9bWLGZOx2qcfu1ltVj2b9/+IwyKff5tte9IFmyL
         4U33Lkn3wTtz5jr9rpvXMa96BI2y+3OPDqe3lNSo7ZJuDpPP52+NkI3LWHbfQxsmkp
         Ltajrvx1E8EVAGNJlYLwor1fXey2AMsKUQT1zbG3waoiVl9foFqja+9YbHfiQhyTEq
         FhOBaoIXDiiOOe2Y23AmOhwPhUscEf5425BTugVpPvcRSC6OBcjCFCzAHOEtVi2mta
         ul4BR67Khqujg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Ian Romanick <idr@freedesktop.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Matthew Auld <matthew.auld@intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Mesa Dev <mesa-dev@lists.freedesktop.org>,
        Kenneth Graunke <kenneth@whitecape.org>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [Mesa-dev] [PATCH v3 3/4] drm/i915/uapi: convert i915_query and
 friend to kernel doc
In-Reply-To: <CAKMK7uH-K=CmMtwi3FcVsGdTGRwYtxDXhAgohz1_WWQL-RQzEw@mail.gmail.com>
References: <20210415155958.391624-1-matthew.auld@intel.com>
 <20210415155958.391624-3-matthew.auld@intel.com>
 <5de63e24-51f0-71eb-b992-484da998e65f@freedesktop.org>
 <CAKMK7uH-K=CmMtwi3FcVsGdTGRwYtxDXhAgohz1_WWQL-RQzEw@mail.gmail.com>
Date:   Fri, 16 Apr 2021 13:04:01 -0600
Message-ID: <87zgxyf3vi.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Daniel Vetter <daniel@ffwll.ch> writes:

> On Fri, Apr 16, 2021 at 12:25 AM Ian Romanick <idr@freedesktop.org> wrote:
>> Since we just had a big discussion about this on mesa-dev w.r.t. Mesa
>> code and documentation... does the kernel have a policy about which
>> flavor (pun intended) of English should be used?
>
> I'm not finding it documented in
> https://dri.freedesktop.org/docs/drm/doc-guide/sphinx.html but I
> thought we've discussed it. Adding linux-doc and Jon Corbet.

It's in Documentation/doc-guide/contributing.rst:

> Please note that some things are *not* typos and should not be "fixed":
> 
>  - Both American and British English spellings are allowed within the
>    kernel documentation.  There is no need to fix one by replacing it with
>    the other.

Thanks,

jon
