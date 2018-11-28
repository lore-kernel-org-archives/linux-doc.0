Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 362D97D08E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Nov 2018 10:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbeK1VIr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Nov 2018 16:08:47 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43026 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbeK1VIq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Nov 2018 16:08:46 -0500
Received: by mail-pf1-f195.google.com with SMTP id w73so9929147pfk.10
        for <linux-doc@vger.kernel.org>; Wed, 28 Nov 2018 02:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9Uf5ON4PQUeHa7J1HpS84L1IRMGfJxHcJSrQS8VJU/Q=;
        b=DA7ABQvIm7ouybHvWSJMPrDHDiU/nvYBKZVTn9EXZ6Ajap7MD8tEY7y6l0cZeDgJwR
         U1R1nHxRia3t7oLHT2hVnEAE1gCt8eH9Oegz6jzMXkjCU7bzahiq4DpZ1h7PzSfHO94C
         kQiP9V1EMR9QbS6ROiHcCUfYD3I89TZsqngMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9Uf5ON4PQUeHa7J1HpS84L1IRMGfJxHcJSrQS8VJU/Q=;
        b=iyB4K3xtuKITQEmthzmSAavp3p9qqEIwys3QrS9HCObwT3H1EQCM9txhZ8LqkZUWLq
         vGrMxlZKuHFDR6qlFyiSMsH8sLmoMJpI4YrXZJ1U0f+ozsSpct1bxVzMnP5GDLifeC5l
         amwp8o8Wxf47alxJX2JK/Qn2xe0KjTN1LkncU4ZFoIeqmq+cUC7GRaxH7voU14gOQlGf
         M2XOvpb0VZrnYsB8go0o5iMOB/Hd61xK/mywAUbe8UA3GNoC4eWhn2QYfGynIzsgf2YR
         yJUMuVMlaUdmPoePlG531X5yBRC3puCFYCYoj2FfqI1Vkx4+lm/HA5KTe3ar7pa+f97I
         cimg==
X-Gm-Message-State: AGRZ1gL5moRNrfW2+tR50Cj99BfPI0QY/CjImuS37riOo78lYWYRut7u
        HAFZoLrIZvgUxRjMH+kmydIIzQ==
X-Google-Smtp-Source: AJdET5c+DLNXr991fRabrDMN97goeWjeSavAGvx/KkGFDwgkm87YAlTMDsKQWcHxyi5iAoq3zMHR4w==
X-Received: by 2002:a62:1a44:: with SMTP id a65mr37548187pfa.30.1543399659815;
        Wed, 28 Nov 2018 02:07:39 -0800 (PST)
Received: from localhost ([122.172.88.116])
        by smtp.gmail.com with ESMTPSA id v5sm11795864pgn.5.2018.11.28.02.07.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Nov 2018 02:07:39 -0800 (PST)
Date:   Wed, 28 Nov 2018 15:37:36 +0530
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
Message-ID: <20181128100736.m2cbaqijmyxmtldp@vireshk-i7>
References: <4064391.AYvOMBeiDo@aspire.rjw.lan>
 <20181128054835.gnhistcfxy25rmwf@vireshk-i7>
 <CAJZ5v0hnX512AheTwhpj09+eyiyv6txsgGQcT2afWiB2JjjCzw@mail.gmail.com>
 <20181128093137.a5d4kwgfdthlsolw@vireshk-i7>
 <CAJZ5v0j4B6ODKzJ+XWvMS_dc6BpQcYkK6=L-zg8wcWXQxMcFhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0j4B6ODKzJ+XWvMS_dc6BpQcYkK6=L-zg8wcWXQxMcFhQ@mail.gmail.com>
User-Agent: NeoMutt/20180323-120-3dd1ac
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28-11-18, 11:01, Rafael J. Wysocki wrote:
> BTW, I didn't respond to the remark about the ladder governor.  I have
> no plans to describe it at this time and that can be done at any time
> later easily enough if anyone wants to do it.

That would have made this doc complete somewhat. But anyway, that's fine with
me.

-- 
viresh
