Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5290C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 21 May 2022 07:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241152AbiEUH6y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 May 2022 03:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbiEUH6x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 May 2022 03:58:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E4F15E619
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 00:58:51 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id l14so9822265pjk.2
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Qm6HSPIHUTwPKUolPZdLpJ9PaJfrtNscjhrJVq4GoOA=;
        b=p+zMr05ftDo6uu/xYZF5v7vmC3kxn5z8VYASgm8Tv1AaK/riMZHHYpWughq11ejWSi
         pCEPyTFT88FQ9K5p8/4QgRdJ0C1juwZJXNujjmjKXu1pPLywGLQqBN660ygpntGtXO8t
         sX5Hc0lm1Sjn/5ZyLucPdPBBPO7hEsGTjJ+yOZF7jhXVA35SoRM1AYdQ/5w53y4l4yCC
         +Xggg1VnkqhTpLaRCkdbloZq7TsqSmfogjcWlW5b4WgRJcjAfTZ3ZpkP/4lC76hn6WU/
         5c8yQxAagyS3giunwLgr4pFkq35q7OQ2ynlOMebmBuQJw0fdnP17QSvO2mq8IbDdoBlA
         2PDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Qm6HSPIHUTwPKUolPZdLpJ9PaJfrtNscjhrJVq4GoOA=;
        b=OmQsWE0U7kDxnmd0kKmPZwUxsTqhEBs1scsOyw/LpE57MMaZAQVIvVY6yFC/lZNbKB
         PA8ZeYpC6HKKIliwPdOuf0IRlvqrd1oUQVWLGhb/ABjFdfHVlq/x5vVtmvEgol4PxEGo
         ek8KB78O3Uu927h9rINtV0ylSyVRFwCprp0Iu5E2RPHxS+uB9V+N5MoW/J4Gv61Fngce
         02TfW+rSgxbo9GUtMXbenMMhFFM0Q+bjnXvoP8ti6z35CQnb8He8ADcV5NNOiQEaBxOq
         inJbBwvXh1aQw59wLXKStlqdBoBeILGt/g4vn7pZm+iEjNRI5gcbrB68oOYpCyOcV1Nj
         LU7A==
X-Gm-Message-State: AOAM530rf5NsoOdXniCEPozziVlbggKTU0SLN4x2he2NbxwuaMoACPcM
        cXQBTAznPPCaSUF41QmU3hxWD6NJOnc=
X-Google-Smtp-Source: ABdhPJwOFi5MCGfRzoL7Wjc33Qw8/+fv2/vsVZXQzh+4eqAwfPyef7mTHGCFXa4UE/nb/oC9neqIhQ==
X-Received: by 2002:a17:90b:33ce:b0:1dc:690e:acef with SMTP id lk14-20020a17090b33ce00b001dc690eacefmr15433055pjb.121.1653119931421;
        Sat, 21 May 2022 00:58:51 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id jb4-20020a170903258400b0015e8d4eb282sm947225plb.204.2022.05.21.00.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 00:58:50 -0700 (PDT)
Message-ID: <564cbd05-8788-9223-1ecc-59e7fc41b46a@gmail.com>
Date:   Sat, 21 May 2022 16:58:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: "WARNING: Duplicate C declaration" from recent Sphinx (was Re:
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
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <edf80179-4776-773d-0c4a-e75a1824bfba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 31 Mar 2022 23:32:41 +0900,
Akira Yokosawa wrote:
> On Wed, 30 Mar 2022 19:07:24 +0200,
> Mauro Carvalho Chehab wrote:
>> Em Wed, 30 Mar 2022 23:59:05 +0900
>> Akira Yokosawa <akiyks@gmail.com> escreveu:
>>
>>> Hi Mauro,
>>>
>>> On Wed, 30 Mar 2022 02:25:34 +0200,
>>> Mauro Carvalho Chehab wrote:
>>> [...]
>>>> We need to verify both PDF and html generation, though, as I remember
>>>> that some 4.x versions had/(have?) issues with the C domain and duplicate
>>>> symbols detection.  
>>>
>>> Can you elaborate on the issue you observed?
>>> In which document did you see it?
>>
>> Sorry, it was on Sphinx 3.x, although the most complete fix got
>> merged on 4.0, I guess. This patch is related to it:
>>
>> 	b34b86d7a418 ("docs: conf.py: fix c:function support with Sphinx 3.x")
>>
>> Basically, the Sphinx maintainer for the C domain rewrote the code,
>> causing all references generated by kernel-doc to be broken, and
>> almost all references at the media docs as well. Before the changes,
>> there were just one domain for C code references, used for functions,
>> structs, enums, etc. After the change, each one requires a different
>> tag. The kerneldoc script has gained support for Sphinx version when
>> such issue was addressed.
>>
>> Another consequence of such change is that you can't have more than
>> one "read()" function inside the entire Kernel. While this makes
>> sense on userspace, It doesn't at Kernelspace, as different subsystems
>> may handle read/write/ioctl/... syscalls on their particular ways.
>> So, building docs were causing warnings about duplicated symbols.
>>
>> There were some changes that went on 4.x to fix it, when 
>> ".. c:namespace::" got merged. I don't remember when it was added.
> 
> Thank you for the detailed explanation.
> 
> So I compared logs from "make SPHINXDIRS=driver-api htmldocs" with
> Sphinx 2.4.4 and 4.5.0 on current docs-next.
> 
> There are 8 more lines in the log from 4.5.0 than from 2.4.4, give
> or take minor format differences.
> 
> Here are those extra 8 lines (long lines are kept):
> 
> ----
> /wk/Documentation/driver-api/usb/usb.rst:967: WARNING: Duplicate C declaration, also defined at usb/gadget:775.
> Declaration is '.. c:struct:: usb_string'.
> /wk/Documentation/driver-api/miscellaneous:48: ./drivers/pwm/core.c:679: WARNING: Duplicate C declaration, also defined at miscellaneous:305.
> Declaration is '.. c:function:: int pwm_capture (struct pwm_device *pwm, struct pwm_capture *result, unsigned long timeout)'.
> /wk/Documentation/driver-api/surface_aggregator/client-api:25: ./drivers/platform/surface/aggregator/controller.c:1689: WARNING: Duplicate C declaration, also defined at surface_aggregator/client-api:105.
> Declaration is '.. c:function:: int ssam_request_sync (struct ssam_controller *ctrl, const struct ssam_request *spec, struct ssam_response *rsp)'.
> /wk/Documentation/driver-api/80211/mac80211:109: ./include/net/mac80211.h:4811: WARNING: Duplicate C declaration, also defined at 80211/mac80211:1024.
> Declaration is '.. c:function:: void ieee80211_tx_status (struct ieee80211_hw *hw, struct sk_buff *skb)'.
> ----
> 
> So those "WARNING: Duplicate C declaration" messages are what you
> mentioned earlier, aren't they?
> 

So, I think I have figured out what causes those "WARNING: Duplicate
C declaration".

When you have kernel-doc comments for both struct and function
of the same name, recent Sphinx emits this warning.

Although Sphinx versions 1.7.9 and 2.4.4 don't complain, the result
is the same with Sphinx 3.x and 4.x (with the fix to kernel-doc Mauro
mentioned above).

I have no idea which version of Sphinx is employed for building pages at
https://www.kernel.org/doc/html/latest/driver-api/80211/mac80211.html,
but the cross reference to the ieee80211_tx_status() function in the
description of ieee80211_rx_ni() points to struct ieee80211_tx_status,
which is not an expected behavior.

In this case, it seems to me that both the struct and function
kernel-doc comments are included by the kernel-doc directive

.. kernel-doc:: include/net/mac80211.h
   :functions:
	ieee80211_rx_status
        [...]

at Documentation/driver-api/80211/mac80211.rst:109.

As the :functions: option is identical to :identifiers:, both of
kernel-doc comments in mac80211.h, namely:

    include/net/mac80211.h:1148: * struct ieee80211_tx_status - extended tx status info for rate control

    include/net/mac80211.h:4813: * ieee80211_tx_status - transmit status callback

are extracted by the kerneldoc extension (or the kernel-doc script).

Mauro, does your earlier comment:
>> Another consequence of such change is that you can't have more than
>> one "read()" function inside the entire Kernel. 

apply to those struct and functions of the identical name?

I just want to know what is the expected behavior in this case.

Note: Line counts in this mail are those of v5.18-rc7.

        Thanks, Akira

[...]
