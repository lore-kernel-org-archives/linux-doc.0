Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8974C6FA8F
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 16:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbjHXQrJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 12:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240742AbjHXQqi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 12:46:38 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9211BF0
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 09:46:24 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-52a49a42353so131631a12.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1692895583; x=1693500383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TYS9DHrs+1jKHxzPrBabk1rf0CL1aLAQaTkspy2i15c=;
        b=f7PlLcP/Mm8OeQKXzbnlJ3D9vrob4zWOyWyc+nn4MsZYcWbM9hLPR/ZEkGYUUP5upw
         LrzkHXgy526IQEU7ZCa6uAmmO8HXQxF3KplYH7cVFU7QKKZKmizqY82O1wwL2SF4kPA1
         2l0ZrvvJI3AfhrP47cljftE2FN2cbATo31NDuc8STE6U/z7A/jfCeAJEe9vzPsLDsPia
         wGSSIwdObnmSZNs3sSLN2R5PlrWSYsTE7P5xmt9wL7uMV4k3TXxUZ2CYqoxU/fiGohz9
         XFr6/HOKXS9CeLviC07drzkgjZn8bTnLGDPh7pDhWSwf9JfCZJSQzsYncBVez6OItBSt
         PVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692895583; x=1693500383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYS9DHrs+1jKHxzPrBabk1rf0CL1aLAQaTkspy2i15c=;
        b=QAFXcCHyooJaIy0gsfpSLaVgOuTYfOGCegZg2RtxNQcjKYorJmprz4Mpe1FrjaPC5u
         Xrk7uQLyG/3XEkKgWLsPVMf/No09S4U5mHZVq7KBrsSIG9DBQsQxmmb3SlbSqBzwU5lN
         GNqHtb2hnrpxsOsl/D/XcJ4fkNQTAGN0tkdoqs0+VqHsQzpdQgK54n3yQoEoP/elgUQj
         qgW4RjI0Uin678s/8V1Qh1+tmJuZ5RV7vvM07ymC5p2jMlz44hMSUiDY0TRPSr3o9qDy
         hI8irdmMBG4RL2YnjV9Jaj/RHI8VM9fbA/sQD1SkWHFy+s8dfDH6a777Q8IRLxJzpfdx
         jR7w==
X-Gm-Message-State: AOJu0YzXba6+yGj5hIq1dqp8ens0WlxmwywlpSyq+isrvce0M2V3mjcp
        peR1rf6hGiNUUNzUafxxGE+yXg==
X-Google-Smtp-Source: AGHT+IF/m7RNPBX6onvAwK8petHps/a8h+SMAmgibC9V70N3AnQNIIXaKrsHOuy1PVEqGcxrhEKBXA==
X-Received: by 2002:a05:6402:b04:b0:525:ce69:b52d with SMTP id bm4-20020a0564020b0400b00525ce69b52dmr11926005edb.39.1692895582669;
        Thu, 24 Aug 2023 09:46:22 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id z12-20020aa7cf8c000000b005256d4d58a6sm10714706edx.18.2023.08.24.09.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 09:46:21 -0700 (PDT)
Date:   Thu, 24 Aug 2023 18:46:21 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Donald Hunter <donald.hunter@gmail.com>
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
Message-ID: <ZOeJXfT2lhVAaOAk@nanopsycho>
References: <20230824112003.52939-1-donald.hunter@gmail.com>
 <20230824112003.52939-12-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824112003.52939-12-donald.hunter@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thu, Aug 24, 2023 at 01:20:02PM CEST, donald.hunter@gmail.com wrote:

[...]

>+attribute-sets:
>+  -
>+    name: link-attrs
>+    name-prefix: ifla-
>+    attributes:
>+      -
>+        name: address
>+        type: binary
>+        display-hint: mac
>+        value: 1
>+      -
>+        name: broadcast
>+        type: binary
>+        display-hint: mac
>+        value: 2

Why do you specify value here? In general, it is not needed if it
is the prev+1.


>+      -
>+        name: ifname
>+        type: string
>+        value: 3

[...]
