Return-Path: <SRS0=Sf9F=66=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EC4C433E0
	for <linux-doc@archiver.kernel.org>; Sat, 16 May 2020 02:43:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDDCE2076A
	for <linux-doc@archiver.kernel.org>; Sat, 16 May 2020 02:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KMWk+NQS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgEPCna (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 May 2020 22:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726247AbgEPCn3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 May 2020 22:43:29 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F2CC061A0C
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 19:43:29 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so1833143pjb.3
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 19:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cglgAeogEsYtyEtsWWA7EKVu4oJhwNRDGYnJtkMLvSQ=;
        b=KMWk+NQSpb/1CpN3DQS0NjXCMJ3eK4oWJD3mIbC84O3JQ9n96BQD6KOyhnPvS5ni1S
         +LW+Dgeew7NVywcQinZhWtU6ACEpt6oc6Fjk7HDeg16n1/ogtorphBRVCGPnaJ1vZtlw
         TbKbeHURR9Q1QRxtyEOEjpW0BGcjNbmBJhkKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cglgAeogEsYtyEtsWWA7EKVu4oJhwNRDGYnJtkMLvSQ=;
        b=Tq9FAW71opBLgyn2wqwDp3P1NijD0+jZvc9E9ZQS54sapwLnZWbmdSmRAj4MP82iDt
         Cu9rYAEBBIZx1u2JoiZeZyPSEHRXAYuLklikJ3DLnBCFqBhdJ9cg+qN3u7CbW9h9SqYh
         9ocHfuGI9yfkhwc5w04LRzyUghnFtjMUDEh+XTzt2bPcsP+ITMkjtS+WUlChweXNjB4b
         hOlMqzaf/BNOvZea2eDps5r4i5c3ZbA6RmQrzQyFks8f/a+Q/seYsSgN7xn7USlQ4StE
         9VRkQsJPWcMiC8LdNas/AnqysEo+YSZJMdLXGAdQWqQVJqez8ICDVcCiIZnfXNeRPwcE
         UC8g==
X-Gm-Message-State: AOAM531sSdj6+c44kmAIn8jq7rkLgKrRw75BITmuGHM2+wXi3v2uCM/O
        fzpgAdk3NJTvo9VmeRcD38DPyQ==
X-Google-Smtp-Source: ABdhPJw04lvscjiz+8sKkgyXLJk/uIS3zfg+tcq/GyQDDZrE3MBeGrWUumnrOWcU9/ZqO+7Dv5MOoQ==
X-Received: by 2002:a17:90a:30ef:: with SMTP id h102mr6727633pjb.110.1589597008980;
        Fri, 15 May 2020 19:43:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a30sm2731879pgm.44.2020.05.15.19.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 19:43:27 -0700 (PDT)
Date:   Fri, 15 May 2020 19:43:26 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Tyler Hicks <tyhicks@linux.microsoft.com>
Cc:     Pavel Tatashin <pasha.tatashin@soleen.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>, jmorris@namei.org,
        sashal@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/6] pstore/ram: Introduce max_reason and convert
 dump_oops
Message-ID: <202005151942.830CDF8E@keescook>
References: <20200506211523.15077-1-keescook@chromium.org>
 <20200506211523.15077-5-keescook@chromium.org>
 <20200512233504.GA118720@sequoia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512233504.GA118720@sequoia>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 12, 2020 at 06:35:04PM -0500, Tyler Hicks wrote:
> On 2020-05-06 14:15:21, Kees Cook wrote:
> > @@ -954,7 +965,11 @@ static void __init ramoops_register_dummy(void)
> >  	pdata.console_size = ramoops_console_size;
> >  	pdata.ftrace_size = ramoops_ftrace_size;
> >  	pdata.pmsg_size = ramoops_pmsg_size;
> > -	pdata.dump_oops = dump_oops;
> > +	/* Parse deprecated module param "dump_oops" into "max_reason". */
> > +	if (ramoops_dump_oops != -1)
> > +		pdata.max_reason = ramoops_dump_oops ? KMSG_DUMP_OOPS
> > +						     : KMSG_DUMP_PANIC;
> > +	pdata.max_reason = ramoops_max_reason;
> 
> This isn't quite right. We're conditionally assigning pdata.max_reason
> and then immediately re-assigning it.
> 
> IIUC, we're just missing an else block and it should look like this:
> 
> 	/* Parse deprecated module param "dump_oops" into "max_reason". */
> 	if (ramoops_dump_oops != -1)
> 		pdata.max_reason = ramoops_dump_oops ? KMSG_DUMP_OOPS
> 						     : KMSG_DUMP_PANIC;
> 	else
> 		pdata.max_reason = ramoops_max_reason;

Whoops, I forgot to CC you Tyler! This should be fixed now here:
https://lore.kernel.org/lkml/20200515184434.8470-6-keescook@chromium.org/

-- 
Kees Cook
