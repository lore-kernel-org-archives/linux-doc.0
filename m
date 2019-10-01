Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 05A2E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 11:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfJALf0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 07:35:26 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35906 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfJALf0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Oct 2019 07:35:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id y22so7760282pfr.3
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2019 04:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I+XJd6Iew6t6YG7JwMsS5kFmVXr+/RnjswL/E0PQln0=;
        b=oOCMJzI0RcNKqMGhzMeeRoG5zMzYm++aiimMplwKkp8W3snSJ55Q0F66uKz4Vmpc0H
         P/55SOBeJBae4br0oZ2jOTiX4TM3QpWn2YkDrlRXHkWSIPZ3iDPHUcvKhjaCI3jiDuCo
         CCa+6Ifbu3EwLRp/LF7gPyoy+A3U/ejnCwM3roFPaV/iPTPvpto6vW3QvX/CZRR0fcaO
         ZRZTQO/PhnGZOufKWw7mt1BYfbGcVHmc3SQWX/Nx4kDL8O/T9QEoWj8/xtFEM+snlgx1
         hIoyiWD9AUFlArKsbPt6/xa54Kans4Hc8zCUNthtuj9+UaZgLnD7RbckuaVwTDTKmg9x
         i7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I+XJd6Iew6t6YG7JwMsS5kFmVXr+/RnjswL/E0PQln0=;
        b=PEUzo1e0rUSx0M2BHimvJ6fPy35uzyCIy5iSkrjJ8IsHCi7qMVu6DCZ3ToauKB7YCX
         /ipXKItTzAzE6YZVmAcZuJG2FGWunBHokAi5F7lMh6GRk7IBCwt4ilUPEOFZ2Vhz7+Cg
         9eAkn1lKjcZERB+k4ulOMNmiosmuB5bb8oXlUd7/zGiK+wsv8ICtGYniwPJqmvPXjOMc
         F9/35IJaWtB/MELJ6QYrdVF7Mf0qbLXuuP9waOZrpb+kJZjMlW5399kWQtOPIIGWe8/U
         oUmSX/Vs6ddAXmnqsRzG5G2F58yW5YLhshotwa8xf/RmX7+9L/s86/MnrbEdtkgbd780
         SmXA==
X-Gm-Message-State: APjAAAWdWLhbdFg+vUVFmewS1iU2O+CeiM/nzQLodLE1e7edhD4tw/9X
        OtmjIy/T5QXoCoLPlsvpijnQHbKfazq+bQ==
X-Google-Smtp-Source: APXvYqyLxsa+aSjXVaBVCa/Q131gjaSvrxcaPn59GrF9dalc+JzYCHDo+hhfwPXAxW5PdIcN0tgvYQ==
X-Received: by 2002:a63:1101:: with SMTP id g1mr29438557pgl.320.1569929725781;
        Tue, 01 Oct 2019 04:35:25 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-165.syd.xi.com.au. [103.85.37.165])
        by smtp.gmail.com with ESMTPSA id f12sm14997298pgo.85.2019.10.01.04.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:35:24 -0700 (PDT)
Date:   Tue, 1 Oct 2019 21:35:19 +1000
From:   Adam Zerella <adam.zerella@gmail.com>
To:     Will Deacon <will@kernel.org>
Cc:     linux-doc@vger.kernel.org, catalin.marinas@arm.com,
        adam.zerella@gmail.com
Subject: Re: [PATCH] docs: arm64: Fix indentation and doc formatting
Message-ID: <20191001113519.GA13683@gmail.com>
References: <20190928125819.GA9604@gmail.com>
 <20190930122823.5ybc25ozel5ltxwf@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20190930122823.5ybc25ozel5ltxwf@willie-the-truck>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 30, 2019 at 01:28:23PM +0100, Will Deacon wrote:
> On Sat, Sep 28, 2019 at 10:58:19PM +1000, Adam Zerella wrote:
> > Sphinx generates the following warnings for the arm64 doc
> > pages:
> > 
> > Documentation/arm64/memory.rst:158: WARNING: Unexpected indentation.
> > Documentation/arm64/memory.rst:162: WARNING: Unexpected indentation.
> > 
> > These indentations warnings can be resolved by utilising code
> > hightlighting instead.
> > 
> > Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> > ---
> >  Documentation/arm64/memory.rst | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/arm64/memory.rst b/Documentation/arm64/memory.rst
> > index b040909e45f8..f7db6a3898c5 100644
> > --- a/Documentation/arm64/memory.rst
> > +++ b/Documentation/arm64/memory.rst
> > @@ -154,11 +154,16 @@ return virtual addresses to userspace from a 48-bit range.
> >  
> >  Software can "opt-in" to receiving VAs from a 52-bit space by
> >  specifying an mmap hint parameter that is larger than 48-bit.
> > -For example:
> > -    maybe_high_address = mmap(~0UL, size, prot, flags,...);
> > +
> > +.. code-block:: c
> > +
> > +   maybe_high_address = mmap(~0UL, size, prot, flags,...);
> 
> Why did you drop the "For example:" prefix?
> 

No reason, I initially thought it would be a bit cleaner but since it is
a code example not an _actual_ snippet it makes more sense to keep it.

I've attached a v2 patch.

> Will

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="PATCH-v2-docs-arm64-Fix-indentation-and-doc-formatti.patch"

Sphinx generates the following warnings for the arm64 doc
pages:

Documentation/arm64/memory.rst:158: WARNING: Unexpected indentation.
Documentation/arm64/memory.rst:162: WARNING: Unexpected indentation.

These indentations warnings can be resolved by utilising code
hightlighting instead.

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---

v2: Adding back the 'For example' text before the code example.
---
 Documentation/arm64/memory.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/arm64/memory.rst b/Documentation/arm64/memory.rst
index b040909e45f8..02e02175e6f5 100644
--- a/Documentation/arm64/memory.rst
+++ b/Documentation/arm64/memory.rst
@@ -154,11 +154,18 @@ return virtual addresses to userspace from a 48-bit range.
 
 Software can "opt-in" to receiving VAs from a 52-bit space by
 specifying an mmap hint parameter that is larger than 48-bit.
+
 For example:
-    maybe_high_address = mmap(~0UL, size, prot, flags,...);
+
+.. code-block:: c
+
+   maybe_high_address = mmap(~0UL, size, prot, flags,...);
 
 It is also possible to build a debug kernel that returns addresses
 from a 52-bit space by enabling the following kernel config options:
+
+.. code-block:: sh
+
    CONFIG_EXPERT=y && CONFIG_ARM64_FORCE_52BIT=y
 
 Note that this option is only intended for debugging applications
-- 
2.21.0


--3V7upXqbjpZ4EhLz--
