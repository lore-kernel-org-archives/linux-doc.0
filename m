Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E9D57D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 23:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753235AbeEVXT2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 19:19:28 -0400
Received: from mail-oi0-f68.google.com ([209.85.218.68]:39698 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753029AbeEVXT0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 19:19:26 -0400
Received: by mail-oi0-f68.google.com with SMTP id n65-v6so17822961oig.6
        for <linux-doc@vger.kernel.org>; Tue, 22 May 2018 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=PSL3G1GIN3sf1jsXntaCTC2OY0wSHqzkBqBed/etgqE=;
        b=dQLLiSoKgtedJEmTxLdY1YkneuOpDvqq15JdCrrh2qeTrAFzUfn15q8qOU9+06L+OF
         54kMZ2X8t5zyKVCEg0luBY5L6Qelf2iQmuA0LEyYurDFDRrGS/R4kV0D75jZvAAv0al/
         oQrUTgq2p5nTd685gwvCt1XOqKyh+FF0qF06H8IVkMOZJhutbxkm0iMYEudIV9IowqzJ
         XrdQRlDHct8yoCB8U3tZOeppoJtoHhbzgdZAMmoCXLrO9FvvcYxAU2IqG6+UQAIfNBfW
         ddDRQSUk3qkax56i1Vlod01UQR/SpJkvjofvTs91rZ6UWurtdXq7xqA99Ij3jsj5WM6T
         Ojlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=PSL3G1GIN3sf1jsXntaCTC2OY0wSHqzkBqBed/etgqE=;
        b=hAq+cdzFtaVmmiHKMMv3iuR9awcAhOkX8M97ao2MSSZcsRnW8XQP5DWugLH/trmVQh
         JkhCkS1GOD94onn8AUYmIax4fskw0wxRxVJzLbJYz0r8A/L2G6kk/WU7p20gGBbR2uGj
         kZEoTerCMiZADpYbJMIuRHTfGDMk8o7FpfiHVy1Bjp7aGBHDxzeFW7TvOBsioEUJ5BWJ
         eE84zQAx2Vl9zOVL8qWBUZFaD5WcaX5e8479lpDx0KsgoSRamili1WAKdQNlqArmG0b4
         EcXD3fpEOWj6tziBpZ7UtoBN8yAKqrF8upAQypf+pPbmEzQpqtMxf3PNsyVxiJMY4Kcn
         DUSQ==
X-Gm-Message-State: ALKqPwfaOgrOUbBd4X/Kod0MpoSJ3eI/35U9IS4WDmiAFsj4U/51lWxK
        zT3x7PuqDgljvAj6KV8qfVe3UQSpHPZi61TUe7+8ow==
X-Google-Smtp-Source: AB8JxZo3sg0krcN0WGS+B6Rv64gx3j2/rI+gDZXvUc2ibzx3qxdx/XT8m4lCBIqaNk/ld5t9BkfXYeSwxNUwv1uUXQw=
X-Received: by 2002:aca:4f57:: with SMTP id d84-v6mr254115oib.138.1527031165480;
 Tue, 22 May 2018 16:19:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b57:0:0:0:0:0 with HTTP; Tue, 22 May 2018 16:18:45 -0700 (PDT)
In-Reply-To: <cffe5b81-a05c-a249-8c36-70a9c4d61e7f@gmail.com>
References: <20180522222805.80314-1-rajatja@google.com> <20180522222805.80314-6-rajatja@google.com>
 <cffe5b81-a05c-a249-8c36-70a9c4d61e7f@gmail.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 22 May 2018 16:18:45 -0700
Message-ID: <CACK8Z6E7Ax=_Ai7XOic5hWMRqQXiOox2z-w23j0S3O9P5AnCLw@mail.gmail.com>
Subject: Re: [PATCH 5/5] Documentation/PCI: Add details of PCI AER statistics
To:     "Alex G." <mr.nuke.me@gmail.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
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
        linux-pci <linux-pci@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jes Sorensen <jsorensen@fb.com>, Kyle McMartin <jkkm@fb.com>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Tue, May 22, 2018 at 3:52 PM, Alex G. <mr.nuke.me@gmail.com> wrote:
> On 05/22/2018 05:28 PM, Rajat Jain wrote:
>> Add the PCI AER statistics details to
>> Documentation/PCI/pcieaer-howto.txt
>>
>> Signed-off-by: Rajat Jain <rajatja@google.com>
>> ---
>>  Documentation/PCI/pcieaer-howto.txt | 35 +++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/PCI/pcieaer-howto.txt b/Documentation/PCI/pcieaer-howto.txt
>> index acd0dddd6bb8..86ee9f9ff5e1 100644
>> --- a/Documentation/PCI/pcieaer-howto.txt
>> +++ b/Documentation/PCI/pcieaer-howto.txt
>> @@ -73,6 +73,41 @@ In the example, 'Requester ID' means the ID of the device who sends
>>  the error message to root port. Pls. refer to pci express specs for
>>  other fields.
>>
>> +2.4 AER statistics
>> +
>> +When AER messages are captured, the statistics are exposed via the following
>> +sysfs attributes under the "aer_stats" folder for the device:
>> +
>> +2.4.1 Device sysfs Attributes
>> +
>> +These attributes show up under all the devices that are AER capable. These
>> +indicate the errors "as seen by the device". Note that this may mean that if
>> +an end point is causing problems, the AER counters may increment at its link
>> +partner (e.g. root port) because the errors will be "seen" by the link partner
>> +and not the the problematic end point itself (which may report all counters
>> +as 0 as it never saw any problems).
>
> I was afraid of that. Is there a way to look at the requester ID to log
> AER errors to the correct device?

I do not think it is possible to pin point the source of the problem.
Errors may be caused due to sub optimal link tuning, or signal
integrity, or either of the link partners. Both the link partners will
detect and report the errors that they "see".

The bits and errors defined by the PCIe spec, follow the same semantics i.e.
 => the spec defines the different error conditions "as
seen/encountered by the device",
       => Thus the device reports those errors to the root port
               => which is what we are counting and reporting here.

IMHO, any interpretation / analysis of this error data / counters
should be left to the user so that he can look at different devices
and the errors they see, and then conclude on what might be the
problem.

Thanks,
Rajat

>
> Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
