Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1C9C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Oct 2021 21:05:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF42B61076
	for <linux-doc@archiver.kernel.org>; Mon, 25 Oct 2021 21:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbhJYVIC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Oct 2021 17:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbhJYVIC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Oct 2021 17:08:02 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFB1C061767
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 14:05:39 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id y11so11535632qtn.13
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 14:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DqpOduu7lgR/ChCv8/UsQoSrvt3yOCf3GV9DkR2zoYI=;
        b=JsNgxGryTgPHPBzCVlCRUZhnAcCYoL+kYxE5k10qS4bOwqXVT850k1LCHnuJxNn1kD
         2TCFG5DtXky68M3MjKfrqVjqCyMWh4nHT21AaG4lqpE2oNKdu7f2X3vEMOeftBcELtkR
         BN8i1velF9pfuwqlqpxx/GIuxDVY+3W7wvDyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DqpOduu7lgR/ChCv8/UsQoSrvt3yOCf3GV9DkR2zoYI=;
        b=xZRCLqeU/PexkGBTOpgpGGOeuLkG2Bev9bMNW+wZxuq5+pimq5xcHP7Zbxh3CshoAq
         cn0DnDVDJe5DfW9LKaUl1GH+EHS+JUNOgG53vdYi+MeGYN5T4f7qcfONDOCyWQ6kwWEc
         KNXWts3X9HazCnAg/26Y25Gr56EJS5sAVFY1HW5mD5mzkyYPn/DJD4bs0ZqChGBjk48S
         SAQE3bBGBP3Jnye32VkZDrUUl+xDzblBBHyJELjzoMaZ9x95loWRLf17gHcbgrZqquqr
         TOSjKlhn1xnbaHT6QnBKdogSXI94PIILkY58yVTxsn1bvOgy3u0ZTvEwqbpCSyMCqT2I
         W+cw==
X-Gm-Message-State: AOAM533lZxnHItTG22ac/PMZi8cc0flf53AzEjkn5XtoXHgCqCh4IKHp
        c8lGRO645rKl5kA8TW9n096J4w==
X-Google-Smtp-Source: ABdhPJxAZA+QMvMVKms/ShCvWP5QG1aZ3u8AOBzf1iEBfmOH3MwHdHzMs8NYawb3HvxuH/I8/P1zMA==
X-Received: by 2002:a05:622a:310:: with SMTP id q16mr20798346qtw.10.1635195938713;
        Mon, 25 Oct 2021 14:05:38 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id e13sm9232919qkm.81.2021.10.25.14.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 14:05:38 -0700 (PDT)
Date:   Mon, 25 Oct 2021 17:05:36 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] docs: submitting-patches: make section about the
 Link: tag more explicit
Message-ID: <20211025210536.hlmkpjwf3nll6mlm@meerkat.local>
References: <cover.1635152553.git.linux@leemhuis.info>
 <27105768dc19b395e7c8e7a80d056d1ff9c570d0.1635152553.git.linux@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27105768dc19b395e7c8e7a80d056d1ff9c570d0.1635152553.git.linux@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 25, 2021 at 11:06:35AM +0200, Thorsten Leemhuis wrote:
> +If related discussions or any other background information behind the change
> +can be found on the web, add 'Link:' tags pointing to it. In case your patch
> +for example fixes a bug, add a tag with a URL referencing the report in the
> +mailing list archives or a bug tracker; if the patch is a result of some
> +earlier mailing list discussion or something documented on the web, point to
> +it.

The "for example" is splitting the sentence awkwardly, so I would move it to
the beginning of the sentence:

"For example, in case your patch fixes a bug, add ..." etc

Otherwise,

Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

-K

