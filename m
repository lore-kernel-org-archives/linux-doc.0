Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5EC297DD31
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 00:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750791AbeDYAAl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 20:00:41 -0400
Received: from mail-ua0-f194.google.com ([209.85.217.194]:36072 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750766AbeDYAAk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 20:00:40 -0400
Received: by mail-ua0-f194.google.com with SMTP id v4so13773795uaj.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 17:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=pSwvP27gE/tY/MIKwYpFGuQGhVzbcqJRSJi2xJskKrU=;
        b=eUrZXEvKuyx0Y3bRZbITsqmUIhdrD/BYCOvwI7xE7qGf0gde9NeJ2l/U6EfZHJKn7k
         iqVRcbMjA0f0IfefxridMo9l5iJdJaLGMTAWVIH2gTLOvDSvUT2/B2imcf0cgAdC0Zcb
         LTPAUM5wiQMvSltoKwjfzOZnhj+8ajkMEtSb7ZfV892t0AYD70EM+hiK14CAPZ+diDuQ
         XxMOdhgLwYe+LbR/Cz8QtRS9BSXqSgBDnt5c6B19ZZw+WcwpEwSzX4Q7Q0QXFZbFNDJd
         eBOiqcAvut3xNxBVXQFAIQ/smX0N8QC4Y8RkzsF9BrqnFJAa9C+oeg9N9e0v7i9kO27L
         2ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to;
        bh=pSwvP27gE/tY/MIKwYpFGuQGhVzbcqJRSJi2xJskKrU=;
        b=oW7HpmNxCVjLK2hCEZxdabOq1DHpfu3kYi1lUsPO/PYMz/uS1kafi8v3uopKEkB6q9
         N7M7RidJ7VWoi4Iv+Xw2m2hqRDvrHBMSeSfjueR1CCfy9rxMMN0MvSlqXkSDMQFiOKNl
         8h9wIDOSBTSgYrofe3mNrUXWW+3FltaLbD1z0KYTg80+/U/4Z8Y399xqqfIf4T7DWp00
         hZ4pBmSo+0Be4Qyl6Q18ggXqOuaxPoxmFOu0ikUriIEy/ZXy7z68fPZXVFMCavusj9F9
         qA4bj5uclggIUHbQog1G3zblM5EpB0D3WR5TtXmEfUh+1BV61YpqDF295Rd8/eIILK2Q
         dIaA==
X-Gm-Message-State: ALQs6tDeHF2mWmNMjtEsFjjwR0fQhhTH5L5FCRsUNDATcrlXytxUic88
        NugGq5Fid9kDvVkScJ/AWBifg6WphZ3FPL5swKtgqw==
X-Google-Smtp-Source: AIpwx49C3JFa54U8RiJIQiVvohbhKvHuMKuyB0g6Q54qxqRjN76G5CSMNMWSZ44w2ZqwdP3sCY6W+QONM8/0lpkDr/I=
X-Received: by 10.176.21.1 with SMTP id o1mr12832012uae.126.1524614439708;
 Tue, 24 Apr 2018 17:00:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.110.140 with HTTP; Tue, 24 Apr 2018 17:00:19 -0700 (PDT)
In-Reply-To: <20180419222356.242535-1-hansens@google.com>
References: <20180419222356.242535-1-hansens@google.com>
From:   Sam Hansen <hansens@google.com>
Date:   Tue, 24 Apr 2018 17:00:19 -0700
Message-ID: <CAP9bUy4aPPn=FdU1ZoFshK0dGpVuuaHt=M_YdHnSGLB63Q8Z+Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation/i2c: direct users to i2c-tools regarding i2c/smbus.h
To:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        Sam Hansen <hansens@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

friendly ping :)

This was an incremental patch requested by Wolfram.

On Thu, Apr 19, 2018 at 3:23 PM, Sam Hansen <hansens@google.com> wrote:
> The current examples reference i2c/smbus.h, which is the first reference
> in Documentation/i2c/dev-interface to anything related to the i2c-tools
> project.  This moves the existing reference to i2c-tools up into the
> C-example, directing the user to the project's git repository.
>
> Signed-off-by: Sam Hansen <hansens@google.com>
> ---
>  Documentation/i2c/dev-interface | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/i2c/dev-interface b/Documentation/i2c/dev-interface
> index fbed645ccd75..ed20f7b7851a 100644
> --- a/Documentation/i2c/dev-interface
> +++ b/Documentation/i2c/dev-interface
> @@ -23,6 +23,10 @@ First, you need to include these two headers:
>    #include <linux/i2c-dev.h>
>    #include <i2c/smbus.h>
>
> +The i2c/smbus header file is provided by the i2c-tools project.  For more info
> +about i2c-tools, see:
> +https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/
> +
>  Now, you have to decide which adapter you want to access. You should
>  inspect /sys/class/i2c-dev/ or run "i2cdetect -l" to decide this.
>  Adapter numbers are assigned somewhat dynamically, so you can not
> @@ -163,10 +167,6 @@ what happened. The 'write' transactions return 0 on success; the
>  returns the number of values read. The block buffers need not be longer
>  than 32 bytes.
>
> -The above functions are made available by linking against the libi2c library,
> -which is provided by the i2c-tools project.  See:
> -https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/.
> -
>
>  Implementation details
>  ======================
> --
> 2.17.0.484.g0c8726318c-goog
>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
