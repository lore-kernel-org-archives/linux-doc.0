Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1078F2B
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 18:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755195937; cv=none; b=rhdzLAjzlzrAMk6rrNxmWJUJ+FCxjXVz2OOSTEHvMrnajaIOS4xC9nwz3fVn8sM1VRNctiGoR+BzxIQCm6ap9TYoqTuDgL52iafo9p4WFNj+3rS+a1Vbb9Zc4dk5dmqXVlT+q7tab94h21ylPTGkPOVbUtEVGMm0Lmik3Mr6Bxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755195937; c=relaxed/simple;
	bh=QlxV/Fo/vL6WCJNsSwAfnDwsEr9HvLtREXvO8jaWoVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLDsRkObHHDVcwTQuLD8fu74lhl2NgcajIVdEu5grVaaJxL4mPRgAnwoIfRuh1XfWm1Ad2OQ9ydf3aMossUCwHRYffDm7uapeqGmzY1W3rsw7BaR+zz7g5njLzNGER1ozmQ5+15BGRqJ6POXafDz9wl7DWkiD+eIHrYH10QVdVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ko1yaJ1J; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ko1yaJ1J"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b113500aebso5337601cf.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1755195935; x=1755800735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaG/9Mc3gO9Z05dXGGeK8opCDGdDbOMVGSG4B2PlDgg=;
        b=ko1yaJ1JMyXmfvMTXB7j9EYtUf4g8Ob8wi0QKyQLB6zSJwBFHgye+nIkfRwA5sHaD5
         vFMD4P+YScuUtz6XGI0kSMNDuvJfzyaRVD3QKounFxB18buI4bsRMakeb383C6CynIQc
         nZdVeIxc3MWo+z0MtXrcucnhvg7NMO7KTR1f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755195935; x=1755800735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaG/9Mc3gO9Z05dXGGeK8opCDGdDbOMVGSG4B2PlDgg=;
        b=M8OCSKzGDVsjYx9dP9pYNj70xTIcijlqI+AK11BbTCcZm/SpHU613RDEEK8KH8hqRP
         EaarZjr5PcpAkt1T+V7zaRwJCL3jkI+7tSB+8WGyovk8j5PXoZ/UoF2wFS9LbT3/hYiO
         WPU759Mxe9Zht3wDVlWXPOaW5gOL1FWv5tixeP8IG6YxkGHXahSR74H306mm+FLN4yXH
         rQN/GeOt/2wah4dddxLwrAwxFXpsEsmH97+cfU/q7vPLwCGsYGYhYCmdzeDnfr+ZJg7L
         jd/4SaUUUj0ar0rJvU9GTfm70DWgmkYgQsnK4ocM6xytze+I3fWq+DgLeZV8I+GmBigw
         zfuA==
X-Forwarded-Encrypted: i=1; AJvYcCVOJ/4G9qkY/dYY3XYSYWaacfVjK6ABLXoy6jNCnMC3y1fOkNEkfDSI0Wgnwo2A1MejLdvxpK6k8B4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWmryURC8yY4RoenMlsmrAfYqECU3Oqnws/1v4VcMR0gJKMJXr
	tpvJxgPF5T5hs7NISXsxCpCpSNiTmEDGNTHY8fLCc/Qy0FuKpOGR7el5NaVmRqNwgfZSsULC0LO
	veSEyt2IW45JHxotzUijFcUUG+/3pKJTVETRbTJzyZA==
X-Gm-Gg: ASbGnctKi2LhYqZ7RiPh6L9yZuIQeRLhAVJvgRJl1ZALIrhjAanIGEZ4CtAToy6f605
	NXJnKNOwQwotqGZYo5c5cXWf6lpJYQU+sEtmjE6ktPPpKQUZ1WMJqZBwsXnxfP0TS+SxetV7nOR
	1VXTB4ZQqYQHHTTgCExrsxv3kwJPBbeu4jDU/h/bBnwrM/kdwSzE8N7RzLdmAtFnbO0/CCSNz4h
	mmk
X-Google-Smtp-Source: AGHT+IGSn0lQHqZ9RP9BbaqY15avh0lMZ+NAOhYoifmbXNq37t8nR6rR8emWPkr9ymaCKi05XQKiq/L5hGeuPEvoQWk=
X-Received: by 2002:a05:622a:2c3:b0:4af:21f6:2523 with SMTP id
 d75a77b69052e-4b119812238mr5676291cf.6.1755195934739; Thu, 14 Aug 2025
 11:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703185032.46568-1-john@groves.net> <20250703185032.46568-15-john@groves.net>
 <CAJfpegv19wFrT0QFkwFrKbc6KXmktt0Ba2Lq9fZoihA=eb8muA@mail.gmail.com> <20250814171941.GU7942@frogsfrogsfrogs>
In-Reply-To: <20250814171941.GU7942@frogsfrogsfrogs>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 14 Aug 2025 20:25:23 +0200
X-Gm-Features: Ac12FXxTdDrnRb7Tf9wOWEPTOrq-mapbwGaLhT9s1IZLVbyqxOHLM2quCQmv3sc
Message-ID: <CAJfpegv8Ta+w4CTb7gvYUTx3kka1-pxcWX_ik=17wteU9XBT1g@mail.gmail.com>
Subject: Re: [RFC V2 14/18] famfs_fuse: GET_DAXDEV message and daxdev_table
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

On Thu, 14 Aug 2025 at 19:19, Darrick J. Wong <djwong@kernel.org> wrote:
> What happens if you want to have a fuse server that hosts both famfs
> files /and/ backing files?  That'd be pretty crazy to mix both paths in
> one filesystem, but it's in theory possible, particularly if the famfs
> server wanted to export a pseudofile where everyone could find that
> shadow file?

Either FUSE_DEV_IOC_BACKING_OPEN detects what kind of object it has
been handed, or we add a flag that explicitly says this is a dax dev
or a block dev or a regular file.  I'd prefer the latter.

Thanks,
Miklos
