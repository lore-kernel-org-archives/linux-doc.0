Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CFFECAAD8
	for <linux-doc@archiver.kernel.org>; Wed, 21 Sep 2022 16:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbiIUQ52 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Sep 2022 12:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbiIUQ5K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Sep 2022 12:57:10 -0400
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C6EEA3;
        Wed, 21 Sep 2022 09:56:15 -0700 (PDT)
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay06.hostedemail.com (Postfix) with ESMTP id C35F6A7795;
        Wed, 21 Sep 2022 16:56:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id C84EB2002B;
        Wed, 21 Sep 2022 16:56:00 +0000 (UTC)
Message-ID: <aac5ee76680d9ea445f09894e161fa1fb66884a8.camel@perches.com>
Subject: Re: [PATCH v7] checkpatch: warn for non-standard fixes tag style
From:   Joe Perches <joe@perches.com>
To:     Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@corigine.com>
Cc:     Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        oss-drivers@corigine.com, Simon Horman <simon.horman@corigine.com>,
        Louis Peens <louis.peens@corigine.com>
Date:   Wed, 21 Sep 2022 09:56:07 -0700
In-Reply-To: <Yyse1XvsdiIJ3dun@oden.dyn.berto.se>
References: <20220914100255.1048460-1-niklas.soderlund@corigine.com>
         <aa858ac592679fdf512debe17e0612c575450860.camel@perches.com>
         <YyLtEza0VhSbflvH@oden.dyn.berto.se> <Yyse1XvsdiIJ3dun@oden.dyn.berto.se>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Stat-Signature: 4b4fdr94awb8f97y889xrrjf9e7y1xtc
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: C84EB2002B
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/QsOblTrNsJ6wV3M3O22304IWryb+lA2o=
X-HE-Tag: 1663779360-402295
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2022-09-21 at 16:25 +0200, Niklas Söderlund wrote:
> Hello Joe,

Hello Niklas

> Just wanted to check on my misunderstanding below before posting a v8.

I think v7 is ok, unless you found something else better.

> > > One grep pattern to verify the non canonical fixes format that
> > > are mistakenly used is:
> > > 
> > > $ git log --since=5-years-ago --no-merges --grep='^\s*fixes' -i --format=email -P | \
> > >   grep -P -i '^\s*fixes' | \
> > >   grep -P -v '^Fixes: [0-9a-f]{12,12}\s*\(".*")'
> > > There are many different styles.
> > > Parentheses are sometimes not used.
> > 
> > I understand this, and I did have a look at it.

Good enough for me.  Thanks.
