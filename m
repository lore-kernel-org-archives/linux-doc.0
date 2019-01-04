Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5F1BB7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 18:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfADS0j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 13:26:39 -0500
Received: from smtprelay0101.hostedemail.com ([216.40.44.101]:52208 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726323AbfADS0i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 13:26:38 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 4F3A7837F243;
        Fri,  4 Jan 2019 18:26:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: frame10_399904f10ff4d
X-Filterd-Recvd-Size: 1835
Received: from XPS-9350 (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Fri,  4 Jan 2019 18:26:35 +0000 (UTC)
Message-ID: <779c3943867990f0a5b72b8c9daffefdc621bcf4.camel@perches.com>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into
 .dir-locals.el
From:   Joe Perches <joe@perches.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        linux-doc@vger.kernel.org, "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Zhang Le <r0bertz@gentoo.org>, Li Yang <leo@zh-kernel.org>
Date:   Fri, 04 Jan 2019 10:26:34 -0800
In-Reply-To: <20190104094142.3494d703@lwn.net>
References: <20190104003957.82220-1-bvanassche@acm.org>
         <4009470.9o5kGc7Prg@harkonnen> <1546619558.163063.34.camel@acm.org>
         <20190104094142.3494d703@lwn.net>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2019-01-04 at 09:41 -0700, Jonathan Corbet wrote:
> On Fri, 04 Jan 2019 08:32:38 -0800
> Bart Van Assche <bvanassche@acm.org> wrote:
> > > Isn't it better if we collect such configuration files into a dedicated 
> > > directory (where exactly?) instead of putting them in the top-level one? Then, 
> > > the developer has to copy/link the configuration file into the top-level 
> > > directory.
[]
> I think we have to be careful about silently configuring other developers'
> tools.

I agree and as an emacs user I am also not a
proponent of this change.

Longtime emacs users are very sensitive to their
keybindings and styles and having these change
unexpectedly can be unsettling.

