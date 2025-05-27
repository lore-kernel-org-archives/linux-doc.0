Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535C1157493
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 02:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748313372; cv=none; b=FOR0aclU+rs01+oT7wXiuHon1Gmk0fgzhW4KtXQuSGy/GYzsX7Jeni8izN8D32ujLMj379UuatQnU7QtGp08OXvflg4tOVq2oJgIk1KV5rZreI7vldUASGKZ8R7BOU5glfg6UBq5jiqTff6fvliF1aiYYId3eQ0rNQMojxoKI8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748313372; c=relaxed/simple;
	bh=6IysQuqPIirVPJ20MXpnOYL10kNr8b+rwsHhBUSSrFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jI0ERq6AGmMg3vgmQ+LFrLBdH6wHCxRWdS40iH9jLaX/tfcaMxjSQRr9FqfKKO1UZmWQCvw9VwQ3dfjDxmA7ffrbVe6Oy6d0W4At+8xBsCja+F+qQByotKxKAnw8WPufmwbgrYMUdEfKPMKc+68JXoJBxEi0StI+ae8uzoeOCHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BxGbnSxW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BxGbnSxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748313368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFRiJRUJ5Mw8C89zokdx13mpy+WSevYfsGvmJ/SmKuo=;
	b=BxGbnSxWkr2lCmonc9vZmJE/VjQWq2wfMpchMQl6ImtjRkdXuUDjAFtcKKS6mXnVmiWB8V
	CraLjqSnQyHmJb/4K056/9g+y/tApplo+Nbgen+GaSokUawdDTDh3yH/3TkmcL2U4KcsO4
	xNRUPTMiYAiQa3M15c3EP/ILV3QG/t4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-srKtacbPMo-BbmzLdBC_mw-1; Mon, 26 May 2025 22:36:06 -0400
X-MC-Unique: srKtacbPMo-BbmzLdBC_mw-1
X-Mimecast-MFC-AGG-ID: srKtacbPMo-BbmzLdBC_mw_1748313365
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-32a6ecca4ddso154751fa.0
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 19:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748313364; x=1748918164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFRiJRUJ5Mw8C89zokdx13mpy+WSevYfsGvmJ/SmKuo=;
        b=mWnWpOBsVsmr6lGsKsNRmim4NYzkKZp4NO9zkeOtEDRaWbdjtpNOW8dzSLYCLC6urB
         B5XTaa1wWMAF65RlHrQMVnEBVgMY/+syiDkdM+OGGKwdNy8WQzhqEpjvIjq4LCtaqpv4
         SJWaUW93lxgEa7/VH3bJTFyME2UaWAfTtULevjdVb8qKfs1I3FJMnaTGS15lxJGU5Bs4
         ySxooFRGEj5VsgWBGCi1C29HJJB2AReZg+7bImsrhfg2+4Ty2MszWDmwUuY8hgRSb0vj
         5uFCK4qL5RMl9163mVo0uFtFEgPb71whqiNsWZthJvzOwW9qhiTb3Wt6vpjQN61smgSa
         La8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVy3LrBPPYbJ8vngyfAHb4n0A9o8WDaf9ODRK6uFZQ0huOeBLvkDX778kobB2demNOShU9j4d8M2Js=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ERw6jeLch+hQWrsEKrEhS8NPoTXhwYDIpZ+dByLndiAQ6C7+
	C6ndi5C/4tgxMlJr3FA0+33G/H4VUU6BE14tlohqwPNPCngPOdh69EPoava1cz2caaIeq1g8j7b
	Bh42FBBSQbwO9AOFs73g9HbljlKHyRAoeWIeDUUzq5HAudJ1Wiyb0CnIKZzoF5vAMLLmfJRdG99
	D17N/S3bX+8ObH7Dh8rspgijdFPbiogPF7ZGW+
X-Gm-Gg: ASbGnctXlcjfBZVZngpw8YcKliQTCGbOCpO+VE6jeHP/uvow8UMnf24t1zGQmsnu089
	RUyj7mqc/1szVpAbQ/MtmnxNNDMCGDWYDIPK4pOPFzvWd83clqsUC2atKdxvVyh1h4KOq/A==
X-Received: by 2002:a2e:be07:0:b0:30b:ca48:1089 with SMTP id 38308e7fff4ca-3295b9fddcemr32333811fa.2.1748313364431;
        Mon, 26 May 2025 19:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHzlKhVUBffhuV2+h2QVDGsTy36PX3lXXzL5uuAstSGPE2XoqbMaH+sySnrMhnulHPmQoqoU8LoYIVcSD1GCc=
X-Received: by 2002:a2e:be07:0:b0:30b:ca48:1089 with SMTP id
 38308e7fff4ca-3295b9fddcemr32333701fa.2.1748313364028; Mon, 26 May 2025
 19:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-10-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-10-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Tue, 27 May 2025 10:35:52 +0800
X-Gm-Features: AX0GCFtY9ewwOS9jHRX0o0KQoPl--1ydmOuIi60LLrPuRoO65gYDMIPx_lXNBu0
Message-ID: <CALTww2_SUyLUFzQgLe+z0UFmcS72o1JDEkPfR5FEsOmj8CDsXw@mail.gmail.com>
Subject: Re: [PATCH 09/23] md/md-bitmap: add a new method blocks_synced() in bitmap_operations
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, yukuai3@huawei.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com, 
	johnny.chenyi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 2:18=E2=80=AFPM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> From: Yu Kuai <yukuai3@huawei.com>
>
> Currently, raid456 must perform a whole array initial recovery to build
> initail xor data, then IO to the array won't have to read all the blocks
> in underlying disks.
>
> This behavior will affect IO performance a lot, and nowadays there are
> huge disks and the initial recovery can take a long time. Hence llbitmap
> will support lazy initial recovery in following patches. This method is
> used to check if data blocks is synced or not, if not then IO will still
> have to read all blocks for raid456.

Hi Kuai

In function handle_stripe_dirtying, if the io is behind resync, it
will force rcw. Does this interface have the same function=EF=BC=9F

Regards
Xiao
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/md-bitmap.h | 1 +
>  drivers/md/raid5.c     | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index 0de14d475ad3..f2d79c8a23b7 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -99,6 +99,7 @@ struct bitmap_operations {
>         md_bitmap_fn *end_discard;
>
>         sector_t (*skip_sync_blocks)(struct mddev *mddev, sector_t offset=
);
> +       bool (*blocks_synced)(struct mddev *mddev, sector_t offset);
>         bool (*start_sync)(struct mddev *mddev, sector_t offset,
>                            sector_t *blocks, bool degraded);
>         void (*end_sync)(struct mddev *mddev, sector_t offset, sector_t *=
blocks);
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 7e66a99f29af..e5d3d8facb4b 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -3748,6 +3748,7 @@ static int want_replace(struct stripe_head *sh, int=
 disk_idx)
>  static int need_this_block(struct stripe_head *sh, struct stripe_head_st=
ate *s,
>                            int disk_idx, int disks)
>  {
> +       struct mddev *mddev =3D sh->raid_conf->mddev;
>         struct r5dev *dev =3D &sh->dev[disk_idx];
>         struct r5dev *fdev[2] =3D { &sh->dev[s->failed_num[0]],
>                                   &sh->dev[s->failed_num[1]] };
> @@ -3762,6 +3763,11 @@ static int need_this_block(struct stripe_head *sh,=
 struct stripe_head_state *s,
>                  */
>                 return 0;
>
> +       /* The initial recover is not done, must read everything */
> +       if (mddev->bitmap_ops && mddev->bitmap_ops->blocks_synced &&
> +           !mddev->bitmap_ops->blocks_synced(mddev, sh->sector))
> +               return 1;
> +
>         if (dev->toread ||
>             (dev->towrite && !test_bit(R5_OVERWRITE, &dev->flags)))
>                 /* We need this block to directly satisfy a request */
> --
> 2.39.2
>

