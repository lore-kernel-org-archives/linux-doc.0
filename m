Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 200B37D584
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 14:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbeIJTwh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 15:52:37 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:51441 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728822AbeIJTwh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 15:52:37 -0400
Received: by mail-wm0-f68.google.com with SMTP id y2-v6so21899236wma.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/ukGdzWBtmk9gFQRW/6WB5IqCbFh+0N+fAEU1vMF1NY=;
        b=USX3dUjf5QsXsBXI2uBd31nCaUmQdNs1dE/F3nPDWwYMUTLDJDrifKethzB1BBgLBR
         1g/Jo3AOQMLR4TLmCLUnh7b5FutI3Y6fmyM2+6d4OqZtvtDmV1lsRLgFB+i2/Db28R3q
         RT7h0hMuQNRoSb8CjV8WUvbeI3xsXdDFd5l3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/ukGdzWBtmk9gFQRW/6WB5IqCbFh+0N+fAEU1vMF1NY=;
        b=oMw0RUhh0XZgIpXh2lGjyHis4irVts0OEotM2C/b9nL7V3pESqb/nIJuLloafvjRv7
         AITRMdkwTQFA0Y7UtTFDag3EWp54KFqAM9WV4op0FK3pz/s2zEPjVwzH6aBnoBTLPCrr
         VDZl4/YCK2SGPN6hwcBKPjb8V0vYvfE258yLPjjFgsjHSb3/JM5/OSW9vWypoJzzlT/N
         dBdTexyWUc/vCe69BFNGp2hD/namjvnQFi4g9aLu6u3W7Z1cRFgIcHXRGgoi6Aa9qFJO
         1ZLTuGVR8gTK3xQxuEmLg8tN3KPURQnjuK0/fIoCYFnglXSUNFrlAx6JV3MEYZDskTTf
         Bl9Q==
X-Gm-Message-State: APzg51BYA4dvKCmn03ANdWETCo4pynhjaS08rbs7gQpFtkaiPtXvDBbS
        BtyA6gKA7t5XhKb3u81gRjjNiQ==
X-Google-Smtp-Source: ANB0VdYFjzw5WkrTJs+z6MQD/olrZZ/rGzuV4XFyqXiMb3WmeMGpdG6Rp2Xybtj0iJGCGp25gPVGFw==
X-Received: by 2002:a1c:c019:: with SMTP id q25-v6mr979592wmf.148.1536591486658;
        Mon, 10 Sep 2018 07:58:06 -0700 (PDT)
Received: from dell ([2.27.167.7])
        by smtp.gmail.com with ESMTPSA id t132-v6sm23582069wmf.24.2018.09.10.07.58.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Sep 2018 07:58:05 -0700 (PDT)
Date:   Mon, 10 Sep 2018 15:58:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Jonathan Corbet <corbet@lwn.net>, od@zcrc.me,
        Mathieu Malaterre <malat@debian.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@linux-mips.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 01/24] mfd: Add ingenic-tcu.h header
Message-ID: <20180910145802.GV28860@dell>
References: <20180821171635.22740-1-paul@crapouillou.net>
 <20180821171635.22740-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180821171635.22740-2-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 21 Aug 2018, Paul Cercueil wrote:

> This header contains macros for the registers that are present in the
> regmap shared by all the drivers related to the TCU (Timer Counter Unit)
> of the Ingenic JZ47xx SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
> 
> Notes:
>      v2: Use SPDX identifier for the license
>     
>      v3: - Use macros instead of enum
>          - Add 'TCU_' at the beginning of each macro
>     	 - Remove useless include <linux/regmap.h>
>     
>      v4: No change
>     
>      v5: No change
>     
>      v6: Rename barrier macro from __LINUX_CLK_INGENIC_TCU_H__ to
>          __LINUX_MFD_INGENIC_TCU_H__
>     
>      v7: No change
> 
>  include/linux/mfd/ingenic-tcu.h | 56 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 include/linux/mfd/ingenic-tcu.h

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
