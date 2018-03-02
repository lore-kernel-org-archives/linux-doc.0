Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 601FD7E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 14:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1428775AbeCBOwM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 09:52:12 -0500
Received: from ms.lwn.net ([45.79.88.28]:33020 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1428753AbeCBOwL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Mar 2018 09:52:11 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 443402C7;
        Fri,  2 Mar 2018 14:52:11 +0000 (UTC)
Date:   Fri, 2 Mar 2018 07:52:10 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Jiri Slaby <jslaby@suse.cz>, Jani Nikula <jani.nikula@intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: kernel-doc unbuildable with sphinx 1.7
Message-ID: <20180302075210.338153dd@lwn.net>
In-Reply-To: <s5hvaeefsf6.wl-tiwai@suse.de>
References: <1b24cf1c-941b-9f0d-21e5-b595f64c49b6@suse.cz>
        <20180302073409.2cce15ff@lwn.net>
        <895ece54-4bde-47d8-7c0c-adfdd21fdf23@suse.cz>
        <s5hvaeefsf6.wl-tiwai@suse.de>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 02 Mar 2018 15:44:45 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> Sure, just waited for the feedback from Jon :)

I want to try it with both old and new Sphinx, of course, but will have a
hard time doing it today - on the road all day.  But it looks reasonable
at a first glance; I'll try to get it into -rc4 (and -stable, I guess) if
I can.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
