Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 45C957D0DA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 07:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751903AbeCTHpL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 03:45:11 -0400
Received: from mail-pg0-f42.google.com ([74.125.83.42]:40255 "EHLO
        mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751909AbeCTHpI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 03:45:08 -0400
Received: by mail-pg0-f42.google.com with SMTP id g8so325725pgv.7
        for <linux-doc@vger.kernel.org>; Tue, 20 Mar 2018 00:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:to:from:in-reply-to:cc
         :references:message-id:user-agent:subject:date;
        bh=10XS2adx7XwRRK3frrYW9+UwyKAS4gMwMGx0tqI+xdU=;
        b=U9SMCtb9x6aqQH6Sk4yu5L094CCYnMAO7/kv5DDWR9Xk4A0+gfyIGtjYLoEp5DLJQg
         v9otmPQX9dE6i/mOM2au4QgAz/DBJaWb5+VVm0pmmWHOdBZ+7TjvIh67ja5OQwW2hZ8O
         SsRM/6oRo7Nv7oOCtJSlUETG/L+Lz+8euiP14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:to:from
         :in-reply-to:cc:references:message-id:user-agent:subject:date;
        bh=10XS2adx7XwRRK3frrYW9+UwyKAS4gMwMGx0tqI+xdU=;
        b=oudo3HgUxKDGGVK/AJl+F4HzRuPfVR+AUXkAoL+37YPjjzS2fnV5OiOtLzbnpp3s7K
         AqMVCjKV3+xzUOLjSq5BvoC5hqD722YlvUia0SURAkhQ/MILVhuvPH5wy7qVkGq977ZF
         CxbWIuL8AzntnxcZtUV8hwqvizpU47NIBUDcjy/vSM6FTqgxtNiee0QztNgnCiAziohp
         q2FZsmEptbBxHqtc6MHps2h5zn+Cq3TzlRdat9AMhzkfSZ5+PeLwVuzhCzo9ttpwgzMK
         M+XkNgLOAuhZ+L/mcvjguJDZYy20dKL3bptnzrfqXfFUQQ6aGINjt9uwzLLb9KKTs0Wj
         q/nA==
X-Gm-Message-State: AElRT7H1wX4uaKd4lExPl3MBB6xsssuytcLPWF3fTwm/9moHicJ2YU+Q
        UDme/hRhj2fBsfoepcdzrwQ1Ug==
X-Google-Smtp-Source: AG47ELvkDihGgp+MJTV3sCr65sCQRKmAimje3YxgwPIHJYymZDdpt8WdnEsdsXLZ28gzI0r/cRqNuA==
X-Received: by 10.98.76.155 with SMTP id e27mr12911267pfj.45.1521531908122;
        Tue, 20 Mar 2018 00:45:08 -0700 (PDT)
Received: from localhost ([2620:0:1000:1511:d30e:62c6:f82c:ff40])
        by smtp.gmail.com with ESMTPSA id n25sm2045012pfk.174.2018.03.20.00.45.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Mar 2018 00:45:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Doug Anderson <dianders@chromium.org>,
        Sagar Dharia <sdharia@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <CAD=FV=Vq4Q2LvY_O-YsdyUmQOUANa0ap+U9j7PXSD3_ao6sCdQ@mail.gmail.com>
Cc:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        evgreen@chromium.org, acourbot@chromium.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com>
 <65fa4ff5-7f37-b6fd-e493-bec18511d334@codeaurora.org>
 <CAD=FV=Vq4Q2LvY_O-YsdyUmQOUANa0ap+U9j7PXSD3_ao6sCdQ@mail.gmail.com>
Message-ID: <152153190602.254778.17328050728636145822@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v4 6/6] arm64: dts: sdm845: Add I2C controller support
Date:   Tue, 20 Mar 2018 00:45:06 -0700
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Doug Anderson (2018-03-19 16:56:27)
> On Mon, Mar 19, 2018 at 3:15 PM, Sagar Dharia <sdharia@codeaurora.org> wr=
ote:
> >
> > Yes, we typically have a "platform(sdm845 here)-qupv3.dtsi" defining
> > most of the serial-bus instances (i2c, spi, and uart with
> > status=3Ddisabled) that we include from the common header. The boards
> > enable instances they need.
> > Will that be okay?
> =

> Unless you really feel the need to put these in a separate file I'd
> just put them straight in sdm845.dtsi.  Yeah, it'll get big, but
> that's OK by me.  I _think_ this matches what Bjorn was suggesting on
> previous device tree patches, but CCing him just in case.  I'm
> personally OK with whatever Bjorn and other folks with more Qualcomm
> history would like.

Upstream puts all SoC nodes in the SoC file. The split file by
functional area method is to avoid merge conflicts in the SoC file and
that doesn't make sense outside of the internal workflow.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
