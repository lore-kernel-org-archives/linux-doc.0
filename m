Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CAEEB64D9
	for <linux-doc@archiver.kernel.org>; Sat, 17 Jun 2023 10:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346322AbjFQKiJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Jun 2023 06:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234499AbjFQKiF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Jun 2023 06:38:05 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EF92700
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 03:37:19 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-987f7045f9aso29180666b.1
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1686998172; x=1689590172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1x1TufhGga+vhofQhW3+rOkuF8WKt/IeOnnrmJtrog=;
        b=BSLERsDAgGslIeEyq94ScS8bRLgPPRRRwT8Nf8n+6gest5CBJm7weH95XbHUWqLPrs
         lMqAZ5YohISaainT6DoT5KRo+06ct7IyRAWJITH8QiX+CKXNRf7RTEbj4ehIcYJxYtHJ
         S+tMFiI9UWNXT2a5hg0KLa/1NxteLO2ap4RvVkp9qGeFfK5FKir/7euwyrkgLckOtKmi
         Xn2ZIAD96h2+mraRrWLl1sWZ/1oEO7vpCWKa7qJYU0VpWfYwdunjJkr7fjK6tTnVnk6L
         LIWC6DFNj4ViFnScRoCYtPIpyJ2HWmk9OlLm6i3tklX7Kcc0HpSuhcjnvvvKwhWWp6Pq
         o8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686998172; x=1689590172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1x1TufhGga+vhofQhW3+rOkuF8WKt/IeOnnrmJtrog=;
        b=h5cxOBhiUssbCG6MHelxxUdyvij0a8Js69057fxM6+qqoKFZqK7vJFeiy8c3q5ObFm
         say3XhppYoMQAoifTNM0VF1Vi4u6asyJKTeZQdc8gUKxO8isrBAMRAw73XaCN0KMtzNf
         mBpkaGATXvfrfJ3aM0lUeOsaNW8RYVA/qV3OSnfsD0PBC3AVZTcK+K1O/bfB1qfsr5HX
         Cxv8eLYHk+8tHUYgHOcGkgaWn9t2M/9jvxaL3SRHNGhiGpdP12oQhPBTZt1qshn/ulC1
         JPYtD/9nV7S0fxmq7dkBql0ONSOwgYwiHqLFVrAjB+CIngYawWP0+eR4azXNQRRjYIUm
         L+QQ==
X-Gm-Message-State: AC+VfDzT0PURtxPYQY3m6fRdl7qA8kE7tqkOJ340J9X0IFw7bIoWK0TT
        Qg4+c4wKVQ1amV9uRlXL1QCZZA==
X-Google-Smtp-Source: ACHHUZ7OhqQdwYiCXLWpW4pNAkdtQLu1xzSJt4dCibpw5uqj3GQ/nixFPiQmcTPdSiQpJVj0JEscIg==
X-Received: by 2002:a17:907:7204:b0:94f:5847:8ac with SMTP id dr4-20020a170907720400b0094f584708acmr4832912ejc.51.1686998172291;
        Sat, 17 Jun 2023 03:36:12 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id s22-20020a1709064d9600b00982881f1e2dsm4053734eju.84.2023.06.17.03.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 03:36:11 -0700 (PDT)
Date:   Sat, 17 Jun 2023 12:36:09 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        "vadfed@meta.com" <vadfed@meta.com>,
        "jonathan.lemon@gmail.com" <jonathan.lemon@gmail.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "vadfed@fb.com" <vadfed@fb.com>,
        "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
        "M, Saeed" <saeedm@nvidia.com>,
        "leon@kernel.org" <leon@kernel.org>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>,
        "sj@kernel.org" <sj@kernel.org>,
        "javierm@redhat.com" <javierm@redhat.com>,
        "ricardo.canuelo@collabora.com" <ricardo.canuelo@collabora.com>,
        "mst@redhat.com" <mst@redhat.com>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jacek.lawrynowicz@linux.intel.com" 
        <jacek.lawrynowicz@linux.intel.com>,
        "airlied@redhat.com" <airlied@redhat.com>,
        "ogabbay@kernel.org" <ogabbay@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "nipun.gupta@amd.com" <nipun.gupta@amd.com>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "linux@zary.sk" <linux@zary.sk>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "Olech, Milena" <milena.olech@intel.com>,
        "kuniyu@amazon.com" <kuniyu@amazon.com>,
        "liuhangbin@gmail.com" <liuhangbin@gmail.com>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "andy.ren@getcruise.com" <andy.ren@getcruise.com>,
        "razor@blackwall.org" <razor@blackwall.org>,
        "idosch@nvidia.com" <idosch@nvidia.com>,
        "lucien.xin@gmail.com" <lucien.xin@gmail.com>,
        "nicolas.dichtel@6wind.com" <nicolas.dichtel@6wind.com>,
        "phil@nwl.cc" <phil@nwl.cc>,
        "claudiajkang@gmail.com" <claudiajkang@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>
Subject: Re: [RFC PATCH v8 01/10] dpll: documentation on DPLL subsystem
 interface
Message-ID: <ZI2MmaQ1NAggT+l6@nanopsycho>
References: <20230609121853.3607724-2-arkadiusz.kubalewski@intel.com>
 <20230612154329.7bd2d52f@kernel.org>
 <ZIg8/0UJB9Lbyx2D@nanopsycho>
 <20230613093801.735cd341@kernel.org>
 <ZImH/6GzGdydC3U3@nanopsycho>
 <DM6PR11MB465799A5A9BB0B8E73A073449B5AA@DM6PR11MB4657.namprd11.prod.outlook.com>
 <20230614121514.0d038aa3@kernel.org>
 <20230614122348.3e9b7e42@kernel.org>
 <ZIrldB4ic3zt9nIk@nanopsycho>
 <20230615093111.0ee762e4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615093111.0ee762e4@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thu, Jun 15, 2023 at 06:31:11PM CEST, kuba@kernel.org wrote:
>On Thu, 15 Jun 2023 12:18:28 +0200 Jiri Pirko wrote:
>> Yeah, that is what we had originally. This just pushes out the
>> different attr selection from the nest one level up to the actualy
>> nesting attribute.
>
>Oh no, no extra nesting. Let me try to fake up the output:

I wasn't implying any extra nesting.

>
>'pin': [{
> {'clock-id': 282574471561216,
>  'module-name': 'ice',
>  'pin-dpll-caps': 4,
>  'pin-id': 13,
>  'parent-device': [{'pin-id': 2, 'pin-state': 'connected'},
>                    {'pin-id': 3, 'pin-state': 'disconnected'}],
>  'parent-pin': [{'id': 0, 'pin-direction': 'input'},
>                 {'id': 1, 'pin-direction': 'input'}],
>  'pin-type': 'synce-eth-port'}

You messed up a bit. Should be:
parent-device : id
parent-pin : pin-id

That is basically my point. The fact if the parent is either device or
pin is carried inside the nest by either providing "id" or "pin-id".
So you add redundant info which could be source of mixups - as you
already demonstrated :)


>}]
>
>> One downside of this is you will have 2 arrays of parent objects,
>> one per parent type. Current code neatly groups them into a single array.
>> 
>> I guess this is a matter of personal preference, I'm fine either way.
>
>Yeah, could be.
