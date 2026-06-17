Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFA632BF24
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 21:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781732659; cv=none; b=S9Ojz3HzFtwJRmgJ/PtfouFlz5eZISTw6EW0njk94In8qwJAtEe9P/V6qaaFKrLcoWbanYV2mr3Ivd4WT7goNQ6+e1MyxGO7Fz/JjkyctUWEOeiDhw3Nr1v7J94Mu2biCI5r6H/g26EJ3skhCY5NtDB06bZgzBZZ9kEHwUATsug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781732659; c=relaxed/simple;
	bh=QZkluUiynr9FNYxq4HTOycC4NrsYyGj2uEdu6jqluEM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=VhBJeMn+jtIzJhFLuqEIzheWC5aqmJ07P+v1XCD3q9nl8vCuSkN783e6em7kE92XOIAaFPcxgN1kZTro7Kga43MHQXagtl9KXpXGyQ4l6z0cTqE7Z3AmQTLlIX5NzLJN+llIt9Qm4S2xhb33wMuOxyeeFEs3Qa/zO6J3UU9qEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=khI/P5n9; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="khI/P5n9"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-91578c374ecso24130985a.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 14:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1781732657; x=1782337457; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVgu7F5iihyCKu/G4stgDOvBtLDNemb1ZVF8TxvBGyg=;
        b=khI/P5n9hmcuFrRUy6h2bkY5bk9XcnNS0eD6l758HTPAyjklHfWQg8ucoD07kiq5zj
         xSe2G68Ip+fkF9DDlLJBN8IhLLaPDVJ0vsIKegrtQ6D8Vd8kgMBwKng0WjWMDuPlZT7L
         +7LBTGBPUUXfduYM/nQdZGkrxrYqW0phmqISexGseUcWBIl7FgEz0UcCp3R64A8hf5eu
         +M9++znpQE2aokzjcd3Cw/TUr41z18vsauXZITl7kCPYZIUk8UvkDWBBbMXRdXw+x293
         81Fj34o6tpSdrKNbuz7ga+tbuMEmflaI9dHXWZqrC2N9cdtt+Hm+4IKU4EPdvSmgVD/U
         CUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781732657; x=1782337457;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mVgu7F5iihyCKu/G4stgDOvBtLDNemb1ZVF8TxvBGyg=;
        b=Up2XDoRsnHyi5/StY8+ZM4YP9N22pKjsWBDUpnfU/rErZx9OVZtr5MKx7LTi/gzQpk
         boGys3rlEJlvhUNTFdUZM/wRSgNDSBxyY8Zy+poNZrCvnP4Vh3sMJY24mjR8L0NKRqXp
         7wFMCOHRqsBEB5XtKRumXFTEfVvK5MR5bdsqtrgjKs1T8uN5vwNM7OH7XQxUfifxuHyc
         KMobzB72PbfRKF3dgvTBUfB0ri2wT5IuNJPzCfzovFsxfoYhh29PTK3RVqcG3T8u6BkG
         MTlSRGyfA9pVvYphfD+hGtg7uLQZfkgut7iog7f3Mrhqqu60oIzmxkefjUjvZqQmPxxK
         Jg0A==
X-Forwarded-Encrypted: i=1; AFNElJ+gItMl8Y2WfRqHMY6umBmenen6+8Y0MYHVv3ikmImKn6KJBCpWIH8PWoJSKg6WSRYi8lI6OwObRiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjVLRzW455VjG5nMHaEApkrKPmLBucDNEZ6y7b+Db97OsZ7yth
	yuQLc+Gr1KnkZgcWe1jbtErCc5DiBDGiq9CPWdsijWVjhyS+oPXETvGRidXp/2382oI=
X-Gm-Gg: Acq92OFNE15WmjDENsJXnnKP+dMK1ErFIsEIlQBTgUdwITIOtKfTlmUmKIa8kAWW0KV
	h7sI5dAU5qTRRH+MaEbREYinKLoJrHz5tOKNOb5QFDf3UMx5lcTqFHMZ0iNWuFb3t91lUJnezgR
	t9fupZ3sMMi9GzKKojkuswF8k3YC85buTtJOmFPAnmZsbcpvIdk6BEa2M26MbFsAVbLdY4eY5gr
	FAJlqFelvGblVrzER//dQFINJVGGyzTH0hSfafyWQiKr11RMfcqLID4xfueJC7UtO42J8L9ECuy
	lpAryr48jdhCGNgGXa2pm4m+sEj8vS1hH4A8ID4F0SQKE0uSkBey/wSJ+EBl2ZmjoPe1tgL968r
	eKHrTIQI9XU7EMCR/7C6Sw+pFO+GjRKqVECfWZXEBdNaFQij3l1rnpzE816oOtB51hj6AkPgh/M
	6KACBX9cWqCDb/LKN6LDa/SsrObNMYDtFdzZEAEinEeQjFP4bcYngzJ5nnydjh
X-Received: by 2002:a05:620a:4710:b0:915:7c1a:1387 with SMTP id af79cd13be357-91d8b4b82d3mr974163985a.38.1781732657342;
        Wed, 17 Jun 2026 14:44:17 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f3c324sm1871381085a.21.2026.06.17.14.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 14:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the
 PCI core
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <ajB7EA4tAKqj5XV0@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-2-dmatlack@google.com>
 <178124130274.908199.14827357870284807134.b4-review@b4>
 <ajB7EA4tAKqj5XV0@google.com>
Date: Wed, 17 Jun 2026 21:44:14 +0000
Message-Id: <178173265446.1266136.13359060486033428626.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2540;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=QZkluUiynr9FNYxq4HTOycC4NrsYyGj2uEdu6jqluEM=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqMxUvPSD7ryLWoiq0RP6QzEW7bPRTwRVRK1iGh
 4D9ux7x6z6JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCajMVLwAKCRC7dyhM23N6
 3nBkEACIr+qaiFDURkLLKmlla4feY3MYdO7YczubseLaSQZvERTE2vIj19GVL+rKpHxOQTGKjdZ
 6x4uuQzZ1P/ZhxH0s02iqkxWZaYln8HlySKfJ/yRRSj4Md9jM+ui4VxXSMdaEPmxaHTn5xpasmr
 08wdcAPQu9z55T2Bx3Qokb6IF73WyIUIQROgK8q2E54RVuu1OnA14jbvCxyUwY6TTg5MiPHoqAo
 XeBjnZRpboyLxod5YlWDalguHWvvUODhNr3JCmQakJh0xzlC4m1tKgaU+DqgjnSco1PJQMMEgLU
 m5HRtfrrVci4ONbgHzaLQ7y6Rnw/X4gaS+3Ygz+jwYxxFHPGYbUCba/8f1sbRMPknCZhXjjNAS9
 5qRcK97cF6j8aqGrVz+VzKp+z8E6XlWdZXI7Obrcq8C3iCZbvkrNvPcrIAlpx/1x9QmosSMGrpd
 Em28VGCwMHhk0wMDJjvRQ4a0B7+Royl5PzbuLa2m2gxPfLDrjrxkyvHkPydL8A9Tzkp97XCgZQ8
 oMpmW3oXUmYg7Dep1lgEOdQgWiaW57ZS+s83v+pA87Zizu9zGVXVCSZD37h/nVmk5clhlqiH0po
 lcn9njTOGIFROCuQWZBh8jWGH2hMvIdPgL4UpOd7oEauXLnkDvjTcBR29cu6ThJH5cUTDeLIrFy
 VqYf2itiyoZMCqQ==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On 2026-06-15 22:22:08+00:00, David Matlack wrote:
> On 2026-06-12 05:15 AM, Pasha Tatashin wrote:
> 
> > On Fri, 22 May 2026 20:23:59 +0000, David Matlack <dmatlack@google.com> wrote:
> 
> 
> 
> > > + * PCI device preservation across Live Update is built on top of the Live Update
> > 
> > I prefer to just use acronyms FLB, and LUO, but have links to the actual 
> > documentations about them.
> > 
> > So, something like this:
> > 
> >   * :ref:`FLB <flb>` Data
> >   * =====================
> >   *
> >   * PCI device preservation across Live Update is built on top of the
> >   * :ref:`LUO <luo>` support for file preservation across kexec. Drivers
> > 
> > And also add _luo and _flb to Documentation/core-api/liveupdate.rst
> > 
> > .. _luo:
> > 
> >  ========================
> >  Live Update Orchestrator
> >  ========================
> > 
> > .. _flb:
> 
> Will do.
> 
> I guess I will need to add another patch to add the link references to
> liveupdate.rst?

Yes, it can be a separate patch, but adding to this patch is also, OK.

> >  LUO File Lifecycle Bound Global Data
> >  ====================================
> > 
> > 
> > Nit, may be:
> 
> Did you have a suggestion here that got lost?

Yeah, I meant:
#define pr_fmt(fmt) "PCI: " KBUILD_BASENAME ": " fmt

> 
> > Please sort alphabetically.
> 
> Will do.
> 
> > I think, we want to use kho_block [1] (it is in liveupdate/next branch) 
> > to allow number of supported devices to be dynamic.
> > 
> > To support this, we would redefine the ABI and tracking structures like 
> > so:
> > 
> > /* include/linux/kho/abi/pci.h */
> > struct pci_ser {
> > 	u64 devices;      /* Phys address of the first block header of kho_block_set */
> > 	u64 nr_devices;   /* Total count of active preserved devices */
> > } __packed;
> > 
> > /* drivers/pci/liveupdate.c */
> > struct pci_flb_outgoing {
> > 	struct pci_ser *ser;            /* Points to the FDT/KHO-allocated ABI struct */
> > 	struct kho_block_set block_set;  /* Controls the active blocks on the fly */
> > };
> > 
> > In  __pci_liveupdate_preserve_device() , we would search for 
> > and reuse any inactive  pci_dev_ser  slot first, and only call 
> > kho_block_set_grow() to expand if no inactive slots are available.
> > 
> > In pci_liveupdate_unpreserve_device(), we would simply 
> > mark the  pci_dev_ser as inactive.
> 
> Makes sense at a high level. I'll work on switching kho_block for v7 and
> get back to you if I hit any issues.


