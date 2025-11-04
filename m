Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530BD220F38
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 01:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762219515; cv=none; b=IMgqZEWA8NikxDOFuR/RmtSknWpjGamHnFiyweUQ7i7wTGs7p0tIG7qq/2qt25xSCk+Y68zppe8HdxoIEuIuPZ9j9lVbacWXAHFBztek+EMiDo98m34AbhOlHk0axeYq72V5aPP9PruP/kzYunU8I7c5NZjbifyoGzucz4tMmXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762219515; c=relaxed/simple;
	bh=CYEmIKuR9CLW3Et/k3h/vTZHPiYXmHvJBxUygLG4wdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDkDGUJGc6swqgxusjbwAHB7uZoQMkpaECDumoP4+Em7HS58tNzFPODQGQGsI6tymzYG8kXgdQjhBnjeJluviON3yVZol1PiTBtV+6KXm9fuKeLDEAEVqhu6O4A+Zk13HN1JoqAyOBxA9tze3SYtp+HrzVFD+0OBjvg1BX1VvhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qb+0ITxH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HrE748ag; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qb+0ITxH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HrE748ag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762219512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+Pi6/EzEUXDzMLfenxWjlTIF8SdLRl2QPAi+dgGym8=;
	b=Qb+0ITxHaSl0Swaj0jQJqH3pXQgitAGv0K6f+HYKy8DRZfKwwoPfg7+S0I3l8aCynSEfju
	95mXdzjkHiUBOJBLJStvM1H36hvQHU07TGaRzYEwkQZt9JJUDXtrtQFQ2oKsN/Qr0sII+I
	npXSCEChl81A6YNnFDUAoFFIy7C6TtQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-M4lNy82jMo-olyQrR3UnAg-1; Mon, 03 Nov 2025 20:25:11 -0500
X-MC-Unique: M4lNy82jMo-olyQrR3UnAg-1
X-Mimecast-MFC-AGG-ID: M4lNy82jMo-olyQrR3UnAg_1762219510
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-57b9c463726so3719839e87.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 17:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762219509; x=1762824309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Pi6/EzEUXDzMLfenxWjlTIF8SdLRl2QPAi+dgGym8=;
        b=HrE748agXw2FeXFIg4dG8k/KaNm9iwWEXo0cYojEx/Bx5IFXozxk8FTDiOuFuTGJ3J
         cz9m70OCtci2u20DPWWbVES9lTMQRyAzwl1UltckTFpV0bVvkhOWnrg39TuF7OpDnek0
         pfUvAHodtdYTTK3s5wEF1LkMZ6VVsnt6gBbuMrfONbDlb7VBQEmy64Mz07d9BnHkK4on
         eVASTVgmf9BHTaCxi3XPMG6efq8IC04afjjjaZnkO3FlXcSN9hvOG3s7AMGsMJKAhkmM
         JlUALDhOM9D0Jt5eUnZpo9e/Ow0T0O8h4mQTPskpZo5gZJIwIaCmDD7eOREAOlPnpNYZ
         JGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762219509; x=1762824309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+Pi6/EzEUXDzMLfenxWjlTIF8SdLRl2QPAi+dgGym8=;
        b=XgCIPS4Gx7sIlNFliDxO3Nv04UXyC/35TxLXMqcjimf5rVUxQPk+0UTUElMh8BgzVX
         FFsyiOo9BxGb8QZhsmRtuWWBDt1SZMkJ4C3CUYG7sZV2razDq2IFyOAxV+D5FAxpfy95
         cSZj3yMVL9i22kJh8nkSniKOJjAqNKlakfs3fs9GwZW2N1X2UmP/desgTvnCeOYjvIb0
         cp0WPm/eGlLbMtq8YfRVgiyRX91d8VKAe9+ULy6Z5vYEGbHF976z2V0gJukMkUDxtF5e
         KdnFXpUEntCNwEO6Y/zNtn2ZuEbrHpqbvMLI9JYrJ/GccJHSa+MGKo9AO6l9G3kt5k0A
         xJag==
X-Forwarded-Encrypted: i=1; AJvYcCXla5DPbD5MaJs5CfxqgSyOesN7NNzYpBDZ4s2AchLDVyW8T49mmaY9Yi+i9OD2xgNYuBvKRe/icXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/NuOOLu4JpjuPF7HUFsLHrSBMz/YJV4ueHYaq4EeyQvr/erq
	KofZnaLZy/jUOegnJPDigcdXMySJCC55iHu7N5hChrMMbGhALCiSq0AdXRRR+JGoywKbdmdqTMA
	/vy5zjHwbmrT2iJuEIdqX7cYpRJeB+IyGxtE959TIaYv7bI6tZzrwhJ3+EhE8lxrp7cUTlMNFOZ
	zSWJX93oZlLVeQ7HseLw1Etj3peymu2hq4oliu
X-Gm-Gg: ASbGnctXYsyTEHmFd8ZjQ4dD6HOYjFNTtKR5TfwnxcCwtu7pe7Ojtlm0gwrH3W+xLKA
	Q5SUCbnZluI+a0j+tRQrLYfut6UH6RC3Ix8CMCfmmczc3iaeTwGGb0O8/6p0/2CL8dB7a8Hb8PM
	I18qi0vXs6o/2I9JLYr1uCPhwZdMsFPwJB3jaGA91nQV/oUKJB5J2rvEvc
X-Received: by 2002:a05:6512:3b9f:b0:594:2f46:3906 with SMTP id 2adb3069b0e04-5942f463d1amr1182727e87.42.1762219509403;
        Mon, 03 Nov 2025 17:25:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw+KiUrbgaRA5jFO8291/8XW/xkoPYWP1hLqH3v4yorjNPQPklqDre2uxyaVfCPIDpDHsw7E2sA0cWV4kRwBU=
X-Received: by 2002:a05:6512:3b9f:b0:594:2f46:3906 with SMTP id
 2adb3069b0e04-5942f463d1amr1182709e87.42.1762219507875; Mon, 03 Nov 2025
 17:25:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103125757.1405796-1-linan666@huaweicloud.com> <20251103125757.1405796-3-linan666@huaweicloud.com>
In-Reply-To: <20251103125757.1405796-3-linan666@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Tue, 4 Nov 2025 09:24:56 +0800
X-Gm-Features: AWmQ_bl0ZE8kKgiKI_kPU0KuvN7Otr0v8uenrtaMuUfYGTLMUrnpLuESn0q_kmc
Message-ID: <CALTww29QY49_DA3e71fev+YDCQ-Qse5tGVCdjY+czw096K0EAg@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] md: init bioset in mddev_init
To: linan666@huaweicloud.com
Cc: corbet@lwn.net, song@kernel.org, yukuai@fnnas.com, linan122@huawei.com, 
	hare@suse.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yangerkun@huawei.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 9:06=E2=80=AFPM <linan666@huaweicloud.com> wrote:
>
> From: Li Nan <linan122@huawei.com>
>
> IO operations may be needed before md_run(), such as updating metadata
> after writing sysfs. Without bioset, this triggers a NULL pointer
> dereference as below:
>
>  BUG: kernel NULL pointer dereference, address: 0000000000000020
>  Call Trace:
>   md_update_sb+0x658/0xe00
>   new_level_store+0xc5/0x120
>   md_attr_store+0xc9/0x1e0
>   sysfs_kf_write+0x6f/0xa0
>   kernfs_fop_write_iter+0x141/0x2a0
>   vfs_write+0x1fc/0x5a0
>   ksys_write+0x79/0x180
>   __x64_sys_write+0x1d/0x30
>   x64_sys_call+0x2818/0x2880
>   do_syscall_64+0xa9/0x580
>   entry_SYSCALL_64_after_hwframe+0x4b/0x53
>
> Reproducer
> ```
>   mdadm -CR /dev/md0 -l1 -n2 /dev/sd[cd]
>   echo inactive > /sys/block/md0/md/array_state
>   echo 10 > /sys/block/md0/md/new_level
> ```
>
> mddev_init() can only be called once per mddev, no need to test if bioset
> has been initialized anymore.
>
> Fixes: d981ed841930 ("md: Add new_level sysfs interface")
> Signed-off-by: Li Nan <linan122@huawei.com>
> ---
>  drivers/md/md.c | 69 +++++++++++++++++++++++--------------------------
>  1 file changed, 33 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index f6fd55a1637b..dffc6a482181 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -730,6 +730,8 @@ static void mddev_clear_bitmap_ops(struct mddev *mdde=
v)
>
>  int mddev_init(struct mddev *mddev)
>  {
> +       int err =3D 0;
> +
>         if (!IS_ENABLED(CONFIG_MD_BITMAP))
>                 mddev->bitmap_id =3D ID_BITMAP_NONE;
>         else
> @@ -741,10 +743,23 @@ int mddev_init(struct mddev *mddev)
>
>         if (percpu_ref_init(&mddev->writes_pending, no_op,
>                             PERCPU_REF_ALLOW_REINIT, GFP_KERNEL)) {
> -               percpu_ref_exit(&mddev->active_io);
> -               return -ENOMEM;
> +               err =3D -ENOMEM;
> +               goto exit_acitve_io;
>         }
>
> +       err =3D bioset_init(&mddev->bio_set, BIO_POOL_SIZE, 0, BIOSET_NEE=
D_BVECS);
> +       if (err)
> +               goto exit_writes_pending;
> +
> +       err =3D bioset_init(&mddev->sync_set, BIO_POOL_SIZE, 0, BIOSET_NE=
ED_BVECS);
> +       if (err)
> +               goto exit_bio_set;
> +
> +       err =3D bioset_init(&mddev->io_clone_set, BIO_POOL_SIZE,
> +                         offsetof(struct md_io_clone, bio_clone), 0);
> +       if (err)
> +               goto exit_sync_set;
> +
>         /* We want to start with the refcount at zero */
>         percpu_ref_put(&mddev->writes_pending);
>
> @@ -773,11 +788,24 @@ int mddev_init(struct mddev *mddev)
>         INIT_WORK(&mddev->del_work, mddev_delayed_delete);
>
>         return 0;
> +
> +exit_sync_set:
> +       bioset_exit(&mddev->sync_set);
> +exit_bio_set:
> +       bioset_exit(&mddev->bio_set);
> +exit_writes_pending:
> +       percpu_ref_exit(&mddev->writes_pending);
> +exit_acitve_io:
> +       percpu_ref_exit(&mddev->active_io);
> +       return err;
>  }
>  EXPORT_SYMBOL_GPL(mddev_init);
>
>  void mddev_destroy(struct mddev *mddev)
>  {
> +       bioset_exit(&mddev->bio_set);
> +       bioset_exit(&mddev->sync_set);
> +       bioset_exit(&mddev->io_clone_set);
>         percpu_ref_exit(&mddev->active_io);
>         percpu_ref_exit(&mddev->writes_pending);
>  }
> @@ -6393,29 +6421,9 @@ int md_run(struct mddev *mddev)
>                 nowait =3D nowait && bdev_nowait(rdev->bdev);
>         }
>
> -       if (!bioset_initialized(&mddev->bio_set)) {
> -               err =3D bioset_init(&mddev->bio_set, BIO_POOL_SIZE, 0, BI=
OSET_NEED_BVECS);
> -               if (err)
> -                       return err;
> -       }
> -       if (!bioset_initialized(&mddev->sync_set)) {
> -               err =3D bioset_init(&mddev->sync_set, BIO_POOL_SIZE, 0, B=
IOSET_NEED_BVECS);
> -               if (err)
> -                       goto exit_bio_set;
> -       }
> -
> -       if (!bioset_initialized(&mddev->io_clone_set)) {
> -               err =3D bioset_init(&mddev->io_clone_set, BIO_POOL_SIZE,
> -                                 offsetof(struct md_io_clone, bio_clone)=
, 0);
> -               if (err)
> -                       goto exit_sync_set;
> -       }
> -
>         pers =3D get_pers(mddev->level, mddev->clevel);
> -       if (!pers) {
> -               err =3D -EINVAL;
> -               goto abort;
> -       }
> +       if (!pers)
> +               return -EINVAL;
>         if (mddev->level !=3D pers->head.id) {
>                 mddev->level =3D pers->head.id;
>                 mddev->new_level =3D pers->head.id;
> @@ -6426,8 +6434,7 @@ int md_run(struct mddev *mddev)
>             pers->start_reshape =3D=3D NULL) {
>                 /* This personality cannot handle reshaping... */
>                 put_pers(pers);
> -               err =3D -EINVAL;
> -               goto abort;
> +               return -EINVAL;
>         }
>
>         if (pers->sync_request) {
> @@ -6554,12 +6561,6 @@ int md_run(struct mddev *mddev)
>         mddev->private =3D NULL;
>         put_pers(pers);
>         md_bitmap_destroy(mddev);
> -abort:
> -       bioset_exit(&mddev->io_clone_set);
> -exit_sync_set:
> -       bioset_exit(&mddev->sync_set);
> -exit_bio_set:
> -       bioset_exit(&mddev->bio_set);
>         return err;
>  }
>  EXPORT_SYMBOL_GPL(md_run);
> @@ -6784,10 +6785,6 @@ static void __md_stop(struct mddev *mddev)
>         mddev->private =3D NULL;
>         put_pers(pers);
>         clear_bit(MD_RECOVERY_FROZEN, &mddev->recovery);
> -
> -       bioset_exit(&mddev->bio_set);
> -       bioset_exit(&mddev->sync_set);
> -       bioset_exit(&mddev->io_clone_set);
>  }
>
>  void md_stop(struct mddev *mddev)
> --
> 2.39.2
>

Looks good to me.

Reviewed-by: Xiao Ni <xni@redhat.com>

