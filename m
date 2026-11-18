Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988293;
	b=TJ7CqOWvmYr63LDzI5CoIsHBnBBO4dEp274jO6gPVq7n+e+pd49lQg55Wj5k+OTmZPJa
	 9TPMFT8P2V0d3eiaGC+DXScEGn6XCrR/qmt2LiTOvh/O7yjzjI5ZH0wZc2yFzJy9ZM8MJ
	 DjY639GOboJAMp/wHJBXrhIzYuvsnQ1AShohww8m98U0Q1TLZmJEgcaOCdNSzbjItDzAm
	 BX8gIVohsrMq9EaL2+HYq6PjWi8P6/x3cCb/9DmmvepbOYPqLfUP3yA+rMpoZ/HCgWK13
	 aCzCvo4ktrAgnfup5O7mSLK5lE1iH5LGYW/FBFNn1rdY/ce24vl2fivzxjzTCfbtKtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r1RbWjqFm7axK1WA6d2qj68hL+HcVofiqBMMK2TnnVw=;
	b=OO4Q4h3dxtzr4EARTMlcEu/JzNQXzu5X3cZJhk6YRrm9C5Ap4sUoAetUfhGP7P94H7i3
	 VK7XcQDoNaO0xFiEQ1GZHBcp4puY+S8PeJhOzTks3CeRQRkXf2L4vFgkRXRnsEF7DKoXG
	 hy9m4RbNFje81UMf1pbc4XZROBsSLZqgHJ3rQoN/kqnfATJsvn6Qxm2Dk4XHpU3HjKh89
	 SJ/sdlUTsMaBeEa7S7GQ4eAQievSwqzkMPMoKdhpAGWOtedFEHFXU6tcaLZP3KPfMq3dU
	 wyBxzrxzEm+mU3jpxpv21+BQQV5QtsJUibr1B1jL/i5Ui66FlXdQte8iCBz47gakjtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LUoPGOVC;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2CC606A334
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2CC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LUoPGOVC
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efc4a84e75so31155ad.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 23:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794988292; x=1795593092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1RbWjqFm7axK1WA6d2qj68hL+HcVofiqBMMK2TnnVw=;
        b=LUoPGOVCxwIAV8eWwoj8F3n1uK5UqmtzFRao+C0cCZUHq9IsJxO9vTwDbY2zSYPI8p
         1qfumvCJfVUCN5vKDO1spF1y7T91lMRReIpLQbHWsxPfGc/nbjXdqXvs2CQUZLMzNBj1
         aBFV1zfO2nYpMyw6C7gOvO9658HCrQbGItVnradArYhcMNZoTKTZ7QcGuKxMwyE4Bb+7
         V4gS2B6y5+UoHy28L9hMkvKhoYBVR1FS3LZ1S/Ut9d5YoLGHmEwTuoPwPJ4bqAArFBGs
         vHIkUJrjVYAoPkaNmVt9+FCPEOvYIHehWIWX3F+AosUqz6qs8XVD1oxRPHrsGj44E7gx
         Y5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988292; x=1795593092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1RbWjqFm7axK1WA6d2qj68hL+HcVofiqBMMK2TnnVw=;
        b=k9zIahc0N2gMYgYK1ErKSGRUXHvHf7gh99xPYYXivB8ao1NA6BWSaFylfRR4p4Fw5P
         Gusj0I1ona9+L8qC7cUGssltTSMGrE+BoJ11KSy8CHbvnOnNuS8hkhao21L6RW04GXwS
         onGHWZYucK07le1w00WGCCeGy/sejKFR6VDy/Vi05xsPW4KLmeaPO3sxJaXqi3Jafc9Z
         nUKBbFD1bNgrwyFbR8hp5l7twtcskbI71vGWhW6+dkYTVCIEk5j/X0VQQHcIiIOZJwzS
         vS7ke2D7zrbw1ZAkSCL4vSbO2eJcFG0QV3UBfS80YAOnG+eSLxr275yfrAOww9uPUmkH
         4hww==
X-Forwarded-Encrypted: i=1; AL+hErEDIFel8ULCB6y++IJS1gj44KD2c8vT2FJ0RipohvEOWMjH61onzAcvQCroKVa6Tnha2Ptj2zapSZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uqIN70JMLhvhRw9ZKd3WDrcZYISqto77sw8ng8v9u7QtXQA/P
	j+lWRbCFtBpDDFQfNA5+/WL47O0pNy6YF1Gv6OPW8vzfKdEQbJ4Ri0i5Kkz7RKqwtM5Ut9PZKPp
	vg4be/Vaa
X-Gm-Gg: AZFdTZf81hhYXAEbqHei8MjYemhTnYxBiucaUV1ld+fPQt316YKVaovQKmcOVZB9e2c
	zzUM/3qHR+tJvAdEsMnczQqO/hwYJP3YhcMpJtMm9rAt3hmEt2kqGdlRKV5ScFZ3y/E72Pl9lMG
	BVYltEly7uPqTl7fq9FBDmFvcYc5t7RFkV76J+U88uT6UBCjy0DMEPj0WNkux90DHRspR9kZe6o
	4Fe2ccokhNB85+7pHEoOLb5QFM6YVYO/A2t3TwBjiL+HdG1NV3ti0F8ews/9OmePdChWFaWyaNN
	TWBzPVyML/Lw3dmeMFA3ur4qX5V2a9f3mBGAbEUVn7KglAl1+OwG/2qMEUMvsNOQPoctm1omYgQ
	UktDkGzglOqpkfH/QgihBr9TNMHlLJkSZAbk9sLxxcmEjJmapmK0k0NdnBUJ/lFb0ggze+HTcJT
	AtYet4BLjrDaCAL27xprJrWRkEu9v1fq53shn806XdUdN/Fem/LgVT1y0wUmTNooWLlKNW5WJIH
	1EQokPQAg4mUZOhcd/Hbcj7zpAzIxSjjvbrfFZGruqzlm7mIo0eezzODg3Ue5OsO+YFDt7SeLMg
	RRethR8RAEM0RQo/BTa1Js1rcygoVZJlUP6ZVzv/ckQqEKuiFpjRWDMPFt4V5wXJwg==
X-Received: by 2002:a17:902:d544:b0:2e6:d25:d874 with SMTP id d9443c01a7336-2eff98d30f9mr2984215ad.10.1794988291451;
        Tue, 17 Nov 2026 23:51:31 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56ab352sm1000229a91.2.2026.11.17.23.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:51:30 -0800 (PST)
Date: Tue, 17 Nov 2026 23:51:26 -0800
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, 
	leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, 
	pratyush@kernel.org, rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 11/27] vfio/pci: Retrieve preserved device files after
 Live Update
Message-ID: <20261118065653.GE2250529.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-12-vipinsh@google.com>
 <DMOAT4VV939P.2DI8CEOMMSKMY@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DMOAT4VV939P.2DI8CEOMMSKMY@google.com>

On Fri, Nov 06, 2026 at 05:19:28PM +0000, David Matlack wrote:
> On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:
> > During retrieve():
> >  * Validate the handed-over struct vfio_pci_core_device_ser header,
> >    sizes, and flags.
> >  * Locate the registered vfio-pci device matching the serialized domain
> >    and BDF (requiring device->ops == &vfio_pci_ops) under the device
> >    lock. vfio-pci registers the vfio device before its probe completes,
> >    and the probe holds that lock, so a device that is still being probed
> >    is not returned.
> [...]
> >  * Open and return an anonymous VFIO cdev file via
> >    vfio_device_liveupdate_cdev_open().
> 
> Here's an idea for how the device file could be created on retrieve,
> which I'd like to hear your thoughts on.
> 
> The patches from Pasha at [1] lets userspace pass a
> file-handler-specific argument to LIVEUPDATE_SESSION_RETRIEVE_FD. In the
> next version of the tmpfs series, I'm planning to use that to have
> userspace create the file and pass it in the argument, and the kernel
> then restores the preserved file into it.
> 
> I wonder if VFIO should work the same way, e.g.:
> 
>   struct liveupdate_vfio_retrieve_arg {
>           __u32 size;
>           __s32 fd;
>   };
> 
> Userspace would open /dev/vfio/devices/noiommu-vfioX itself and pass
> the fd. retrieve() would check that it's an unbound vfio-pci cdev file
> for the preserved device (domain/BDF, noiommu, incoming, cfg_size),
> attach the incoming state to that file, and LUO would track that file
> as the retrieved file. VFIO_DEVICE_BIND_IOMMUFD would then take over the
> device as it does now. Since VFIO preservation is new, the argument
> could simply be required.
> 
> I think this could get rid of some of the special handling:
> 
>  - There'd be no need to fake a cdev open with an anonymous inode, so
>    PATCH 09 and PATCH 10 could probably be dropped.
> 
>  - retrieve() wouldn't need to look up the device by BDF, or reason
>    about racing with probe under the device lock. If userspace was able
>    to open the cdev, the device is registered and probed.
> 
>  - The device file would be opened through the normal cdev path, so the
>    usual permission and LSM checks on the device node would apply.
> 
>  - It would be the same model across file types.
> 
> A few things I think would need care if you go this way. The file check
> and the attach would need to happen under dev_set->lock so they can't
> race with a concurrent VFIO_DEVICE_BIND_IOMMUFD on the same fd. And the
> incoming state should probably be tied to that specific
> vfio_device_file rather than just the vdev, so only the file passed to
> RETRIEVE_FD can take over the device.
> 
> It would also change PATCH 12. Opening the cdev of an incoming device
> would have to succeed, so the check would move to the first open of the
> device instead: fail with -EBUSY if the device is incoming and the file
> being bound doesn't have the incoming state attached. That one check in
> vfio-pci would also cover VFIO_GROUP_GET_DEVICE_FD, which opens the
> device right away, so vfio_liveupdate_incoming_is_preserved() and its
> dev_is_pci() special case could be dropped from the VFIO core.
> 
> The next tmpfs version will also add a way for a file handler to say a
> failed retrieve can be retried, and a helper to claim an existing file
> before restoring into it (so a file LUO already manages, e.g. one that
> is preserved in an outgoing session, is rejected). Both seem useful
> here too, e.g. so that a mistake in the argument (wrong fd, an fd for
> another device, an already bound fd) doesn't make the device
> unretrievable. I'll Cc you when I send it, and I'm happy to share the
> branch before then.
> 
> What do you think?

Overall, I agree with the strategy. I think VFIO cdev retrieval should
happen as the flow you mentioned above. I want to hightlight two things:

1. This will lead to lot of code changes happening in vfio core. This
   means VFIO PCI live update code change will spill in vfio core.
   Should I create a config VFIO_LIVEUPDATE for VFIO core code. It will
   not be visible menuconfig option but selected when
   VFIO_PCI_LIVEUPDATE is enabled.
2. List of other inflight series that this series will depend on is
   increasing. It will be 3 (reset function, pci saved state, and
   restore into fd).

For '2', should I send v7 without changes you are recommending in this
patch and future version of this series can transition to the approach
you are suggesting after LUO changes are landed. VFIO liveupdate series
will go through more iterations, so we will have opportunity to make the
change. WDYT?
> 
> [1] https://lore.kernel.org/kexec/20261103010216.3447716-1-dmatlack@google.com/
