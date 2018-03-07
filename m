Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0D4C67E686
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 21:53:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754753AbeCGVxI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 16:53:08 -0500
Received: from mail-io0-f171.google.com ([209.85.223.171]:37005 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754039AbeCGVxH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Mar 2018 16:53:07 -0500
Received: by mail-io0-f171.google.com with SMTP id d71so4745142iog.4;
        Wed, 07 Mar 2018 13:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=llujYmQ2KWvfZDiWHIFL+mX74UfO9k+yC+yslKEUSFY=;
        b=oelUtQNeVqd4uPq/XEoybTLsR7SPSdtiuZmu2QstRbxHwDar4e8+WEzT3f9bOk4MxB
         roZaUkaMijb2J+kM1dFfBpEkv4dju7eeu1BtPGTWBgW/yW67d+EnBlTFoaKWEHPBnbbF
         M8+xdeOPl9Nz9PhfbmiGo2fNXpV+Fe7wYr4vy5cJ1KouBKsKSmENBHzzwTBJzDGO7SqA
         s0BLWwVz2iCySgaxDOzitSPFGMTNJ007xQ4MFmQf0oYn4ldc6vy3xbLcgBNHUNtqlxft
         uJpbKYgBu2Vo5EDytsbIUwCQ393QUJyp82LOzp5pkgGXgShaJb2KHz9Olrm2CmslnGOZ
         kiWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=llujYmQ2KWvfZDiWHIFL+mX74UfO9k+yC+yslKEUSFY=;
        b=hHjtjo1vxMTnn+9zUqJwWM6/e9/KcGzOCnBtPYQoyQBnXFLdjZfBHRe40+bKWCsY+E
         IHGGRUjePYTFQiqxdvLBSGruXCmV1YMYz0L2yVSYljVr54GFgNfYxwNtGamS9FvG78yU
         a/VggWaC/D6F1qlnvnNEmvK1e8AuHmkgIX6Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=llujYmQ2KWvfZDiWHIFL+mX74UfO9k+yC+yslKEUSFY=;
        b=pd4crTNHek3gn3zKCikNZ4g+4bux1IBWE7MYtCV85lahNXg3skaZ5r5/2pdOATgqwf
         3wu69EdPuH0M9DlXH8bUnjuQjTNKF92pYD6cW4dgpLR0dYWkslZvREZoLxADUHAKX2Jr
         bffwsLXjj2ojgFF9kqF/h/zFUk4QevyCe2nqDPgdtLjiJ99WoHEhhwjiIUzjk8iQBve1
         5V22X2B7i6ri1qStoYA/iq7Avm3zfx4y8lbrgAnDDbEqpt1SRBVAZC/MkTygpY+TaVDh
         Xm72iej2H3aZ8mArGjeV10markuvqySAVsla28FgJ6XEmT6bJ9MeIw5SOLG1OZ+S4W2d
         Qprw==
X-Gm-Message-State: APf1xPBxsYqlbv6sMc7yPCkDmbFJJu7oqCHcqYStZ9Yt2orlAFe5fBLb
        i00ztIXbwmeHuMAxykqqGFju0I/mpOJdxVd/dhdTSA==
X-Google-Smtp-Source: AG47ELt3i92X+FmsdkxaZM67HgK16RbFJhlyHvV8P7f3owV1RpYaUC34Tw0YE7t93VmJ2qw1gwKDyLpK2/1VjVx2j+k=
X-Received: by 10.107.22.1 with SMTP id 1mr28963191iow.238.1520459586614; Wed,
 07 Mar 2018 13:53:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.135.221 with HTTP; Wed, 7 Mar 2018 13:53:06 -0800 (PST)
In-Reply-To: <20180307214624.D4361772@viggo.jf.intel.com>
References: <20180307214624.D4361772@viggo.jf.intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Mar 2018 13:53:06 -0800
X-Google-Sender-Auth: DkcwR7WGEq3R0VaIUnNQB2lzfwE
Message-ID: <CA+55aFzii9Sd3MaLz=FPf1Z_aAsZU16_+q-pvkSGHhU4-7QS9Q@mail.gmail.com>
Subject: Re: [PATCH] [v2] docs: clarify security-bugs disclosure policy
To:     Dave Hansen <dave.hansen@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

That patch looks fine to me, avoiding any terms that might be
misunderstood, and being pretty straightforward.

I'm guessing this will go through Jon?

               Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
