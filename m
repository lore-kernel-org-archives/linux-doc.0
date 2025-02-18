Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A55328137D
	for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 18:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739902650; cv=none; b=GP7+hTbbXdic4gZQ3j0mVfkLIalGwo/Nk6akr1SMdDx/X8vYDeS/QoC3QdQAhC6/QHj4eSuZknZLL9EKKpDwlcKBl5i88XeXyHvHp8ExBBRtllXKx3FEuYEitVsrK6stR2vpfOLrXNCTPUt2Up1i6SBo0+fBNDtzM9p0vNNqUyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739902650; c=relaxed/simple;
	bh=BOUyx5EsWWjCZqwoILlVSGflf8blEnkgIikzItCUqP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1GLD6yByPAJLDNi44sa/5EkTVQcXJ2auP4cFR0PzE6BFjALIzsRh41RiMfZKs5gt0/z3wsDcoC5s69bot9EWoh5p8fZVXtGgm/w4Rl1Hp6aanaOTy14hkfAeiNR06s8e+sbQmIl3b+5DzmULmy7MknCoTbCXDMzhJ3EaYCyWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IEDDKPwm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IEDDKPwm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-219f6ca9a81so492735ad.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 10:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739902647; x=1740507447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M89M9SRzWTrfxkPQChi6cYghdfRxV0Kb26Fn5pPvW98=;
        b=IEDDKPwmsCnXzgsxU9UFmcPy9nb+59LDcji7VEN+uObYIwhYLLVTegfR4cPukphh3i
         n26LIz5uFbOfM/CNOEVdgY4wc+WQR/0qKhZQKofkElSAsQrxpASu4a3Mm1l7JKF3mmDT
         s/NQ2BIxdDPNuCxdxg1g7iomKKMTBrPho1/0geaO1qyOtRU2lhMQTVJf+XvQLCh6bfJ+
         JLqpFqvteKZlzmUfHQ2FFM4npwJoSf3EFM93FUNU9T4II+4/eFE0eCPZF1+11hUGrKPK
         UcQkj1neNFdFBgJQfaNO635F4y3UqCvwiTx+nyUw2/RAme0lKoGug97pV1DZ7CuAWt8h
         Wo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739902647; x=1740507447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M89M9SRzWTrfxkPQChi6cYghdfRxV0Kb26Fn5pPvW98=;
        b=IIItTh6vUM1s11NfuwUy98aHijf7iGRNaVl87bCR8mibSppJBUHnJCzyYq4ktwlm1E
         Cv8NNEgscDC5+kWWBDOT/AMMBaD6ZQzg6anF3Mb39tsSQ0vot0QHjpgTGt3SBhOulnQJ
         jW2T5Vrq8KhShtPh8C3Sp/2vJFeJJw8O+VzxaZScenljTKcQ2N1TUztgGuQLoskycQY2
         nFJPn4USa7ADJNt8WjfD69CupWLcllPHfeJttJYICtHmEPDiBfoUFjjK9KM4wmZ181jh
         iMyEjZ+rDFi20OnOkBrpUgkPvimO6kMP7tgQcGM5bUFeTrHqGZiDT8N06ZEAyvhFJXQd
         jcYA==
X-Forwarded-Encrypted: i=1; AJvYcCX465GjkdqIKs0VK5hKl/4/tx4SAb8rKndc3bsHjq28Og/Pz793j5PcYbVi9ZYnWl4BxLGPywwcK44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6VBZJKYtYR3cA8JoDyKihT3NcnKWtY6lKAk/i6vFwpt6g7A4W
	XblCwm3wTMdq1xNJykcvSL02Km6Jta9oXuQm9mP5Qr4srTdKuy8QF5PZ54E9GA==
X-Gm-Gg: ASbGncuVsE48TVZhLQURkeM4ZxO1vAjAw+dZYOAyiaWjsfTpJ4Awc5nfzuEWQN/Q6eX
	AbG3lq25Kw9S+L/QBs6j93bnixAWSYgWqIpYy/yCAByBLxnGxZ3vqmK0akt5SiuIEeioXByqVIF
	6jWLDM85Oqr/D+wVdyisXBM97S+2yTa2pz0CJ7IkRC8ysFItRMdtktRXsU41XaLlkxWcym4fk9Z
	tPnLIyA4KHwd8fd+knSycaGiOlat+JrtaDcy1kFTlvHkNJjgdAmP89NM9XDrFM0UJHBv8S2t7Pk
	HJuczulMWuiHrJRyjoPOi7kJBZS6Lmqld9ePOY3VMAwbJtCOklmD
X-Google-Smtp-Source: AGHT+IFkiHL5TTpaBclB/MgmM3kcQbDHYVWCGmPRDpeRclWjC4Poa8aWW8CJbN/ySGXple0OccOeRQ==
X-Received: by 2002:a17:902:fc4e:b0:216:48d4:b3a8 with SMTP id d9443c01a7336-22104c939afmr7012905ad.16.1739902646969;
        Tue, 18 Feb 2025 10:17:26 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55960ecsm91516115ad.253.2025.02.18.10.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 10:17:26 -0800 (PST)
Date: Tue, 18 Feb 2025 18:17:15 +0000
From: Pranjal Shrivastava <praan@google.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"Liu, Yi L" <yi.l.liu@intel.com>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v6 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Message-ID: <Z7TOq-gIGPY_ztW7@google.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <436ac2021bb3d75114ca0e45f25a6a8257489d3b.1737754129.git.nicolinc@nvidia.com>
 <BN9PR11MB5276291C74E2DF0C8821BE718CFA2@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276291C74E2DF0C8821BE718CFA2@BN9PR11MB5276.namprd11.prod.outlook.com>

On Tue, Feb 18, 2025 at 05:24:08AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Saturday, January 25, 2025 8:31 AM
> > 
> > There is a DoS concern on the shared hardware event queue among devices
> > passed through to VMs, that too many translation failures that belong to
> > VMs could overflow the shared hardware event queue if those VMs or their
> > VMMs don't handle/recover the devices properly.
> 
> This statement is not specific to the nested configuration.
> 
> > 
> > The MEV bit in the STE allows to configure the SMMU HW to merge similar
> > event records, though there is no guarantee. Set it in a nested STE for
> > DoS mitigations.
> 
> Is MEV available only in nested mode? Otherwise it perhaps makes
> sense to turn it on in all configurations in IOMMUFD paths...

MEV is available at all times (if an implemented by the HW) and doesn't
depend on the nested mode. As per the Arm SMMUv3 spec (section 3.5.5):

Events can be merged where all of the following conditions are upheld:
 - The event types and all fields are identical, except fields explicitly
indicated in section 7.3 Event records.

 - If present, the Stall field is 0. Stall fault records are not merged.

I'm not sure to what extent, but I think *trying* to merge similar event
should reduce some chances of overflowing the hw eventq.

> Is MEV available only in nested mode? Otherwise it perhaps makes
> sense to turn it on in all configurations in IOMMUFD paths...

I think the arm-smmu-v3's iommufd implementation only supports nested
which could be the reason.

Thanks,
Praan
