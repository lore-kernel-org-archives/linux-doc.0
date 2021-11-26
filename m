Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FF2C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Nov 2021 12:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbhKZM2q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Nov 2021 07:28:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235463AbhKZM0q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Nov 2021 07:26:46 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD85BC061399;
        Fri, 26 Nov 2021 03:52:11 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id u3so23653199lfl.2;
        Fri, 26 Nov 2021 03:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FO4VBFnJmFurD2UzwMUBKDGtdPRzRFFL5pbgvr6OIHE=;
        b=KNnn4KLAPOrudXuGH603uhr8HkHMQuc/NZJJZjsg2JRzHZb0D0GxNm0hyj2PplChq3
         apwonvfPdXQqh5NvcO6Y2tVtP5TrAcca2ELU7BBIxoLadDuQr45DSUB2T8TXfvrqBbCp
         vBpAsJs2s4alIKcm2kio1ec0oFbPIR7aSbTxlHG+M8flMmmsJWDpTtlWQIc+O/L1/GKY
         D0tr/hrL5iZNdzfCNTL0P2o3LPPy73/RfMpeh6G77dgbbM9y3e9hITshizcOg08jRqn+
         41+/rqoBe49ltf3OJ53VI2wJU4eNZb0L8oRiUAGHRgnzaDl5sQHM2sI5vXYfZezvY3Oe
         OI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FO4VBFnJmFurD2UzwMUBKDGtdPRzRFFL5pbgvr6OIHE=;
        b=scaCUnbjPQQkM0BvH9OlkKY2TE3lwNiGGhq6ej7iPRilNhsUGmiRZ63bK3JJy5sGWQ
         rnRhDQtTdIBHY+8WGMBgX2/VFeG2Jh2eoNfarfosSId/vt8AQAGWfslYF76yOhgYAtGY
         wrFrOM/46U4Zet55AgHSIjQofQCqS7axQnCzGmwRhuKnAkyC6/jKvh73qiiLQ49N4ttQ
         uhoow4ovn8Wk00aBsXnh1BnXkokD+/95dJlDh19tFrRkB+ls3bYHz401PtPurv9UmNmH
         QtVqxny+40a+2gKJ1MbNQb9UsWuA4O2+zcF7HwNxDmeHDZTcQVd6vrFUzxem+aYDpzsM
         S5gA==
X-Gm-Message-State: AOAM530YBld9MCY9YHXMtdJcTBAwVdMBmW+PI3b4+5xtdJ8WEis4TsDR
        C1DNMWAOii6Z0xJL0G3Ly/U=
X-Google-Smtp-Source: ABdhPJxhuNo7zNlSNKnh6lK7cs0lfHFvVg9IF/LOx2XuqynLIf8ajSj4M4U52mAIelNciAxREQnHhg==
X-Received: by 2002:a19:f242:: with SMTP id d2mr29542032lfk.516.1637927530039;
        Fri, 26 Nov 2021 03:52:10 -0800 (PST)
Received: from kari-VirtualBox ([31.132.12.44])
        by smtp.gmail.com with ESMTPSA id b13sm557874lfv.200.2021.11.26.03.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 03:52:09 -0800 (PST)
Date:   Fri, 26 Nov 2021 13:52:07 +0200
From:   Kari Argillander <kari.argillander@gmail.com>
To:     Rushab Shah <rushabshah32@gmail.com>
Cc:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>, ntfs3@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Doc/fs/ntfs3: Fix a trivial typo
Message-ID: <20211126115207.jgtmr2skapg5exzv@kari-VirtualBox>
References: <20211116193138.335050-1-rushabshah32@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116193138.335050-1-rushabshah32@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 16, 2021 at 11:31:38AM -0800, Rushab Shah wrote:
> Correct the typo effectice -> effective
> 
> Signed-off-by: Rushab Shah <rushabshah32@gmail.com>

Reviewed-by: Kari Argillander <kari.argillander@gmail.com>

> ---
>  Documentation/filesystems/ntfs3.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/ntfs3.rst b/Documentation/filesystems/ntfs3.rst
> index d67ccd22c63b..05e9c49b7400 100644
> --- a/Documentation/filesystems/ntfs3.rst
> +++ b/Documentation/filesystems/ntfs3.rst
> @@ -104,7 +104,7 @@ this table marked with no it means default is without **no**.
>  Todo list
>  =========
>  - Full journaling support over JBD. Currently journal replaying is supported
> -  which is not necessarily as effectice as JBD would be.
> +  which is not necessarily as effective as JBD would be.
>  
>  References
>  ==========
> -- 
> 2.34.0
> 
> 
