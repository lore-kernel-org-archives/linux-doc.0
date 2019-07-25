Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF73F7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Jul 2019 21:08:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfGYVIP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Jul 2019 17:08:15 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43495 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfGYVIP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Jul 2019 17:08:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id i189so23356340pfg.10
        for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2019 14:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WmalSjXU2+UMwu+n7/bMrWZ2JD8OB4RgtPxtzWVAFZw=;
        b=gS69xQ3HQ5DwlpT+3eioEhs0xyKtJ2ftCd5+xt6tcAl1xnay9n7aU43th1Gy2HJULU
         f/leuafud7FhKVA9BmjBKS+AJIK6uCU7J/mHFf2cTNtr2W9sgLMkZ4aMaSqbv5Vtp258
         mnmNK8JOs7s2Fh9AEENDwa7DFQPe9BzsG7I1cEpTvWzvO8Bzesuqw+lk3HWZUn40tkr8
         Y7fb3OO6M3rRXenduMfEXUfb+i+ew207LvkpMKl/axJgJRoYHzMhTL8sNqZijbzqtdxl
         XaPmp+c4EYVYnS7H1Ja4X7B22jufadB6/aZVPfPErjrP3lNU8ctbh9Pms0LBSZ+W7+IG
         nEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WmalSjXU2+UMwu+n7/bMrWZ2JD8OB4RgtPxtzWVAFZw=;
        b=GIH2Z+x/iQURkSFjJD+PfJmOsftu+ULIweyU/LOmmPz5pyK83lEBbnKUilxoNDPS5u
         NKeWgd3cFMOUDWl+XuIusC287+QYBcSh9/QW1CRkb0zOWamLEt6DKvW6KgLI2LRKfd7v
         YErkw+eHhWDUSPOD8uzpMnxC8OFDB15vy3ngbwsZSdCm68kWbpy1zhwCcPZonqhAwSVZ
         TFb81LP/ZMJ0z8zg66UFWQJLv7FlRVi6tyNVYD+OxxtjkKSM0rrfy9rjm2R6yRFqfkfg
         9ZGyrFIKoUmWpBzkTAU0Eb6UACZzs3iYeRvw7O31OWSGCkcc8+S8/k6FXon7iFSkzF2F
         eOPQ==
X-Gm-Message-State: APjAAAXSRBUx46LSev5Ss5KzEc4MlXgrwYFVIjlm398fDJaq9QotwoLw
        3AIrmD/gR++6wMs9MnV3lwA=
X-Google-Smtp-Source: APXvYqxM/tM/2Sgv48KwjKyC8B0/gF82bwJ6+zC8FAm+hcGqS+5kly5YFikhaL+7TXE39YVMNoMsBQ==
X-Received: by 2002:a17:90a:9b08:: with SMTP id f8mr95274395pjp.103.1564088894360;
        Thu, 25 Jul 2019 14:08:14 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
        by smtp.gmail.com with ESMTPSA id o14sm41657079pjp.19.2019.07.25.14.08.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 14:08:13 -0700 (PDT)
Date:   Fri, 26 Jul 2019 06:08:11 +0900
From:   Stafford Horne <shorne@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-doc@vger.kernel.org, openrisc@lists.librecores.org
Subject: Re: [PATCH 10/22] docs: openrisc: convert to ReST and add to
 documentation body
Message-ID: <20190725210811.GK2601@lianli.shorne-pla.net>
References: <cover.1563792333.git.mchehab+samsung@kernel.org>
 <353497a08f6c01f2433174acbe35dc5991a51697.1563792334.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <353497a08f6c01f2433174acbe35dc5991a51697.1563792334.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 22, 2019 at 08:07:37AM -0300, Mauro Carvalho Chehab wrote:
> Manually convert the two openRisc documents to ReST, adding them
> to the Linux documentation body.

Thanks for doing this, the below looks fine.

Acked-by: Stafford Horne <shorne@gmail.com>
 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/index.rst                       |  1 +
>  Documentation/openrisc/index.rst              | 18 +++++++++++++
>  .../openrisc/{README => openrisc_port.rst}    | 25 +++++++++++++------
>  Documentation/openrisc/{TODO => todo.rst}     |  9 ++++---
>  4 files changed, 43 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/openrisc/index.rst
>  rename Documentation/openrisc/{README => openrisc_port.rst} (80%)
>  rename Documentation/openrisc/{TODO => todo.rst} (78%)
> 
 
