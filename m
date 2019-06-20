Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C01377D926
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Jun 2019 13:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731747AbfFTNio (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Jun 2019 09:38:44 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42008 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfFTNio (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jun 2019 09:38:44 -0400
Received: by mail-io1-f68.google.com with SMTP id u19so864006ior.9
        for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2019 06:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zM1I+AFmSj1LQ0M/T+xR3ArL000jWNNRfBPPk3QAc+o=;
        b=FBA7wXeKSJz5qlVuadKqqw5EKT+Ge0O185FI6n/xQOLGrJEA1KmEuKIxcUJIIR2ZID
         seas4TLnuOxNXDF4P/1USYyHm+iDHfENBMNvGX7qJd+p44cdNL3NQi4e+wxuv61lPicB
         XXxUMaQzkMCKJ1oU+s3TdNZ7D+4mj+ZiGVuQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zM1I+AFmSj1LQ0M/T+xR3ArL000jWNNRfBPPk3QAc+o=;
        b=mVh+G1P7pkBl7VXo2dwUTXiUwCYrIUT+f+VHCO48iC8Vpv4ZW6s+2oiCYUagZO/bsS
         pm9TQfL8DXad01xpmeahToQbKsqlxX1Q4yzcuWCmQLdB30BQDFkJ0P5d96V4gEiTpYMr
         YiVza/JmKidUiSQUV//8C9O7CzYhyQ+MhJB/xo7COQbZvuuqCPMtl9Yo4kFtn+hQxMCQ
         LSACMRzytasLbmcredYNxO/LufuqzfL9REEB+G4lA/yyQOMBk/57oULDV+NSxszbO6IP
         WwEni+lyPKq0ff2iYoQ/9vtdYBPaGA8O5/tG87sa8egS3niXt807375XLZNqjlqjBdC1
         1PnA==
X-Gm-Message-State: APjAAAUKpvbAklPB+5cQdohH245f5/hxeO860NWE48VE4P6bnOiIrya4
        eacOXHV7Uz1WYikk8jF73B04WQ==
X-Google-Smtp-Source: APXvYqyErKm3SQCklJFa5bOOBL2dXuou5zFbMDkVgJqGSixTktCbF9tnM8W969cEfQjb0GQBLq++GQ==
X-Received: by 2002:a6b:fe05:: with SMTP id x5mr8185908ioh.208.1561037923147;
        Thu, 20 Jun 2019 06:38:43 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id u26sm25191288iol.1.2019.06.20.06.38.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 06:38:42 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: platform: convert
 x86-laptop-drivers.txt to reST
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Puranjay Mohan <puranjay12@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20190618053227.31678-1-puranjay12@gmail.com>
 <20190618054158.GA3713@kroah.com> <20190618071717.2132a1b7@lwn.net>
 <20190618133948.GB5416@kroah.com>
 <8aeb222a-ee44-4125-45fd-ce9a741e7ecc@linuxfoundation.org>
 <CAHp75Vf__EtLVTOf0XvA3w7RPj+bnoQOud3gCXr1Fya0b_o4cw@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <bf25df8c-9135-c23b-0307-1e3ea611d9d4@linuxfoundation.org>
Date:   Thu, 20 Jun 2019 07:38:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf__EtLVTOf0XvA3w7RPj+bnoQOud3gCXr1Fya0b_o4cw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/20/19 12:19 AM, Andy Shevchenko wrote:
> On Tue, Jun 18, 2019 at 6:06 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>> On 6/18/19 7:39 AM, Greg KH wrote:
>>> On Tue, Jun 18, 2019 at 07:17:17AM -0600, Jonathan Corbet wrote:
>>>> On Tue, 18 Jun 2019 07:41:58 +0200
>>>> Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>> On Tue, Jun 18, 2019 at 11:02:27AM +0530, Puranjay Mohan wrote:
> 
>>> I bet it should be deleted, but we should ask the platform driver
>>> maintainers first before we do that :)
> 
>> Adding Platform driver maintainers Darren Hart and Andy Shevchenko, and
>> Compal laptop maintainer Cezary Jackiewicz to the discussion.
>>
>> + platform-driver-x86@vger.kernel.org
>>
>> Hi Darren, Andy, and Cezary,
>>
>> Would it be okay to remove the x86-laptop-drivers.txt or should it be
>> converted to .rst and kept around?
> 
> Shuan, thanks for heads up.
> The list of laptops supported by drivers in PDx86 subsystem is quite
> big and growing. The mentioned file contains less than per cent out of
> it and I don't think there is sense to make it up to date with
> thousands lines. Agree on removal.
> 

Thanks Andy!

Puranjay!

Please remove the file and cc everybody on this list on the v2 patch.
Make sure to build docs and see if this removal doesn't cause errors.

thanks,
-- Shuah
