Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDAAC4727F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:59:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0F9B2071E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbgI3N67 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:58:59 -0400
Received: from smtprelay0218.hostedemail.com ([216.40.44.218]:44606 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729903AbgI3N67 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 09:58:59 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 5D77A100E7B48;
        Wed, 30 Sep 2020 13:58:56 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: brass29_5e1495327193
X-Filterd-Recvd-Size: 1774
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Wed, 30 Sep 2020 13:58:54 +0000 (UTC)
Message-ID: <1a9cac491e1813b94cde3bed67d642f52cd81e7d.camel@perches.com>
Subject: Re: [PATCH V3 1/8] sysfs: Add sysfs_emit and sysfs_emit_at to
 format sysfs output
From:   Joe Perches <joe@perches.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     Denis Efremov <efremov@linux.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Date:   Wed, 30 Sep 2020 06:58:53 -0700
In-Reply-To: <20200930115740.GA1611809@kroah.com>
References: <cover.1600285923.git.joe@perches.com>
         <884235202216d464d61ee975f7465332c86f76b2.1600285923.git.joe@perches.com>
         <20200930115740.GA1611809@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2020-09-30 at 13:57 +0200, Greg Kroah-Hartman wrote:
> Kees, and Rafael, I don't know if you saw this proposal from Joe for
> sysfs files, questions below:

https://lore.kernel.org/linux-pm/5d606519698ce4c8f1203a2b35797d8254c6050a.1600285923.git.joe@perches.com/T/

> So I guess I'm asking for another developer to at least agree that this
> feels like the right way forward here.  I don't want to start down this
> path, only to roll them all back as it feels like pointless churn.

https://lore.kernel.org/lkml/c256eba42a564c01a8e470320475d46f@AcuMS.aculab.com/T/#mb40d265bc1dabb8bb64b0dfa29dd8eda44be056e




