Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2F33436A
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767906917; cv=none; b=FSD+SqUdWf8tD2sA+BmevO3IN8NHxqLDuJN5aqpi292vnc9oVd1dQ4i7BOxdy0AoOmBhJVo9ITZTZL5RoT8fktRRcHpot9fvnaNBBy5aseEFO0BIoAsaqK0kcTLT3t179Udv8Prv17fJcb6MfUTEUcUKGeGrLPeycEj2RtP/Bo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767906917; c=relaxed/simple;
	bh=zyL37NBSU8pN3eAlVPiisOgzpo5IWY8Zuk439n6/CTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avdc3c5UUggzxVDqRcBlvi2mpdtdLJ5/uCHpv5It94qIzZWeq883MTwy5GWXmauvbv5+nQPf2tm9JO/+ORoZRPik5rlhMXmjvFV258Dv9cv9Ia55hrh5/jOiC6+NbXywQb4s5VAa4MRckbv5RWEOPvTEpECWa1v7FQLFLaC9Ep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUz/QHPg; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUz/QHPg"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3f13043e2fdso1434042fac.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 13:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767906914; x=1768511714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tAcE7cKJ6r47wCUmKYPiPBxGZ+Ab7WHLD5tStOo4vtQ=;
        b=JUz/QHPgQrys22mKysCSeIGCf7c6o5uxeMlwTutwoVy102OwY9Tb4f8ccH7RxP5kRy
         /3Q0BuigQUrdOZtYAJvhvzV6dSPmGZxQqlBi9a+qnTbew5JJ04h3ETdH862T1Gvkxcr8
         uSEj2y0oCR0/ZINkE/W4yLde06kRgA4bhBpjOiNAgDf15tXWIBQAvYIrHRL4JTcaQZWu
         w18bpiKQi6efEjBhanHFjFq5pZr1TJVaGXzB1M3BSfRCaaeN97AqpHqWsRd76FKldcKY
         r9bbrwoN32qgXVo3SL2huzJYK6wPlnQPPHvVqxCEb0uWLw+OGJck33HpQFVOTaSvx8tH
         hSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767906914; x=1768511714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tAcE7cKJ6r47wCUmKYPiPBxGZ+Ab7WHLD5tStOo4vtQ=;
        b=JJ8gHIl9se0s9v9HJHI5s9QZ+PCA/qYpQkwkIP5Bvmelh+RFgHLl310rJ/iP/oTCNR
         m9Wnq+rh9GhQlTnJBhk+SqpSn1RimyWTnkAkBYb8HClWhSFy34T8VRCJAGrznOSpp2n1
         SxdIZyMy1PutHoKQ1pb0Ikc4zza83YPSqH1SQozliTHvDBSYsbegwcw+MvJMm9x29cGK
         EQFiz3ac/zu9LI5u8yGJBAIbsoeBk5oukR09/25cd01dAa0DIOb8xFNyx2qeYWHt8B56
         61NFJvfQQHiEf0n/YgFy1TmIqBtSEi4mVYaXAPArPisL+cyj6XDx+j5G97SxP1j1JtlC
         pJwA==
X-Forwarded-Encrypted: i=1; AJvYcCV9vZFUnJavzU80F2p1dEh5Cwy1RPR9U5ZsguCHZMA78DNu1MCKW2VKjIb5phvSDlmIY6odC9431w0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6/gBGEHmfgEtU9g7U2MIVxbbNUphzAeuRRB8j8o5KmLdepafy
	Pm61xug7UrWqusP/1pXRFdF8MtJaLfyZ9p0sHE7iHnBF6tLr/ThfkWz5
X-Gm-Gg: AY/fxX55ua0+1SY2L6jSwDruHwf9d63Vse777+JNGmVXR+63rdc2Cz5Q34usFmuxR9b
	QCYL62z2PrfK4TR1HJ2xj9sQQBkVwsJLd9E1hHGADiBOBqvfuUNX28ojr3N7VQYC/Z/FhmF3o5a
	06kmjQVbb7xA2zIf9Hc9Bpr0V0NE78apHB+Rh7FKciMDmDogrldhCD/7ucfHyYPrp6HfR3nMCAe
	SMKA5Ud+73ifvTfHXSusH41AH5ob+GHd/2HN7jRNC/wVaI5CoSO87U3mW5J7x890hq+vdUA501U
	zSqWQypecHebm/jCm3zlsiz9Y5OUXN47KRA5LoedLdBVgAOPzxsSF6p2SQViGpTEeSSQMYqcKVh
	pIvl+SJXcXw9AraHdWhUq/DoyRBmPA1SmAkY2bXPHNv4EI7pMJBEcEMSz6TOdLA5lj9vu8XvlGE
	kor9kyLd4T4Qocu44GNBzdqbOAiInLrQ==
X-Google-Smtp-Source: AGHT+IEqQm0iIHbXfFBFh7Rp/Y8kcmmT2Pnrl2hOBonEjMW99uNoChuzt5MPuGUGaUk9Fml8af2DQg==
X-Received: by 2002:a05:6870:a70f:b0:3ec:4137:47f8 with SMTP id 586e51a60fabf-3ffc0befd70mr3739946fac.46.1767906912603;
        Thu, 08 Jan 2026 13:15:12 -0800 (PST)
Received: from groves.net ([2603:8080:1500:3d89:902b:954a:a912:b0f5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4e38b60sm5496047fac.6.2026.01.08.13.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:15:12 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
Date: Thu, 8 Jan 2026 15:15:10 -0600
From: John Groves <John@groves.net>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, venkataravis@micron.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH V3 02/21] dax: add fsdev.c driver for fs-dax on character
 dax
Message-ID: <5hswaqyoz474uybw33arwtkojxrtyxrvlk57bdwnu2lnpao4aa@4vxygh226knw>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
 <20260107153332.64727-3-john@groves.net>
 <20260108113134.000040fd@huawei.com>
 <6ibgx5e2lnzjqln2yrdtdt3vordyoaktn4nhwe3ojxradhattg@eo2pdrlcdrt2>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ibgx5e2lnzjqln2yrdtdt3vordyoaktn4nhwe3ojxradhattg@eo2pdrlcdrt2>

On 26/01/08 09:12AM, John Groves wrote:
> On 26/01/08 11:31AM, Jonathan Cameron wrote:
> > On Wed,  7 Jan 2026 09:33:11 -0600
> > John Groves <John@Groves.net> wrote:

[ ... ]

> > > diff --git a/drivers/dax/Kconfig b/drivers/dax/Kconfig
> > > index d656e4c0eb84..491325d914a8 100644
> > > --- a/drivers/dax/Kconfig
> > > +++ b/drivers/dax/Kconfig
> > > @@ -78,4 +78,21 @@ config DEV_DAX_KMEM
> > >  
> > >  	  Say N if unsure.
> > >  
> > > +config DEV_DAX_FS
> > > +	tristate "FSDEV DAX: fs-dax compatible device driver"
> > > +	depends on DEV_DAX
> > > +	default DEV_DAX
> > 
> > What's the logic for the default? Generally I'd not expect a
> > default for something new like this (so default of default == no)
> 
> My thinking is that this is harmless unless you use it, but if you
> need it you need it. So defaulting to include the module seems
> viable.
> 
> [ ... ]

On further deliberation, I think I'd like to get rid of 
CONFIG_DEV_DAX_FS, and just include the fsdev_dax driver if DEV_DAX
and FS_DAX are configured. Then CONFIG_FUSE_FAMFS_DAX (controlling the
famfs code in fuse) can just depend on DEV_DAX, FS_DAX and FUSE_FS. 

That's where I'm leaning for the next rev of the series...

John

