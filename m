Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DAF837DE78
	for <lwn-linux-doc@archive.lwn.net>; Sat, 28 Apr 2018 21:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751475AbeD1VZW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 28 Apr 2018 17:25:22 -0400
Received: from mail-wr0-f174.google.com ([209.85.128.174]:44780 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751151AbeD1VZU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Apr 2018 17:25:20 -0400
Received: by mail-wr0-f174.google.com with SMTP id o15-v6so4746433wro.11;
        Sat, 28 Apr 2018 14:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=m61hR7gM6DBfl5no6flWHqdPGsfUaMoV6TpZ5/mE/as=;
        b=VyFJ0nMtat/MCZ4x5Dh2KaBgesYlOuUnH7RxcVZ2BFf7j8Tgyq2fFFQcmpCmcjhZVI
         tOuohsAUPDwx5vnPpvBwpA8jnPQJhVueV5r51XHtqmyBr65claMvST+i2o+a3wP8Zwym
         9d1t+IhqQljrAU/1ahD70+LX8u8GXyUKQJ/9u0TsWz7ubZ8DGbcKDDvvhyV7P/umDem5
         Txjz3Qvprqya4bRLiS8ziqrWfqmUUHDHvgIvnio0qPd5x+v2WYfC5zQivNMxO9pl23N7
         lb4aQY171LreqtwLa7AWFnmUUPh8XSXmOcOTnZEAothfRxpl14xejSnehMuf1RXHaOPj
         TbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=m61hR7gM6DBfl5no6flWHqdPGsfUaMoV6TpZ5/mE/as=;
        b=Vf7VVJrOlpGKqyGYCJQEhj0eW+F8AEgySKrBOTaGf/jhiEMOUo/ZL+dQr7z61AHzwc
         m8/etJbxgv3uT5jsLqiyQblsiBsNlfPKiz0CgRp3jL+8MyUIV9taiPNyi239hhkthBpX
         6XiwdDPH1zVVIdtIW5hXrc0uy6BEk2ahMF7KWEZgUq4LYHdEOATA9ZuWCi6otUFPhE13
         EgBp30y3sp4UrMdKV16HvhYN4VcZiWmQnUaugMpaMEBKdi0XtggNxL53EZqXbg6y344F
         oukwUdHKsTN2IspRdctU7Cq6SgecqlgFI7u8TSlOcPNWQ0bxtVYde8Pph47WSMpNS3J0
         +6lw==
X-Gm-Message-State: ALQs6tCmdNY0RPTsEsmU1unT3BDC2AlDjsSsprzoE+Xs6qxaFcqWbY+F
        izyZ0967ChGThMjh/4d2jc9Mbb4fI3JS20Ummnk=
X-Google-Smtp-Source: AB8JxZoowZCJd1lMYR7R/fp+rO6em8h2vF+ZwPUBFsgoLQHvJ+ypXGAuR0xcdpDVYd+s+XTLaSp9dk6cf3zHDvNU7Ls=
X-Received: by 2002:adf:ce8b:: with SMTP id r11-v6mr4615878wrn.242.1524950719024;
 Sat, 28 Apr 2018 14:25:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.78 with HTTP; Sat, 28 Apr 2018 14:25:17 -0700 (PDT)
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date:   Sat, 28 Apr 2018 23:25:17 +0200
Message-ID: <CACna6rz_Ms2Uv1P6E0gCGNsRwK4nm=PMAOaJ5Uk9aJxs2VSamQ@mail.gmail.com>
Subject: LICENSES: Missing ISC text & possibly a category ("Not recommended"
 vs. "Preferred licenses")
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        DOCUMENTATION <linux-doc@vger.kernel.org>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Andrew Morton <akpm@linuxfoundation.org>,
        Kate Stewart <kate@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Rob Herring <rob.herring@linaro.org>,
        Jonas Oberg <jonas@fsfe.org>, Joe Perches <joe@perches.com>,
        linux-xfs@vger.kernel.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Due to some maintainers *preferring* BSD-compatible license for DTS
files [0], I was writing mine using ISC. I had no very special reason
for it: I was choosing between BSD-2-Clause, MIT and ISC. I've chosen
ISC as I read about its "removal of language deemed unnecessary".

I took a moment to look at the new SPDX thing and noticed that:
1) File license-rules.rst provides "LICENSES/other/ISC" as an example
2) License file LICENSES/other/ISC doesn't exist
3) ISC is listed as an *example* under the "Not recommended licenses"

First of all, as ISC is used by some files in the Linux kernel, I
think it's worth adding to the LICENSE/*/ISC.

Secondly, it isn't 100% clear to me if ISC is preferred or not
recommended. File license-rules.rst suggests the later by listing it
as an example for "Not recommended". It's just an example though, so
I'm not 100% sure without seeing it in either: "preferred" or "other"
directories. Also if anyone finds it "Not recommended", can we get a
short explanation why is it so, please?

[0] https://lkml.org/lkml/2016/5/4/707

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
