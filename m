Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ACF617DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 18:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752159AbeDRSSS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 14:18:18 -0400
Received: from mail-vk0-f49.google.com ([209.85.213.49]:40745 "EHLO
        mail-vk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752280AbeDRSSQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 14:18:16 -0400
Received: by mail-vk0-f49.google.com with SMTP id x204so1625692vkd.7
        for <linux-doc@vger.kernel.org>; Wed, 18 Apr 2018 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=AMfl0jeHqjgEQsrdyrTbPtGoJzBV2lEoGwhz9jf4pQ8=;
        b=HIYhhZWnF4usJAPR0Ra4WxnlIjeRHlEv4wy+3LvKaNR3hgfjm0DnqAWYD4i4HSud8j
         2+pkFqLjfclB6686eJLyw0QnOQsLHiN/f/Zb2pmKiLlD6XLO/6HLH8uMyD0uTfEUoBU7
         rWiJ07WdsUWtYVKoQJu4HLv24wvAtNa8dJu5S2Xk3W0dToEmqaxw22XigPTujuowZxUn
         h8wDt1ZF7lw3q7HwutxNdty5NFUja/S7wf0zWNBLkn/xUVv0DRBFJBCCKWL9PswQ1prP
         VayEDQ88nBP/1g9ItDqQc7BFj5O3LDTk6p8TLH6jOVtlB/II2L6ZBUMeF1ipY3kC5YUa
         KbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=AMfl0jeHqjgEQsrdyrTbPtGoJzBV2lEoGwhz9jf4pQ8=;
        b=UvIhxe8b7xWX9B502gc/+n2KGp1snTgBNnScKmOwQq0ZpkOsINDzZvzZ1XB8fmKlmH
         w5kMhOvctAseKm5GK0/ihi6H5KCua5SEfIFF1B4Z3g5QxJZJAO55EJY1WCwFc8Woo3dJ
         T0lNisxE2lOtwisHWlDbNuGxqfhn7VtO78mumAwtMseNsba78ojgEV9JpjnqV/4KEfbJ
         sJYDu8Oeok365JcbmCSxBAwKKIPgaX7ay39m8t/qrSOvwdCoAAC/qj/CiR3In9KbCbKW
         3xOmSRdQYkP95n0wfVaE4CsKQv6qbBmfi4Uqsd3M/h303b1T1pQul9TpXHggPDL3DjhY
         ixUw==
X-Gm-Message-State: ALQs6tAgNvT7zsCylRfwUNc7t3oC0KRpIobwIy8+hoPDpy4djT5RgsWe
        OA+2i0iIihI1L9++8e3oKFy42Xt/MXwWoeAd6kUTHg==
X-Google-Smtp-Source: AIpwx483Iky2AaeSk6oe38/1138mWCTpGGqK4E9rBxp1l1iTFNA0zvAamBPz13Q+1UYHOO8JtYv6LozOFjVG6L8dhpE=
X-Received: by 10.31.60.209 with SMTP id j200mr2232269vka.93.1524075495873;
 Wed, 18 Apr 2018 11:18:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.58.214 with HTTP; Wed, 18 Apr 2018 11:17:55 -0700 (PDT)
In-Reply-To: <20180418082130.5oqgy7xsja5qucov@ninjato>
References: <20180413174257.139182-1-hansens@google.com> <20180413174257.139182-2-hansens@google.com>
 <20180418082130.5oqgy7xsja5qucov@ninjato>
From:   Sam Hansen <hansens@google.com>
Date:   Wed, 18 Apr 2018 11:17:55 -0700
Message-ID: <CAP9bUy4vZB1LVjLdm7WvrebBF4tSB32WjC+h0PEoyaCFjdfhUg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Documentation/i2c: sync docs with current state of i2c-tools
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 18, 2018 at 1:21 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> +The above functions are made available by linking against the libi2c library,
>> +which is provided by the i2c-tools project.  See:
>> +https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/.
>
> In the beginning, we say that '#include <i2c/smbus.h>' is needed.
> Shouldn't we mention i2c-tools there already and in what case it is
> needed (only for SMBus)? I'd think so.
>
> Sam, would you be open to do this as an incremental patch?

Yup, I'll send an incremental patch touching this up, thanks.

>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
