Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1DE24395C
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 07:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748415906; cv=none; b=htrErWx0wlE896APPWiczmgtMKCL3ttyxsI4be5vhCe78nFbfvpEPPwGArPdUcdEnTi0w8X9URIFUk3qA5w2nvWPgZCtKkGwJbqAlUNLt14ETDQaF4LW1+0Hw2Tik3kzr5pZLoZwo7tETlLMawoWvQFcbgXQ1VUkHEBYOZv6swI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748415906; c=relaxed/simple;
	bh=Mvf0YoyXqkCEfGtLJrNPzkLs56Eb/fTmLY/EAymjqvI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JYoYClnWKaRHZZJUhkDermB72TQ0eUgP0qMW+KtuAeDjeT7UQsid6fpkvtjQGI4KAtvxbURyTL/gzyMrUxlK8DCUHzcgD6rLCItaaMSlRN7gWAQqYr7zCYW+AIgNIwVHaIDwUNQcVl31SidVaa5AACnfD5thuXqqmByQByQnMT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MdUvmu7s; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MdUvmu7s"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a367ec7840so3024245f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 00:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748415902; x=1749020702; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u16XtC8m50vUYOx4xXsXVM1MdjBGyfgJ+HP9+pmHAnE=;
        b=MdUvmu7swZWRuH7FM9ZjRQti65q9gVQPBsliYZLzSD5nBXVwgG72DwMK9NVFqe2EPx
         g6RjAX47vOm/FzEHOwbEJ0AxYCwrtMb9vKJRx0mJLn6ZkI/jmdLMpqCL3nbsSxYXfTwu
         6Xa5Uu7343NyfOP7VK18fSuB63pmHa69xKV97i/0RBT7Wy2aYksS5MgFb4Wavld2iHy6
         h/DYuDWgqZR3j6dUpCBslbvgIf+T39T1OfEJq2hAavMdYw3OqN7h8SrSr2SXdTQrMjMr
         az3kj4gxx81yQS47dstF8jgTogZnB2d6l6iHJ0iwE+FjVNjBV3BIX9g7/jQfzu/SK/Jb
         YSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748415902; x=1749020702;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u16XtC8m50vUYOx4xXsXVM1MdjBGyfgJ+HP9+pmHAnE=;
        b=PCLnmep76FFULoLY6rXAGBqHNd8drQrOSpzg78LOGjg8r1aWWX403ebbd0l/OI1yQu
         3hma2yr5FNgbn2KZe+PL9kx5w24BPutntl+3wZXJLVORC3SwMKW+bqRWsULWDtbLAjEf
         IgLcNAqeqoXv0YA00tIgYPjfLN8g7Sll1MX1GW942xYmWyJGjoa4f/dTUrmjm2YifN8d
         sDFbN7bkh3GSTMypuzJykV9yLZFpxiavwal9QHexfHi/uhThnnXRCwjiAHJ8lEBUPYC2
         M/05W069NWrmRXqCOsodu3CurjWy5HpjashGKMPKvaYZo2cv5SA86sjdoEgalQy+ymMs
         D+aA==
X-Forwarded-Encrypted: i=1; AJvYcCX88C6Q4D/pQzvURFn38g5S3xfUYogGcwDeHiYHaEXYzUcDfdTWs0hTqHIvwWM8EdbV17WlcRmglCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/Yg8JVETrH5NCrJwlUamrTrjEmkEJI1BOU536epQm+jBymid
	NNaPjaS2NQu2jVP86KK1Zc+iXgIlthxDUWYO9fU0XD8cKBjGL49rORpULpQRe+4ii5Y=
X-Gm-Gg: ASbGnct2xFagGkSqIfEeTVb6UFFEaOxUEmzvcwGhutxOLdYkLFrlCAb4HLsZ2PEQuPA
	ZapDuueH3C+D47jdZlKR0xVpigz61kGoU3yoqmncM2Zr1QJuqgMxBA2jRXBnrgV0zF2bBhf2TW4
	MdoNUdXAImFFXoGXApmOUewoV3NmKI269VKJkftArmlBxwVk/JsHI0Qk21SpiR/DAeWHtel1sB3
	yt9viq5GOCB8Z12ntjlaxgsCOr5M8XY/g/wrADMOb0RG/02kP7VZER86BsEGwQeDmkCM0LCr9ZZ
	0XsvdJT1c9TmIjS5AjphXjqmKoYhEsdbA1/5pkNSCTplKC4jpScQMg==
X-Google-Smtp-Source: AGHT+IGpXaITFwVpQxA+RPc22IfCLswMDTsPi7E1xojNuF3q5QjYAgXEtA+f0fp8AMKu8GeLsAQ2dw==
X-Received: by 2002:a05:6000:1881:b0:3a4:c6bc:995b with SMTP id ffacd0b85a97d-3a4cb47b7f7mr12782146f8f.35.1748415902373;
        Wed, 28 May 2025 00:05:02 -0700 (PDT)
Received: from smtpclient.apple ([129.146.52.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311e9b457f0sm536715a91.2.2025.05.28.00.04.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 May 2025 00:05:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH 04/23] md/md-bitmap: support discard for bitmap ops
From: Glass Su <glass.su@suse.com>
In-Reply-To: <20250524061320.370630-5-yukuai1@huaweicloud.com>
Date: Wed, 28 May 2025 15:04:41 +0800
Cc: hch@lst.de,
 xni@redhat.com,
 colyli@kernel.org,
 song@kernel.org,
 yukuai3@huawei.com,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org,
 yi.zhang@huawei.com,
 yangerkun@huawei.com,
 johnny.chenyi@huawei.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4D5FB87E-13F7-4F61-85E6-F52E4245F37C@suse.com>
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <20250524061320.370630-5-yukuai1@huaweicloud.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)



> On May 24, 2025, at 14:13, Yu Kuai <yukuai1@huaweicloud.com> wrote:
>=20
> From: Yu Kuai <yukuai3@huawei.com>
>=20
> Use two new methods {start, end}_discard to handle discard IO, prepare
> to support new md bitmap.
>=20
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
> drivers/md/md-bitmap.c |  3 +++
> drivers/md/md-bitmap.h | 12 ++++++++----
> drivers/md/md.c        | 15 +++++++++++----
> drivers/md/md.h        |  1 +
> 4 files changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
> index 2997e09d463d..848626049dea 100644
> --- a/drivers/md/md-bitmap.c
> +++ b/drivers/md/md-bitmap.c
> @@ -2991,6 +2991,9 @@ static struct bitmap_operations bitmap_ops =3D {
>=20
> .start_write =3D bitmap_start_write,
> .end_write =3D bitmap_end_write,
> + .start_discard =3D bitmap_start_write,
> + .end_discard =3D bitmap_end_write,
> +
> .start_sync =3D bitmap_start_sync,
> .end_sync =3D bitmap_end_sync,
> .cond_end_sync =3D bitmap_cond_end_sync,
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index 9474e0d86fc6..4d804c07dbdd 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -70,6 +70,9 @@ struct md_bitmap_stats {
> struct file *file;
> };
>=20
> +typedef void (md_bitmap_fn)(struct mddev *mddev, sector_t offset,
> +    unsigned long sectors);
> +
> struct bitmap_operations {
> struct md_submodule_head head;
>=20
> @@ -90,10 +93,11 @@ struct bitmap_operations {
> void (*end_behind_write)(struct mddev *mddev);
> void (*wait_behind_writes)(struct mddev *mddev);
>=20
> - void (*start_write)(struct mddev *mddev, sector_t offset,
> -    unsigned long sectors);
> - void (*end_write)(struct mddev *mddev, sector_t offset,
> -  unsigned long sectors);
> + md_bitmap_fn *start_write;
> + md_bitmap_fn *end_write;
> + md_bitmap_fn *start_discard;
> + md_bitmap_fn *end_discard;
> +
> bool (*start_sync)(struct mddev *mddev, sector_t offset,
>   sector_t *blocks, bool degraded);
> void (*end_sync)(struct mddev *mddev, sector_t offset, sector_t =
*blocks);
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 04a659f40cd6..466087cef4f9 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -8845,18 +8845,24 @@ EXPORT_SYMBOL_GPL(md_submit_discard_bio);
> static void md_bitmap_start(struct mddev *mddev,
>    struct md_io_clone *md_io_clone)
> {
> + md_bitmap_fn *fn =3D unlikely(md_io_clone->rw =3D=3D STAT_DISCARD) ?
> +   mddev->bitmap_ops->start_discard :
> +   mddev->bitmap_ops->start_write;
> +
> if (mddev->pers->bitmap_sector)
> mddev->pers->bitmap_sector(mddev, &md_io_clone->offset,
>   &md_io_clone->sectors);
>=20
> - mddev->bitmap_ops->start_write(mddev, md_io_clone->offset,
> -       md_io_clone->sectors);
> + fn(mddev, md_io_clone->offset, md_io_clone->sectors);
> }
>=20
> static void md_bitmap_end(struct mddev *mddev, struct md_io_clone =
*md_io_clone)
> {
> - mddev->bitmap_ops->end_write(mddev, md_io_clone->offset,
> -     md_io_clone->sectors);
> + md_bitmap_fn *fn =3D unlikely(md_io_clone->rw =3D=3D STAT_DISCARD) ?
> +   mddev->bitmap_ops->end_discard :
> +   mddev->bitmap_ops->end_write;
> +
> + fn(mddev, md_io_clone->offset, md_io_clone->sectors);
> }
>=20
> static void md_end_clone_io(struct bio *bio)
> @@ -8895,6 +8901,7 @@ static void md_clone_bio(struct mddev *mddev, =
struct bio **bio)
> if (bio_data_dir(*bio) =3D=3D WRITE && md_bitmap_enabled(mddev)) {
> md_io_clone->offset =3D (*bio)->bi_iter.bi_sector;
> md_io_clone->sectors =3D bio_sectors(*bio);
> + md_io_clone->rw =3D op_stat_group(bio_op(*bio));
> md_bitmap_start(mddev, md_io_clone);
> }
>=20
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index c241119e6ef3..13e3f9ce1b79 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -850,6 +850,7 @@ struct md_io_clone {
> unsigned long start_time;
> sector_t offset;
> unsigned long sectors;
> + enum stat_group rw;

Please also mention the change in commit message.

=E2=80=94=20
Su
> struct bio bio_clone;
> };
>=20
> --=20
> 2.39.2
>=20
>=20

