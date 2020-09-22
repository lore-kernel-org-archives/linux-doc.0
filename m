Return-Path: <SRS0=bcQJ=C7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B266C4363D
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 07:23:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 236192145D
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 07:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbgIVHXh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Sep 2020 03:23:37 -0400
Received: from mga11.intel.com ([192.55.52.93]:51642 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729735AbgIVHXh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 22 Sep 2020 03:23:37 -0400
IronPort-SDR: 6eaAt+BmfjLTQ7b3y2qX0yayWXPume5Yg58NcZbnl29bPROWL81QB/pKrsuXFgg5Xk8vtLRKX8
 ECOXbrfGJolg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="157928292"
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; 
   d="scan'208";a="157928292"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 00:23:37 -0700
IronPort-SDR: SuZ/Kthom8dKaAHAyyryCUZWAbTo9l37PE6snPNG1ImXv88s0cuHtI28GH8KMuWXew4NYcjqt3
 rrRG1QZtiQ6Q==
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; 
   d="scan'208";a="485844254"
Received: from kgriffi1-mobl.ger.corp.intel.com (HELO localhost) ([10.251.84.202])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2020 00:23:34 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
In-Reply-To: <20200921222639.GY32101@casper.infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200904102925.52fcd2a1@lwn.net> <20200921222639.GY32101@casper.infradead.org>
Date:   Tue, 22 Sep 2020 10:23:46 +0300
Message-ID: <87sgbaqnp9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 21 Sep 2020, Matthew Wilcox <willy@infradead.org> wrote:
> On Fri, Sep 04, 2020 at 10:29:25AM -0600, Jonathan Corbet wrote:
>> +# cdomain is badly broken in Sphinx 3+.  Leaving it out generates *most*
>> +# of the docs correctly, but not all.  Scream bloody murder but allow
>> +# the process to proceed; hopefully somebody will fix this properly soon.
>> +#
>> +if major >= 3:
>> +    sys.stderr.write('''WARNING: The kernel documentation build process
>> +	does not work correctly with Sphinx v3.0 and above.  Expect errors
>> +	in the generated output.
>
> Should we be converting the kernel-doc script to output 3.0-style markup
> for structs?

IIUC it's not backwards compatible with Sphinx pre-3.0, so you'd either
have to require Sphinx 3.0 or have kernel-doc emit both, depending on
the Sphinx version.


BR,
Jani.


>
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#c-roles

-- 
Jani Nikula, Intel Open Source Graphics Center
