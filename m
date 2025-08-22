Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446DB2ECE8F
	for <linux-doc@vger.kernel.org>; Fri, 22 Aug 2025 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755866916; cv=none; b=F3oJ8rOG45jvqi+SeezgRoeFIATJpk60KUpBBUKXDAMKEycVGnSmpsbtzruS7mlkTDxaLkNXRA7xbpNLnUxFd8PNOl+Q/duQKAE88AMOjENQyzvdwWaoPq0rQeVdfMSMQ6tyyw1oXZLygMK7XTNR/sHttBf13cF5Qc84uzuh08Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755866916; c=relaxed/simple;
	bh=YYE5x3rpclM2L3Vjf+QXn3YHsE6nuL4ZAjscgygCnLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRJ3KhXgDNRYCfHMwQfP5MmpUAwUVPB7ap0X5pYbbegMdNoJjfv3Ad/T/3JjcPOFcljwfDsahOJl8YmbsdZpfMKfgjzvbTarUtvmX5NfVQ4SxKQB+h2GScErp5QZ7FERwczB972jp3GwjaWBs6mU/Q9yHiERMtV9Jf61Z2vFGeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+lwg6V/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+lwg6V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755866914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbVxxqHKodZYFsug0blUFZKne7Mtc5nkor9jm2rzIMY=;
	b=X+lwg6V/tsyqsdnTjfTw0mhQiP4HDdgDrhvh70E6+L4CE7IUChXnHwtVdRwtr813/2khKq
	v30fPC2pejK7u9ZxriWBfypSLCMpc+OMb4KF4NPeQGnjGLAukxsMCoQ6doRUj0gr1GkKhG
	Aafciu6dFfidcWWh8X/ww/yGz1/2OjM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-1ezmZjaXNceF01dQ4WLjSw-1; Fri, 22 Aug 2025 08:48:32 -0400
X-MC-Unique: 1ezmZjaXNceF01dQ4WLjSw-1
X-Mimecast-MFC-AGG-ID: 1ezmZjaXNceF01dQ4WLjSw_1755866912
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e864817cb8so845177185a.0
        for <linux-doc@vger.kernel.org>; Fri, 22 Aug 2025 05:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755866912; x=1756471712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbVxxqHKodZYFsug0blUFZKne7Mtc5nkor9jm2rzIMY=;
        b=ZsYWttbQkPgYv17TQniwW2Fhs3J64KlQytSQ5TJcxOMeOmZy/0e/gtkv7bNb24NMC1
         usq7hjIGyBbxHyImh4KybrGQ69lFcZDVPdkQtXN8OabJN/3KaBTH9H0titIm+z4vyLKc
         dsW/HU22eVkTvcPqIdd+Q2nQfDln/UJX5LhdKl1sP5L7z7213ngj9KfHSLWdTzHKrqQ2
         qFHXJb6pkCfi5s/QWATpD25rSiNIc7cYiafP5I49TmCqBdVD19JBZ7owTU4WJdNSjCzL
         arIoT4FD2GZpWLQivxKwKgxwzFlXLJ2redENATxXJDyiHxyNEbtAh8B2rOmd5AYWWpIf
         FiZA==
X-Forwarded-Encrypted: i=1; AJvYcCVMtQMhEjNVMq0JKvaxS7N8EIHGQ5JUxn75nBxSmRnS25mkzEHtL2fV58QG8XmEN9lLRw4gpqsJ4lI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81VdmJXIfLrBGNWGobGCnW9JErLMlZHe46pE0+UeLogpE8483
	wXN+sMaulDKGY2XaMpyNiHsQYYhajXXxYRLCu2ghg/eten+/KG6WkxIppMisjyod68k1NFfMxEI
	IMyaYjhX/fRLXxFesOF7a4U1pjSkdUxUAE+83nexw8wlqcrj1R20qM3lVP1ZR91snDiZ+swvocJ
	lPRyZCwJoPJxS6JU/iZ3N3mTmlxb0aOw0DefdR
X-Gm-Gg: ASbGnctApFj2xrd20Fr6bLUq6v9z+yY3bWvNqlVZdYzm4UbbWaXj/mRdc6n7UtIm/yk
	2Y4G3KRgsmNnDk/pek+A3EeDvSmI4c3esWdGXbicp2zQXSw2C0zz/2hfYOpeEBdL5P0eSaBTehD
	oeMg5hpNJ8AHkSkQtPVGV/4ieReuVZWH5puQQ44/1bY5SR2tiTIfxn
X-Received: by 2002:a05:622a:2b06:b0:4b2:8ac5:2594 with SMTP id d75a77b69052e-4b2aaf88157mr32970341cf.39.1755866912242;
        Fri, 22 Aug 2025 05:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGclQR87zmWeT+VM3r9gdWgWNuVTR3jL5gvhn+oOXtGpF8D4a5y/GyCDWpLgzvoOApqTGx9rQ3k9v8uTyYsc/g=
X-Received: by 2002:a05:622a:2b06:b0:4b2:8ac5:2594 with SMTP id
 d75a77b69052e-4b2aaf88157mr32970021cf.39.1755866911689; Fri, 22 Aug 2025
 05:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815121459.3391223-1-lichliu@redhat.com> <20250821-zirkel-leitkultur-2653cba2cd5b@brauner>
In-Reply-To: <20250821-zirkel-leitkultur-2653cba2cd5b@brauner>
From: Lichen Liu <lichliu@redhat.com>
Date: Fri, 22 Aug 2025 20:48:20 +0800
X-Gm-Features: Ac12FXwQJbPmbQRxMp7qGDkCOTeicgMXQCgW-fagYfwyy8_vEsAkdFyogKGO5Zk
Message-ID: <CAPmSd0MikBnSRvMvb5eTa=WZrfsjP-Wy11PSCRY4X7u4=T-bUg@mail.gmail.com>
Subject: Re: [PATCH v2] fs: Add 'rootfsflags' to set rootfs mount options
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	safinaskar@zohomail.com, kexec@lists.infradead.org, rob@landley.net, 
	weilongchen@huawei.com, cyphar@cyphar.com, linux-api@vger.kernel.org, 
	zohar@linux.ibm.com, stefanb@linux.ibm.com, initramfs@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, viro@zeniv.linux.org.uk, 
	jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for reviewing and merging the code!

I used "rootfsflags" here because it is shown as "rootfs" in the mountinfo.

My opinion on naming is similar to Rob=E2=80=99s. However, for me, the func=
tion=E2=80=99s
implementation is more important than the variable names, so I don=E2=80=99=
t have a
strong opinion on this.

(Christian may see this message twice, sorry for that because I clicked rep=
ly
button instead of reply-all)

Thanks,
Lichen

On Thu, Aug 21, 2025 at 4:26=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Fri, 15 Aug 2025 20:14:59 +0800, Lichen Liu wrote:
> > When CONFIG_TMPFS is enabled, the initial root filesystem is a tmpfs.
> > By default, a tmpfs mount is limited to using 50% of the available RAM
> > for its content. This can be problematic in memory-constrained
> > environments, particularly during a kdump capture.
> >
> > In a kdump scenario, the capture kernel boots with a limited amount of
> > memory specified by the 'crashkernel' parameter. If the initramfs is
> > large, it may fail to unpack into the tmpfs rootfs due to insufficient
> > space. This is because to get X MB of usable space in tmpfs, 2*X MB of
> > memory must be available for the mount. This leads to an OOM failure
> > during the early boot process, preventing a successful crash dump.
> >
> > [...]
>
> This seems rather useful but I've renamed "rootfsflags" to
> "initramfs_options" because "rootfsflags" is ambiguous and it's not
> really just about flags.
>
> Other than that I think it would make sense to just raise the limit to
> 90% for the root_fs_type mount. I'm not sure why this super privileged
> code would only be allowed 50% by default.
>
> ---
>
> Applied to the vfs-6.18.misc branch of the vfs/vfs.git tree.
> Patches in the vfs-6.18.misc branch should appear in linux-next soon.
>
> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
>
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.
>
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. If in doubt, please check the listed branch.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> branch: vfs-6.18.misc
>
> [1/1] fs: Add 'rootfsflags' to set rootfs mount options
>       https://git.kernel.org/vfs/vfs/c/278033a225e1
>

