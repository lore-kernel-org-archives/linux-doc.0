Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0EC177D0DA
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 03:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751907AbeCWDXX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Mar 2018 23:23:23 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:52010 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751888AbeCWDXW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Mar 2018 23:23:22 -0400
Received: by mail-it0-f68.google.com with SMTP id j137-v6so905214ita.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Mar 2018 20:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FeJmfdD/0RecqOwVOLsao61ZJInl07JtRh32f9b2foE=;
        b=k3eqHJq7ACYqZiejtFL4ggcNJVOzHpPHaZSFCE+lD+/dk4iRPoRk4ng/vEzU5rtCu6
         CTTps3j8/IacKUl58IHUG2l/Cw+A7IFk9afeurVKsWLdxhV6k6d7im1PhT6UTbL042hR
         oBy8oxJyRnwPf8i+kZSY89CUqodO6YwCWMXPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FeJmfdD/0RecqOwVOLsao61ZJInl07JtRh32f9b2foE=;
        b=ZAbEcf1vjA6mRHGeW1jlF3H2vkAgXCXul5RfQyKPXGqzDqpoYDEPyLeg8glzMF1DIm
         hDppmYpnWVHrUgsBthOHFaAzwWs94CPXprpvsAfi0cSImPMx2Rx71OJPa0nauyS+W8dU
         HsKpX/sg6cFIeYtWBND3K6IwNzfFcv0HeWP19FsiYZQLkCcm/B5zDi6TZDePkr+QO5SK
         VIaeX4jfn6+kYtwcbl3jLMZY/SWz79ysZqZE7MpdsHFrzYWlVjLCD/hpnUs+lqsr3/QR
         iAn0IA4pQKiZGxb0c6ixC8XAu8BPrd2usp9ifST291b6L+5YNrweFTsCGbIEOaduYIIL
         rLWw==
X-Gm-Message-State: AElRT7GP0ogGmj7ZBsy5e9rB3BIr/RNtoUScWRHeiK5d0D+ELPwH7Ik6
        ZTDeua630h1NKOuPN16J+u4+NxClowO105VKfHRUvA==
X-Google-Smtp-Source: AG47ELtA7CdJ1x5rYULMujuOJLXrt/+nbXdwvIZ3c31qd2jc4xRtSZfBIE8iI0YjWATgXjrw7voW3eUZS2lWE5cafRA=
X-Received: by 2002:a24:730e:: with SMTP id y14-v6mr11398381itb.70.1521775402057;
 Thu, 22 Mar 2018 20:23:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.207.141 with HTTP; Thu, 22 Mar 2018 20:23:21 -0700 (PDT)
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Mar 2018 04:23:21 +0100
Message-ID: <CACRpkdaCn2OnOW7GsiqeUffw4ajBo+Tw31KUyRcuLWvxx271sA@mail.gmail.com>
Subject: Re: [PATCH 0/8] Move most GPIO documentation to driver-api/gpio/ and ReST
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 9, 2018 at 12:40 AM, Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Jonathan Neusch=C3=A4fer (8):
>   MAINTAINERS: GPIO: Add Documentation/driver-api/gpio/
>   Documentation: driver-api: Move gpio.rst to gpio/index.rst
>   Documentation: gpio: Move introduction to driver-api
>   Documentation: gpio: Move driver documentation to driver-api
>   Documentation: gpio: Move legacy documentation to driver-api
>   Documentation: gpio: Move gpiod_* consumer documentation to driver-api
>   Documentation: gpio: Move GPIO mapping documentation to driver-api
>   Documentation: gpio: Move drivers-on-gpio.txt to driver-api

I applied all 8 patches to devel for v4.17.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
