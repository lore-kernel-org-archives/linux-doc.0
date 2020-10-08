Return-Path: <SRS0=DBCI=DP=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2DAC433E7
	for <linux-doc@archiver.kernel.org>; Thu,  8 Oct 2020 17:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49EFB221FC
	for <linux-doc@archiver.kernel.org>; Thu,  8 Oct 2020 17:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTf1SS8Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731249AbgJHRMu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Oct 2020 13:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730950AbgJHRMu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Oct 2020 13:12:50 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AFAC061755
        for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2020 10:12:50 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id c22so9232044ejx.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2020 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bd8aNs8ipIt2zW+j3r2JDonZYxducPjL4i15IrJkknE=;
        b=PTf1SS8QTQMDAVAbreA4ZZULOBjQMS1WdoX7Yar82z/phfGAnrvpKR/Qo/GfiZgpFD
         5TDnbtIJAfVUU7nS8vHd2XD+lVMhITIzbKgu1jPFjd97QZ9nKLAvF22RZqjiZoLzTVKt
         Olw9uEX1qwxzOkWxjHBi49ETta2xLSm+Amb+OPdMit/i2Il/z/7s40qdrftAMYX0jK2z
         3W1EpSqFF5gtNP5QW6VOJS/paTnPSW28uPPT15UffgC0s1u6KyS2Ma6u2Kg/ApizHE5O
         2+TStFHPokEHmnVb3XyEbtl/wR9pNK3nTSYM5QZfS7wzxxnICANkxnVpdZ3bvX7JQ8Nx
         Ey3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bd8aNs8ipIt2zW+j3r2JDonZYxducPjL4i15IrJkknE=;
        b=REhE8N0wm+cWzDAoPvrjDaurkI14VN9sTEKNTMNXBk3oIiH8B29+3hbDGjqSaOscpr
         EbMkjTIIdfCMEoPLfqlAjN+MJXxg3yJcw0OscyevII3HCbgnV2jPqXSE345lUX2TRdmd
         Pt+gj3U1KQKrNcwqZYBSF7zy/Moi1f2ERAtHqeQuaBTDCb9Q0t4veCDHJld4TdO7CZvk
         X63jBKKu6crQnKC8+k/RuXJpdQf2ACxRJJQNsGRh7QFZPPi6eZ47iCHVECZd+mRui0mt
         rbWbH7BDfQj+1pCEIbCGK9hhT4kZ1M1dQ06Ufd6AO6hcMahRaVaEvcXkVQ0aFfnoFKFG
         Vg6Q==
X-Gm-Message-State: AOAM533DVC75aiOlfxPeO9ll14DSlx2BOZnwxY0VS8l2HxkHzOx7Hei8
        7DBlbEMLoTtNrS/e51cF6+2pKIKLQ2OjNA==
X-Google-Smtp-Source: ABdhPJxDUBjqcEfjcuNXI9dS7gm8UARCyk8kaMuJFcewCHy93twyu9lCtnNb3fUcZIiA25tOiYztyA==
X-Received: by 2002:a17:906:6a47:: with SMTP id n7mr9645773ejs.306.1602177168894;
        Thu, 08 Oct 2020 10:12:48 -0700 (PDT)
Received: from ?IPv6:2001:16b8:46bf:df00:5ec5:d4ff:fe9b:465? (200116b846bfdf005ec5d4fffe9b0465.dip.versatel-1u1.de. [2001:16b8:46bf:df00:5ec5:d4ff:fe9b:465])
        by smtp.gmail.com with ESMTPSA id a22sm4454999ejs.25.2020.10.08.10.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 10:12:48 -0700 (PDT)
Subject: Re: [PATCH 1/1] docs: fix kernel-driver-statement rendering
To:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, harryxiyou@gmail.com
References: <20201005130213.74624-1-hartergaetan@gmail.com>
 <20201005130213.74624-2-hartergaetan@gmail.com>
 <20201005093704.32dd98ec@lwn.net>
 <dd8ed7601ba53e74ec9ffef16cb35759@vaga.pv.it>
From:   =?UTF-8?Q?Ga=c3=abtan_Harter?= <hartergaetan@gmail.com>
Message-ID: <a68228fc-174f-6c7b-fcdc-6e0961611719@gmail.com>
Date:   Thu, 8 Oct 2020 19:12:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <dd8ed7601ba53e74ec9ffef16cb35759@vaga.pv.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/6/20 9:34 AM, Federico Vaga wrote:
> Without implementing any hack, can't we put the full name? Or just remove "J." :)

I would not dare myself to change the names just as an outsider.
If there is a positive feedback for this one, I could de the change.
I currently only identified 5 other places where this currently applies [1]
so would be a reasonable task to do.

> 
> On 2020-10-05 17:37, Jonathan Corbet wrote:
>> On Mon,  5 Oct 2020 15:02:13 +0200
>> Gaëtan Harter <hartergaetan@gmail.com> wrote:
>>
>>> Remove the extra newline and indentation after `J. Bruce Fields` in the
>>> rendered html, and extra indentation in the rendered pdf.
>>>
>>> The `J.` sequence was interpreted by sphinx as a letter ordered list
>>> starting at letter `J`.  It produced a sub ordered list as item of the
>>> main item list.
>>>
>>>     <li><ol class="first upperalpha" start="10">
>>>     <li>Bruce Fields</li>
>>>     </ol>
>>>     </li>
>>>
>>> The escaping is done before the name and not between the `J` and `.` to
>>> keep the name writing intact.
>>>
>>> Signed-off-by: Gaëtan Harter <hartergaetan@gmail.com>
>>> ---
>>>  Documentation/process/kernel-driver-statement.rst               | 2 +-
>>>  .../translations/it_IT/process/kernel-driver-statement.rst      | 2 +-
>>>  .../translations/zh_CN/process/kernel-driver-statement.rst      | 2 +-
>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/process/kernel-driver-statement.rst b/Documentation/process/kernel-driver-statement.rst
>>> index a849790a68bc..3a89fec1882e 100644
>>> --- a/Documentation/process/kernel-driver-statement.rst
>>> +++ b/Documentation/process/kernel-driver-statement.rst
>>> @@ -67,7 +67,7 @@ today, have in the past, or will in the future.
>>>   - Pekka Enberg
>>>   - Jan Engelhardt
>>>   - Mark Fasheh
>>> - - J. Bruce Fields
>>> + - \ J. Bruce Fields
>>>   - Larry Finger
>>
>> Thanks for figuring this out and explaining it so well.  This is a sad
>> ambiguity in the RST syntax, I guess.
>>
>> In this case, though, I'm not convinced that the cure isn't worse than the
>> disease.  We've traded a blank line in the HTML output for some ugly
>> markup in the original text; I'm not sure we want to do that.

As mentioned in my email I also had doubts about it.

I checked and saw the escape character used in some other files, for example
`Documentation/cdrom/cdrom-standard.rst` where it was in the middle of the text.
Being somehow a political decision what was more important between the source and
the rendered output. So thought it was worth proposing at least.


For this one it seemed not too too bad being in front only, but for ones with
several parts it is quite ugly like in `userspace-api/media/dvb/dvbapi.rst` see [1].
Unfortunately there is no "verbatim" mode that is not displayed as code.


>>
>> For this particular file, perhaps the best solution is just to put the
>> list of signatures into a literal block.  The fix for other occurrences
>> may be different.
>>


I did an analysis of the other `upperalpha` occurrences [2].
I excluded the ones that are of different types. I can propose separate patches for them.

This would currently leave only the following 5 cases with the same reason due to name shortening.
As it checks the html, it only finds the documents converted to `rst` I think.

I did use the same fix to make them visible.
Most of them would not work with a literal block I think as being as would constrain more things.


Putting the full name as suggested by Federico could solve them.
Would you agree with this kind of solution?


Best Regards,
Gaëtan



1:

diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
index 0b36b9ebfa4b..4eb62b8aacd0 100644
--- a/Documentation/PCI/pcieaer-howto.rst
+++ b/Documentation/PCI/pcieaer-howto.rst
@@ -5,7 +5,7 @@
 The PCI Express Advanced Error Reporting Driver Guide HOWTO
 ===========================================================
 
-:Authors: - T. Long Nguyen <tom.l.nguyen@intel.com>
+:Authors: - \ T. Long Nguyen <tom.l.nguyen@intel.com>
           - Yanmin Zhang <yanmin.zhang@intel.com>
 
 :Copyright: |copy| 2006 Intel Corporation
diff --git a/Documentation/ia64/efirtc.rst b/Documentation/ia64/efirtc.rst
index fd8328408301..46985b7ec6f5 100644
--- a/Documentation/ia64/efirtc.rst
+++ b/Documentation/ia64/efirtc.rst
@@ -2,7 +2,7 @@
 EFI Real Time Clock driver
 ==========================
 
-S. Eranian <eranian@hpl.hp.com>
+\ S. Eranian <eranian@hpl.hp.com>
 
 March 2000
 
diff --git a/Documentation/scsi/scsi-changer.rst b/Documentation/scsi/scsi-changer.rst
index ab60e7e61a6c..0edd72ec0bec 100644
--- a/Documentation/scsi/scsi-changer.rst
+++ b/Documentation/scsi/scsi-changer.rst
@@ -167,7 +167,7 @@ method.  With (more or less) help from:
 
 	- Daniel Moehwald <moehwald@hdg.de>
 	- Dane Jasper <dane@sonic.net>
-	- R. Scott Bailey <sbailey@dsddi.eds.com>
+	- \ R. Scott Bailey <sbailey@dsddi.eds.com>
 	- Jonathan Corbet <corbet@lwn.net>
 
 Special thanks go to
diff --git a/Documentation/userspace-api/media/dvb/dvbapi.rst b/Documentation/userspace-api/media/dvb/dvbapi.rst
index 74b16ab3fd94..ed38f25093ff 100644
--- a/Documentation/userspace-api/media/dvb/dvbapi.rst
+++ b/Documentation/userspace-api/media/dvb/dvbapi.rst
@@ -61,11 +61,11 @@ Revision and Copyright
 
 Authors:
 
-- J. K. Metzler, Ralph <rjkm@metzlerbros.de>
+- \ J.\ K. Metzler, Ralph <rjkm@metzlerbros.de>
 
  - Original author of the Digital TV API documentation.
 
-- O. C. Metzler, Marcus <rjkm@metzlerbros.de>
+- \ O.\ C. Metzler, Marcus <rjkm@metzlerbros.de>
 
  - Original author of the Digital TV API documentation.
 
diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 3c9634173e82..29d11be791fe 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -413,4 +413,4 @@ VP8
 
 :title:     RFC 6386: "VP8 Data Format and Decoding Guide"
 
-:author:    J. Bankoski et al.
+:author:    \ J. Bankoski et al.




2:

    grep --color=auto -Inr \
        -C 1 \
        -e "upperalpha" \
        --exclude-dir=_static \
        \
        $(: This ones should be fixed, they must be titles) \
        --exclude=fbcon.html \
        \
        $(: Copyright symbol \(C\), replace by |copy|) \
        --exclude=basic-pm-debugging.html \
        --exclude=c2port.html \
        --exclude=charger-manager.html \
        --exclude=drivers-testing.html \
        --exclude=freezing-of-tasks.html \
        --exclude=opp.html \
        --exclude=overview.html \
        --exclude=runtime_pm.html \
        --exclude=suspend-and-cpuhotplug.html \
        --exclude=swsusp-and-swap-files.html \
        --exclude=tlan.html \
        --exclude=userland-swsusp.html \
        \
        $(: Should be interpreted as list items but not all are) \
        --exclude=3270.html \
        --exclude=rpc-server-gss.html \
        \
        $(: Q/A may not be a list item? or could just stay anyway) \
        --exclude=stat.html \
        \
        $(: These seems to be legitimate uses) \
        --exclude=acpi-lid.html \
        --exclude=arcmsr_spec.html \
        --exclude=bcache.html \
        --exclude=dpio-driver.html \
        --exclude=drm-kms-helpers.html \
        --exclude=dscr.html \
        --exclude=fuse.html \
        --exclude=linuxized-acpica.htm \
        --exclude=linuxized-acpica.html \
        --exclude=memory-hotplug.html \
        --exclude=mmu_notifier.html \
        --exclude=resctrl_ui.html \
        --exclude=sentelic.html \
        --exclude=sharedsubtree.html \
        \
        Documentation/output/



>> Thanks,
>>
>> jon
> 

