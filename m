Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0622E222586
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754324767; cv=none; b=BKpS58VSV/am0RlbKbH7foMq6GPXSyV6Rbds7kTr49aKpjqr+vXAZLtFC+BmAzFv464hGepkHcYUoRkI1i9feck52Yn3DtiwBMzteNZUOr41Q04RCUGIjn7KyLwHXzeZYLLevwzT7uQbuh/SGJBtKW4f0IZbRsJC2/lnU/R55Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754324767; c=relaxed/simple;
	bh=R218sPVSXYnFCGqZb+b/cH4HzZ5xrpQ7AYZGd9GOFz4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=efpJxdDEx6pb6Re7DKe8iRVw58hBdZB1g/QISgbLF3538g16nHvFm4kZKF3F5o8f/JBc6PYcFtPVix9xl8nXoFyKfv0nERCQhvsfTPG4xcjq5p6wQ61LErj4FlFqqhX9tBE0ojOljIr8jrq2sIhEeqMgvRnYKMb2Wo7fsu6UTV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4NhubTU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4NhubTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754324764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sn5uts2CJYwTpLEONTKxRvUqhKZom385WAkIxWVvqP8=;
	b=S4NhubTU8HOTppy5zpxKHczTzjwf9HgOjasgiwupy9dUaegsAfpQ3Bz+clD8wwpb4tkZo6
	yJE5pANDZMjWtLWVpj7AObXuYT4kypdRg/8ZRaU3+uRCLd0UJkqB2Nk4EViQ2KFmPEQScK
	mOw3EcZ3Q0DIEzXEdDrAfmJTWe1WNSg=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-6peh96YHPhqtOqQ25p0QYw-1; Mon, 04 Aug 2025 12:26:03 -0400
X-MC-Unique: 6peh96YHPhqtOqQ25p0QYw-1
X-Mimecast-MFC-AGG-ID: 6peh96YHPhqtOqQ25p0QYw_1754324763
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3e3fee1d6f2so5303005ab.2
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 09:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754324763; x=1754929563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sn5uts2CJYwTpLEONTKxRvUqhKZom385WAkIxWVvqP8=;
        b=kelknfW6eUiZQDNjwfykp5DORJO2+roPQoFlIEl6ASinqtczCgS3EDB9/0TKG5AsSl
         wsJ9eqGEV9OxGETOc23cp3eiJu8qjxOcEJXZ6UMWTYbbvcLASqoo7U+j5is0QdeUGbye
         klW2rMSiA9UU/7OuJkpv/Kffdldf6T40c9+GX4FnQnOA8Yn9Oqe8b0VaGKOmrQ06A563
         qYl7E5HwTWVVAHZTARxCA/re1GAdziELHM8K2cPlnfTBSGfUZpsGG757DGOm3D4dhVtP
         cdYHd+J9CzujIpzphyZaSWrjB8A85xlZcs0xTX+VmwX8Wt9vtImd5gKI8/2De2m6yMNf
         hTDg==
X-Forwarded-Encrypted: i=1; AJvYcCWbtltOb/QCvFIJO6mCha6g03lRo36yr91gz5wV25Z12CZctmyQy847kSUhUofCdXEZkaG/r6h93v8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVeOIaMQLqgIT/uNxRc2WGYLhelmWZ5+FTIvfbtkE79Nytd49i
	sVaMor/VA9fhDaPtb/gzX7A6JBYh7n1tnwNatZt9Q/B97Vxv+Gj7Bs/1wyyeAWjOqs5OcZu5NqX
	D5n6uzfi6FDFZ3tRczecLSjwp98MyuJ3X0zwwtEvFY08TvzrKbDwimRr1K4/8sw==
X-Gm-Gg: ASbGncsWtww6mWv0sWe3Y4saWvuhToggczt2Kpy6Edzh3qZxwmCke8oGTmtfeuGa81D
	ZL04WGnFHrJzZR3InahjVuhjXZSeMDdxYDF+C9Ih8U8p4pU12vUaQOPiv+kLuX0QSkFZ+XZo84h
	Dno2llJ6hUos9THvjvJOo7bCfYO5aEutsPPKjFar5O9sS9YM6W/WGKDEZPNNM2iBhyVql0caJg4
	ntFlG7D6D+eMdcw18U4zbsY6qmkFvdrB1VroC33iwYHBceCBqSnubjLjYt8sMdL6xNajX+NDIPa
	KSWPb/fbrbhlpM43cr3FTYZcx2coep1+1BRHE2ROj/c=
X-Received: by 2002:a05:6e02:3084:b0:3dd:ce1c:f1bc with SMTP id e9e14a558f8ab-3e4161f8ab9mr48406535ab.7.1754324762659;
        Mon, 04 Aug 2025 09:26:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/PktnFn38IcDhPnUKHUSzBQWRLjAnmL+eMF8KeCeGRLPNsN/Ln/N48PmpMDQmWQ53TzUUGA==
X-Received: by 2002:a05:6e02:3084:b0:3dd:ce1c:f1bc with SMTP id e9e14a558f8ab-3e4161f8ab9mr48406315ab.7.1754324762188;
        Mon, 04 Aug 2025 09:26:02 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b4cfa1sm3276936173.29.2025.08.04.09.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 09:26:01 -0700 (PDT)
Date: Mon, 4 Aug 2025 10:25:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Alex Mastro <amastro@fb.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, Keith
 Busch <kbusch@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>
Subject: Re: [PATCH v3] vfio/pci: print vfio-device syspath to fdinfo
Message-ID: <20250804102559.5f1e8bcf.alex.williamson@redhat.com>
In-Reply-To: <20250801-show-fdinfo-v3-1-165dfcab89b9@fb.com>
References: <20250801-show-fdinfo-v3-1-165dfcab89b9@fb.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 1 Aug 2025 13:50:56 -0700
Alex Mastro <amastro@fb.com> wrote:

> Print the PCI device syspath to a vfio device's fdinfo. This enables tools
> to query which device is associated with a given vfio device fd.
> 
> This results in output like below:
> 
> $ cat /proc/"$SOME_PID"/fdinfo/"$VFIO_FD" | grep vfio
> vfio-device-syspath: /sys/devices/pci0000:e0/0000:e0:01.1/0000:e1:00.0/0000:e2:05.0/0000:e8:00.0
> 
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
> Changes in v3:
> - Remove changes to vfio_pci.c
> - Add section to Documentation/filesystems/proc.rst
> - Link to v2: https://lore.kernel.org/all/20250724-show-fdinfo-v2-1-2952115edc10@fb.com
> Changes in v2:
> - Instead of PCI bdf, print the fully-qualified syspath (prefixed by
>   /sys) to fdinfo.
> - Rename the field to "vfio-device-syspath". The term "syspath" was
>   chosen for consistency e.g. libudev's usage of the term.
> - Link to v1: https://lore.kernel.org/r/20250623-vfio-fdinfo-v1-1-c9cec65a2922@fb.com
> ---
>  Documentation/filesystems/proc.rst | 14 ++++++++++++++
>  drivers/vfio/vfio_main.c           | 20 ++++++++++++++++++++
>  include/linux/vfio.h               |  2 ++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> index 2a17865dfe39..fc5ed3117834 100644
> --- a/Documentation/filesystems/proc.rst
> +++ b/Documentation/filesystems/proc.rst
> @@ -2162,6 +2162,20 @@ DMA Buffer files
>  where 'size' is the size of the DMA buffer in bytes. 'count' is the file count of
>  the DMA buffer file. 'exp_name' is the name of the DMA buffer exporter.
>  
> +VFIO Device files
> +~~~~~~~~~~~~~~~~
> +
> +::
> +
> +	pos:    0
> +	flags:  02000002
> +	mnt_id: 17
> +	ino:    5122
> +	vfio-device-syspath: /sys/devices/pci0000:e0/0000:e0:01.1/0000:e1:00.0/0000:e2:05.0/0000:e8:00.0
> +
> +where 'vfio-device-syspath' is the sysfs path corresponding to the VFIO device
> +file.
> +
>  3.9	/proc/<pid>/map_files - Information about memory mapped files
>  ---------------------------------------------------------------------
>  This directory contains symbolic links which represent memory mapped files
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 1fd261efc582..37a39cee10ed 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -28,6 +28,7 @@
>  #include <linux/pseudo_fs.h>
>  #include <linux/rwsem.h>
>  #include <linux/sched.h>
> +#include <linux/seq_file.h>
>  #include <linux/slab.h>
>  #include <linux/stat.h>
>  #include <linux/string.h>
> @@ -1354,6 +1355,22 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
>  	return device->ops->mmap(device, vma);
>  }
>  
> +#ifdef CONFIG_PROC_FS
> +static void vfio_device_show_fdinfo(struct seq_file *m, struct file *filep)
> +{
> +	char *path;
> +	struct vfio_device_file *df = filep->private_data;
> +	struct vfio_device *device = df->device;
> +
> +	path = kobject_get_path(&device->dev->kobj, GFP_KERNEL);
> +	if (!path)
> +		return;
> +
> +	seq_printf(m, "vfio-device-syspath: /sys%s\n", path);
> +	kfree(path);
> +}
> +#endif
> +
>  const struct file_operations vfio_device_fops = {
>  	.owner		= THIS_MODULE,
>  	.open		= vfio_device_fops_cdev_open,
> @@ -1363,6 +1380,9 @@ const struct file_operations vfio_device_fops = {
>  	.unlocked_ioctl	= vfio_device_fops_unl_ioctl,
>  	.compat_ioctl	= compat_ptr_ioctl,
>  	.mmap		= vfio_device_fops_mmap,
> +#ifdef CONFIG_PROC_FS
> +	.show_fdinfo	= vfio_device_show_fdinfo,
> +#endif
>  };
>  
>  static struct vfio_device *vfio_device_from_file(struct file *file)
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 707b00772ce1..54076045a44f 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -16,6 +16,7 @@
>  #include <linux/cdev.h>
>  #include <uapi/linux/vfio.h>
>  #include <linux/iova_bitmap.h>
> +#include <linux/seq_file.h>
>  
>  struct kvm;
>  struct iommufd_ctx;
> @@ -135,6 +136,7 @@ struct vfio_device_ops {
>  	void	(*dma_unmap)(struct vfio_device *vdev, u64 iova, u64 length);
>  	int	(*device_feature)(struct vfio_device *device, u32 flags,
>  				  void __user *arg, size_t argsz);
> +	void	(*show_fdinfo)(struct vfio_device *device, struct seq_file *m);
>  };

Changes in this file look spurious, vfio_device_ops vs
vfio_device_fops?  Nothing implements or consumes the vfio_device_ops
callback here.  Thanks,

Alex

