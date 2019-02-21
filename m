Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3198E7D099
	for <lwn-linux-doc@archive.lwn.net>; Thu, 21 Feb 2019 22:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfBUWnD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 21 Feb 2019 17:43:03 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:34880 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbfBUWnD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Feb 2019 17:43:03 -0500
Received: by mail-ua1-f68.google.com with SMTP id f88so265151uaf.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Feb 2019 14:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yeeHN5A8TYuXfyBLqkC461JBDCYqSC4jUmx5jzSnVf8=;
        b=HtJsTwMZ/y6bodUGz8ah6aWBE3c5suzmjH4E3AscE/Q0tKHjQ0EQyLo22c9SGNSZID
         feywrxucg+iY26CdlDvcsjAEzrTIy5kXaAVoUzrKJUmenp3tjnpB62AMFm+D8MJJ7GYJ
         GOqZIAqTnGopfeQD2vySUflTZPZUYpRUV3zEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yeeHN5A8TYuXfyBLqkC461JBDCYqSC4jUmx5jzSnVf8=;
        b=DAs5CQhSTpk5OoasfGmJdTk8V2lSko9eWi0afiCzsPq1aHfwKjAFvNJeiL3LYM08jS
         a93biAz8iF7MUdR2OYnjcwhtL2WfuG507v6VazbomPEAFK3JZY1Yec8BBEDB8sXMuBp+
         BuY/FMBmULL7pqjpTzv8cMx0DR0/qokCA7xxrlV5vSI4oiq+GIE7WjaiHRBz8qVWNatc
         f74JP0eQO+wP9HbA/wFHyOpAnNcPyMHMHEjLQ7V72t71wAuB6ZFK8UUr18EbDN9dx3Tn
         CdBBRnIZlJtWr54hnm1DzOx8S7uni8oNvx+LLpCmPjW2URsI43n4UiJ6tlI9LxbK4nax
         cbGA==
X-Gm-Message-State: AHQUAuazC6W1OGQYwimZvpzzPMAi8sT+vYo5IbtFnHLku1uqnxVCou2l
        IP2DM1fk/MchRt4nMm6Jso60D0wh+PA=
X-Google-Smtp-Source: AHgI3IZzAb5q8wZyev/3rT/MapTcJWG75k7+oyeUIy6r1WSJNsJaxmvMUMVM3rJ8KqZvuJ7geFFo6w==
X-Received: by 2002:ab0:234c:: with SMTP id h12mr556402uao.92.1550788981885;
        Thu, 21 Feb 2019 14:43:01 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id o6sm34000vkb.15.2019.02.21.14.43.00
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Feb 2019 14:43:00 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id b6so62893vkf.8
        for <linux-doc@vger.kernel.org>; Thu, 21 Feb 2019 14:43:00 -0800 (PST)
X-Received: by 2002:a1f:a5d3:: with SMTP id o202mr621947vke.40.1550788979940;
 Thu, 21 Feb 2019 14:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20190221203334.24504-1-helen.koike@collabora.com>
In-Reply-To: <20190221203334.24504-1-helen.koike@collabora.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Thu, 21 Feb 2019 14:42:47 -0800
X-Gmail-Original-Message-ID: <CAGXu5jL2xQL9rgwQsqfraGQwzOd2+yr-2qkKvZYNwXYGTV8TZA@mail.gmail.com>
Message-ID: <CAGXu5jL2xQL9rgwQsqfraGQwzOd2+yr-2qkKvZYNwXYGTV8TZA@mail.gmail.com>
Subject: Re: [PATCH v12] dm: add support to directly boot to a mapped device
To:     Helen Koike <helen.koike@collabora.com>
Cc:     device-mapper development <dm-devel@redhat.com>,
        Will Drewry <wad@chromium.org>,
        Mike Snitzer <snitzer@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        richard -rw- weinberger <richard.weinberger@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-lvm@redhat.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        kernel@collabora.com, Alasdair G Kergon <agk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 21, 2019 at 12:33 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Add a "create" module parameter, which allows device-mapper targets to be
> configured at boot time. This enables early use of dm targets in the boot
> process (as the root device or otherwise) without the need of an initramfs.
>
> The syntax used in the boot param is based on the concise format from the
> dmsetup tool to follow the rule of least surprise:
>
>         sudo dmsetup table --concise /dev/mapper/lroot
>
> Which is:
>         dm-mod.create=<name>,<uuid>,<minor>,<flags>,<table>[,<table>+][;<name>,<uuid>,<minor>,<flags>,<table>[,<table>+]+]
>
> Where,
>         <name>          ::= The device name.
>         <uuid>          ::= xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | ""
>         <minor>         ::= The device minor number | ""
>         <flags>         ::= "ro" | "rw"
>         <table>         ::= <start_sector> <num_sectors> <target_type> <target_args>
>         <target_type>   ::= "verity" | "linear" | ...
>
> For example, the following could be added in the boot parameters:
> dm-mod.create="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0
>
> Only the targets that were tested are allowed and the ones that doesn't
> change any block device when the dm is create as read-only. For example,
> mirror and cache targets are not allowed. The rationale behind this is
> that if the user makes a mistake, choosing the wrong device to be the
> mirror or the cache can corrupt data.
>
> The only targets allowed are:
> * crypt
> * delay
> * linear
> * snapshot-origin
> * striped
> * verity
>
> Co-developed-by: Will Drewry <wad@chromium.org>
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Thanks! This appears to have everything Chrome OS needs. I've asked a
few other folks to look at it too.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
