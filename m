Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59E5ECAAA1
	for <linux-doc@archiver.kernel.org>; Fri,  9 Sep 2022 21:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiIIVec (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Sep 2022 17:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbiIIVeb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Sep 2022 17:34:31 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C8265CA
        for <linux-doc@vger.kernel.org>; Fri,  9 Sep 2022 14:34:28 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id g4so2771587pgc.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Sep 2022 14:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=32RKuQk21ut6+KAUx33F1+gsJh+klfpdgDVand8UaUY=;
        b=J6IxD7L7SZ4AKh9XtSi8eh8Jx+8cegZUiSYmvebzo/SCXpDkI4leU+G088tW5UxyH2
         TOgZilOPz8NSHWBm5sC2bZBL90HQ/f0MUxSvD0c4d+RiD1OzERYWYJM+BA5FsHysAoL/
         gE5wODosEq+1Aq6kpfxRdvOttRfFVTQbdE2mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=32RKuQk21ut6+KAUx33F1+gsJh+klfpdgDVand8UaUY=;
        b=6bxKWOXLlK6RzfsHYKGEXten4Bzx13drEcR+E+usXNBWL0feIOC8OVc3A4LfIR1nKH
         Y7kqwMH+fJLofrSxlFpuv05/Co+3pbQ6PoM/NQFYJnXohBF8aznDLCb1uYE5OgGkuDOI
         15uhxT14yQaH7IRWhn1pyHtCsBWAmsMIZIWCMCJZ5uf/GZgxE0VsTdcZrG5WGxm5CEVb
         0mKIVTbWwFCisqmPsM76HJuYVx9RXxbYABfWb6d/BfAMepdDU3yCwd0bpGeEbwIK6Jyr
         wCEzDweOmZR1zlUMX/p8DKTuiBfNHVGnSuXYHPDh4A/r0WnrRBYa+rcBAUhxSlqDlym9
         9D/Q==
X-Gm-Message-State: ACgBeo2URBoDH3pwkrS+mNj26FSw/uHkchoSoh4gX0MpAW5PhLTRJqKv
        2ZD+C8YmvoeIWNVneYAg6qiU0w==
X-Google-Smtp-Source: AA6agR4MrzUXBLxlI8FMdz+81a18JRGoiLJstTSYWOLWPZB6bw3JAP0uUwjrMYvdUZm9UO87zhTJgQ==
X-Received: by 2002:a65:60c5:0:b0:434:e149:6745 with SMTP id r5-20020a6560c5000000b00434e1496745mr14253221pgv.30.1662759268324;
        Fri, 09 Sep 2022 14:34:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f196-20020a6238cd000000b00540de61c967sm182116pfa.201.2022.09.09.14.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 14:34:27 -0700 (PDT)
Date:   Fri, 9 Sep 2022 14:34:26 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Florian Mayer <fmayer@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
        Christian Brauner <brauner@kernel.org>,
        Evgenii Stepanov <eugenis@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] Add sicode to /proc/<PID>/stat.
Message-ID: <202209091432.5FEEE461F7@keescook>
References: <20220909180617.374238-1-fmayer@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909180617.374238-1-fmayer@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 09, 2022 at 11:06:17AM -0700, Florian Mayer wrote:
> In order to enable additional debugging features, Android init needs a
> way to distinguish MTE-related SEGVs (with si_code of SEGV_MTEAERR)
> from other SEGVs. This is not possible with current APIs, neither by
> the existing information in /proc/<pid>/stat, nor via waitpid.

Normally no changes are made to "stat" any more. New additions are made
to "status" instead. Could it live there instead?

-Kees

-- 
Kees Cook
