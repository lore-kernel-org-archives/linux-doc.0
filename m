Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE71C4332F
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 09:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbiLBJz0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 04:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233169AbiLBJzT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 04:55:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F952CA7A1
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 01:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669974865;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z0aJyBJ5pA14fenx25kvzt6VogtkX8oCBQc7dpQax/I=;
        b=SIyq8CCfITW2jg35C3NStTqAF15hK8oThy3R1MG0U9Di+RIu1WSGnpyF7MlLvkbnN48E4f
        ev4+WodUaY3cYPLrzkjM5cvuyOa0GgRxxbW+e8SStlyAp60/olmdD89REv/dKLK09LfIai
        mrejgN8deTNkPD4qZnMdolb2fnx4mwU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-zCimhZzmP_63j0vvN1t_Zg-1; Fri, 02 Dec 2022 04:54:24 -0500
X-MC-Unique: zCimhZzmP_63j0vvN1t_Zg-1
Received: by mail-wr1-f70.google.com with SMTP id j29-20020adfb31d000000b0024237066261so951862wrd.14
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 01:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0aJyBJ5pA14fenx25kvzt6VogtkX8oCBQc7dpQax/I=;
        b=P4Ju2KAkCiqzazFzi7UGhA9Thsqf5YtpyUZ5ug1LMc/gqpvVhRwc7KhBKfj2GDXFmY
         7u464qxGQ+GYRmnNwJcg5PhYoEmvUWAHXPB2RQJsZ8gpPpx1Bt+GCXC8sdsy+ODDKtxW
         YCTuGQ7dmxHZXY2KYLDXP8hP9Gg3xnIxZ/8WJhUs9vbfDp7bYYVuFMh9eZo4rhpTFjA4
         bN7VawTSIuMvZ9zjX6r0VaUYV1N7fWx6pymmZfWfYXU+ujvxrim+cJ4/4gLDxyeIagMk
         svgkQGzjIVz7kbh3Rt+9A4GL+g7JYFsraBF6JVx4HQEWhgRxCUJftlMl6+Z06+uo5DGU
         O4oQ==
X-Gm-Message-State: ANoB5pmMmAp4SfZ49zMCTO8d7PVHcFb62vg83ost/cjbeT9DWmYF1sgF
        tcQaCuxpF2o85HuKDfiHk7q3v+6XCs6hBIY52OU1aoQDj5ROhQ2uiKL1c2jBVCO+qz+B22GWE9s
        oMr162TnPeU/+e0bqB4XO
X-Received: by 2002:a5d:6d47:0:b0:230:3652:205 with SMTP id k7-20020a5d6d47000000b0023036520205mr31082861wri.322.1669974862805;
        Fri, 02 Dec 2022 01:54:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4LLi1uitwBarAh4GKhzvBRHZY/KzlIK4u4CzijY+hwD6+971nsU5Jj2jm6GI5+pmm4gZ5Kiw==
X-Received: by 2002:a5d:6d47:0:b0:230:3652:205 with SMTP id k7-20020a5d6d47000000b0023036520205mr31082847wri.322.1669974862583;
        Fri, 02 Dec 2022 01:54:22 -0800 (PST)
Received: from [192.168.0.4] ([78.16.131.111])
        by smtp.gmail.com with ESMTPSA id n12-20020a1c720c000000b003c64c186206sm7685171wmc.16.2022.12.02.01.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 01:54:22 -0800 (PST)
Message-ID: <552ef30f-2331-52c3-b364-8171f42d86ff@redhat.com>
Date:   Fri, 2 Dec 2022 09:54:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH bpf-next v2 1/1] docs: BPF_MAP_TYPE_SOCK[MAP|HASH]
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     bpf@vger.kernel.org, linux-doc@vger.kernel.org, jbrouer@redhat.com,
        thoiland@redhat.com, donhunte@redhat.com, john.fastabend@gmail.com
References: <20221201151352.34810-1-mtahhan@redhat.com>
 <Y4ld1BsRrXaPtz0L@debian.me>
From:   Maryam Tahhan <mtahhan@redhat.com>
In-Reply-To: <Y4ld1BsRrXaPtz0L@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/12/2022 02:07, Bagas Sanjaya wrote:
> On Thu, Dec 01, 2022 at 03:13:52PM +0000, mtahhan@redhat.com wrote:
>> +When these maps are created BPF programs are attached to them. The list of
>> +allowed programs is shown below:
> Automatically attached BPF programs?


I will rephrase to indicate that the user typically attaches the 
programs to the maps. and fix the rest of the comments in a respin.

Thanks.

>
> Also, "The allowed programs are:"
>
>> +.. note::
>> +	For more details of the socket callbacks that get replaced please see:
>> +
>> +	- TCP BPF functions: ``net/ipv4/tcp_bpf.c``
>> +	- UDP BPF functions: ``net/ipv4/udp_bpf.c``
> "... please see ``net/ipv4/tcp_bpf.c`` and ``net/ipv4/udp_bpf.c`` for
> TCP and UDP functions, respectively"
>
> Otherwise LGTM.
>

