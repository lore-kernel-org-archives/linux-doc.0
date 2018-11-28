Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4EF137DD29
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Nov 2018 09:31:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbeK1Ucl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Nov 2018 15:32:41 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45584 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbeK1Ucl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Nov 2018 15:32:41 -0500
Received: by mail-pg1-f196.google.com with SMTP id y4so9234373pgc.12
        for <linux-doc@vger.kernel.org>; Wed, 28 Nov 2018 01:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MRtn6CpH/sMIVrL0+l/kkrYQzoaAvuMW2WxIEnnlVvg=;
        b=MC2LeCDuBZ/RhRlR9oL+5U/W0inWySbQ8tUo8dPZsRd2Dm2ACAofZ8Mgw4R8+n7xWE
         jOOg8yZ8DV12+hvpoQlm8Hl3G4Qww0Fy8XU76I4J5wCLqa0kufYSwfgt3SXqjrnbpu9k
         qjctnDaaoBzZBCyAv9AyVDZ4Soo2wNu3Yym2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MRtn6CpH/sMIVrL0+l/kkrYQzoaAvuMW2WxIEnnlVvg=;
        b=BmFFQH7rYTx1pmTjWRrwv83MJwXxDw3AUo0byFqmEHDRUs6XB5qpPbib9d7yQTCXb2
         +N18Qrxrv30X+cbpuhY2E/7c3y28UKeMLepKtzQGVv2atlbA3JWllQX0UQ2oHytKZKg1
         T244rScqO7+FwywllEOTD1xSVzQ7K/n3ryrNKcXbPvSO2S5ZuabAqPa5KfZ7SpXaAuLk
         sOshSKAuYKQn8qbG3skXsz7vmNSWQfdDcD6b4SszS0kwA4KaRwU2zTJ5AwXvYc3qeKgU
         YKU5sWbfuhGMYaCSbm3e6JKMVn0QHkVmfjr7vMlu4xBqLht1/4HAk8MZHroHounkbST0
         po8w==
X-Gm-Message-State: AGRZ1gJ6a8Yj1F1SeTcaf4YxExzksWlPWRdMDOwOEUOucajAq0w6g6LA
        mC/XWFL2O908J5u6I+sfoRKcO+YrHwo=
X-Google-Smtp-Source: AJdET5c35/pmOPntUcTomEY633YuKZV7xN9PagmGELEtXnf6WQCU12ZZ5TW2WeP7Vi+1SCMTf2tQLg==
X-Received: by 2002:a62:8c11:: with SMTP id m17mr36756211pfd.224.1543397500878;
        Wed, 28 Nov 2018 01:31:40 -0800 (PST)
Received: from localhost ([122.172.88.116])
        by smtp.gmail.com with ESMTPSA id x19sm8589063pfk.14.2018.11.28.01.31.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Nov 2018 01:31:39 -0800 (PST)
Date:   Wed, 28 Nov 2018 15:01:37 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Len Brown <len.brown@intel.com>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Giovanni Gherdovich <ggherdovich@suse.cz>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] Documentation: admin-guide: PM: Add cpuidle document
Message-ID: <20181128093137.a5d4kwgfdthlsolw@vireshk-i7>
References: <4064391.AYvOMBeiDo@aspire.rjw.lan>
 <20181128054835.gnhistcfxy25rmwf@vireshk-i7>
 <CAJZ5v0hnX512AheTwhpj09+eyiyv6txsgGQcT2afWiB2JjjCzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hnX512AheTwhpj09+eyiyv6txsgGQcT2afWiB2JjjCzw@mail.gmail.com>
User-Agent: NeoMutt/20180323-120-3dd1ac
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28-11-18, 10:11, Rafael J. Wysocki wrote:
> On Wed, Nov 28, 2018 at 6:48 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 26-11-18, 14:11, Rafael J. Wysocki wrote:
> > > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > >
> > > Important information is missing from user/admin cpuidle documentation
> > > available today, so add a new user/admin document for cpuidle containing
> > > current and comprehensive information to admin-guide and drop the old
> > > .txt documents it is replacing.
> > >
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > ---
> > >  Documentation/admin-guide/pm/cpuidle.rst       |  603 +++++++++++++++++++++++++
> > >  Documentation/admin-guide/pm/working-state.rst |    1
> > >  Documentation/cpuidle/core.txt                 |   23
> > >  Documentation/cpuidle/sysfs.txt                |   98 ----
> > >  4 files changed, 604 insertions(+), 121 deletions(-)
> >
> > Nice work Rafael. Minor nits below..
> 
> Thanks for the typo fixes.  The spellchecker I have here evidently doesn't work.

I have this in my .vimrc and I am shown these spelling mistakes somewhat
forcefully :)

set spell spelllang=en_us

-- 
viresh
