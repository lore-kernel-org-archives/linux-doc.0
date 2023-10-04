Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E56E7C4D0
	for <linux-doc@archiver.kernel.org>; Wed,  4 Oct 2023 15:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243137AbjJDPPr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Oct 2023 11:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243139AbjJDPPr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Oct 2023 11:15:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD3193
        for <linux-doc@vger.kernel.org>; Wed,  4 Oct 2023 08:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696432543; x=1727968543;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=sHFHQfzYuB5Gq6ojcuSaxd9IGHWW0LYF8tdxY8NMiJ4=;
  b=g69NraFgrPZm6bitw4706rCDiAMGGh3c8WhZMnpnfxTpAq/zyrXnBGbt
   DTw5DiSSgil27LrD+hUKXIF/0MtPfHn4+PFopOfdK9dW2pA9Zd13Dv3jc
   RRzBfjvJvRv4cf3upIXI5+nKlKAQrLqADEtgYA+iFOHljO1zVMd2ta/9c
   +y9SmjXX2feNZsEhP4c80uGBgVp/by3Y9DZbMp5rG8KXXo5REUb/Hj1ih
   7j4N2Qin9KIxErLIYLv24wNfPILZVfmJRviS8QytaaQbH5kMVR7BG5oMA
   5PouAvSE16OwmlaDa7ScPXnWeynoR74okK8YBKfFwAXGDTa/fvAkslXEs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383100607"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="383100607"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 08:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="841905702"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="841905702"
Received: from msterni-mobl.ger.corp.intel.com (HELO localhost) ([10.252.56.48])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 08:15:05 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Carlos Bilbao <carlos.bilbao@amd.com>
Subject: Re: [PATCH] doc: Always check kernel-doc
In-Reply-To: <87bkdf5z5w.fsf@meer.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230817144142.903553-1-willy@infradead.org>
 <87bkdf5z5w.fsf@meer.lwn.net>
Date:   Wed, 04 Oct 2023 18:15:03 +0300
Message-ID: <87lecie7wo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 03 Oct 2023, Jonathan Corbet <corbet@lwn.net> wrote:
> "Matthew Wilcox (Oracle)" <willy@infradead.org> writes:
>
>> kernel-doc checks were initially enabled only for builds which had extra
>> warnings enabled.  We have now eliminated enough kernel-doc warnings that
>> we can enable kernel-doc checking by default.  This comes at a slight
>> cost; for an allmodconfig build, make -j8 fs/ timings on my laptop
>> increase by less than 5%:
>>
>> before real     4m7.456s        4m4.416s        4m6.663s
>> after real      4m18.960s       4m21.566s       4m23.234s
>> before user     29m35.370s      29m11.036s      29m30.092s
>> after user      30m55.602s      31m10.918s      31m20.311s
>> before sys      2m8.230s        2m6.392s        2m9.727s
>> after sys       2m19.896        2m23.422s       2m25.762s
>>
>> This feels like a reasonable price to pay to force people to keep
>> documentation up to date.
>>
>> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
>> ---
>>  scripts/Makefile.build | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> So I finally got around to actually giving this a try ...
>
> It adds 1,095 warnings to an allmodconfig build here.  If I merge that,
> I suspect that next thing that happens will be One Of Those Emails from
> Linus... and perhaps from others as well.
>
> If we had a series that drove the number to zero prior to this change,
> it would be a different story.  I'm kind of thrashing and don't think I
> can do that in the near future, as nice as it would be.  I suspect
> there's not a lot of other folks just waiting for a chance to do this
> either.
>
> As nice as it would be to have this, I don't think it would survive to a
> mainline release if I tried to push it now.  But maybe others disagree?

I'll leave that decision up to the people who have to face the music.

But an alternative would be to add more warning levels to kernel-doc,
put the most verbose messages from the allmodconfig run behind some
-Wall knob, always run kernel-doc without that, and make W=1 run with
-Wall. It would be an iterative path forward.

Now Someone(tm) just needs to implement that. ;)


BR,
Jani.


-- 
Jani Nikula, Intel
