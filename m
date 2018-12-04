Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D5DBC7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Dec 2018 18:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbeLDSQp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Dec 2018 13:16:45 -0500
Received: from mail.skyhub.de ([5.9.137.197]:42146 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725855AbeLDSQp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Dec 2018 13:16:45 -0500
Received: from zn.tnic (p200300EC2BC7BF005D01DF6409406D0C.dip0.t-ipconnect.de [IPv6:2003:ec:2bc7:bf00:5d01:df64:940:6d0c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 91A401EC0503;
        Tue,  4 Dec 2018 19:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1543947402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=597Ut/nMMpYvAjAkkCleisg9v4nyonsqUnciIJavCAU=;
        b=l7/NU7gJK9vsmwi9rP39X1S6rRpbb9k86b+S6CwO/0ZwASyMnPeF584KPelA5fVINL4l5R
        92shdKZlOvqvlVglZ6AJFlgHl4RD8UhvUHfJyjFIc0UQ4wyzJZmJ1ocbtSxj9TGUQJf3XL
        JKI5ICeJdhH1V+v2e9Z8hGUW828dmBs=
Date:   Tue, 4 Dec 2018 19:16:41 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Subject: Re: [RFC PATCH v6 04/26] x86/fpu/xstate: Introduce XSAVES system
 states
Message-ID: <20181204181641.GA16705@zn.tnic>
References: <20181119214809.6086-1-yu-cheng.yu@intel.com>
 <20181119214809.6086-5-yu-cheng.yu@intel.com>
 <20181204160144.GG11803@zn.tnic>
 <752c38422a6536d8df99b619214f935e4bc882ad.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <752c38422a6536d8df99b619214f935e4bc882ad.camel@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 04, 2018 at 09:08:11AM -0800, Yu-cheng Yu wrote:
> Then we will do this very often.  Why don't we create all three in the
> beginning: xfeatures_mask_all, xfeatures_mask_user, and xfeatures_mask_system?

Because the _all thing is the OR-ed product of the two and then you
don't have to update it when the _user and the _system ones change
because you'll be creating it on the fly each time.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
