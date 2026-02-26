Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB4329E6B
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 23:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772148475; cv=none; b=nFTlCl79mtaDV9MY6XAVgehqUrp/FB2+zg7S0QCu/20t0Gpk5zeMKLVE8h0MOry85cVY5NZzhIKT/XchVRMNrzmU2Zl/aZGoGhrK64GwPkInPYYtVJQJK5dY+2gtEuLQFyfDxsjU+cEoyfZFBGsXcfgWJFxvrI8uISjJnWmX7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772148475; c=relaxed/simple;
	bh=nN5n0R1KzYPR6gq9Cg8JAJtOp8uZMPH9g3XcUNvBoaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRTEn3d1KkrJCL3pMAYk+hxwpIdnAEJV9p7W+PBKnicZ9esGQ3c1rW/UmUSKZOpgl6l8twZ8zBfYmrFBUWnyF2xZUDsR+lX0KC/aekvJsZedZa0tdujUkHQ/EHgUkFCN177+lrcWbi3owHXysH+VoEPQXfDtEnlNqq485fkoTJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L0okHgCK; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L0okHgCK"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8273eb7798eso555484b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 15:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772148473; x=1772753273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uUrZ9rZ9RlW3x07tCEk7xJ4J4Vz88lZHdKC8XE8Cxsc=;
        b=L0okHgCKUCabiytMNGvBYbMHtStuJdWKE2K4KnP9ytxhmY6s0/WuKJ0p350vQwt7ST
         LimILWhdrT5WLAE4aI25ZKfBq5r+pWEhUow4F6q0Gd4UgpwN/DVmLYp0Yc9vSfiH+OYe
         SahG+vqwdwcCgjjdPrWhoRfiOBsXEOAC/LXrtxgCBLe4TKrdA98/qmBSk5fae0QtMv9N
         ioFWcgtDBYOtn7zY0thjx3jvRvB6yGGmTZuTEZOcxwM2UAdglKK/z/P+rUHQ/TACpelb
         NWgeUMP4s4dqn0WVpOE3wo/ZF5XCvqxfUcGLoJtOvpBOKm2uQSnItmcCggqofWrWX2um
         Owug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772148473; x=1772753273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUrZ9rZ9RlW3x07tCEk7xJ4J4Vz88lZHdKC8XE8Cxsc=;
        b=boVGV4s8qPyYWUas9rEvNw6oJpEGzlNhTZT4Py7dCjs10l0nt/Qic3v5OF+iiKXfN0
         vTyWRENpakjXcuEreBh7LKO1qfuj6v2vqVg+foOclmKXqddKd6fv9w8iYi1spZxG5v4T
         vMhrFtTluXRRfV5Gm37FtNe084myfREusr172ePfELvNE9kWPv4d0v+PUAJn2aAPdJTp
         SWbHyYT/b+f+aQNi7kVljnvIAbUasOVr0lpCh1oQBteK1NxX8qONyp9rA3jfFIEwRh3N
         rHrcA9PTyywir5WTme0/SbIC1e6Y9aRfXCMAXpY57SLJLSmEptNN7FtutjGaXup1arDC
         gcPA==
X-Forwarded-Encrypted: i=1; AJvYcCUDLJ+POOrPCnWzxlD75FJDGCxbJ5g0M9v7NlSrDi38uhds4X3PRreIiLFgSdCCixUHtvBbvezgmOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRkPht6kolwXwnmseeBAjIWAC3bYJfenavlXSdBC1H3Gjk7QpL
	rcLuvS9ycwcDPRrhGd5Zkpv2EuJ/M4mA/t73ErCSFHbvNdKGAXGWD5nrUgHKbcqytg==
X-Gm-Gg: ATEYQzyQbT9OeFDQHILZC8Yd/ph/5BfWNKnFCbrGxlB8HfZ6jo9CrJV2vdHlH7H2UFG
	gGsXAs6tT+tO0klymE6s2OfYPa+IyU0W2yjzR6btTz+aby5Nntp9N00kfdDhY5gstloZj8/LcSQ
	JlBXAhvGRVMEdhK3LNzRQq7vy/EgHDXttBgybkhmUVcJE5FUQFmwqAEGfMJ+ppGWpLudpMYmo4h
	FqSVRXURKLun0Cd7nTlM3hSBwXEL76yXAQAxfvNKf54+yXpP5M/2vEULYkOLiFrV+sMtstct54l
	bdmZNmOwWQoRjehHkwE1Ha/gyEdeJykS0HacFUtxRsJQjIndEP3lUxlzdKeOfdVdCT1yMDlIfrq
	23tk9lSKwwyh/Fkaq4tS60rMxrqdAu4Floob7LJ+RMnoey6slDn+QBmy6XDHcsCmyFfmnJM4hrW
	4TeRzg30CBRaQSvMZDuaJym5VaDYJloMNhRaFCQwGpMBMzTmG3FYwxCMlzD2y2y4UC99pZIfF7
X-Received: by 2002:a05:6a20:1585:b0:38b:e9eb:b12b with SMTP id adf61e73a8af0-395c3ae6d18mr701611637.41.1772148472659;
        Thu, 26 Feb 2026 15:27:52 -0800 (PST)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a03fbsm48080705ad.43.2026.02.26.15.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:27:51 -0800 (PST)
Date: Thu, 26 Feb 2026 23:27:47 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>,
	Alistair Popple <apopple@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org,
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Tomita Moeko <tomitamoeko@gmail.com>,
	Vipin Sharma <vipinsh@google.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 08/22] vfio: Enforce preserved devices are retrieved
 via LIVEUPDATE_SESSION_RETRIEVE_FD
Message-ID: <aaDW86eWuQLZ3cfP@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-9-dmatlack@google.com>
 <20260226161512.532609ec@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226161512.532609ec@shazbot.org>

On 2026-02-26 04:15 PM, Alex Williamson wrote:
> On Thu, 29 Jan 2026 21:24:55 +0000 David Matlack <dmatlack@google.com> wrote:

> > +	/*
> > +	 * This device was preserved across a Live Update. Accessing it via
> > +	 * VFIO_GROUP_GET_DEVICE_FD is not allowed.
> > +	 */
> > +	if (vfio_liveupdate_incoming_is_preserved(device)) {
> > +		vfio_device_put_registration(device);
> > +		return -EBUSY;
> 
> Is this an EPERM issue then?

I was thinking EBUSY in the sense that the device is only temporarily
inaccesible through this interface due it being in a preserved state as
part of a Live Update. Once the preserved device file is retreived and
closed, the device can be accessed again through
VFIO_GROUP_GET_DEVICE_FD.

EPERM might lead to confusion that there is a filesystem permission
issue?

> > +#ifdef CONFIG_LIVEUPDATE
> > +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
> > +{
> > +	struct device *d = device->dev;
> > +
> > +	if (dev_is_pci(d))
> > +		return to_pci_dev(d)->liveupdate_incoming;
> > +
> > +	return false;
> > +}
> > +#else
> > +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
> > +{
> > +	return false;
> > +}
> > +#endif
> 
> Why does this need to be in the public header versus
> drivers/vfio/vfio.h?

No good reason. I'll make it private.
