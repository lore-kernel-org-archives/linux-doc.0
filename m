Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 378647E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Mar 2018 20:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751231AbeCIUqD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Mar 2018 15:46:03 -0500
Received: from www.llwyncelyn.cymru ([82.70.14.225]:58070 "EHLO fuzix.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751219AbeCIUqC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Mar 2018 15:46:02 -0500
Received: from alans-desktop (82-70-14-226.dsl.in-addr.zen.co.uk [82.70.14.226])
        by fuzix.org (8.15.2/8.15.2) with ESMTP id w29KjRj5015926;
        Fri, 9 Mar 2018 20:45:27 GMT
Date:   Fri, 9 Mar 2018 20:45:26 +0000
From:   Alan Cox <gnomes@lxorguk.ukuu.org.uk>
To:     Dave Hansen <dave.hansen@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, dan.j.williams@intel.com,
        tglx@linutronix.de, gregkh@linuxfoundation.org,
        torvalds@linux-foundation.org, aarcange@redhat.com,
        luto@kernel.org, keescook@google.com, tim.c.chen@linux.intel.com,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, corbet@lwn.net, mark.rutland@arm.com
Subject: Re: [PATCH] [v2] docs: clarify security-bugs disclosure policy
Message-ID: <20180309204526.56301f43@alans-desktop>
In-Reply-To: <20180307214624.D4361772@viggo.jf.intel.com>
References: <20180307214624.D4361772@viggo.jf.intel.com>
Organization: Intel Corporation
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 07 Mar 2018 13:46:24 -0800
Dave Hansen <dave.hansen@linux.intel.com> wrote:

> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> I think we need to soften the language a bit.  It might scare folks
> off, especially the:
> 
> 	 We prefer to fully disclose the bug as soon as possible.
> 
> which is not really the case.  Linus says:
> 
> 	It's not full disclosure, it's not coordinated disclosure,
> 	and it's not "no disclosure".  It's more like just "timely
> 	open fixes".
> 
> I changed a bit of the wording in here, but mostly to remove the word
> "disclosure" since it seems to mean very specific things to people
> that we do not mean here.
> 

If you want to be taken seriously then I think minimum you also need to
- Give a GPG key for messages to the list
- State what security is in place (encryption etc) to protect the list
  itself

There are probably a lot more things people would ask but given the
policy now clear that it's basically just an 'early tip off'/'make sure
Linus doesn't miss this' list for very short notification periods doesn't
matter so much.

Alan


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
