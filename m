Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 571197DF92
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 15:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933342AbeEWPOI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 11:14:08 -0400
Received: from mail-vk0-f68.google.com ([209.85.213.68]:40394 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933495AbeEWPOC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 11:14:02 -0400
Received: by mail-vk0-f68.google.com with SMTP id e67-v6so13344938vke.7
        for <linux-doc@vger.kernel.org>; Wed, 23 May 2018 08:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=MOapYNVlHrkzrYuOrNJKxvgQr+d/Liqi73u1iDMLVC0=;
        b=rFTx04wtw+NOV9Rm7yfXw8ypG/j6AQmrfiQ2mA3FrkDPIvmvxnAqZrlUcwvtou6OIn
         fn4j0qR7mOddvVWlrViFWFtuITsLEMwBVt05MjEvWD+qBhfKvzG5sbUwXxIPJ5kJTQNA
         IiNs4DNOphDFHSuAEr0y975hU2DRty6IJ9WH65An4kkCPSdVY5Nz1KFcmpSFUsRcEjEU
         nfUz8I7KMOzqJ/+Ya9+aaqCOFP8M0EuGly8KVDujbM8L+ta67K28zTrxYRd9/KGA4470
         XjXLLPf+FXMvIsjluh3/+8O1FU8fUsobXi9jM0jqXLIBjCQ5YblTaBROTmq4EFnA+B3a
         W7WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=MOapYNVlHrkzrYuOrNJKxvgQr+d/Liqi73u1iDMLVC0=;
        b=HBc/SJoiKwmu7Le9i+DZSzG3SDET4CVc5MGkQcw/trypapG6tIu5QqHG34zMqK5Wxm
         e4RF0TZKVzLgTC8tI99OjmEK7cAM2T551hn1sOa6zdGolC1lqUJKSRRX6lfPqRPX2A64
         4jD5ZEaNsW36KpWwRAzzojIx3ihaCuzWr8O6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=MOapYNVlHrkzrYuOrNJKxvgQr+d/Liqi73u1iDMLVC0=;
        b=Ibs1W/kEVqxyfqBorbhMWxmva0eQQoXpX/qft+2WcebBKXeCRBxSlRacwUDknTob/s
         nNYAc9BMxL2lBVBXxD0r47uCwg/U3qt/ADazdsDSdXGPacqAVb7UT/S4vV49JRsDgush
         5mZobyXDwJk4UXZHxzjAmW/2bUeGNs3FbSR1X0u/FhlcDbq8L4oeEO1alZAM6hSqzA5C
         +WNq+4b/uzPf67y4Qjg0G+ut4Vo9E1xtZgDhXYN72TnRDrEYrN7k5bHL5QZ6eUsc5Bfs
         KXgZl+XXh2Vzlut594IjuoMXh38kbt+AuLm+OfIjPj84rmtdu/zY3XzXvihbWBE6ZsZd
         /AQQ==
X-Gm-Message-State: ALKqPweypxDJrB7a32bVJtNzYh4HFnNHNX6LCa16iuKIH8NJxxHBrNDa
        T17O+WKd9Q2x2PGS97dGDdRzCil6ir08PN8zU2APEQ==
X-Google-Smtp-Source: AB8JxZrSS163Gr5WX0Yap6Wlscbl4HeMabd25Jm/MEMsYgX54yTSu6KdORdrWzQ/GdQn+6QXWmCOddd+ZiSb752y+4Q=
X-Received: by 2002:a1f:1957:: with SMTP id 84-v6mr2065444vkz.90.1527088440510;
 Wed, 23 May 2018 08:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:3052:0:0:0:0:0 with HTTP; Wed, 23 May 2018 08:13:59
 -0700 (PDT)
In-Reply-To: <ebe4515d-a26f-a825-0353-666b0b5ad9f5@codeaurora.org>
References: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org>
 <1522429700-13083-5-git-send-email-kramasub@codeaurora.org> <ebe4515d-a26f-a825-0353-666b0b5ad9f5@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 23 May 2018 08:13:59 -0700
X-Google-Sender-Auth: pX-cHW-K1C3Q5dMeffo1-bGBbeo
Message-ID: <CAD=FV=WwVjMKDoL29fqdzSmi5SRQOxk_mV2=7br8HUK_hUc+XQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] arm64: dts: sdm845: Add serial console support
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Evan Green <evgreen@chromium.org>,
        acourbot@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rajendra,

On Tue, May 22, 2018 at 11:30 PM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
> On 03/30/2018 10:38 PM, Karthikeyan Ramasubramanian wrote:
>> From: Rajendra Nayak <rnayak@codeaurora.org>
>>
>> Add the qup uart node and geni se instance needed to
>> support the serial console on the MTP.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> ---
>
> Andy, is it possible to pull this one in for 4.18?
> Sorry, I only realized we somehow missed this after looking at your pull request.
>
> This is the only patch that prevents linux-next from booting up my sdm845 MTP
> to a minimal console shell.

It was in Andy's tree but then got dropped.  Unfortunately the clock
bindings didn't land early enough so it's a bit difficult to land any
device tree changes that use the clock bindings until the next kernel
revision...

-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
