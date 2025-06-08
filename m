Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9976EC4
	for <linux-doc@vger.kernel.org>; Sun,  8 Jun 2025 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749389898; cv=none; b=Ikl7E2Zs1Hz6cmcNQDEm4r+gqfzhrFRf5pQ4H8fIVVz+ENkx29+aayqk+Nx904eYEPbkV4QOei0NwMabv5+n5HbZeKV5KnxcxVTsH5WexpgW7OuH1Hp3DD9FOvA/XiYHRPvQqFlgHWeFnPWbTsh27QL0BDOkIaEaXmdnUciVUyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749389898; c=relaxed/simple;
	bh=Xz43Jrp0mXo+o5VStxyZav5edcwHbjs4HXsY3mfy/ZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmKMeXDPiEP3wwB79E5kL85MZZDKq9nR2yqQXg3faWgrc6IZKZU9wXw/duhJ5Rg4Bfp/IoMaxfPR0BlVJNgQ4skAOy4miBuuoMiG/lrTbvVB74UclpgZiaHC/xLdr/N0r3gfQY37RKsFPDYSvMtyJJwmYxR2dSK8V3hOeurUkuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=27eeKOYA; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="27eeKOYA"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso40192961cf.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Jun 2025 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749389895; x=1749994695; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TUbBijHBgxotN6xjfy6fLHclw6xV0tsQ2jT2nZZ0+Zg=;
        b=27eeKOYAK+9S0MMGyU7B4B/Lc0PTcvBTeT5wMDXGiR1p8hG9k9Ym4Hy5fis+uaL9q5
         CLvmK/4nloL0LHVwkzTslfXPp/jYVCmtIiSFTIjp6t/z3tlnC6KyLL5+2wV2VJZmCfhV
         6brt5yodSybZiJsSmEQbq05ADAdKOQ6tM3Rfp8coi3EbpxwK1SWUrL9ZnHcj4TZHv8KP
         PCYth07qM9/O/tARnd8HZh4ab3DyJuNdHfj9jqeq+AxwgcEfj/GxEnbS/5xTBdlgzuMI
         okYyHZrHeOLy9jOOUIFBO4UQbjFk7CLi2evFzGUXSrV3HuT9w3ricnmMlAA/dHrYkCvg
         3MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749389895; x=1749994695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUbBijHBgxotN6xjfy6fLHclw6xV0tsQ2jT2nZZ0+Zg=;
        b=CiiD8D1p+8qGMm2xdFOBCmt4ZhLu4DwkRCEIveVs8qrC3daxgZa3ks0hZ49f3DSc6M
         Vat+dSRK96RwWyLekrxhDz6MBeVS9vulbvHHUKsGamQTSN97FFTboCp+je/TOJhARy77
         2oTIq+9COXU55wdz+NBTEb0bapkyGEUcEC1lFkWm7OJWI2es5Z77Y09lRHG5W+oGMGn5
         35pykINNJUA5/4UTCDeOJ+BRrq8WOUcJm0lf4uuCtgZo/Asq644IWsmJgCAQLtuz4WEI
         dUC46Bf/kL9RkchMFIp0gt2hmABFWgJ5EqN4gtaVil+7k51ZitB30NYuGXUznm4bL58b
         t41g==
X-Forwarded-Encrypted: i=1; AJvYcCWTH8ioWjKv5eUrpdSg7mkjhfkiCUy/DEszFyZ6puPsbImGEoCVeV6FICQcZp6NCdI39druTi9ulf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwMX2EcZOUhprzC6U9LJzvjvcO3YyTqDpdMc19TxFLxWlSHCJH
	xUFZsApLbLCiuk2H3WEGvKsXgukEuehoUQXxad6TdltVRV9Pyn5bJu/+1b9fsU7Q0upliQXTlEI
	TZ4onA6zRGUtiyTOmZiSuTiQuRGClUX6RdvZn3PTujg==
X-Gm-Gg: ASbGncuaf+hTZDPA0+huGy7fSJ/TQa2QrygZsf8030ZbK8W1UH3aYKjLqC2Npj5prQk
	lRWoXc/opj7vrKuOBMtnYpmXASewC7OJw1AQf9bnNq0vnYi5f8SKs/9B93gwTeKe324bYpxUkXw
	sF4zjx6Jdi0+Dhcwmk7RVJK8fjRnbUJQ==
X-Google-Smtp-Source: AGHT+IHxkVYmrqTy++9U+zVtJe1k2fuiraSQf431LIwxqL/0g1Ki6gT4p1nw2WMON0OXJE5372Dw/jab+Jv/xTg0BRM=
X-Received: by 2002:a05:622a:229b:b0:494:7347:d73f with SMTP id
 d75a77b69052e-4a5baa62fdbmr152821741cf.11.1749389895512; Sun, 08 Jun 2025
 06:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-9-pasha.tatashin@soleen.com> <mafs034cetc5g.fsf@kernel.org>
In-Reply-To: <mafs034cetc5g.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 09:37:38 -0400
X-Gm-Features: AX0GCFtZNmgBc-IWiXVSdESmqmVzgwWJDO_gK1yQRaVW8V8y6wninwTbeWi6VDs
Message-ID: <CA+CK2bBeCOojpZ=qoefd6NG+bO6CUh+NU8=8dMhD01=LtC9eNg@mail.gmail.com>
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
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

> > +
> > +/**
> > + * luo_files_startup - Validates the LUO file-descriptors FDT node at startup.
> > + * @fdt: Pointer to the LUO FDT blob passed from the previous kernel.
> > + *
> > + * This __init function checks the existence and validity of the
> > + * '/file-descriptors' node in the FDT. This node is considered mandatory. It
>
> Why is it mandatory? Can't a user just preserve some subsystems, and no
> FDs?

Yes, that is legal, in that case this node is going to be empty.

>
> > + * calls panic() if the node is missing, inaccessible, or invalid (e.g., missing
> > + * compatible, wrong compatible string), indicating a critical configuration
> > + * error for LUO.
> > + */
> > +void __init luo_files_startup(void *fdt)
> > +{
> > +     int ret, node_offset;
> > +
> > +     node_offset = fdt_subnode_offset(fdt, 0, LUO_FILES_NODE_NAME);
> > +     if (node_offset < 0)
> > +             panic("Failed to find /file-descriptors node\n");
> > +
> > +     ret = fdt_node_check_compatible(fdt, node_offset,
> > +                                     LUO_FILES_COMPATIBLE);
> > +     if (ret) {
> > +             panic("FDT '%s' is incompatible with '%s' [%d]\n",
> > +                   LUO_FILES_NODE_NAME, LUO_FILES_COMPATIBLE, ret);
> > +     }
> > +     luo_fdt_in = fdt;
> > +}
> > +
> > +static void luo_files_recreate_luo_files_xa_in(void)
> > +{
> > +     int parent_node_offset, file_node_offset;
> > +     const char *node_name, *fdt_compat_str;
> > +     struct liveupdate_filesystem *fs;
> > +     struct luo_file *luo_file;
> > +     const void *data_ptr;
> > +     int ret = 0;
> > +
> > +     if (luo_files_xa_in_recreated || !luo_fdt_in)
> > +             return;
> > +
> > +     /* Take write in order to gurantee that we re-create list once */
>
> Typo: s/gurantee/guarantee

Done, thanks.

>
> > +     down_write(&luo_filesystems_list_rwsem);
> > +     if (luo_files_xa_in_recreated)
> > +             goto exit_unlock;
> > +
> > +     parent_node_offset = fdt_subnode_offset(luo_fdt_in, 0,
> > +                                             LUO_FILES_NODE_NAME);
> > +
> > +     fdt_for_each_subnode(file_node_offset, luo_fdt_in, parent_node_offset) {
> > +             bool handler_found = false;
> > +             u64 token;
> > +
> > +             node_name = fdt_get_name(luo_fdt_in, file_node_offset, NULL);
> > +             if (!node_name) {
> > +                     panic("Skipping FDT subnode at offset %d: Cannot get name\n",
> > +                           file_node_offset);
>
> Should failure to parse a specific FD really be a panic? Wouldn't it be
> better to continue and let userspace decide if it can live with the FD
> missing?

This is not safe, the memory might be DMA or owned by a sensetive
process, and if we proceed liveupdate reboot without properly handling
memory, we can get corruptions, and memory leaks. Therefore, during
liveupdate boot if there are exceptions, we should panic.

> > +             }
> > +
> > +             ret = kstrtou64(node_name, 0, &token);
> > +             if (ret < 0) {
> > +                     panic("Skipping FDT node '%s': Failed to parse token\n",
> > +                           node_name);
> > +             }
> > +
> > +             fdt_compat_str = fdt_getprop(luo_fdt_in, file_node_offset,
> > +                                          "compatible", NULL);
> > +             if (!fdt_compat_str) {
> > +                     panic("Skipping FDT node '%s': Missing 'compatible' property\n",
> > +                           node_name);
> > +             }
> > +
> > +             data_ptr = fdt_getprop(luo_fdt_in, file_node_offset, "data",
> > +                                    NULL);
> > +             if (!data_ptr) {
> > +                     panic("Can't recover property 'data' for FDT node '%s'\n",
> > +                           node_name);
> > +             }
> > +
> > +             list_for_each_entry(fs, &luo_filesystems_list, list) {
> > +                     if (!strcmp(fs->compatible, fdt_compat_str)) {
> > +                             handler_found = true;
> > +                             break;
> > +                     }
> > +             }
> > +
> > +             if (!handler_found) {
> > +                     panic("Skipping FDT node '%s': No registered handler for compatible '%s'\n",
> > +                           node_name, fdt_compat_str);
>
> Thinking out loud here: this means that by the time of first retrieval,
> all file systems must be registered. Since this is called from
> luo_do_files_finish_calls() or luo_retrieve_file(), it will come from
> userspace, so all built in modules would be initialized by then. But
> some loadable module might not be. I don't see much of a use case for
> loadable modules to participate in LUO, so I don't think it should be a
> problem.

Yes, in practice I am against supporting liveupdate for loadable
modules for FDs and devices; however, if userspace decides to use
them, they have to be very careful in terms when data is retrieved,
and when they are loaded.

> > +             }
> > +
> > +             luo_file = kmalloc(sizeof(*luo_file),
> > +                                GFP_KERNEL | __GFP_NOFAIL);
> > +             luo_file->fs = fs;
> > +             luo_file->file = NULL;
> > +             memcpy(&luo_file->private_data, data_ptr, sizeof(u64));
>
> Why not make sure data_ptr is exactly sizeof(u64) when we parse it, and
> then simply do luo_file->private_data = (u64)*data_ptr ?

Because FDT alignment is 4 bytes, we can't simply assign it.

> Because if the previous kernel wrote more than a u64 in data, then
> something is broken and we should catch that error anyway.
>
> > +             luo_file->reclaimed = false;
> > +             mutex_init(&luo_file->mutex);
> > +             luo_file->state = LIVEUPDATE_STATE_UPDATED;
> > +             ret = xa_err(xa_store(&luo_files_xa_in, token, luo_file,
> > +                                   GFP_KERNEL | __GFP_NOFAIL));
>
> Should you also check if something is already at token's slot, in case
> previous kernel generated wrong tokens or FDT is broken?

Good idea, added.

>
> > +             if (ret < 0) {
> > +                     panic("Failed to store luo_file for token %llu in XArray: %d\n",
> > +                           token, ret);
> > +             }
> > +     }
> > +     luo_files_xa_in_recreated = true;
> > +
> > +exit_unlock:
> > +     up_write(&luo_filesystems_list_rwsem);
> > +}
> > +
> [...]
> > diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> > index 7a130680b5f2..7afe0aac5ce4 100644
> > --- a/include/linux/liveupdate.h
> > +++ b/include/linux/liveupdate.h
> > @@ -86,6 +86,55 @@ enum liveupdate_state  {
> >       LIVEUPDATE_STATE_UPDATED = 3,
> >  };
> >
> > +/* Forward declaration needed if definition isn't included */
> > +struct file;
> > +
> > +/**
> > + * struct liveupdate_filesystem - Represents a handler for a live-updatable
> > + * filesystem/file type.
> > + * @prepare:       Optional. Saves state for a specific file instance (@file,
> > + *                 @arg) before update, potentially returning value via @data.
> > + *                 Returns 0 on success, negative errno on failure.
> > + * @freeze:        Optional. Performs final actions just before kernel
> > + *                 transition, potentially reading/updating the handle via
> > + *                 @data.
> > + *                 Returns 0 on success, negative errno on failure.
> > + * @cancel:        Optional. Cleans up state/resources if update is aborted
> > + *                 after prepare/freeze succeeded, using the @data handle (by
> > + *                 value) from the successful prepare. Returns void.
> > + * @finish:        Optional. Performs final cleanup in the new kernel using the
> > + *                 preserved @data handle (by value). Returns void.
> > + * @retrieve:      Retrieve the preserved file. Must be called before finish.
> > + * @can_preserve:  callback to determine if @file with associated context (@arg)
> > + *                 can be preserved by this handler.
> > + *                 Return bool (true if preservable, false otherwise).
> > + * @compatible:    The compatibility string (e.g., "memfd-v1", "vfiofd-v1")
> > + *                 that uniquely identifies the filesystem or file type this
> > + *                 handler supports. This is matched against the compatible
> > + *                 string associated with individual &struct liveupdate_file
> > + *                 instances.
> > + * @arg:           An opaque pointer to implementation-specific context data
> > + *                 associated with this filesystem handler registration.
> > + * @list:          used for linking this handler instance into a global list of
> > + *                 registered filesystem handlers.
> > + *
> > + * Modules that want to support live update for specific file types should
> > + * register an instance of this structure. LUO uses this registration to
> > + * determine if a given file can be preserved and to find the appropriate
> > + * operations to manage its state across the update.
> > + */
> > +struct liveupdate_filesystem {
> > +     int (*prepare)(struct file *file, void *arg, u64 *data);
> > +     int (*freeze)(struct file *file, void *arg, u64 *data);
> > +     void (*cancel)(struct file *file, void *arg, u64 data);
> > +     void (*finish)(struct file *file, void *arg, u64 data, bool reclaimed);
> > +     int (*retrieve)(void *arg, u64 data, struct file **file);
> > +     bool (*can_preserve)(struct file *file, void *arg);
> > +     const char *compatible;
> > +     void *arg;
>
> What is the use for this arg? I would expect one file type/system to
> register one set of handlers. So they can keep their arg in a global in
> their code. I don't see why a per-filesystem arg is needed.

I think, arg is useful in case we support a subsystem is registered
multiple times with some differences: i.e. based on mount point, or
file types handling. Let's keep it for now, but if needed, we can
remove that in future revisions.

> What I do think is needed is a per-file arg. Each callback gets 'data',
> which is the serialized data, but there is no place to store runtime
> state, like some flags or serialization metadata. Sure, you could make
> place for it somewhere in the inode, but I think it would be a lot
> cleaner to be able to store it in struct luo_file.
>
> So perhaps rename private_data in struct luo_file to say
> serialized_data, and have a field called "private" that filesystems can
> use for their runtime state?

I am not against this, but let's make this change when it is actually
needed by a registered filesystem.

Thanks,
Pasha
