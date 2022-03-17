Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29448C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 01:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358380AbiCQB25 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 21:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358319AbiCQB2y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 21:28:54 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C731EAD5
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:27:07 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m12so4784631edc.12
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IwLQkBh4p0/MlSYiHpWT3LVO0kaAxEAmEy894o/lBAk=;
        b=QdGLAG/PyeyxYlxilJap5GzmvukNm9ZyaNle+oQe0mlud/4tIh33bGgDrnbfokq8TF
         F9vCY5oAoVAw27hbBDaVi10giHe9AaBACGopJfFZEWxXZ+JV5uCfLUV+/ThB1ed7KCQL
         BtJ6KCb32sqFuKw4m38aGiOIG0cIFsZfscm+r+ln3NZbj3+lJ8HF/Lr/aHFretDA3iCo
         SbKdB/Wvso3rIipXfznYMJXlw0iee767ymYRJOQJPJ9RmCtJp3KU9hazCS33LSbJzppD
         0qpNvkPu8cAWp2XTC4m9y1SkYzQnGBm4ifo+EGKF58wtYT0q+BmjeKr/VDTu4EPe+M8x
         HuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IwLQkBh4p0/MlSYiHpWT3LVO0kaAxEAmEy894o/lBAk=;
        b=VlSmtkhO4ZD1OMSYoCuoaO5KJH/SJtAfUsDgEeHdZwdeqy3V8Mutu7FEXbEeFG7B45
         Qxn9fPKjpowuKicuJrwmSCPP8BEXTHtDT4JEX4TpYEe4kOh1QRT5zZiujtNlm6vi//zh
         attKC/QImrh+8fjsVvG8yTiKISD4QChsItFDtF0YywU1ytsoVv37qvUYAAPjB77sunbw
         T8kP84N9f3pNIPC/15Y8wYIw4aIifjkjbRVvroim3dIhgStcG7C2hEiCS1qF67UcYEkc
         d30XKYWxojPkSlMZGtC2VxR3fOKp2cWAbbxthadcGfcRytrWpUVWQ6XG8nbdsKMfE2M+
         KE1g==
X-Gm-Message-State: AOAM53270P3ERIYvuPyp9QYA1YQWWgMMnJYl1Qpv/dSrQo6QocFeQHcK
        hv4AUjrNnauy93gQfkWS+m35u7xlVrK7UKCg+6XG
X-Google-Smtp-Source: ABdhPJwngiMDrHlrSoWnA729RQinXoUDLUX6Mk3PvLSB5d+1UKewSWcwwlpQVbmesK3RoQZPw/mnWOtGWK0iz+LG5iM=
X-Received: by 2002:a05:6402:2552:b0:416:a745:9626 with SMTP id
 l18-20020a056402255200b00416a7459626mr2022463edb.405.1647480426068; Wed, 16
 Mar 2022 18:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220221212522.320243-1-mic@digikod.net> <20220221212522.320243-9-mic@digikod.net>
In-Reply-To: <20220221212522.320243-9-mic@digikod.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 16 Mar 2022 21:26:55 -0400
Message-ID: <CAHC9VhRwOfCN3BWVguiM7smVg7Rs9SrQsBZP-wwtFQ-b=gidUQ@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] samples/landlock: Add support for file reparenting
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
        Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 21, 2022 at 4:15 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>
> Add LANDLOCK_ACCESS_FS_REFER to the "roughly write" access rights and
> leverage the Landlock ABI version to only try to enforce it if it is
> supported by the running kernel.
>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20220221212522.320243-9-mic@digikod.net
> ---
>  samples/landlock/sandboxer.c | 37 +++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 11 deletions(-)

Reviewed-by: Paul Moore <paul@paul-moore.com>


--
paul-moore.com
