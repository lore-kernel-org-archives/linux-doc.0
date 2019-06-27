Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CBA597D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 27 Jun 2019 16:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfF0Qs1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Jun 2019 12:48:27 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43368 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbfF0Qs1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 12:48:27 -0400
Received: by mail-io1-f68.google.com with SMTP id k20so6195590ios.10
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FSxEQEwWXUDItNoK7vY0AlbovOjmluDRF+4HCcUcjTM=;
        b=fA0ca0ckexfe+375seGTFN8cd84uWva+6RdFl/AkmQYIihmm8vjxWWbj6rBQCgQRwD
         DjR9pIMXgPWpG68ir6UBjicQkg8d7oTnyx3LVirlRaDZgapXZNydLZDnCETW+bu1cCrs
         gk+AwiJj/Sx+yIv7pmsTesPz10DV1oWu2assY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FSxEQEwWXUDItNoK7vY0AlbovOjmluDRF+4HCcUcjTM=;
        b=Weh6q8b/G3N+HjYwYQDRrQRQtpzPVL/gp4J7Rr/oTJOfekzlLp7tIpIwkXtfFGP55+
         D5ivQOEDMAyldxQ1YgmkPZ4B48UMSEOtV+Q7p9P8CX1BC7eKOS7K1UI7kYAIooy0h893
         kUPEs4FlEn89wog10PisZsLcus30c3vLZTOYVNpIv7BlMxS9pVwWEDoVeoROezZmHr4f
         WMF7E4ap54kVquj/bW9EXX01OK9TbKqjRdShwxpzfYx87pFxASxH8QMS4Pv0RqdiUTHs
         ZaFmqDvkPqj+W8VA4MTcWvGokB/C9r6K36sJm5/YHzfqfUwp11cXTHtwZZJ51v6+ox0B
         /N+g==
X-Gm-Message-State: APjAAAVv3hT24VXxsph6IKI3NYMWUnhrobMH5UrKiGmHUfRQ8pAqYQ8/
        cBZ6Bj92QRDtlsGpEihCmQW2oQ==
X-Google-Smtp-Source: APXvYqzlOYEOG860XZk8yS7NdvJ5w74zHEwO4hSyDTzIQxgV2ZhSLo4vBcRx2qRAS1rEu2ND476QEw==
X-Received: by 2002:a02:a07:: with SMTP id 7mr5876624jaw.65.1561654106422;
        Thu, 27 Jun 2019 09:48:26 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c2sm1852242iok.53.2019.06.27.09.48.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 09:48:25 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees][PATCH v5 1/5] Documentation: RCU: Convert
 RCU basic concepts to reST
To:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Jiunn Chang <c0d1n61at3@gmail.com>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        rcu@vger.kernel.org, linux-doc@vger.kernel.org,
        paulmck@linux.ibm.com, josh@joshtriplett.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        joel@joelfernandes.org,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <20190626191249.21135-1-c0d1n61at3@gmail.com>
 <20190626200705.24501-2-c0d1n61at3@gmail.com>
 <20190627083443.4f4918a7@lwn.net>
 <20190627111324.1db0f1ec@gandalf.local.home>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <83bb7141-d291-de27-f833-6fa485b406b6@linuxfoundation.org>
Date:   Thu, 27 Jun 2019 10:48:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627111324.1db0f1ec@gandalf.local.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/27/19 9:13 AM, Steven Rostedt wrote:
> On Thu, 27 Jun 2019 08:34:43 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
> 
>> On Wed, 26 Jun 2019 15:07:01 -0500
>> Jiunn Chang <c0d1n61at3@gmail.com> wrote:
>>
>>> RCU basic concepts reST markup.
>>>
>>> Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
>>> Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
>>
>> So this is a little detail but ... your signoff should be the last thing
>> in the set of tags on the patch.
> 
> Note, I've been seeing this a lot lately, and then noticed, that when I
> downloaded a patch directly from patchwork, it placed all the
> Reviewed-by and Acked-by tags after the original Signed-off-by. I
> checked the original patch on the mailing list, and it had no other
> tags but the Signed-off-by. I then pulled one of my own patches, and it
> did it to that patch as well.
> 
> I too prefer the Signed-off-by be last, but our tooling needs to do
> this as well, otherwise it's a failure in our procedures.
> 

Thanks Steve for pointing this out. I am seeing some odd behavior with tags.

It appears some maintainers want the tags in chronological order, which
is Reviewed-by after Signed-off which doesn't make sense to me.

I prefer Signed-off-by last.

I am working on FAQ (Frequently Answered Questions) section for mentees.
I will add this to it.

thanks,
-- Shuah


