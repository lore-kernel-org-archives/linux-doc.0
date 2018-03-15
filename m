Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SUSPICIOUS_RECIPS,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DDF437E677
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 09:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752006AbeCOJ44 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 05:56:56 -0400
Received: from mail-qk0-f195.google.com ([209.85.220.195]:39262 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbeCOJ4v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Mar 2018 05:56:51 -0400
Received: by mail-qk0-f195.google.com with SMTP id z197so6609657qkb.6;
        Thu, 15 Mar 2018 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=OMqd1VgrHvgbQQMrTrD8pBm+upCnCCpm4h7GlocNoeQ=;
        b=J/biB/E+Ufe9mvaK7LAzfwUV328z0+tjhYsqhI42As5sa2bI3k/eUVB27v1nPpS2jS
         eLTZscq32hZ07CgC7Wssod4eJc8Tz0UvPYYRF+leQVav6SU8+z7sSHeALkSWus5EFvkU
         j1baj6XgltksGVc/ObubLVLO/NeIUcQKWj9iEPCu2WQ+trDYId+mMcxvZ6l5EF9xhWBl
         3WkeqYqzWy8GWWixR0esuK6C3jsQnEuEXurgOQyY2tvHkAdjUJi6jZASkCuGqzmiVuSN
         xumEFDPVzpDewZAcmr6yyElkcLoGZLZ0xTOAIijMVVdc9kOx5xtN2XQAQq4EqcXR6XFN
         L32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=OMqd1VgrHvgbQQMrTrD8pBm+upCnCCpm4h7GlocNoeQ=;
        b=GfeTDuja2j3Vrbu88ol72NXtKfCVxpxwsaJlFutgaglzC+a3d8BJSAg9pZ/+QaFCFq
         Jjpa0RMzNIHaGxP6qQqggFUGo5mi2GXorTalvlAy3SW5/rWAHwNhSGY9ExbkdbuvN1wd
         JKyTeTIreMqxBO+k14ajz/zt4fbMEworUWccAbRnckUkpgtdCfYpQ2wR+bbDdX4eNyYu
         7oGcKetSLsJUYZdi4R9X2jX3cmAeVRAeM/86aCFZzwIUDwvudem7RxSeVx1oeMtSpxcD
         qMIdbfgr9/ApblS3NaccnBpi2uDtdPkHh1AZJSsLlFY7AD/4tLTzRfTWUYrN3wgIVS0C
         6n1g==
X-Gm-Message-State: AElRT7HKiIyq8qVoIcAdxwG05Q6R5zstKNU8sJMun9TQK2FT9Uy4QWf6
        rWkzwscQLP+8GYkbBF30paplQS5pQQoGwHmGTbk=
X-Google-Smtp-Source: AG47ELswYjAhiXg34Sb9tuRXoGn63tbMLVg8B5NYNvABxn25n8f3RUHd9c+29rzSwT5/1ttPND6moobWZ1l1mWZbaVU=
X-Received: by 10.55.158.137 with SMTP id h131mr6580425qke.330.1521107809219;
 Thu, 15 Mar 2018 02:56:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.185.46 with HTTP; Thu, 15 Mar 2018 02:56:48 -0700 (PDT)
In-Reply-To: <2929.1521106970@warthog.procyon.org.uk>
References: <20180314143529.1456168-1-arnd@arndb.de> <2929.1521106970@warthog.procyon.org.uk>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 15 Mar 2018 10:56:48 +0100
X-Google-Sender-Auth: X_UtdCeig7hSjC-Q8-nfY85dSAI
Message-ID: <CAK8P3a10hBz7QYk5v5MfhVMPOwFnWYTn95WZp1HtHrd7-GQpRg@mail.gmail.com>
Subject: Re: [PATCH 00/16] remove eight obsolete architectures
To:     David Howells <dhowells@redhat.com>
Cc:     linux-arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        IDE-ML <linux-ide@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi <linux-spi@vger.kernel.org>, linux-usb@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 15, 2018 at 10:42 AM, David Howells <dhowells@redhat.com> wrote:
> Do we have anything left that still implements NOMMU?

Yes, plenty. I was wondering the same thing, but it seems that the architectures
we remove are almost completely representative of what we support overall,
except that they are all not licensed to 3rd parties, unlike many of the ones we
keep.

I've made an overview of the remaining architectures for my own reference[1].
The remaining NOMMU architectures are:

- arch/arm has ARMv7-M (Cortex-M microcontroller), which is actually
gaining traction
- arch/sh has an open-source J2 core that was added not that long ago,
it seems to
  be the only SH compatible core that anyone is working on.
- arch/microblaze supports both MMU/NOMMU modes (most use an MMU)
- arch/m68k supports several NOMMU targets, both the coldfire SoCs and the
  classic processors
- c6x has no MMU

       Arnd

[1] https://docs.google.com/spreadsheets/d/1QxMvW5jpVG2jb4RM9CQQl27-wVpNYOa-_3K2RVKifb0
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
