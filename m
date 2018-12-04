Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DBCB27D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Dec 2018 03:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbeLDDb3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Dec 2018 22:31:29 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36415 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbeLDDb3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Dec 2018 22:31:29 -0500
Received: by mail-pf1-f195.google.com with SMTP id b85so7486187pfc.3;
        Mon, 03 Dec 2018 19:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BODWdmcthOw/dEOovWjFr6QLN8c0oVtspncpkP/6/QU=;
        b=tUiTK3T78My45g3Aub4v7aXyes35KDishxWtmy5KzEvew1kaSuIBNik9hFKYGS0QmJ
         AlYCn8gsgC8V/TsZs1G1T63Bh/wuxfRAzpOrfN+JtB+R1RRrclA6NC/X8Dh8bvsbXuT1
         5Pli8KLGfrPJKlAz3wrQ8itbxccHw9fWOXvLcgXdvbYAOPwfxrcS5gPfDVC+/BHPFy3J
         3OpgfQqJVS8gZgyIi/igalgWtvoV7Wn/bh82rdRX5tYbnAePFeX/aGLDd23U284zbHxm
         P8PDeUGZKv+3IZ+QODXrjmRw9oMEx5EizaFJzNsvMFmuG7q8D1nTQr+qjakbyXJM0iT7
         39Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BODWdmcthOw/dEOovWjFr6QLN8c0oVtspncpkP/6/QU=;
        b=NrCpZPosohe8kwtQF+LWqRKtaTCFbG94Mb4FVltOhVUxf6ce3j3yk+vXOFbsTCxsVt
         ZkVIvpIjClQmq9qjE+VcLKGuo/admLa3L+pE7/OBIbavbvIGCzmejRuuGsWkpA8Gn6dQ
         qltgMA1kRnNsWSYphWh4Rp2IJJvs+W/kEg+LksrMlwUhEeZlzjm9B6aIPRcTbmCfCNI9
         1knDFJ2uxTW3FRRS2NzdLYOB90yFT564NZE/v9ozzAGHpIU/VXnHjISApaswfvSoWYj6
         ajs7npv78a5TqhCB5kLfoPgyqbmgJvIFh6/VCmHovLDukEIf1a240dzBQxBZSkQgPJBt
         hXaA==
X-Gm-Message-State: AA+aEWY5M07GDxpu2Bj+XIhEJrSSXbKEKn7yHL3GMsqRPwtWNMF01TA+
        FCXlpTivzPoFziLNuxwKLd06WARF
X-Google-Smtp-Source: AFSGD/UL/CSvD4SP4vJxMqVOMquQXumN/29YaudEPbOAcnoork8zOy2UskKGskvzUwzpRFKZ4zrJUg==
X-Received: by 2002:a62:5444:: with SMTP id i65mr19129589pfb.193.1543894288208;
        Mon, 03 Dec 2018 19:31:28 -0800 (PST)
Received: from ?IPv6:2601:282:800:fd80:a09b:8049:c06:c5f2? ([2601:282:800:fd80:a09b:8049:c06:c5f2])
        by smtp.googlemail.com with ESMTPSA id j14sm20165928pfn.175.2018.12.03.19.31.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Dec 2018 19:31:27 -0800 (PST)
Subject: Re: [RFC] net: documentation: build a directory structure for drivers
To:     Jakub Kicinski <jakub.kicinski@netronome.com>, davem@davemloft.net,
        Jonathan Corbet <corbet@lwn.net>
Cc:     oss-drivers@netronome.com, netdev@vger.kernel.org,
        jesse.brandeburg@intel.com, jiri@resnulli.us,
        stephen@networkplumber.org, henrik@austad.us,
        linux-doc@vger.kernel.org
References: <20181204014328.14424-1-jakub.kicinski@netronome.com>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <9ffcfa89-5dbb-fa7b-c7f9-302f3779f23f@gmail.com>
Date:   Mon, 3 Dec 2018 20:31:25 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181204014328.14424-1-jakub.kicinski@netronome.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/3/18 6:43 PM, Jakub Kicinski wrote:
> Documentation/networking/ is full of cryptically named files with
> driver documentation.  This makes finding interesting information
> at a glance really hard.  Move all those files into a directory
> called device_drivers (since not all drivers are for device) and
> fix up references.
> 
> RFC v0.1 -> RFC v1:
>  - also add .txt suffix to the files which are missing it (Quentin)
> 
> Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
> Reviewed-by: Quentin Monnet <quentin.monnet@netronome.com>
> ---
> I'm posting as an RFC to see what the general feeling is about
> such a patch.  I can split into per-driver changes later if that's
> the best way forward.

LGTM. Thanks for taking the initiative on this.

Acked-by: David Ahern <dsahern@gmail.com>
