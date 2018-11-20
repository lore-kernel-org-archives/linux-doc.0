Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E71A97D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Nov 2018 10:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbeKTVCd convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 16:02:33 -0500
Received: from mga14.intel.com ([192.55.52.115]:23850 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726569AbeKTVCd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Nov 2018 16:02:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2018 02:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,256,1539673200"; 
   d="scan'208";a="109634058"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.72.61])
  by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2018 02:34:03 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Will Deacon <will.deacon@arm.com>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
        David Howells <dhowells@redhat.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Michael Halcrow <mhalcrow@google.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: Use "while" instead of "whilst"
In-Reply-To: <1542625365-21886-1-git-send-email-will.deacon@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1542625365-21886-1-git-send-email-will.deacon@arm.com>
Date:   Tue, 20 Nov 2018 12:34:35 +0200
Message-ID: <87in0sf35w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 19 Nov 2018, Will Deacon <will.deacon@arm.com> wrote:
> Whilst making an unrelated change to some Documentation, Linus sayeth:

Reference?

>
>   | Afaik, even in Britain, "whilst" is unusual and considered more
>   | formal, and "while" is the common word.
>   |
>   | [...]
>   |
>   | Can we just admit that we work with computers, and we don't need to
>   | use þe eald Englisc spelling of words that most of the world never
>   | uses?
>
> dictionary.com refers to the word as "Chiefly British", which is
> probably an undesirable attribute for technical documentation.
>
> Replace all occurrences under Documentation/ with "while".

It's an innocent enough change I guess... but seriously? Do we now need
a documentation style guide too...? Should we block an otherwise good
patch with "whilst" in it from now on?

Personally, I'd accept that our documentation is a hodge podge of
regional dialects, written by native and non-native speakers with
incredibly diverse backgrounds and different levels of education and
experience. If we can keep the documentation understandable and mostly
typo free, I'd be happy. Even good grammar seems to be a stretch
goal... ;)


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
