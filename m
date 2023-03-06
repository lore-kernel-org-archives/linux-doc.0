Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51957C6FA99
	for <linux-doc@archiver.kernel.org>; Mon,  6 Mar 2023 14:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjCFO0r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjCFO0q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Mar 2023 09:26:46 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA747282
        for <linux-doc@vger.kernel.org>; Mon,  6 Mar 2023 06:26:11 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-53916ab0c6bso186632257b3.7
        for <linux-doc@vger.kernel.org>; Mon, 06 Mar 2023 06:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jp-hosting.net; s=google; t=1678112699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vUK9dBxwCtJChugErkaN3rhrvTZzDikjig8o6BmvIW4=;
        b=dCTdhWwE7wZys+dU8bjZbFP+D+JCq2hGURMIO/RrLrTSlTGb3O3etF+80n505aWBhi
         J5OdRs64Iw/ofmOEcNM+eUTAPfEIGZVTRLugR3Wp7bfnNxxOIRGwtOaq2dP+bE10kNmy
         xHjNkWUybkJa5dX/A3cDf1BDzfKCW63W6aabRWK2BP3cJG6U8JTFIYVA8pwuR15/Tpai
         5GPAX2A+Hs8P2MW8aLAMW8MMWDKU2cq1fm1S45lYM8LoyYrGpWzPqOmMtVwy86F/dBiR
         W+dMlMPq8+rusdgzACYFHlJm2D+wT4pibabooW3BvEbV1oqZzgZxzqSBTR9aVgkE3lHx
         eSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUK9dBxwCtJChugErkaN3rhrvTZzDikjig8o6BmvIW4=;
        b=hFR5zCW3s7AyRAeVD2dpdxVBaRLCbd140Jp5DoA/HIxlptPHx/7L+p+zRGvHuhnTmd
         aMnTQvVPrbqsIutc7NkFl4WlY5KJeo3M+U9sDZDoil/v/CkEbf12ctzKCka5c5G96LNM
         LzN0CayeuTYzONnXlDlsbk6HRw0rcnXyMwtbA7CucSNIfnjYtbOXMJcqZmF0a5Vh1atC
         9HlQXNSPZXgF5UuNXHH0Vels5T2f7hPxknpOWLUNJRRjLKj18rLb7QARyTLSbORnefHN
         xPLldmgCNIVcJM/rKOvLlRqrvYW9/3q+54a2yJ5ORLYy0wzjxFsilQ7wBIsSAR192YWV
         9rcw==
X-Gm-Message-State: AO0yUKX1dqCtWQT5/1caanmmCsLRFpLtx9pCBgG1wc0m77jUbbMhJGjv
        +JehIYghgKTFCkkMlEWvreRTHakga1HTE+WvlLgjYA==
X-Google-Smtp-Source: AK7set9yAZCmOPTvAjLTzJqkmaTjtbo2o10dCAPKPnkwQQk4VehVQblEdYfA4IJj16WnQKMN1EKyXqyqbXitfXolMsY=
X-Received: by 2002:a81:af4e:0:b0:521:db3f:9e27 with SMTP id
 x14-20020a81af4e000000b00521db3f9e27mr6992638ywj.2.1678112698544; Mon, 06 Mar
 2023 06:24:58 -0800 (PST)
MIME-Version: 1.0
References: <CALDQ5Ny1mbcUSk8pDL6HEq0Cgqze1tidyOeAgVxc5tyZNb+P_g@mail.gmail.com>
 <ac6d56df-0c1f-ca7c-5d2b-e6ae770518b5@infradead.org>
In-Reply-To: <ac6d56df-0c1f-ca7c-5d2b-e6ae770518b5@infradead.org>
From:   James Addison <jay@jp-hosting.net>
Date:   Mon, 6 Mar 2023 14:24:45 +0000
Message-ID: <CALDQ5NwGTi3q9B=ezat5H_eLtr1cDuR9j13UtB1-dCK-fxOOPQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] Documentation: update kernel parameter limit notes
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 5 Mar 2023 at 23:17, Randy Dunlap <rdunlap@infradead.org> wrote:
> I looked at this again.  It's not a limit on the number of kernel command line
> parameters AFAICT.  It's a limit on the number of parameters that are passed to
> the init process.  Basically any parameter that is not recognized as a kernel
> parameter OR anything that is after "--" on the kernel command line is put into
> an array of limited size for passing to the init process.

Ah: that completely explains it, thank you; my testing was inadequete.

I had been testing this using fairly-arbitrary (and therefore unrecognized)
parameter names, so it is expected and correct that when the number of those
exceeds MAX_INIT_ARGS, the kernel does not boot.

For completeness I'll perform similar testing soon using known-parameter names.
