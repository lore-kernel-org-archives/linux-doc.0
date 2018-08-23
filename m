Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 615E17D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 23 Aug 2018 22:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbeHXBcL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 23 Aug 2018 21:32:11 -0400
Received: from smtprelay0162.hostedemail.com ([216.40.44.162]:47182 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727125AbeHXBcK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Aug 2018 21:32:10 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 60CD4182CF66A;
        Thu, 23 Aug 2018 22:00:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: edge11_5b26f969f2642
X-Filterd-Recvd-Size: 1950
Received: from XPS-9350.home (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf12.hostedemail.com (Postfix) with ESMTPA;
        Thu, 23 Aug 2018 22:00:26 +0000 (UTC)
Message-ID: <1996329d875e1ab5b9cd69db187b7037ad3a0d8d.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum required gcc version to 4.6
From:   Joe Perches <joe@perches.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Mike Galbraith <efault@gmx.de>,
        Guenter Roeck <linux@roeck-us.net>, riel@surriel.com,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 23 Aug 2018 15:00:25 -0700
In-Reply-To: <CAMuHMdXPFgp5sLR5-UExEvxNbKSR5H--dk7KMit_XFSFN+1uHw@mail.gmail.com>
References: <da5620dc7a2b9d33f2a0dd7f4dc3afdab5a66f26.1534795606.git.joe@perches.com>
         <CAMuHMdXPFgp5sLR5-UExEvxNbKSR5H--dk7KMit_XFSFN+1uHw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2018-08-23 at 23:52 +0200, Geert Uytterhoeven wrote:
> Hi Joe,

Hi Geert.

> Does gcc 8.x gives again the same warnings as my venerable old gcc 4.1.2,
> that no one else seems to see? Or will the real bugs I detect this way stay
> unfixed? Polyculture is a good thing, also in compilers.

I'm not sure I understand what you mean.
Patches that fix defects and patches that fix warnings
both generally get applied.

> Reverted locally (incl. the follow-up), applied Andrew's fix, detected new
> warnings in v4.18+, and sent patches where it makes sense...

Thanks for that.

cheers, Joe
