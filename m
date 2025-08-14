Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653472E8899
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 10:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755167842; cv=none; b=ob6cUfYYwVGrPv2jY1G2g1DqdKwZVHyPJZs1kLNzkPE6A8LmQsle7T+g0Jp70oMMBjwRqsSuRJpUiRq4NWiI/Dmo0wWB1ZvD8WRcZI1QNFwfTBj7pl7AnCl9Eb0zh53X2soj7sJwg/pe6lV0GIs/rgQ7Wm9xYxv2i1xpqAXTiBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755167842; c=relaxed/simple;
	bh=2z4KHp3G9a5b9AfVC4TLzGl8oU7ja1D8uVs4f94B57E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjgRpUh6b2L1+LqQx3/xHtcBZ4oDomp71bPSjNhrCv8oLiwRw6ScCaK1vmKRycMTkZ/rr30FvL5RFMRrei5gD8Y/2IWQqi3/6Lp87xE+ITdLRIODp00RCbz2bZO7CGKhCdUB+s+IUJv03oZpuciXTzl0PP5wCWZTVd75UUxItQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=O/GOHdyW; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="O/GOHdyW"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e870325db1so71013485a.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1755167839; x=1755772639; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kfg1xdeLOfyreKnr328hQaYYjz2z+mng0dgiwOWK8Ho=;
        b=O/GOHdyWZapd+Nae4I8AkqAIRlDiXTWapC6/jH6o4x70+cSV5xWtCGGTblvSY3gApB
         QHc/mOyfbM+ZTYQ8ptVLzn1NDc4xewRyPkMC87FPDYgcd9c6qEFXD6RSyGE8+s0oo4AX
         rhkrWHIK/1AfLWZXh1yFCv3TFLmRVPrORiMp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755167839; x=1755772639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfg1xdeLOfyreKnr328hQaYYjz2z+mng0dgiwOWK8Ho=;
        b=DGKCAPG0CzIpKLo3YSDXygCdErI1zL40XaJ7F9CWM8ppuzMdB7S8A4YqIxzx2XrsS6
         lnE1/y+PTvsolXf3lxiE0+fQ/6B5M1V9cVH97uMxEqA7j4PKnsfGwLXO9+EA1BMqOJpp
         FmPQJp83vKQfGBDgrhXnCIoR/6wjE0Lrf3KJJiEMLCcqCon7oZSOY+50jEX9z6vhayPM
         YPdOt72rx+pITMQ3QOY2suA4Ha46N++puoLhEqUvssi1ere94ZrobvhNXlDlPLNnmYld
         30EYj/CN+shgl95jrUoH7Rexi2nKtjBimeQeHsJGCk1t1pqp4t2rhbbK4N1rKtRo/kL4
         e5/w==
X-Forwarded-Encrypted: i=1; AJvYcCVxd71E6YrGoWNQuaq08B5stPAMWN2e/hhxtBuu4bKjyWs+c/EVEyhwbtpA5Pep9P1kfH4kFbns6Vg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn3/Ok9xq/ofKLx1CCzjgtduMqe0smkGxnaGGdD5c+IjPfP6pG
	4eJ7GdQrlaPWlrr40JCZFE44t+GD2kb6xcnNQRxBQMhZ2Cvg4idKKEHim8cONngoaTsDGIenpW9
	NyiGZj7Osai0bAaIAs7P8Rbt0QF59guRqSQwM4WCbzw==
X-Gm-Gg: ASbGncsPp45f/PQ7BM0r/EJcibMcO4k7ySKsOALbiosm+xAwzJQ+Fww19ut5UYujG7N
	x+Q2XSRMpZ25/NZ55a0Z/1a3OMqYLNh7H7fee+0hzZpbx5rPLowcG8kzYOdrPMywJN6pSI0uMoR
	UcSJxrMf0dvlPRMDpTcEtTxUiRM2QRpZIoIHDLodIIoK3YYrpoP0zYkmROoTUAR+XpcS8+I47JN
	/Xj
X-Google-Smtp-Source: AGHT+IGCyQ+LrtnuvvD4cnfS9KWxmodF+LtsJHdOQQ03BWq4ghzPdSAt/rs4hdQANvXyGJmp0NayklHjGgL6sn9UaHM=
X-Received: by 2002:a05:620a:17a8:b0:7e7:f84c:9d65 with SMTP id
 af79cd13be357-7e87066e73cmr321505585a.38.1755167839208; Thu, 14 Aug 2025
 03:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703185032.46568-1-john@groves.net> <20250703185032.46568-12-john@groves.net>
 <20250709035911.GE2672029@frogsfrogsfrogs> <ttjh3gqk3fmykwrb7dg6xaqhkpxk7g773fkvuzvbdlefimpseg@l5ermgxixeen>
 <20250712055405.GK2672029@frogsfrogsfrogs>
In-Reply-To: <20250712055405.GK2672029@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 14 Aug 2025 12:37:08 +0200
X-Gm-Features: Ac12FXw_tUJvAdswzhdrUe0cP4gCxZqTC0WTTpEt7BoMabiUDl0tjdFveoca6_Y
Message-ID: <CAJfpegspQYVbWVztU5_XFwbGaTQKe2NCm2mcui6J3qv1VDxdSQ@mail.gmail.com>
Subject: Re: [RFC V2 11/18] famfs_fuse: Basic famfs mount opts
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: John Groves <John@groves.net>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Josef Bacik <josef@toxicpanda.com>, Aravind Ramesh <arramesh@micron.com>, 
	Ajay Joshi <ajayjoshi@micron.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Jul 2025 at 07:54, Darrick J. Wong <djwong@kernel.org> wrote:
>
> On Fri, Jul 11, 2025 at 10:28:20AM -0500, John Groves wrote:

> >     famfs_fuse: Basic famfs mount opt: -o shadow=<shadowpath>
> >
> >     The shadow path is a (usually tmpfs) file system area used by the famfs
> >     user space to commuicate with the famfs fuse server. There is a minor
> >     dilemma that the user space tools must be able to resolve from a mount
> >     point path to a shadow path. The shadow path is exposed via /proc/mounts,
> >     but otherwise not used by the kernel. User space gets the shadow path
> >     from /proc/mounts...

Don't know if we want to go that way.  Is there no other way?

But if we do, at least do it in a generic way.  I.e. fuse server can
tell the kernel to display options A, B and C in /proc/mounts.

Thanks,
Miklos
