Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B04FA7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Apr 2018 11:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753001AbeDKLwy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Apr 2018 07:52:54 -0400
Received: from mail-qk0-f169.google.com ([209.85.220.169]:44538 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752990AbeDKLww (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Apr 2018 07:52:52 -0400
Received: by mail-qk0-f169.google.com with SMTP id n139so1456444qke.11;
        Wed, 11 Apr 2018 04:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=S0BSRykHaPpL7ZImptP9LRwCTl6+uoOzn7Kd14K2rq4=;
        b=UijEdOlldCP/ORYIWIAI2X+9gJLwfhSt4ZYn5EdF7hAUSA6A1Cp7CkvQNEoOCkIdiY
         rc3rCqYB2EucWKVi7wS06QciAzET5qVFx/hWO6R8/BZw0w9BZQVO/QwwGrhFBIUZFIVP
         dqMKYHAESrOvJWz3vufQSb4GOnxGcyXBO4/VvBLmRNDz2PNO1LNOZAu8TGpUg/egnIRx
         zJaEIE5hmaW1qgoz8AQgooohDGNV0x3zVuOfvyO7LiCCzZXuy95I7Ih9UV02M+L1yBjY
         2hvnlS6stiuWTorXOJ4yUWjnRwuH/gowb5lQBe6vSvFSrAKPulcbyqH7w2XyrsGln1tX
         BsRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=S0BSRykHaPpL7ZImptP9LRwCTl6+uoOzn7Kd14K2rq4=;
        b=Y6a/mC6GwMvMvbA82Hgodq6CpVZE7zxHa+xjl1knRuRD7muq1t1baQD+lo097iekHw
         xCdvwnTWTd2g7ou+7rcVc/2SrAk/Scb+48ydRBj+2iX8Lg15O2lDMewkMJdV3xS62NQd
         PZXwEchK1XAzJser6WzLMq0VtI2A5mmuwQf6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=S0BSRykHaPpL7ZImptP9LRwCTl6+uoOzn7Kd14K2rq4=;
        b=nahtNgHKj5kNTNT6aPcxJXiJ/qTyrTDpmoppQerZH2n+uwdi+nb8BrQmxXFBasSho3
         Tf8P7Xk9ZkXIZ2jXxErPXFax3OMU+0//OqTT6q34GZt46CsiJFamtWdrF2fWTAZnPddA
         Dx02b5ssyfv2L0jeCLrdHStCpNqU82bNx4cvLxLf2MZeJrxkrjqMy6IyMZ36XlYVfk1L
         yotyZh0XIyV+7iDU2GV/BzjkbcpFcWwlrzK7vC0QgXe8mzvMgwMKBYKpCjmRJRe2TcaO
         DNex5QuTwBocg3zhgLDVrAW/l83AZ3+OxCvyeV0LGC8tDXrhfM39G69Aklu1n1aVYUSC
         F/ww==
X-Gm-Message-State: ALQs6tCvIODe23FXiqW5gDCgLwWLTKMdmAEk02OfXxHqLaYg17v3Dkmb
        1qH+65oLZVAZeNLwStNTYnvZnVkwZeLC/uciQ1s=
X-Google-Smtp-Source: AIpwx4+CEbXT5ARkZBDIWS1I9TrjyR5qyCB2d2eNgUsfOJ56oHM/RNIs0DHoLoR5nMFhcdIpdKaZiPCldcc6Dsr0rpg=
X-Received: by 10.55.4.129 with SMTP id 123mr6183010qke.203.1523447570916;
 Wed, 11 Apr 2018 04:52:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.63.197 with HTTP; Wed, 11 Apr 2018 04:52:30 -0700 (PDT)
In-Reply-To: <20180410183212.16787-6-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com> <20180410183212.16787-6-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 11 Apr 2018 21:22:30 +0930
X-Google-Sender-Auth: 9w3a5uKeB_4X891o5gliPk2JfvU
Message-ID: <CACPK8Xf7ta43K=POx8J6bAdjvX=wCzy-+HWqHsm+RstQxeetCQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] ARM: dts: aspeed: peci: Add PECI node
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11 April 2018 at 04:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> This commit adds PECI bus/adapter node of AST24xx/AST25xx into
> aspeed-g4 and aspeed-g5.
>

The patches to the device trees get merged by the ASPEED maintainer
(me). Once you have the bindings reviewed you can send the patches to
me and the linux-aspeed list (I've got a pending patch to maintainers
that will ensure get_maintainers.pl does the right thing as far as
email addresses go).

I'd suggest dropping it from your series and re-sending once the
bindings and driver are reviewed.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
