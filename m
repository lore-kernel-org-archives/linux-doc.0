Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6B7907D982
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Oct 2019 14:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389062AbfJDOhX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Oct 2019 10:37:23 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55198 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389114AbfJDOhX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Oct 2019 10:37:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id p7so6099387wmp.4
        for <linux-doc@vger.kernel.org>; Fri, 04 Oct 2019 07:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=M/bUMMwqhNt3Ns3PLD9fJksR9IwlrBLW7LrP5HWQF+c=;
        b=FsAZndhBRWOshUk2HtpFWBNhf8XA3iFaT+XxTApJiTi4sWWDA8mEi4lEWRyTonYxLE
         ZydU83dqlBb8DOGRZ22Vay1pRKjZ4Q54J3PwVxVrEm5b22dhcyv+niYmuPHtnpPA+gtF
         Ne3c/iFvOSgGU4NrDjQM2qM4RqbJWDijBpfuM6Irnohrlp5mf+h6XHoAkq7RB/bH06jG
         YVkfy/4F+0esR4D1tsBSWe3OI+GV/pvuOQf8JYjyDLCkrZqjuSQOqUCrqtbqS6hl29kf
         IL35Xa2IkpfLN6XzneIEOQCivUmEthM3mZQ4KH2A9fJ7srdvawl557EFAr/n1HJRYmsD
         NbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=M/bUMMwqhNt3Ns3PLD9fJksR9IwlrBLW7LrP5HWQF+c=;
        b=SSkJtoI7vCRdUKF/e6A5UDlEMtnmBjhFdmVweA9oIj58Q5I+QFR6H/+YHFXit5Vbmq
         EQZv/3xCT1dpwaTeJOUOidyLy/q888tZb4NbEtkS6R7mWaU8LnxKeXxcx7gPuo3XS5Rm
         T1iNhYCHrnWfkNBQAsQXrY7dLqXEKfBS4qLQfW+P+h02Z0Kl1dhdnpm+iP+3VvNfxEOI
         yWWzNU/VC2EoMMhfh3g4iv92syoaOvOgZ+X8LV0+2vPZ00d9YWHXtoOgy7ZoIqpHThgD
         rS4sgLm+75n16bviNeT1q/EJseoOr27cmWOehxAUlojf07rAX4BzJ7tSwZ6sedohM+UU
         bHDw==
X-Gm-Message-State: APjAAAXL8BYzBGHWeox/3ww9Mav7yYXJ60d47u95h7ptqc9nVthpIKFu
        eCBztacyK0mjfCYchkorsBrpyA==
X-Google-Smtp-Source: APXvYqxHRyx7yuiTH9IFzXeP2ivnk2BBRSV88nnMFiXyc7Dc5BayI1lrnlB/z2mqvBmn5UbH1qOKKw==
X-Received: by 2002:a1c:5942:: with SMTP id n63mr11413363wmb.65.1570199841070;
        Fri, 04 Oct 2019 07:37:21 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id u25sm5195823wml.4.2019.10.04.07.37.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 07:37:20 -0700 (PDT)
Date:   Fri, 4 Oct 2019 15:37:18 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     Thomas Bogendoerfer <tbogendoerfer@suse.de>, kbuild-all@01.org,
        Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 3/4] mfd: ioc3: Add driver for SGI IOC3 chip
Message-ID: <20191004143718.GM18429@dell>
References: <20190923114636.6748-4-tbogendoerfer@suse.de>
 <201909232145.eyOJqt2k%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201909232145.eyOJqt2k%lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 23 Sep 2019, kbuild test robot wrote:

> Hi Thomas,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linus/master]
> [cannot apply to v5.3 next-20190920]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Thomas-Bogendoerfer/Use-MFD-framework-for-SGI-IOC3-drivers/20190923-194903
> config: mips-allmodconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=mips 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers//mfd/ioc3.c: In function 'ioc3_eth_setup':
> >> drivers//mfd/ioc3.c:281:54: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t {aka unsigned int}' [-Wformat=]
>        sizeof(ioc3_w1_platform_data.dev_id), "ioc3-%012llx",
>                                                    ~~~~~~^
>                                                    %012x
>        ipd->pdev->resource->start);
>        ~~~~~~~~~~~~~~~~~~~~~~~~~~                         

I assume you plan on fixing this Thomas?


-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
