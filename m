Return-Path: <SRS0=p0eP=3M=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EC7C2D0DB
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 10:02:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 985D824125
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 10:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgAWKCt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jan 2020 05:02:49 -0500
Received: from mga17.intel.com ([192.55.52.151]:32715 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbgAWKCt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 23 Jan 2020 05:02:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jan 2020 02:02:48 -0800
X-IronPort-AV: E=Sophos;i="5.70,353,1574150400"; 
   d="scan'208";a="220617249"
Received: from tletko-mobl3.ger.corp.intel.com (HELO localhost) ([10.252.38.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jan 2020 02:02:47 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Add a document on how to contribute to the documentation
In-Reply-To: <20200122162030.5b789232@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200122162030.5b789232@lwn.net>
Date:   Thu, 23 Jan 2020 12:03:44 +0200
Message-ID: <878slyij5r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 22 Jan 2020, Jonathan Corbet <corbet@lwn.net> wrote:
> This is mostly a collection of thoughts for how people who want to help out
> can make the docs better.  Hopefully the world will respond with a flurry
> of useful patches.

Thanks for writing this!

FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>


> +The documentation TODO list
> +---------------------------
> +
> +There is an endless list of tasks that need to be carried out to get our
> +documentation to where it should be.

This reminds me of an old LCA talk of yours where you said,

"If we do this, we end up with, some years from now, this beautiful,
integrated documentation tree, that covers things in a comprehensive
way, where you can find what you want, looks pretty when you look at
it. It's a nice vision, I hear angels singing when I think about it and
so on, it's where I want to go."

Perhaps it would be time to include some concrete overall goals, a
mission statement if you will, somewhere near the top? I mean other than
"top-quality, comprehensive, better". Or "angels singing". ;)

Of course, can absolutely be a follow-up patch on top.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
