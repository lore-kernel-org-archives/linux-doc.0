Return-Path: <SRS0=pwJD=2I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21193C43603
	for <linux-doc@archiver.kernel.org>; Wed, 18 Dec 2019 06:57:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3DDA2176D
	for <linux-doc@archiver.kernel.org>; Wed, 18 Dec 2019 06:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfLRG5x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Dec 2019 01:57:53 -0500
Received: from mga01.intel.com ([192.55.52.88]:56001 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbfLRG5x (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Dec 2019 01:57:53 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 22:57:52 -0800
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; 
   d="scan'208";a="209984460"
Received: from asama-mobl.amr.corp.intel.com (HELO localhost) ([10.252.50.109])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 22:57:50 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     jim.cromie@gmail.com,
        Linux Documentation List <linux-doc@vger.kernel.org>
Cc:     Jason Baron <jbaron@akamai.com>
Subject: Re: is there a preferred form of root-prompt example ?
In-Reply-To: <CAJfuBxxJptTBpEY-HYmVCy325=UZTm4BLrO0kJ2B27eKy+dx-A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAJfuBxxJptTBpEY-HYmVCy325=UZTm4BLrO0kJ2B27eKy+dx-A@mail.gmail.com>
Date:   Wed, 18 Dec 2019 08:57:55 +0200
Message-ID: <87d0cm15os.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 17 Dec 2019, jim.cromie@gmail.com wrote:
> so Im looking at Documentation/admin-guide/dynamic-debug-howto.rst
>
> its a typical root-shell command environment.
>
> there are a lot of different example prompts scattered about,
> which is objectively inconvenient for copy-pasting.
>
> I briefly played with aliasing away the prompts, and it seems like it
> might work,
> but it seems way too magical to put into examples just to make the
> various example prompts play nice with copy-paste.
>
> At minimum, it seems good to reduce this to one or few variations,
> dir-agnostic preferred, and ideally evaluates to nil (without an ugly
> alias), leaving 1st token as the command itself.
>
> Also '//' is not a legit comment char in root-shell-environ, # is better.
> I have this and several other doc patches, this is the right place to
> send them ?
>
> comments ?

Cc: Jason, dynamic debug maintainer per MAINTAINERS

FWIW, I'd unify on single # as root prompt or just throw away the prompt
altogether, and assume /sys/kernel/debug as the debugfs path. You can
mention somewhere the privileges the examples assume, as well as tell
people to replace /sys/kernel/debug with the actual debugfs path. I'd
also unwrap the lines instead of splitting to several lines.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
