Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2DF3A7DF81
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 13:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731852AbeGTOeF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Jul 2018 10:34:05 -0400
Received: from smtp1-3.goneo.de ([85.220.129.32]:53658 "EHLO smtp1-3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731314AbeGTOeF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 20 Jul 2018 10:34:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 74FAB23F779;
        Fri, 20 Jul 2018 15:45:39 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bYFeQf1rBiRV; Fri, 20 Jul 2018 15:45:38 +0200 (CEST)
Received: from ryzen (dyndsl-091-248-138-213.ewe-ip-backbone.de [91.248.138.213])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 5172323F068;
        Fri, 20 Jul 2018 15:45:38 +0200 (CEST)
Message-ID: <d064f468ab9fc60a02242331e0dddc185d6556ba.camel@darmarit.de>
Subject: Re: Sphinx version dependencies?
From:   Markus Heiser <markus.heiser@darmarit.de>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 20 Jul 2018 15:45:37 +0200
In-Reply-To: <20180720131206.GM30706@thunk.org>
References: <20180719181556.GA21435@thunk.org>
         <20180719190400.GB4800@magnolia>
         <44d73cd9926f58976a1269ff3cd3afb845ec84fa.camel@darmarit.de>
         <20180720131206.GM30706@thunk.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am Freitag, den 20.07.2018, 09:12 -0400 schrieb Theodore Y. Ts'o:
> I'm not entirely sure what's the best approach.  Right now I just want
> to understand --- do I have to make ext4.rst work against one, or many
> versions of Sphinx?  And which version(s) of Sphinx do I need to
> concern myself with?  If that turns out to be an onerous burden, I'm
> sure I won't be the only person complaining.  :-)

In that case ...

> But when I did that, Sphinx had heartburn over the ext4.rst file.
> 
>     ./include/linux/spi/spi.h:373: ERROR: Unexpected indentation.
>     /usr/projects/linux/ext4/Documentation/filesystems/ext4/ext4.rst:139: ERROR: Malformed table.
>     Column span alignment problem in table line 5.

... its clear; the table was malformed. A markup error which is not detected
by older versions of docutils (very special case).

In general I recommend to install an up-to-date Sphinx-doc in a virtualenv .. this
is what I do in my projects ... and where I haven't seen those version problems ;)

If we have errors downward we have to handle them. The main thing is the markup
is correct.

  -- Markus --



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
