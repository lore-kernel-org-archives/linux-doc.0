Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB8CC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 30 Mar 2022 14:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347751AbiC3PA6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Mar 2022 11:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347762AbiC3PA4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Mar 2022 11:00:56 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33F265B6
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 07:59:09 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id o3-20020a17090a3d4300b001c6bc749227so218208pjf.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 07:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=B00n0M/i9NX5RvWSmesoI+V1XtRyUppHboNQIjK1cn8=;
        b=k/NNmjTzE/wzl+Vj+dn3JRXGbPW2bVW/E6NPeov5lQWOpL/XY7T0bigyxa4olSThwJ
         nA/W3snB8LgIYe26dY0ngactPpEv9eLRZz+REYl+bfhn+Eb15mj8N0ZJSZGLQc44BrRH
         Ej5ZpVD8dtd0UQCeba1QHQEygwkDTI7LyeHZRt2QyKUrfv7VG/cpG4RCMuNCI+VF2kK+
         a9eBm9ZtZHmXhN4x7rwJF1/AtLRZCOqLriAgz7Vo0uVG308eT1An6DC9BgvzSTHkXaru
         dmb2YufGbMP2TYK26Nw6DGigLSSoRoiJ3uIc86qSQjTk5weoJHeu6CpCoIxCRCAxp+rE
         AwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B00n0M/i9NX5RvWSmesoI+V1XtRyUppHboNQIjK1cn8=;
        b=ZCYMsO3qFsoNCcS8rD6xCaNbSYO/Bo+aM0MemruQETLQntCYXXWaDWzJIsg+zx+AZi
         bp4HcFHx7GOfaOwE2VpGVCjj0KE227Q6x2/tBhoEEOmigI6MDPhN3H2A9Ln920z6GA+O
         TzInYPRt2MD9XuEnIig5gVXfNoY2Ny5ZELqc1LJBN51ATnV+3HraThduaTMBVMh4jA5y
         1TsXwEWeIHWh/p0lPGSwzcRIQT5uEJvWjOIzkkdBi8NjME7kJuor5i41S89fLKyceq8V
         y5RKHG1l+44rhtHf8oBXuRVXdnaH4C98nLEq7+GY98etPW67YUm8XWnYfYqUzwaV6xP6
         l3Dw==
X-Gm-Message-State: AOAM532O6b14mUNp3J3On6d3E8Mbnv4YR2zkMLG014AKgeacgh6uSyR6
        Kqd/ZhJwWDfE2keWfRBLJrk=
X-Google-Smtp-Source: ABdhPJwcxc9MpgfLW6vV4Ih3nq/3chP+/VNAfSEhCj7/RrpYwZjx+NihDvJG+SCMOFCyg6/Ddjf/gA==
X-Received: by 2002:a17:902:9046:b0:14d:5c9d:e7df with SMTP id w6-20020a170902904600b0014d5c9de7dfmr35719132plz.65.1648652349398;
        Wed, 30 Mar 2022 07:59:09 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id j70-20020a638b49000000b003985b5ddaa1sm8917806pge.49.2022.03.30.07.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 07:59:09 -0700 (PDT)
Message-ID: <ed2690db-84ae-5c85-f65d-e08021f5f562@gmail.com>
Date:   Wed, 30 Mar 2022 23:59:05 +0900
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
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220330022534.10ac0a50@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

On Wed, 30 Mar 2022 02:25:34 +0200,
Mauro Carvalho Chehab wrote:
[...]
> We need to verify both PDF and html generation, though, as I remember
> that some 4.x versions had/(have?) issues with the C domain and duplicate
> symbols detection.

Can you elaborate on the issue you observed?
In which document did you see it?

Verification of generated HTML and PDF can be hard.

Different Sphinx might generate slightly different .html or .tex
files with no visible effect in the final rendering.  Hmm...

Do you have an idea for automated regression testing?

> 
> Also, it could be worth to check the build time with 2.4.4 and with
> whatever newer version we stick.

I agree. I'll see what I can do.

        Thanks, Akira

> 
>> So I'll just fast-track this
>> patch in; dropping it into the stable updates probably makes sense too.
> 
> Agreed.
> 
> Thanks,
> Mauro
