Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C03C3DA6F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 09:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjHYJGc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 05:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244139AbjHYJGR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 05:06:17 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140092683;
        Fri, 25 Aug 2023 02:05:41 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3110ab7110aso528603f8f.3;
        Fri, 25 Aug 2023 02:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692954338; x=1693559138;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ku95lSqUQbc1A4A75F5SP+ZkPGHdQ9Ss9hLiuayD0js=;
        b=CNxIyyzP+vuuxuKATylNh+nOlVNatf094TQHOjUE4EH0+9J0CsUHiWuzeROhYCBrrz
         4q5JAx3vGIKuroMozleXzrAD90GcLgICD6N7/zfEr6aHczZw8JjfUSJdN1/ByA806hgP
         a4/JI2/Pu/LOn35pHUD8lPuvhtL+55/OjAzhDDaiGT2a14W015LnUwpfcUmhQNkaOqkW
         Zha7baQr8rd2zC6QAAmbCiPBzpKW2dS+3hWcvD6U24KFLrxLyrbynYQVyln4yDy1wd1Y
         EWU/iotgZtAAJpa7cwAt4tStjmvdnTVRx3AiDSsQNDfyci9Ouj0zFcQXVUn/TyVutS1W
         74Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692954338; x=1693559138;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ku95lSqUQbc1A4A75F5SP+ZkPGHdQ9Ss9hLiuayD0js=;
        b=UCHa+6yS4xx61UbwlV36/v1Qcv1Lap0PbjMsAISvKOJxLSdzVysSqZHwdoatTg0fGG
         NDKl/MttqhZAQ+Sdro/ko/GR6qL3dhtNxdXp3GXpvJxPwb/GzFJmbDFA2gEAORH1tBQH
         sNARns6lTPeuW4Zj8r1EOiPHmegbQoA/JWK/L18k4Lg25HlVi/xffPPCzRoSpxSv+4WQ
         arfzcQ1XDFjxOPu8aw2MR8PE/HYxLoOaKu0fTnUdW6Vt2S2SKxXDlHcBAqMq0qIFBZVK
         Zp2MQedv7uek9Q9BDZTrLtH3m7UmR85BRT21t2zHhoI/wrJ4c7vXrClsUjSIpykTLkcl
         PwLw==
X-Gm-Message-State: AOJu0Yx4ExmUMxA7elsSb68BZwu4eSOBvrKgemIwbSpZrYbE7Mu8z/Sq
        /aCqzDb/ydYdUd/zDGXJyutGHDJh42oH2g==
X-Google-Smtp-Source: AGHT+IEoPj1hGw+qZVMPWsZc+Mdb2jva4eWNEDUC7MF2StHc02vY779yRySs+bmXWXmvYUYwF9bxzQ==
X-Received: by 2002:adf:f403:0:b0:317:51da:83b9 with SMTP id g3-20020adff403000000b0031751da83b9mr13580010wro.49.1692954337714;
        Fri, 25 Aug 2023 02:05:37 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:88fe:5215:b5d:bbee])
        by smtp.gmail.com with ESMTPSA id i15-20020a5d630f000000b0031989784d96sm1607487wru.76.2023.08.25.02.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 02:05:36 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com, Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v5 11/12] doc/netlink: Add spec for rt link
 messages
In-Reply-To: <ZOeJXfT2lhVAaOAk@nanopsycho> (Jiri Pirko's message of "Thu, 24
        Aug 2023 18:46:21 +0200")
Date:   Fri, 25 Aug 2023 10:04:20 +0100
Message-ID: <m2y1hzebmz.fsf@gmail.com>
References: <20230824112003.52939-1-donald.hunter@gmail.com>
        <20230824112003.52939-12-donald.hunter@gmail.com>
        <ZOeJXfT2lhVAaOAk@nanopsycho>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jiri Pirko <jiri@resnulli.us> writes:

> Thu, Aug 24, 2023 at 01:20:02PM CEST, donald.hunter@gmail.com wrote:
>
> [...]
>
>>+attribute-sets:
>>+  -
>>+    name: link-attrs
>>+    name-prefix: ifla-
>>+    attributes:
>>+      -
>>+        name: address
>>+        type: binary
>>+        display-hint: mac
>>+        value: 1
>>+      -
>>+        name: broadcast
>>+        type: binary
>>+        display-hint: mac
>>+        value: 2
>
> Why do you specify value here? In general, it is not needed if it
> is the prev+1.

I added the values when I generated some of the spec contents from
btftool output and they were helpful for visual lookup when I was
working on the spec.

I can remove them.

>>+      -
>>+        name: ifname
>>+        type: string
>>+        value: 3
>
> [...]
