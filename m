Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7365538D6A8
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 22:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712184; cv=none; b=Gv3yElbC12c6+a2mpimYRvjhPiQYi69AgbrGGR2Mre0j/M7bZdfb9ljDCTGOFmsprHM8pG8C6nVi1yZxvOx5R5WePt1MgmCFq8ug+qvV2QOl+jllAcDenSpW23XuWuh4sB/v+LUyKfYR6p7HLtloMa9PkjhuBHi33d5pWOEEbO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712184; c=relaxed/simple;
	bh=CbvHdVmtLmzyOYmag/VF+OxC3FrvmW+yoxtC2Fz6tHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gR2aVeH4r7cY1CJkHtZNnBxZtb0wHs20l1doMqgLUr6arJ0e9vPO2Uw3OPVgMMBHX1oTXKuzufAlbvowd6+eWg8C3eyDgmMraQM4veIkCdeqrT78dQnZ6bnVMl1AWhFFL0fG/0x2PjM5LJ9JeXZaiTEdwgbv0KHFaYP6Rg7zgAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Use3xgIz; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Use3xgIz"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1336742714fso1253c88.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 15:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778712182; x=1779316982; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tnJie4MGAhTdVxrHjidSSamJhN69/aqRYywXACZbNwg=;
        b=Use3xgIz1P1CfZlxC6+U66ye5caojrgyweuvT7Y7eF45D7beXv8OhMminEaBm0+ur2
         BGzf4QZpmDKevhb84zyDqGQlpK+7Ijagi3TJaW+u9aBQEN0pSPjy6FoYTwtSksVxMDGv
         rECIjTMtdAK5dAnYhUlf15ScqHW0YYRRQhuYKPXgS3MZrivQsYGLBbT/4lgCAEtxZi/2
         QCdtvvYvLL8+s1tHLm/AAJJKsEOzwxJu3P6XV5rZgRdDCbvpSXXCbKebSc+0BVw9uU7V
         7WV4FIw7DsUc8qXWT7FJ3Tg3yGvu9fgiLOnCqBynpzlXP/o4TooGcBzEfzh1X8ogth2x
         lDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778712182; x=1779316982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnJie4MGAhTdVxrHjidSSamJhN69/aqRYywXACZbNwg=;
        b=qwGaHgmDS1K4v4rR/DlGDSP0Lf0jU4slhc6BOOOa87S2yjbEWZm7a1ym7erFnw/2ei
         pq+0Q/nfJa0VptYRv6XE0Vt9sOvAFyXgC7V/GWBONn6pLR8AjftbKELsPMtfJ2ego+X3
         MwF2aY0lh/QwheWQhDcFBrUCcjYa48xxwVHbRAUszIjOfy6taxeKr0DHFs1zPDlz/Qoy
         RaOsuNYb25DiqEJ++aq3VXAy/3QUo8Paj3024qeMUUCZ54auh5oO0x8pb8wAwrIjmZC+
         Kv7CUXj9p0L0L9OdxLnEWFYPgvsrwBg9D5Y7mPSeJSlDXv57kYYhV7YimqhNYg58seal
         WvkA==
X-Forwarded-Encrypted: i=1; AFNElJ9a8fqumERrH9Hf7gYunS9fEo4vJX0RxaPISv6MH0Xuka6FdPYUKLI8v51tiLyW41RfHiGScNhUSME=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqS1W/sNc/ufy9chvNYQ4+9A4WUXZK/RRJ6YdrMsE6Q/0HaqH2
	5OI/9iCLVULP1wVNhft1+G0fbxjd6r/XJbLwzeiGpF14q6vGlejhSKYpwfIFsHlnbw==
X-Gm-Gg: Acq92OEcGMN3/CGYhR/8n12A9VWEZ4VOd0TgVkjQVICfNbq0rtODYLaPea12xckV0oU
	kiuFGiF31I9SJkQJ7c9rGTRnQvJX/Uw9/VeII+AJZabwO9+0tzMrZQPmngnRUgcjVuB6RMyD1Sd
	AKO7O8GMiTw94UtPefyvddTKdf85MXyPNpSyb6HefhA4vCikx74+HdUgHWLSI1QFa4Jx3MY99GM
	m1BbAcTg8L3XWlaQcMDiqDOTgV/bjhB6QaGFIIMqtU/Dhc5fJm7qZ2l3o7NyupJ+preId0P2gDh
	Jlnl91T1CX8njCWmJOeW4bXqxvr7ptCQNnsJH7q3I+QFlKGOglhxoCmiyJmIDNE8NCgNU0Po71p
	QdY5uaxp0TyF7V6Md9snAolqq6URR6+ri20PH5yZ0iTM05UQ+T0R9rONnMcoouDPafpyJzmE8pN
	RXp2/+i5M2+POBh8tNVaibskWtWt4Ik6Prt8ASc4FgpaGkjYRROxFpNZLxq4CtHmtmfpbDTQ==
X-Received: by 2002:a05:7022:128b:b0:12b:ff98:1ed9 with SMTP id a92af1059eb24-134cb8274dfmr82086c88.12.1778712180853;
        Wed, 13 May 2026 15:43:00 -0700 (PDT)
Received: from google.com (153.46.83.34.bc.googleusercontent.com. [34.83.46.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e3c0sm939009eec.3.2026.05.13.15.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:43:00 -0700 (PDT)
Date: Wed, 13 May 2026 22:42:56 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-pci@vger.kernel.org, ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, chrisl@kernel.org, corbet@lwn.net, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kevin.tian@intel.com, leon@kernel.org, 
	leonro@nvidia.com, lukas@wunner.de, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	skhan@linuxfoundation.org, vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Subject: Re: [PATCH v4 02/16] vfio/pci: Preserve vfio-pci device files across
 Live Update
Message-ID: <agT9bYpXskVwW0E_@google.com>
References: <20260511234802.2280368-1-vipinsh@google.com>
 <20260511234802.2280368-3-vipinsh@google.com>
 <CALzav=fR8c2tYj9jeOc_K=xoupxAfWMHmk0ipDniSXg6uGiFYA@mail.gmail.com>
 <20260512211412.GA2819150.vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512211412.GA2819150.vipinsh@google.com>

On Tue, May 12, 2026 at 02:29:19PM -0700, Vipin Sharma wrote:
>On Tue, May 12, 2026 at 01:59:51PM -0700, David Matlack wrote:
>> On Mon, May 11, 2026 at 4:48 PM Vipin Sharma <vipinsh@google.com> wrote:
>>
>> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
>> > index c12d614fc6c4..019de053f116 100644
>> > --- a/drivers/vfio/pci/Kconfig
>> > +++ b/drivers/vfio/pci/Kconfig
>> > @@ -45,13 +45,15 @@ config VFIO_PCI_IGD
>> >
>> >  config VFIO_PCI_LIVEUPDATE
>> >         bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
>> > -       depends on PCI_LIVEUPDATE
>> > +       depends on PCI_LIVEUPDATE && VFIO_DEVICE_CDEV
>> >         help
>> >           Support for preserving devices bound to vfio-pci across a Live
>> >           Update. This option should only be enabled by developers working on
>> >           implementing this support. Once enough support has landed in the
>> >           kernel, this option will no longer be marked EXPERIMENTAL.
>> >
>> > +         Enabling this will disable support for VFIO PCI DMA buffer.
>> > +
>> >           If you don't know what to do here, say N.
>> >
>> >  endif
>> > @@ -68,7 +70,7 @@ config VFIO_PCI_ZDEV_KVM
>> >           To enable s390x KVM vfio-pci extensions, say Y.
>> >
>> >  config VFIO_PCI_DMABUF
>> > -       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
>> > +       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER && !VFIO_PCI_LIVEUPDATE
>>
>> Why does enabling VFIO_PCI_LIVEUPDATE require disabling
>> VFIO_PCI_DMABUF? I saw the cover letter says "to keep things simple",
>> but what specific problem does this solve or simplify?
>
>I should have provided more details there.
>
>When device is getting reset in vfio_pci_liveupdate_freeze(), we are
>zapping userspace mapped bars, we also need to use
>vfio_pci_dma_buf_move() to revoke dma buffer access or
>vfio_pci_dma_buf_cleanup() combination. Cleanup takes the memory lock
>which freeze already takes, and there are some refcounts which are
>managed in both of these APIs. This was causing complexities with code
>flow based on result of pci_load_saved_state(). All this was adding more
>refactoring than I wanted in the series.

Maybe we can return -EOPNOTSUPP if any dmabufs for this vfio cdev are
exported during preserve?
>
>I decided to just drop the change and disable the support of DMA Buffer for
>now to keep number of patches less in the series. This will go away once
>we remove reset condition in freeze.
