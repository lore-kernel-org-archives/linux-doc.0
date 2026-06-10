Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A92A3FA5D8
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102236; cv=none; b=Mj098ihHon3uPeKpjKj0jrPyVKG7nRk/AqOOU/lvvW1M9bru8uReJh9FFRZOoywim5X6LQD4rEGx1oZd/f6z+bpavQVoO3cR+c8Nw6+2ve4+pnUBZQffDF4h2e7NuTHx2VfU6qIo2hFLJ1q70UruF+ROn0QqoJyPPYf+JINIjaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102236; c=relaxed/simple;
	bh=ObZjN4PnpBeEVp+PIf3DS7ox6I4fRLdYZ2Z6oeHyCmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWqWAh3k3kFXmYPpi5zXUKmiy+W2I/lAIrhuVNeJNSdkD5Fm/1Bn40PTuk1FD5X577zm+VdcZ7rPq28qYhycg6CMF9+Ae+qvi4krsZXilVBOdIBKdxoMZJ5bv5kIlUIBH3VqgRUlV/5lV2Qu4KxekNycUyNTqZ/pmDIR61CGFBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DQtV0Ph+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DQtV0Ph+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0b1a48855so80965ad.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781102235; x=1781707035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hztkJLAOrt3y4FASh5Bx2C0OqdOIndw7eniIOKrpzws=;
        b=DQtV0Ph+ELjeZrlrdJYfr2VECIrHkZW45XEQeEMlHhQSv3QwZCVWREo2Udx5bSy+XO
         21u12ustc8JpSQ9QA1qDvRJTFgF3fIX8IEmvIgnSwXQ+scznhKH1M53pGBiyZs/CShnj
         LdFoEwdJCHD9VuoQXEj6pjuqcfPh36CcT6SoWUS8OnQxTdrMTt7pwKEj/LFRnmwiFZqu
         Nhj1RNexedtvoyLT8ETaqUsNjPHFmEI6WRxOeTujUxdVjxWIc6DcSfNhb3HpWDvkrdJa
         tg5kjveRWVr1zX38zuHLr7gqY2eFkdax7mqjyv+y5/veaecmqao1tmEJ5Vnf1rMXTPeD
         bSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102235; x=1781707035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hztkJLAOrt3y4FASh5Bx2C0OqdOIndw7eniIOKrpzws=;
        b=kdxki02Ev4/mVzbE/E86Nov0ojMoVoN1ITbG4HZ4drWT+513XRblQJXDSLe9dOOD5Q
         m0ljcVFPan2zStKRcxcI7M41mN0PbJZ9nt7O4v1sPJ9S9geAILSuXjmfQoPImonwvOm8
         Gh4f615hMG/v2ox+BQsqUNXLApmtDMBDO0RKv2yTKBOTo3226DsAa3zP/aI0mqp29V5u
         jA58WfuEz1IWBKvhgAMKhqCKXLFdR6XF7QVO713FigpITuOFuasf+XZHQgvJVvgpCWED
         deL6C9/5w3MbUNkjbc2+ZVzbEYi3bUBI9jgC2ly7D7pMCorEf2nmzoEHRs1nXDu4dcyY
         H9Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8ri7CaHth/OdwG1yItkK8eqDH8e0zJtg/vyj9OzdXMTm/B+DJ1aOYcgwdcPYvLiQ4txtKVW97ONbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx05bOCo6eTw5Cq+8BY0AglBgugzhxCi7jJcyaV9qNCum5SUOq
	KQImIS6lEDgCE/iZepI7lFhS35OvfBx4mOTXlrnP+o9DdI+m5vdWKY5UMNy50hnikhgViZPRL6x
	kvzx6Gg==
X-Gm-Gg: Acq92OEinR+gQRkBF3EnsqKe4CBAOJbvbalcIbel4p66I8TVxqhTXUvp0nZFK+iDuAq
	ShyImCdvgM8CdTBxf4xVnTaFEPfgxQb1KsVDq5xH2DDX3daS73PT+dtbFWnCpNOOO/xACWOaYVv
	R/aabaucucLMQgQJ7boGrOIJz+MDICFtDhLTNrN8ESTqp1OBaB38QwDcDlELE0b3kgbsCQlUIye
	7FGf1aHOkTo4wmEPu6jFd7dUKV6hgdrGS03/PSsXLCbtooXIU9rF6ACVx+YKBL49i2W1mJSRoGZ
	x4FNf3cm62N86/UR98vet7/gnsFXeGuMOmjYmHRlO6/FjLrboU5CS+b3ueRmEUvFLsRvc8e1NQz
	PXNPu+ErM5Cb/MAZ+laZr7iONgkdX8jH5NWRg0A9C5JID0HFKGYyFysRn0bV9PvkSKRCT2UwkNi
	CRFr2ooL06C7xDTpJXGtk7ZwdLWpuNzXzaoFfCsldq1dmrdOd8SCDqXqvGwqv5rfcJ6I9E868=
X-Received: by 2002:a17:902:d4ce:b0:2c0:b1b0:376e with SMTP id d9443c01a7336-2c2d936f08cmr13905ad.8.1781102234239;
        Wed, 10 Jun 2026 07:37:14 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821c5sm23191040b3a.32.2026.06.10.07.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:37:13 -0700 (PDT)
Date: Wed, 10 Jun 2026 14:37:04 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 08/12] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
Message-ID: <ail2kLnW43fF_Sqa@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-9-dmatlack@google.com>
 <aiXWmR-ettxin4LC@google.com>
 <aic6mdiZ0qUJpFca@google.com>
 <aihLTgs1Y49OXQaV@google.com>
 <20260610000704.GR1962447@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610000704.GR1962447@nvidia.com>

On Tue, Jun 09, 2026 at 09:07:04PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 09, 2026 at 05:20:14PM +0000, Pranjal Shrivastava wrote:
> 
> > Now, the attacker has an opportunity with Liveupdate, since the devices
> > are already assigned, if *somehow* it flips a bit like ACS_RR, the
> 
> If this is possible then your environment is already security broken,
> no need to involve live update.

Ack. Alright.

Thanks,
Praan
