Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832D2C43334
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 15:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245607AbiFCPpC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 11:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbiFCPpB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 11:45:01 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA9D2ED7F
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654271100; x=1685807100;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=3uX8zYBMAhYwRM2jPO2zm7vXM4MtRbC0xXfQWLZubco=;
  b=WbJp9qnuXUmty2Gc8DCbQtzHsZMyQCYnwGVE4jM/9BIuXKZeSH3FkTK0
   An3BcZ6Q7Em9ot6K7P6QCDh8a/nBp95UyIEbh7Q1z7Vr5eyobiTFyJhm0
   J6wGUZgBpisuqK5rSRi3r4uC/eIzljluk6y/+Rkk1TuVJAElyjVGvMR2X
   nrbDlgZrzUMAyeUnBBByQy5euU6Ug4p9hGzM4uneu+i85ro52TCHTOxNY
   CqrpMCdtC45837SqGlfgf/6F+IvbwHn+Gx9UyJp+ay/CIfZpDlxta5YVo
   TFlnuVyuYDKyhnKYaLOPulTXtFg6bUp3iX3N9+Eb9UJXewTA5fg/hQF2P
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="256141742"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="256141742"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 08:44:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; 
   d="scan'208";a="578073171"
Received: from richardf-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.55.27])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 08:44:39 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Adam Turner <aaturnerpython@outlook.com>,
        Akira Yokosawa <akiyks@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
In-Reply-To: <LO3P123MB2681A3F3A05E269AE0351799C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <52a6ffc3-300f-289e-b523-bc1ea93459d1@gmail.com>
 <LO3P123MB2681A3F3A05E269AE0351799C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
Date:   Fri, 03 Jun 2022 18:44:36 +0300
Message-ID: <87ee05oior.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 03 Jun 2022, Adam Turner <aaturnerpython@outlook.com> wrote:
>>> From Sphinx's perspective, we'd like to remove long-deprecated code.
>>> What is a good solution here for both sides? The intertial option is
>>> for us to delay the deprecation by another major version (removal is
>>> currently scheduled for Sphinx 6 (2023-05), and we are currently 
>>> releasing a major version every May.
>
>> So, can we assume that there won't be any backward-incompatible
>> behavior changes in Sphinx due to the removal of those long-deprecated
>> code?
>
> I'm referring to removing support for the "c_allow_pre_v3", 
> "c_warn_on_allowed_pre_v3", configuration options [1]_, and the 
> associated support for still parsing the pre v3 syntax in the C 
> domain [2]_. This means that pre v3 syntax in reStructuredText files
> would not work with Sphinx 6 onwards.
>
>> Or do you mean that after the release of Sphinx 6, pre v3 Sphinx
>> will be removed in the PyPI repository?
>
> No releases will be removed from PyPI, but if pre v3 syntax is still
> used, Sphinx 6.0 would fail to properly parse it.

And that's the crux of the problem. From kernel POV I'd very much prefer
not setting an upper bound for the Sphinx version. I think it's
important to be able to build the documentation using the latest Sphinx,
and gradually iron out the inevitable quirks that arise.

However, if you decide to drop support for pre v3 syntax in Sphinx v6,
and we decide to stick to being able to use pre v3 Sphinx, we can't move
forward to newer versions until we bump the lower bound for the Sphinx
version to v3+. (Or we need to hack around Sphinx version differences in
kernel, but I think that would be best avoided.)

BR,
Jani.


>
>> These questions might be too obvious for you but I have no idea what
>> you mean by "removing support".
>
> A
>
> _[1]: https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-c_allow_pre_v3
> _[2]: https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#the-c-domain
>

-- 
Jani Nikula, Intel Open Source Graphics Center
