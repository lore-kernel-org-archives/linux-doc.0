Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6ED35A92E
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 22:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769813607; cv=pass; b=S9ehiWhMNenmuAXEpAtbrD8EJZ5RhY2+xVJ940saVdRoyZxgvLBK6dARIDq9MwHJoL049luxW/wsnQkSh8AhIqhVZLDn2AB/N9vnX4kOnYfwGDpGJPBkAWcYLWRLbp8vywYohdl+jAI8yB7yqekp/OGPhi6qG/ueka8xV2COdo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769813607; c=relaxed/simple;
	bh=I6AA9LJQkjtH8pRVXBRtk0eb0kKxzR2imNiewT90hbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEMYNdwW7OiRJTGTqkO50zy5AKsII+DyiyWnndxvWj3bfWMevL+CQus/himdx+FZQvFh/4woMYtctewxT/0UZ2eATM/Q5rbjAuM2lwLyZc4hJPwAFe+1sVRD7wJ3fXZryQIHrZL9Wf0NE0/eOdJndInhfbli62YSla1s1gasP/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuX4Sh3x; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuX4Sh3x"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50143fe869fso28861831cf.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 14:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769813604; cv=none;
        d=google.com; s=arc-20240605;
        b=f2hCSjtVJwk+200mVS5sl8K5iCEMdmI116f8jBeuCApUYc/SsqmtTcZ9VVKvvMgYms
         y7j1qJVwPF+DuJGSzbMeGcu7uUdo/cZU3htW1k0bCPNqVwUmgniexip9J7GYphYUtxog
         KY1ndkBQ5YDbubd0/V+dJb/q+zliW4VBK4Zyp1aKCS1KDOJI9JRBK60EvRkarB8K8kza
         LBM9ZMX1zBbePywYFkAf/1Bulu22f2K5KnU382Q7vyUBOCFLINL3evSrdizKobkHl1m3
         igsfTLvUaLpYyOH1jFvusJOSeQvtJsr+yd16P6nRUcuqK0yKdmZmxebf8YZqiCGLSWF8
         F8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RvpDJGr4SwO80ntJbbklM7U7D7aCaEah0HNbCRkVHSs=;
        fh=OXTpm5W8/eusLsKY+o7+WAhNgumzyCfcwcTZtWjVMM8=;
        b=BgB1nKRbviI8x5xfRBZYr0GujwAuMubzSypJWDAWAXYO1EDh5c0XUIUSq9pIGpuJa6
         3l9pojTIbhfBf1SGAMIyN380sfJt6DJWgKTVVCLKgwttZQz4CpvA+pdZjAeN8xDqTXxX
         5dcyMSEBmqW6q1I52T72EyPMXdOcVX5IhxOKpzefkGAdvvHwZicThV3IjVXF8R+zYaXS
         V8YS9+dDZgMMhRS7bdmrprl+T6UsNAArDFio5zoAJjTKnPmTaVdwqQNtkyEPVNR62jDw
         Sx+/gTY7wvarWi/dnrIYYfcVqcssWItZ9Jh8LQD61v7UGuqv2relMdkAsDOCXjjD72tj
         3VBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769813604; x=1770418404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvpDJGr4SwO80ntJbbklM7U7D7aCaEah0HNbCRkVHSs=;
        b=FuX4Sh3xtBiDnHAg9EFEEZ2NvuXwTyuY5kH5yeju3QvvNNpRwES0yiHLoqFqYCEzM/
         erqkzG8/DUskaWzzQur0Z5aWpXSXuzDpNUpc9MsRR1GDIS9QKij2f8A3hPSiC/IkpuEw
         ltrMleIWg+zQSK8wVnGP5P4RVf1jv3GorwW9ObvyRVB1A80qEviOSF+GUDHIenpm5U+i
         PT3DhhATtxe6fYVpEf1U9qiN5Ckh26v87FKM4gybE412l43MPoKrsy7k6bUa3rjv2Abc
         5ToqgZmyRng2xg6qMNxdyjcWzow4ld3hwb1N6SfWwpclON182bdqNIfjaiy1lNmVXAG8
         J/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769813604; x=1770418404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RvpDJGr4SwO80ntJbbklM7U7D7aCaEah0HNbCRkVHSs=;
        b=OUCYvVvw2a4lAcyvSRyTOo0irqCtszva+j7p2tODkp45VE59IuhW4PrIYHi7TEGl2e
         AEt6QQQdT2d+Bh2py90s7txEXrW/lzv0K2ai+iRba9qRIWfLCLFDzeuhEBan/piqTOLS
         ny2BKzRtpHQIWawitsFT2EdVg3P5Z38Lc34hc9W/MMrvBmpQq0XkeQ+dxUbc0V0o8m5p
         uz40mwwUiUjmTYYOT+et5DPwSVFRRUxboLlMdvATQ7K+37f8wUoegQOaX5WUMii50K71
         Ky/NBcXasKo+c2qN+myolAtK8OH0MoH24ZhdNeQJiUEaSUqes9ScXv2Bv/sALQORbpsP
         TkwA==
X-Forwarded-Encrypted: i=1; AJvYcCUxxoVUl3pg8oQJw+agCm5ohMYK+Zuz6qRiHeWE7Zv1btK9/Xsl6L5HCZtVsqlWe+PW/e1WMD4MHGs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnsqecl02AU2A5DPqx97qSswUPajvIVlRzxfsxpWSk7Q5rGkDM
	gyi05r0nBwHtTlTlpGe5BqbwW+yBWqDVsQXZmIOVyt8dj1Srf1QfgxgUcxfu+T6RtMYvjO0NMWH
	5tGvy3gK+ZUwZZLlsHioFL1pHiW2sG7U=
X-Gm-Gg: AZuq6aKgWP9MBbKEj5viRGmiGncNAJ+BRG+WfgZ/xuuLN2Dwhl1oepkr6fMOV39tCVV
	2cSmxx1MytgsoJcnLjJPKYwPudFeK0igDnFmZ/SCjd6cZI5iQN3nkl4DEqyutDO6atjfs5E2Yyz
	ZkDerUGUt0jTaDNp2znqTCScTgC4Z3yEgz7t7xe3pyWdFRfXIAL4HV5R314y1uXpMSvVsYAnMg+
	6MM/vDAGEBeISIUHFI8MTm4nfBmUp8INXLAFZc+YJ0laYGJsd2CLP//zfjWoLr5dkfYew==
X-Received: by 2002:ac8:5ac1:0:b0:502:9f71:6458 with SMTP id
 d75a77b69052e-505d223e5afmr53898871cf.44.1769813604047; Fri, 30 Jan 2026
 14:53:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118223516.92753-1-john@jagalactic.com> <0100019bd33f2761-af1fb233-73d0-4b99-a0c0-d239266aec91-000000@email.amazonses.com>
 <0100019bd33fb644-94215a33-24d2-4474-b9eb-ddae39b29bd8-000000@email.amazonses.com>
In-Reply-To: <0100019bd33fb644-94215a33-24d2-4474-b9eb-ddae39b29bd8-000000@email.amazonses.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 30 Jan 2026 14:53:13 -0800
X-Gm-Features: AZwV_QgH1KMH2vlFTNGo85feW4dv-AHS4Ad-yDU5HTglx7x3SJ0Y27UEufrkPHc
Message-ID: <CAJnrk1Z9BuCLZv576Ro9iYUPRDpW=1euG0rQ2wC_19sBcR18pw@mail.gmail.com>
Subject: Re: [PATCH V7 1/3] fuse_kernel.h: bring up to baseline 6.19
To: John Groves <john@jagalactic.com>
Cc: John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	John Groves <jgroves@fastmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 2:35=E2=80=AFPM John Groves <john@jagalactic.com> w=
rote:
>
> From: John Groves <john@groves.net>
>
> This is copied from include/uapi/linux/fuse.h in 6.19 with no changes.
>
> Signed-off-by: John Groves <john@groves.net>

This LGTM. We could probably just merge this in already.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

> ---
>  include/fuse_kernel.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/include/fuse_kernel.h b/include/fuse_kernel.h
> index 94621f6..c13e1f9 100644
> --- a/include/fuse_kernel.h
> +++ b/include/fuse_kernel.h
> @@ -239,6 +239,7 @@
>   *  7.45
>   *  - add FUSE_COPY_FILE_RANGE_64
>   *  - add struct fuse_copy_file_range_out
> + *  - add FUSE_NOTIFY_PRUNE
>   */
>
>  #ifndef _LINUX_FUSE_H
> @@ -680,7 +681,7 @@ enum fuse_notify_code {
>         FUSE_NOTIFY_DELETE =3D 6,
>         FUSE_NOTIFY_RESEND =3D 7,
>         FUSE_NOTIFY_INC_EPOCH =3D 8,
> -       FUSE_NOTIFY_CODE_MAX,
> +       FUSE_NOTIFY_PRUNE =3D 9,
>  };
>
>  /* The read buffer is required to be at least 8k, but may be much larger=
 */
> @@ -1119,6 +1120,12 @@ struct fuse_notify_retrieve_in {
>         uint64_t        dummy4;
>  };
>
> +struct fuse_notify_prune_out {
> +       uint32_t        count;
> +       uint32_t        padding;
> +       uint64_t        spare;
> +};
> +
>  struct fuse_backing_map {
>         int32_t         fd;
>         uint32_t        flags;
> @@ -1131,6 +1138,7 @@ struct fuse_backing_map {
>  #define FUSE_DEV_IOC_BACKING_OPEN      _IOW(FUSE_DEV_IOC_MAGIC, 1, \
>                                              struct fuse_backing_map)
>  #define FUSE_DEV_IOC_BACKING_CLOSE     _IOW(FUSE_DEV_IOC_MAGIC, 2, uint3=
2_t)
> +#define FUSE_DEV_IOC_SYNC_INIT         _IO(FUSE_DEV_IOC_MAGIC, 3)
>
>  struct fuse_lseek_in {
>         uint64_t        fh;
> --
> 2.52.0
>
