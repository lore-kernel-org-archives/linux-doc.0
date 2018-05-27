Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7AB867D048
	for <lwn-linux-doc@archive.lwn.net>; Sun, 27 May 2018 05:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932215AbeE0Fs6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 27 May 2018 01:48:58 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:45741 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932115AbeE0Fs6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 May 2018 01:48:58 -0400
Received: by mail-wr0-f196.google.com with SMTP id w3-v6so15246948wrl.12;
        Sat, 26 May 2018 22:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5l2vbn1yh904MRUj7XM17p3BQEaFfEwWvgXCyOf4+J8=;
        b=E/oEkgczoZKm0WXazlrbEcIcO44vH7VO7tpeRMb3Bf15EmDQDG8zogQk1gBsV/EZbc
         dXDE0+8D9LGEpZHAhA71UMZYL17dNBuwMMj3HX++YJNXR+elHMSU0iJorDU/dbbGKu37
         AagG2nZ1t010mKjqpc7WlcwnNvQjPESxIJaM4bCM08gp0wJYK+RtYCOKExx/boevx1HF
         3cr1Vr2LHWaCnVpc+FqjrG65mGOPQJ+NkWr8HmSS4xox7Hi4d5Xp5RB9j6wWwM5KStiU
         /glg/vxj+Lzf18BWi8ggLfrVZ67qY0ujICe63jQnmQqvZayVmuS05dWNMc6ykHV/XhNH
         UwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5l2vbn1yh904MRUj7XM17p3BQEaFfEwWvgXCyOf4+J8=;
        b=Xygp5putE/fawZx6vbRx2q10fploZ/n30oTj5oKjBvD54YQ0Fwh5E7XyU2m4eUqREu
         o/Bjoa0pncCVuR3ZhjpP3zCVM2nfnhvNuKCb/YZuIJgQyoKXz7oYa05nfEfj0ZuHs5JY
         mhAsabHjjgM/xpwMWN0o0ddgh3S664KKmOfj6bOCZUI1f05aXPCHa9l/6LabpV4uKov2
         saGDSeIYDD0PEgKK6IJ7BYo9w6kujLH/taDtyWCp0uTA45iYC4Tpv7OhXixpoXn5vUdx
         lDmujRqaH0jsdfQoQriO5yKjXCQCqRmStW9Ihny7mzTsJN6J9Qc7gaLrXfgRNN5mUvEQ
         YyaQ==
X-Gm-Message-State: ALKqPwf6k8g4BocdctCaxnJWfB8J2rqZM2Cf5/t5Q9gr+qWNcUdg2JD9
        mE9oHIiqMGbUzL5ddy9zBN4=
X-Google-Smtp-Source: ADUXVKILeVubCUlrwsywHZ00DdFe9IrfJRVmTszoGiJgkvzKHkM3i3OJ9X505kasiIbzzbLxZ5+YWg==
X-Received: by 2002:a19:9358:: with SMTP id v85-v6mr4628762lfd.83.1527400136645;
        Sat, 26 May 2018 22:48:56 -0700 (PDT)
Received: from gmail.com (c-2ec25c74-74736162.cust.telenor.se. [46.194.92.116])
        by smtp.gmail.com with ESMTPSA id n26-v6sm5829748lfe.61.2018.05.26.22.48.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 May 2018 22:48:55 -0700 (PDT)
Date:   Sun, 27 May 2018 07:48:47 +0200
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Felipe Balbi <balbi@kernel.org>,
        davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: gadget: ccid: add support for USB CCID Gadget
 Device
Message-ID: <20180527054847.GB22105@gmail.com>
References: <20180526203401.16586-1-marcus.folkesson@gmail.com>
 <20180526205652.GA25534@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180526205652.GA25534@kroah.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 26, 2018 at 10:56:52PM +0200, Greg Kroah-Hartman wrote:
> On Sat, May 26, 2018 at 10:33:59PM +0200, Marcus Folkesson wrote:
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> 
> I can't take patches without any changelog text.  And why would you
> submit a patch over 1000 lines without any?

I'm sorry, obviously not much went well for me yesterday.
The changlelog was "fixup:ed" away and now I noticed that my
patch version history did not follow for v2.

Is it better to send a v3 with updated version history or wait for more
comments?

I'll start review my patches better before sending them.
Thank you for your time and comments.

> 
> Please fix.
> 
> thanks,
> 
> greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
