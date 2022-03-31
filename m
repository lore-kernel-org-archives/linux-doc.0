Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EEEC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 31 Mar 2022 14:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233249AbiCaOed (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Mar 2022 10:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbiCaOed (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Mar 2022 10:34:33 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3281E5205
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 07:32:45 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n18so23568659plg.5
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7Ic7Zcg2hlIe1MxVHVupwGddd/M8f+eZCeloBe/VoYM=;
        b=MQ3FgIpNh+sakI0vBRtZW9mjsU6+hRbWetrltJV8ywuxcwDR8VAFCq0D/pziC8ifgq
         ZTj7/mBOxFicZr/i+95Ft6m3Oj1l5YkaHtiu1aMQWPvMLfdm8B3/ceIu6Z29D8TtdJfR
         AO+NJID4DDKwpRxLY3q2S8YRdVkxOXJCHCox+6w7Cwj0WtqcLuhGUwi657JSR6/EDhKJ
         GoLHOPGbmnSBNu9c+nlwGsrbMrTuJsgGzrKg7VE/d9qRCEoDb2XXpv/wWHifl3wXlX1B
         eR/AhcEdOoeJKyIFDtkBG3pDBchVU+PjrUKnZTN2ONUCOXf5KPxqwRZ7cz8RcqaJwxpb
         rTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7Ic7Zcg2hlIe1MxVHVupwGddd/M8f+eZCeloBe/VoYM=;
        b=n7jXnu7J0jLu89Ng0gCu8RT06NQxUudLEPa7dD5YNl5jTkuULD2wVUWd7fAkYbMx8v
         XK0ee8cHVhEt8CJ32jQ4Je1wKy2T1rIEtH3Mxu+nPD4/rPRMke/6SmcbR3ysYPR2hHYM
         flsOJ1sg1Tsr/wUG5kOc1y5ehGI26c9bA0ALBS0quh9h2GmHZi9vmiq82fEvN1TzJLTN
         kKgnCGLkNOwTf2Tr3euW7ed6Nr2t/+i7VcSr3wf3eq1qVsR+Jpoq5X8IziyI1C+gKN7G
         ++DjSDxGw5Br20fcfZylCOmcW0PfBhR3b8xzlWMfxLlpK5axOnOTDlFzvL9LbRFRGt2s
         BlnQ==
X-Gm-Message-State: AOAM5328pm7SZShcOnG/G3GFr+XXLe6dESpopKFTgGtlodrhXaDbs/5H
        8obZITSNzQqxsKwrGEEjMmo=
X-Google-Smtp-Source: ABdhPJygL92rpyJBHIcqY5595uLrRy2nvpWKm58uoVYzM07q+9ei0XsVBct5FkgFpbnWcsApn4EUPA==
X-Received: by 2002:a17:902:d714:b0:153:2e9:3bcc with SMTP id w20-20020a170902d71400b0015302e93bccmr5680332ply.83.1648737165249;
        Thu, 31 Mar 2022 07:32:45 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090a2c0c00b001bc4cf0107esm10304702pjd.53.2022.03.31.07.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 07:32:44 -0700 (PDT)
Message-ID: <edf80179-4776-773d-0c4a-e75a1824bfba@gmail.com>
Date:   Thu, 31 Mar 2022 23:32:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Akira Yokosawa <akiyks@gmail.com>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <871qyk7p28.fsf@meer.lwn.net> <20220330022534.10ac0a50@coco.lan>
 <ed2690db-84ae-5c85-f65d-e08021f5f562@gmail.com>
 <20220330190724.1596e01a@coco.lan>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220330190724.1596e01a@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 30 Mar 2022 19:07:24 +0200,
Mauro Carvalho Chehab wrote:
> Em Wed, 30 Mar 2022 23:59:05 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> Hi Mauro,
>>
>> On Wed, 30 Mar 2022 02:25:34 +0200,
>> Mauro Carvalho Chehab wrote:
>> [...]
>>> We need to verify both PDF and html generation, though, as I remember
>>> that some 4.x versions had/(have?) issues with the C domain and duplicate
>>> symbols detection.  
>>
>> Can you elaborate on the issue you observed?
>> In which document did you see it?
> 
> Sorry, it was on Sphinx 3.x, although the most complete fix got
> merged on 4.0, I guess. This patch is related to it:
> 
> 	b34b86d7a418 ("docs: conf.py: fix c:function support with Sphinx 3.x")
> 
> Basically, the Sphinx maintainer for the C domain rewrote the code,
> causing all references generated by kernel-doc to be broken, and
> almost all references at the media docs as well. Before the changes,
> there were just one domain for C code references, used for functions,
> structs, enums, etc. After the change, each one requires a different
> tag. The kerneldoc script has gained support for Sphinx version when
> such issue was addressed.
> 
> Another consequence of such change is that you can't have more than
> one "read()" function inside the entire Kernel. While this makes
> sense on userspace, It doesn't at Kernelspace, as different subsystems
> may handle read/write/ioctl/... syscalls on their particular ways.
> So, building docs were causing warnings about duplicated symbols.
> 
> There were some changes that went on 4.x to fix it, when 
> ".. c:namespace::" got merged. I don't remember when it was added.

Thank you for the detailed explanation.

So I compared logs from "make SPHINXDIRS=driver-api htmldocs" with
Sphinx 2.4.4 and 4.5.0 on current docs-next.

There are 8 more lines in the log from 4.5.0 than from 2.4.4, give
or take minor format differences.

Here are those extra 8 lines (long lines are kept):

----
/wk/Documentation/driver-api/usb/usb.rst:967: WARNING: Duplicate C declaration, also defined at usb/gadget:775.
Declaration is '.. c:struct:: usb_string'.
/wk/Documentation/driver-api/miscellaneous:48: ./drivers/pwm/core.c:679: WARNING: Duplicate C declaration, also defined at miscellaneous:305.
Declaration is '.. c:function:: int pwm_capture (struct pwm_device *pwm, struct pwm_capture *result, unsigned long timeout)'.
/wk/Documentation/driver-api/surface_aggregator/client-api:25: ./drivers/platform/surface/aggregator/controller.c:1689: WARNING: Duplicate C declaration, also defined at surface_aggregator/client-api:105.
Declaration is '.. c:function:: int ssam_request_sync (struct ssam_controller *ctrl, const struct ssam_request *spec, struct ssam_response *rsp)'.
/wk/Documentation/driver-api/80211/mac80211:109: ./include/net/mac80211.h:4811: WARNING: Duplicate C declaration, also defined at 80211/mac80211:1024.
Declaration is '.. c:function:: void ieee80211_tx_status (struct ieee80211_hw *hw, struct sk_buff *skb)'.
----

So those "WARNING: Duplicate C declaration" messages are what you
mentioned earlier, aren't they?

I'm looking at Documentation/driver-api/usb/usb.rst:967 and
usb/gadget.rst:775, but can't figure out what is/are wrong.

How am I supposed to interpret those messages?
Are those line counts of intermediate files or some such?

> 
>> Verification of generated HTML and PDF can be hard.
>>
>> Different Sphinx might generate slightly different .html or .tex
>> files with no visible effect in the final rendering.  Hmm...
> 
> That was not the case on that time. We had to stick to Sphinx up to
> version 2.4 for a couple of Kernel release cycles, in order to fix, as the
> changes weren't trivial.
> 
>> Do you have an idea for automated regression testing?
> 
> Except for doing periodic html and pdf builds and reporting build errors,
> no.

Ah, by "PDF and html generation", you meant build errors.
Now I understand what you said.

> 
> For html, perhaps some regression testing could be done by using pandoc
> to convert html back into ReST (or to some other format) and compare if the
> output from the same source with different Sphinx versions are identical 
> (or similar enough). On such case, I would get rid of using read the docs
> style, using the simplest possible one. That's easier said than done, though,
> as such conversion could produce errors due to problems on pandoc - or some
> minor differences - So, whomever would be running such tests would likely
> need to add something in order to handle similar but different outputs and
> exclude false-positives.

This sounds hard if not impossible...

        Thanks, Akira

> 
>>
>>>
>>> Also, it could be worth to check the build time with 2.4.4 and with
>>> whatever newer version we stick.  
>>
>> I agree. I'll see what I can do.
>>
>>         Thanks, Akira
>>
>>>   
>>>> So I'll just fast-track this
>>>> patch in; dropping it into the stable updates probably makes sense too.  
>>>
>>> Agreed.
>>>
>>> Thanks,
>>> Mauro  
> 
> 
> 
> Thanks,
> Mauro
