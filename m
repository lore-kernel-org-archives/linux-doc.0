Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98DECCA480
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 19:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347949AbiFCTGf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 15:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349100AbiFCTFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 15:05:37 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C4930F78
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654283135; x=1685819135;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=r5RWeJgMtZVPkny9qFe9s5iOXPG3gY4hSyf7jTr8/Ko=;
  b=iz8CZnquIOLyHbuypMb9psNp4cTR0c58SIIU4PE2raZ8XVa6MdxnIdVI
   zR8gR8GNV8/t8GzXvpyCjyYHRWQh3SOrLEZWyE90TJkkMAFAFzu6xVMy7
   v+1mFD4kWdDbMrZOOnTDxg182KmqBLbS6PhKodVF47mCneSD4qzDLLU66
   tFvW47PIPS9M7N8eb4mB7i3KkZ8CKNiuxd4Mhs/OAmUAqIy5gcZJbiyMR
   m2qWRb+9TmzHIP0UcgwITCHpO2bhKsG3qqu4T1p1CoDlZUCV06oonNF1v
   QptYDodPftia1BHNdaays64x0pkHfxTAAgqOdPtaOzbQTa46h9lJlceCM
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="273890417"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; 
   d="scan'208";a="273890417"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 12:05:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; 
   d="scan'208";a="578169673"
Received: from richardf-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.55.27])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 12:05:33 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Akira Yokosawa <akiyks@gmail.com>,
        Adam Turner <aaturnerpython@outlook.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
In-Reply-To: <4f13e688-1b4c-1a8e-7ca5-b2fc6d21263c@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <52a6ffc3-300f-289e-b523-bc1ea93459d1@gmail.com>
 <LO3P123MB2681A3F3A05E269AE0351799C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <87ee05oior.fsf@intel.com>
 <LO3P123MB26814568842CC74EF831288EC2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <4f13e688-1b4c-1a8e-7ca5-b2fc6d21263c@gmail.com>
Date:   Fri, 03 Jun 2022 22:05:20 +0300
Message-ID: <87bkv9o9e7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 04 Jun 2022, Akira Yokosawa <akiyks@gmail.com> wrote:
> [+Cc: Mauro]
>
> On Fri, 3 Jun 2022 15:54:33 +0000,
> Adam Turner wrote:
>>>> No releases will be removed from PyPI, but if pre v3 syntax is still
>>>> used, Sphinx 6.0 would fail to properly parse it.
>> 
>>> And that's the crux of the problem. From kernel POV I'd very much prefer
>>> not setting an upper bound for the Sphinx version. I think it's
>>> important to be able to build the documentation using the latest Sphinx,
>>> and gradually iron out the inevitable quirks that arise.
>> 
>>> However, if you decide to drop support for pre v3 syntax in Sphinx v6,
>>> and we decide to stick to being able to use pre v3 Sphinx, we can't move
>>> forward to newer versions until we bump the lower bound for the Sphinx
>>> version to v3+. (Or we need to hack around Sphinx version differences in
>>> kernel, but I think that would be best avoided.)
>
> I might not be grasping the full context here, but I think the main script of
> kernel documentation tool ./scripts/kernel-doc (a perl script) changes its
> behavior depending on the target Sphinx version.

That doesn't change my opinion that it would be best avoided! ;)

BR,
Jani.

>
> Its help text says:
>
>>    Output format modifiers
>
>>       reStructuredText only
>
>>        -sphinx-version VERSION
>
>>                Use the ReST C domain dialect compatible with a specific Sphinx
>
>>                Version.
>
>
>>
>>                If not specified, kernel-doc will auto-detect using the
>
>>                sphinx-build version found on PATH.
>
> So it looks to me like it is already compatible with Sphinx 3.1 and later.
>
>> 
>> I don't want to be in the position of knowingly breaking the
>> documentation tooling for the kernel. A strawman of a compromise
>> would be for us (Sphinx) to delay the removal to Sphinx 7.0, and the
>> kernel to increase the minimum to Sphinx 3.1 (required for
>> ".. c:namespace::").
>
> Yes, ".. c:namespace::" is actively used in userspace-api documentation.
>
> FYI, see a recent reply from Mauro WRT support of kernel documentation
> with different versions of Sphinx at:
>
>   https://lore.kernel.org/linux-doc/20220521114629.6ee9fc06@coco.lan/
>
>         Thanks, Akira
>
>
>>                       That would enable the kernel to gradually update
>> the syntax over a longer period, as I believe you won't be able to 
>> use the v3 syntax currently.
>> 
>> Equally, Jonathan said he was hesitant to increase the minimum to 
>> Sphinx 3, so perhaps that wouldn't work.
>> 
>> A

-- 
Jani Nikula, Intel Open Source Graphics Center
