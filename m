Return-Path: <SRS0=ajHd=6Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0EDC47255
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 23:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B81F520675
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 23:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eRlZl02P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgEKXRX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 May 2020 19:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727788AbgEKXRX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 May 2020 19:17:23 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30C8C061A0C
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:17:22 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t7so4569954plr.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RoaOXEIEPPBvEZydBUoMBwzTtu/js2tJXu+mLWP7YY0=;
        b=eRlZl02Pk3EiQyScZZ5SxULfsmz13q/0q7ln4hE1Jq5RaY0Whqhio++bJ6hzBaoeZr
         UXix70mVrYKi6uWVK9a2ztF+DmKxlKZg1DoRN9bacUxmkkQB98kDUbJiikRqaAvu34P9
         +aTU6Q+SDeH/dVF1g1coPICyd1WC2tTkSzxAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RoaOXEIEPPBvEZydBUoMBwzTtu/js2tJXu+mLWP7YY0=;
        b=q4T/K50xUoI/PGNZ81DC/ukw+OA8lAaDGsm/1+nFBJFOyKZ4kEVSUn2zvD0XDZPVcW
         tnoZuOyyJLIGJrYw8iNGoGUF6uvBySuJvMhya8kiZOVLkRVWybUKNUcZgmlQL1gMyppc
         usNc65NgnfYmP9l+byor6dnTOjvTU1+DFNSx9FuZ7evMezKFoGZJ6vWx/mf1b16GL11/
         A1aZHarVZi7lKZQsXqrX1PEtac8aekbmu/7OD+q2Fw4dWme++mX02sxe/L39sHWLErBL
         61CCOwVH/06lNAXsNFPmKPWyQVB40I2HNfp8aZ44HTK73Ps5JFzKMnY1YCxh11z91KDu
         olzA==
X-Gm-Message-State: AGi0PubFw63rVqpc/eA0xPcF+oKZfaB94Yz98r/IB1QAtJDlQWfxQfPU
        MLtwAqf/2JwHfHiVYZJm5ZooRw==
X-Google-Smtp-Source: APiQypK7v+EhATPggo0LzePS+T/JtgjFK8wgsNSjsQym6ayZpy8dN1q25NLNQpiuVo6HBRLGsAn3Zw==
X-Received: by 2002:a17:90a:d0c3:: with SMTP id y3mr23259663pjw.133.1589239042619;
        Mon, 11 May 2020 16:17:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t14sm8916651pgr.61.2020.05.11.16.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:17:21 -0700 (PDT)
Date:   Mon, 11 May 2020 16:17:20 -0700
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Rob Herring <robh@kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v7 00/18] pstore: mtd: support crash log to block and mtd
 device
Message-ID: <202005111617.94D9B445@keescook>
References: <20200510202436.63222-1-keescook@chromium.org>
 <0586f5cb-991c-3528-dfbf-ee61a39a3955@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0586f5cb-991c-3528-dfbf-ee61a39a3955@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 11, 2020 at 06:54:11PM +0800, WeiXiong Liao wrote:
> On 2020/5/11 AM 4:24, Kees Cook wrote:
> > Hi!
> > 
> > Well, I guess I spoke too soon. :) Here is v7. Hopefully this is
> > it. WeiXiong, can you test this and make sure you're happy with the
> > results?
> 
> I tested it on Allwinner board for all frontends, including panic.
> All of them work well! That's a very good news.

Great! I'll get v8 sent out. :) Thanks!

-- 
Kees Cook
