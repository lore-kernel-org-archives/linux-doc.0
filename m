Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B21313522
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 23:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770419693; cv=none; b=K15QJQn2b2IPvHtsH6IF6ZHTcvOLgibEBDENWgHaVC8EJkkSeq6v/QYoXVaIbxwanPR6PvLRVYFfvBB54nc9ZBoHqKRS6Oqf6ZU1lOorc7BKxIT3gIVlk/AXsRwOstQRSP5A71aBOixkKoH4oIi891c08FoQ2MYxam5weoNFC4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770419693; c=relaxed/simple;
	bh=//lXxvGzvwvRX8TAWjBtg2RwKbUnQc3RJsVA6A3Oyik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdehFWRwf4HpIebLyKJ4HnxkLX0iI3KQ+1dwMlvs6QfGGVc2psPjVFxATIjQ1P3rH9OgpWoe5Wc7ZrGh8puIHXEBOSQVZkOZVyfDBTlGm/TvsZeGWzSYJCPeLTBfXmzwTnOZ3ZXa6wYo3fnKvaYA3JC6r4ixu17N3dF3rnmsUMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g3tRWC1l; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g3tRWC1l"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c551edc745eso1210539a12.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 15:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770419692; x=1771024492; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xORO1Htmm6YxNYM1C9oAOOlxqgAaEPMiLYXG8QXy21k=;
        b=g3tRWC1lBp4G6v57OMNJH/IWhVnKhZkgx/YZiytE6h7F/GblmQyEeomg0JeF945imr
         3DB0TWRGaESQe070W0BWOsUsHHgvWnyNF6EEwR5gbcMaxsCWtsRq1Fe05Wodqe+0qye2
         LBmPBBEaSzUa/6BVN4mGd5ytwg0pv9jYELANMZypZY/N1Rk4NZK0jaWANUovaQTw19Op
         /8LEugHReBQZGwa4owCg//1Vcv3ViHo6xmE5eGqCTRiTfYejf8j7ME+YpxzTkLA9rqSr
         Q2sFeCKKNGRwrLl2prU/fOIUJF/CpaYN2BHv2qZMRrBdGsbsQA9CbV1GnPE3RBNl1TaN
         FKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770419692; x=1771024492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xORO1Htmm6YxNYM1C9oAOOlxqgAaEPMiLYXG8QXy21k=;
        b=J4we8Du9xacBeOZUgCFbYs03/DZrYkM9YKMp7SA6Cx65Fg+Exmg0RKl9nskbtcm75p
         YPb8HR14Oy6lyYEfh55w+zvqTtuesS3thxGqFBImiW0DKmb3STI9N7uLV0av0FDd72ID
         JfwbwDYwQFvlJTghcLRlBHc9mAl/q1Y/tS8AANmZeK5A5mwarpraT8ZFkylD7N17cvlY
         5cDRbtAw+py+mXrKcjL34Wa4HS8KPjlgWdhl9I8V7/nK/2XImE6AG9fqLx+QggSBloGc
         Phwup0touYu2505SQLiyv0v7/gII8qaUhN+LWW7wer3aLsr6VxSE9BwXDoEtBpkJ+1mH
         W3mg==
X-Forwarded-Encrypted: i=1; AJvYcCX8ws7FGvJrj/QrLGboi++nAmaiqwyR79lkT+M+N/7N3xS22v7NF1hyF+A5/CVqBeB6vWZfwxLzGos=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAuYFwTPvsnNjiFn95PuLAKgwn7YIcTYoijMEDHfdT9zct4CCK
	1Zml3LueMid35/KmaM0J1fjWPw2uQH9OCvOKJ6bidRvGGxGARBYJ75t31CZp5XX4+g==
X-Gm-Gg: AZuq6aJWNJNOQZa6xVLkp/CyAE9cH0lri3NSPS8HdjTLFi1ZPyU6q6p1p3fWnUhkVwl
	LiMkMReB7uoZVkBcc3D4TOPZvWp76jDIU/Ozs43B+f+MZmEHUxFD8zgE2REupiMnBFF+/s6Ku5V
	SetfX6brKkpt4GbCuPaseB92dRxB1Z5M0l28wbzvaeK/x+DAUu4aFWn5A0aFMxySrtbhRKl2jz/
	ecm8espOileRoLafTqUymOnwXUmbVREwb1chWGg8Az/OVOJAleqzA/L/IbAGNR5++BPj8dSMFcC
	guGF/eELSUC2IGCldvpPnOc+RA4fjv3tVjZfKrWnHWPrgvZs4q2WQV6rHZWITo+uvyIlPQi/o14
	Th3arl96lnqDRKbByDgG5d+S5D65gizzQOhWavjM/ANzOQ4cc0+FcMaW3B3cafnAqQSfW8nppJO
	LTpFa5tk0/YDVeSYjO87AqWixlOt2qmVHBpXChvfpjcfIBQruUFg==
X-Received: by 2002:a17:903:3bcb:b0:2a0:c1ed:c8c2 with SMTP id d9443c01a7336-2a95191f76emr38694515ad.55.1770419692202;
        Fri, 06 Feb 2026 15:14:52 -0800 (PST)
Received: from google.com (79.217.168.34.bc.googleusercontent.com. [34.168.217.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521eb87fsm33865195ad.71.2026.02.06.15.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 15:14:51 -0800 (PST)
Date: Fri, 6 Feb 2026 23:14:46 +0000
From: David Matlack <dmatlack@google.com>
To: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
Cc: Alex Williamson <alex@shazbot.org>,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
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
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 04/22] vfio/pci: Register a file handler with Live
 Update Orchestrator
Message-ID: <aYZ15u120FEa8Qw2@google.com>
References: <20260129212510.967611-1-dmatlack@google.com>
 <20260129212510.967611-5-dmatlack@google.com>
 <6dc423bd-36e6-4f97-b2b2-c7030575a3a1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dc423bd-36e6-4f97-b2b2-c7030575a3a1@linux.dev>

On 2026-02-06 02:37 PM, Yanjun.Zhu wrote:
> On 1/29/26 1:24 PM, David Matlack wrote:

> > +int __init vfio_pci_liveupdate_init(void)
> > +{
> > +	if (!liveupdate_enabled())
> > +		return 0;
> 813 int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
> 814 {
> 815         struct liveupdate_file_handler *fh_iter;
> 816         int err;
> 817
> 818         if (!liveupdate_enabled())
> 
> 819                 return -EOPNOTSUPP;
> 
> In the function liveupdate_register_file_handler, liveupdate_enabled is also checked.
> as such, it is not necessary to check here?

Yeah that is a bit odd. I see that memfd_luo_init() just checks for
-EOPNOTSUPP. We can do the same thing here.
