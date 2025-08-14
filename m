Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4285305E35
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 13:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178601; cv=none; b=D+aSNLpAgOAQUMtTkPz1y3gW/N5N9xiJKMtMmvx5TrBh1zbTOks8eFVtHJ8HJvnMp40o8nuKkmbQanmkN6h7Qjlq1TseTEPBg3o92a7XMe6hD/X9dT53RX5EdNpZlahydaQXbYpU0L+z5CacGLH3Hih5azDDZ3qRN4k1Zh1lD4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178601; c=relaxed/simple;
	bh=5pu5CCcwVsrYR5S/WgA6wkxRR40hQbEFvk1WFQLNauI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4HpgLQtDuGlqcUZ8gr3xYOA7PoTXNHR+4AkCLaU8j2Gscm5A54CkzdjqERlKM7hIm0CzL656sp3tl+RPddZZvxxxzBUOXXIPgAgLgAA+/dwseSWiAH7hgz00T/Mfg44lyBlRYNmfn4jLtRtz8hXIAKjiInV5UcTmG377utIMd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=SBjsbhDy; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="SBjsbhDy"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b109bd3f9fso12376301cf.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1755178599; x=1755783399; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xiJ+voUm58mOt9ANl6l8BPcmKr+2Gr+D+s+NWbUh7rs=;
        b=SBjsbhDy5LLiWWwzXacdGJQ4Hp/Zf7tp9IRatLTbuO9IWQRQ0hpsacd64hUsDJ/pRx
         m329H7MHaTDl8QgecfN0tW1BXuAtJaL1kgj77NNERPrd5uIwqAFp3DNhVmFir3WDPnGy
         81q1DeQwetE3l+O+0dGR5KayoTZjdCCnzE6m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755178599; x=1755783399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiJ+voUm58mOt9ANl6l8BPcmKr+2Gr+D+s+NWbUh7rs=;
        b=TLvz+rp2GHFftjYJvpkXKhCjACsYx/2ig5SfhxKKMvAoU0HG6TN3HNrXT7qvpkSJMw
         tDkXGA0U9Dx/K23UWFxmZu2WywvYHHWI4YDAq/gVyqPuvgG1JuOOR4zt7pwfwETSXaM7
         00NF1xR00ufIVgzxA8eNX0Gj93tnzScv11093a5P9Fl7RcJ2vb7nnKwTFVBxWYrsOchi
         my/b3OhXZhtVyjvLkMfWe060HtsWbkAmItTyIbkVhlSdhLp6BFUraz62+asMbR7zKmM6
         H+I4Xg+U9+3qtHwTsqQHrL1bFN6c6JU0JIdPeIBhoNeV3kO8zXctJNnBkWP7h+Muvst3
         kGoA==
X-Forwarded-Encrypted: i=1; AJvYcCUeUu8mPhVAQHGLS89VcYLngIXiBVU8y2vL9utTGhDiEif8ugVHQSqK+9jmfUBeKLU4t/izKk+Ol90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/2R3TErG0HHskJOmPWt75w10lUBiM/TKvzm//cHed71TCqJj
	O91E+7gbUrainkoEbbJh4qxKOibJ4Qh/XE6FUbK84GrOZWZIRCfv2qxN1gdo/Jc6qAhFHFOlnG5
	Vwle7OaA5SuFroOUmqEcoLD1R5rOZa6fT37DOEo7rbg==
X-Gm-Gg: ASbGncsAMo5Dzr2kCk1thf1p6MgLomg2iCdF08F+lrVRaFIrzt6lSjTZ27sS0Y/gz8k
	s8slGu5RKmEFdvWyzabSegEx/4oy9zrBN5xxuZhjl1R4eP5RJME0LMVZwa6XKY57jbaF5QF4Kyp
	gX54MXRMRkOQwLgd2Q29kEwEKkT1dB8W66PJMiGKH8fOFV0Rj6Ua2EcmgEQmK5S4bSwPk+/V6GJ
	TER
X-Google-Smtp-Source: AGHT+IGRLUNSdSZic/AfvkGEhcJ0i0UexRhcMwBfu+hTgWYJPH7NmUnalP/saR/GroY1O9C7uFRCx1HrQwBXZpKp4dE=
X-Received: by 2002:ac8:590b:0:b0:4b0:7e22:36bd with SMTP id
 d75a77b69052e-4b10a97a743mr43862441cf.23.1755178598536; Thu, 14 Aug 2025
 06:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703185032.46568-1-john@groves.net> <20250703185032.46568-13-john@groves.net>
In-Reply-To: <20250703185032.46568-13-john@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 14 Aug 2025 15:36:26 +0200
X-Gm-Features: Ac12FXz5KYhharzGRoAiyFuPvtQSxT3MxOHi7MhrKR_P4gCMelGIrgjr1IHTKO4
Message-ID: <CAJfpegv6wHOniQE6dgGymq4h1430oc2EyV3OQ2S9DqA20nZZUQ@mail.gmail.com>
Subject: Re: [RFC V2 12/18] famfs_fuse: Plumb the GET_FMAP message/response
To: John Groves <John@groves.net>
Cc: Dan Williams <dan.j.williams@intel.com>, Miklos Szeredi <miklos@szeredb.hu>, 
	Bernd Schubert <bschubert@ddn.com>, John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 20:54, John Groves <John@groves.net> wrote:
>
> Upon completion of an OPEN, if we're in famfs-mode we do a GET_FMAP to
> retrieve and cache up the file-to-dax map in the kernel. If this
> succeeds, read/write/mmap are resolved direct-to-dax with no upcalls.

Nothing to do at this time unless you want a side project:  doing this
with compound requests would save a roundtrip (OPEN + GET_FMAP in one
go).

> GET_FMAP has a variable-size response payload, and the allocated size
> is sent in the in_args[0].size field. If the fmap would overflow the
> message, the fuse server sends a reply of size 'sizeof(uint32_t)' which
> specifies the size of the fmap message. Then the kernel can realloc a
> large enough buffer and try again.

There is a better way to do this: the allocation can happen when we
get the response.  Just need to add infrastructure to dev.c.

> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 6c384640c79b..dff5aa62543e 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -654,6 +654,10 @@ enum fuse_opcode {
>         FUSE_TMPFILE            = 51,
>         FUSE_STATX              = 52,
>
> +       /* Famfs / devdax opcodes */
> +       FUSE_GET_FMAP           = 53,
> +       FUSE_GET_DAXDEV         = 54,

Introduced too early.

> +
>         /* CUSE specific operations */
>         CUSE_INIT               = 4096,
>
> @@ -888,6 +892,16 @@ struct fuse_access_in {
>         uint32_t        padding;
>  };
>
> +struct fuse_get_fmap_in {
> +       uint32_t        size;
> +       uint32_t        padding;
> +};

As noted, passing size to server really makes no sense.  I'd just omit
fuse_get_fmap_in completely.

> +
> +struct fuse_get_fmap_out {
> +       uint32_t        size;
> +       uint32_t        padding;
> +};
> +
>  struct fuse_init_in {
>         uint32_t        major;
>         uint32_t        minor;
> @@ -1284,4 +1298,8 @@ struct fuse_uring_cmd_req {
>         uint8_t padding[6];
>  };
>
> +/* Famfs fmap message components */
> +
> +#define FAMFS_FMAP_MAX 32768 /* Largest supported fmap message */
> +

Hmm, Darrick's interface gets one extents at a time.   This one tries
to get the whole map in one go.

The single extent thing can be inefficient even for plain block fs, so
it would be nice to get multiple extents.  The whole map has an
artificial limit that currently may seem sufficient but down the line
could cause pain.

I'm still hoping some common ground would benefit both interfaces.
Just not sure what it should be.

Thanks,
Miklos
