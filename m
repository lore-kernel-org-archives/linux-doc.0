Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171652264C0
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769550960; cv=pass; b=fTNLfManwX/TEF5yzQJG9ZVyjfQVYL5AnWAS53SvEemvH5Ys/if/KsnwWVaAYB93RRFvIfYtKpIo3KofGSs+pTV8TR79x9agN81z8a/Zr7NzAoBdjfMp3+xSybEsgqwS8X3491SxPPL7jczr3ewBVAGaPbbeAgCjH4acIYPCsfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769550960; c=relaxed/simple;
	bh=8m6SHPVdIWrcyh2aRGiyHcnuhF1GhzjV4UbqBqvwtjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUVZD1ooIbjSHqqbLJDEnfaCecnGEG9BrDsY4Lza6Ipcj/4bqdAAU6qqct/wZIgBHMDQ+CMAMSBS3Ev9UZe2906k8qW5daGSbD4geUVcAIKSdzOU7osOV3LieWSpYW6sGpTqnHAyO1QAw2jgDLoaudoTgT7GkZGvtl75BY0sGAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ix+lNivl; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ix+lNivl"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5018ec2ae21so68532001cf.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 13:55:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769550957; cv=none;
        d=google.com; s=arc-20240605;
        b=GAtbAGEywF9HC9rHQg5QqQO7CQbSa1ALzHS+f403NerTcjFohxU9bFCNizWdJ2j0Mb
         o1OBtwFWN85fMVLGsrUJKOg3F/BXcnSG3GtdO6PTwfEttWfhTmrewjW0q76nvhEwUAzi
         0mwkMZCmQl+l+eKTtLwAZDCHDIun7r3+enpabpqADq4Dc0ygmcYVkC7ub6XzXqIlE+hH
         mKFXXGeC5GijpQrbrGBvav22hKmBqNogCV/kfyIoFZm2+0olP2bMMO7JxxYrxz/Shufn
         lQHyiGY+4t700CDXebEBgXy0mIS6s1sr9qK1TfnxhN/ZNfJ+GOK3YCGtxSSV1cjUjgYF
         6IvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NKlFs0mQTNIoeYHTCe8czttQkA2EuwhIv5BND87JXOY=;
        fh=DDgS7+pmn69paRSpbLVeZs36msjefayz4fOH7AukNng=;
        b=KvDYsxBh5y3UdOeWzpbgd6gntYhK01Wre/Ma6PrQCGMKFcBL/0gYhSp7BuyxlirXeX
         B4rBZnrbjUVs/kZA0kau1PibfWMfS6HNozc2Q0X49bNr3YpnjiavQ/ACjeltU83TAij+
         3zEj45REewyd33vDYgB0M660iwBdp6BlvTvOJCV9mh/6H44gBXwN6WEwx1FN0+Jrjgjc
         ZpqVo//hpuLv4i0iefiKJ0yJ0NWXevvjvrGQ5EKOAcu12Zho/ngRDU3Rmde8o25wBejt
         JHXf5K0rISnYVDYN1kuYZztWzArG31dgsvfrVcMLQdW2aRJI40D2vBngtWIcMJ19HgiN
         Cv6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769550957; x=1770155757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKlFs0mQTNIoeYHTCe8czttQkA2EuwhIv5BND87JXOY=;
        b=ix+lNivlr3lyDXAuHr9H0DGq1g3Qt/dJxnKBg+40FddaJGs4dWOKK1/OlODc5ZqYJB
         k/ni//D0zoZGihJmfE+OX2T7mPfdv8jwxYW/VuqzpghxwH8urb2UoF20+fifIFcnFlwY
         dYRuDywReXrDcVEvYRbCm2IV6r87jPb/zga/nbF/Yz5Cj/iI0w6glXt5qSUghAwy45RP
         R6HDS0B3lCT8fI7owiMBkmYuZ2Fl8ik7lOtC3mdng4Eb86bEKOs67t+8aI6e17wJ9Ncl
         lahXUPAgkUh6615b/DYUpz+XK98/Mov5xF8DGilVRD+KnhRdF+FCuLPS69nm+6mg4xaP
         h2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769550957; x=1770155757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NKlFs0mQTNIoeYHTCe8czttQkA2EuwhIv5BND87JXOY=;
        b=YYiWD4lbEDosNDba2c7csmhhZUmAIbPzvRJLHFPU7XiqsclbbChqw21Gwx6BUUyO+v
         j4ZFX4+EuvSdpqR8q90y+VfEwXFastCQwGbzdU1TtD/w0PAFFHsIclQp8wMhsvrs20Dp
         xDMZIO7IRvH65GabO0BpxZAZ3y90LU/EWYW3EYgHqAO25XqpoglpTKRpcaHcgN/gHsx2
         xt/ZbJ8i8sfUaRPrC5nCpyMr+3kHmqndyxQjysjKHnJS09QTtqvKy0EEvv0YxBrlTsm7
         QZsGsPed4jSbs2e2PL6ysLqw2CNlfmOuHog98S9qLaMyTpX6t3q317VWXPPmcadenPC3
         +cjg==
X-Forwarded-Encrypted: i=1; AJvYcCUdIARj4VRFECG7mSAXEWNb4p88HNCKoNpZdHSPYCmmPuterAx2b6dMkJ8C/77YQ7ulPsDLp5bvTfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjPas5GRcUESZ735Nw39/RPvJ5oSb9MchL0LFCsan9nUYgq+JR
	1joNt0pAc3qNikk972Vow/FFQC1dmoUAW5/rwXBdfDZv99Srboae/SBnOOa6MiF/mxXB3zILWxo
	Uy+Nl+Aq5Sic2uILs9JW089fM0Y9waro=
X-Gm-Gg: AZuq6aLOM2Q/O+3sQfXMUUbn9wqp4Om7DJvhJbP1nwLdQC3GFJZ8CkEETc4UshK/o9M
	2MQDDDz2T0ZHkJpVFDS9a4qf4ZpdsHDq6JH/eS/u5ekovVQo3EgWFGmr4F3b5J+gWBbJzLtDB0x
	9cUA612BB9qyzrfWcZjNg4peyhA1Enlc/ofDC1z+VHA0nl2gBwKXHL0Adq2290i+BW2gGZTOHX0
	yTWiiFeCCGZQhiwTmv9hyGrLn8fWnYBV5C0RnNBrr9XOAqq3w5jpV/HLW5K9Xfo4WL+Iw==
X-Received: by 2002:a05:622a:311:b0:4ed:a6b0:5c39 with SMTP id
 d75a77b69052e-5032fc1341emr35550071cf.63.1769550956926; Tue, 27 Jan 2026
 13:55:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116125831.953.compound@groves.net> <20260116185911.1005-10-john@jagalactic.com>
 <20260116185911.1005-1-john@jagalactic.com> <0100019bc831c807-bc90f4c0-d112-4c14-be08-d16839a7bcb6-000000@email.amazonses.com>
In-Reply-To: <0100019bc831c807-bc90f4c0-d112-4c14-be08-d16839a7bcb6-000000@email.amazonses.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 27 Jan 2026 13:55:44 -0800
X-Gm-Features: AZwV_QhPL9Sj6DMGNjDww4OFl9nGLOsm6aFs6t6n1KrqwkFwyhPAYsBkmAeTikQ
Message-ID: <CAJnrk1bvomN7_MZOO8hwf85qLztZys4LfCjfcs_ZUq8+YBk5Wg@mail.gmail.com>
Subject: Re: [PATCH V5 09/19] famfs_fuse: magic.h: Add famfs magic numbers
To: john@jagalactic.com
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

On Fri, Jan 16, 2026 at 11:52=E2=80=AFAM John Groves <john@jagalactic.com> =
wrote:
>
> From: John Groves <john@groves.net>
>
> Famfs distinguishes between its on-media and in-memory superblocks. This
> reserves the numbers, but they are only used by the user space
> components of famfs.
>
> Signed-off-by: John Groves <john@groves.net>
> ---
>  include/uapi/linux/magic.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> index 638ca21b7a90..712b097bf2a5 100644
> --- a/include/uapi/linux/magic.h
> +++ b/include/uapi/linux/magic.h
> @@ -38,6 +38,8 @@
>  #define OVERLAYFS_SUPER_MAGIC  0x794c7630
>  #define FUSE_SUPER_MAGIC       0x65735546
>  #define BCACHEFS_SUPER_MAGIC   0xca451a4e
> +#define FAMFS_SUPER_MAGIC      0x87b282ff
> +#define FAMFS_STATFS_MAGIC      0x87b282fd

Could you explain why this needs to be added to uapi? If they are used
only by userspace, does it make more sense for these constants to live
in the userspace code instead?

Thanks,
Joanne

>
>  #define MINIX_SUPER_MAGIC      0x137F          /* minix v1 fs, 14 char n=
ames */
>  #define MINIX_SUPER_MAGIC2     0x138F          /* minix v1 fs, 30 char n=
ames */
> --
> 2.52.0
>
>
