Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 803737D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Dec 2018 12:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbeLCM5M (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Dec 2018 07:57:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39263 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbeLCM5M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Dec 2018 07:57:12 -0500
Received: by mail-wr1-f67.google.com with SMTP id t27so12057285wra.6
        for <linux-doc@vger.kernel.org>; Mon, 03 Dec 2018 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=9KBrBoOrO+XfJILgtl4j7qnaWuKkBcCyWQk1f6mH+Ns=;
        b=PlVZZo3c2gO9uLCfUZVVJpr16CniYdmelENBbOOWAlPNiC+/UN/G4hRbnNrnAedrZS
         1PImzadWgPPbLyxc/EpgdqP8AlagbZpOyK8c3Huzt8wv3X4BYVgVwMspZ4UQu6tbP3CB
         jisR0EmVStHYJUr1BfUmWN6FYjDWBLg3qt8Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=9KBrBoOrO+XfJILgtl4j7qnaWuKkBcCyWQk1f6mH+Ns=;
        b=nsJyGd1Ryi2aMFGpdl3S7twmFD90cz9baer8BWbifozKxzn4PpRgWl+Ntu42NCyh+k
         Ej5lyaeEhHaRl20g3apz7kbY+xlicfyuZCtm96rJN1NKWyGTotYGxMDi4GohOrZkWcqi
         ZFyAiQGUcNiTbyyaEkVUmPhq3Pb6EH1tfOGDL/uNfydoYbefHFQmqVBjwtzQWOomzaS3
         P/NwbnH/Gg0dIqDNDVgNYrhv0vxqCZ2jbTq9O2hY7K6jjbFzPGeNmri4kU5K6Hm7/wyY
         qJr0rXjf8qg7wozkIDPPLEelHozNCu2zhbTKmtFraCpgfaFuFrirZjELS7YTRxbTOsWN
         WmNA==
X-Gm-Message-State: AA+aEWZWVpq54yJVNV+gax90Q+eWKCReLXjhdQhs41ANosfgGXFGKeAg
        4m9kQY4pUzMaxy4ucW2ioryc/wDkUg4=
X-Google-Smtp-Source: AFSGD/Uq6JtGohyQ33oJfLxSqhdxAMWAtzz5RfNgfzCyq4KUoPhWt7h9nG/xmPBcWDabsL90f8d69g==
X-Received: by 2002:a05:6000:10d1:: with SMTP id b17mr13881949wrx.306.1543841773676;
        Mon, 03 Dec 2018 04:56:13 -0800 (PST)
Received: from dell ([2.31.167.218])
        by smtp.gmail.com with ESMTPSA id c10sm9814882wrw.49.2018.12.03.04.56.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Dec 2018 04:56:12 -0800 (PST)
Date:   Mon, 3 Dec 2018 12:56:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, mturquette@baylibre.com,
        sboyd@kernel.org, cw00.choi@samsung.com, krzk@kernel.org,
        b.zolnierkie@samsung.com, linux@armlinux.org.uk,
        andy.gross@linaro.org, david.brown@linaro.org, pavel@ucw.cz,
        andrew.smirnov@gmail.com, pombredanne@nexb.com,
        sjhuang@iluvatar.ai, akshu.agrawal@amd.com, djkurtz@chromium.org,
        rafael.j.wysocki@intel.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/9] clk: clkdev: managed clk lookup and provider
 registrations
Message-ID: <20181203125611.GQ26661@dell>
References: <cover.1543837442.git.matti.vaittinen@fi.rohmeurope.com>
 <20181203121951.GP26661@dell>
 <20181203123558.GD15388@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181203123558.GD15388@localhost.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 03 Dec 2018, Matti Vaittinen wrote:

> 
> Hi de Ho Lee,
> 
> On Mon, Dec 03, 2018 at 12:19:51PM +0000, Lee Jones wrote:
> > > Series add bd71837/bd71837 PMIC clock support + managed interfaces
> > 
> > You've send me a cover letter and no patches.
> > 
> I am afraid the patches may be still on their way... I added recipients
> to git format-patch via command-line so you are probably included also
> in patch mails :(

Ah I see.  Yes, I see that they have started to come through.

> > I suggest that I should not be on the addressee list at all for this.
> 
> I'm terribly sorry for spamming! I must've done some mistake with the
> get_maintainer.pl as I copied the recipients from that output. I may
> have accidentally included some old patch to maintainer query.

No problem.  If you could remove me from future mails though, that
would be appreciated.  The torrent it fierce enough without receiving
correspondence that is not relevant to me.  Thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
