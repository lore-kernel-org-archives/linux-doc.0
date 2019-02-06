Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 69F997D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Feb 2019 07:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbfBFHtn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Feb 2019 02:49:43 -0500
Received: from smtp1.goneo.de ([85.220.129.30]:60010 "EHLO smtp1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbfBFHtm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 6 Feb 2019 02:49:42 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id A6CBC2410DC;
        Wed,  6 Feb 2019 08:49:40 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id h6p5IF4mEmvV; Wed,  6 Feb 2019 08:49:39 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-091-248-066-056.ewe-ip-backbone.de [91.248.66.56])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 06B4C241024;
        Wed,  6 Feb 2019 08:49:38 +0100 (CET)
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
References: <20190131040623.15569-1-me@tobin.cc>
 <20190131040623.15569-4-me@tobin.cc> <20190131092757.GF28876@rapoport-lnx>
 <20190131205608.GB1329@eros.localdomain> <20190201160310.5b98eb69@lwn.net>
 <20190202143209.GA8620@rapoport-lnx> <20190204211220.GA8601@eros.localdomain>
 <20190204160336.12fe82f6@lwn.net>
 <c19a1a84-72cd-407a-f4f1-180c5b0d4bf0@darmarit.de>
 <20190206042755.GC16761@eros.localdomain>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <c4ee1d24-6a14-d87f-3a0c-88b13e56590f@darmarit.de>
Date:   Wed, 6 Feb 2019 08:49:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190206042755.GC16761@eros.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 06.02.19 um 05:27 schrieb Tobin C. Harding:
 > Seems we either change them all or none of them.

Both are OK .. from the spec ...

"Simple reference names are single words consisting of alphanumerics plus
isolated (no two adjacent) internal hyphens, underscores, periods, colons
and plus signs; no whitespace or other characters are allowed." [1]


 >> Many errors are not reported again in rebuilds.
 >
 > It's more than that.  Seems that no .o files means dependencies are not
 > the same in docs directories to *usual* source code directories, as in
 > this example, a file with an outdated label was not rebuilt since it
 > wasn't touched.

Right, this is what they call the 'doctree' files (see [2] for build
phases), one for every source file.  ATM they are located in the hidden
folder 'output/.doctree'.  OT here, just to mentioning: this will result in
the folder being exported at the end, e.g. kernel.org:

   https://www.kernel.org/doc/html/latest/.doctrees/

 > Note to self, always do clean build for docs patches.  Thanks.
 >
 >> To reproduce this error run 'make cleandocs htmldocs' first.  Then you will see
 >> this error message (I'am on current docs-next from Jon using Sphinx v1.8.3 ):
 >>
 >>    Documentation/core-api/mm-api.rst:22: WARNING: undefined label: \
 >>      memory-allocation (if the link has no caption ...)
 >
 > Can confirm I also get this warning,
..
 > With patch reverted, on docs-next, I've got 0 'undefined labels'
 > warnings.

Thanks for verification.

[1] 
http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#reference-names
[2] http://www.sphinx-doc.org/en/master/extdev/index.html#build-phases


  -- Markus --

