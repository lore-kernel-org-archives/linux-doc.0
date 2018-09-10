Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4D317D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 10:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbeIJOzY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 10:55:24 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38638 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbeIJOzY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 10:55:24 -0400
Received: by mail-wr1-f68.google.com with SMTP id w11-v6so21245129wrc.5
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lIebOggwhmMubIlNRykvvJf2UmQO7I0eIn7QCn7KIt8=;
        b=IMWtHTaFYvipt/pY3LmOM1fFkTQv4vgxYn0QWcN0RVLstLwt6tovPYuTwwfjIqG9z8
         pZdkjV3n07nUGDB/SAzajbg21EyqRWQd82JIiRBJDXXpyUfQSzJUutc7/aICKv8lyRaa
         7DNz3S137h+w9AhJ3xzfFOIJsqnbegGGIbPBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lIebOggwhmMubIlNRykvvJf2UmQO7I0eIn7QCn7KIt8=;
        b=mM3NdWrJmWBtVnqei0D+r2PDJF8JJvDsxw7cgDB2n39JM/aAR7X4cO8BWWLowWpvCO
         wqY/BncWp88LuINS60if+YCJIxzeqQEeceomh/PzDtxtn9/EEIfkaMgon5SP8SapE1ZY
         sc3MsPqLjy4avf91GqrnOzffhwEpoHWCmqaxt/l6GBjimkQk2SNyRtO+9XTbMVgN2TX/
         fRsfQYsRc0v7eZ9WFkHiT7hgwwZH3ZGkCXRfm6GzBEU9MmMvnqjcr8sEDUHfgmeDpYq9
         yBDKtQLRzj6sbk+U/HGDKpL5d3D1UPJyOE33Lp57kV3tVdWhituzvNwCvNOu549IoXiR
         0TLA==
X-Gm-Message-State: APzg51B9KxRnnli02i1yQaTezJYxKpuE3Gf891q0xzAPmBFwWNOUVVJ0
        D/iSKjE2u3eLw+Pf9O6XtDPztE3HjE8=
X-Google-Smtp-Source: ANB0VdbnhNEcKL2Io8wJ0tKn/c5HxHcyEVBTwDKywH0b/LGZuhoqVqaTpvSnjk8j9uwkzYbTQyRERQ==
X-Received: by 2002:a5d:6984:: with SMTP id g4-v6mr14262846wru.232.1536573727239;
        Mon, 10 Sep 2018 03:02:07 -0700 (PDT)
Received: from [192.168.0.18] (cpc90716-aztw32-2-0-cust92.18-1.cable.virginm.net. [86.26.100.93])
        by smtp.googlemail.com with ESMTPSA id m68-v6sm30563645wmb.10.2018.09.10.03.02.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Sep 2018 03:02:06 -0700 (PDT)
Subject: Re: [PATCH v2 00/16] nvmem: rework of the subsystem for non-DT users
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180907100750.14564-1-brgl@bgdev.pl>
 <da9556fd-0022-8e6a-12b4-cc3babbae5b0@linaro.org>
 <CAMRc=MeT7UP57x+Q-a1ODRCvcGKKj_NSfkBLVQ9O5dhTC1DAYg@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <dec727cf-486f-8126-34f8-1b1099cec3a1@linaro.org>
Date:   Mon, 10 Sep 2018 11:02:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=MeT7UP57x+Q-a1ODRCvcGKKj_NSfkBLVQ9O5dhTC1DAYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 10/09/18 09:24, Bartosz Golaszewski wrote:
> The API changes change so many things, that these series would be
> incompatible. I can send the series separately but they would be
> co-dependent anyway. Does it sound good?

What am asking is to reorder the patches in a such a way that its easy 
to review.
ex: Order can be :
1> kref and update nvmem_unregister followed by the provider changes.
2> Add support to cell tables, cell lookup, notifier
3> general cleanup patches  followed by fixes

Current set seems to jump from one thing to other which makes it hard to 
follow and time consuming while review!


--srini

> 
> Bart
