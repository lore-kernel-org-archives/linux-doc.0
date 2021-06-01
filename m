Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D1DC47092
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 21:57:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7412E6124B
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 21:57:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234782AbhFAV7K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Jun 2021 17:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbhFAV7I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Jun 2021 17:59:08 -0400
Received: from hera.aquilenet.fr (hera.aquilenet.fr [IPv6:2a0c:e300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE60C061574;
        Tue,  1 Jun 2021 14:57:26 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by hera.aquilenet.fr (Postfix) with ESMTP id 04BFA31F;
        Tue,  1 Jun 2021 23:57:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
        by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id K_9bVPwCLzdY; Tue,  1 Jun 2021 23:57:24 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
        by hera.aquilenet.fr (Postfix) with ESMTPSA id 0A9C6CD;
        Tue,  1 Jun 2021 23:57:24 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
        (envelope-from <samuel.thibault@ens-lyon.org>)
        id 1loCO3-005VnQ-85; Tue, 01 Jun 2021 23:57:23 +0200
Date:   Tue, 1 Jun 2021 23:57:23 +0200
From:   Samuel Thibault <samuel.thibault@ens-lyon.org>
To:     Igor Torrente <igormtorrente@gmail.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>, corbet@lwn.net,
        gregkh@linuxfoundation.org, grandmaster@al2klimov.de,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: Convert the Speakup guide to rst
Message-ID: <20210601215723.7kwakixrrizba3bu@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Igor Torrente <igormtorrente@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>, corbet@lwn.net,
        gregkh@linuxfoundation.org, grandmaster@al2klimov.de,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210531215737.8431-1-igormtorrente@gmail.com>
 <87r1hlrfhk.fsf@intel.com>
 <1b1e0e07-d438-0902-a28a-e346cba53518@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b1e0e07-d438-0902-a28a-e346cba53518@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 04BFA31F
X-Spamd-Result: default: False [-2.50 / 15.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         MIME_GOOD(-0.10)[text/plain];
         HAS_ORG_HEADER(0.00)[];
         RCVD_COUNT_THREE(0.00)[3];
         RCPT_COUNT_SEVEN(0.00)[8];
         FREEMAIL_TO(0.00)[gmail.com];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MID_RHS_NOT_FQDN(0.50)[];
         BAYES_HAM(-3.00)[100.00%]
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Igor Torrente, le mar. 01 juin 2021 12:11:26 -0300, a ecrit:
> > > +| acntsa -- Accent SA
> > > +| acntpc -- Accent PC
> > > +| apollo -- Apollo
> > > +| audptr -- Audapter
> > > +| bns -- Braille 'n Speak
> > > +| dectlk -- DecTalk Express (old and new, db9 serial only)
> > > +| decext -- DecTalk (old) External
> > > +| dtlk -- DoubleTalk PC
> > > +| keypc -- Keynote Gold PC
> > > +| ltlk -- DoubleTalk LT, LiteTalk, or external Tripletalk (db9 serial only)
> > > +| spkout -- Speak Out
> > > +| txprt -- Transport
> > > +| dummy -- Plain text terminal
> > 
> > Looks like a definition list?
> > 
> > https://docutils.sourceforge.io/docs/user/rst/quickref.html#definition-lists
> 
> If the '|' is replaced by definition-list, I'll have to skip a line to each
> item so the sphinx doesn't concatenate them into a single line. Like this:
> 
> keywords
>   acntsa -- Accent SA
> 
>   acntpc -- Accent PC
> 
>   apollo -- Apollo
>   [...]
> 
> 
> There's a way to do that without these blank lines?

The blank line isn't really a problem.

> > > +Document License
> > > +================
> > > +
> > 
> > Using SPDX might be nice.
> 
> I was just trying to respect the original text as much as possible, but I
> don't mind change it if everybody agrees with it.

SPDX should be fine.

Samuel
