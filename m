Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A4DC05027
	for <linux-doc@archiver.kernel.org>; Tue,  7 Feb 2023 03:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjBGDIg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Feb 2023 22:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBGDIg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 22:08:36 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F182C13DFA
        for <linux-doc@vger.kernel.org>; Mon,  6 Feb 2023 19:08:33 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id t19so2407826pfe.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Feb 2023 19:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0BgRaIdDVwuxmfjftfuf/I8A6WeZY63To7Q/ndCtPg=;
        b=Ohgjb4E35j1jx63kLJfkAh4MWQfNoFmz/c4H8/v91ZOL+23j/54OPmWOMbCM5iRW3e
         j0YELHHY5CVq+WQCJ9Rja1TqPjfWjHCu+if9jAE1b6P2BDtVQyqUGk47rWLCMxaFJNRe
         S0WYPUOn6Kz7iUXI58YF/VILycR+r7hHFF4lC4/c6nGBQhJxz88TsIvAoVdrweOGPh8g
         hzvS06g/Uc7i+q2bNbyDEQ26Q4d9YzU09CttFlFutbUtlPcQxTornRwhRncispJl3oGa
         UN4Blyw/TX6ITd5kEVL3TGL+h1PU4WIPL9N9mpl1IIinROiL2IB1UGNWC2LXwywXvC8g
         Db4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0BgRaIdDVwuxmfjftfuf/I8A6WeZY63To7Q/ndCtPg=;
        b=RuzosNlM2HL5CANU+cRH9/vU+his9O5itQPjM/WqJ/rrIFJxCGdgFJ5lNc1VhzKKer
         oAhUon1nKnEApEFWmf1UM9RbaGoJ1i/uaSiGlkdOLQOBjmbWt6TppVM48MYxDMQib6Af
         J8uZG0+ZHUfHgsPlus1ayAe0m3vY2CfR0MCyLVmeE7ipc107JK03cOFS5Hlm7OZpviDM
         bV48p7bBsZt52BmJGulxoU1NZgWJZqS+DRSOlBv7PvFcSsiSHrbacef6ZyoSJiKlOCb9
         Vg0pBAXW/Z3ITbqccD+RD5ayjvmpQyetW+v1aLB7iKeziJouTNQDN0b+6+Q/NzF3uET0
         CJJQ==
X-Gm-Message-State: AO0yUKUC1PL9AgS6A4Jja/UXF7x0GYcLE1iax+9oUlackh/4rYhmQG9N
        bHgP6S6xWsYW+2SfKRhRcUU=
X-Google-Smtp-Source: AK7set/xOAHhNbBc3MCAh/nckb9iEvWw9tqO19a8NTkx4i3/igxk5/GPJx1HJuwl94TTAZKkrp7/AQ==
X-Received: by 2002:aa7:9603:0:b0:593:ced5:d9d with SMTP id q3-20020aa79603000000b00593ced50d9dmr1829735pfg.10.1675739313372;
        Mon, 06 Feb 2023 19:08:33 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id f14-20020a056a00228e00b0058d54960eccsm7891747pfe.151.2023.02.06.19.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 19:08:32 -0800 (PST)
Message-ID: <0846f6d7-1345-1d46-dae5-4b1b0430b205@gmail.com>
Date:   Tue, 7 Feb 2023 12:08:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] docs: improve the HTML sidebar/TOC
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>, linux-doc@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>
References: <87h6vyr3r9.fsf@meer.lwn.net>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87h6vyr3r9.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Mon, 06 Feb 2023 12:30:02 -0700, Jonathan Corbet wrote:
> Add a new sidebar template that creates a more RTD-like "fisheye" view of
> the current place in the document hierarchy.  It is far from ideal, but
> some readers may find it better for navigating through the documentation as
> a whole.
> 
> Add some CSS trickery as well to make the table of contents less intrusive
> when viewing the pages on a small screen.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
> Changes this time are almost entirely in the small-screen view; I've
> added some CSS trickery to hide the TOC by default so it doesn't get
> between readers and what they actually want to see.  I'm sure it could
> be done more elegantly, but my fluency with CSS ... does not afford much
> elegance ...
> 
> Once again, the results are at:
> 
>   https://static.lwn.net/kerneldoc/

It took a few seconds for me to figure out the TOC entries are hidden
behind the "[Show]". Yes, this works reasonably well.

Thank you for your efforts.

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira 

> 
> This is as far as this work is likely to get before the merge window; in
> the absence of screams, I'll drop it into linux-next in the near future.
> 
>  Documentation/conf.py                         |  5 +-
>  Documentation/sphinx-static/custom.css        | 48 ++++++++++++++++++-
>  .../sphinx/templates/kernel-toc.html          | 15 ++++++
>  3 files changed, 65 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/sphinx/templates/kernel-toc.html
> 

