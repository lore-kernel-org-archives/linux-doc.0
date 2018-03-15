Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BDC0C7E677
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 09:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751362AbeCOJsk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 05:48:40 -0400
Received: from mail-qk0-f195.google.com ([209.85.220.195]:43330 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751414AbeCOJsh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Mar 2018 05:48:37 -0400
Received: by mail-qk0-f195.google.com with SMTP id g184so6572663qkd.10;
        Thu, 15 Mar 2018 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=2Yz6CEXLNyz7elr7lDshIuzRDDa5vZpJ+Rr2xz33sM0=;
        b=F/O7PeLdTzbjx3igeyHJdpfyvliopGHr5blY93X3Qe+EilyNwJRPm6SHxKR6LQoppm
         2j22zn+hot5sFNCYw8T8Lygl9InNi+Gbuy/pEoLCdhsv2M+iTuAJnVMSCOwSMnYxMwz+
         928QngnGuHOPDcYdeive4ydEIQiIly6FCBWW4D3zdx8qnbO3SKcwnDrGb96c1eXiDUnn
         uB2RuAMh4/8l/r4aj9sr7ykkA3vLp5Pd8e40U+HOqsPB0dqBgsp/ZkkwRgXhmRSqSsF5
         qeA00qi6vPu9H3VstSl/SuMIf0pHJ0GSW066O2BfhR3wBm0GI8cO4nw73mmktuR0IaUr
         E08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=2Yz6CEXLNyz7elr7lDshIuzRDDa5vZpJ+Rr2xz33sM0=;
        b=PONKmPbS5uimBHVC8ytLzwaPNDzKu0GUpyvqX8IziJRXcNLX9YuGW3Isk3ooyZqJ8k
         mh+vZ35SMV7q3OAm7O0T7oywjfK6UT9AIPJEE6jYOaPYMIZgyjOtk8wMPOIf2QfPJncb
         0kMND1Aesa/frzP0kyUu1FhSALTxzqib1dbSLKc+l72q6oEf5wrWEgHh7aGmCyAwj29n
         WJO+Ro4gA4gl8lt58m7WoK2x4OE9qksGQAtOJvCNIGHPnmKM/gc7RbnAbkqMrHTHa++U
         yNuXfMLSJ1Lgldy4HA8xbo9FYrFhSAZndtkVTFknkuR99FwkYbI9zhVtkCyRr3OkzT6u
         jqyw==
X-Gm-Message-State: AElRT7FiEdjtlxccRNKGas2vSrHt+ep1b804qocuf3ExlbQ2eMBET4go
        AdTYW+wyI7/uCtX/XAV5FVCeIMma8qYJfmnRuU8=
X-Google-Smtp-Source: AG47ELv+hkVRhj+NMNBXRSc35dUOaBjhslYXYvHRFsKoGslcM1rZAR4szPmPstC4LhAsN3DtR4FNCeAYGbasA/zDn/8=
X-Received: by 10.55.10.6 with SMTP id 6mr11384801qkk.271.1521107316023; Thu,
 15 Mar 2018 02:48:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.54.147 with HTTP; Thu, 15 Mar 2018 02:48:35 -0700 (PDT)
In-Reply-To: <2929.1521106970@warthog.procyon.org.uk>
References: <20180314143529.1456168-1-arnd@arndb.de> <2929.1521106970@warthog.procyon.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Mar 2018 10:48:35 +0100
X-Google-Sender-Auth: wfkVA4yjUUZDS8md0ats96AbnyQ
Message-ID: <CAMuHMdXcxuzCOnFCNm4NXDv-wfYJDO5GQpB_ECu7j=2BjMhNpA@mail.gmail.com>
Subject: Re: [PATCH 00/16] remove eight obsolete architectures
To:     David Howells <dhowells@redhat.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-block@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
        netdev <netdev@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        linux-rtc@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi David,

On Thu, Mar 15, 2018 at 10:42 AM, David Howells <dhowells@redhat.com> wrote:
> Do we have anything left that still implements NOMMU?

Sure: arm, c6x, m68k, microblaze, and  sh.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
