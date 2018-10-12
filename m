Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 08F037D08F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Oct 2018 12:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728601AbeJLUTS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 16:19:18 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40653 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbeJLUTS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Oct 2018 16:19:18 -0400
Received: by mail-pf1-f193.google.com with SMTP id s5-v6so6154977pfj.7;
        Fri, 12 Oct 2018 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Hb/s97UjDaC4OsZ9bV876QEA14xkwyhjLLXZcihS/wE=;
        b=HAEbpOPMHakODEHGl5O9YfhC7rufD3+dW+DYb0EC6Isn6XVpXWPCrYZlutm2OnqCIz
         Z94TTL40KaZpq+nbZ7ZLB8NoO+YW3tBMqybF90QsBeqwAkJ0/vwn0PcwiGdUqMQUQLgn
         IiGyEpHIXq+lR0Ys016D6370U+e00y2iRxEOvZ5AJI3T0HZYE2Vs3r9NtXybKGWG3k5P
         yQ+4D/YBaFz+/AANxij3DBnoTkJiDbYxHcZybmqvrZBC0J43TTC9SFuZuf/m49O/IlMR
         3QnKShdLSP6don1sRTfCxnCqFvMj9cfgn0uv7EgRVgQSVMxz6vpjNCet4uFjvB8YmzXx
         evlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hb/s97UjDaC4OsZ9bV876QEA14xkwyhjLLXZcihS/wE=;
        b=scVNfrx5J6ak9Nrny0bY8TjZ1QQh+3P4bFHGUeZKjUZPaAqpmv06EG4HFIzf/v3jBt
         tf2hrpdyy2JwgkaaKWwxVicfMcRGt8M8Cv1KiQGaZgKk5yZq+vPNl8JdBhPs1sL05xZE
         DGU2bTHKvzHfmWTFW24jHaBjbHSOeMQVZatvkk2TdQP1yYGwxg82XWnYa/cVNO/cpz/3
         sdGVo8c1+hmDezsp43eCPYq0NQRUlZ3ET+PjGEJSrHeG7S6/Gof0qCAlRNM88TnRG9ZS
         WFxAw6epqeVHOTJ6qsoaQCJ6azktcESZvzc4oodA6HAjttlvH8bAGxFBfcKP6Uigg+1I
         Rtkw==
X-Gm-Message-State: ABuFfoi7m+8Np9Do+OTmwx9mh7AxJUVJULSMKiZP0t3Sv1UdMPYlGl1a
        Pr4wOOTAM9XTo7R6NzkhcZA=
X-Google-Smtp-Source: ACcGV62E4q5+qY+XyeZSQeQAVQspifWCvN/E0fxLTxdzLex0Ynokuy1fH0pDZbcm65nO8mpmmNKsdw==
X-Received: by 2002:a63:700e:: with SMTP id l14-v6mr5273282pgc.359.1539348419454;
        Fri, 12 Oct 2018 05:46:59 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id f3-v6sm1445431pgd.41.2018.10.12.05.46.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Oct 2018 05:46:58 -0700 (PDT)
Date:   Fri, 12 Oct 2018 05:46:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eddie James <eajames@linux.vnet.ibm.com>
Cc:     kbuild-all@01.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com, joel@jms.id.au,
        benh@kernel.crashing.org
Subject: Re: [PATCH v5 05/10] hwmon: Add On-Chip Controller (OCC) hwmon driver
Message-ID: <20181012124658.GB11386@roeck-us.net>
References: <1535664761-86018-6-git-send-email-eajames@linux.vnet.ibm.com>
 <201809011808.kL7L1gpv%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201809011808.kL7L1gpv%fengguang.wu@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 01, 2018 at 08:06:16PM +0800, kbuild test robot wrote:
> Hi Eddie,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on hwmon/hwmon-next]
> [also build test ERROR on v4.19-rc1 next-20180831]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Eddie-James/hwmon-and-fsi-Add-On-Chip-Controller-Driver/20180831-165247
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: arm64-allmodconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=arm64 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/hwmon/occ/p8_i2c.o: In function `init_module':
> >> p8_i2c.c:(.init.text+0x0): multiple definition of `init_module'
>    drivers/hwmon/occ/p9_sbe.o:p9_sbe.c:(.init.text+0x0): first defined here
>    drivers/hwmon/occ/p8_i2c.o: In function `cleanup_module':
> >> p8_i2c.c:(.exit.text+0x0): multiple definition of `cleanup_module'
>    drivers/hwmon/occ/p9_sbe.o:p9_sbe.c:(.exit.text+0x0): first defined here
> 

This will need to be fixed before I can pick up the series.
Each module must have only one set of module initialization
functions.

Guenter

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation


