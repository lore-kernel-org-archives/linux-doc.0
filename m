Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCACC47082
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 09:31:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC740611C1
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 09:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhFGJdo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 05:33:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28418 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230194AbhFGJdo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 05:33:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623058312;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tHD0Geg6PY8ubcouSBs9vdWbJxbFB69CphmPr5caBHo=;
        b=Zh3NrpBBppGvhpMj6GJTG2QmCZs+GgxVaqfLEXVzMjOxpaQmhefLh4fIyjPL6yMMKwlP31
        xjx7I9DTXGwYkzNoJo1CiUsPkhM8ZbfzK9K7SAjNGrbZgC50XyrxaL1EYO/mnpE/FzreXS
        7rU8R/CpDzqvNhGq6L0WPCaizu4JPEY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-GS7jP6LsMRaCbp0pp6ZkUw-1; Mon, 07 Jun 2021 05:31:51 -0400
X-MC-Unique: GS7jP6LsMRaCbp0pp6ZkUw-1
Received: by mail-ej1-f71.google.com with SMTP id gv42-20020a1709072beab02903eab8e33118so5042760ejc.19
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 02:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tHD0Geg6PY8ubcouSBs9vdWbJxbFB69CphmPr5caBHo=;
        b=NNzo+fh3PecH0+Z0XhyxgXj9BDmn7/a75BCVHKSteGLuZGemHKWfkhg00+JFARvUxa
         83xEmY7E5RGqVOg9y2XQw8FY5Ov4aC4ud9OueX9Jn7yLZ7KfwA6T+oWtxj4Oqszfic12
         XpGGYfkR0vSlvEtZqpDjCnqTDAA9wFukhPyNwhaorc8B77c3ohCF0gjzPVKIvlzBDoaA
         hUT+jStvl/eAGCqp3LRapT3TyZwWECPJFpfX/VRsdaFEo9FleV2sxdoxu6f0b2ncfNlQ
         2b7VVnfsA0staVaifvrc9v1mJedb3T2PHuzISzeG9Q4FdlC8fcKefw9eY8cVVOSZlVbH
         e+bA==
X-Gm-Message-State: AOAM5335KLFn9zIhDZDiGI9w+rQIq5G8TG/e4kruLefwUC8rPPiYLteZ
        Y7h/2Bi3+6nrpNkFrseE3VD1DBJpzzmg6oK1Tloqreqql/71KTq82hg//a/U6YJfQDkilME+9WZ
        dsEXRl7MwW4IzSA1cdOaT
X-Received: by 2002:a17:906:4e91:: with SMTP id v17mr17320103eju.119.1623058310314;
        Mon, 07 Jun 2021 02:31:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmmxVAzYUtrmbi1btwBl25An+a/ioM1AYpSZjef+xp36C5YJG3/w5tSRVdRAS1P7kwelwGLQ==
X-Received: by 2002:a17:906:4e91:: with SMTP id v17mr17320078eju.119.1623058310090;
        Mon, 07 Jun 2021 02:31:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r19sm7430288eds.75.2021.06.07.02.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 02:31:49 -0700 (PDT)
Subject: Re: [PATCH 19/34] docs: driver-api: surface_aggregator: avoid using
 ReSt :doc:`foo` markup
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     linux-kernel@vger.kernel.org
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
 <c42fe427e6538ce7914645468ef63f83254c26d7.1622898327.git.mchehab+huawei@kernel.org>
 <91d72412-3bba-8a50-4527-7c8fb9fa54c4@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1663da2c-571f-cf7d-a0ca-ea7031515b40@redhat.com>
Date:   Mon, 7 Jun 2021 11:31:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <91d72412-3bba-8a50-4527-7c8fb9fa54c4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 6/5/21 4:14 PM, Maximilian Luz wrote:
> On 6/5/21 3:18 PM, Mauro Carvalho Chehab wrote:
>> The :doc:`foo` tag is auto-generated via automarkup.py.
>> So, use the filename at the sources, instead of :doc:`foo`.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> Acked-by: Maximilian Luz <luzmaximilian@gmail.com>

Mauro, I assume that you are going to take care of sending this
to Linus, or do you want me to merge this patch into the pdx86 tree?

Regards,

Hans


> 
>> ---
>>   .../surface_aggregator/clients/index.rst          |  3 ++-
>>   .../driver-api/surface_aggregator/internal.rst    | 15 ++++++++-------
>>   .../driver-api/surface_aggregator/overview.rst    |  6 ++++--
>>   3 files changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/driver-api/surface_aggregator/clients/index.rst b/Documentation/driver-api/surface_aggregator/clients/index.rst
>> index 98ea9946b8a2..30160513afa5 100644
>> --- a/Documentation/driver-api/surface_aggregator/clients/index.rst
>> +++ b/Documentation/driver-api/surface_aggregator/clients/index.rst
>> @@ -5,7 +5,8 @@ Client Driver Documentation
>>   ===========================
>>     This is the documentation for client drivers themselves. Refer to
>> -:doc:`../client` for documentation on how to write client drivers.
>> +Documentation/driver-api/surface_aggregator/client.rst for documentation
>> +on how to write client drivers.
>>     .. toctree::
>>      :maxdepth: 1
>> diff --git a/Documentation/driver-api/surface_aggregator/internal.rst b/Documentation/driver-api/surface_aggregator/internal.rst
>> index 72704734982a..8c7c80c9f418 100644
>> --- a/Documentation/driver-api/surface_aggregator/internal.rst
>> +++ b/Documentation/driver-api/surface_aggregator/internal.rst
>> @@ -87,10 +87,11 @@ native SSAM devices, i.e. devices that are not defined in ACPI and not
>>   implemented as platform devices, via |ssam_device| and |ssam_device_driver|
>>   simplify management of client devices and client drivers.
>>   -Refer to :doc:`client` for documentation regarding the client device/driver
>> -API and interface options for other kernel drivers. It is recommended to
>> -familiarize oneself with that chapter and the :doc:`ssh` before continuing
>> -with the architectural overview below.
>> +Refer to Documentation/driver-api/surface_aggregator/client.rst for
>> +documentation regarding the client device/driver API and interface options
>> +for other kernel drivers. It is recommended to familiarize oneself with
>> +that chapter and the Documentation/driver-api/surface_aggregator/ssh.rst
>> +before continuing with the architectural overview below.
>>       Packet Transport Layer
>> @@ -190,9 +191,9 @@ with success on the transmitter thread.
>>     Transmission of sequenced packets is limited by the number of concurrently
>>   pending packets, i.e. a limit on how many packets may be waiting for an ACK
>> -from the EC in parallel. This limit is currently set to one (see :doc:`ssh`
>> -for the reasoning behind this). Control packets (i.e. ACK and NAK) can
>> -always be transmitted.
>> +from the EC in parallel. This limit is currently set to one (see
>> +Documentation/driver-api/surface_aggregator/ssh.rst for the reasoning behind
>> +this). Control packets (i.e. ACK and NAK) can always be transmitted.
>>     Receiver Thread
>>   ---------------
>> diff --git a/Documentation/driver-api/surface_aggregator/overview.rst b/Documentation/driver-api/surface_aggregator/overview.rst
>> index 1e9d57e50063..26415e1ab7da 100644
>> --- a/Documentation/driver-api/surface_aggregator/overview.rst
>> +++ b/Documentation/driver-api/surface_aggregator/overview.rst
>> @@ -73,5 +73,7 @@ being a direct response to a previous request. We may also refer to requests
>>   without response as commands. In general, events need to be enabled via one
>>   of multiple dedicated requests before they are sent by the EC.
>>   -See :doc:`ssh` for a more technical protocol documentation and
>> -:doc:`internal` for an overview of the internal driver architecture.
>> +See Documentation/driver-api/surface_aggregator/ssh.rst for a
>> +more technical protocol documentation and
>> +Documentation/driver-api/surface_aggregator/internal.rst for an
>> +overview of the internal driver architecture.
>>
> 

