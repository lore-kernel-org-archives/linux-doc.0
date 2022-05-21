Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619E4C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 21 May 2022 09:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbiEUJ7T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 May 2022 05:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiEUJ7S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 May 2022 05:59:18 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3CD13CA2C
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 02:59:17 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id fw21-20020a17090b129500b001df9f62edd6so7864877pjb.0
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OtU8FziZb/lC8t0C+7jzgpt3U+UNsyu0kRLIQ0lPe0s=;
        b=cipNdOcr5e6amCVEH4sAyMOFAE+nhxW5iFNqajomV15aejoLx7Jnirv/AVOLQVic3o
         uYnI1adzxWJHbMmIiCY4I+9ZwtPfBZMpZmFyeSszm72XGrhkmj779m1rpJPq9FS/LE3F
         V6nvsyNYjppOXJrUlaTKCyNBqIXvVx8Vhtj/6HGrnKHjBAXiPY2bzz4w1+UfXree8dto
         SqHPVafLNOtAOeIQBeuvihB/K0lEqUmTeu/WtAtP2l2/IUQB/i/fJVWRqElsmz80PWBk
         6RQthr8pYutfxLsRU62N71UlAmTSqnTNvdB0oobm8EISAwtJHYA4T8g0qiEQCF/GSKPH
         0B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OtU8FziZb/lC8t0C+7jzgpt3U+UNsyu0kRLIQ0lPe0s=;
        b=5WsCFSd+ovhIev5WTov7+/0M2lqLbaMuFYAcNYgbs/nnOe2uTKq1fL6jnq1tOj6VhH
         rbj4gfzigZJ0tNeUXn0UYA/rS6cVAWKi4Sm1YgbJOd6ORdF6bMuo3+lUr73KNO2IRPeB
         de63H6kGcNPuA0Viqo6t7fOJrP7XT4jPXUbI8MrxBWtWA/T9Xf5zPso4tAvoCru9kkk7
         pwTUYkClUKTMC34JNaUpLnjL2Z7IVg4AmocxSJHZ4E7PrKkkoLwLaClNGA8TN7dc/X39
         8YPTPqXNJYtnVa3Ul9HrsBpAaX+SbR5H9dlSnO2QwR24SndY0ldYXdDZepnGHpsLGhCJ
         74ow==
X-Gm-Message-State: AOAM531Q/cxgZEF4214nZPODBFkh+TdKre/Cn9y8aRa/TR/z/07ZisSc
        NV7YlTWCqy/syCosv7Uzzxg=
X-Google-Smtp-Source: ABdhPJxjz8JnSCl7uDf7Q4gmhJRxnIo+xJttBfZ24kZwdk3SWd715y3qi2bgdEYRTZumPZA+7VPqTQ==
X-Received: by 2002:a17:90a:4f0a:b0:1df:b37b:75b1 with SMTP id p10-20020a17090a4f0a00b001dfb37b75b1mr16307748pjh.199.1653127156523;
        Sat, 21 May 2022 02:59:16 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d6-20020a17090a7bc600b001df4c27e5a5sm3316956pjl.35.2022.05.21.02.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 02:59:15 -0700 (PDT)
Message-ID: <c03f546e-aef2-f53c-4037-54f3715db799@gmail.com>
Date:   Sat, 21 May 2022 18:59:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: "WARNING: Duplicate C declaration" from recent Sphinx (was Re:
 [PATCH] docs: sphinx/requirements: Limit jinja2<3.1)
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Akira Yokosawa <akiyks@gmail.com>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <871qyk7p28.fsf@meer.lwn.net> <20220330022534.10ac0a50@coco.lan>
 <ed2690db-84ae-5c85-f65d-e08021f5f562@gmail.com>
 <20220330190724.1596e01a@coco.lan>
 <edf80179-4776-773d-0c4a-e75a1824bfba@gmail.com>
 <564cbd05-8788-9223-1ecc-59e7fc41b46a@gmail.com>
 <20220521114629.6ee9fc06@coco.lan>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220521114629.6ee9fc06@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/05/21 18:46,
Mauro Carvalho Chehab wrote:
> Em Sat, 21 May 2022 16:58:45 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> On Thu, 31 Mar 2022 23:32:41 +0900,
>> Akira Yokosawa wrote:
>>> On Wed, 30 Mar 2022 19:07:24 +0200,
>>> Mauro Carvalho Chehab wrote:  
>>>> Em Wed, 30 Mar 2022 23:59:05 +0900
>>>> Akira Yokosawa <akiyks@gmail.com> escreveu:
>>>>  
>>>>> Hi Mauro,
>>>>>
>>>>> On Wed, 30 Mar 2022 02:25:34 +0200,
>>>>> Mauro Carvalho Chehab wrote:
>>>>> [...]  
>>>>>> We need to verify both PDF and html generation, though, as I remember
>>>>>> that some 4.x versions had/(have?) issues with the C domain and duplicate
>>>>>> symbols detection.    
>>>>>
>>>>> Can you elaborate on the issue you observed?
>>>>> In which document did you see it?  
>>>>
>>>> Sorry, it was on Sphinx 3.x, although the most complete fix got
>>>> merged on 4.0, I guess. This patch is related to it:
>>>>
>>>> 	b34b86d7a418 ("docs: conf.py: fix c:function support with Sphinx 3.x")
>>>>
>>>> Basically, the Sphinx maintainer for the C domain rewrote the code,
>>>> causing all references generated by kernel-doc to be broken, and
>>>> almost all references at the media docs as well. Before the changes,
>>>> there were just one domain for C code references, used for functions,
>>>> structs, enums, etc. After the change, each one requires a different
>>>> tag. The kerneldoc script has gained support for Sphinx version when
>>>> such issue was addressed.
>>>>
>>>> Another consequence of such change is that you can't have more than
>>>> one "read()" function inside the entire Kernel. While this makes
>>>> sense on userspace, It doesn't at Kernelspace, as different subsystems
>>>> may handle read/write/ioctl/... syscalls on their particular ways.
>>>> So, building docs were causing warnings about duplicated symbols.
>>>>
>>>> There were some changes that went on 4.x to fix it, when 
>>>> ".. c:namespace::" got merged. I don't remember when it was added.  
>>>
>>> Thank you for the detailed explanation.
>>>
>>> So I compared logs from "make SPHINXDIRS=driver-api htmldocs" with
>>> Sphinx 2.4.4 and 4.5.0 on current docs-next.
>>>
>>> There are 8 more lines in the log from 4.5.0 than from 2.4.4, give
>>> or take minor format differences.
>>>
>>> Here are those extra 8 lines (long lines are kept):
>>>
>>> ----
>>> /wk/Documentation/driver-api/usb/usb.rst:967: WARNING: Duplicate C declaration, also defined at usb/gadget:775.
>>> Declaration is '.. c:struct:: usb_string'.
>>> /wk/Documentation/driver-api/miscellaneous:48: ./drivers/pwm/core.c:679: WARNING: Duplicate C declaration, also defined at miscellaneous:305.
>>> Declaration is '.. c:function:: int pwm_capture (struct pwm_device *pwm, struct pwm_capture *result, unsigned long timeout)'.
>>> /wk/Documentation/driver-api/surface_aggregator/client-api:25: ./drivers/platform/surface/aggregator/controller.c:1689: WARNING: Duplicate C declaration, also defined at surface_aggregator/client-api:105.
>>> Declaration is '.. c:function:: int ssam_request_sync (struct ssam_controller *ctrl, const struct ssam_request *spec, struct ssam_response *rsp)'.
>>> /wk/Documentation/driver-api/80211/mac80211:109: ./include/net/mac80211.h:4811: WARNING: Duplicate C declaration, also defined at 80211/mac80211:1024.
>>> Declaration is '.. c:function:: void ieee80211_tx_status (struct ieee80211_hw *hw, struct sk_buff *skb)'.
>>> ----
>>>
>>> So those "WARNING: Duplicate C declaration" messages are what you
>>> mentioned earlier, aren't they?
>>>   
>>
>> So, I think I have figured out what causes those "WARNING: Duplicate
>> C declaration".
> 
> Basically there are two places defining the same function. This could
> either be:
> 
> 1. because the same header/c file is included on multiple places with
>    kernel-doc directives;
> 2. because both *.c and *.h files declare the same function and both
>    are included via kernel-doc directives;
> 3. because they use different namespaces;
> 4. because they're documenting system calls.
> 
> For (1) and (2) the solution is to fix the kernel-doc includes and/or
> the header/c files;
> 
> For (3) and (4) the solution is to define a c namespace via
> 	.. c:namespace:: foo
> meta-tags.
> 
>> When you have kernel-doc comments for both struct and function
>> of the same name, recent Sphinx emits this warning.
> 
> Yes.
> 
>>
>> Although Sphinx versions 1.7.9 and 2.4.4 don't complain, the result
>> is the same with Sphinx 3.x and 4.x (with the fix to kernel-doc Mauro
>> mentioned above).
> 
> True, it doesn't complain, but the generated documents have issues.
> 
>> I have no idea which version of Sphinx is employed for building pages at
>> https://www.kernel.org/doc/html/latest/driver-api/80211/mac80211.html,
>> but the cross reference to the ieee80211_tx_status() function in the
>> description of ieee80211_rx_ni() points to struct ieee80211_tx_status,
>> which is not an expected behavior.
>>
>> In this case, it seems to me that both the struct and function
>> kernel-doc comments are included by the kernel-doc directive
>>
>> .. kernel-doc:: include/net/mac80211.h
>>    :functions:
>> 	ieee80211_rx_status
>>         [...]
>>
>> at Documentation/driver-api/80211/mac80211.rst:109.
>>
>> As the :functions: option is identical to :identifiers:, both of
>> kernel-doc comments in mac80211.h, namely:
>>
>>     include/net/mac80211.h:1148: * struct ieee80211_tx_status - extended tx status info for rate control
>>
>>     include/net/mac80211.h:4813: * ieee80211_tx_status - transmit status callback
>>
>> are extracted by the kerneldoc extension (or the kernel-doc script).
> 
> The Kernel-doc extension should create two separate references for newer Kernels,
> depending on the version.
> 
> With older versions of Sphinx, it generates:
> 
> 	$ ./scripts/kernel-doc -sphinx-version 2.1 include/net/mac80211.h|grep "c:.*ieee80211_tx_status\b"
> 	.. c:type:: struct ieee80211_tx_status
> 	.. c:function:: void ieee80211_tx_status (struct ieee80211_hw *hw, struct sk_buff *skb)
> 	.. c:function:: void ieee80211_tx_status_ext (struct ieee80211_hw *hw, struct ieee80211_tx_status *status)
> 
> Here, there's just a single namespace, so both function and type will be
> considered as the same thing. No warnings are generated, though.
> 
> Versions 3.1 and above:
> 
> 	$ ./scripts/kernel-doc -sphinx-version 3.1 include/net/mac80211.h|grep "c:.*ieee80211_tx_status\b"
> 	.. c:struct:: ieee80211_tx_status
> 	.. c:function:: void ieee80211_tx_status (struct ieee80211_hw *hw, struct sk_buff *skb)
> 	.. c:function:: void ieee80211_tx_status_ext (struct ieee80211_hw *hw, struct ieee80211_tx_status *status)
> 
> This works since version 3.0, but only on version 4.0 namespace tags
> started to work.
> 
> As far as I know:
> 
> Sphinx < 3: there's a single namespace. It doesn't check duplicated
> refs. So, cross-references there will be plain broken on symbols with
> identical names.
> 
> Sphinx 3.0: Although it uses different tags, there's still a single
> namespace. It will warn about duplicate symbols. Building docs with
> such version will generate lots of warnings that should not be fixed.
> 
> This is a version that we don't support well.
> 
> Sphinx 3.1 and above: structs, enums, functions, typedefs, etc have their
> own separate namespaces. So, it is possible to have struct with the same
> name as a function.
> 
> Yet, it will complain about duplicated symbols for system calls. I guess
> we added a hack somethere to avoid too much noise on versions between
> 3.1 and 4.0.
> 
> Sphinx 4.0 and above: it is now possible to add a namespace. This allows
> fixing things like read() system calls that have different meanings on
> different subsystems.
> 
> On other words, only with Sphinx 4.0 and above, the cross-references
> for C domain symbols should all be OK.
> 
>>
>> Mauro, does your earlier comment:
>>>> Another consequence of such change is that you can't have more than
>>>> one "read()" function inside the entire Kernel.   
>>
>> apply to those struct and functions of the identical name?
>>
>> I just want to know what is the expected behavior in this case.
> 
> Yes, that's the case for versions < 4.0. On 4.0, we need to specify a
> c namespace to document them.
> 
> You can se such things if you do a:
> 
> 	$ git grep c:namespace Documentation/userspace-api/
> 
> The media uAPI documentation has separate documentation for syscalls,
> depending on being CEC, V4L or one of the DVB APIs.

Mauro, many thanks for the quick and detailed explanation.
I think it will take a little while for me to digest all of this, but
when I do, I'll try and see if I can fix the offending docs by proper
uses of namespaces for Sphinx >= 4.0.

        Thanks, Akira

> 
> Thanks,
> Mauro
