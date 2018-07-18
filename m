Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F86B7D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Jul 2018 14:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730151AbeGROoL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Jul 2018 10:44:11 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35231 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729185AbeGROoL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jul 2018 10:44:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id p10-v6so4223405ljg.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jul 2018 07:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=O8BaYOu5SbHyO8N5K98eagX0iw+1ClmX460ELB1HzEg=;
        b=qT6RgJBtRvEmwkmazLdnuhpUd16c4eFARpsN6+NpNEy8NHjzfnQSmJFLnW/V/0p8XD
         nQTfKYug8s85VYTekMRDjFgB8kpJie9C0RMksPUTgLz1j1tf597ZE3lKwiaf1wTWklks
         KRJZIRpyFFEUWvOBbK1zbALCbUk6AOn+ImtGRxdPlRGBkrqAVmOtqdE5WUl2wRj2gEpP
         y/M+pP0Nkh+YEbhlLte2yCTPb+nCSR3+DfIJMJpwXYEPKRflef3vR/wwKF2XWUJXWCzi
         niZ5G0OSmIVhCe1V/d4OrKMRPrRj4tv7K0mAa3lQidWExQfjiNYdBSAV4U39KrsqY0ky
         eNhw==
X-Gm-Message-State: AOUpUlHNgrituFI6R/1Dh2954pgpKaYyGZOX2+2rZoVfOXbywim0j78R
        SJT3EkuBksgs0eEKJp5KSytEbdWoR4WTfRgRw7LyDw==
X-Google-Smtp-Source: AAOMgpdorSGRtnK+08EioHv1U/+VC87chEnOLbtpn7UAc6hYzJh+yYiUDfyS8gGs4bibdOt8577oCW1av2puWNcsqGQ=
X-Received: by 2002:a2e:2282:: with SMTP id i124-v6mr1031823lji.11.1531922764956;
 Wed, 18 Jul 2018 07:06:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:4e8a:0:0:0:0:0 with HTTP; Wed, 18 Jul 2018 07:05:24
 -0700 (PDT)
In-Reply-To: <20180710151656.5ecaae11@lwn.net>
References: <CAF1GLkkzSzUnGKprz9CroVv=xBoUaym53PUTgi1RDNiEmr6PWw@mail.gmail.com>
 <20180710151656.5ecaae11@lwn.net>
From:   Prashant Dhamdhere <pdhamdhe@redhat.com>
Date:   Wed, 18 Jul 2018 19:35:24 +0530
Message-ID: <CAF1GLkk6fUbpdJhfNYhDL7NBf+chvv0H5SR-9_ofTrcHmqgDfQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: proc.txt: Adding 'HardwareCorrupted'
 parameter and description.
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 11, 2018 at 2:46 AM, Jonathan Corbet <corbet@lwn.net> wrote:
> On Tue, 10 Jul 2018 20:05:22 +0530
> Prashant Dhamdhere <pdhamdhe@redhat.com> wrote:
>
>> Signed-off-by: Prashant Dhamdhere <pdhamdhe@redhat.com>
>> ---
>>  Documentation/filesystems/proc.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/filesystems/proc.txt
>> b/Documentation/filesystems/proc.txt
>> index 520f6a84cf50..b2fa7e7c4300 100644
>> --- a/Documentation/filesystems/proc.txt
>> +++ b/Documentation/filesystems/proc.txt
>> @@ -870,6 +870,7 @@ Committed_AS:   100056 kB
>>  VmallocTotal:   112216 kB
>>  VmallocUsed:       428 kB
>>  VmallocChunk:   111088 kB
>> +HardwareCorrupted:   0 kB
>>  AnonHugePages:   49152 kB
>>  ShmemHugePages:      0 kB
>>  ShmemPmdMapped:      0 kB
>> @@ -915,6 +916,8 @@ MemAvailable: An estimate of how much memory is
>> available for starting new
>
> This patch, too, was corrupted by your mailer.  Please resubmit it after
> fixing the issue (and with a changelog, please).
>
> Thanks,
>
> jon


Hi Jon,

I have resubmitted this patch with a changelog, please review and share feedback
so that I will be able to submit other patches.

--
Prashant

>
>>         Dirty: Memory which is waiting to get written back to the disk
>>     Writeback: Memory which is actively being written back to the disk
>>     AnonPages: Non-file backed pages mapped into userspace page tables
>> +HardwareCorrupted: The amount of RAM/memory in KB, the kernel identified as
>> +              corrupted.
>>  AnonHugePages: Non-file backed huge pages mapped into userspace page tables
>>        Mapped: files which have been mmaped, such as libraries
>>         Shmem: Total memory used by shared memory (shmem) and tmpfs
>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
