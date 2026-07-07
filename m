Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1B93C0A1C
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 19:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783454122; cv=pass; b=j9y8JwdyANLt/jwxlVVEsL/AZlr8E9LwVQPpocjnZ9fZ4KT/boGh/F5WVyrYGVgQ3jc6PRAzJj/3l4+WRvrFEnGGeNM6jQF5oQD2o897X41bc1jSf20AQsM6qnGjD21kjTwaZDSz7U5B2aPpo3NmCbxSRwKufeTSRiRd9TO8srQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783454122; c=relaxed/simple;
	bh=28T9LC8qC3w3ciXN6Fz4Z4g2iDK73+BSqIPdga2DGts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dc0beW2h0Dgv+bFyQWlDUGzokrb0XKiMthtW68b/abz8Ogb5y2OGDLeLXOmS/wJNr9W3eltLnoyTyY/E2lftZvuun8iHF2WrHdcT15GJR9JTf++X3vWEKd2SRluTjmG91Qa7SgJu0bXOXtN83/92f3eV/nxvCFbVEx/zWw1aGoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0YErfQB; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0YErfQB"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-44cd237446cso2920400fac.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 12:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783454119; cv=none;
        d=google.com; s=arc-20260327;
        b=j5/A8IkKEsgM0MlgLY1aMKM4QdQhW2RkgkSxttJr6h8AeLRMKPzsrOajoRaTlcbcyr
         auKoz4tn5RVHlP2UTvHhzdQhhEB8NFHuYAxWccZlPbUC8B1NeFc3HQDsvqRBcm13klOa
         p0GaBr+nJ5X5mIL5JCIE9Lf3cNb5YXgjMQjrryiGY2wWzAiLRfklEFKB8FiLgO1MGAIV
         s3AGZkLLvxnxmqMN8CeesMFkxwJHDL4R7PvW1bI1bX9wEWxuyQxeKFHNKVqiHO3LoRWv
         5wZwbGnq3olwWsPT4j4yleA0xbe8YuB+P1XiUSCS1YFx0NdUY4KsiqCI42rmzFvJPhJ4
         9ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/UUjuXqKnuK61a7cFsjW9ZWqBCGpYoIH9JYtW2nvWM0=;
        fh=QmvC3rpsBtTWDuaWPzlRuaC8rXW4OjTb4xFpwMddbNY=;
        b=UX9irew9u/HLscqj25Q5ZMVcA6P3MVOAbJo/bZ1FZVAXWtDnCH0XivS5rFl+DnpGIE
         3O3ceGr+uKLdY3PGD4NsctNITZpzBPYgl3dCvrmnVKmWjlfTcNvxVulRJl0MGjOWhmzs
         3ONpXVDnd1YL4hakizvSYvVM1dHYd9W/zkN5GM6zOiv+j7ZD0ft2shCxc/ekD7rpKqXN
         hkZ1xK8KFUVff8J/tm97J5cc1qBmximB35JxTpXgo58vKcMkzdhm9J5HOUiguzEbk+Mq
         dP8qBDEedKKFxRiF1GdSbkggNaR81MNNlH61pYUCHQkaFdcc7QJYxPL+iNcZWnXeSJMV
         hK7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783454119; x=1784058919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/UUjuXqKnuK61a7cFsjW9ZWqBCGpYoIH9JYtW2nvWM0=;
        b=o0YErfQB34QdQFrY2zNUh9GRTkZk5Ho9wisT8d0y1U3jl0oiNblo0Wss7R8tCrVJ6O
         nuHPQZlE0fRis73ENKQGHNmi53NEqWtMclDjadTtx5Nq3b0uu59iXj8oxhOaWZseEBSY
         IF/K5+qX5A+ZPuo8KiMgCytd0MRiRvWIMIC5Bu/yXrWM3K+S88n1xv+IbJFbpGXHoAzO
         s9bwEwGl6rBOHDVYZb+jLbnhV2b7AE7rry/g/tvuSy6makW7VOB2jD7s8uy+kRoLFCC1
         +3Ba9mxh5RMG+0jNjANa/L+gGkB6spNkDbjOcVUHcY46bZ9Szvd108aRShmCSy+1hsLM
         Hk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783454119; x=1784058919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UUjuXqKnuK61a7cFsjW9ZWqBCGpYoIH9JYtW2nvWM0=;
        b=sRdKQW7Q4kA1J4w0P4DVQGLDVQjXOmeNobNu90KKgSmqftp0MI0E2I5s4eMNVldFzv
         yvzt7Fs15krA1/cYjCR9l02GOwrCRlZT4JrD61WukyIK6evt8gTQx2NGjZup+8hxbKty
         bIx7Ibk6Ds6ckIImGxG+Q+zf+joOV4tw1OiNjDq0EdoGRDmUn0OUxbnPgxlSh84xg5WQ
         vIU59XbC+ltHdYZ7n3vypeTIRBY1/3jtfZik44yjCB/arJrtTEy6Z335uRDzRuFkYcr/
         d4u0mVJI42p5hklidc/77Cei1GH3SOK0nILlLxW4qc4YHXoGVJZ1IJoe8kf0G9vIhbzJ
         l34w==
X-Forwarded-Encrypted: i=1; AFNElJ8bOfruOilrdkgBUJ2uphCAtcjqwE8ll+3vX3GAG6jRsID3eO5v21t6bvWSKvpYLcRJ0cfgLlhXNW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44Ck9swDX51BhIKzEEfXsx2+Iu9oZtuSq2bhYOyM66/S+gV3f
	dwc5Ez54odmw35pOwweNCEF2413n6ii2rRY3/7KUOdr+0fc1pwSGADSEavUNCnGzUOjDTxM3kqr
	ZaW7s3PjTCae0tNZUfUbuxZPgaSTn0J0=
X-Gm-Gg: AfdE7cn1K7Cyy9huDv4lOUPDaTtG5bomJil325VOAfLOCosHYiibN2yU03UKd79WUQZ
	ZF5UrqrtVDu2nuwpIpph9517RBVsm0Vb+eNzmlQNAk2sqYAU7gYB+f0E8xQLOmutARw6HKk6rMv
	l1OCpbBVLluq8c5tpOlrgZnEJQHI5a8/Pleda6mBsfzRG8q4lMsMg2UsrAW7Y76BZWih1D+blrp
	XbtFPS1TmbBxav6l5suF3hFROs7Z1HVWK02Lvg8RpV0tbsN5aS4D3P/5KuB+BSdnlws589f2UR5
	k9cyoxI=
X-Received: by 2002:a05:6871:2eaa:b0:439:c66d:2e5f with SMTP id
 586e51a60fabf-451062d14b9mr4294017fac.24.1783454119271; Tue, 07 Jul 2026
 12:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706000338.362421-1-shijujose2008@gmail.com>
 <20260706000338.362421-2-shijujose2008@gmail.com> <akx2wqr3ULcmpCmc@hu-ashoraj-lv.qualcomm.com>
In-Reply-To: <akx2wqr3ULcmpCmc@hu-ashoraj-lv.qualcomm.com>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Tue, 7 Jul 2026 20:55:06 +0100
X-Gm-Features: AVVi8CdNXthfgZirwipMRC0g06u6afOreJEJzYGgCdk14S6ETxObFJktMa8ee-M
Message-ID: <CAG4KcR+TPE9a7Fr1FWwoRa9tcb+u4qfp=UiuYvb=kNXKRWPP7w@mail.gmail.com>
Subject: Re: [PATCH v21 1/2] ACPI:RAS2: Add driver for the ACPI RAS2 feature table
To: Ashok Raj <ashok.raj@oss.qualcomm.com>
Cc: rafael@kernel.org, bp@alien8.de, akpm@linux-foundation.org, 
	rppt@kernel.org, dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, leo.duran@amd.com, 
	Yazen.Ghannam@amd.com, mchehab@kernel.org, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ashok,

Thanks for looking into this and good catch.
I will incorporate this change in the next version.

Thanks,
Shiju


On Tue, Jul 7, 2026 at 4:47=E2=80=AFAM Ashok Raj <ashok.raj@oss.qualcomm.co=
m> wrote:
>
> Hi Shiju
>
> Thanks!
>
> On Mon, Jul 06, 2026 at 01:03:37AM +0100, shijujose2008@gmail.com wrote:
> > From: Shiju Jose <shijujose2008@gmail.com>
> >
>
> [snip]
>
> > +static int register_pcc_channel(struct ras2_mem_ctx *ras2_ctx, int pcc=
_id)
> > +{
> > +     struct pcc_mbox_chan *pcc_chan;
> > +     struct ras2_sspcc *sspcc;
> > +
> > +     if (pcc_id < 0)
> > +             return -EINVAL;
> > +
> > +     sspcc =3D ras2_sspcc_get(pcc_id);
> > +     if (sspcc) {
> > +             ras2_ctx->sspcc         =3D sspcc;
> > +             ras2_ctx->comm_addr     =3D sspcc->comm_addr;
> > +             ras2_ctx->dev           =3D
> > +                     sspcc->pcc_chan->mchan->mbox->dev;
> > +             ras2_ctx->pcc_lock      =3D &sspcc->pcc_lock;
> > +             return 0;
> > +     }
> > +
> > +     sspcc =3D kzalloc(sizeof(*sspcc), GFP_KERNEL);
> > +     if (!sspcc)
> > +             return -ENOMEM;
> > +
> > +     pcc_chan =3D pcc_mbox_request_channel(&sspcc->mbox_client, pcc_id=
);
> > +     if (IS_ERR(pcc_chan)) {
> > +             kfree(sspcc);
> > +             return PTR_ERR(pcc_chan);
> > +     }
> > +
> > +     if (!pcc_chan->shmem) {
> > +             pcc_mbox_free_channel(pcc_chan);
> > +             kfree(sspcc);
> > +             return -EINVAL;
> > +     }
> > +
> > +     sspcc->pcc_id           =3D pcc_id;
> > +     sspcc->pcc_chan         =3D pcc_chan;
> > +     sspcc->comm_addr        =3D pcc_chan->shmem;
> > +     if (pcc_chan->latency)
> > +             sspcc->deadline_us =3D PCC_NUM_RETRIES * pcc_chan->latenc=
y;
> > +     else
> > +             sspcc->deadline_us =3D PCC_NUM_RETRIES * PCC_CHNL_DEFAULT=
_LATENCY;
> > +     sspcc->pcc_mrtt         =3D pcc_chan->min_turnaround_time;
> > +     sspcc->pcc_mpar         =3D pcc_chan->max_access_rate;
> > +     sspcc->mbox_client.knows_txdone =3D true;
> > +
>
>   Probably a minor nit ..
>
>   sspcc is published on the global ras2_sspcc list (with a live kref)
>   via list_add() before sspcc->pcc_lock is initialized a few lines
>   later via mutex_init().
>
>   Once list_add() runs, ras2_sspcc_get() can find this sspcc and hand
>   out a pointer to it (kref_get_unless_zero() succeeds since kref_init()
>   already ran). A caller doing so before mutex_init() executes would
>   end up with ras2_ctx->pcc_lock pointing at an uninitialized mutex.
>
>   Currently harmless because the only caller, parse_ras2_table(), walks
>   PCC descriptors strictly sequentially, so no second register_pcc_channe=
l()
>   call for the same pcc_id can land inside the window. But it's relying o=
n
>   that being true rather than the code enforcing it.
>
>   Should we initialize the mutex before publishing the object, e.g.:
>
>         mutex_init(&sspcc->pcc_lock);
>
> > +     kref_init(&sspcc->kref);
> > +
> > +     mutex_lock(&ras2_pcc_list_lock);
> > +     list_add(&sspcc->elem, &ras2_sspcc);
> > +     mutex_unlock(&ras2_pcc_list_lock);
> > +
> > +     ras2_ctx->sspcc         =3D sspcc;
> > +     ras2_ctx->comm_addr     =3D sspcc->comm_addr;
> > +     ras2_ctx->dev           =3D pcc_chan->mchan->mbox->dev;
> > +
>
> > +     mutex_init(&sspcc->pcc_lock); <---------------------
>
> > +     ras2_ctx->pcc_lock      =3D &sspcc->pcc_lock;
> > +
> > +     return 0;
> > +}
>
> Otherwise
>
> Reviewed-by: Ashok Raj <ashok.raj@oss.qualcomm.com>
>
> Cheers,
> Ashok
