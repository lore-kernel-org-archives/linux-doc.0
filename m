Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CA0B77E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 22:32:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750869AbeCHWch (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 17:32:37 -0500
Received: from mail-pg0-f67.google.com ([74.125.83.67]:41712 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbeCHWcf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Mar 2018 17:32:35 -0500
Received: by mail-pg0-f67.google.com with SMTP id s15so166351pgv.8
        for <linux-doc@vger.kernel.org>; Thu, 08 Mar 2018 14:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:to:from:in-reply-to:cc
         :references:message-id:user-agent:subject:date;
        bh=9tDgFtKFn0yZAeoviy+kUQsroU/qa/D/F6PHqd+hixs=;
        b=PpFTjmK95GNMKFM2XjVFcFuconfP3IPZ8KBtjvDewBlpSQldYE17FRgKCpgrkrEC91
         9nSvY+a5woa5+Cn/hXj78kzHf0e6pVb23M+naomca9IJYlAkIWy7BcibfsHLmGQyxsS9
         6SIPvo6ixFaOIZrz10FzMj1zeWsgycQthBl5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:to:from
         :in-reply-to:cc:references:message-id:user-agent:subject:date;
        bh=9tDgFtKFn0yZAeoviy+kUQsroU/qa/D/F6PHqd+hixs=;
        b=bCT2609d+ZRFo1tuAt7P7tkkuWegwdSRbhO5NI7nJTx4zofmgAIg1g4EAz+wje0B/y
         BkcCw2E8ht6nTA20sb4FUp0WstcpAfHrmLBeFByuJnAiNkY5yMPz2ESAO61Hj95HaE4u
         nDC0VDWWEi55YOoRICkWC4VU7HI5YnzS/CQUqL8UvvoiP5P3pHhnZxMpNO/X69GsLU61
         nkYyvrLXSM8zB+Ir2vSjctEKzoxh27L9UzMYTC35eM1EPE6n0jE2rX4xfgj8+5hWbprS
         6OgMEy/lXhjUAFvlnFfwEVfYIaAR1Pr2cAvXfmxSL78EZlIEJFvY/4G3lyTiArKxtPk/
         vygw==
X-Gm-Message-State: APf1xPD9Ls3QA3vhQk9iHwtlHeNybEmvxsDpZt6kIRj7W1EzlbMNwZ8d
        Tw0JZWBsWoAG0DdEmCTT+VJGXg==
X-Google-Smtp-Source: AG47ELtVR0r1ElSmOOyxwAZjFmH/2C4BC49A0IpGHS1O7UA1OZAdXaGuy1DUEUeYeQckE7KYpFwJ6g==
X-Received: by 10.101.102.21 with SMTP id w21mr23082579pgv.247.1520548354454;
        Thu, 08 Mar 2018 14:32:34 -0800 (PST)
Received: from localhost ([2620:0:1000:1501:422f:ca5c:71a2:c3b3])
        by smtp.gmail.com with ESMTPSA id h15sm39048783pfi.56.2018.03.08.14.32.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Mar 2018 14:32:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Karthik Ramasubramanian <kramasub@codeaurora.org>,
        andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de
From:   Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <d8089e60-9344-8a7e-502d-3e04e357811b@codeaurora.org>
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        evgreen@chromium.org, acourbot@chromium.org,
        Girish Mahadevan <girishm@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Doug Anderson <dianders@google.com>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-5-git-send-email-kramasub@codeaurora.org>
 <152002870571.108663.443363731684218377@swboyd.mtv.corp.google.com>
 <f900dc96-0150-079d-bcd6-9d2e05f8fde1@codeaurora.org>
 <152037270430.218381.11080419743809466427@swboyd.mtv.corp.google.com>
 <d8089e60-9344-8a7e-502d-3e04e357811b@codeaurora.org>
Message-ID: <152054835314.219802.7795128053459733073@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v3 4/4] tty: serial: msm_geni_serial: Add serial driver support
 for GENI based QUP
Date:   Thu, 08 Mar 2018 14:32:33 -0800
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Karthik Ramasubramanian (2018-03-07 22:06:29)
> =

> =

> On 3/6/2018 2:45 PM, Stephen Boyd wrote:
> > Quoting Karthik Ramasubramanian (2018-03-05 16:51:23)
> >> On 3/2/2018 3:11 PM, Stephen Boyd wrote:
> > =

> > Ok. I've seen similar designs in some mmc drivers. For example, you can
> > look at drivers/mmc/host/meson-gx-mmc.c and see that they register a
> > clk_ops and then just start using that clk directly from the driver.
> > There are also some helper functions for dividers that would hopefully
> > make the job of calculating the best divider easier.
> Thanks for the pointers. I will take a look at it. In the meanwhile I =

> had discussions with our clock team. They pointed out that the register =

> to write the divider value here is outside the scope of clock controller =

> which makes it trickier to implement your suggestion. They are already =

> in the mailing list and we will discuss further and get back to you in =

> this regard.

Ok. Let me know if I can help answer any questions.

> >>>
> >>> Why are these noirq variants? Please add a comment.
> >> The intention is to enable the console UART port usage as late as
> >> possible in the suspend cycle. Hence noirq variants. I will add this as
> >> a comment. Please let me know if the usage does not match the intentio=
n.
> > =

> > Hm.. Does no_console_suspend not work? Or not work well enough?
> It works. When console suspend is disabled, the suspend operation does =

> not get triggered and the resume operation checks if the console suspend =

> is disabled and performs the needed thing.

Ok so then do we need the noirq variants? Or console suspend is special
enough for this to not matter?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
