Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DB7297D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Mar 2019 17:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfCKRaR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Mar 2019 13:30:17 -0400
Received: from ms.lwn.net ([45.79.88.28]:56442 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727019AbfCKRaR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Mar 2019 13:30:17 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CEA627DF;
        Mon, 11 Mar 2019 17:30:16 +0000 (UTC)
Date:   Mon, 11 Mar 2019 11:30:15 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
        "Tobin C. Harding" <me@tobin.cc>, linux-doc@vger.kernel.org
Subject: Re: undefined label
Message-ID: <20190311113015.166262c9@lwn.net>
In-Reply-To: <878sxp7e6s.fsf@intel.com>
References: <20190307091734.GB9152@eros.localdomain>
        <c24a75bf-5bd5-aca8-7764-e05a03495e01@darmarit.de>
        <20190307203041.GC21937@eros.localdomain>
        <f0891518-ae90-904b-1001-477c122f1abb@darmarit.de>
        <878sxp7e6s.fsf@intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 08 Mar 2019 14:17:47 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> >  >> To close such cross-books links we can use intersphinx [1] and map to e.g.
> >  >>
> >  >>    intersphinx_mapping = {
> >  >>        'kernel': ('https://www.kernel.org/doc/html/latest/', None)}  
> >
> > This requires online access while building the output.  Anyway, as soon as
> > I have some time to spare I will send a RFC with more explanation about
> > (you will receive it in CC).  
> 
> Please remember to call out the online access in the patch series. Such
> a requirement is going to draw a lot of opposition.

Indeed, I think that would a difficult requirement to add.  It may well be
better, in the end, to simply document this "feature" and live with it.

jon
