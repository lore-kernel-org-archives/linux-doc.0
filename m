Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 309C87E653
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Mar 2018 13:19:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753542AbeCFNT2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 08:19:28 -0500
Received: from mail-io0-f194.google.com ([209.85.223.194]:35127 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751835AbeCFNTY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Mar 2018 08:19:24 -0500
Received: by mail-io0-f194.google.com with SMTP id 30so22012312iog.2;
        Tue, 06 Mar 2018 05:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=X1GqLJSs70mU+Hi0nCNtIWkAnuFR5UYUEq2exZOJtPA=;
        b=rMZf7X2c9+voEskv2XI45zwW9jaDiBVOefP9ltl5jnCUbBA/oi5vdyS0nyWcaO8M72
         OiglGufzjWoDtOVRs55lQ0DsbfPig1mqaxxrDxJX+RL5ihb7AIi2Ylv/BpftwWlAjMi5
         b4Y0Rn9C0WV55PUzsqqPLmjraAj/sXPPBqnP1Dze/pTmgKIhd7QyjZGAAmTz+QLEFCmb
         mWxcoQH5ERTPrUGkHbtvUtymdxKYNp1LIphYlJeEisFlAmU2BHUe6fipW91rzht4yUGZ
         4KGIQu28cV543Mlhi/zjE5v/UyS4KJMrTPS85j4dYOxJLA1/m5mBdM3oP5oEqoUyKowc
         EnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=X1GqLJSs70mU+Hi0nCNtIWkAnuFR5UYUEq2exZOJtPA=;
        b=MmQOsaX7BVhaEi1KQkZp1zl9GyZQJqR0f9sOaZXwSDVep0S9CQINZOroEHSKQIjD6+
         tHDIi28EigGorYLNMglac7vUpRNz6RHerlqD53Y+oV6Q65bmL1txpE9FyjTX7CF12iLC
         hhsiNpfWD0lpb0sAyx7zp2+Pah/2YllMGW4TGIlctINWC47W+4k8mMTrIJfUWDG/dpFK
         sOZUSFZ/ixcB6EwN5xKZ8BePcJyIWQzCDgKx09NdbUTrQf6LJQHDNYrw4Onxn5bKyG8G
         njxQLhnCyu8hkg442qbCQ4xP8M1gxnl+3XoI2lHzeftMyTNhsG/BUYPULvrkPskTr6jq
         4WTA==
X-Gm-Message-State: AElRT7FFT3zKYh/k8kUnktJOxZCKitLkBkBMDyQPkOA0vpclGAryR3Rb
        sBZSnWImNSndv/q8FieFHuT0RtlNoK54h859uyU=
X-Google-Smtp-Source: AG47ELsf27hNfo36p0U4aS7dNaWzr9ZebAUD/lJS5I3YZJeOPCb6zk2KVAlNLA8n8bBIFlaxtxI5oTazWmGqLeBElwc=
X-Received: by 10.107.97.21 with SMTP id v21mr20881266iob.22.1520342363331;
 Tue, 06 Mar 2018 05:19:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.34.71 with HTTP; Tue, 6 Mar 2018 05:19:22 -0800 (PST)
In-Reply-To: <20180306130551.GA16061@amd>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com> <20180306124002.GA13950@amd>
 <20180306125416.GD26143@lunn.ch> <20180306130551.GA16061@amd>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 6 Mar 2018 14:19:22 +0100
X-Google-Sender-Auth: EEox9t7UDbbxxPcc3i00QRynH-U
Message-ID: <CAK8P3a2VvaFMO6jsx09ukN+=tj7sRZ9mkYGcSRiO1Fe6==sJ9A@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        gregkh <gregkh@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 6, 2018 at 2:05 PM, Pavel Machek <pavel@ucw.cz> wrote:
> On Tue 2018-03-06 13:54:16, Andrew Lunn wrote:
>> On Tue, Mar 06, 2018 at 01:40:02PM +0100, Pavel Machek wrote:
>> > Hi!
>> >
>> > > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> > > ---
>> > >  .../devicetree/bindings/peci/peci-aspeed.txt       | 73 ++++++++++++++++++++++
>> > >  1 file changed, 73 insertions(+)
>> > >  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.txt
>> > >
>> > > diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
>> > > new file mode 100644
>> > > index 000000000000..8a86f346d550
>> > > --- /dev/null
>> > > +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
>> > > @@ -0,0 +1,73 @@
>> > > +Device tree configuration for PECI buses on the AST24XX and AST25XX SoCs.
>> >
>> > Are these SoCs x86-based?
>>
>> ARM, as far as i can tell. If i get the architecture correct, these
>> are BMC, Board Management Controllers, looking after the main x86 CPU,
>> stopping it overheating, controlling the power supplies, remote
>> management, etc.
>
> Ok, so with x86 machine, I get arm-based one for free. I get it. Is
> user able to run his own kernel on the arm system, or is it locked
> down, TiVo style?

In the past, they were all locked down, the team submitting those
patches in working on changing that. Have a look for OpenBMC.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
