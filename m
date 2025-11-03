Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE898488
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762129646; cv=none; b=Sa8CuiONarBoDh9bxwv5QSLNiwKI43eBQFrs2GKe+IWJMQVuk+0Ybs4anse/P6RjMRMQsXXHjFQrxwjaV7NUfObENIJSY+ZWPpdM7kMyhirX14/zu49l06WTGWNYNlje5WiLn2QBUcXXISCF7ZAzl7LOKyAAdUBuLzkqcGsVUOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762129646; c=relaxed/simple;
	bh=8g9x8QH1x4ffbmi5EFK3Nczs+pWe9XWd+V1E0ScetUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YugNvxNXDJMnxuOJsPxDRo7xj8T/h1miJcvnnrIP3p3H5o+afgCeJdUTxuSE7SAnsBSM0IQHvZcju69sjJxb38UmwLavQ3PrWlO3YF9XmPVViKCH3yeXQjbhqUyIKz8msJCH8grJJUB3fyBIARoC0j54vZlk7TNSWonGGejV0vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AagooAft; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vzfv6dPc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AagooAft";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vzfv6dPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762129643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhN0fR0yEMJ11xlBRy3sHA6iY8FKJIup/YalqEMEfzg=;
	b=AagooAft58Yj5ybYqhvp1ix1dTo4I+xBBecvSxX7Dp5QbZ1eND/yefchreHsI3Yrt3Vap3
	9jmlBkdKoTm9AKdpHpK6r0+nVM1EUGoMmga73314oKLJ3sJJHHbiH83z87CObWvSWzp7Ja
	LjMQny48DxeejG8gXjgw/m/M7G8hVxg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-nxAugeCwNZiJ4q7HtnfMCw-1; Sun, 02 Nov 2025 19:27:22 -0500
X-MC-Unique: nxAugeCwNZiJ4q7HtnfMCw-1
X-Mimecast-MFC-AGG-ID: nxAugeCwNZiJ4q7HtnfMCw_1762129641
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-594269af95fso284821e87.3
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 16:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762129640; x=1762734440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhN0fR0yEMJ11xlBRy3sHA6iY8FKJIup/YalqEMEfzg=;
        b=Vzfv6dPckT7OJo4X5vy2Qc8n7DvJcJ3hnhgsXT4xGZ3p8u/s75Rq+q7tXQ6wQjPh7a
         OJEpJ9GR8VM1te8TX9v34s4Q0wq7DayGcmVPNspTBEb+AjJDWB8qEF/5q470wTrPSXR6
         Au2CqErLUZA3zr9Ud0Objeghht6ECMMsPIlgYJXU9Kwq1F5OkJZGEUIw9j3ULFbin4qs
         rXWNRO+Y+NrSBIuKHxy5jzp3ElmTfXNouNddRbeQAnHO+MYjfi+0PGh/73ppMFh9XF/P
         RLVNwQediXaSHMcuj8R0KW4m2JyGFuxG7JgcsJe6JrA8uJ0LTuRkuaEOYKtpEXIEjVMq
         Nehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762129640; x=1762734440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhN0fR0yEMJ11xlBRy3sHA6iY8FKJIup/YalqEMEfzg=;
        b=YJrL5k+ZoYAg6t41a6uhHbHLQowTFcQpttf4Rlbwci5Yqk3Ba3Xknjq8whB0hYSzbB
         TCJWz2+qaPfZaE84yDSlEX5vsuSZVZZF7dlZyu9dvEx/bziiskdHVlI8qYgNGTRxIUU9
         J8ip00BVvQHxDUa3V2Zqm4hK1fad/bIem6BZicHWTs31eAMxvOFt9aN9Cc7fPgaDzbLv
         X3E8P6HZ11hdnc3gX7H86YHtwUHXAHAshtM43IOKzqZ7bBaEhvA/n1lepddWFa5WO0TD
         If3cxJlCyfIjQ63uJUtq4EdrDPAoMVEFgB7XjkIbcvC3xCHL1TWUO/qfQlhZRdSNxs6y
         Luhg==
X-Forwarded-Encrypted: i=1; AJvYcCWV4SEzEdC7CF4As4kMa0Eo1EK9pA/TPfbkmGejKwzMJmbnJNPQhJQd/Q4DnQZaFWArB8UrbhzBOLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuTE41t8Y6DL3Adon5Z35E32KK85wIEzSKIa0LOnWlUAsxzlIB
	yvRrP57l/6RjOjGa2ybZaxzeXP0yWIJ14RLDqveBB1hmAR4G4hZADpO4JmSoofGqN5cFgnu1CAQ
	j4sLXtYfKgU7k95q6Fb5C9dYwnNt/x7jK3RsV41N4eW8ju5IiyXS1EIPyedVREW9Yvp7Q3DCIe7
	58SDonRfihjQBt1Kwf87KrNcejKM8d5U+NDKvR
X-Gm-Gg: ASbGncuM7KB/2Flx/bz9gSAm4cdbhoocqajkeBOFj8xMkHoQZeOqItgaKbGfq0GcMZc
	ykgIiqCy8Kfu9jgUU1v5h4d4JgI66pd6tz4Ke/XK7nhhXOhQ4I2rhHeaLknv3GbhCqxrbBFVX1S
	QgnrtINVATDDMx6LVF5ZnptY6HCUNMhLWD6JoEokSKK5po/72riN98lSIW
X-Received: by 2002:ac2:4e0a:0:b0:594:2e9b:f28f with SMTP id 2adb3069b0e04-5942e9bf55dmr132747e87.7.1762129640408;
        Sun, 02 Nov 2025 16:27:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw5YCNtN60wEBZeO0yilPOmGlUKgm3n8yeSZujSQ3OwjSmQaTNhz43TSHckHIRzh9qcPYr44zOZEcpd+tMCvk=
X-Received: by 2002:ac2:4e0a:0:b0:594:2e9b:f28f with SMTP id
 2adb3069b0e04-5942e9bf55dmr132741e87.7.1762129639985; Sun, 02 Nov 2025
 16:27:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030062807.1515356-1-linan666@huaweicloud.com> <20251030062807.1515356-2-linan666@huaweicloud.com>
In-Reply-To: <20251030062807.1515356-2-linan666@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 3 Nov 2025 08:27:08 +0800
X-Gm-Features: AWmQ_bkZW4sQnzxqwLMdGXcS_bsxTNcHL9wvjnN2nS8I6-ARO9HgfsZ0OaYPOVM
Message-ID: <CALTww28FMQFKHOJ3jnbC-FyxusfF3bvRZEgBz_TCvJM4e-OoEQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] md: delete md_redundancy_group when array is
 becoming inactive
To: linan666@huaweicloud.com
Cc: corbet@lwn.net, song@kernel.org, yukuai@fnnas.com, linan122@huawei.com, 
	hare@suse.de, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yangerkun@huawei.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 2:36=E2=80=AFPM <linan666@huaweicloud.com> wrote:
>
> From: Li Nan <linan122@huawei.com>
>
> 'md_redundancy_group' are created in md_run() and deleted in del_gendisk(=
),
> but these are not paired. Writing inactive/active to sysfs array_state ca=
n
> trigger md_run() multiple times without del_gendisk(), leading to
> duplicate creation as below:
>
>  sysfs: cannot create duplicate filename '/devices/virtual/block/md0/md/s=
ync_action'
>  Call Trace:
>   dump_stack_lvl+0x9f/0x120
>   dump_stack+0x14/0x20
>   sysfs_warn_dup+0x96/0xc0
>   sysfs_add_file_mode_ns+0x19c/0x1b0
>   internal_create_group+0x213/0x830
>   sysfs_create_group+0x17/0x20
>   md_run+0x856/0xe60
>   ? __x64_sys_openat+0x23/0x30
>   do_md_run+0x26/0x1d0
>   array_state_store+0x559/0x760
>   md_attr_store+0xc9/0x1e0
>   sysfs_kf_write+0x6f/0xa0
>   kernfs_fop_write_iter+0x141/0x2a0
>   vfs_write+0x1fc/0x5a0
>   ksys_write+0x79/0x180
>   __x64_sys_write+0x1d/0x30
>   x64_sys_call+0x2818/0x2880
>   do_syscall_64+0xa9/0x580
>   entry_SYSCALL_64_after_hwframe+0x4b/0x53
>  md: cannot register extra attributes for md0
>
> Creation of it depends on 'pers', its lifecycle cannot be aligned with
> gendisk. So fix this issue by triggering 'md_redundancy_group' deletion
> when the array is becoming inactive.
>
> Fixes: 790abe4d77af ("md: remove/add redundancy group only in level chang=
e")
> Signed-off-by: Li Nan <linan122@huawei.com>
> ---
>  drivers/md/md.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index fa13eb02874e..f6fd55a1637b 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -6878,6 +6878,10 @@ static int do_md_stop(struct mddev *mddev, int mod=
e)
>                 if (!md_is_rdwr(mddev))
>                         set_disk_ro(disk, 0);
>
> +               if (mode =3D=3D 2 && mddev->pers->sync_request &&
> +                   mddev->to_remove =3D=3D NULL)
> +                       mddev->to_remove =3D &md_redundancy_group;
> +
>                 __md_stop_writes(mddev);
>                 __md_stop(mddev);
>
> --
> 2.39.2
>

Looks good to me.
Reviewed-by: Xiao Ni <xni@redhat.com>

