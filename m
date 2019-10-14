Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 408047D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Oct 2019 20:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731550AbfJNUzq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Oct 2019 16:55:46 -0400
Received: from smtprelay0130.hostedemail.com ([216.40.44.130]:58924 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731694AbfJNUzq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Oct 2019 16:55:46 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 28298182CED2A;
        Mon, 14 Oct 2019 20:55:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: pen10_4f27ab242ff2d
X-Filterd-Recvd-Size: 1763
Received: from XPS-9350 (cpe-23-242-95-240.socal.res.rr.com [23.242.95.240])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Mon, 14 Oct 2019 20:55:43 +0000 (UTC)
Message-ID: <f7ebadf988edddd423187c3a09fcc35bf69b25f6.camel@perches.com>
Subject: Re: Documentation/, SPDX tags, and checkpatch.pl
From:   Joe Perches <joe@perches.com>
To:     John Hubbard <jhubbard@nvidia.com>,
        Andy Whitcroft <apw@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     LKML <linux-kernel@vger.kernel.org>
Date:   Mon, 14 Oct 2019 13:55:41 -0700
In-Reply-To: <124ecffe-25a0-ace6-f106-d9d173c17035@nvidia.com>
References: <124ecffe-25a0-ace6-f106-d9d173c17035@nvidia.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2019-10-14 at 13:47 -0700, John Hubbard wrote:
> Hi,
> 
> When adding a new Documentation/ file, checkpatch.pl is warning me
> that the SPDX tag is missing. Should checkpatch.pl skip those kinds
> of warnings, seeing as how we probably don't intend on putting the
> SPDX tags at the top of the Documentation/*.rst files?
> 
> Or are we, after all? I'm just looking to get to a warnings-free situation 
> here, one way or the other. :)
> 
> The exact warning I'm seeing is:
> 
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> #25: FILE: Documentation/vm/get_user_pages.rst:1:
> +.. _get_user_pages:
> 

Looks like ~18% of the .rst files already have SPDX markers

$ git ls-files -- '*.rst' | wc -l
2125

$ git grep -n "SPDX-License-Identifier:" -- '*.rst'| grep ':1:' | wc -l
378

Likely all .rst files will have these markers eventually.

