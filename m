Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4178BC4332F
	for <linux-doc@archiver.kernel.org>; Thu, 22 Dec 2022 15:43:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235460AbiLVPnt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Dec 2022 10:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235389AbiLVPne (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Dec 2022 10:43:34 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07ADF20347
        for <linux-doc@vger.kernel.org>; Thu, 22 Dec 2022 07:43:31 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id j16so1624695qtv.4
        for <linux-doc@vger.kernel.org>; Thu, 22 Dec 2022 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NfRvmfvKFOxDn9g+8R6zgrgTa4YsyN/kNivwQNhwIck=;
        b=AuDhAikVwt0qcXGLmSoHKNsgOvt1MqsjlxCryk6q4Xqs5vo8gMkhKmo9qrrawceIhh
         KjJ7qLocGGKHolGi/3HHf85IgvdqN1WuF0l4pGMMQcPp9gpjUIpfwqIsw8xcKO8zvm53
         KwSduT8LNVo07XCZih7peJLWiKQVbUMO7te4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfRvmfvKFOxDn9g+8R6zgrgTa4YsyN/kNivwQNhwIck=;
        b=Z10CkYHR7iuXXmBA/vseHErE1D1zUohPUaqg+kyBLaRoV3iDJfD9Mqbpt0WUwVIqVF
         eBoGOGLsL3OI/6G94f3czUkBGbEOJaly90es+YTghdePtPgx5wVgwOUZhz9LTO/1rFyX
         A4VZxpTDI6z4xNFfnGHfaEMfvCFjg3qoU9he1ONUg9Mzq4EyhsXL7hwJYcRQ2q9Cl6qa
         kO1aGME0Id0mN58f85BbllI61tTu75AuzOhFx6fEug9jEx3GIwv2I8kMXhhnwqhxrYjo
         hahF9WX/gGP2HL540SsoDs1QLaghLONB5dgR9QYqvqdVfgpmBHb0n2RAlVJeJY40GYMh
         1G9g==
X-Gm-Message-State: AFqh2kp/sLT/PFEgIH0u5AnJ9hyl1cUhKF7hPlK/QaRItsmC8178kzAN
        Zdn2quvAniSid8yoTf7kAsfcKA==
X-Google-Smtp-Source: AMrXdXs70VQHhJgtWr0krmiy2P3ZRJ9SHSqD4QlkkhJj9ABz0PmD7d2sBBbc3F89GZYxo7pRkMj6vw==
X-Received: by 2002:a05:622a:4184:b0:39c:da20:f7e2 with SMTP id cd4-20020a05622a418400b0039cda20f7e2mr6452898qtb.63.1671723810082;
        Thu, 22 Dec 2022 07:43:30 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id v22-20020ac87296000000b003972790deb9sm503671qto.84.2022.12.22.07.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 07:43:29 -0800 (PST)
Date:   Thu, 22 Dec 2022 10:43:28 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer-pgp-guide: update for latest gnupg
 defaults
Message-ID: <20221222154328.lort3wvixcyykeyx@nitro.local>
References: <20221220-docs-pgp-guide-v1-1-9b0c0bf974fb@linuxfoundation.org>
 <Y6RVTQxhcxDDrvO3@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y6RVTQxhcxDDrvO3@debian.me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 22, 2022 at 08:02:05PM +0700, Bagas Sanjaya wrote:
> Shouldn't "Protecting Code Integrity" doc also be updated with recent
> situation?

Yes, I'm working on updating that document as well. By the time this change
makes it into mainline, both documents will be a close match.

> LGTM, thanks.
> 
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks!

-K
