Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 034D57D087
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Oct 2018 06:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbeJINwH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Oct 2018 09:52:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36429 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbeJINwH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Oct 2018 09:52:07 -0400
Received: by mail-wr1-f65.google.com with SMTP id y16so460122wrw.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Oct 2018 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=f1LE+fuCOHL7G05Gu6dofBOQSogK/95XhyKefcWmaQE=;
        b=S9ekYKVYBqkNHnV9uSe6leKpkrnidTgKHiwypc89ea30D6CJ1GaLdZjQHhK9xnPBWS
         4HFPSE7rsosTaa1hEPsfFEmn9pYbpravqBXw8UZXM+966BUUtbHU3qxrw+Qaz4uG5VTL
         Xmc4YF0JYAJx1yu0QwSD23OyyBsyIqPmJXR8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=f1LE+fuCOHL7G05Gu6dofBOQSogK/95XhyKefcWmaQE=;
        b=FbToWXNtwj1H3aGsQ+R5Ii9LnlJ/qny/hxEtmncQCuich6OgGLa+PDQfpNKaUsvO7L
         P4zHtWFN2fztSHoqw5TmN1+cNpRBTU4RnunoFLl8pPrqeUKBp8VlSkfj4Es1pXB/efh0
         IPttPnFFgJHIGV/gXjW7CgDIQgOinCI5DGAj/xujdUbpeoKniJWFXjljA8wF/w7Pxhkg
         VGc82cpw2sVnpCN1sZDglvGbwhJVtepmBj099xLmcV21IFcSDXxiqq6Gdp/SLCoA3sNh
         GNnXWiD1N9ekBOqHm3BZeY6GKA8PkLYVrS8/dajMdnAsUmCbe76OaaoAEj2cI80aq9hX
         Ghmw==
X-Gm-Message-State: ABuFfoiilGAaox0UrdmkErYhyvtsMAkz+/2uyfor1sIUliAhllI9EV5x
        ODgr7XlroyBgF1OqE6BWRRcnDA==
X-Google-Smtp-Source: ACcGV61IMrL1QQF4r6gLj40Ih2wDHHUO7PqKVSbYEGKfTyNLfUkFuuv6b+GRg75OQUzyNY7Vq5K0VA==
X-Received: by 2002:adf:b64e:: with SMTP id i14-v6mr19715990wre.14.1539067003223;
        Mon, 08 Oct 2018 23:36:43 -0700 (PDT)
Received: from dell ([2.27.167.111])
        by smtp.gmail.com with ESMTPSA id c21-v6sm927144wmh.26.2018.10.08.23.36.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Oct 2018 23:36:42 -0700 (PDT)
Date:   Mon, 8 Oct 2018 23:36:40 -0700
From:   Lee Jones <lee.jones@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Guenter Roeck <linux@roeck-us.net>, linux-doc@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        robh@kernel.org, linux-mips@linux-mips.org,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org
Subject: Re: [PATCH v5 04/21] dt-bindings: Add doc for the Ingenic TCU drivers
Message-ID: <20181009063640.GB32033@dell>
References: <5bb4c6ad.1c69fb81.42bb.93ecSMTPIN_ADDED_MISSING@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bb4c6ad.1c69fb81.42bb.93ecSMTPIN_ADDED_MISSING@mx.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 03 Oct 2018, Paul Cercueil wrote:
> Le 3 oct. 2018 3:02 PM, Daniel Lezcano <daniel.lezcano@linaro.org> a écrit :
> > On 03/10/2018 14:51, Paul Cercueil wrote: 
> > > 
> > > Le 3 oct. 2018 2:47 PM, Daniel Lezcano <daniel.lezcano@linaro.org> a 
> > > écrit : 
> > >> 
> > >> On 03/10/2018 12:32, Paul Cercueil wrote: 
> > >>> 
> > >>> Le 1 oct. 2018 10:48, Daniel Lezcano <daniel.lezcano@linaro.org> 
> > >>> a écrit : 
> > >>>> 
> > >>>> On 31/07/2018 00:01, Paul Cercueil wrote: 
> > >>>> 
> > >>>> [ ... ] 

Paul,

I think there is something wrong with your mailer since your replies
are being scattered across my inbox un-threaded, making conversations
very difficult to follow.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
