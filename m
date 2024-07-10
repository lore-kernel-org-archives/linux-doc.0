Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2235E198837
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720636946; cv=none; b=fktB+j6b5+aAbYYjhCdpVfnyein+Q1OXbiVFqCvA9o0zO9a8s6TA1d5M7/Ae59Ds6ePic26HK8HZOUoyMT7r+FgrYbtADvW1WyBsAiDy2Rae5OpbnkjJIM4BWgb7tXXj94czcnQwA1eQCQXsWmgkZqQs/wKmfTzRlzTf3eVjMm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720636946; c=relaxed/simple;
	bh=z7s3LXExkLf7mTKfwyLpqVPSSjvCr1DLKubG8DRR2bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC2WKJCTlkIARdRzchOj1XJbo2WFRhTvvedJlS8F+OIpa8MnJ3rrx3xYfifmSTTmyBKrQ8ubWxMIpPjsz+lXN0kx1EfByrUzhwiWkebcOtejwPkIC1eABUVjRN8VTuDxGP3YKFBC7NwEPhmNcovn5AEjjBJXQfarcJZO9gzdsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=none smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b=nndmm/cY; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b="nndmm/cY"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d9272287easo59273b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 11:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1720636944; x=1721241744; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z5nCBdFttIMTAt1PN1Clapc3bcXDSgRnWnxI2ibS+Wk=;
        b=nndmm/cYNzLhcTyin5Z6zx4RY4lCzEtRGf5g8/wJf4jlaabv8Qe2E/f3bComW7ELT2
         QAYVyzPVez/JL791Za8lek9PaAny5RXwaXbKItTiHVj2lfFimcce6T6rJQ6SKWsolMZa
         jX0zG4wOxes4a9ioxsdAxh6rn6ab8cUSIZK+uw4goaW0o6LezMSGmg2oRXlJKuGTOSQP
         oMdt0Oei2zFzYO5ZwFO5fJeD/htA2ht2vMJihox15kv8YnfB5IIPIp/gPQEmGs0E4oHm
         n0QJ2UaS/3MzDJowdxDUm6UEr/Q6XpSRgOhB/nh1NwRhvdeqZzn8wKyGixZROjajGcqQ
         0NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720636944; x=1721241744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5nCBdFttIMTAt1PN1Clapc3bcXDSgRnWnxI2ibS+Wk=;
        b=BwZPpqec80mD0cS9DerSzy2dnkDdDQOam/SYoJhZkMfflUbNY7Jd9Nuv0qmWFLYkIM
         GzsBJC6STY0UOj10qQGPc1X96DFy/vRiIW0KpW2PaadsleSSsvqHMvEJdjlw1O9XiBof
         I6UcBuolqkrxpcDSst6y3kt/7KyQnEssLU1RgXrF5zbAzA28oaOVY4mlG0GmI+T1u68a
         uTZb3XTjHf/WKc4Ti4pJzjFy223P1k+S453fqBvTrf5wvwgWZpPGC+e3luQyQ/GBE0va
         6TONj+Fwr1z7lxD+H9EG4qcWnSmBsotLLeDyN7EYKIzKcxMO6aUgHh7bS2OEcgykpH6g
         Nz4A==
X-Forwarded-Encrypted: i=1; AJvYcCXTSSOTky7rhjRUkYAWyH0tOONsGdU0k9s19fw+LGMZA17qg3QD5CrsZFppO07Gug+NxC4Mn8IcyhNayYu23heDA316BcIGjYXO
X-Gm-Message-State: AOJu0YyiDffwLLBCv1xuBdbaI5HieQyhW+zB0aPYfIrYKVmk8Fu6ah5N
	kq+qYC1r141l0DPIQE/1DZ9G2zg+/RhhBYwO8103AjA1A0nHkBGFDLkSgkeljVo=
X-Google-Smtp-Source: AGHT+IH5L59JVMSIlqFO5Se0uoezNhLAnHyrij5dj6WxtIY70mJujX07Y62JOcO/CbsoL1OTg9rbqg==
X-Received: by 2002:a05:6808:170a:b0:3d9:28cc:5329 with SMTP id 5614622812f47-3d93befe3edmr7119623b6e.17.1720636944155;
        Wed, 10 Jul 2024 11:42:24 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f1902ac2esm217101685a.59.2024.07.10.11.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 11:42:23 -0700 (PDT)
Date: Wed, 10 Jul 2024 14:42:22 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Miklos Szeredi <mszeredi@redhat.com>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 0/2] virtio-fs: Add 'file' mount option
Message-ID: <20240710184222.GA1167307@perftesting>
References: <20240709111918.31233-1-hreitz@redhat.com>
 <20240709175652.GB1040492@perftesting>
 <8ebfc48f-9a93-45ed-ba88-a4e4447d997a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ebfc48f-9a93-45ed-ba88-a4e4447d997a@redhat.com>

On Wed, Jul 10, 2024 at 09:28:08AM +0200, Hanna Czenczek wrote:
> On 09.07.24 19:56, Josef Bacik wrote:
> > On Tue, Jul 09, 2024 at 01:19:16PM +0200, Hanna Czenczek wrote:
> > > Hi,
> > > 
> > > We want to be able to mount filesystems that just consist of one regular
> > > file via virtio-fs, i.e. no root directory, just a file as the root
> > > node.
> > > 
> > > While that is possible via FUSE itself (through the 'rootmode' mount
> > > option, which is automatically set by the fusermount help program to
> > > match the mount point's inode mode), there is no virtio-fs option yet
> > > that would allow changing the rootmode from S_IFDIR to S_IFREG.
> > > 
> > > To do that, this series introduces a new 'file' mount option that does
> > > precisely that.  Alternatively, we could provide the same 'rootmode'
> > > option that FUSE has, but as laid out in patch 1's commit description,
> > > that option is a bit cumbersome for virtio-fs (in a way that it is not
> > > for FUSE), and its usefulness as a more general option is limited.
> > > 
> > All this does is make file an alias for something a little easier for users to
> > read, which can easily be done in libfuse.  Add the code to lib/mount.c to alias
> > 'file' to turn it into rootmode=S_IFREG when it sends it to the kernel, it's not
> > necessary to do this in the kernel.  Thanks,
> 
> This series is not about normal FUSE filesystems (file_system_type
> fuse_fs_type, “fuse”), but about virtio-fs (file_system_type virtio_fs_type,
> “virtiofs”), i.e. a case where libfuse and fusermount are not involved at
> all.  As far as I’m aware, mounting a virtio-fs filesystem with a
> non-directory root inode is currently not possible at all.

Ok so I think I had it backwards in my head, my apologies.

That being said I still don't understand why this requires a change to virtiofs
at all.

I have a virtiofs thing attached to my VM.  Inside the vm I do

mount -t virtiofs <name of thing I've attached to the vm> /directory

and then on the host machine, virtiofsd is a "normal" FUSE driver, except it's
talking over the socket you setup between the guest and the host.  I assume this
is all correct?

So then the question is, why does it matter what virtiofsd is exposing?  I guess
that's the better question.  The guest shouldn't have to care if it's a
directory or a file right?  The mountpoint is going to be a directory, whatever
is backing it shouldn't matter.  Could you describe the exact thing you're
trying to accomplish?  Thanks,

Josef
