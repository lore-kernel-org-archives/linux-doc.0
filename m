Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0E4537D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 13:36:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfJGNgT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Oct 2019 09:36:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34263 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGNgT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Oct 2019 09:36:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id j11so9563938wrp.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2019 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yi5RgQ366VLmVKtar4jgNhAuQXbfZ0Qa54QNC0bsBSs=;
        b=sIJVvgooOw7AGfMQEzRnx5q2/bocgPD1ua2QBS02Y4YMszxPzcFtdh76TIbA0rTOcL
         vLHx5hRL2LoEqGxvhinrI4h/UJNbFA7lpJc7XqJ3UziD6Hkkg+5OuHdKvMPVa+QlG72y
         tw+8ks1VSmwO0EcJlv04T2Eq7ljUqbJ4met1f4lFZmTuhA5OZWCjnq6C7RbRhjVCMFqe
         /n2IsUFQpYaOQsbM2xkJSzcc48Td4PQsGtcMJ9j5dndyPYNLzH7vNAFTvRWdM/gNMqKo
         x7zCUWZ+77JB082KmOTM2XZ5iJpbPN/NhmKrkYvkGQx9493KVCaDBptaatdCFF9sBHrP
         SdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yi5RgQ366VLmVKtar4jgNhAuQXbfZ0Qa54QNC0bsBSs=;
        b=gwwS916+owLIPG53/rvJJybUUfkivEtMZwO7VJiQ5pxbT/escUU9tQkRpoKLNU9yna
         rOTbu8/j9Csw96OQm8gcC/NAyiDrocTAwuZIPUyYSxR8+g3ibOXBqKf2x3417YBZZID9
         vr8CznJOcHSc2a4SfQiZSKMBbb6Bptr0SuAc1bwK2EDWmo+a6QTsluRjsZXpwdVzGeAZ
         jKMQIGRopNtxa0ezadWUO7Idh0NekOkeuzIhkBIEHJPQMQ5mRsfNh+rTdA38r97zYJs2
         iwE/FSpH2zxMN0N6E40xlKgKHyOdixCbKapLZKpCHEampsw3hBUriyE1V4WJocIKv4H2
         6bog==
X-Gm-Message-State: APjAAAXKZdpG58GENVMN0JyLTGcTEv7lUaUxvUCNkQe8MMwR60GVBJWQ
        EEtvv8n6fkJ5swma0F6/kJ9OKA==
X-Google-Smtp-Source: APXvYqxWe1TIpyZhQSJHZuhdKpqdqu1LSZpLMRBP1tKUdcEtzz0MSfJkYL2nwemp56qLiEkvnThiSA==
X-Received: by 2002:adf:df0d:: with SMTP id y13mr24349476wrl.342.1570455376828;
        Mon, 07 Oct 2019 06:36:16 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id z125sm28460832wme.37.2019.10.07.06.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:36:15 -0700 (PDT)
Date:   Mon, 7 Oct 2019 14:36:15 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     yamada.masahiro@socionext.com, adam.zerella@gmail.com,
        michal.lkml@markovi.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: kbuild: Add document about namespaces
Message-ID: <20191007133615.GB23938@google.com>
References: <20191007030319.GA32575@gmail.com>
 <a5dfd064b9c14065a5be171cb68876c7@SOC-EX01V.e01.socionext.com>
 <20191007072538.4585be2c@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191007072538.4585be2c@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 07, 2019 at 07:25:38AM -0600, Jonathan Corbet wrote:
>On Mon, 7 Oct 2019 04:26:24 +0000
><yamada.masahiro@socionext.com> wrote:
>
>> > Sphinx outputs the following build warning:
>> >
>> > Documentation/kbuild/namespaces.rst:
>> > WARNING: document isn't included in any toctree
>>
>>
>> Oh, I did not notice this file was added to the kbuild directory.
>>
>> I do not understand why it is related to the build system.
>> So, I'd rather have this file somewhere else.
>
>Yeah, probably it makes sense to move it into the core-api manual.
>Matthias (added to CC) do you disagree?  If not, maybe Adam you could redo
>the patch with the move as well?

I am happy to follow a good suggestion as I wasn't sure about the
location in the first place.

Cheers,
Matthias

>
>Thanks,
>
>jon
