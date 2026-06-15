Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420A30C143
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527778; cv=pass; b=jTT2CXAmAYdE9aqbss0VvkA0J/uBst9evBbUY820paUdocMd3CgBMGtE1QSbvC59HzxK3MITrVHVCAHz/d2weYDqEQyahElHjKeOpavpgzEmsdyRmlKruHi1mjnnOzlDYR9C1VknbmDYMwyuZMljUMjTyimdVOZQcNZ7JGtlkFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527778; c=relaxed/simple;
	bh=EuT5lYOMkkdhbh36n3EuIDGIwufLokD6nYk5Kx0YNCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dzk3Pt/K03oQipIikyQglcwbpGA22RtscqpB+fYY/uaAZKaAA3k55FvZO97i8n4ZpjUSSQiZjulnP2bUlA9TMIziTKobt3qi/OpMy9za0AdnJz/B4qGVNfCHHzddhaE1tVt4p/Dosj8TxU0oBCs2h3MZgPH3g695vof7SBHkW28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKOd6BOv; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKOd6BOv"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so2964543e87.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 05:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781527775; cv=none;
        d=google.com; s=arc-20240605;
        b=HpsS8kYkREtC3+An2PNFl52rUNyf6KwRUHKISyaO30IcfDZ2kQWYXYSDKL+HuFADpO
         Oo/D14tBLwz+4GMuiVZvNz5Su/WKjtZYrWStPSYq+ytaGI27wtv73cbk4Bf8zZZQptR5
         UDWwtfBR+bGSqdJkJlyppChJ5KBj7iPUZzYnEMxZoHtOKCABrr6vWh2khPVxzTikdd3B
         bV0zw6FHOUyKZxEAd697JHRochuLhGyZlGoLQDexkIurGvtz/jzVMYtMjO/58Twn9XrP
         eu6cvW0/b4bRdf1FlDb/6UxbP20OMs88GqAGsox/CSNzPDm4NVVnyx4ydF7f9QUlfURT
         VDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EuT5lYOMkkdhbh36n3EuIDGIwufLokD6nYk5Kx0YNCs=;
        fh=l/hhk2xr1ttd/KZOC/VCu6WdmmAqE4IoJkEmnnqoKoE=;
        b=d/nAfxfNPPSbEHQk4YgUHGHzS3jYbD8jwOxnZMiv5RsFtSUnzTNS3h7EG2ap7s0GP7
         MXe8FCJi+JPihEMS9Opw3iy+6d1y0qCT8L0rWpQwQ2MR9c9fK/+Cn/RPlJDDXqlQSttR
         P6kqIHAx7ukM2xyhVWy4JwfTtLcPRpaejuyvTNc2Oi9rsvKI03yhOeokLDEMmhmOkL7O
         o4b1ttKPQJPGgWN9M7CdVVzpQueKJLSClUWMvrXbs8rYKrQdse12KKoiwMDiXTPocKCL
         TmRgWvpOY18PpXCVgMxzoae3Yrcx34ZP1Y8wgytHD+Y6PDJDPJUsEXDCgDIVVAqxd1hY
         ANpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781527775; x=1782132575; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EuT5lYOMkkdhbh36n3EuIDGIwufLokD6nYk5Kx0YNCs=;
        b=sKOd6BOv13rS48sKumGSN98WjIjmsrT1KB2CVI3OlskLoqYiDYt3H+NMuI6KkIekIw
         tXFqxAa/tXdsNaHRisGNWz1stQBOMoN+gxX0VLzJUJWdw43l9x4DsWY+Tsc7/yErRp1a
         PgvKNVIBHkvtuyM9jdaHVFRNN/A5B2CNEeod4/9U/pbJKPxcAOhWk1AmcvWIbC1l7qgx
         SaOJDxYJVeAcZ62WRIxg4NeN1xwTJhz2EfshZ3KRAgc72S+cCSGkveuZ34z1QicotMj2
         B2Zg7Zeoi+naH5a5XSc5tKS1mxRo9Z2liW2iqc/py3DpTRiwjzOFAI3vOXP6li6jg1bO
         dFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527775; x=1782132575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuT5lYOMkkdhbh36n3EuIDGIwufLokD6nYk5Kx0YNCs=;
        b=PZV13b9SgXMeMyPWcmW9VmZ8Bg/bC/KA3HJrIIx2i4rCLlSQxRhHNXbAnbFCpxYZMa
         dr0eHXf0wyBX45rJBcnjvW30biN7YxWFl9L4UXcb7yU4FEgiHW8hC1k5iLtFMFtCLROA
         KW/Vf13vg2Oub6lFMbYNG6eR/fa+S2bcNe3K2fePSYBjxcXKlWGg+mJe7dJkhfTxXkba
         yXtOCThbpzY7ro/B4OIroKjkso5nTWo0ycX2+WrxAS7e9AXBlCeQzGLdTaCFTrGTZyxH
         XPpgqORQTGZZr+7ksjbgvR8JdAETKcJTawaorCpHfC6Fh77CEpWPT1rXtmLfk45DaeEU
         x9TQ==
X-Forwarded-Encrypted: i=1; AFNElJ96La30zEi0m+eQ66ElzVE773L0GjuSAbAvYQwHxpUe/kWN3NY2uAQAuLGARylpfR+SKKkfL3F28TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBES1gymPxUBhRtDiOEjcI7/8nfPifbz9Mzryj/9cpZAZ6EA1D
	2SNl6A7gdWSzPMQ6SAsx7ymm9E4s03huj01Xemu+8NSRo6CdxBV5W3uH1m/IT4Xv9gCkoiX0ylJ
	nujf+mfpt454OvQUkCBRdLjwZjp0XqXw=
X-Gm-Gg: Acq92OH2DqY/t91x0jDQ6LNi20O2+LVXEDRiLoSnYawM2/i1dvfrUr14mNp3QZRUz/i
	X6Brh/UvHVoWbd8kFBY7uonw/Pz0s5EHTPqOfBdwcrTM1tgn7EhXVvXYDgqLwG4VYGfs13+sbJX
	55D6rVUotFXZMjQyb6R2+E1xexolEiZ4W5oCn+jmhG1unswWj4W7NMmmQCsVDVX/mSuZVWKZH5P
	jx+2fccnLDGxjV20uGYb4IdcZE4bDAdLi4uqv1FcEfJaYXPJF4liUHoKIYnZE2HF3t0COfuoAtJ
	eo9PmvoiuaFzXYz59J5r5XcA39VTKVivzQZN1aenNjVIsh4=
X-Received: by 2002:ac2:5293:0:b0:5ad:abf:1d36 with SMTP id
 2adb3069b0e04-5ad2db5937dmr2832285e87.27.1781527775047; Mon, 15 Jun 2026
 05:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-zram-swap-ops-block-register-v1-0-6c1a6639c222@gmail.com>
 <20260614-zram-swap-ops-block-register-v1-1-6c1a6639c222@gmail.com> <ai9abo7GwMl+g43G@yjaykim-PowerEdge-T330>
In-Reply-To: <ai9abo7GwMl+g43G@yjaykim-PowerEdge-T330>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Mon, 15 Jun 2026 20:49:22 +0800
X-Gm-Features: AVVi8Cfn_viuMbTTWIMGNjjYhf-WEwtj1PicfDVhhngZ6JvZ_KcLvfvomcBcjRY
Message-ID: <CAJxJ_jh=q+Jh772w-hsJoCLTE82-btBj20R+zKL0Vn1fdccnqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm/page_io: let block drivers register custom swap
 I/O ops
To: YoungJun Park <youngjun.park@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <bhe@redhat.com>, Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 6/15/2026 9:50 AM, YoungJun Park wrote:
> On Sun, Jun 14, 2026 at 11:35:29PM +0800, Jianyue Wu wrote:
>
> ...
>
> Hello Jianyue.
>
> Currently, the patch commit log indicates only a single custom swap
> registration is supported. Shouldn't we allow multiple block drivers to
> register their custom ops simultaneously from the beginning?
>
>> int shmem_writeout(struct swap_io_ctx *ctx, struct folio *folio,
>> struct list_head *folio_list);
>> diff --git a/mm/swapfile.c b/mm/swapfile.c
>> index 284eebc40a70..ebdc96092961 100644
>> --- a/mm/swapfile.c
>> +++ b/mm/swapfile.c
>> @@ -2849,6 +2849,10 @@ static int setup_swap_extents(struct swap_info_struct *sis,
>> sis->ops = &swap_bdev_ops;
>>
>> if (S_ISBLK(inode->i_mode)) {
>> + const struct swap_ops *block_ops = lookup_swap_block_ops(sis);
>
> Also, just a personal thought on this part.
>
> Instead of using `block_device_fops` as a lookup key, what if we handle
> this similarly to how filesystems use the `a_ops->swap_activate` callback?
>
> We could add a `swap_activate` callback directly into
> struct block_device_operations (zram's zram_devops). This way, the
> block device itself can set up and replace the swap `ops` directly without
> needing a separate registration/lookup mechanism.
>
> What are your thoughts on this approach?
>
> Thanks,
> Youngjun Park
>

Hello Youngjun,

On multiple registrations:
Previously I was also a bit hesitate about this. Exactly, better to
support multiple block driver directly, I'll update it.

On swap_activate:
That's a very good idea, to use swap_activate callback, it is much
cleaner, I like this approach:) setup_swap_extents() would call it for
S_ISBLK swap targets, and the driver would install sis->ops at swapon
time. When the callback is NULL, the core can fall back to
swap_bdev_activate() and swap_bdev_ops. That removes the separate global
registration/lookup mechanism entirely, and multiple block drivers are
supported naturally because each device carries its own ops table.

Thanks,
Jianyue
