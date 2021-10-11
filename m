Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC12C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 12:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDD3460F23
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 12:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236746AbhJKMyl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Oct 2021 08:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45708 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235180AbhJKMyk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Oct 2021 08:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633956760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R/O41kNxsiEROmyRK7T1peFirCbbua8dp9Na0HOmfkg=;
        b=L9SBvUCzDHi0ObsBO0i9M2cV4yYfcfiDHWCAnrmmRMOAO7PqRuBHUHj7luuVu5VArBb40J
        0TBwdCJzlQTd1D4ECZJ7KuTE8JJz8X9Fo1duKrLnlNP2FG1zA/cnxRGWLCAIlNRIczu7e9
        1wqFz3F9/7b4r3a6HiRCY3i7YMY6wpI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-9nD5iYm8MaSkrmbcpUin8g-1; Mon, 11 Oct 2021 08:52:39 -0400
X-MC-Unique: 9nD5iYm8MaSkrmbcpUin8g-1
Received: by mail-ed1-f70.google.com with SMTP id z23-20020aa7cf97000000b003db7be405e1so4897799edx.13
        for <linux-doc@vger.kernel.org>; Mon, 11 Oct 2021 05:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R/O41kNxsiEROmyRK7T1peFirCbbua8dp9Na0HOmfkg=;
        b=w0KLE7VezyOmkedtRJIFjEmZCEcxC19C9izyv24zN+H2cqd9R2J3iSIcGkzTsni67e
         As/YuNer/LjH+Dw3/Gmg1CxGd0K75Kd6GddRnLFq8zi1qAxqhIAw0BYYEW7aDPRqwYuu
         5+FpAK2tFP6UT4d5qur/NmnHMc/9kw63PhaYOyTmJWUZChATIbhGGI8T1J4zFs8Lpsqo
         mHpnfgvWULi8nkM4ncsGjCvYvNBA8bryKZGIPPCTYylZInWILCLKZHk4sWyMTYE4lXde
         Jjc8xfIDNaC4GNOW4MKokHnLoKRBuHfHOMPm+NvyK2Jjk2RihnGRkeRTOZ/a07WC0sTe
         xwaA==
X-Gm-Message-State: AOAM532zbdMHxw5VtKfhJtDOoHxU9grL6ltmUfEbJjwa/GQ41V2Rj2ch
        80sUFd01adrLfSei7pwW5FQPkD5WP25TE/vMzifcBj9QUr8TCfHtFzf1RMsyilNpxBEURahu5Zf
        z+In99YPfNF5jBWgm5dhF
X-Received: by 2002:a17:906:b796:: with SMTP id dt22mr18038382ejb.456.1633956757796;
        Mon, 11 Oct 2021 05:52:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi7o92tq3gvqBc2CVw+igZfADk/zfjRvTv8729ds/ygTzFp3Qlc3LXYc3L1Pnrvj/Zr7JHAQ==
X-Received: by 2002:a17:906:b796:: with SMTP id dt22mr18038364ejb.456.1633956757634;
        Mon, 11 Oct 2021 05:52:37 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id lb12sm3570830ejc.28.2021.10.11.05.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 05:52:37 -0700 (PDT)
Subject: Re: [PATCH 7/7] ABI: sysfs-platform-intel-pmc: add blank lines to
 make it valid for ReST
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David E Box <david.e.box@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Tamar Mashiah <tamar.mashiah@intel.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <cover.1632740376.git.mchehab+huawei@kernel.org>
 <3673e1a255ad4100c933af215b60d68ba126f820.1632740376.git.mchehab+huawei@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e5ce90b3-898e-34ca-0a4e-19c7ea214f4d@redhat.com>
Date:   Mon, 11 Oct 2021 14:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3673e1a255ad4100c933af215b60d68ba126f820.1632740376.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 9/27/21 1:10 PM, Mauro Carvalho Chehab wrote:
> The ReST format requires blank lines before/after identation changes,
> for it to properly detect lists.
> 
> Fixes: ee7abc105e2b ("platform/x86: intel_pmc_core: export platform global reset bits via etr3 sysfs file")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> 
> See [PATCH 0/7] at: https://lore.kernel.org/all/cover.1632740376.git.mchehab+huawei@kernel.org/T/#t
> 
>  Documentation/ABI/testing/sysfs-platform-intel-pmc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-intel-pmc b/Documentation/ABI/testing/sysfs-platform-intel-pmc
> index ef199af75ab0..f31d59b21f9b 100644
> --- a/Documentation/ABI/testing/sysfs-platform-intel-pmc
> +++ b/Documentation/ABI/testing/sysfs-platform-intel-pmc
> @@ -11,8 +11,10 @@ Description:
>  		to take effect.
>  
>  		Display global reset setting bits for PMC.
> +
>  			* bit 31 - global reset is locked
>  			* bit 20 - global reset is set
> +
>  		Writing bit 20 value to the etr3 will induce
>  		a platform "global reset" upon consequent platform reset,
>  		in case the register is not locked.
> 

