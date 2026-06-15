Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6058B353EC0
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529565; cv=pass; b=HRv9+CU42bPvniuJwr8Gt4V5muOXbfyuUvymXb7MENAGHR0PQfmc2x/72V9IfTEmla5umCj7qD2zOwhVX5EspYih4wSm/ukwg4bETZvY5hPvT+omgh2+WFbDVNWdMfg2QGJUAtSJrSs3J+LIe2jIXnPRvCKMOJxjqhju4ACU3Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529565; c=relaxed/simple;
	bh=aylr0jSHqZiMcYssPunDBwm1K7Kn5m2/H5slQ8rRPTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usXonkmzf8rGgrrKgQ7dN3BXRce24GZqITpQ6cO2uebNN+hrrQ+mTFsvTIE4Sqsb/aNrX4xNFbzX/HcfqZSw2v8Md32QIt3+qCCY+yFc+rBqnxas+7kbC7KL9Lrx8sFj92yNudsi/C1XnWhtcZG8DyAfUmcx/m7GrMmrtalyvmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmNGpbs1; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmNGpbs1"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39940cb1ba0so13802631fa.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 06:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781529563; cv=none;
        d=google.com; s=arc-20240605;
        b=FI76WtxhqNtML3NEWqE6SC/nY+AHmr5HfmJMDLqRLogSSB/OjoRqkmGWSvEmo2JSXL
         SZNtm2QwALX/P5Q8XOUk2FwHh7k9rXVx16Qqaygbq4EMmOIz7Mm45EMUwaOBlQiRnswb
         2c42vAQqtKK64maiVIe/YToeRlX1i67fNwM3xgk7gIXiU5Ax2mMRuXkqReKKJsulL9CL
         bqMbbxWKKaTS42I9z4b8WFAbN/zSdytcoHIWkVSV/NN0/CpBYDfmLRNOoidd/c0o29xC
         shvlScD0+3mnaUaMkEEWupOlD1ad/QoXurKDGmrqEugoDOhzY0ouw4on2+6GFrcVuQW0
         XczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wpR91dRVrjqKzmtraov7aI7NzeTafl2vyksF7BlIurg=;
        fh=y+ISH9PqWoXsjbNAHoAjFkb0TBCOXzpWUYxvF6TpuxA=;
        b=WRNQn5/WmoRS67pscgSNPxUfdyje8sZjNvBI/CitxA08wJxHLK2Wm3vjOutuyEg6S7
         1KMzeMeJiqqNJSk/S8gI5K/EnTHEtwHNz86ghYybhGVLLRnpci1FbGtJ9MHTglxHzBj+
         gCc8Vy5ooezhPhLuktulvNOKeIIhAsUgadyheAPecda0OhukZtv14C6kwpqJG2GJ9JDs
         liGxa5LuMrEIRtOMHW3a5ZABHlknnqjRjy0NQkOi5nQ0rnJivxSdO+zWngJKNlLbOtw8
         Wr06bVlxB4mpK0vKkGXf9L4mE30i0CGtUK3GAxD6uXi0HTNrB9tY1Z+LfgEkV7jj9N/3
         ETDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781529563; x=1782134363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpR91dRVrjqKzmtraov7aI7NzeTafl2vyksF7BlIurg=;
        b=BmNGpbs1LFf3K7FAnrO+0OAG8IA9PpOyCXIvamv3tiJkzv9+7Q0K7SPL+VloO4gWJc
         WlPIG8fXf+WyS0ouObn786ni7702z5ztV/EGO9fkb27QquP/A7KvZW2XePzFZ9fzybNe
         uSNuR4FeL0EKG1GseLtU0O75bz7FILQAnL8oOH1nqpi4KRil6S6ES1a7PaI9tJ7rzz4d
         zOrYz6kVpu5L2sVLX3rrfivkwVVKNHWXjAUOHqJyaa+XAY6He/hi+NEtdBAo7XGF9B1v
         NefB/xAJLf/2DUQJDpUWW2iK7bJpExYhb0xwC01ZSuVzPMLwfpAUHA37jYR5Xxx5jq6T
         mbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529563; x=1782134363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpR91dRVrjqKzmtraov7aI7NzeTafl2vyksF7BlIurg=;
        b=YJvbisjpj9ZBNLTuywYrQ6h9T3n/IJ2wHliPMc13zxoKurg3REc+qM3aGPHGRZqdxI
         jH19nZv2mD8axbJ7Du5xI5darTS2luPQ545DL9G5qd72hpxiYgv9w9N3zwjKKaM94PpB
         deOj8JI0z2JN+qTONdziyg4uNdEqyRgrFOz7oGeczsHBcoDsFi2dDFht9cUAQIndgH9B
         34d3L8Sh4Y9qGWG0j5Iz0etLuF8PPov/2gTf+CjAzAGhsscwWPPh0AhA9EzuZY6d7ivq
         j9mfWiahzhczK5/x0OtxQ12x2xgvHQ9pnoeN5Tgb3vNllX5TqmXNILzOEAAQsrlY+S06
         DVSA==
X-Forwarded-Encrypted: i=1; AFNElJ8BUZuWldlMJ9t32m6QBxntMIseIlscqBvNb937gCJtDwkGdYC37D064yDtLWHf4ayhPV1UM5gokOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJHOlLhTWRUHiTH7tYg8i2/UeS6OpDyJTiEPLhIZRt/a2sYfj
	hXSslmWzFaZoqby+gPwCBMqZuwjv/zY6jvj9+q/VmPMzN01H3hqsRPBUkTBMm9RysXsXYbfzuZH
	kvtPk2f//W2MoA+wZt2+K0CNMMgKrDeHOwuc1Cb1/8WjFigs=
X-Gm-Gg: Acq92OFccKpAQlPFvzcgCCXfD+DSubexLgWszKTQAhut+Fs5tZDA/1urXYQmkhmgf1o
	qZVwgCrs9CT24Ij5nlyq2ooTnZyAmb5zKTYuedV+jZ1Jpo+lvixAwbptrnCWMDZoKImf/q899iD
	+L6GI6KPd2+VnhTMRcRPsIz4gLgXVgRXWklS3pyBWjnbWXSKCqevuTVQs7vb5TquT43MzAS3wzl
	jQcUVG1GMa/mwyS3hhYxXPYAegQrOfEp9V4DrQ7YQ58z+kA3gT1kDwWO3A65XLOd2yBBtmlTm+j
	9npXA+CSS4nbrrxvM7sbaZbN8VZvCYIhuU0s
X-Received: by 2002:a05:6512:1545:10b0:5aa:7129:5d43 with SMTP id
 2adb3069b0e04-5ad30dc0c0cmr2154191e87.26.1781529562348; Mon, 15 Jun 2026
 06:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <20260614-zram-swap-ops-block-register-v1-2-6c1a6639c222@gmail.com> <ai+eG9sFYTn/vTq5@yjaykim-PowerEdge-T330>
In-Reply-To: <ai+eG9sFYTn/vTq5@yjaykim-PowerEdge-T330>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Mon, 15 Jun 2026 21:19:08 +0800
X-Gm-Features: AVVi8CcAQj4nbtsy1_GpWkuEBI_5mux4WS8Z_3cRBb-C2eJG0MtZGHlouDRiWCk
Message-ID: <CAJxJ_jhTPr2P83SpmFwKoWVKEKX_jBv3UJLC4WirdHqTYdckpg@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/zram: handle swap read/write via swap_ops
To: YoungJun Park <youngjun.park@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 2:39=E2=80=AFPM YoungJun Park <youngjun.park@lge.co=
m> wrote:
>
> On Sun, Jun 14, 2026 at 11:35:30PM +0800, Jianyue Wu wrote:
>
> Hello!
>
> > +static void zram_swap_submit_read(struct swap_io_ctx *ctx)
> > +{
> > +     struct zram *zram =3D ctx->sis->bdev->bd_disk->private_data;
>
> A passing thought. accessing `zram` here is too indirect. We might
> need a `private_data` in the swap device struct someday?
>
> (And If there is a real value like some swap-side only private data reall=
y needed.)
>
> > +     struct swap_iocb *sio =3D ctx->sio;
> > +     int nr =3D swap_iocb_nr_folios(sio);
> > +     bool failed =3D false;
> > +     int i, j;
> > +                     /*
> > +                      * read_from_zspool() and mark_slot_accessed() mu=
st run
> > +                      * under the same slot_lock.  zram_read_page() un=
locks
> > +                      * before returning, which leaves a window where
> > +                      * writeback can pick an idle slot we just read.
> > +                      */
>
> Regarding the comment about the "window" where writeback can pick an
> idle slot. I think this reasoning is a bit of a gray area. Writeback
> could just as easily pick the slot right before entering this routine,
> so the race condition seems fundamentally the same.
>
> Isn't the actual justification here to separate the non-backend logic
> and ensure mark_slot_accessed() is called under the lock, given that
> zram_read_page() can call the backend device?
>
> If the "window" mentioned in the comment is indeed a valid issue, then
> zram_read_page() has the exact same problem and needs to be fixed as
> well?
>
> If not, IMHO I suggest revising or removing this comment to clarify
> the true(?) intention. :)
>
> > +                     slot_lock(zram, idx);
> > +                     ret =3D read_from_zspool(zram, page, idx);
> > +                     if (!ret)
> > +                             mark_slot_accessed(zram, idx);
> > +                     slot_unlock(zram, idx);
>

Hello Youngjun,

Agree. Walking ctx->sis->bdev->bd_disk->private_data
from every swap_ops callback is too indirect. I will add an opaque
private_data field to struct swap_info_struct, set it from
->swap_activate() when the swap area is set up, and clear it on
swapoff. The zram callbacks will then use ctx->sis->private_data directly.

You are right. The writeback "window" reasoning was overstated.
Writeback could already have picked the slot before we enter the swap
read path, we have ZRAM_PP_SLOT to ensure it.
0. // condition 1 write pick the slot before the lock.
1. lock =E2=86=92 read_from_zspool =E2=86=92 unlock
2. // condition 2 write pick the slot inside the lock.
3. lock =E2=86=92 mark_slot_accessed() =E2=86=92 unlock // clear ZRAM_IDLE =
and ZRAM_PP_SLOT flag

I think simply removing this comment is good.

Thanks,
Jianyue
