Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D2B1A8401
	for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748243064; cv=none; b=fbgT/P4yPdQYdKFpiJn0m185aaYQfEog2wSmv1OdRxqOAQYIFYhVsncerQCddvFyzri0JhUvtzr+qi+MhF+W8XF+rdVnO5Gbd7QYCFPHUxeqQZ7npwYQzRovFinuYSJVX5vXXIZWZ1T/vd+p/stBt51/OGRP6Kv4jnxlPb9IL14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748243064; c=relaxed/simple;
	bh=/KjtSwvPWJ1jRSl2ED9yyTGBt2MsUlLauotMZbELXeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoCnwmZZJ5w7jWZ/np6Kp2TBGZrUbNEHcJqCy3pSMPHFAhPHagQoyXVF5kSkloZO4e61puEqAMc+gqQ8FWp3jbWYqH2Q9eHEW2Y9VDX8XZnLgqqn26wmT3RZ0PKUomH9G8Mlgjnk9AAmb4yxmNwFa+SDvthj+B0G9tw5yJviwQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vc8g1cOX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vc8g1cOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748243061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsSqa4El9fWisOjdIZpyGfNCohIxqbRRIDaHJl1MAcg=;
	b=Vc8g1cOX6i+6wluOw+6FpbSX61PXgQKXtQPsCAnVJVWnA2Sp9CR/L+1umaxrNjzF2T3scg
	RvvH1/PYDRSu2BHx8Ixaob9KEGUxq0EaMcWoSNbOt5gvSn+AKFRQO50FBzjKav61VsV6hT
	zaxfiG9e2SR7p+jwSnd2IPpFV6VcN5c=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678--Mmb2ABeP7GmexmYoIkrYw-1; Mon, 26 May 2025 03:03:49 -0400
X-MC-Unique: -Mmb2ABeP7GmexmYoIkrYw-1
X-Mimecast-MFC-AGG-ID: -Mmb2ABeP7GmexmYoIkrYw_1748243028
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-550d7bd9a7fso944065e87.2
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 00:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748243028; x=1748847828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsSqa4El9fWisOjdIZpyGfNCohIxqbRRIDaHJl1MAcg=;
        b=vd2itKdB2ljOf9vcvAczBoq/73071kcRVkaIzJw+QZlNdz0+G0FmY2+hHjveqQ5nlR
         fJwoKtazAydYzLYjBCxKuYU5Z4ALQbscAF91cGzD35UVKDjNz9rcgssA2V11y847gvIM
         c5Mco3ykMKicJqYv94cFGQj2b/tEJt0A9KKTFomOdawFIDkCHFA6JsWXvrkw3U38XDyt
         EnKJv8LwJbgFiNKNzVtt3CVDDs3SNjiKAo9wzYVaX1FfjidD0SlayTtlY/MAd/tNASGG
         AA0IvXMr2tMnxtHWyG+4fgYrH56jTilgpDVLzbJk3xuodPGaPEF4R1Q2szCuXomKsrwH
         pAPw==
X-Forwarded-Encrypted: i=1; AJvYcCWXBSO2+UL9b8tbvAzfAsbkBRDe51idIEG1gk4OkUKJNO2uSYHWtfeVbjnDTVclvvRcHPgWCO2MaWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdF8Xbr/biJ+Zjcufp6CRD7CY+cUfOZ36XL53emAncq1PEk9F/
	hSAV8mSpv4ahVKD9BWJrQC15H8PqInGzFn+WGsE5dAcZmMuVff/TJ2uyBp2VCfnShSQMEXNFKuc
	3xBgnWbB9Yg9LHSyhzfmywFm9RsueViyli3+htd+00zzUDWO8G8rgoXjIxuv8G42toymEGON641
	FyuwbkyWUgZSzMPP0rqeEGQklOC2tzqYm/7W9D
X-Gm-Gg: ASbGnct4FOpk4VtP4pStwPE2M1AHzfPFFnHAnquQuSkfhUYFRGvcImqIUsrkaTZzPPT
	iDHTgVAj0fRr5pg7W5L1EB0G5yRUKvlJ8Lu8IWrVN4gUfios/OYV2OdYhXTUi01IJtHm2ig==
X-Received: by 2002:a05:6512:e81:b0:54a:c4af:29 with SMTP id 2adb3069b0e04-5521c9b49c3mr2194370e87.52.1748243027675;
        Mon, 26 May 2025 00:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiI1Yk6wtJQGChMVRuaINop3PCJafppboQa8n3wGOEjdM+iFjM89BfGUysLGx/bSchoPaUn/ub/pVQf6fAwJQ=
X-Received: by 2002:a05:6512:e81:b0:54a:c4af:29 with SMTP id
 2adb3069b0e04-5521c9b49c3mr2194360e87.52.1748243027250; Mon, 26 May 2025
 00:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-9-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-9-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 26 May 2025 15:03:33 +0800
X-Gm-Features: AX0GCFvwXVzrH9q1dPb-evKEBo6AYWl9O-76qs7DSfOVQGYh8gvgg_A7YC7NPKI
Message-ID: <CALTww2-bZ83SjNntJOmKmY8J8+8b2tE3JMTXbzcRr3K8yCj9xQ@mail.gmail.com>
Subject: Re: [PATCH 08/23] md/md-bitmap: add a new method skip_sync_blocks()
 in bitmap_operations
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
> This method is used to check if blocks can be skipped before calling
> into pers->sync_request(), llbiltmap will use this method to skip

type error: s/llbiltmap/llbitmap/g

> resync for unwritten/clean data blocks, and recovery/check/repair for
> unwritten data blocks;
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/md-bitmap.h | 1 +
>  drivers/md/md.c        | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index 2b99ddef7a41..0de14d475ad3 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -98,6 +98,7 @@ struct bitmap_operations {
>         md_bitmap_fn *start_discard;
>         md_bitmap_fn *end_discard;
>
> +       sector_t (*skip_sync_blocks)(struct mddev *mddev, sector_t offset=
);
>         bool (*start_sync)(struct mddev *mddev, sector_t offset,
>                            sector_t *blocks, bool degraded);
>         void (*end_sync)(struct mddev *mddev, sector_t offset, sector_t *=
blocks);
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index dc4b85f30e13..890c8da43b3b 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -9362,6 +9362,12 @@ void md_do_sync(struct md_thread *thread)
>                 if (test_bit(MD_RECOVERY_INTR, &mddev->recovery))
>                         break;
>
> +               if (mddev->bitmap_ops && mddev->bitmap_ops->skip_sync_blo=
cks) {
> +                       sectors =3D mddev->bitmap_ops->skip_sync_blocks(m=
ddev, j);
> +                       if (sectors)
> +                               goto update;
> +               }
> +
>                 sectors =3D mddev->pers->sync_request(mddev, j, max_secto=
rs,
>                                                     &skipped);
>                 if (sectors =3D=3D 0) {
> @@ -9377,6 +9383,7 @@ void md_do_sync(struct md_thread *thread)
>                 if (test_bit(MD_RECOVERY_INTR, &mddev->recovery))
>                         break;
>
> +update:
>                 j +=3D sectors;
>                 if (j > max_sectors)
>                         /* when skipping, extra large numbers can be retu=
rned. */
> --
> 2.39.2
>

Reviewed-by: Xiao Ni <xni@redhat.com>

