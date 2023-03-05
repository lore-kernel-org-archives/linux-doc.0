Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B6FC678DB
	for <linux-doc@archiver.kernel.org>; Sun,  5 Mar 2023 23:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjCEXRM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Mar 2023 18:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCEXRL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Mar 2023 18:17:11 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A89A14990;
        Sun,  5 Mar 2023 15:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=eh+rz+QcNmMAeAiFfyYzSWoo8GUoV58UpLuzLuOKCd0=; b=r5E89bO/YBf/YFQ5I2OMd7+QIg
        OooLbtO4JnBFaTSSssyHxmXPX/V0Q+HtSw6KzAUH7zgF8/Xbg1A9rC4citaEvPBO+zGKQCW3XPnx9
        QC6BY/NvuXE8cR43hkHj9qQpqal5qjkATjzx9dtpBJzfqIUwRtDk1DLlZnWj+ncRIoEFmQ2kJTrk2
        apzDoRBiCYxU5LA18mJonBlqu75hE2LLQtzn1I9z6EoKo5NwZ3+l3fBBd7IHKNSP7McCVORHYeqnK
        iYvBSYeU730jJlRPI1ysnBqkyVKcFvroasl9VmWKn9OSt/nXYx99iNA0zbxLpDiJopjAhz+dg9Lx9
        U/nkZ1Qg==;
Received: from [2601:1c2:980:9ec0::df2f]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pYxbD-00Ao4X-Lt; Sun, 05 Mar 2023 23:17:05 +0000
Message-ID: <ac6d56df-0c1f-ca7c-5d2b-e6ae770518b5@infradead.org>
Date:   Sun, 5 Mar 2023 15:17:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND] Documentation: update kernel parameter limit notes
Content-Language: en-US
To:     James Addison <jay@jp-hosting.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net
References: <CALDQ5Ny1mbcUSk8pDL6HEq0Cgqze1tidyOeAgVxc5tyZNb+P_g@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CALDQ5Ny1mbcUSk8pDL6HEq0Cgqze1tidyOeAgVxc5tyZNb+P_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi James,

On 2/28/23 11:05, James Addison wrote:
> There does appear to be a limit on the number of parameters accepted by the
> kernel at boot-time, so this changeset updates the kernel-parameters.rst
> documentation to reflect that.

I looked at this again.  It's not a limit on the number of kernel command line
parameters AFAICT.  It's a limit on the number of parameters that are passed to
the init process.  Basically any parameter that is not recognized as a kernel
parameter OR anything that is after "--" on the kernel command line is put into
an array of limited size for passing to the init process.

> Signed-off-by: James Addison <jay@jp-hosting.net>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.rst
> b/Documentation/admin-guide/kernel-parameters.rst
> index 19600c502..a3a099127 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -203,7 +203,8 @@ be entered as an environment variable, whereas its
> absence indicates that
>  it will appear as a kernel argument readable via /proc/cmdline by programs
>  running once the system is up.
> 
> -The number of kernel parameters is not limited, but the length of the
> +The number of kernel parameters is limited to 32 by default (128 in User Mode
> +Linux), and is defined in ./init/main.c as MAX_INIT_ARGS. The length of the
>  complete command line (parameters including spaces etc.) is limited to
>  a fixed number of characters. This limit depends on the architecture
>  and is between 256 and 4096 characters. It is defined in the file
> 
> base-commit: e492250d5252635b6c97d52eddf2792ec26f1ec1

-- 
~Randy
