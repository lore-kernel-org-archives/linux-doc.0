Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215A1331217
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 23:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149249; cv=none; b=GNDeTBXkbt44W1066plHqSjqktes7MgmERUofvkv4ibHXS7aFIoYY9QEh9qODuiRqq53hIWP5zESodDtmerAH9GoZ1jP5t+iT4/sro64bqeD9N0VCy0f9uH6/GMiX9JYy+ZrkLr1By40ImsMVZ/uLCp9OSlR1Cs6G45XkA3U714=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149249; c=relaxed/simple;
	bh=773E1Qu3WZaNjUpNYslYsC6fIc6QMX05+z2A/JT5Lmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWJ1gMQm/cqouckCtMdvLllSr/hHFDByowGNwYlavG3wqtEdNtuslVrQYzuj2laxR88Cu9g2DwoNDmQgdhuQ9YgQV8dhYcTI/gU5Fa83kyvDlq0kkV2os8Ir3ZU+OOppiSjKorMqourWl+XusOVuk0St0nzn8r6pKzMbJkNuL2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hzfEJy+/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hzfEJy+/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad9a9be502so9752005ad.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 15:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772149247; x=1772754047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dweZEP9P9syIIaIBNbJewu0YbCAV1KvejPrlkY4pDLk=;
        b=hzfEJy+/xVgMtXdTO18W8dd4TxjvUCU3ZO16mrYqOOWsNM3Cfj7xMKd7kOOeIqtHyO
         Bo7rfUDvMguucNMGYkRu0SYWYxm+MXGm5jdnkFayBykV3x/0dvRIMYw8eWrh/6ym+JQU
         rEZGESpNfJQUH/FKbTsOeOmFQ/XEsY4woCWZiBO5FSetVDJSUEZSkkvqG3JVZn8sWorh
         sNEumiWGre3q7OVZGoTe1clgaEMhB8jOemrj69eWBC//eGPOtk//SWjUpJVRBrcjheGj
         j6JSOvbi0iTH/nHPYjXvCtefKb9o7tw/8VOHqXWiZfdHoM0iS7dOZZI/UXh9pXMWiSN1
         iZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149247; x=1772754047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dweZEP9P9syIIaIBNbJewu0YbCAV1KvejPrlkY4pDLk=;
        b=iPv1xl9jptcljHlZNgab46HdJqkB7W8XplOL4yfDZ6LDab2LOoDieszEgNH5Csl6BA
         DaG+0Vh2ecGoFWn3yxxM5DC7LJdEe/UOhF6XjfFp/6vmZiMEHpZk5tA60e7C3Gu5qst9
         X4ao54qKtfr6i99XB7z/FEiYFVlUemNP3fYe15MKeAhnb3TkrZSzDinBZZ21/PY/Rycd
         JZXtyEdcf6gXq7oJmJcKFFROeQ1TUJv04VEiEuveKdeSblwKUjxE1XyvuqmRgl41W5Yj
         cFVPneg39fVZJYQ7MkR5UG/E+hbWZyNBLzfLys0YFHvrz8r/u+OSx0kSqlzEecOe1AbR
         JYRA==
X-Forwarded-Encrypted: i=1; AJvYcCWkOriLkmVMZzyz7LOk1nrknlGtLLN/We9KsnrzFj2RxpBmmzo9RFnSHRMwIBY8HKtKFf9bnvnOeVw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqve+PrLT9yh8zuwilez5RUuY/5rLR99h/eMmI7hef6jcFK1NE
	tcNweg45O6nhzKSvMJll/baq2X6O9Y64MwMnHhHvCkmG8S2I6wEzp6n96rfrkR1Wsg==
X-Gm-Gg: ATEYQzwoS1o2ID8hgDWksKW6US16iAjED/VDL3h9Wnv+kJvKs5LcWjM86BTOePhdY47
	roLnuj3Xgp6GUpFPosuyPBqQMRonDKdTj+UuzN2zeVmMG/o3AcUW3+QBQgzUro3IdTWCRLMJKT0
	boMOC2iPg/uFwRV7wwXWsfXSn5faxFdcUr5F/w16CxFJiKvRo0wLgsOSkvP2b6vDtYaZFsv4poQ
	YvzErX+yJEMb9b2ejSkIY7fW7EKRcDGj+yQ3tLb8VKxjIxdBR4rUe+3ZEj3b/FI+ddNo0ZvsNq1
	S9BDI8Vlcg4a0j/BbFqOH8xGVvmN6iIRA8GWM0ErsmPbHk48IKVa7BgC2f+i7NrUr1IlNdbG6xX
	2ZkayIIHMHoDMXuDh6YRp/QSk7oCvDGFTQvzkluIkDSy+2V/bLRKa0s0cUw8u2T8ngHv91P1F1A
	gpQ0b3ASQVEps8vGFz53552lSoR3jenk5fGg+jy/UKhTVxzqI+NfVrUJVnoEWtZw==
X-Received: by 2002:a17:903:22c9:b0:2ad:cede:3a18 with SMTP id d9443c01a7336-2ae2e46bd8emr6748745ad.33.1772149246778;
        Thu, 26 Feb 2026 15:40:46 -0800 (PST)
Received: from google.com (239.23.105.34.bc.googleusercontent.com. [34.105.23.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b257esm36167495ad.4.2026.02.26.15.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:40:45 -0800 (PST)
Date: Thu, 26 Feb 2026 23:40:41 +0000
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
Subject: Re: [PATCH v2 06/22] vfio/pci: Retrieve preserved device files after
 Live Update
Message-ID: <aaDZ-ffs4kiUo3GY@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-7-dmatlack@google.com>
 <20260226155222.5452a741@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226155222.5452a741@shazbot.org>

On 2026-02-26 03:52 PM, Alex Williamson wrote:
> On Thu, 29 Jan 2026 21:24:53 +0000 David Matlack <dmatlack@google.com> wrote:

> > diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
> > index 8ceca24ac136..935f84a35875 100644
> > --- a/drivers/vfio/device_cdev.c
> > +++ b/drivers/vfio/device_cdev.c
> > @@ -52,6 +46,19 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
> >  	vfio_device_put_registration(device);
> >  	return ret;
> >  }
> > +EXPORT_SYMBOL_GPL(__vfio_device_fops_cdev_open);
> 
> I really dislike that we're exporting the underscore variant, which
> implies it's an internal function that the caller should understand the
> constraints, without outlining any constraints.
> 
> I'm not sure what a good alternative is.  We can drop fops since this
> isn't called from file_operations.  Maybe vfio_device_cdev_open_file().

Ack. Due to the bug you pointed out below, I think the changes in this
file will look fairly different in the next version. But no matter what
I'll avoid exporting a underscore variant without outlining the
constraints.

> > +	/*
> > +	 * Simulate opening the character device using an anonymous inode. The
> > +	 * returned file has the same properties as a cdev file (e.g. operations
> > +	 * are blocked until BIND_IOMMUFD is called).
> > +	 */
> > +	file = anon_inode_getfile_fmode("[vfio-device-liveupdate]",
> > +					&vfio_device_fops, NULL,
> > +					O_RDWR, FMODE_PREAD | FMODE_PWRITE);
> > +	if (IS_ERR(file)) {
> > +		ret = PTR_ERR(file);
> > +		goto out;
> > +	}
> > +
> > +	ret = __vfio_device_fops_cdev_open(device, file);
> > +	if (ret) {
> > +		fput(file);
> 
> Don't we end up calling vfio_device_fops.release with NULL
> file->private_data here with inevitable segfaults?  Thanks,

Yes indeed. In that case I think we need to call
vfio_device_try_get_registration() and vfio_allocate_device_file()
before anon_inode_getfile_fmode(). We could play games with file->fops
to avoid it calling vfio_device_fops.release here instead, but that
feels hacky.
