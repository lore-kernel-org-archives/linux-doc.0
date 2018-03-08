Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B2DCF7E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 17:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933700AbeCHR2r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 12:28:47 -0500
Received: from ms.lwn.net ([45.79.88.28]:44524 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932091AbeCHR2q (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Mar 2018 12:28:46 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 537872C7;
        Thu,  8 Mar 2018 17:28:45 +0000 (UTC)
Date:   Thu, 8 Mar 2018 10:28:44 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Dave Hansen <dave.hansen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andrew Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@google.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] [v2] docs: clarify security-bugs disclosure policy
Message-ID: <20180308102844.6c7f7e06@lwn.net>
In-Reply-To: <CA+55aFzii9Sd3MaLz=FPf1Z_aAsZU16_+q-pvkSGHhU4-7QS9Q@mail.gmail.com>
References: <20180307214624.D4361772@viggo.jf.intel.com>
        <CA+55aFzii9Sd3MaLz=FPf1Z_aAsZU16_+q-pvkSGHhU4-7QS9Q@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 7 Mar 2018 13:53:06 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> I'm guessing this will go through Jon?

Sounds like a fine guess to me; will apply shortly.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
