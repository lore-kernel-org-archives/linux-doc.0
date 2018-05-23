Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C075E7D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 14:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933142AbeEWOde (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 10:33:34 -0400
Received: from mail-ot0-f193.google.com ([74.125.82.193]:45785 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933114AbeEWOdd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 10:33:33 -0400
Received: by mail-ot0-f193.google.com with SMTP id 15-v6so25426625otn.12;
        Wed, 23 May 2018 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l+w65klDHCvyTNJi6v/ef0iEN3gJDGJoCXj0g6kqToE=;
        b=dcaR6e4lKYirNDISzH0DNdxrT4QysJjh9HbZKjLDmWMlpOtrhzQQ6InjXwDW3S92BE
         vyPo8uzMdXl2D6FPn0oqfNsK+LIZ8yDb1UFC4y3dTa/D/MdgBCPg1wbJKqdhG+0WqFOB
         OsJCN8r/wqsnUJQIJOCA5qe88xsECW/OADbJ1xLYxe6Lv57QgiQs06buw6pueWGIOVhc
         ZghdWSI7P3a6/SSosvwQcrhrrD6QMgucyD0gupjMESoHbMvz4bfAjcGkqfRzQO7fPMEk
         RS3xyI65oiLToxpK+ubrzV9YBa5lUCZ5U7/JYL9zTliMVBzkoeKvZzxmOAuDSw/lmwI1
         Y1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l+w65klDHCvyTNJi6v/ef0iEN3gJDGJoCXj0g6kqToE=;
        b=k5XfGxcbzcpFo9WDGBtDK+b7O0tt9FX7WAeu7Z7KSw4DZEZ2P0MEP5UeQD9yu1PtJE
         eqoVlT4xu8rtw4r2iy/e8Bl3ZuF0k5Uw6VJH8EP+D3I9MqdejJPGb8bu0IuQIPkhL7O4
         JiVCqeYaeIJ9mvVp3X17td/j8bNn3uICGWCyIIQkCCMMObCKhdTsExJ8fh6FpNNm97wM
         V0Fs6uymDzW0jhUSt5F3fHcsX5aSsFlIIPTmLDTGD/aiXBVKN3try+Q3Vl1Xuw7lqOAG
         r+Q4c6x+B6p56awzuLq8Mb5QnrL/JBN7nOEWT3HnAov8zWV1j3KJ4ufkz0kxULulxVjy
         12Tg==
X-Gm-Message-State: ALKqPwdUi2bXKCkMvffY5E8swtDZPK+Tvf4rXPoHa+A96TQZeVkJT/L+
        IHBAmWZ5g91B4reQlUuq15I=
X-Google-Smtp-Source: AB8JxZoRSI8RU6d743RYWfMRz8/mg7mmc3pXhHy/RBLZO/JOltxkxtCHxK6Ly4r1N2T0NzY4pRbffA==
X-Received: by 2002:a9d:26a2:: with SMTP id l31-v6mr1948245otb.303.1527086012201;
        Wed, 23 May 2018 07:33:32 -0700 (PDT)
Received: from nuclearis2_1.gtech (c-98-201-114-184.hsd1.tx.comcast.net. [98.201.114.184])
        by smtp.gmail.com with ESMTPSA id w12-v6sm10016724otg.5.2018.05.23.07.33.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 May 2018 07:33:31 -0700 (PDT)
Subject: Re: [PATCH 1/5] PCI/AER: Define and allocate aer_stats structure for
 AER capable devices
To:     Jes Sorensen <jsorensen@fb.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Rajat Jain <rajatja@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle McMartin <jkkm@fb.com>,
        rajatxjain@gmail.com
References: <20180522222805.80314-1-rajatja@google.com>
 <20180522222805.80314-2-rajatja@google.com>
 <62fae8eb-aaed-65b2-19ad-7c57b3a9bfdc@fb.com>
 <20180523142656.GE19987@bombadil.infradead.org>
 <46f0a2fa-9b48-c6d3-05ac-a75168b1998c@fb.com>
From:   "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <ffa4e203-f320-b9be-c0d7-8432e949765b@gmail.com>
Date:   Wed, 23 May 2018 09:33:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <46f0a2fa-9b48-c6d3-05ac-a75168b1998c@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/23/2018 09:32 AM, Jes Sorensen wrote:
> On 05/23/2018 10:26 AM, Matthew Wilcox wrote:
>> On Wed, May 23, 2018 at 10:20:10AM -0400, Jes Sorensen wrote:
>>>> +++ b/drivers/pci/pcie/aer/aerdrv_stats.c
>>>> @@ -0,0 +1,64 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>
>>> Fix the formatting please - that gross // gibberish doesn't belong there.
>>
>> Sorry, Jes.  The Chief Penguin has Spoken, and that's the preferred
>> syntax:
>>
>> 2. Style:
>>
>>    The SPDX license identifier is added in form of a comment.  The comment
>>    style depends on the file type::
>>
>>       C source: // SPDX-License-Identifier: <SPDX License Expression>
>>
>> (you can dig up the discussion around this on the mailing list if you
>> like.  Linus actually thinks that C++ single-line comments are one of
>> the few things that language got right)
> 
> Well I'll agree to disagree with Linus on this one. It's ugly as fsck
> and allows for ambiguous statements in the code.

You misspelled "fuck".

Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
