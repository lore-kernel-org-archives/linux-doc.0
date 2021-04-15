Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF96C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 14:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DBD3613B4
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 14:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhDOOeE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 10:34:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48268 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233219AbhDOOeD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 10:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618497220;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DN2UJaEtENrsdEqdKuTrcReV84BAkt22oNwtGa+zUKY=;
        b=ewXaUUGKzOOJjNcr5JP3r+pFk6ySY5WQ+U9mPW3SmBQdGhsn1l5i/VsXSTVZlV/iA8CpIg
        EprJ5QpyZ8VFCsDQvTLubk81ZMCT5P6esEEXIIm5m3KaTF8BzuhK7tDPu01Gd48eRvmE+3
        KpKsnMAegHUv7Tbh2T5SUZIymxg4bq0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-F9a-UbwcPOeKPZLp83m2_Q-1; Thu, 15 Apr 2021 10:33:39 -0400
X-MC-Unique: F9a-UbwcPOeKPZLp83m2_Q-1
Received: by mail-ed1-f71.google.com with SMTP id b9-20020a05640202c9b029038276b571ddso5306811edx.11
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 07:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DN2UJaEtENrsdEqdKuTrcReV84BAkt22oNwtGa+zUKY=;
        b=PZ8iq/Iyo6wH1qicIAZ6jUsPN+dRSV44E+k8PreLcUsXaXKIcdX0Mfni5r9X0pes1T
         1u21sZwlJuqRwkqRWzmlhPtp877IyL31uWpAjMiVgJzaogCpsUYlpV7J+BTAW6x+PrPS
         DwULk3idBhGBjPVH0VDGBtoJE1Byirq7r+paSCBlaacIr7LBu47WuSQmKqSOWSV5BSI7
         K0EULB76hvBWrK6fNm7VSOMVlEjRrw58U3sWoMLBbpWWKrLfCUw/a5G/d9NCyGFfYuyj
         6699PCRlnB9z0yqkO0aOlETQXMQMmmYfu4iOFO1vqKvkQrsRThlzfn+UxU2P9/uMroGA
         Un1g==
X-Gm-Message-State: AOAM5311s0fnGbH/T+xw5rMJIyp92393XDt0fyUrDAmVcqRJMAtxKLtd
        KfjlNUcM0DeYGH7kPgqqj6Rc1hBJsnjcTdgEpH2flckM10Ug7f67EM3SJTdOLpR1QswFFD2VmzW
        GVTrcEO0I37l4rHGbT7iMKbYFfPUXvdBeM5pHJ/aHEcyKgkz18rTFnp3ff8/P9YFAyryRPSM=
X-Received: by 2002:a17:906:5619:: with SMTP id f25mr3619637ejq.393.1618497217810;
        Thu, 15 Apr 2021 07:33:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp2+FhsiYsOxodUrmeark8TAuibstvh2k+JmEcDe8RIeCMxv7wz3iV2fdraEt9h+jfKBLYWg==
X-Received: by 2002:a17:906:5619:: with SMTP id f25mr3619603ejq.393.1618497217610;
        Thu, 15 Apr 2021 07:33:37 -0700 (PDT)
Received: from x1.bristot.me (host-79-56-201-31.retail.telecomitalia.it. [79.56.201.31])
        by smtp.gmail.com with ESMTPSA id c7sm2615614edt.84.2021.04.15.07.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 07:33:37 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] tracing/hwlat: Add a cpus file specific for
 hwlat_detector
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kernel@vger.kernel.org, kcarcia@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
References: <cover.1617889883.git.bristot@redhat.com>
 <94bbcd0e0f06b79aeb775e8dbf3a301f6679bb4c.1617889883.git.bristot@redhat.com>
 <20210414101019.7c5a66f6@gandalf.local.home>
 <e5547e9a-d3d8-2cd1-7cb9-e567c798e78d@redhat.com>
 <20210415094924.473a98df@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <a07b6ec2-8bfb-8d72-6380-34654921702e@redhat.com>
Date:   Thu, 15 Apr 2021 16:33:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415094924.473a98df@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/15/21 3:49 PM, Steven Rostedt wrote:
> OK, for osnoise, I can see how it is useful. But as you said above, for
> hwlat tracer, it's not as useful.

I agree, it is not as useful.

-- Daniel

