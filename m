Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AE1717DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 19:18:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751884AbeDQTSI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 15:18:08 -0400
Received: from mail-ua0-f181.google.com ([209.85.217.181]:36725 "EHLO
        mail-ua0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751836AbeDQTSH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 15:18:07 -0400
Received: by mail-ua0-f181.google.com with SMTP id v4so13352676uaj.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=0Lb8PTwuV/17uB3KN4XP+n84Rf6yxD+e7keTnBw7O+I=;
        b=DBnR9q0m6L/Is2gZh/AfG+KoVjy9NCKZAMurXpIDLNcR6M1BUJtwPPhkJmoeycGWNo
         Jmcfhde848mku2owTIFEDNZzRy2HgDA82DyED9+UVJTz+GNMTyPet9b2aL4yYFFoWkZv
         zmK2kazVCmbiVH4CEGgW0c5biwoifmd+oQSKw3eAMy01zdx8r6w2yPeom3jQvWkO+8Mi
         WWQJrL+4KmsWEks4Z4g9IYjhObu/iavw5yrFLos1vLJH2aKCFC6pj2O9Igycs2Qk7LVq
         Gh4OX8Km9PetI5NOfuam7f3fP9ffvLJ0fUB7E+iIhCucn4ops+xmIyuJrqBHdLcyreub
         7YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=0Lb8PTwuV/17uB3KN4XP+n84Rf6yxD+e7keTnBw7O+I=;
        b=TTu0Y8X8inDnJ/wzYjzXB9chzm5JSHbSJFlTRDvbRuEjwFy6iyGSD7hQk/4bCj9R1M
         VP/oHRXUDGa0i8VaFl5LrBwX4NhVPxNT6zoHva772nUBw7g/WLYW6NDc78yuDuYluM/v
         Qgz9TXb/tuJsWngpZu5s3n11GyHuz+6MzUbawTJWda/jiNa4XjJt4UlCj2sXWq8504jE
         WD7euB3baxXkyReLXH9AizAHkFaYbOnW3KzzAkziqAwExBzWQ8RPlysngM3ZFiyO8XJo
         AXU/cf9TmyWDSSIYPAso0EGPMVYDLsH3z3Uftu6jHR/E/k4fxBpwJp06xTT5IvG/uENz
         aOlA==
X-Gm-Message-State: ALQs6tBUKMFj0cDytRCzJatLnAk5MG2VInC0eLxaQpt/N+8UJub9zw8W
        joQJdCkdm1uSgl/jFSiyssQ425R5L9AnYx32MKsSdQ==
X-Google-Smtp-Source: AIpwx4/Zrn6eNdZl/DnFOwwBK44LUgfb7CUeDNJejQfQxVuI4Y3vugg3J+htHRoL0fY6FOC2yRgBwHK8VQnwelz3avY=
X-Received: by 10.176.94.74 with SMTP id a10mr2342100uah.113.1523992686978;
 Tue, 17 Apr 2018 12:18:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.58.214 with HTTP; Tue, 17 Apr 2018 12:17:46 -0700 (PDT)
In-Reply-To: <20180414062718.3tbsdb6jhjurpfta@katana>
References: <20180412213342.138010-1-hansens@google.com> <20180412222457.x4jdwt27ylgi74o3@katana>
 <20180413141359.793919fb@endymion> <CAP9bUy7rONNHYeRkYtaWHcfqoZcGKXJz-JocED26zBj9n+-ZbQ@mail.gmail.com>
 <20180413204937.440437e9@endymion> <CAP9bUy6Hf+cQzAAckou3QPTk0mJM4xJ4xq-hf+RwyVmD3Le+qg@mail.gmail.com>
 <20180414062718.3tbsdb6jhjurpfta@katana>
From:   Sam Hansen <hansens@google.com>
Date:   Tue, 17 Apr 2018 12:17:46 -0700
Message-ID: <CAP9bUy6jiGpTGkRnUVM9mJO-pf=n=6AkSYLH_SiqOON4bG=WoQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/i2c: sync docs with current state of i2c-tools.
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 13, 2018 at 11:27 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> (also, did I send the v3 patch series threaded correctly?)
>
> Yes, that worked. Thanks!
>
> Things to improve there: I was both in To: and CC: field, so I got mails
> twice. Jean was missing completely.

Ah, thanks.  I had been using scripts/get_maintainer.pl to determine
the CC list, I'll make sure the right people are on the cc line in the
future.


>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
