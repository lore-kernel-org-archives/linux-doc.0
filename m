Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEE472614
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 01:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762220883; cv=none; b=T3QB8f2IUwc9zRnidHq9px6F+/BUYag0c4yNB25ECv9NrlRJNEZH+EH19qODKLayo9/+8mqqZxSBuBfY8C7jDEeI2MWtKuP3YryXOUj3V9uSxo82GjZIsQWvYAcxm5Mv2sYnJ2KCx7feGZ7rfm0E9PTNt6PjoBGsy+MPcj8GVMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762220883; c=relaxed/simple;
	bh=fSdA0L8Nm0YCwS16VUPzW3Aq3gD381+XRBN41NLXEX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxKDqdqawA3htOAofV9ziYH/DK4ZZX4i+UquXXkM//ZKeHYhDMLOM4veDeB9/wLe2awkoyXEkIpPnmFlFG0O66JfGkmcUL3NrUjNasgFoms2cs3LL7FJbnNvNK6iK18x8Ag+tgnx09zxttcGkVDStcYhE1cVKtY25eFfbIdweX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5aonBUf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=trspT5Zl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5aonBUf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="trspT5Zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762220880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsXwYGK1x1byPj06v8OW9bm66Zb85lZTaaKe7v0rKBA=;
	b=D5aonBUfqMZU8YSXnnYNP5YqzwF5bN8ZavWWEHfk9bOD77JXWPz2A/H9tNoiNkWiHAcoW+
	2H7AuFq7DN7FXSLdVNjihz7eC1W+M+r/giixRNOg1cNKR0uojzGKEg/4ZXoexbeBQ8zvRd
	usyp8ZW8ymbBNyRyHFmxQ0tvpMOapCU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-wFtDjD2wM42lXdKEOHJBFw-1; Mon, 03 Nov 2025 20:47:59 -0500
X-MC-Unique: wFtDjD2wM42lXdKEOHJBFw-1
X-Mimecast-MFC-AGG-ID: wFtDjD2wM42lXdKEOHJBFw_1762220878
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-594296f4b23so1078767e87.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 17:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762220877; x=1762825677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsXwYGK1x1byPj06v8OW9bm66Zb85lZTaaKe7v0rKBA=;
        b=trspT5ZlNBdAIQC/2orO/aYr8asqK8FPRoQ1G5hJ8lu8hy94oy9bbBdJXfuAe1FLzO
         uEMr4WB9btdusS+3L8OG1NzauT6vJrJ1vcPKV9tNUePNp4ZmT1lp/RuqFv3K2qTfn/6O
         rilcB4j7vlWXiBcMxIPRzAE4l1khfnT3go3nmktoVGh9rl7g94D6gToAci4OrDz9/EcE
         HSIclXG84Z6p+dYcjGJKu588YVPloRD7fd4O/noPfdPScLw97NhGkgft1hsmj7JDS6tj
         Dl2vBK/SUy2KA4Hn9Lirvgqbe8vQV6KXO0Qrkbg79o/JFEdCseQPLdno7HEa4qaUOcU9
         3tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762220877; x=1762825677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsXwYGK1x1byPj06v8OW9bm66Zb85lZTaaKe7v0rKBA=;
        b=YmfPVAJbKXX3TWRXIs/zgODukE66QSLbBFT8XayDpRN709EZJuE3IM5H5HK75x5kMM
         dS93ncyYT4fdCxi1Ec68IeOF0wDHHEo0OEMa4gsvne0bcA/lnGK1cltUFDJA+KxMpOqm
         mkedkNpsXzDiPOCD4n+LFgLczc6OwhGidiBWQO+I1lvtwbr4zjWgIr7WV9Hg0u5Ym6ko
         dzauVMwk7EIdRHpKjUByVRmX/PmbhP5I9kMyyTEsvIZwX4t3MC9AyNqlDifGz/ozlF4O
         HyUAJnRh+NpPCFxzcL+gKQyTE/SyYWiW81DrdsiFqGd1lZKSk/gjOSt9Vm0SSd9ofds6
         5iSg==
X-Forwarded-Encrypted: i=1; AJvYcCUg57L3j+3sQLL35ZuHbqo7J3X+YK985T+A9x9ySe9DqgBu7/pSdFhI1x2EkCeSontEhUEgOEISdyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTXaEg0icg408pSvxzloElSyJMOvNDvS4jdS1LLgatpXWARWf6
	1dhAprc55cos8BCGkvgv3jxO1EuEENv+5a87wuLwd276xRs4x4IKqoZTt6pKSgRbs2KYQphHC/f
	7LYhmS/nJKlzFJ/8AnmUMjDte4JOlL5VWaPIcNJ8H2eUk4/L8OtdtSHJphrb0q/mE2QBT5RBrCX
	Ahz0oRwSEjHnXrMRzfXWbMePwqsbvde5j59cuu
X-Gm-Gg: ASbGncu4oB1oYN1dyA88cxZQ2850oSPfesrO9m6xSjatVEYNVfpxPr5MnzMQXejIuno
	L1zJCqiy/AhjxGI8Jy7AV8DNpG8lJrLpDut4tx9cjy+Rwi2tz2fdTt7xm1QGe745E7EYGUipNPC
	XNI0L4fp/N4L93m0pi8vQgGQ6z/Mj8tEtlOEyh946KNAOKUn5C5AB8C7Vx
X-Received: by 2002:ac2:4e06:0:b0:594:2f72:2f8e with SMTP id 2adb3069b0e04-5942f723446mr1343699e87.10.1762220877384;
        Mon, 03 Nov 2025 17:47:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa2QAcOx2jbiaR7JKF3K5bdYSVRtB/YvBQpCC8cf4XQDFWQEH7U+c+L3BD/FhyG3c+WA30SnGgfwMNQxzZnKY=
X-Received: by 2002:ac2:4e06:0:b0:594:2f72:2f8e with SMTP id
 2adb3069b0e04-5942f723446mr1343693e87.10.1762220876921; Mon, 03 Nov 2025
 17:47:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103125757.1405796-1-linan666@huaweicloud.com> <20251103125757.1405796-5-linan666@huaweicloud.com>
In-Reply-To: <20251103125757.1405796-5-linan666@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Tue, 4 Nov 2025 09:47:45 +0800
X-Gm-Features: AWmQ_bnPKBTjG4KT60HiXK62t6RM-uEzUUaIJ9bAKjC9tyeQ8C-26fjcFNkMFHU
Message-ID: <CALTww29-7U=o=RzS=pfo-zqLYY_O2o+PXw-8PLXqFRf=wdthvQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] md: add check_new_feature module parameter
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
> Raid checks if pad3 is zero when loading superblock from disk. Arrays
> created with new features may fail to assemble on old kernels as pad3
> is used.
>
> Add module parameter check_new_feature to bypass this check.
>
> Signed-off-by: Li Nan <linan122@huawei.com>
> ---
>  drivers/md/md.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index dffc6a482181..5921fb245bfa 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -339,6 +339,7 @@ static int start_readonly;
>   */
>  static bool create_on_open =3D true;
>  static bool legacy_async_del_gendisk =3D true;
> +static bool check_new_feature =3D true;
>
>  /*
>   * We have a system wide 'event count' that is incremented
> @@ -1850,9 +1851,13 @@ static int super_1_load(struct md_rdev *rdev, stru=
ct md_rdev *refdev, int minor_
>         }
>         if (sb->pad0 ||
>             sb->pad3[0] ||
> -           memcmp(sb->pad3, sb->pad3+1, sizeof(sb->pad3) - sizeof(sb->pa=
d3[1])))
> -               /* Some padding is non-zero, might be a new feature */
> -               return -EINVAL;
> +           memcmp(sb->pad3, sb->pad3+1, sizeof(sb->pad3) - sizeof(sb->pa=
d3[1]))) {
> +               pr_warn("Some padding is non-zero on %pg, might be a new =
feature\n",
> +                       rdev->bdev);
> +               if (check_new_feature)
> +                       return -EINVAL;
> +               pr_warn("check_new_feature is disabled, data corruption p=
ossible\n");
> +       }
>
>         rdev->preferred_minor =3D 0xffff;
>         rdev->data_offset =3D le64_to_cpu(sb->data_offset);
> @@ -10704,6 +10709,7 @@ module_param(start_dirty_degraded, int, S_IRUGO|S=
_IWUSR);
>  module_param_call(new_array, add_named_array, NULL, NULL, S_IWUSR);
>  module_param(create_on_open, bool, S_IRUSR|S_IWUSR);
>  module_param(legacy_async_del_gendisk, bool, 0600);
> +module_param(check_new_feature, bool, 0600);
>
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("MD RAID framework");
> --
> 2.39.2
>

Hi

Thanks for finding this problem in time. The default of this kernel
module is true. I don't think people can check new kernel modules
after updating to a new kernel. They will find the array can't
assemble and report bugs. You already use pad3, is it good to remove
the check about pad3 directly here?

By the way, have you run the regression tests?

Regards
Xiao

