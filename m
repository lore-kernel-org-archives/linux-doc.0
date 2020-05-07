Return-Path: <SRS0=NPh6=6V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4015C38A24
	for <linux-doc@archiver.kernel.org>; Thu,  7 May 2020 18:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94E812063A
	for <linux-doc@archiver.kernel.org>; Thu,  7 May 2020 18:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mvyOT1Ef"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgEGSEh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 May 2020 14:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728326AbgEGSEg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 May 2020 14:04:36 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308A5C05BD0A
        for <linux-doc@vger.kernel.org>; Thu,  7 May 2020 11:04:35 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r4so3155253pgg.4
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2020 11:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oPdDzYdT7lq792vB2W2IICBi0aPxUsQi5JdgRLaM8DE=;
        b=mvyOT1EfMtTIMiyqWwuFA04fPAW6A3fhyPcQYaNMProcOmtHYJb+m3xgi4wA3jLajJ
         0/+FxWryJeRpZO6qoIDw8HCGDcluMT5vD6KSyflLwL4sWR4NWkx/CTjAMPrjcD9Qo+LL
         yXfNX0vri2Wv4UK70vKw8jXT4Kx/RlaYek7TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oPdDzYdT7lq792vB2W2IICBi0aPxUsQi5JdgRLaM8DE=;
        b=StdfKMru6Md3cW7B3ulxlrXRfnvjanHdhjm1HrlS9KRgDIHIdnMLNrzG68qppqIE9l
         CE5CaDi5m/6scHT9anEf3zbFf7IzINn2kXa1ew++NQTDsjC9ucWqQnSwuKkIzQrXB7L/
         bcbMAoyVO9Byape/fE1VTevi63IiIMNULFa71+EA5JemouP1Id5SRnOcgdLLOxYWyeIl
         MX/9Jt6dYKxQKGFC6j2yz/7GN6WXyxqDskr6GXUoro9PhD1ZgCAfRxxZsMsVjPb2QBtn
         I9gpVmpZV+HQxH+Z9rI8H2WADb++FVUmIKYY2PfDkighjd3vF75oKErkf5iG8c8oAUX6
         PgrA==
X-Gm-Message-State: AGi0PubFzcJ65xNvim4aVTbh40jWy86i9wIiBiN7eN5kFPsuEELVNU00
        rtc7TPDtfySaXk/G3ypcs9/97Q==
X-Google-Smtp-Source: APiQypKvA1tcaT6o5w99vrDSSQJendwU+OBaqZIhGVGhaS/hGCH2qmFU6zieh7bYSXERa2QoSC5VMA==
X-Received: by 2002:a62:b514:: with SMTP id y20mr14582234pfe.49.1588874674588;
        Thu, 07 May 2020 11:04:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q21sm5547240pfg.131.2020.05.07.11.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 11:04:33 -0700 (PDT)
Date:   Thu, 7 May 2020 11:04:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        James Morris <jmorris@namei.org>,
        Sasha Levin <sashal@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/6] pstore/ram: Refactor DT size parsing
Message-ID: <202005071103.EDD880257@keescook>
References: <20200506211523.15077-1-keescook@chromium.org>
 <20200506211523.15077-4-keescook@chromium.org>
 <CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 07, 2020 at 08:57:50AM -0400, Pavel Tatashin wrote:
> On Wed, May 6, 2020 at 5:15 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Refactor device tree size parsing routines to be able to pass a non-zero
> > default value for providing a configurable default for the coming
> > "max_reason" field.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> ramoops_parse_dt_size
> parse_size
> 
> Are used to parse flags, and max-reason properties, so the "size" in
> their names become outdated. How about:
> ramoops_parse_dt_prop
> parse_prop

Yeah, I struggled with that thought too.

> Otherwise it looks good.

Okay, great, I'll find a better name and apply this series. Thanks!

-- 
Kees Cook
