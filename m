Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 77A0C7DF93
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Jul 2018 19:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752567AbeGDTBP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Jul 2018 15:01:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:59896 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752260AbeGDTBP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Jul 2018 15:01:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B85D2307;
        Wed,  4 Jul 2018 19:01:14 +0000 (UTC)
Date:   Wed, 4 Jul 2018 13:01:13 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     peter enderborg <peter.enderborg@sony.com>
Cc:     Tim Bird <tbird20d@gmail.com>, <tim.bird@sony.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: update kernel versions and dates in tables
Message-ID: <20180704130113.668ed146@lwn.net>
In-Reply-To: <4111a2f2-b03b-5f07-929a-680c86b71771@sony.com>
References: <1527114014-26240-1-git-send-email-tim.bird@sony.com>
        <4111a2f2-b03b-5f07-929a-680c86b71771@sony.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 3 Jul 2018 08:10:30 +0200
peter enderborg <peter.enderborg@sony.com> wrote:

> > +	======  ======================  ==============================
> > +	3.16	Ben Hutchings		(very long-term stable kernel)
> > +	4.1	Sasha Levin
> > +	4.4	Greg Kroah-Hartman	(very long-term stable kernel)
> > +	4.9	Greg Kroah-Hartman
> > +	4.14	Greg Kroah-Hartman
> >  	======  ======================  ===========================  
> 
> Is  4.14 not very long-term stable kernel ?

Nobody has, at this time, agreed to maintain 4.14 for any longer than the
usual two-year LTS period.  Such things are always subject to change, of
course, but until such a change happens you can't count on it.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
