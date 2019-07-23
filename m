Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C3F247D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Jul 2019 21:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731025AbfGWV2S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Jul 2019 17:28:18 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46445 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731145AbfGWV2R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Jul 2019 17:28:17 -0400
Received: by mail-pg1-f194.google.com with SMTP id k189so1002827pgk.13
        for <linux-doc@vger.kernel.org>; Tue, 23 Jul 2019 14:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KE15xa18tTRocyVLkAyTsFK/CogeXePSTfih4gTWWqE=;
        b=SDygoRUsTxW6TTuRaBj1iYCmOY2pEXsrRSkgpjtWINcS2KHYINYnEh3sSHGXM/Z9Z0
         0UyPSL9FtaaX+eeg83GXipQUkmsgtEgfQewcrGVaqRRdVJdawtWqHD6+XrBoSfVPlUOT
         VyahDnFtfgqFF5DeeFH4Q+q4WnnGIpZ9zjvdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KE15xa18tTRocyVLkAyTsFK/CogeXePSTfih4gTWWqE=;
        b=GYUv8nrNTGJYEd2UQupc/WcqGqZljha+oI8KJt2oK7SfExkmNE3jfkTyJqtDb0IqRt
         G96ElhFyglzISdua/SwR0VYeiZfK2pM3964Iaz4mBGUgw1mvezpy7ItcJdAG56KdFWTu
         f87qHCHp+HKLXHnEIvbHx3cGvvRvw8L6TmLAcTOp0cztpJ6LYmmUrdcsNf4hoe/kRZE/
         iO1UlesZGnIqgEuPwRQbYaftDeMVnWPx4sGiI7nQf0GgseTorNAABnNyNVPc4uIIa6W+
         N2P8kiuGvgt21VkJ2Ote8MZX+onRnWwSp4O0cZx+KE3F/ACL5Czpwfwl6ovNmN5Vv5MZ
         E3VQ==
X-Gm-Message-State: APjAAAV0nmIUBTyjK5WIbzOwOCSgV1KsddcjNW8fnZFXJD4SrrQ2ghls
        ei3pojf4yGKeoxyu0Ej967vG2Q==
X-Google-Smtp-Source: APXvYqz47GoGURJ0taiC0XhIJxWtE1YOy/l5OZWV402tGZ0JRjtYHPc39Jdba1gAyo/qTxfnfJeItA==
X-Received: by 2002:a17:90a:1a45:: with SMTP id 5mr85961043pjl.43.1563917297050;
        Tue, 23 Jul 2019 14:28:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v10sm44579780pfe.163.2019.07.23.14.28.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2019 14:28:16 -0700 (PDT)
Date:   Tue, 23 Jul 2019 14:28:15 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Stephen Kitt <steve@sk2.org>,
        Nitin Gote <nitin.r.gote@intel.com>, jannh@google.com,
        kernel-hardening@lists.openwall.com,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] kernel-doc: core-api: Include string.h into core-api
Message-ID: <201907231428.6154FA6E04@keescook>
References: <cover.1563841972.git.joe@perches.com>
 <224a6ebf39955f4107c0c376d66155d970e46733.1563841972.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <224a6ebf39955f4107c0c376d66155d970e46733.1563841972.git.joe@perches.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 22, 2019 at 05:38:16PM -0700, Joe Perches wrote:
> core-api should show all the various string functions including the
> newly added stracpy and stracpy_pad.
> 
> Miscellanea:
> 
> o Update the Returns: value for strscpy
> o fix a defect with %NUL)
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  Documentation/core-api/kernel-api.rst |  3 +++
>  include/linux/string.h                |  5 +++--
>  lib/string.c                          | 10 ++++++----
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
> index 08af5caf036d..f77de49b1d51 100644
> --- a/Documentation/core-api/kernel-api.rst
> +++ b/Documentation/core-api/kernel-api.rst
> @@ -42,6 +42,9 @@ String Manipulation
>  .. kernel-doc:: lib/string.c
>     :export:
>  
> +.. kernel-doc:: include/linux/string.h
> +   :internal:
> +
>  .. kernel-doc:: mm/util.c
>     :functions: kstrdup kstrdup_const kstrndup kmemdup kmemdup_nul memdup_user
>                 vmemdup_user strndup_user memdup_user_nul
> diff --git a/include/linux/string.h b/include/linux/string.h
> index f80b0973f0e5..329188fffc11 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -515,8 +515,9 @@ static inline void memcpy_and_pad(void *dest, size_t dest_len,
>   * But this can lead to bugs due to typos, or if prefix is a pointer
>   * and not a constant. Instead use str_has_prefix().
>   *
> - * Returns: 0 if @str does not start with @prefix
> -         strlen(@prefix) if @str does start with @prefix
> + * Returns:
> + * * strlen(@prefix) if @str starts with @prefix
> + * * 0 if @str does not start with @prefix
>   */
>  static __always_inline size_t str_has_prefix(const char *str, const char *prefix)
>  {
> diff --git a/lib/string.c b/lib/string.c
> index 461fb620f85f..53582b6dce2a 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -173,8 +173,9 @@ EXPORT_SYMBOL(strlcpy);
>   * doesn't unnecessarily force the tail of the destination buffer to be
>   * zeroed.  If zeroing is desired please use strscpy_pad().
>   *
> - * Return: The number of characters copied (not including the trailing
> - *         %NUL) or -E2BIG if the destination buffer wasn't big enough.
> + * Returns:
> + * * The number of characters copied (not including the trailing %NUL)
> + * * -E2BIG if count is 0.
>   */
>  ssize_t strscpy(char *dest, const char *src, size_t count)
>  {
> @@ -253,8 +254,9 @@ EXPORT_SYMBOL(strscpy);
>   * For full explanation of why you may want to consider using the
>   * 'strscpy' functions please see the function docstring for strscpy().
>   *
> - * Return: The number of characters copied (not including the trailing
> - *         %NUL) or -E2BIG if the destination buffer wasn't big enough.
> + * Returns:
> + * * The number of characters copied (not including the trailing %NUL)
> + * * -E2BIG if count is 0.
>   */
>  ssize_t strscpy_pad(char *dest, const char *src, size_t count)
>  {
> -- 
> 2.15.0
> 

-- 
Kees Cook
