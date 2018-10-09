Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DA7DA7D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Oct 2018 01:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbeJIIyl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Oct 2018 04:54:41 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:40031 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbeJIIyl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Oct 2018 04:54:41 -0400
Received: by mail-yb1-f193.google.com with SMTP id w7-v6so9104442ybm.7
        for <linux-doc@vger.kernel.org>; Mon, 08 Oct 2018 18:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=7qA+dtOcdI9urqDaS/IIx7h3l7wueuGPmWbY8bS/3GU=;
        b=Cr7d8QAz0kukYdX0iBqB5KVdL/yUDjRmOJyD2dc6Vca6WvhfsP421Td/pzu5oqOyHg
         vWlxQnjXCC7v55mqc/rDdr5wc7MeIxqZ7muGiZA+v5x01nSspt/SnK8V1DwKWl6Gkwbm
         uO8CQq0kdGPN3kyueDJcm9Vjm72pamEF8xH0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=7qA+dtOcdI9urqDaS/IIx7h3l7wueuGPmWbY8bS/3GU=;
        b=U2DNoRYR307UPlU5RwJE87jXRykn/cESxJLvpKv19Ma5RHDkvPEufh7axJcuAdN+gQ
         unoAJK4c7sTlK5u1U4GZhUeoMYmfE2K6EmBPBg6SVqC4rultJ1bh8fgDpVVRk1OQtxw1
         FGg1QYKBj0LiW2wdtQty/BUfWon0Si9ecfdl3M/i+6JaUo8TUGs9tHSPsgRs5tATQZUZ
         pIiV/HlK6zaFtEiPPYM3Y2QFQctxSaT7Ok8bdmXERwMaSwPB9KVr6UTFRNp4xwJls+wi
         MZ8zIsIAPmLyXHM9LGfcJmbY4so0dzag9iO7z+cZInU4dTfx40bTCiEH51t2H6Xzik0R
         e2/A==
X-Gm-Message-State: ABuFfogr9wL5pH2Lk33CEkhQadYDesV6z47wJv5SFABvE29RjKFO7UL/
        JnerG+zvPy7DyE63X8rZ9ODgXu1fXjU=
X-Google-Smtp-Source: ACcGV61xyMU3yXmBON5sMjOzXkNkfd+F3Jf2qwkoP1kypRAWuaDqtgpUZsnScI567cnzPz/imexTYQ==
X-Received: by 2002:a25:3383:: with SMTP id z125-v6mr13905170ybz.308.1539049210786;
        Mon, 08 Oct 2018 18:40:10 -0700 (PDT)
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com. [209.85.161.53])
        by smtp.gmail.com with ESMTPSA id n62-v6sm6838157ywf.105.2018.10.08.18.40.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Oct 2018 18:40:09 -0700 (PDT)
Received: by mail-yw1-f53.google.com with SMTP id y76-v6so8918824ywd.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Oct 2018 18:40:09 -0700 (PDT)
X-Received: by 2002:a81:98cb:: with SMTP id p194-v6mr14391598ywg.353.1539049208850;
 Mon, 08 Oct 2018 18:40:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Mon, 8 Oct 2018 18:40:08 -0700 (PDT)
In-Reply-To: <c06eb47c-05d3-f51c-625b-9bfdd33a426a@infradead.org>
References: <c06eb47c-05d3-f51c-625b-9bfdd33a426a@infradead.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 8 Oct 2018 18:40:08 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+B82dt9KvO0UVMBLoFxZEZF76xic4Sz41HtVfKHWpwWQ@mail.gmail.com>
Message-ID: <CAGXu5j+B82dt9KvO0UVMBLoFxZEZF76xic4Sz41HtVfKHWpwWQ@mail.gmail.com>
Subject: Re: [PATCH] security: fix LSM description location
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 8, 2018 at 5:46 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix Documentation location reference for where LSM descriptions should
> be placed.
>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: linux-security-module@vger.kernel.org

Thanks!

Acked-by: Kees Cook <keescook@chromium.org>

Jon, can you take this?

-Kees

> ---
>  Documentation/security/LSM.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- lnx-419-rc7.orig/Documentation/security/LSM.rst
> +++ lnx-419-rc7/Documentation/security/LSM.rst
> @@ -5,7 +5,7 @@ Linux Security Module Development
>  Based on https://lkml.org/lkml/2007/10/26/215,
>  a new LSM is accepted into the kernel when its intent (a description of
>  what it tries to protect against and in what cases one would expect to
> -use it) has been appropriately documented in ``Documentation/security/LSM.rst``.
> +use it) has been appropriately documented in ``Documentation/admin-guide/LSM/``.
>  This allows an LSM's code to be easily compared to its goals, and so
>  that end users and distros can make a more informed decision about which
>  LSMs suit their requirements.
>
>



-- 
Kees Cook
Pixel Security
