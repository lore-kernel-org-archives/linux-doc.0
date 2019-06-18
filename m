Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C1B497D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Jun 2019 15:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729398AbfFRPEj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Jun 2019 11:04:39 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40751 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729327AbfFRPEj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Jun 2019 11:04:39 -0400
Received: by mail-io1-f65.google.com with SMTP id n5so30558771ioc.7
        for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2019 08:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n+Ql3wVC/12fF84n4zpf2k7UpDcKmujEt1DaiiPw9qM=;
        b=S5z34YtusjYEDrmJRpYdDkLNkEyqZu2h0VztZzhWaBFSPMcfGjsfL4fPxA8epFlCl0
         7EYgCFMMMOJi+6eDL60CzSqoLl22mrz9wj837Byc3ao3hmvAIEgkqvGh252sQt+oHfQJ
         88csRkNqH6wPqPa8M6QrcTns38DwR0C+hDyr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n+Ql3wVC/12fF84n4zpf2k7UpDcKmujEt1DaiiPw9qM=;
        b=iwbRqCbYBnBvaacs6LQnzVgxiyyAbhbCwx2nRjiyEz/4eRqqfwVIRDOZRoC08zfXfr
         VqjF+iUPxBNPj3lf9eFVl1K0KJwhm9nkPuBWEGlnDCYDRxLHzxR4Tp8VweGTXXt2Kjqn
         HyHN4/tS9T99i2NBoW+xfvo4L5uz0Lh9zFHM0rzc56gxVeslE81v5hFjI2dg6A8XOUYK
         Kl1yxOiIedILchF0i296onpv3g/gvr2wBSXqdzJRxI2TAS7LUXvUGyTBhzZmncpeFWi5
         OvurKf5YZFYyuMapwJMy6xWpj0LDEWANpnG45YhaUnMG/0Lea+xkA5MXdsFWqVMl/8Do
         8RsA==
X-Gm-Message-State: APjAAAW5XIgCYrkuFyZK08jyZrlhOSqLtAFZrXsafrpdETwKjH1ROHMs
        vwMEdowBWJzazbBJRdXjOUOC0w==
X-Google-Smtp-Source: APXvYqxj0KuCDj3+zY6rRSN6uEABJMKSdM9JnxVOi3emiC+fs8zDQXFdWYHimb0In4JQsTwcp1rg4g==
X-Received: by 2002:a5e:a712:: with SMTP id b18mr6336031iod.220.1560870278397;
        Tue, 18 Jun 2019 08:04:38 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id n7sm16602070ioo.79.2019.06.18.08.04.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 08:04:37 -0700 (PDT)
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: platform: convert
 x86-laptop-drivers.txt to reST
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, cezary.jackiewicz@gmail.com,
        Darren Hart <dvhart@infradead.org>, andy@infradead.org,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     Puranjay Mohan <puranjay12@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20190618053227.31678-1-puranjay12@gmail.com>
 <20190618054158.GA3713@kroah.com> <20190618071717.2132a1b7@lwn.net>
 <20190618133948.GB5416@kroah.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8aeb222a-ee44-4125-45fd-ce9a741e7ecc@linuxfoundation.org>
Date:   Tue, 18 Jun 2019 09:04:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190618133948.GB5416@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/18/19 7:39 AM, Greg KH wrote:
> On Tue, Jun 18, 2019 at 07:17:17AM -0600, Jonathan Corbet wrote:
>> On Tue, 18 Jun 2019 07:41:58 +0200
>> Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>>> On Tue, Jun 18, 2019 at 11:02:27AM +0530, Puranjay Mohan wrote:
>>>> This converts the plain text documentation to reStructuredText format.
>>>> No essential content change.
>>>>
>>>> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
>>>> ---
>>>>   Documentation/platform/x86-laptop-drivers.rst | 23 +++++++++++++++++++
>>>>   Documentation/platform/x86-laptop-drivers.txt | 18 ---------------
>>>>   2 files changed, 23 insertions(+), 18 deletions(-)
>>>>   create mode 100644 Documentation/platform/x86-laptop-drivers.rst
>>>>   delete mode 100644 Documentation/platform/x86-laptop-drivers.txt
>>>
>>> Don't you also need to hook it up to the documentation build process
>>> when doing this?
>>
>> Hooking it into the TOC tree is a good thing, but I think it's also good
>> to think about the exercise in general.  This is a document dropped into
>> place five years ago and never touched again.  It's a short list of
>> seemingly ancient laptops with no explanation of what it means.  So the
>> real question, IMO, is whether this document is useful to anybody and, if
>> not, whether it should just be deleted instead.
> 
> I bet it should be deleted, but we should ask the platform driver
> maintainers first before we do that :)
> 

Adding Platform driver maintainers Darren Hart and Andy Shevchenko, and
Compal laptop maintainer Cezary Jackiewicz to the discussion.

+ platform-driver-x86@vger.kernel.org

Hi Darren, Andy, and Cezary,

Would it be okay to remove the x86-laptop-drivers.txt or should it be
converted to .rst and kept around?

thanks,
-- Shuah





