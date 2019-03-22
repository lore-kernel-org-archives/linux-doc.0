Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD6827D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Mar 2019 17:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727689AbfCVRDM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Mar 2019 13:03:12 -0400
Received: from smtprelay0250.hostedemail.com ([216.40.44.250]:56328 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727105AbfCVRDM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Mar 2019 13:03:12 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id A824C613F;
        Fri, 22 Mar 2019 17:03:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: heat55_1b77e98677f4d
X-Filterd-Recvd-Size: 2496
Received: from XPS-9350.home (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Fri, 22 Mar 2019 17:03:08 +0000 (UTC)
Message-ID: <0f4538aa6a91c071f6e590c2d3f60a474b14fab5.camel@perches.com>
Subject: Re: [PATCH v4] docs: Clarify the usage and sign-off requirements
 for Co-developed-by
From:   Joe Perches <joe@perches.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Tobin C . Harding" <me@tobin.cc>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
Date:   Fri, 22 Mar 2019 10:03:07 -0700
In-Reply-To: <20190322155735.13954-1-sean.j.christopherson@intel.com>
References: <20190322155735.13954-1-sean.j.christopherson@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2019-03-22 at 08:57 -0700, Sean Christopherson wrote:
> The documentation for Co-developed-by is a bit light on details, e.g. it
> doesn't explicitly state that:
> 
>   - Multiple Co-developed-by tags are perfectly acceptable
>   - Co-developed-by and Signed-off-by must be paired together
>   - SOB ordering should still follow standard sign-off procedure
> 
> Lack of explicit direction has resulted in developers taking a variety
> of approaches, often lacking any intent whatsoever, e.g. scattering SOBs
> willy-nilly, collecting them all at the end or the beginning, etc...
> Tweak the wording to make it clear that multiple co-authors are allowed,
> and document the expectation that standard sign-off procedures are to
> be followed.
> 
> The use of "original author" has also led to confusion as many patches
> don't have just one "original" author, e.g. when multiple developers
> are involved from the genesis of the patch.  Remove all usage of
> "original" and instead call out that Co-developed-by is simply a way to
> provide attribution in addition to the From tag, i.e. neither tag is
> intended to imply anything with regard to who did what.
> 
> Provide examples to (hopefully) eliminate any ambiguity.

Please add the checkpatch bit to this at the same time.


