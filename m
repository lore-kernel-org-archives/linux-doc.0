Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD1D07DE6E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 00:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753106AbeGCAiU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Jul 2018 20:38:20 -0400
Received: from mail-yw0-f195.google.com ([209.85.161.195]:44129 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752770AbeGCAiI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jul 2018 20:38:08 -0400
Received: by mail-yw0-f195.google.com with SMTP id k18-v6so73359ywm.11
        for <linux-doc@vger.kernel.org>; Mon, 02 Jul 2018 17:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Hn+/LDj3lvCMWDNOGaCKR8EwpywY5muhww9sg6Q27wY=;
        b=n2NoOr1pZHFq+QyCga8vsFcnaFRB13y0xwgMpcM7rcdzpGCAtcosXnjIweRWWWkwTr
         C4meNFIAVZ/9TKqDsW5DIZOd2xVh91bTyUbpWRcGHur/t0cP3orZDC+W0F7BCh7g+WRL
         +Z6chuiIVzI8zZWc7k1VfuUTjI3ChX0m/Ie24sMMJ7Ja4i8VXqbtOFq6ltw9lyNSYucn
         9N/DV7IrZZO6m/jHOU/2tbf9EfuC0NFZnOsoUw7/7I00HAkj6puUCvtPTpqcriDe4wb9
         MbaSS40JosSy6PYXZG+yIX1E3YRYOxeHTRWB579vy+5XEPf/5Yq/ivOc0X4h/VkL9+Vn
         rdaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=Hn+/LDj3lvCMWDNOGaCKR8EwpywY5muhww9sg6Q27wY=;
        b=BhPqNWwInt1UyXNMrqih6VWvoEvphUg9t8zt8u/PbRoHJvC5+k99t8UmOsRf37nZkL
         wl21W4aUIi0V6CuN2OKbXNcXBYLGXqVVDguLzoRnqXvrRqENVxOpCMKzOc+4erFbKYV7
         H6twYLIZE+ItSnd/eq2I+99DlFB2kjquFZ3yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=Hn+/LDj3lvCMWDNOGaCKR8EwpywY5muhww9sg6Q27wY=;
        b=goDiHEjOGlzRzvttNcwYHXN07Y6I749tD8D6Wx+LfKCG6JeJEHBe63WZcNKhflelKa
         gpPnxYV744zf4IronGLkSWgXFuipOaXesrQmS6QaJSIjAkbj7IE5RH2pffLJMEWcXk2c
         vsQ0+R20aDz/wl9dFiq8t8R0+fAlcnsKlqbgqda3DYPYTYAsGFAmb/lWY08R6mzcUGcw
         MwNsAYD0mjBbMYVJJvusGPxl8BuRipHcrBRnkqUEtYLG2tuSgT7q3y1AAB7fjFg5MgQA
         CFWwAc5cqvRwlMqxrmv5Wfuq7srYnHdkYBjHN8lGf15HkAwvq7RMzHqe9JbvGwjzsvX9
         oycg==
X-Gm-Message-State: APt69E2o1B1ALhovK08ZNkfjSRSVfPLPThbG5mna/UELW/lRSG9hKiHB
        OYSgiiqYw5m6W2x9vzwQQIxZ49VYkXUSPok8f1KzRA==
X-Google-Smtp-Source: AAOMgpdX4++2g0uBLd8k0aRfUKj8a7Ja7JyT3MTGlY9Zd566cezOrEkqqgRVqe2TabzFkah9MCEDT70tvkkHjgzUXQk=
X-Received: by 2002:a81:39d7:: with SMTP id g206-v6mr7074804ywa.416.1530578286868;
 Mon, 02 Jul 2018 17:38:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:5f51:0:0:0:0:0 with HTTP; Mon, 2 Jul 2018 17:38:06 -0700 (PDT)
In-Reply-To: <20180703002826.GB2438@bombadil.infradead.org>
References: <20180703000907.GA27014@beast> <20180703002826.GB2438@bombadil.infradead.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 2 Jul 2018 17:38:06 -0700
X-Google-Sender-Auth: lBzZJrdDSc5YLh7UhgI8hx7G2rs
Message-ID: <CAGXu5jK7eKqTyto+PQmfd6uOxHRJK+LdD2cVxemVHE0PjE-0hQ@mail.gmail.com>
Subject: Re: [PATCH] kernel.h: Documentation for roundup() vs round_up()
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 2, 2018 at 5:28 PM, Matthew Wilcox <willy@infradead.org> wrote:
> On Mon, Jul 02, 2018 at 05:09:07PM -0700, Kees Cook wrote:
>> + * The `const' hereprevents gcc-3.3 from calling __divdi3
>
> missing space

Argh, thanks!

-Kees

-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
