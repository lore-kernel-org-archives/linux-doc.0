Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E8F1E489
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298931; cv=none; b=amxdCoQ03JVxDshoOBiUnOSoNdRzJqmzbi/WUdAoGxwH6HkAvganajfAI7oCVltYAYal18Eo+lU52V7oa+jnD1zyNygrFFIriY6K8X7LwR/M57qu1xD9HGDebVHe2Ry3uCmuHOq1XKNs6G7L1nwcHQ3pJJXgPTdyyKR5G9ul5Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298931; c=relaxed/simple;
	bh=BEDoRg6ey4p+H93HmM+g9//xUXfjK/SSJ2MK7UJHSHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MucCAWnH7KTq1lExOse7xTTMINyVV0nTvF5vY4hAqAXjX3WfQRusrfDYa9U5C9g0u4dLq1dPg4J+/gj0Pr67hrNn4DTrxvBik1Rif9WAujdB+lgoF8jZ+JLnW1OZzt+APbKYU2kbKlvPp7KZRY6flC6AM85gG4NgEpI+5ThmEps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WOwoSuRT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WOwoSuRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754298929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkrRfjQYaOOOEfT/VLhNTKOF6Rg64aCH11W96IXXEYo=;
	b=WOwoSuRTJ40Gzw3r2zd/0v7oeANpScJaB5r5BralOuee5bKr+5FuFJlYDXXGU/+DnZRc55
	WlkTAyrMfNrmHEPD7v4VkWvzfFwFKQrR6bjalPAgYqDKQ7JHpX6+S2SPzSMbbhe7k6cTeD
	tNiZ2VtNCo9q62XufP+932hfMNI0Jqw=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-6hrCEIA8OJOqqcHZreztPg-1; Mon, 04 Aug 2025 05:15:27 -0400
X-MC-Unique: 6hrCEIA8OJOqqcHZreztPg-1
X-Mimecast-MFC-AGG-ID: 6hrCEIA8OJOqqcHZreztPg_1754298926
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-33231dba44bso22014661fa.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 02:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298926; x=1754903726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkrRfjQYaOOOEfT/VLhNTKOF6Rg64aCH11W96IXXEYo=;
        b=NtpDlK5rIbP7eqj8fkLJDIFdKy4mneodp5n9BxuCi4FHR2VEPsXToJWV2GuIT+CWpX
         hyVctvno5RdHaykj3NMOKotbaloxuAMosRoaL5EPf0jBmLY7LSFOsN+U+m2xPK88Mjqq
         3lb1VkidGxhZu1vbzLF6tOy7Yed9SZirxoR4GdKF9Xvpe3OlcudJF4dePBuMWZL69YP0
         SFwLqPJ+LkOhoJBrs1RCzxrPQwucwhsF75TSpCuFGuLZhcCRgw+WAaflDjESBVZ70+ar
         U2L2IPHoWmjl7qjA7cWG0IRcGPquq538xRtCLAIbpJVW1cHYo5slYqG7/M56wn7sho57
         l6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcUc7SKkdt7uepqmEM5ggozLv3hZI3jKIDT4TKlOwm8lxSkBUdQudXQrMpS8vhzT9LkzZdpai6kWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvyTg4jwYzsdj/vJRiUFVRkrj5CHneYY8hEJmgKo8p1kMP39te
	p1tw9f0Q7y8B/1kJi2wGiTH9v5NvysOvS/yrcXNziwm43ooE5JdZjt3eueI1mm5wjiPpar4UnXF
	0hJmchgEL8TaFl+NvzNlYvJRGBVpfLra1yj/eucu2YHZfgwB3j3lB812UvygmbpQsORko1cbfSN
	aZLkBYE8KwiSqsF0t81ha/K9lhDNGvHP01EwOG
X-Gm-Gg: ASbGncs3cy4i1oPoPRulfMwMIXEfyJR2yRFh3WvtO/E7OZdAqi0uEGc4eNxisWe61Ek
	0lPV2f7UxkHJSLjTeXm5dx/PaUdfdHBmje3dMKXDDKwLEs3jKcSqfks/pe53IA6bSZHd8ORZPkV
	MZNR7RpUyBVfxNnag/00eeVA==
X-Received: by 2002:a2e:a99f:0:b0:32b:585e:30bd with SMTP id 38308e7fff4ca-33256796299mr20549611fa.21.1754298926101;
        Mon, 04 Aug 2025 02:15:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7Zwzb8Bs3ToflSuXf+vDmP1MKwtiLfLZJfBga+fvkMIc6FE1GCmyPNIydhZ63d/5VOWgeN4D5RUceAM9Vz9c=
X-Received: by 2002:a2e:a99f:0:b0:32b:585e:30bd with SMTP id
 38308e7fff4ca-33256796299mr20549421fa.21.1754298925623; Mon, 04 Aug 2025
 02:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801070346.4127558-1-yukuai1@huaweicloud.com> <20250801070346.4127558-9-yukuai1@huaweicloud.com>
In-Reply-To: <20250801070346.4127558-9-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 4 Aug 2025 17:15:12 +0800
X-Gm-Features: Ac12FXyaMbAWff4USZHAGnpvA7aTVhdXKLgXXyJMJPJQzZPpqs3vokhbOz_BtZc
Message-ID: <CALTww2_jcDJf-55AEvK2fzf2PLnnOfBw5dG4bQG65B9eFw8Xmg@mail.gmail.com>
Subject: Re: [PATCH v5 08/11] md/md-bitmap: add a new method blocks_synced()
 in bitmap_operations
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, corbet@lwn.net, song@kernel.org, yukuai3@huawei.com, 
	agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, linan122@huawei.com, 
	hare@suse.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuai

I found one thing. The interface ->blocks_synced doesn't work in the
write io path. So there is a risk of data corruption. For example:

mdadm -CR /dev/md0 -l5 -n5 /dev/loop[0-4] --bitmap=3Dlockless (all bits
are unwritten because lazy initial recovery)
1. D1 D2 D3 D4 P1, a small write hits D2. rmw is 2 (need to read old
data of D2 and P1), rcw is 3 (need to read D1 D3 and D4).
2. D2 disk fails
3. read data from disk2. It needs to calculate the data from other
disks. But the result is not the real data which was written to D2

So ->blocks_synced needs to be checked in handle_stripe_dirtying.

Best Regards
Xiao

On Fri, Aug 1, 2025 at 3:11=E2=80=AFPM Yu Kuai <yukuai1@huaweicloud.com> wr=
ote:
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
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Xiao Ni <xni@redhat.com>
> Reviewed-by: Li Nan <linan122@huawei.com>
> ---
>  drivers/md/md-bitmap.h | 1 +
>  drivers/md/raid5.c     | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index 95453696c68e..5f41724cbcd8 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -90,6 +90,7 @@ struct bitmap_operations {
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
> index 5285e72341a2..2121f0ff5e30 100644
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

