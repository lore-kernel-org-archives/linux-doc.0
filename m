Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18202C001E0
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 13:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245447AbjHPNUG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 09:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245488AbjHPNTz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 09:19:55 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FB7E52;
        Wed, 16 Aug 2023 06:19:52 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe1d462762so60427845e9.0;
        Wed, 16 Aug 2023 06:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692191991; x=1692796791;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7pNaNHlLOAv00m8IjcC0NfScI4U9ELpbgihpd7PFRFY=;
        b=gtrDdH7ceQE2umGzXWMGztJHRW37L33LLif58fmsaSNTBtOURQ9/hq9YZkfnQd1NM6
         bEwXNdKE4nIvez7Qa5jsberIL3AYezffZm8uhCsnoWBS0520ZZPLYki3hRl9Y6YDn8mY
         9sufTZcwbWAeQVOwZ/80byWV4jgji8jmHhRuJ7L3Hqrsmg947lCt4wV1izbMETIH09Ry
         new9af/r1mwktvu00JVBsIIEwLAKErRf22WIuvpfuKveheM4NJQuoqXnCxMsXguvs9UJ
         uJCQiXAcnh8hWY+upzx+G6pv6j/Mt/5YDs/mS0tvd7qhDucdsYAVgdbIVDGGQoz1BEuI
         X/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692191991; x=1692796791;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pNaNHlLOAv00m8IjcC0NfScI4U9ELpbgihpd7PFRFY=;
        b=b6HDJqxrgKzlL/WPrS+ekZVdGn+fqmpGhop/YIud2ajx0JAtxxoH8RCGQYQcRNyR/v
         VlD76JFAOarjHIQ0s1GGHfZjSofFt4g7e9CqHT6TxH+HiWmsZjpfvLyozlVQWiSqYLDR
         k8IB59WvlKHtgc+6zrj6+FrXUKZlNN0S9ZJMfQUK8pYNUNyS47x8E6R/CrVYKoSd13aR
         TfKiUtwaq8D0oCm9BUupW8Q/pieX3DTqtduSm6P4sFuqF/qQiId8S6yp22+6BdPN0bAM
         A1umNRnM9+8a56e36ljwlKVkDbGfOwVECnJbOcIMJaHrOzjUO9+Egl7xwfO2dNCWovjj
         Sl8A==
X-Gm-Message-State: AOJu0Ywv9qwP6m/E9MnDoOqz49PD+OwlhNOCVZkP+ijXcTFUfYDSTxjG
        IrpWOT4ah7B74JmUBGO2wAE=
X-Google-Smtp-Source: AGHT+IEHs3dUujv58X9WeLbFbskPpx9lSyfurrbMMNu4w68efv2+Xz37tNK1kyqMHRt7b2eQ888y5w==
X-Received: by 2002:a05:600c:20a:b0:3f9:b430:199b with SMTP id 10-20020a05600c020a00b003f9b430199bmr1527781wmi.15.1692191990457;
        Wed, 16 Aug 2023 06:19:50 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:79ba:2be3:e281:5f90])
        by smtp.gmail.com with ESMTPSA id l4-20020a1ced04000000b003fe61c33df5sm24362340wmh.3.2023.08.16.06.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:19:49 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 02/10] doc/netlink: Document the
 genetlink-legacy schema extensions
In-Reply-To: <m2bkf7jswr.fsf@gmail.com> (Donald Hunter's message of "Wed, 16
        Aug 2023 09:25:08 +0100")
Date:   Wed, 16 Aug 2023 14:16:33 +0100
Message-ID: <m2ttszi0um.fsf@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-3-donald.hunter@gmail.com>
        <20230815194902.6ce9ae12@kernel.org> <m2bkf7jswr.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Donald Hunter <donald.hunter@gmail.com> writes:

> Jakub Kicinski <kuba@kernel.org> writes:
>
>> On Tue, 15 Aug 2023 20:42:46 +0100 Donald Hunter wrote:
>>> +
>>> +Globals
>>> +-------
>>> +
>>> + - ``kernel-policy`` - Specify whether the kernel input policy is ``global``,
>>> +   ``per-op`` or ``split``.
>>
>> Maybe a few more words:
>>
>>  Specify whether the kernel input policy is ``global`` i.e. the same for
>>  all operation of the family, defined for each operation individually 
>>  (``per-op``), or separately for each operation and operation type
>>  (do vs dump) - ``split``.
>
> Ack. As an aside, what do we mean by "kernel input policy"?

So I've just spotted that kernel-policy is already documented in
core-api/netlink.rst and I guess I shouldn't be documenting it in the
userspace-api at all? I could add a reference to the core-api docs so
that it's easier to find the kernel side docs when reading the
userspace-api?

