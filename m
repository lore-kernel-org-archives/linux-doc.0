Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 142FE7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Sep 2019 21:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393053AbfIXVuW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Sep 2019 17:50:22 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46867 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392159AbfIXVuW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Sep 2019 17:50:22 -0400
Received: by mail-pf1-f194.google.com with SMTP id q5so2094191pfg.13
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2019 14:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9dYRzKO1g1R4/IX0G1CbX+gjWofgYMvYTRiyo8NBhnk=;
        b=Nyog3bUmtz7c05l4kKSdtxqM9CIRqGmFQA/+AASIxNDFCjsYjiqoJV6eA/M+6MaTMh
         Z+jR23roZ/3DU7nA7X6yUxgUjJtOmw5n19LN6ACS8+oSnZvUdcR02tvXlPFV5P327hyA
         FEM40rreewkNPXqqD2loRpTkZ/sN/efpk6Ji4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9dYRzKO1g1R4/IX0G1CbX+gjWofgYMvYTRiyo8NBhnk=;
        b=Cl8RoTN6hEf22YHi6DITyI+2a8TwPuKK35rwLOzaYrn2odGRuuLCJxwlaMr8ll6Jl7
         cWHY8QOnY9nX9YChSN1dlC6WnQjk7bw1avAaIr6E/BW+hOfU94Mj5CXLLmw4L61CWgZN
         3I4UIopV9nkA8APjEiqbSt9ooLgUnlTkdbjgCtYo1IDKcmTCurP0L3DxO/H9JEe2nnKW
         0QrB+aJYrU0G3hohjqpzmgTlO2exAWAk1hR0SmGIWatA9/wuq1OvYYOnUqvUYliHopNT
         KtSy0fwuUsGltyoC+MIkP9C0+yfq9vnaG6AN3G90u7TMTJvCixq/Vztv1xYr4FTiXuA6
         HHcw==
X-Gm-Message-State: APjAAAVOH1p+KCwWABfZidBhG5zlE26WSxXk3BTpEEAVP+Za99F7/oEF
        tCXhbMxHnKduITsklJbGU8/KYw==
X-Google-Smtp-Source: APXvYqy6AEYKCeT0iEFEsUB13HusI2JDuDfNQE3YlXYE2ZS7xp/2jmaVJuCoKL7ooatAmXFYJfZW9w==
X-Received: by 2002:a65:66c4:: with SMTP id c4mr5230420pgw.246.1569361821761;
        Tue, 24 Sep 2019 14:50:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t14sm2600111pgv.84.2019.09.24.14.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 14:50:20 -0700 (PDT)
Date:   Tue, 24 Sep 2019 14:50:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] docs: Programmatically render MAINTAINERS into ReST
Message-ID: <201909241446.3284D27@keescook>
References: <201909231534.E8BE691@keescook>
 <20190924070819.0a7b6658@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190924070819.0a7b6658@coco.lan>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 24, 2019 at 07:08:19AM -0300, Mauro Carvalho Chehab wrote:
> It probably makes sense to change some things there, as, right now, it 
> is considering multiple lines as continuation. So, for example, if
> it has multiple M: entries, it will produce this at MAINTAINERS.rst
> output:
> 
> 
> 	:Mail:
> 		Juergen Gross <jgross@suse.com>
> 		Thomas Hellstrom <thellstrom@vmware.com>
> 		"VMware, Inc." <pv-drivers@vmware.com>
> 
> With would be displayed as:
> 
> 	Mail
> 	    Juergen Gross <jgross@suse.com> Thomas Hellstrom <thellstrom@vmware.com> “VMware, Inc.” <pv-drivers@vmware.com>
> 
> It would probably be better to output it as:
> 
> 	:Mail:
> 		- Juergen Gross <jgross@suse.com>
> 		- Thomas Hellstrom <thellstrom@vmware.com>
> 		- "VMware, Inc." <pv-drivers@vmware.com>
> 
> or:
> 	:Mail:
> 		Juergen Gross <jgross@suse.com>
> 
> 		Thomas Hellstrom <thellstrom@vmware.com>
> 
> 		"VMware, Inc." <pv-drivers@vmware.com>
> 
> or, eventually:
> 
> 	:Mail:
> 		Juergen Gross <jgross@suse.com>,
> 		Thomas Hellstrom <thellstrom@vmware.com>,
> 		"VMware, Inc." <pv-drivers@vmware.com>
> 
> (Using commas is probably a bad idea, as DT file names may have a
> comma in the middle)

Doing explicit lists here made the output, I think, way too long and
hard to read. Adding commas for email fields seems like the right
solution here.

> No need to use "python3" here, as the script has a shebang markup. Just
> ensure that it has 755 permission, and call it directly.

BTW, I found where I thought python3 was required:
sphinx/kernel_include.py's shebang is "#!/usr/bin/env python3"

> > +/* Keep fields from being strangely far apart due to inheirited table CSS. */
> > +.rst-content table.field-list th.field-name {
> > +    padding-top: 1px;
> > +    padding-bottom: 1px;
> > +}
> > +.rst-content table.field-list td.field-body {
> > +    padding-top: 1px;
> > +    padding-bottom: 1px;
> > +}
> > +
> >  @media screen {
> >  
> >      /* content column
> 
> I would place this on a separate patch, as this is a layout change that
> may affect other files.

Noted, yes.

> Btw, what does this change?

This gets rid of what looks like an extra blank line after every field
line. I checked other places where fields are used and they suffer from
a similar problem. I'll split this out and call attention to the
existing users.

-- 
Kees Cook
