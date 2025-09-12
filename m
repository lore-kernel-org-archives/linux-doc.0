Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D7B15A848
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757647148; cv=none; b=BtpdP9m2bg7tNboX+DOuMZFl7oH7Jn5VZW/kiFZ96zvqYN7keOgAmNuwKv7zvXptdRjegzOLzT0zLCz2/F2oBuKaw/91euoti9RUWwTqjxcDhYtPevthb18b0zKSKHL8gNVQ8jlMm2aZOp59c/pOGFkvPpMiifFh0DI2za/HZLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757647148; c=relaxed/simple;
	bh=PjHoT/d6hpougxDUieTzavYFgDNfvQOoy5mw2Kkbi+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLSntLWFuRqyy+tYA+xVVtD0iYBNxr62Yn5UXlauwD+UjhACoh1qkYut0vET2vnOy5JDKWGj961X1dQAygdJXkP8jCvg0vs7eOtygFXQQq2xxGVmekco1tnvH8gSYWHmfCD45z+Nsf2EhVI56qCsNcFPaFmUkShG5XlkTBDclQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VrudoT0N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VrudoT0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757647145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec4LT5rosSmS5p18qT9MoldgNlL6llQc6DnAN4H36dc=;
	b=VrudoT0NDtpveaDhqJlm7em5SdKRRz/wVufWYONqtqzLrcrYO8oBGUE5L7l09+8pyUuQ7K
	3bIg2ZH8+DcOvtSau0zUNJ3aUjHzGqaD/qy+YDCsVARyeSfjKKVgLWQP+1PzGCJoNZzv7R
	kq0YP/xoJep1YYNEU67/kUPhBtovhVk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-2aHycAbrN2SQyhbAGZ6qKw-1; Thu, 11 Sep 2025 23:19:03 -0400
X-MC-Unique: 2aHycAbrN2SQyhbAGZ6qKw-1
X-Mimecast-MFC-AGG-ID: 2aHycAbrN2SQyhbAGZ6qKw_1757647142
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-336e1c46feeso6754481fa.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 20:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757647142; x=1758251942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec4LT5rosSmS5p18qT9MoldgNlL6llQc6DnAN4H36dc=;
        b=X6KlxfDRvnjNrg4lOXKezMjEonXTzNerh2toWZsSorNJhph/KuoQamXBSh38xMiPZT
         zIDnckp1hmFW0xGWerIAqMbJJ9aS9GGQ9zup+hyZ3NdquszjIMymTrjBYjkcVmJ6kDao
         Zt9hRxKR4gzNGxeAIK/LlNP9I7tebphBRLRNs8bdlu+vyqLKNhBuIkwF8/EUfYcWZ5mB
         uooCv9jNYP3EWKrFUcxo7spUDgvxKXEaSCpfuOsRMZqG2/LaSR8ibML5k3B/ddBcApcX
         nc/AJkV6AmfckkdPZcdXYldFe8BqkmGPjZOL2fkEzCDLG8v7x3Mr2//LGhj/ak/duu9m
         mN0w==
X-Forwarded-Encrypted: i=1; AJvYcCVOjwMyrixNSvngLNWnsB+5uc5aaj2JcuulSfE99riNcT5UFcUis/K+v5GMK3IGaTi6XPNfo/qetPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5q2v+yStXvhVyXSCv6bQ+cyiYNr5Ruc+YsQWO0iqR0thkuc2X
	cMqLxM5eI5zIad15BVN4iAg+P+5qmIJJk7Bwfr1NjM0h8QUCgdnsQK+IlcjCWpqQgSxlbj40Yfi
	WuRYp1kc5m/a2BsdtHoYG5XkrF95klmpzCwXBmZiqkrLxPApvtPGJUX3hj9z4VA03UiP4Vcg6K2
	VgxNnmcqkNIFDyGqiIRqttBDDUkMUAbXLHV/TF
X-Gm-Gg: ASbGncudsewThJPVjKronF/DtCOWukF5xJkn+6v+QLkxwBqofEYTbXhu6QyvzjoFQzo
	I2h/tJJjQS0VJdhd9tChSUiW/jtAhINp//2v2ip+X+Tquz71rKuAqPsKfFCYRCzud7yb2HfZMO2
	E1QC560SZcv+jDLdYuIKnT
X-Received: by 2002:a2e:be9b:0:b0:336:89b5:c70a with SMTP id 38308e7fff4ca-3513a8ee687mr4215201fa.12.1757647141864;
        Thu, 11 Sep 2025 20:19:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLR6dW4LJcHhS0+kblBMouz4MnGzTLv42S4hlrpmzCND9qYd5eY9mleXav7CncLnrWS8GkeEb5PppVWguERIU=
X-Received: by 2002:a2e:be9b:0:b0:336:89b5:c70a with SMTP id
 38308e7fff4ca-3513a8ee687mr4215081fa.12.1757647141439; Thu, 11 Sep 2025
 20:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911073144.42160-1-linan666@huaweicloud.com> <20250911073144.42160-2-linan666@huaweicloud.com>
In-Reply-To: <20250911073144.42160-2-linan666@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Fri, 12 Sep 2025 11:18:49 +0800
X-Gm-Features: Ac12FXwC64X2iTtI6ND0sn_OfF3t4ygR1KBz6aQfQNHJU7vgbM5-fEvoSGl_XJo
Message-ID: <CALTww2-rbwtJTm+yyX6mar_eybLCbpFoWQWdOM9j4_hgW0=4Hg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] md: prevent adding disks with larger
 logical_block_size to active arrays
To: linan666@huaweicloud.com
Cc: corbet@lwn.net, song@kernel.org, yukuai3@huawei.com, linan122@huawei.com, 
	hare@suse.de, martin.petersen@oracle.com, bvanassche@acm.org, 
	filipe.c.maia@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, 
	yangerkun@huawei.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 3:41=E2=80=AFPM <linan666@huaweicloud.com> wrote:
>
> From: Li Nan <linan122@huawei.com>
>
> When adding a disk to a md array, avoid updating the array's
> logical_block_size to match the new disk. This prevents accidental
> partition table loss that renders the array unusable.
>
> The later patch will introduce a way to configure the array's
> logical_block_size.
>
> The issue was introduced before Linux 2.6.12-rc2.
>
> Fixes: d2e45eace8 ("[PATCH] Fix raid "bio too big" failures")

Hi Li Nan

I can't find the commit in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

git show d2e45eace8
fatal: ambiguous argument 'd2e45eace8': unknown revision or path not
in the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'

Regards
Xiao
> Signed-off-by: Li Nan <linan122@huawei.com>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---
>  drivers/md/md.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index a77c59527d4c..40f56183c744 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -6064,6 +6064,13 @@ int mddev_stack_new_rdev(struct mddev *mddev, stru=
ct md_rdev *rdev)
>         if (mddev_is_dm(mddev))
>                 return 0;
>
> +       if (queue_logical_block_size(rdev->bdev->bd_disk->queue) >
> +           queue_logical_block_size(mddev->gendisk->queue)) {
> +               pr_err("%s: incompatible logical_block_size, can not add\=
n",
> +                      mdname(mddev));
> +               return -EINVAL;
> +       }
> +
>         lim =3D queue_limits_start_update(mddev->gendisk->queue);
>         queue_limits_stack_bdev(&lim, rdev->bdev, rdev->data_offset,
>                                 mddev->gendisk->disk_name);
> --
> 2.39.2
>

