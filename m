Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F83117BA9
	for <linux-doc@vger.kernel.org>; Sat,  7 Jun 2025 23:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749339091; cv=none; b=Bc/nq0jbUPR8TegvTChZMM8nhS86+VENK2+kg7DfxN+1opSvAv5p+958/OB5W6kegB1XIn8VAnjHcdjQ9MUHSLNz004tL33nBBQBBMJXk70PfKuF1RYUdmhJiX4WrOloEKy6fYkdSNrQTP9gxMnKbAS3PXtGm9bl5AkiQIDPnU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749339091; c=relaxed/simple;
	bh=8XcwoVBtnJceaCQZlX/FS3bSn/tOjoUa1A1ECuOq5H0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6NbVaULLQY+BVMDN+exWio+70/Q9AqHVBP4F4VhrNc5M8jZlxBv6gVaVupi/pDLdTH3M9dgHp18QYvpgrNMvVjnA4IOyE8ikle/JvaAm/vQdAMuP6xDFeFDZYhMIs1kDIVCMpZAcByw2dAmg1lPsbITJz7hTdYX39lX5pJNwCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=rBjbzS2n; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="rBjbzS2n"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a442a3a2bfso58843121cf.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Jun 2025 16:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749339087; x=1749943887; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nWW4tFwFmqVS//sP6tRLMxB/a9EcACAW7cnbM0vY4Rg=;
        b=rBjbzS2nmcZArIt5zVXSbN7+no0gPuzRldozQRRKintYPS7txBP9cxqUTqpbZNXT8a
         omLC3I2mGhSZP0xH1RPcHQQouYWYf0A69wXNYgJ6QAYuXBTAzJuvmgM77FXl1l/PjMnq
         nhXHxMHO+8quUIIewSWThkDxykoY1/p3rpO/02VHDUYWnkiJo6wuiRJmw0nfeD4WHahC
         zDTNsZd359TNIjLnrIPf/SfJ81XlTIZQRJwQnAuBVShKAPw76MHoEH1+cVHqv3c6fu9b
         IRZ32eqTbg4dWsVrnxiXBZLnKomsyNDIqc+8GwIgld9ZrFaQXocWiBPqp5PvhjfONXI4
         ChZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749339087; x=1749943887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWW4tFwFmqVS//sP6tRLMxB/a9EcACAW7cnbM0vY4Rg=;
        b=O5+bGRyvsM2ojCojuBab04Q1LD5Qy4x2JKnUOoo+LVu5DB/3nHbTS0mPa+2doyL12a
         5BK4+zvFFnHtU8IsrhiQCBS2rTzAsK+bc5Ny3T0gV8/Ludc2ZqK4pI8TxZPsSIwCfcZ9
         K4ruE93DsHTTo/dAgnkRfJMOnkhE/Gvak1NhJZFbBEBLxau6XgnPe3wH8o+NXeZD4jt9
         32Sch0s0inyW46QgPOCXkCQq6hfXBWQedsybY6Jv4SG86VhBqkemqEM3yp5ub5i1jmpm
         ysOibdlhhbGXtrsn/S3qcK7uHSyYTsaiGTknxom0YEMK3eYx2OjH0OpfmepussXV6YbQ
         Q+9g==
X-Forwarded-Encrypted: i=1; AJvYcCWctsR8qG+sBBYE7h4p09TgLbYP2eVEz6N8HNcqmdTpCPwEmlTrPQl7qNTmt/veaGpM9mk4W+XJ9Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxSa5119aAzAAjdRNpa4+/kc7vAavYa0/X8s69ONF5DdK29R0
	zbJH7kxdoEHORAMPQ3o62DBaqAkp2ze70OU/C6PQ4LMOjCY4EVhR6otpHF9QKfdlNGLTXgp+afJ
	rJTufTW/3aE/PRGxvTMEQraluxG8/be3R74at7BkDbQ==
X-Gm-Gg: ASbGncuhTxRUJEXI6cgexcAffeIiNyCnqVk1Nxg2cPN7bvleS/fnkdntpBvZDZ401IM
	tGAvIQtjHXntoL9aa0H1t2lTkB4KmPT+ROn15/5w8+9MUbCFlisoeIQ2Nxd71ZwR7zvJQrWw5Vi
	KfmeyJ1WquIkz6cRyTc6VHXxRDJnz5eyK7KPK/Y/Aj
X-Google-Smtp-Source: AGHT+IE/jhKXlDr4jL3M75mzvowzE14RL3PEF2Uct9qhaEWX17FT27TRjOroOxAGSkk1IHz01pymOxp4I9oUtrJerjw=
X-Received: by 2002:a05:622a:1f8a:b0:4a4:3f02:da8a with SMTP id
 d75a77b69052e-4a5b9a04abbmr157361561cf.1.1749339087430; Sat, 07 Jun 2025
 16:31:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-6-pasha.tatashin@soleen.com> <mafs0sekfts2i.fsf@kernel.org>
In-Reply-To: <mafs0sekfts2i.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 19:30:50 -0400
X-Gm-Features: AX0GCFs-BjRusZNGHsxVWMv-Mr6Y0p0TY9yHb7099prmZv0f_v8HXx6iETmf-Tg
Message-ID: <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"

> > +     fdt_out = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
> > +                                        get_order(LUO_FDT_SIZE));
>
> Why not alloc_folio()? KHO already deals with folios so it seems
> simpler. The kho_{un,}preserve_folio() functions exist exactly for these
> kinds of allocations, so LUO also ends up being a first user. You also
> won't end up needing kho_unpreserve_phys() and all the __pa() calls.

I prefer phys here, because this way, we are not bound for size and
alignment to be of a specific order, it can be n-pages instead.

> > +     if (!fdt_out) {
> > +             pr_err("failed to allocate FDT memory\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     ret = fdt_create_empty_tree(fdt_out, LUO_FDT_SIZE);
>
> You are using FDT read/write functions throughout the series to create
> new FDTs. The sequential write functions are generally more efficient
> since they are meant for creating new FDT blobs. The read/write
> functions are better for modifying an existing FDT blob.
>
> Is there a particular reason you do this?
>
> When using FDT SW functions, the creation of the tree would be something
> like:
>
>         fdt_create()
>         fdt_finish_reservemap()
>         fdt_begin_node()
>
>         // Add stuff to FDT
>
>         fdt_end_node()
>         fdt_finish()
>
> In this patch, the FDT does not change much after creation so it doesn't
> look like it matters much, but in later patches, the FDT is passed to
> luo_files_fdt_setup() and luo_subsystems_fdt_setup() which probably
> modify the FDT a fair bit.

The number of changes to empty tree FDT is small, and this is done
only once, so I do think the extra cost is substantial.  This could be
a future optimization. Also, we could use a hybird approach where
luo_files/luo_subsystems do the SW updates, while here we do
Read/Write updates.

> > +     if (ret)
> > +             goto exit_free;
> > +
> > +     ret = fdt_setprop(fdt_out, 0, "compatible", LUO_COMPATIBLE,
> > +                       strlen(LUO_COMPATIBLE) + 1);
>
> fdt_setprop_string() instead? Or if you change to FDT SW,

Updated, thanks!

> fdt_property_string().
>
> > +     if (ret)
> > +             goto exit_free;
> > +
> > +     ret = kho_preserve_phys(__pa(fdt_out), LUO_FDT_SIZE);
> > +     if (ret)
> > +             goto exit_free;
> > +
> > +     ret = kho_add_subtree(ser, LUO_KHO_ENTRY_NAME, fdt_out);
> > +     if (ret)
> > +             goto exit_unpreserve;
> > +     luo_fdt_out = fdt_out;
> > +
> > +     return 0;
> > +
> > +exit_unpreserve:
> > +     kho_unpreserve_phys(__pa(fdt_out), LUO_FDT_SIZE);
> > +exit_free:
> > +     free_pages((unsigned long)fdt_out, get_order(LUO_FDT_SIZE));
> > +     pr_err("failed to prepare LUO FDT: %d\n", ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static void luo_fdt_destroy(void)
> > +{
> > +     kho_unpreserve_phys(__pa(luo_fdt_out), LUO_FDT_SIZE);
> > +     free_pages((unsigned long)luo_fdt_out, get_order(LUO_FDT_SIZE));
> > +     luo_fdt_out = NULL;
> > +}
> > +
> > +static int luo_do_prepare_calls(void)
> > +{
> > +     return 0;
> > +}
> > +
> >  static int luo_do_freeze_calls(void)
> >  {
> >       return 0;
> > @@ -88,11 +151,111 @@ static void luo_do_finish_calls(void)
> >  {
> >  }
> >
> > -int luo_prepare(void)
> > +static void luo_do_cancel_calls(void)
> > +{
> > +}
> > +
> > +static int __luo_prepare(struct kho_serialization *ser)
> >  {
> > +     int ret;
> > +
> > +     if (down_write_killable(&luo_state_rwsem)) {
> > +             pr_warn("[prepare] event canceled by user\n");
> > +             return -EAGAIN;
> > +     }
> > +
> > +     if (!is_current_luo_state(LIVEUPDATE_STATE_NORMAL)) {
> > +             pr_warn("Can't switch to [%s] from [%s] state\n",
> > +                     luo_state_str[LIVEUPDATE_STATE_PREPARED],
> > +                     LUO_STATE_STR);
> > +             ret = -EINVAL;
> > +             goto exit_unlock;
> > +     }
> > +
> > +     ret = luo_fdt_setup(ser);
> > +     if (ret)
> > +             goto exit_unlock;
> > +
> > +     ret = luo_do_prepare_calls();
> > +     if (ret)
> > +             goto exit_unlock;
>
> With subsystems/filesystems support in place, this can fail. But since
> luo_fdt_setup() called kho_add_subtree(), the debugfs file stays around,
> and later calls to __luo_prepare() fail because the next
> kho_add_subtree() tries to create a debugfs file that already exists. So
> you would see an error like below:
>
>     [  767.339920] debugfs: File 'LUO' in directory 'sub_fdts' already present!
>     [  767.340613] luo_core: failed to prepare LUO FDT: -17
>     [  767.341071] KHO: Failed to convert KHO state tree: -17
>     [  767.341593] luo_core: Can't switch to [normal] from [normal] state
>     [  767.342175] KHO: Failed to abort KHO finalization: -22
>
> You probably need a kho_remove_subtree() that can be called from the
> error paths.
> Note that __luo_cancel() is called because failure in a KHO finalize
> notifier calls the abort notifiers.
>
> This is also something to fix, since if prepare fails, all other KHO
> users who are already serialized won't even get to abort.

Thank you for reporting this. This should not be happening, because if
__luo_prepare() fails, the kho_abort should follow, however, KHO does
not do kho_out_update_debugfs_fdt() when kho_finalize() fails, so I
added this callback and it fixes this problem. I also added a selftest
case for this.

>
> This weirdness happens because luo_prepare() and luo_cancel() control
> the KHO state machine, but then also get controlled by it via the
> notifier callbacks. So the relationship between then is not clear.
> __luo_prepare() at least needs access to struct kho_serialization, so it
> needs to come from the callback. So I don't have a clear way to clean
> this all up off the top of my head.

On production machine, without KHO_DEBUGFS, only LUO can control KHO
state, but if debugfs is enabled, KHO can be finalized manually, and
in this case LUO transitions to prepared state. In both cases, the
path is identical. The KHO debugfs path is only for
developers/debugging purposes.

> >  static int __init luo_startup(void)
> >  {
> > -     __luo_set_state(LIVEUPDATE_STATE_NORMAL);
> > +     phys_addr_t fdt_phys;
> > +     int ret;
> > +
> > +     if (!kho_is_enabled()) {
> > +             if (luo_enabled)
> > +                     pr_warn("Disabling liveupdate because KHO is disabled\n");
> > +             luo_enabled = false;
> > +             return 0;
> > +     }
> > +
> > +     ret = register_kho_notifier(&luo_kho_notifier_nb);
> > +     if (ret) {
> > +             luo_enabled = false;
>
> You set luo_enabled to false here, but none of the LUO entry points like
> luo_prepare() or luo_freeze() actually check it. So LUO will appear work
> just fine even when it hasn't initialized properly.

luo_enabled check was missing from luo_ioctl.c, as we should not
create a device if LUO is not enabled. This is fixed.

>
> > +             pr_warn("Failed to register with KHO [%d]\n", ret);
>
> I guess you don't return here so a previous liveupdate can still be
> recovered, even though we won't be able to make the next one. If so, a
> comment would be nice to point this out.

This is correct, but this is not going to work. Because, with the
current change I am disabling "/dev/liveupdate" iff luo_enable ==
false. Let's just return here, failing to register with KHO should not
really happen, it usually means that there is another notifier with
the same name has already registered.
