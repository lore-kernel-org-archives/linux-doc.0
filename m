Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F01C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jan 2022 17:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243718AbiANRFq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jan 2022 12:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243708AbiANRFq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jan 2022 12:05:46 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA42C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 09:05:45 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id ay4-20020a05600c1e0400b0034a81a94607so5874454wmb.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 09:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=Oi/sccizMMux3skA0N3TzagjaFYSgV4TjzVapq+TuHI=;
        b=0hZkBfS+GfTMpJJEUrBkQ7FBLCNDmbgCa9mPkhSPYmQIqtCCfuVS5l585y54mybF9t
         zy3rYFG2r9MQKvMd6uqEWdvPgAiaOaEhW7DTxkTz3hGqQqL/SrMsbHWhPGE6C6ePF5Fc
         ZkspvZxlrZc+7KQ/+GjJ0ym1/XhcA8dAKVtMtiqdw5Wutidi7wok9CfU5J2TskNOIl+Z
         O9D+ysthMr0IQq2q7F1D4h1T1L34W9e7S1KpnNZu2eTQLCpAEQH0x9c/5uEAO46d9bDl
         HUzmhs0cPJE8SoyWDpMxYAzk3RnSMQMhevdDdQCqn8bCvZlB9q2FLbwZ4sFPXOPkghZO
         BtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=Oi/sccizMMux3skA0N3TzagjaFYSgV4TjzVapq+TuHI=;
        b=BTKvFF5Gzt2M/Ns0uCqCZKFopaI91UrIVqTJ8Jx0HSoBvNND3YII4vfLeCEL2Ac1cW
         tKrAGFC9OjOn+8X7xJl7FyIuxhTEwdfuwTpKTyRRCzSw+S176ssxpcH4mn6d1veCwXyK
         wCMQe921QZzWqGYa3lG9zVh/ABt916I1HyhFuNJg/Ubv1VGFuIYGn57p9y/AEgLAI7/t
         pZDNw7/bqTIQ0eiXxywaH1VHYEMT1V8tvC+hb0V33ow4cpwLQQcqIo6T71xxEbymwK6/
         cdrF3T8kIsp1zVeSJx5roENqMvPZv3oj/CQq6GD7C7L04AFDUB58Ye2LanCc1knA39w1
         lL0w==
X-Gm-Message-State: AOAM5321c2COXOiIxS+ZEJwVR0adtgZix0UwlKUCB1HUr3htCy6OuaKm
        aEu7jd14iIILg+OkWEp7m3/MEg==
X-Google-Smtp-Source: ABdhPJx67yWEqB8JIrHCGYE1hLnj8O9Irzy563iOk6CpBiG2dZZ87WJBIMw98vyoV1+9D8EbM5/jUA==
X-Received: by 2002:adf:f791:: with SMTP id q17mr9318595wrp.311.1642179944551;
        Fri, 14 Jan 2022 09:05:44 -0800 (PST)
Received: from ?IPV6:2003:d9:9709:5700:d6b9:b73a:e78d:7d87? (p200300d997095700d6b9b73ae78d7d87.dip0.t-ipconnect.de. [2003:d9:9709:5700:d6b9:b73a:e78d:7d87])
        by smtp.googlemail.com with ESMTPSA id a3sm7344011wri.89.2022.01.14.09.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 09:05:44 -0800 (PST)
Message-ID: <4327e77e-4f65-0b2d-f1d4-039a728a3958@colorfullife.com>
Date:   Fri, 14 Jan 2022 18:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To:     nbd@other.debian.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
From:   Manfred Spraul <manfred@colorfullife.com>
Subject: Magics 0x12560953 and 0x96744668 for nbd.h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I've tried to figure out details about the "do *not* use" magic values 
for nbd.

They are referenced from the documentation in the current linux kernel!

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/magic-number.rst?h=v5.16#n99

 > NBD_REQUEST_MAGIC 0x12560953 nbd_request ``include/linux/nbd.h``

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/magic-number.rst?h=v5.16#n137

> NBD_REPLY_MAGIC       0x96744668       nbd_reply                ``include/linux/nbd.h``


That is stale, correct?

Still in use:
https://elixir.bootlin.com/linux/2.1.116pre2/source/include/linux/nbd.h

Not used anymore, replaced with new values
https://elixir.bootlin.com/linux/2.1.116/source/include/linux/nbd.h

Thus a bit outdated.
Should I send a patch to update it?
And: The translations are manually maintained, correct? Thus all files need to be updated.

--
	Manfred

