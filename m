Return-Path: <SRS0=R1OV=7E=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A1CC433DF
	for <linux-doc@archiver.kernel.org>; Fri, 22 May 2020 17:34:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 142E5206C3
	for <linux-doc@archiver.kernel.org>; Fri, 22 May 2020 17:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mrLZoriV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730700AbgEVReU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 May 2020 13:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730636AbgEVReU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 May 2020 13:34:20 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22498C05BD43
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2020 10:34:20 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id e11so4529688pfn.3
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2020 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vpvOtYEoQPYr60AvQ4lbOXVaOz+PqOzSuTIlFxZC7hs=;
        b=mrLZoriVWpSjIlqWcoKRs7Vf38HcNAIbk1aA1aj5M9bm3Kplf4mG3Nlg9o2f8mXie9
         Fzh3k6kQqtcs2C2Z92Xjo5uCe7mXGGZJ7OhLbKqmeBdBJLXUSvy785BjEvi9KRPXlUyV
         Jt9fS28KExNgHI2bGC8ZrNS0cBGoCgm/quS1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vpvOtYEoQPYr60AvQ4lbOXVaOz+PqOzSuTIlFxZC7hs=;
        b=MwN9ySoEZveDZqBE4M26JyS0sMdQHvcyxdhfXymLnMhcYrYN2atK7+FHuyfnNx6ZF+
         zZWZi7K+DPw28UZq5T/Q2ose2JpUvzFMXFhOa7XqlMvUqps5ZL2IiPLXeBr797IDq1yS
         CaZcM1h4J80CoTURb6ZQWuhWb2p5kWVrYB1bBS6LRGEu+qTBAOCDI4pjI5XpXtPG8uu0
         BvRPilQgiGwO1o36GUmXb5pv/1kd4YZnNwWZbt60/wdZGsq9LLgEAixUCIp6YeLSu9s9
         CsXUgsoTh/6qEVL9axekEdlGbrdX+PKj+yFBaZn5H6rnWOolVstpCK8e1b7tys0clDSd
         DXSw==
X-Gm-Message-State: AOAM5304tVGfU3uSqxT7okgzxf5wvQLzxWdYA+xBe4sZFFxd5jBUL5wJ
        bZFlgCvkgEv0bCHgDd9T/E2Dhg==
X-Google-Smtp-Source: ABdhPJw3mEZJxGUEwT+YtZuRAtkaUC2r/G5yxPoHLWK7Hcz3C0nz+4i4d6ISwNAJSlDeH54wMalB+Q==
X-Received: by 2002:a63:b64e:: with SMTP id v14mr15087127pgt.164.1590168859526;
        Fri, 22 May 2020 10:34:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q4sm7769112pfu.42.2020.05.22.10.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 10:34:18 -0700 (PDT)
Date:   Fri, 22 May 2020 10:34:17 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Pavel Tatashin <pasha.tatashin@soleen.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 2/6] printk: honor the max_reason field in kmsg_dumper
Message-ID: <202005221032.859452DFA0@keescook>
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-3-keescook@chromium.org>
 <20200522165120.GL3464@linux-b0ei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522165120.GL3464@linux-b0ei>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 22, 2020 at 06:51:20PM +0200, Petr Mladek wrote:
> On Fri 2020-05-15 11:44:30, Kees Cook wrote:
> > From: Pavel Tatashin <pasha.tatashin@soleen.com>
> > 
> > kmsg_dump() allows to dump kmesg buffer for various system events: oops,
> > panic, reboot, etc. It provides an interface to register a callback call
> > for clients, and in that callback interface there is a field "max_reason"
> > which gets ignored unless always_kmsg_dump is passed as kernel parameter.
> 
> Strictly speaking, this is not fully true. "max_reason" field is not
> ignored when set to KMSG_DUMP_PANIC even when always_kmsg_dump was not set.
> 
> It should be something like:
> 
> "which gets ignored for reason higher than KMSG_DUMP_OOPS unless
> always_kmsg_dump is passed as kernel parameter".
> 
> Heh, I wonder if anyone will be able to parse this ;-)

Ah yeah, good point. I've reworded things like this:


    kmsg_dump() allows to dump kmesg buffer for various system events: oops,
    panic, reboot, etc. It provides an interface to register a callback
    call for clients, and in that callback interface there is a field
    "max_reason", but it was getting ignored when set to any "reason"
    higher than KMSG_DUMP_OOPS unless "always_kmsg_dump" was passed as
    kernel parameter.

    Allow clients to actually control their "max_reason", and keep the
    current behavior when "max_reason" is not set.

> Otherwise, it looks good to me. With the updated commit message:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks!

-- 
Kees Cook
