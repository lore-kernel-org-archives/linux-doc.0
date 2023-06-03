Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2297C77B73
	for <linux-doc@archiver.kernel.org>; Sat,  3 Jun 2023 12:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjFCMqD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 08:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjFCMqC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 08:46:02 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72226F5
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 05:46:01 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-51452556acdso1808095a12.2
        for <linux-doc@vger.kernel.org>; Sat, 03 Jun 2023 05:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685796361; x=1688388361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/kQXT/D1g1MKGoMUybziH35SAU5dVuYh1icWNGsyKOM=;
        b=V94QgyD2dKQCZnm6sD3W746WsFl5C8Aw/flUOd+cgc5uU0Dh4xHHH7zNAVzOb3pWqV
         Fc2tJdepsZL3Y53d6itz1klo05yf9lR6MCF6pmfAAOHwXP1AdBA5iqpzDvMbs9eoak1f
         ZuM4onhy3IxnTWHTxsa2Hzb5FaVUWhgw8+XadQOA5kYXn+cEbernuL+kTwQRzaeKnmOD
         71v+zin4u0N4bGQqxHITCXUKtGWbfbWzliBBbzmSDJzImT/vYF+0fvR1Uy0VGZ5o/TtI
         sPHVWsLOv9YwOMoxxfUeLZM/tdQmGNTSQOzqbMJeW/UWKir22PwjmBvX1FS19RNX3c+7
         J5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685796361; x=1688388361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kQXT/D1g1MKGoMUybziH35SAU5dVuYh1icWNGsyKOM=;
        b=BPVX3MP3aVWajN2UBWrZrxZA9EDO4l0SxER0oBzV+jZRMufAKFQvpzyuzDrziLP/6P
         lJwK4QWsfxwgbKGKlplyANdPQXCGxFgx8egNTnvHWKZGjvhiUVn/PkixPKjbZuZ3lLj0
         BN/yG0IJJZK9CaeQr5KnWrVfB2RbOhwor9W+mLYscjb0mRNA7x5H2+SEitGHPgKZ96Gk
         JzBtrS42mpHLFHNtfX9+wPgNdoCP8aRVayp5ExT3BGNB7lfKPwpQAlpmMJpfl8p1HhDd
         sH1oF6aCmxqh1aMAcq7eN6uH52lg4rT6jBVWtyTzHduxeha30J89fWP1trUl02IKOdvX
         2r6w==
X-Gm-Message-State: AC+VfDx5wfDKkeSNg/Gq0DZvdYFrA3kBjAEOGJrS9r2nm+ASML/WqxmZ
        Em6vkbkUqemwDWhKRlayl9A=
X-Google-Smtp-Source: ACHHUZ7ul+2AjGHwv8RU2B7FQ6sTqG1EpxJS5Sa4Q6Il2hpdcn5WhfTnme1v+Di5r/la48egqoyLfQ==
X-Received: by 2002:a17:902:ecc4:b0:1ad:8c8f:afb1 with SMTP id a4-20020a170902ecc400b001ad8c8fafb1mr1653007plh.39.1685796360756;
        Sat, 03 Jun 2023 05:46:00 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-18.three.co.id. [180.214.233.18])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001ae6e270d8bsm3100571plb.131.2023.06.03.05.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 05:46:00 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 702F31069C9; Sat,  3 Jun 2023 19:45:56 +0700 (WIB)
Date:   Sat, 3 Jun 2023 19:45:56 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Russell Harmon <eatnumber1@gmail.com>, mpatocka@redhat.com,
        snitzer@redhat.com, dm-devel@redhat.com
Cc:     Linux Documentation <linux-doc@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH] Improve the dm-integrity documentation.
Message-ID: <ZHs2BHGBrJ-YGd-v@debian.me>
References: <20230530002032.15227-1-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PWdwoCEpVKy8qUSn"
Content-Disposition: inline
In-Reply-To: <20230530002032.15227-1-eatnumber1@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--PWdwoCEpVKy8qUSn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 05:20:32PM -0700, Russell Harmon wrote:
> Documents the meaning of the "buffer", adds documentation of the current
> defaults, and provides an example of how the tunables relate to each
> other.

What about splitting this patch into three-patch series, where each
patch do one improv?

Anyway, I'm reviewing the wording here.

> diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/D=
ocumentation/admin-guide/device-mapper/dm-integrity.rst
> index 8db172efa272..634a780d7c51 100644
> --- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
> @@ -25,7 +25,7 @@ mode it calculates and verifies the integrity tag inter=
nally. In this
>  mode, the dm-integrity target can be used to detect silent data
>  corruption on the disk or in the I/O path.
> =20
> -There's an alternate mode of operation where dm-integrity uses bitmap
> +There's an alternate mode of operation where dm-integrity uses a bitmap

OK.

>  instead of a journal. If a bit in the bitmap is 1, the corresponding
>  region's data and integrity tags are not synchronized - if the machine
>  crashes, the unsynchronized regions will be recalculated. The bitmap mode
> @@ -38,6 +38,15 @@ the device. But it will only format the device if the =
superblock contains
>  zeroes. If the superblock is neither valid nor zeroed, the dm-integrity
>  target can't be loaded.
> =20
> +Accesses to the on-disk metadata area containing checksums (aka tags) is
"Accesses to ... are ..."
> +buffered using dm-bufio. When an access to any given metadata area
> +occurs, each unique metadata area gets its own buffer(s). The buffer size
> +is capped at the size of the metadata area, but may be smaller, thereby
> +requiring multiple buffers to represent the full metadata area. A smaller
> +buffer size will produce a smaller resulting read/write operation to the
> +metadata area for small reads/writes. A full write to the data covered by
> +a single buffer does *not* skip the read of the metadata.
What about "The metadata is still read even in a full write to the data
covered by a single buffer."?

> +
>  To use the target for the first time:
> =20
>  1. overwrite the superblock with zeroes
> @@ -93,7 +102,7 @@ journal_sectors:number
>  	device. If the device is already formatted, the value from the
>  	superblock is used.
> =20
> -interleave_sectors:number
> +interleave_sectors:number (default 32768)
>  	The number of interleaved sectors. This values is rounded down to
>  	a power of two. If the device is already formatted, the value from
>  	the superblock is used.
> @@ -102,20 +111,16 @@ meta_device:device
>  	Don't interleave the data and metadata on the device. Use a
>  	separate device for metadata.
> =20
> -buffer_sectors:number
> -	The number of sectors in one buffer. The value is rounded down to
> -	a power of two.
> +buffer_sectors:number (default 128)
> +	The number of sectors in one metadata buffer. The value is rounded
> +	down to a power of two.
> =20
> -	The tag area is accessed using buffers, the buffer size is
> -	configurable. The large buffer size means that the I/O size will
> -	be larger, but there could be less I/Os issued.
> -
> -journal_watermark:number
> +journal_watermark:number (default 50)
>  	The journal watermark in percents. When the size of the journal
>  	exceeds this watermark, the thread that flushes the journal will
>  	be started.
> =20
> -commit_time:number
> +commit_time:number (default 10000)
>  	Commit time in milliseconds. When this time passes, the journal is
>  	written. The journal is also written immediately if the FLUSH
>  	request is received.
> @@ -163,11 +168,10 @@ journal_mac:algorithm(:key)	(the key is optional)
>  	the journal. Thus, modified sector number would be detected at
>  	this stage.
> =20
> -block_size:number
> -	The size of a data block in bytes.  The larger the block size the
> +block_size:number (default 512)
> +	The size of a data block in bytes. The larger the block size the
>  	less overhead there is for per-block integrity metadata.
> -	Supported values are 512, 1024, 2048 and 4096 bytes.  If not
> -	specified the default block size is 512 bytes.
> +	Supported values are 512, 1024, 2048 and 4096 bytes.
> =20
>  sectors_per_bit:number
>  	In the bitmap mode, this parameter specifies the number of
> @@ -209,6 +213,12 @@ table and swap the tables with suspend and resume). =
The other arguments
>  should not be changed when reloading the target because the layout of di=
sk
>  data depend on them and the reloaded target would be non-functional.
> =20
> +For example, on a device using the default interleave_sectors of 32768, a
> +block_size of 512, and an internal_hash of crc32c with a tag size of 4
> +bytes, it will take 128 KiB of tags to track a full data area, requiring
> +256 sectors of metadata per data area. With the default buffer_sectors of
> +128, that means there will be 2 buffers per metadata area, or 2 buffers
> +per 16 MiB of data.

OK.

> =20
>  Status line:
> =20
> @@ -285,8 +295,8 @@ The layout of the formatted block device:
>  * one or more runs of interleaved tags and data.
>      Each run contains:
> =20
> -	* tag area - it contains integrity tags. There is one tag for each
> -	  sector in the data area
> +	* tag area - it contains integrity tags. There is one tag for each sect=
or in
> +	  the data area. The size of this area is always 4KiB or greater.
Corresponding sector in the data area?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--PWdwoCEpVKy8qUSn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZHs1/QAKCRD2uYlJVVFO
o3sUAQDW3rmkdctzCygsLFvbfkCpt5czPdlpXyjZs+t1soVdeQEAtLmhK+CY2aJk
cCjdkPt5kB6FLBq8BrGlzeva5BCGOAk=
=II0O
-----END PGP SIGNATURE-----

--PWdwoCEpVKy8qUSn--
