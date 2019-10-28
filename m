Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D63ED7D910
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 19:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbfJ1THW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 15:07:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33079 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727664AbfJ1THW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Oct 2019 15:07:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id c184so7550808pfb.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2019 12:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OV+K1WsQR/k0RbneAkNVn0UoBxhclyXdw/LmrfyqNVg=;
        b=TNVEMFaaA0R+LnRCgPg23yFU22kUkQRisotO/RjjvFp6LAUOfFfJKx9e4+9GsH+p+j
         w8rj7XM2BSNr4RdNQcCaEZbEdsJjVvJ7gwsQSCQogcn1x+fNyK8qQ9+W/0c2MlguDwfP
         sdVqCfww08s0LNlFVtP5JrKhBG9sQOoFJrVfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OV+K1WsQR/k0RbneAkNVn0UoBxhclyXdw/LmrfyqNVg=;
        b=dDHiwdLG4natqrV0D9lUmAG0auDCROgtvy9u4jkd/pqaW9QxtJUhPj/K7CpNGqcOY+
         Pj4l6UkXmvEEPxEF5cYL9/993VSfjROlc378cwc+X5FIjSGXc2TzfSRdRNbaf1C+HJkd
         hfDShHy9Rt/Ffy2PdGh8xU+D/yYNOezUjM+Drtgx3HBwFmjCyHgdEVYeMqGaOPf0zUmS
         tMaZk4oZwnaLzywG3j/5hjeonGEVIQ169Xhi+adPcfcde3XBDbv78yFKHMxkzxyl1egJ
         bqtxg7GOdUl/HRHuGaQwS2vzkXZKJ8gsQhmaOTsokGszrMd9lUFMfUGsr0XHA/uIC2jr
         qndw==
X-Gm-Message-State: APjAAAXGlJlf4AVRkTrvTCa3ho2W/j7SYSnNaaQdyKDgujSkTY7Z42cd
        Vcvp4n+LGVw7zVu7qB+W2+hoBg==
X-Google-Smtp-Source: APXvYqwfXK7O/8cL2ylNntyEkvxj3W07GfYEnnJtDRSngJEeRns56oEFHBETwzv1QeVnZsrM6/WGFA==
X-Received: by 2002:a05:6a00:10:: with SMTP id h16mr12038342pfk.27.1572289640151;
        Mon, 28 Oct 2019 12:07:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 6sm11998482pfz.156.2019.10.28.12.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 12:07:19 -0700 (PDT)
Date:   Mon, 28 Oct 2019 12:07:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx parallel build errors
Message-ID: <201910281205.DD5B74F@keescook>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <201910091929.0C058BB@keescook>
 <20191010124832.23bc4362@lwn.net>
 <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
 <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
 <20191027121729.59c1d539@lwn.net>
 <c0be66ed-eb97-bc19-5bdb-0ef8903c3709@infradead.org>
 <20191027160507.6d7be266@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191027160507.6d7be266@coco.lan>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Oct 27, 2019 at 04:05:07PM -0300, Mauro Carvalho Chehab wrote:
> Em Sun, 27 Oct 2019 11:30:22 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
> > On 10/27/19 11:17 AM, Jonathan Corbet wrote:
> > > On Sun, 27 Oct 2019 11:11:57 -0700
> > > Randy Dunlap <rdunlap@infradead.org> wrote:
> > >   
> > >>> Yes, I see oom-kills when building docs for 5.4-rc2.
> > >>> But only after I ran 'gimp *.jpg' for 22 photos.
> > >>>
> > >>> I can see anywhere from 1 to 4 sphinx-build processes running.    
> > >>
> > >> I continue to have oom-kills when building docs.
> 
> My 2 cents here.
> 
> I would keep the default to use more CPUs, as nowadays I suspect that
> most devs have a way more than 8GB installed. The worse machine I use
> here to build Kernel is a Gen-3 i5 that has has 16GB (and it is a 
> personal laptop I bought 5 years ago).
> 
> Yet, I agree that doc build should be saner on low-cap machines.
> 
> Ideally, the fix should be, IMHO, at sphinx-build: -jauto should
> detect OOM possible conditions and reduce the number of used CPUs
> it the max available memory is too low.

How can we determine that dynamically, though? e.g. how do we determine
how much is needed per thread in a way that will move with the future
needs of Sphinx, etc?

> As there's now a script at Kernel, maybe the script could be modified 
> to detect if the max available memory is too low, passing -j1 if,
> let's say, the machine has less than (let's say) 16 GB RAM.

Randy, are you able to just use -j2 or similar with your builds to avoid
this?

-- 
Kees Cook
