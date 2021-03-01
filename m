Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDED6C433DB
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 21:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A14A4601FD
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 21:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238195AbhCAV4f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 16:56:35 -0500
Received: from smtprelay0213.hostedemail.com ([216.40.44.213]:54620 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238350AbhCAVyb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Mar 2021 16:54:31 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 60027100E7B40;
        Mon,  1 Mar 2021 21:53:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wind31_2101327276b7
X-Filterd-Recvd-Size: 1518
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Mon,  1 Mar 2021 21:53:38 +0000 (UTC)
Message-ID: <70877984ec78d837159dc643e3ae2b05fd91561c.camel@perches.com>
Subject: Re: [PATCH v8 0/3] checkpatch: add verbose mode
From:   Joe Perches <joe@perches.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>, mchehab@kernel.org
Cc:     lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date:   Mon, 01 Mar 2021 13:53:35 -0800
In-Reply-To: <87tupu36xi.fsf@meer.lwn.net>
References: <20210226093827.12700-1-dwaipayanray1@gmail.com>
         <87tupu36xi.fsf@meer.lwn.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2021-03-01 at 14:22 -0700, Jonathan Corbet wrote:
> Dwaipayan Ray <dwaipayanray1@gmail.com> writes:
> 
> > Add a new verbose mode to checkpatch. The verbose test
> > descriptions are read from the new checkpatch documentation
> > file at `Documentation/dev-tools/checkpatch.rst`, which
> > is also added by this series.
> 
> So I can certainly take the doc change, as requested.  Remind me,
> though...should I apply the whole set, or will the checkpatch changes go
> via another path?

There's no dedicated upstream path for checkpatch.
So please take the checkpatch changes too.


