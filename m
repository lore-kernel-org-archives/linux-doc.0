Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4FFC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 18:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72DE764DFF
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 18:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhBOSLy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 13:11:54 -0500
Received: from smtprelay0134.hostedemail.com ([216.40.44.134]:33400 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230105AbhBOSLv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 13:11:51 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 37C57180060E3;
        Mon, 15 Feb 2021 18:11:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: horse35_6111c282763d
X-Filterd-Recvd-Size: 1908
Received: from [192.168.43.37] (unknown [172.58.92.12])
        (Authenticated sender: joe@perches.com)
        by omf01.hostedemail.com (Postfix) with ESMTPA;
        Mon, 15 Feb 2021 18:11:06 +0000 (UTC)
Message-ID: <2162334bdf4d635f1414ffef52378c0f423366a7.camel@perches.com>
Subject: Re: [PATCH RFC v3 2/3] docs: add documentation for checkpatch
From:   Joe Perches <joe@perches.com>
To:     Matthew Wilcox <willy@infradead.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc:     linux-doc@vger.kernel.org, lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 15 Feb 2021 10:11:03 -0800
In-Reply-To: <20210214121501.GC2858050@casper.infradead.org>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
         <20210213131513.51386-3-dwaipayanray1@gmail.com>
         <20210214121501.GC2858050@casper.infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 2021-02-14 at 12:15 +0000, Matthew Wilcox wrote:
> On Sat, Feb 13, 2021 at 06:45:12PM +0530, Dwaipayan Ray wrote:
> > +Checkpatch (scripts/checkpatch.pl) is a perl script which checks for trivial style
> 
> It's quite amusing that this patch contains lines > 80 columns.

Then you could amuse yourself further by looking at the existing
line lengths of .rst files.

$ git ls-files -- '*.rst' | \
  xargs cat | \
  awk '{print length($0);}' | \
  sort -n | \
  uniq -c | \
  tail -20
      2 226
      1 230
      1 233
      1 234
     48 246
      1 253
      2 257
      1 263
      1 270
      1 275
      1 276
      1 293
      1 294
      1 308
      2 324
      1 359
      1 360
      5 369
      1 370
      2 409

Other than testing whether or not an SPDX license line exists,
checkpatch doesn't inspect .rst files.

There are better tools for that.


