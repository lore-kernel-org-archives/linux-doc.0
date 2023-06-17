Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA75EB64D9
	for <linux-doc@archiver.kernel.org>; Sat, 17 Jun 2023 19:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjFQThj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Jun 2023 15:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjFQThi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Jun 2023 15:37:38 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50757B0
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 12:37:37 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-3fde5e37974so6946111cf.2
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 12:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687030656; x=1689622656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl4HsAfWCKb8ynFnpo6ruxSlGxogBQy+qHi+pBH3hog=;
        b=CEStdG2KSuhN4jXG9kQWWabVcw4GkfHS5TpEt44Q54ryqwb9f0w5HI+BUP1UIa1aFS
         gGALN7hKwk2npbWPFm1pGdwYJwy/jamn5M+uK3BF3QLzyDZJ7fnsmLWJwWsh+h3OEPlx
         0HWzaa0XYP26/B2kXeQrqkS5HH++DNveGujQSgE4QdvYDhI9ftZsn5kk9bIZk9P6ys7p
         3DVNI42KUHw0JEF2KuLLKJ1IeyczF5MxnXzUy178nN7Nh/VjiV1R5y32hlZmQ4CmMu03
         yPX7NnjWQqBAvkm/IEUEO/ibDHfdUeng6a/gzO68aS3NUhpa5CFEUMqUeYq/9BJ/JIb1
         XyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687030656; x=1689622656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kl4HsAfWCKb8ynFnpo6ruxSlGxogBQy+qHi+pBH3hog=;
        b=cOIQy6z4XDHV+YaUaXljJvRNiqgGZq5qE+SfWF9oNhA+4tqYxxc6Mq1jwgo2sEaWNf
         yTHHpcMZP3OuMUbQOt1Yc4U4GR3z9yJzzP05/PBoQXRWHy04xHxUdZ7phExkhwzqxR45
         xB6P3uG15ECLsDUKFjxbu7SeCNeSSvaMHHCQbKNTRkHGO7W1CKMWFhAXUsS8TtI6kafS
         Bk7pH5nOVk17ooK58yM0Tm3sAbzMARVIyQT9WA1BfUH83hY1mtg/mqappF8uRN18BcQC
         160AoVK6I3XxlzxBUBNXKMo5eW4DH/OtGkuCONXjDxjK5j1GW8tjObr5/ltdLPDvnfKL
         Macw==
X-Gm-Message-State: AC+VfDx2sibqVRWzeXlakygEcufjXPmaA9+s+7MBU6FEUeH09I/JGSBp
        coxwv0TAvwEwNgb8vOq+I8tMFbSm+b9HhUCrEow=
X-Google-Smtp-Source: ACHHUZ5zKsw7XT8IyzJ4imq0bfVShGn6HETQgfcJDdPOSPTF/MH8EX00PBxCfURYMHyOJvOCmIk4aZK2UG7+UUNyPY0=
X-Received: by 2002:a05:622a:491:b0:3eb:1512:91c5 with SMTP id
 p17-20020a05622a049100b003eb151291c5mr7765845qtx.12.1687030656133; Sat, 17
 Jun 2023 12:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230604190604.4800-1-eatnumber1@gmail.com> <20230605050853.6240-1-eatnumber1@gmail.com>
 <20230605050853.6240-5-eatnumber1@gmail.com>
In-Reply-To: <20230605050853.6240-5-eatnumber1@gmail.com>
From:   Russell Harmon <eatnumber1@gmail.com>
Date:   Sat, 17 Jun 2023 12:37:07 -0700
Message-ID: <CA+zrezSppKhAyNDofTpm2Rx+L1FmULdGadUi+svLzV-k8E0=LQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] Documentation: dm-integrity: Document an example
 of how the tunables relate.
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Friendly ping on this last patch. Was there additional changes needed
for this one?

On Sun, Jun 4, 2023 at 10:09=E2=80=AFPM Russell Harmon <eatnumber1@gmail.co=
m> wrote:
>
> Signed-off-by: Russell Harmon <eatnumber1@gmail.com>
> ---
>  Documentation/admin-guide/device-mapper/dm-integrity.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/D=
ocumentation/admin-guide/device-mapper/dm-integrity.rst
> index 0241457c0027..d8a5f14d0e3c 100644
> --- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
> @@ -213,6 +213,12 @@ table and swap the tables with suspend and resume). =
The other arguments
>  should not be changed when reloading the target because the layout of di=
sk
>  data depend on them and the reloaded target would be non-functional.
>
> +For example, on a device using the default interleave_sectors of 32768, =
a
> +block_size of 512, and an internal_hash of crc32c with a tag size of 4
> +bytes, it will take 128 KiB of tags to track a full data area, requiring
> +256 sectors of metadata per data area. With the default buffer_sectors o=
f
> +128, that means there will be 2 buffers per metadata area, or 2 buffers
> +per 16 MiB of data.
>
>  Status line:
>
> --
> 2.34.1
>
