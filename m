Return-Path: <SRS0=+SUo=C5=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B867FC43463
	for <linux-doc@archiver.kernel.org>; Sun, 20 Sep 2020 15:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B55A20897
	for <linux-doc@archiver.kernel.org>; Sun, 20 Sep 2020 15:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgITPEg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Sep 2020 11:04:36 -0400
Received: from nikam.ms.mff.cuni.cz ([195.113.20.16]:50474 "EHLO
        nikam.ms.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITPEf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Sep 2020 11:04:35 -0400
X-Greylist: delayed 528 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 11:04:34 EDT
Received: by nikam.ms.mff.cuni.cz (Postfix, from userid 2587)
        id D18C92810CD; Sun, 20 Sep 2020 16:55:42 +0200 (CEST)
Date:   Sun, 20 Sep 2020 16:55:42 +0200
From:   Martin =?utf-8?B?TWFyZcWh?= <mj@ucw.cz>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Karel Zak <kzak@redhat.com>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-video@atrey.karlin.mff.cuni.cz,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] Documentation/admin-guide: README & svga:
 remove use of "rdev"
Message-ID: <mj+md-20200920.145511.9167.nikam@ucw.cz>
References: <20200918015640.8439-1-rdunlap@infradead.org>
 <20200918015640.8439-2-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200918015640.8439-2-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello!

> "rdev" is considered antiquated, ancient, archaic, obsolete, deprecated
> {choose any or all}.
> 
> Remove use of "rdev" and "vidmode" (a symlink to rdev) in
> admin-guide/README.rst and admin-guide/svga.rst.

Acked-by: Martin Mares <mj@ucw.cz>

				Have a nice fortnight
-- 
Martin `MJ' Mareš                        <mj@ucw.cz>   http://mj.ucw.cz/
United Computer Wizards, Prague, Czech Republic, Europe, Earth, Universe
Press any key to quit or any other key to continue
