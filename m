Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0292DC43217
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 23:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiKUXKt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 18:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbiKUXKZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 18:10:25 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE39FD14C5
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 15:10:23 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so329686pjj.4
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 15:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nRDq4Fzp3A90gk2zJpm4uLf5eQYtYVvX/HQoBDLeB58=;
        b=lXHfTOB9/IfcbcSpcg/13zYs076KzQUMRQ8GoCFRDTItvY89vaB8giUzwLGBsBjQfZ
         fAuwx1Od3b9WDPv9rT/KePcaf3BEMnV4O83MAoJXhlQIOSXw5ecSlYlUWqjoMEzj++8v
         RYOPeXP8aVKg3Nonz+eQmjkLhJtwGrxlqJuODb1Dw11J4QGOhY3sQ/ZnqvArI9JMRDmC
         cKAxOeCWUjCGRD6eg4x/1/aTxYUU2W9tfaJmMHCrnJkxKJDyPMgPMlzDw+D0s+H8bRLo
         i7SbUzhlKHjnFM+ci8dc6YvemDOiRerUPokl4YGcIrH6IXQbUFxlSzRD10Q7ncBEfJyb
         NnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRDq4Fzp3A90gk2zJpm4uLf5eQYtYVvX/HQoBDLeB58=;
        b=eOpqomg6Z2VLUkxgl0SWP7Crux4MmkkTlsy+4GrofgM6y3zLnAHh2PGSULIKSnjK5J
         0GmsGaKO0adgSprq7NMwM3WOlC3yQjtdI/WMcNG4CezVn+iFCs7z340ZrKByC4/1rKa8
         2qeH2B/T6sI5e4pd1Uq7/GIwsh8gw7FQfXpJkiaC+YXu/YgcgW6vQi/O4ch4LPaZ7pB7
         sB4JZ2sNIOR6XqD14I5NegxhTAIlDVwGQAuZJS2zHZDGDxzSTNdtf2JfgWl7rYKtdZ2K
         L9+RTd1h++4HAqWyrmCUcJw3cpba19f5vKxJd8nwY+jH4WZnu3/Uz5/Xg7r/+Ic8rjU/
         jq3w==
X-Gm-Message-State: ANoB5pmQ1L/9iorAtBuV8FMSBqr49CnHSx9R0g3hGC0YY8Fj1oJrafsF
        zkLEbuQISjm1t1aPn1eakyE=
X-Google-Smtp-Source: AA0mqf7yb0n4olL+WfnWhjThftzGijXP1Ut+Qo9iVAtVMF66Jg3IyrpVceF/7EEm5I1kv31Ev7sMzw==
X-Received: by 2002:a17:90a:8406:b0:205:d3f8:5241 with SMTP id j6-20020a17090a840600b00205d3f85241mr27804597pjn.188.1669072223203;
        Mon, 21 Nov 2022 15:10:23 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id ls5-20020a17090b350500b00205f013f275sm11042834pjb.22.2022.11.21.15.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 15:10:22 -0800 (PST)
Message-ID: <46789578-5785-eed3-24e7-14712ab78b99@gmail.com>
Date:   Tue, 22 Nov 2022 08:10:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] docs/driver-api/miscellaneous: Remove kernel-doc of
 serial_core.c
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <4e54c76a-138a-07e0-985a-dd83cb622208@gmail.com>
 <47514c0a-7d5b-5a0b-6bb5-d5c96d163838@gmail.com>
 <9f23e62c-1401-cf58-f99b-fa804366cd4c@gmail.com>
 <87o7t09g4j.fsf@meer.lwn.net>
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87o7t09g4j.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 21 Nov 2022 14:01:16 -0700, Jonathan Corbet wrote:
> So the purpose of this backmerge would be just to get rid of a few
> warnings in docs-next for the next few weeks?  Given the jaundiced eye
> with which Linus looks at backmerges, I'm inclined to just wait and let
> it all settle out during the merge window.  Is there any work that would
> be impeded by not doing that merge now?
I thought the backmerge might reduce your annoyance when test-building
for the next merge window with Sphinx >=3.1.
You call those dozes of warnings *a few*.
Of course, I can wait. :-)

        Thanks, Akira

> 
> Thanks,
> 
> jon
