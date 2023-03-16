Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD81C6FD19
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 16:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjCPQWl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Mar 2023 12:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCPQWk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Mar 2023 12:22:40 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8AFD2365F
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 09:22:31 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id g9so1565248qvt.8
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678983750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GBmyw0WJBg7ZCrOCyO2Mj9DN8D/RYHEWxuq24q58BM=;
        b=IBbPWCSwUaEft4y5eeSYVHPLcYKZe6q20jMe8CFCou9o8KL0uPCCP39bC6WjHexpL3
         h4ChTrGg9orCknI95a3z0l3Gw3j6Ry3Y/Io3bKEjrTWpiLrgc3A6GcUTlQQC1nzfcHGj
         wjf0n7z2sSyDo7hSofVu9srGEi8xnZ0o26udc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GBmyw0WJBg7ZCrOCyO2Mj9DN8D/RYHEWxuq24q58BM=;
        b=nwJXmQRFF7FC2zNWWbeOjw9HWh9nuJCjPC9GM8dVP41P+VXiXat0dNDuiSApO09Ypp
         WiJu2S53ot/CuRfFo6XFbNBG8e783/bKq/1v6LSgSyzgT+7PQMOLv5z+8CAN9DKRIPFt
         0fQpbv9AOu7W1K7UEK8KTl9B2PAswHmqDnCsXVaZ1c5TsionYSP+4sm+mt0mYUMgIFAD
         UZpPRcx7Mve9WJNCmyFmRrlm0z4KN3ljmk9cotDtN0IOTjBXanAMx3cs/0vT5gc5wldX
         OGB8w6gp/vXKvpx8nCSynwiNXlwTKfdx8Tn6pEo7bw8IinxhdgbHiQMqjvT5p/9Q48wK
         79tg==
X-Gm-Message-State: AO0yUKWN09WXXI8Wb/garEr14CL7hSlqCSqY0BIHdMQIUjtFQ+0BtlPM
        YNS7FfpXySCqulBaircTD96UDJf87V1/m71Ed5o=
X-Google-Smtp-Source: AK7set8xEGt6h86HL22O97EmhJZzwZ6k+fOwDGCLLvjvxO6ADEVZBNhra0L2aLE9daBvgDOrEjePYQ==
X-Received: by 2002:a05:6214:19ea:b0:5ae:419a:8c22 with SMTP id q10-20020a05621419ea00b005ae419a8c22mr11533826qvc.5.1678983750655;
        Thu, 16 Mar 2023 09:22:30 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id r6-20020a374406000000b007423dad060bsm6139056qka.87.2023.03.16.09.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:22:29 -0700 (PDT)
Date:   Thu, 16 Mar 2023 12:22:27 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Matthieu Baerts <matthieu.baerts@tessares.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Kai =?utf-8?Q?Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mptcp@lists.linux.dev
Subject: Re: [PATCH 0/2] docs & checkpatch: allow Closes tags with links
Message-ID: <20230316162227.727rhima2tejdl5j@meerkat.local>
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
 <c27709bd-90af-ec4f-de0b-3a4536bc17ca@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c27709bd-90af-ec4f-de0b-3a4536bc17ca@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 16, 2023 at 10:22:18AM +0100, Thorsten Leemhuis wrote:
> I liked Andrew's `have been using "Addresses:" on occasion. [...] more
> humble [...]` comment.  Sadly that tag is not supported by GitLab and
> GitHub. But well, "Resolves" is and also a bit more humble if you ask
> me. How about using that instead? Assuming that Konstantin can work with
> that tag, too, but I guess he can.

There's a subtle difference between "Closes" and "Resolves" that may be
important to consider ("closes" doesn't really imply the bug is "fixed").

The Bugbot should eventually support a number of "if this, then that"
conditions once it's done, so which tag we look for will be a matter of
configuration. It's not yet at that stage, though I should have some initial
trials in the near future.

-K
