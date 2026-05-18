Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD1B48C3ED
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122840; cv=none; b=B/hDwBsrpRGftYQkVXk9iVUvLIU+TaC66Gb1/W/jTUAjXv0wbCK1M2l0aGoyI6gvwMtt/fzXUjhXVtYiRhCJDL0rQ4PunkTTzjf1rSGCjUJ121E85/NBgRavVm8UhOPcTpA4wZIg4UO7k+paxXCXFQWLvknBXDM0T3rik0QX5H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122840; c=relaxed/simple;
	bh=uZJ/xSOMto8dGbxnTVpZw9SBqppTOhKt7BGw30Zdg+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZFgytV+XIBdgusEGW/vPxtBfcfM1F/ZW0DOROY1uRWiVGkxkZXQpZaYlV7z+Q6L/vydIT1R3NdHh/1DpSsyETFJmB4Qg7l0IlDKQO+/CxdhjkPVluvdZYOhZxZEY2kqeWSzLlLI9fRCyqElehetvsBxJjEpEr9pN8wDgn4syG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nKukTcqo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nKukTcqo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b46da8c48eso1625ad.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 09:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779122838; x=1779727638; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fRb534kT/Y8t4mzJvcjyqqGoTPac4Acgjf8YBCzvDuA=;
        b=nKukTcqo6THU3OJrpAZjK+bkMEcD/wiQoHRer+Og2CBzHbtgb4Sxvj6QI0GyTuQyoH
         c45n5GNsFhUTLX42jW7A1iDGbJzepcqxkrQnL8ZYFZ9/2sleWwKrNS44PGA1MNTwiYV4
         RN/QCeg87CWqEBqb9FBJ6AE1L8SB7Zb+Fic1/gahaHux++tEmJS5cs4fkZUBx4V88e39
         FrejJ/ET+aasIe8L3bLmMBbBvW+Mp/rSNoJnoi3Jt5uTg31e3nRPIW88BBcJKUEhPucU
         Ko4KIVt0GjTqhxfGBGz8e5dqiuEfPvnhECe+0LvEPS4MH/r86qWzgr8wBfcY2bJApQg6
         pVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122838; x=1779727638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRb534kT/Y8t4mzJvcjyqqGoTPac4Acgjf8YBCzvDuA=;
        b=I+GxBPlu/c1nBMgq4Z4VTGW6aTIUARRMrWc+50q0VdUHmFnpQCI1rfpructEZXhHRD
         tHoU5poV7cUdTOd0kjWuked8fVnk4oSqF2PcdprAT6U/lRP1NgaibI2dKcgmvVzFF2Ii
         38yOIE9QjPu49d8Kke22h+09M14ADSGACfbAyM12Zidpt0/2MSdMJx7XLII5y3mwvqlI
         YqQMNJdFniE8pDrrdrbVLVztfLBLjmzHRKFP2UNL4T0v06fvCx+V9ZFz7+Cz+85LGoa5
         ErkFk2bVkz/7D4HlTLA7JlqHAAPkIpic5bJ9RWi0o4vlBTd+uRmQ+pqlZ24bbfvvwiG8
         yJkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8un7D597IwCsecFX6H+KIuGBtCDm5kwf0CM7yHPm7c69D/CFiCVjQqZIipNpiSUYGexInJ3BjaTng=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrf3kVNUbLa61Oq+pumaykAg5GvmRhpYGj7484wEoJCAU6WTD1
	Jhr9Kdp7cqDtukk0cYCkzjppWPfa3i4P8iurYzkVTCsLVoOyelBvDzxLJ5JOHOYx+g==
X-Gm-Gg: Acq92OGi98VH7BErxsaGKLZ4vq38pxhBGxsChhZaXWrtd5FXptLcwmt3u2uiApwmdfS
	pPlpAEpULmBx0sdIywc3tGMB39ApD3J3y0SZ68cRgEY+XrQnhqcVGeT0Lm0RARtL2lTvxCFBqCh
	dMxBNLSaRd/hDeuvsXk72/mlJuAw+GjtT1xd5wMl4oFnf4v8hpofu8c+oO1wJ8vgzkBQcqoyFTu
	iBYueydAYvUolamf1KkesN7CwaKgPfGGdy2Td1/HiNXVx/q59QaJhFPYn6OikWnFd4YZScyYAPO
	D74yxs0uTKiZqH2U5awcs1rq7h3bKCzm9p53TkTC/oortxpgoLa2oH2pJEhwMX40wyM529L6ilY
	JgJ4Nwy8kwaaqKTusNxriq7IBHF7vfVIbg5a79gNS7Sw3cCIvvYTqvbFeu9UtxmyZQ7WfTmPtvW
	X5i7GfaUqxpTEuU6dG1BYvIzufilMhqEjGv/S3UkK7ABq9OnUB1WVPqYjos3mQ/VDVJIQpJPQ=
X-Received: by 2002:a17:902:e550:b0:2b4:6153:e541 with SMTP id d9443c01a7336-2bdb3064621mr2846235ad.3.1779122837181;
        Mon, 18 May 2026 09:47:17 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bafb0a3esm14196811a12.0.2026.05.18.09.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:47:16 -0700 (PDT)
Date: Mon, 18 May 2026 09:47:12 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, 
	ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, 
	apopple@nvidia.com, chrisl@kernel.org, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kevin.tian@intel.com, leon@kernel.org, 
	leonro@nvidia.com, lukas@wunner.de, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yi.l.liu@intel.com
Subject: Re: [PATCH v4 05/16] vfio: Enforce preserved devices are retrieved
 via LIVEUPDATE_SESSION_RETRIEVE_FD
Message-ID: <20260518164045.GB3281683.vipinsh@google.com>
References: <20260511234802.2280368-1-vipinsh@google.com>
 <20260511234802.2280368-6-vipinsh@google.com>
 <65228806-6ed3-4577-9037-13fd5eb8f9b6@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65228806-6ed3-4577-9037-13fd5eb8f9b6@linux.dev>

On Sun, May 17, 2026 at 12:04:04PM -0700, Zhu Yanjun wrote:
> 
> 在 2026/5/11 16:47, Vipin Sharma 写道:
> > From: David Matlack <dmatlack@google.com>
> > 
> > Enforce that files for incoming (preserved by previous kernel) VFIO
> > devices are retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD rather than by
> > opening the corresponding VFIO character device or via
> > VFIO_GROUP_GET_DEVICE_FD.
> > 
> > Both of these methods would result in VFIO initializing the device
> > without access to the preserved state of the device passed by the
> > previous kernel.
> > 
> > Reviewed-by: Pranjal Shrivastava <praan@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > Co-developed-by: Vipin Sharma <vipinsh@google.com>
> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
> > ---
> >   drivers/vfio/device_cdev.c             |  8 ++++++++
> >   drivers/vfio/group.c                   |  9 +++++++++
> >   drivers/vfio/pci/vfio_pci_liveupdate.c |  6 ++++++
> >   drivers/vfio/vfio.h                    | 18 ++++++++++++++++++
> >   4 files changed, 41 insertions(+)
> > 
> > diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> > index 1ab07ccaf3ab..4df0495941c6 100644
> > --- a/drivers/vfio/device_cdev.c
> > +++ b/drivers/vfio/device_cdev.c
> > @@ -49,6 +49,14 @@ static int vfio_device_cdev_open(struct vfio_device *device, struct file **filep
> >   		}
> >   		*filep = file;
> > +	} else if (vfio_liveupdate_incoming_is_preserved(device)) {
> > +		/*
> > +		 * Since it is live update preserved device, it must be
> > +		 * retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD instead of
> > +		 * opening /dev/vfio/devices/vfioX.
> > +		 */
> > +		ret = -EBUSY;
> > +		goto err_free_device_file;
> 
> When vfio_liveupdate_incoming_is_preserved(device) returns true,
> vfio_device_put_registration(device) is not called in this path.
> 
> Is vfio_device_put_registration(device) instead invoked from the
> err_free_device_file error handling path?

Yes, at the end of vfio_device_cdev_open(), goto label first frees the
device file object and then calls the vfio_device_put_registration().
This is the same error handlign flow as in the if(!file) {} code in the
above function.

