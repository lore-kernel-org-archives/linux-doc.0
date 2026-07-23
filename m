Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A72E2DF2
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 23:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784847699; cv=none; b=Qze49vVsy2oAijYDeCZsllMK9T55NvnCDv9UPypmC2/Z2MKKy8YLdwNgnQC23KmHoXGdejztiudf1ChuO7gG2PlOgF3qLOSQ9NYz5/JbFAddnllbnot72+fnJdSbsNT4Xq09QN0PeDWrern2jcc5zVTDlcbrcfB1hpbrjulZYyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784847699; c=relaxed/simple;
	bh=YQmY4vjJG753/gpjkNKmDPwhu3EZ6zY1miOKlUbxQnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzXwZF3yD8oPpq42pyS1vttIKcJS9L3N8XC9id5DeMMwKWhzhjADj7Nn43eYLWBzZllsVA7/d/dLIR1li/oZc43w2TFy7AEimJzRtxdDkY9bJ3g+p0rT23J2j2SLANd2zWtCcNvzChql7QJDoLxfVbe3NwFqswt48m0m+DfqYCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s/mfXA06; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s/mfXA06"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ccdf36f63dso5435ad.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784847698; x=1785452498; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FoDnuIQXevfuc8nCvkdqJumo9L7Gv87izvbO8ewc4c=;
        b=s/mfXA06twbXNFjVcPaD3yldwp/7N024tvIxayWl47Fkgl84v2WbyTHBVNDvOAJrEF
         pI7w8Ve+D7yw+l9ARQ5VuQpiJMjxM55IaQ/G5v6QEIigmrGrqgyiNouhNXMTE/LXeq8r
         zVlO3xLB76KikNjmUF6wryzYKFcoBdwiS+rsUSBdHrQrFMXFsATDvjS6zaP4FlsN+JEV
         SZQESqHwo6HXw+Eb2E3Yk+up4l5eeer09BjIGrhioRIlp3W9YZewQDr8rjWlva8aBUe9
         SUS/s5TtTTYFFYoOoIxnUQeDX6gehp8Cigx2sl1pP4khpv8iu8BDlMTGTkkaKFJV/QO+
         0YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784847698; x=1785452498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6FoDnuIQXevfuc8nCvkdqJumo9L7Gv87izvbO8ewc4c=;
        b=jhVE4lxTEhcfgqfmsl+v2n3LcN8YBUHJ7y3vOGrh/x19MV1ZLGhB2hkQ4WNuchW8hB
         1BMrCxSg++riW9yIgK1qee9CeyirlOjuq9B1tO5cK9G6TpK4eP9REQMUIRwxQ24tCJl1
         md6V99OqUpHjHub0EOZY1zRYGdr1fPNpyb6AcPu9gw5XSBD0WEq2gb57Z+vWOO5/GgeI
         +BIG3k6HqrNVfCRsX4LOLbKERVa+2U4XdRgTe1UTjxIHKhbWhQSt2Sdz0rMHChtDg0Q7
         rokYYA2GpECi4JM2Mmz5mAoX5XceJyyvKno7DEtgpmFVTKQMmwvAWxEBEuyPZOt3GMr8
         1+RQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtHTzGUFXGkzkhMBabrTpwPDq8ajONPRAw6Y0vRAwyEWHb/k61Y3BQxk9SSChHfa3LEqs+hAvqDok=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxhk79Ix9gz+VTDGLuFozOaVPC0OQLHoQbU55n18JDFBMhKsHf
	vKcRc4dRFt0KZYQmFz038dHmhf43fz2sg2Kjlj93mx71dlLKLW/8KTLq0LB9todDnA==
X-Gm-Gg: AR+sD11TQGd4hDOZclFbrpCl1iYQSFfLo9BWxx3YxNSRS4xTkdmc9yrVZRt70o0K+GA
	Vc0DIQ+gUgV+BDO7/GhLI/5GAwyVUwQKembuzaqeeQBt/KdVfuZN5TgS9jzLnmGb5on8EYT1rae
	Zy0ypTO9z2egaULL/rkODL409pwvgMpj8DYm1gIJLxWL6Uix3s5tDKlCzhotCnS5/sme8APoOBu
	8BvJzYbiaR69/DyXR2zsBzchcLM5MsK6BFKWcxRRelsJCmx7Eq1qGxNj36Mj10Mxc/S0MUpuv43
	vmqjeEQ5wwcaUFKYsVpMM/sXr/nDCl23qe0AhZMs8M5l03XmlhMlirsFRzUeLegBWpJ7oyE3RIS
	o2BNVNdy14allA9tPX/YOuKsOza6TABeFshJ8UT/sNPPrgtir2tIUARnLn3UEhe4/AUrFktP6s1
	d7yzQ4p3QvqJBFXeoIC0VGWRjKfH7xj+TweW5w
X-Received: by 2002:a17:902:f687:b0:2b9:e831:5e5c with SMTP id d9443c01a7336-2cfc01915f2mr1772685ad.4.1784847697393;
        Thu, 23 Jul 2026 16:01:37 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm40753485ad.55.2026.07.23.16.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 16:01:35 -0700 (PDT)
Date: Thu, 23 Jul 2026 16:01:31 -0700
From: Vipin Sharma <vipinsh@google.com>
To: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, graf@amazon.com, 
	jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, 
	julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, leon@kernel.org, 
	leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, michal.winiarski@intel.com, 
	parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, yi.l.liu@intel.com
Subject: Re: [PATCH v5 00/20] vfio/pci: Base Live Update support for VFIO
Message-ID: <20260723225943.GE260824.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <2c03ac97-60a6-4352-a942-27dcebae8d22@linux.dev>
 <8fd94fad-e457-4839-9e41-ae257a138bee@linux.dev>
 <20260720163452.GC1191959.vipinsh@google.com>
 <cebd1045-5dd7-4f35-8750-9c39790ceae9@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cebd1045-5dd7-4f35-8750-9c39790ceae9@linux.dev>

On Thu, Jul 23, 2026 at 03:18:55PM -0700, Yanjun.Zhu wrote:
> 
> On 7/20/26 10:08 AM, Vipin Sharma wrote:
> > On Thu, Jul 16, 2026 at 06:22:07PM -0700, Yanjun.Zhu wrote:
> > > On 7/16/26 4:24 PM, Yanjun.Zhu wrote:
> > > > 
> > > > On 7/14/26 8:14 AM, Vipin Sharma wrote:
> > > > > Testing
> > > > > -------
> > > > > 
> > > > > Tested using VFIO Live Update selftests in both QEMU and bare-metal
> > > > > environment (Intel DSA PCIe device).
> > > > I want to make tests VFIO Live Update selftests in QEMU. But how to
> > > > select a PCIe device?
> > > > 
> > > > what device do the PCI ID 0000:00:04.0 and 0000:6a:01.0 mean in the
> > > > following testcase?
> > Sorry, this was my copy-paste mistake when combining things from both
> > qemu and baremetal. You only need one device not two separate ones.
> > 
> > For testing using QEMU, you can use QEMU PCI test device.
> > 
> >    -device pci-testdev
> > 
> > In VM, use `lspci` command to find the BDF of the PCI device. It will show
> > output like:
> > 
> >    00:04.0 Unclassified device [00ff]: Red Hat, Inc. QEMU PCI Test Device
> > 
> > Then prefix the domain (generally, 0000) to the BDF and use the testing
> > commands.
> > 
> > `0000:6a:01.0` was the BDF of the Intel DSA device on my host. I
> > incorrectly mixed two devices during my copy-paste.
> > 
> > Limitation of qemu pci-testdev is that it does not have the DMA
> > capability. I used physical host with Intel DSA to verify that the
> > device performing DMA during live update gets reset.
> > 
> > > In my qemu,
> > > 
> > > 00:04.0 System peripheral: InnoTek Systemberatung GmbH VirtualBox Guest
> > > Service
> > >      Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
> > > Stepping- SERR- FastB2B- DisINTx-
> > >      Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
> > > <MAbort- >SERR- <PERR- INTx-
> > >      Interrupt: pin A routed to IRQ 20
> > >      Region 0: I/O ports at d040 [size=32]
> > >      Region 1: Memory at f0400000 (32-bit, non-prefetchable) [size=4M]
> > >      Region 2: Memory at f0800000 (32-bit, prefetchable) [size=16K]
> > >      Kernel driver in use: vboxguest
> > >      Kernel modules: vboxguest
> > > 
> > > I am wondering if the above pci device can work well with this patch set or
> > > not.
> > I think you should be able to test Live Update with any PCI device which
> > can be attached vfio-pci driver.
> > 
> > `vfio_pci_liveupdate_kexec_test` will initiate DMA if the VFIO selftest
> > framework has the driver for the passed device (Intel DSA) otherwise it
> > will just skip over the DMA flow and do the remaining things.
> 
> Thanks a lot. I'll run some tests with QEMU's `pci-testdev`.
> 
> If I understand correctly, when using `pci-testdev`, only the DMA test case
> is expected not to work, while all the other test cases should work
> correctly.
> 

Yes, other test cases should work.

