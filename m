Return-Path: <SRS0=FCgi=CJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D272C433E6
	for <linux-doc@archiver.kernel.org>; Mon, 31 Aug 2020 07:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54E2F2072D
	for <linux-doc@archiver.kernel.org>; Mon, 31 Aug 2020 07:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgHaHNS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Aug 2020 03:13:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:61592 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgHaHNR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 31 Aug 2020 03:13:17 -0400
IronPort-SDR: Pf8s+igEmyhRiJiSHmKLfCf9vFbWuhgK/WsCmA3/94fFRYIxLhMVymTPyhBrudflpKuRIib+A/
 RAW3bwCHY3ug==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="144602087"
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; 
   d="scan'208";a="144602087"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 00:13:15 -0700
IronPort-SDR: VU5t26U3Po0V4DTrwxKBGHyF96JomAH6lsbYbU2x/7/AF/1hEXJnMgNR0NC81jHrOutJs3PEH1
 lZO6Pu9WiW4w==
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; 
   d="scan'208";a="476616167"
Received: from ngbradon-mobl.ger.corp.intel.com (HELO localhost) ([10.251.94.237])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 00:13:08 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Drew DeVault <sir@cmpwn.com>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Drew DeVault <sir@cmpwn.com>
Subject: Re: [PATCH] submitting-patches.rst: streamline for git usage
In-Reply-To: <C58MQIQSGGUI.1I8IVCR8DPW0C@homura>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <C58MQIQSGGUI.1I8IVCR8DPW0C@homura>
Date:   Mon, 31 Aug 2020 10:13:03 +0300
Message-ID: <87sgc347b4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 28 Aug 2020, "Drew DeVault" <sir@cmpwn.com> wrote:
> On Fri Aug 28, 2020 at 5:47 AM EDT, Jani Nikula wrote:
>> > -2) Describe your changes
>> > +1) Describe your changes
>> >  ------------------------
>>
>> I suggest just tossing the numbering altoghether while at it.
>
> Because there are so many headings, I think the numbering is still
> useful for being able to easily refer to a specific step when asking
> questions.

The unpopular answer is, of course, that you can reference the headings
in the HTML. For example [1].


BR,
Jani.


[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

-- 
Jani Nikula, Intel Open Source Graphics Center
