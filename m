Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C819F40D586
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 14:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781445672; cv=none; b=Mg8q4tgaB5tI0PCEElPw3lwen8IMuKQTpqsE1DdY39lcuBXNKawsMNUFkge54vweYO7C6yHxc9Oa9vAgF+7VN4QFOqsl7vdzuwYHUFnE8lRi8qqiMoWLcrQrC9vTv8a8C5Gx0OP63uO4vbp+BWcKuSSWFYmfztC/+a4RqSzX01Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781445672; c=relaxed/simple;
	bh=0/f3k6YhFFNYqylgqcMG4vpeDMtx34OA88JRI3jDl7g=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=jQo61LAVKKLLXzL6MlnCs/NT1IxxPLPmjJJV9mG2iyMfpouXLkcfnG8CY66DD9rPbHU4thA2nizmhETIC9DJaTRQOEcNDSPZESAfht+yEFrvjFQbA7DNi5F0X6fWVw6p5UuzLaEzN+58Z2Tr1r3e5CiUaBwC/ZpogTIhUjI1C/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DSz02o+6; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DSz02o+6"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-91578c374ecso193990285a.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 07:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1781445670; x=1782050470; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF8u6DKkckQuJavK70W0G+qrxbgEHWN1DTuCSFFIGv8=;
        b=DSz02o+6IG0PoPPDYviGJPARiKTp1DtWzwKTj380Mt18AxwwiQOVr8xPTQtflEbBvI
         gT21P6J7Pyg/ZVRmK+xJE4bHbwBtHze80+sNTS9O2V2+EucczK+L08JF7C9hIsTPm/2U
         +xaGZCsQNvHkOkgUPFZ15Zt4vzukpaiXv3KLmcXrBjLl6LHROGMwWNXn4yKVH4VcPiD9
         6YYZZvOOOiPh54QaPh0FXatkkUb8Mso3TOm7xDGitrqxKzes+z3PUvkvM5cyKIDNVTp9
         zuhl1YOtjRPEP64n2m5vZZQe69PgROUTexzru2X5oeayzymFLAEeOaMUApNV4uGFvmko
         AA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781445670; x=1782050470;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fF8u6DKkckQuJavK70W0G+qrxbgEHWN1DTuCSFFIGv8=;
        b=cFKit4h9xhbuMA/YDFbloP1TaEwZq/K1RF+NjxiVhrV2ElZ2QpL3c2s8FmX5d+F+mS
         1vTj9VErbL3Y/guwi0tdhprv3y8HUHZXqu4f02lSz9wqEpKrrDux9AR1SxSuI/aDgqKf
         5kLJCkdMVi9GNBl2nU3D6jM1ZE8y5/sU6q6TEm9NEsjPd+lMFluJeLXUCFsH1zMWP1Qe
         7LKUI5eyeSYy/uknDUpv2zUPwmv1UEP18HeL/BSaCpWjlVmZHYxpCYfSOyrAB+Na7GxC
         meEtIZaUAR6D8ULeUNcc1ZxfDdERzAZTufEn9xzlCg82JBt3oSX59ur+/CvHZJJe9LCi
         /orQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ksWyvad4wYjOdJFrYDZXPNfcuTIG8tV1gWKEtzEUPQ26JNTHA3vTbzOi9nKA3XS8bxlQS/eBgAhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/NyYORf2B5fGeFkuwT354u5mvMGqZqfNCp0lFTzUrDOVynn/
	1nB+dlyf7xGb4a6CnRian6ypg7/Qe28kfMBp1l0S69Z1lA9yxZwi0vCTbtlUZPawo+4=
X-Gm-Gg: Acq92OEqGBz2UFxXdUbGYAi75IbGjfHwasBPu6M/oNB+x0jm5DQi97oqLVkc5EaQiU6
	mjbyD+WdJchBylH/zfdGpccpPxcTrjiSkH/ZMH50/rdXAqZ9cXNOzrpKjnjLPmOuw4BJIyt6IRQ
	b8l3Be05khLkVj4tGzEvbE/NsF5sbUHe8Mrp0VN05VKCDirPGpthfq6E9bzXB04YagS8UsIAbA5
	kQhVu+GbFZ0WfDHEcBklrjUKt8oAiWTr2uJqparXMpGg6JBKIFE1MwQwghjKelI0Lap1Kjb6KcC
	mTmcCsfFCRJwF9/pP9KCJkE0oDKyVyWfg9yFrJcOSVZbyCu0FUmwahqYgaxGCUirbcgtGOmaMgJ
	Hvv8VtRZbfblEdETH8r7hESrMwHdcI/ThLki9EMe01D1102Er58Jey5UdXlHNbE52BL3r/VUCrq
	jLHwZ8FKc52dfjj1HYKw5phnL76hLIuzGTcNVdBhdTTPV5GqDtt36ietSxT79UeYOXEeK92Ic=
X-Received: by 2002:a05:620a:3705:b0:914:ac45:a98 with SMTP id af79cd13be357-9161bb03ad9mr1608583285a.17.1781445669356;
        Sun, 14 Jun 2026 07:01:09 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f05fe7sm806892185a.12.2026.06.14.07.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 05/12] PCI: liveupdate: Keep bus numbers constant
 during Live Update
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <aiQAJRINEKiwCmVm@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-6-dmatlack@google.com>
 <aiQAJRINEKiwCmVm@google.com>
Date: Sun, 14 Jun 2026 14:01:06 +0000
Message-Id: <178144566685.1266136.10385355007970146916.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4053;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=0/f3k6YhFFNYqylgqcMG4vpeDMtx34OA88JRI3jDl7g=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqLrQjWixclC4MmfNpLIwWFqBCFzofhX0Jr8QQJ
 bpVL95JpeyJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCai60IwAKCRC7dyhM23N6
 3kUaEACol4WdgDqN/9YA64JobY3TtWyKckwy4VgKxaRGy/1HiRGiXX5khGnvPxf/QUt2GqkrOAD
 9bfcRjR/HmwRhjEO8hkWUhHd5uwowgrsW2sn3Y0fs3qD3jwY1OCZ9WdrkMReE8b3B3ii5wzbOQd
 +dlUHARMl3hjaiT9TSaHtHOkmSDKHM1UKPlzTWRDrCmh6+LnpuOakhfPOKFldJYDgw/YIBKmZQG
 +YIWAWmBPRFGkUgCD9FoglbeuyIym39QFmBpPde0isIetl86PwQReKOb5H2Zi+aD+mm4ine49jq
 KLbeKAxjqxMj1cXWKk84Xe40fr4H4wkU4vsfGH/eGK1o3wiQVoBbu2TPp1LCeB9N0cNWCVE9DH0
 7EizDfLEBK/1DKZaUprLyucUu/eA2S/S254GS3Jn5LDRzlNOj1al3yHR68VyCLeMWcZA/VgxYI5
 dqQYd/bN6gOvwDlFB/xexPatXErOhIo0iGC1i84tXL4C1OQEi9uIY1CtDZ+Ztv0pgUNlVOhFyGb
 kqDZniluCNmnn8OGPvNMZz+sCPJtmqQBEATH2Hv8dlOdlb4s8lSUeGD1aBMvKPKB5Bh0hAczvNh
 Sj5W6biG4ZUAj1L8BivCr0gTvsEJ2WSr9VMRTzsZ+0+dMV96HGvU4RyHQY7IY0Mx6kLObjr8TRS
 KOqR+oScoluku5w==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On 2026-06-06 11:10:29+00:00, Pranjal Shrivastava wrote:
> On Fri, May 22, 2026 at 08:24:03PM +0000, David Matlack wrote:
> 
> > During a Live Update, preserved devices must be allowed to continue
> > performing memory transactions so the kernel cannot change the fabric
> > topology, including bus numbers, since that would require disabling
> > and flushing any memory transactions first.
> > 
> > To keep bus numbers constant, always inherit the secondary and
> > subordinate bus numbers assigned to bridges during scanning, instead of
> > assigning new ones, if any PCI devices are being preserved. Note that
> > the kernel inherits bus numbers even on bridges without any downstream
> > endpoints that were preserved. This avoids accidentally assigning a
> > bridge a new window that overlaps with a preserved device that is
> > downstream of a different bridge.
> > 
> > If a bridge is scanned with a broken topology or has no bus numbers
> > set during a Live Update, refuse to assign it new bus numbers and refuse
> > to enumerate devices below it until the Live Update is finished. This is
> > a safety measure to prevent topology conflicts.
> > 
> > Require that CONFIG_CARDBUS is not enabled to enable
> > CONFIG_PCI_LIVEUPDATE since inheriting bus numbers on PCI-to-CardBus
> > bridges requires additional work but is not a priority at the moment.
> > 
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  .../admin-guide/kernel-parameters.txt         |  6 +-
> >  drivers/pci/Kconfig                           |  2 +-
> >  drivers/pci/liveupdate.c                      | 83 ++++++++++++++++++-
> >  drivers/pci/liveupdate.h                      | 14 ++++
> >  drivers/pci/probe.c                           | 17 +++-
> >  include/linux/pci_liveupdate.h                |  4 +
> >  6 files changed, 119 insertions(+), 7 deletions(-)
> 
> [...]
> 
> > +		incoming = pci_liveupdate_flb_get_incoming();
> > +		if (!incoming) {
> > +			dev->liveupdate.inherit_buses = false;
> > +			goto out;
> > +		}
> > +
> > +		/*
> > +		 * It is safe to sample incoming->ser->nr_devices and then
> > +		 * drop the rwsem since nr_devices will only decrease. Thus the
> > +		 * only "race" is that the current scan will be overly
> > +		 * conservative and force bus inheritance.
> > +		 */
> > +		dev->liveupdate.inherit_buses = incoming->ser->nr_devices;
> 
> Nit: inherit_buses is a bool, while compiler will handle it correctly,
> maybe we could:
> 
> dev->liveupdate.inherit_buses = !!incoming->ser->nr_devices 

+1

> 
> OR
> 
> dev->liveupdate.inherit_buses = (incoming->ser->nr_devices > 0)
> 
> for readability?
> 
> > +		pci_liveupdate_flb_put_incoming();
> > +	}
> > +
> > +out:
> > +	return dev->liveupdate.inherit_buses;
> > +}
> > +
> 
> [...]
> 
> >  		/*
> > @@ -1497,8 +1501,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
> >  		 * do in the second pass.
> >  		 */
> >  		if (!pass) {
> > -			if (pcibios_assign_all_busses() || broken)
> > -
> > +			if (assign_new_buses || broken)
> >  				/*
> >  				 * Temporarily disable forwarding of the
> >  				 * configuration cycles on all bridges in
> > @@ -1512,6 +1515,11 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
> >  			goto out;
> >  		}
> >  
> > +		if (liveupdate) {
> > +			pci_err(dev, "Cannot reconfigure bridge during Live Update, skipping\n");
> > +			goto out;
> > +		}
> 
> Quite helpful! Thanks :)
> 
> > +
> >  		/* Clear errors */
> >  		pci_write_config_word(dev, PCI_STATUS, 0xffff);
> >  
> > @@ -1572,6 +1580,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
> >  	pci_write_config_word(dev, PCI_BRIDGE_CONTROL, bctl);
> >  
> >  	pm_runtime_put(&dev->dev);
> > +	pci_liveupdate_scan_bridge_end(dev, pass);
> >  
> >  	return max;
> >  }
> 
> With the minor nit above,
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> 
> Thanks,
> Praan


