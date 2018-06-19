Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 846067D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 23:36:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752703AbeFSXgu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 19:36:50 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:43274 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751955AbeFSXgt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 19:36:49 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.9.92])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id E3720106B;
        Tue, 19 Jun 2018 23:36:48 +0000 (UTC)
Date:   Tue, 19 Jun 2018 16:36:47 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Michal Suchanek <msuchanek@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Aaron Wu <Aaron.Wu@analog.com>,
        Tony Luck <tony.luck@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Steven Rostedt," <rostedt@goodmis.org>,
        Laura Abbott <lauraa@codeaurora.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Baoquan He <bhe@redhat.com>,
        Ilya Matveychikov <matvejchikov@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/5] Kernel parameter parser cleanup/enhancement
Message-Id: <20180619163647.23c8a5d7370258c9e43141c3@linux-foundation.org>
In-Reply-To: <cover.1528215659.git.msuchanek@suse.de>
References: <cover.1528215659.git.msuchanek@suse.de>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  5 Jun 2018 18:43:07 +0200 Michal Suchanek <msuchanek@suse.de> wrote:

> due to work on the fadump_extra_args I looked at the kernel parameter parser
> and found its grammar rather curious.
> 
> It supports double quotes but not any other quoting characters so double quotes
> cannot be quoted. What's more, the quotes can be anywhere in the parameter
> name or value and are interpteted but are removed only from start and end of
> the parameter value.
> 
> These are the patches not specific to fadump which somewhat straighten the
> qouting grammar to make it on par with common shell interpreters.
> 
> Specifically double and single quotes can be used for quoting as well as
> backslashes with the usual shell semantic. All quoting characters are removed
> while the parameters are parsed.

Well.  It's nice.  I guess.  Is there any demand for these
capabilities?  I don't recall ever having seen a complaint - kernel
parameters tend to be pretty simple things.


Also, the break_arg_end() and squash_char() macros make me want to cry.
A macro which changes control flow hidden inside another macro!  Are
they reeeealy necessary?  Can't be done with some C helpers?  Maybe put
inquote, backslash, args, i into a new struct parser_state and pass a
pointer to that around the place?  At the very least, those macros
should be apologetically documented :(


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
