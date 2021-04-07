Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5C7C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 12:07:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7224A6139E
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 12:07:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237884AbhDGMIA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 08:08:00 -0400
Received: from mx.kolabnow.com ([95.128.36.40]:34148 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352018AbhDGMHh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 08:07:37 -0400
X-Greylist: delayed 397 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Apr 2021 08:07:35 EDT
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id E4312A6C;
        Wed,  7 Apr 2021 14:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        message-id:references:in-reply-to:subject:subject:from:from:date
        :date:content-transfer-encoding:content-type:content-type
        :mime-version:received:received:received; s=dkim20160331; t=
        1617797230; x=1619611631; bh=N3MQV+BGgPF5ygeqnhFjsOmzMJ/LUw583Vh
        P90rhNbA=; b=CwUYJbiL9c/Jvs6UTmAQX6mIllFDaB6AtjISWHUnkqTNtY2CKXE
        UA8xxXhUZa9ljRd6kGhtu5ZNALE+iE8HstgbqTYCWmZq0GyD4L20E4zqK+JnbJrq
        G6+gWSZBuOuznvfg7EoHGAV5f4kxeQktM27SSjGliHq0xrkTwIhrpTHCoSTRCwAw
        g/kOCx45Hk0THm0p6qhOfHNzQoJder+Yz46txqW5jSBNGaMtQCA/+YrQ6yccxr4Y
        wUJea3wVyYxvtacUtZmq1O5uvDvVUPeyp3AQrxQkUU3Qstg1X7yWRBzWXmhrBM97
        niYm6HIk4+KtbybahfnP0QBGDbujPsNwZvdYuByp3btOb9KH1E0a/teZQ7CHTwKO
        0cdrGSKoe1Dc1S0Tm3W446jyf7quopz0ENmCOSHmPn3xerNs8lvVouE9uvnIZGw2
        g4U4FqS/H+PnEFEuVWyLrLBmD3JnwXoY6gbb+n007J3GZiSJ/nrdCDe83Bo37BYK
        I4ecFiylm39LRQtfr0eLnbobt2AqavSAyeF+uIq9EH7wQVxigEyf9epPFE7pi8Ar
        5IErs5HIR4mZujAYTi0pHrMyJGP5MzvDq00hXEiJx2uNeMURnDgm1GcyIQBxNqQH
        55+hpqjLC4O8ODjjxJIG3a7m3kT84/oaLrwHyJl9vD484AS/G+Sv4b6c=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cN2FzxfznuCh; Wed,  7 Apr 2021 14:07:10 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 8940E240;
        Wed,  7 Apr 2021 14:07:05 +0200 (CEST)
Received: from int-subm002.mykolab.com (unknown [10.9.37.2])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id 26C113646;
        Wed,  7 Apr 2021 14:06:56 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 14:06:55 +0200
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Harry Wei <harryxiyou@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/19] docs: replace transation references for
 reporting-bugs.rst
In-Reply-To: <20210407113934.1a61ad9e@coco.lan>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
 <65d1983fb625b5dd38d05f5c75a592e61992a4e0.1617783062.git.mchehab+huawei@kernel.org>
 <1c37acb4-f927-e2f7-8c77-d4fc2644f1d8@leemhuis.info>
 <20210407113934.1a61ad9e@coco.lan>
Message-ID: <ddf51e52edf3d500fde38f892a486c86@vaga.pv.it>
X-Sender: federico.vaga@vaga.pv.it
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021-04-07 11:39, Mauro Carvalho Chehab wrote:
> Em Wed, 7 Apr 2021 10:52:14 +0200
> Thorsten Leemhuis <linux@leemhuis.info> escreveu:
> 
>> On 07.04.21 10:20, Mauro Carvalho Chehab wrote:
>> > Changeset d2ce285378b0 ("docs: make reporting-issues.rst official and delete reporting-bugs.rst")
>> > dropped reporting-bugs.rst, in favor of reporting-issues.rst, but
>> > translations still need to be updated, in order to point to the
>> > new file.
>> >
>> > Fixes: d2ce285378b0 ("docs: make reporting-issues.rst official and delete reporting-bugs.rst")
>> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> 
>> Well, yeah, might be the right thing to do. But FWIW: when I recently
>> submitted the change that became d2ce285378b0 I actually pointed out
>> that it breaks some of the translations. Back then I considered to do
>> what you did with this patch, but among others got a reply from 
>> Jonathan
>> who said "let the translators catch up on their own time". For details
>> see this thread:
>> https://lore.kernel.org/linux-doc/87h7krksvu.fsf@meer.lwn.net/
> 
> Hmm... at the e-mail you mentioned, Jon commented that:
> 
> 	"None of the broken references actually generate warnings"

I take the occasion to highlight it.

If there are trivial fixes due to broken references introduced by a 
patch, then fixing the translation is recommended (as you fix all 
instances of a function if you change its arguments), and you do not 
need to know the target language to do it. Any other change to the text 
body is left to translators.

> That's actually not the case: they do generate warnings if
> the Kernel is built with CONFIG_WARN_MISSING_DOCUMENTS:
> 
> 	Documentation/translations/zh_CN/admin-guide/reporting-issues.rst:
> Documentation/admin-guide/reporting-bugs.rst
> 	Documentation/translations/zh_CN/admin-guide/reporting-issues.rst:
> Documentation/admin-guide/reporting-bugs.rst
> 
> As it will call the ./scripts/documentation-file-ref-check.
> 
> That's basically why I detected and submitted a fix ;-)
> 
> Thanks,
> Mauro

-- 
Federico Vaga
http://www.federicovaga.it/
