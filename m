Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DEC379EF0
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615812; cv=none; b=ID10oy9Iyi81G4VAwOZKB/XY2I+RJUAxtNX1HNnyKrSdnlLfGmvss4boVsFbpGyBpGqex+3ZJTtXkIq3G8y3hetifm9KsKDfvDSp/IRFiNCGl7cehsM91rx/jzi/RLbHvDbPwtvfFT3fChVpYOB3zB7Hc04RIPJnqDo20qv+zl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615812; c=relaxed/simple;
	bh=aHAhZatWrqN63rqopsuzMRMmrjRl1erVOZnCz/D9ERs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTW98xnF8Zu+2Bot0wU+DYJF1eWQfl/S2MkGRDiuSRRgxCCoKbbFbvWbqi76MTuJo36P8qkE2MjuRVDN3ErMv/1jGczKkoYk449vvazonD2ZnjrQq93erZHjsxEjA8Um8GdELNvWDN0CQjnPEVlNCpkI60mIWVDKk4Rvxx/HbMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yapk7RoF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yapk7RoF"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d3b445a84fso2855ad.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790615807; x=1791220607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nVlRP8UBi3QSgtgc/PjPsjRl9sO+VgQnXuH3S8lXm6s=;
        b=Yapk7RoFBmsEjX5eE+RtnFda3ODPFWKCkJovSMY9EBJS8V/i+JQSYEJwPMiuPj8nSA
         KUI7f7+HawJv0h6JvmLUh/Cx5j2JiqteEAYoQ/sj7ltW2Y1unMI8ex7tTW5cQCRyXbY7
         3ZPAD36xrTbFYt8PQFH02Tcm0Z3wxfN7WMDu3IvlSv3tSrPnJsZK2QzBNPLav+tDIyDv
         aKN2GCtr9CWObSA2mbWrX+JyIq9zYMxBWm2+rn6B0zwuB2uRcJDqCzaYuoYDp/a7cOYS
         g/wefy2wbNBCGe4UQkMQ9ZRZp4klETxNT4saGoA2oISdVpxZpg6Y2qTI6/BbSeDt/XdH
         T1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615807; x=1791220607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVlRP8UBi3QSgtgc/PjPsjRl9sO+VgQnXuH3S8lXm6s=;
        b=d2bOeTNm+fLeZ4XCflU9RjxgBN1bg9/roIGilMmlkScvZm1UQNWhooZIKMBgWheZs/
         0emF0atINWNs0UgyLpgZlAoHue1zSpA5b8NR42qPSsZaRzq0vUDz5AGvm7H15OyJcIUM
         A+mp4fhqfCv7jx/PvwQRt2k8koJsmUxeDMrUeDTq7p8JVDGs1Wa88MS9W02p2JxIn8oP
         H9BD8x1CmzI4pSrSaokSyqet0sIxY8g5LvtRV8IVyzTtKkLJhXzszoVbTOGRH+bb1CVz
         u9XNe2J2/m9+UW0qOmVf1/z+iPBYXEe2R3jBnNJ+HHRE33tTf2KxUc9cudr34eg3zJ+E
         LdhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmWBToudidHduJosaC3+NQVUx5XoxPn+13qKE1pPP1+rS+YRRsq9GlBpA48vmYCJgNSn3XKKjgew0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH+01vL5Sf/PojdnOwXDdPupn2RwC7HIeQ51WGRmB5fa+3iszZ
	OnvrA+qMBpIBgd3vMLizO6w+b6cuOIVngotOZr0b1lrPQL0m7AQEXx03ubf1TBpoQg==
X-Gm-Gg: AYBFou02ufoBRrSpjOHZg213kM/K/xNp2c/269EAAyAsyCHpFUYqJ2wEFKQU+S0Jrz2
	cyZoJt65L2qjK8NVlx0O9fg2Qrpx24pdHifNE61n8ugN+P/b1STxEJvwaW+/vhaxw0pdDsKjpi0
	aRe2WgqG5hCdNRLYSL7qgh7e29HebaMpHyA7SwhB6nBZmy+U26WT0qlB4/vGbI4sDJnys4s6uiM
	0gVp/90lMuCNc7y62bmPK/6N7PiVk1eA1cIamaUXVv0zZ3QHJ4pKPAEz1WDw4mbleuG8ooCc0t5
	if0X4TD4607dnz/55rBWtaNI7GBfzJ2QH21zBZNmjdCDz+TGS1hBEDJ89M5hbaHSqZ4pd9Jto7R
	B7lYaVfMECFN3uH754Shtb7zo21Bvji9XtgFhbWEVUZFDdYPbjU32SjSl73nYavjAFhGpBBo7Ip
	CPwoq/mdjFRCURVsm7JRKvbEie2U0TFDDYts7B1iYIW9eOzuomJAaFFQ77a0AYHMCDpa0JYxDdS
	sjn7zZHwiz2WP5rapa9GW7nhr5vmQMDv8Tf
X-Received: by 2002:a17:903:b48:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2dfa6194d00mr7813665ad.2.1790615806244;
        Mon, 28 Sep 2026 10:16:46 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497edd76dsm520284a91.7.2026.09.28.10.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:16:45 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:16:36 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v9 06/13] PCI: liveupdate: Preserve bus numbers during
 Live Update
Message-ID: <arqg9G8pXKPX8WCe@google.com>
References: <20260918200640.887030-1-dmatlack@google.com>
 <20260918200640.887030-7-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918200640.887030-7-dmatlack@google.com>

On Fri, Sep 18, 2026 at 08:06:32PM +0000, David Matlack wrote:
> Keep the secondary and subordinate bus numbers that the previous kernel
> programmed into bridges, rather than assigning new ones, if the previous
> kernel preserved any device across a Live Update. Do this even on
> architectures that would otherwise always assign bus numbers themselves,
> e.g. when pci=assign-busses is passed.
> 
> Preserved devices must be allowed to continue performing memory
> transactions across a Live Update, so the kernel cannot change the
> fabric topology. Changing the bus numbers of a bridge changes the
> RequesterIDs of the devices below it, which would require disabling and
> flushing any in-flight memory transactions first.
> 
> Apply the policy globally rather than only to the paths that contain
> preserved devices. Bus numbers have to be preserved above a preserved
> device anyway, since an upstream bridge cannot expand its window. A
> global policy matches the scope of pcibios_assign_all_busses(), and
> gives an answer that cannot change part way through the two passes of a
> bridge scan.
> 
> Bridges that do not have bus numbers are still assigned new ones, so
> hot-adding a bridge keeps working, both during and after a Live Update.
> The two-pass bridge scan guarantees such bridges are only assigned bus
> numbers above those already claimed by preserved bridges.
> 
> The exception is a bridge that was preserved but comes up without a
> valid bus number configuration, e.g. because it was reset during kexec.
> Refuse to assign it new bus numbers, since that would silently change
> the BDF of every preserved device in its hierarchy. Also refuse to
> assign bus numbers to the other bridges on the same bus, since the bus
> numbers of the failed bridge can no longer be read from hardware and
> handing them out would let an unrelated device inherit the BDF of a
> preserved device.
> 
> Require that CONFIG_CARDBUS is not enabled to enable
> CONFIG_PCI_LIVEUPDATE since preserving bus numbers on PCI-to-CardBus
> bridges requires additional work but is not a priority at the moment.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
