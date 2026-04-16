Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D133314A1
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370453; cv=none; b=IoqLCZLzyHFJT4ciAe1+xjIpj5IldyTE/bKHSoNMl3HK0cLruxUpanQ06ptKkY9pcgn3nvQu19eW04zMEWmyBx3ppD6Wgh1EZw0EB2YmdwHG6CtpO7nM3Xm8DT+B91rJbkCLBNWx/kxlp07Te17mhZ1ziqbFJB2n7QuwqZbJtN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370453; c=relaxed/simple;
	bh=e7Fg9iUXgdaJVBpIOwk6ko7gURjRziHIJE6o8vDP+M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOfUDZ6UV2TdBRgRHyDkX/+YdUsSc5Bs/Dez+DgIU/aAxt4BBDtyNEp4SvEwzKIXjr2St+NpfYWTMNznc5JU2JcKwk6DqqZ0EoDWdzHkeJeFMDPmYDyv82AHa4/Wt81kqPlb3lHzPrloEauKYh4RZ7mSeogtrL0VSBs99qIi0DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Uc0Dm969; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Uc0Dm969"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8a016799d2cso89891216d6.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1776370446; x=1776975246; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VzpFkDx1hfZFcFbwqFMS/1j2riFwDbWAqbQBRsqDt2o=;
        b=Uc0Dm9691QttaHiQ2miWbg1h+IrKvVy0QQL6oQtINE2G3cHWxejGQrV5ZkiPBskpgC
         AFqSwduZtN62KJCgsug0oXiVu48Sl0WY4BMKyt3QmGZvKHPlv+xMe19wC8ma3jqDFC30
         y7z8Nppn+fpIgJW/zWuXgDvJeKJsBFBd7L9MqXMYk8ITnjfIte4DOul/0J1lBlSHk+sF
         Q5H6jSPQbUVkLr4sItsPJR1Rvaejh7nV5YYOwiQIFJCkrqpvXduKW0XsHKV7m6sIu4iD
         cQAAjlAjXR3WNclKnqARMzPZoNJrQy4ONTeOSXsBq733bKvUZT407VwGWd62v1D8k2HP
         cSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370446; x=1776975246;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzpFkDx1hfZFcFbwqFMS/1j2riFwDbWAqbQBRsqDt2o=;
        b=eI3ljNXW39J68yYL0UnTOyeym37DaI4Jq2JAAEwWn9mV6NeXa0IkeG7jvfnDbznrfw
         93fC6jWYiAA2ZBphvludWHK5F2Wxh/tXqSSOKcqiX/u/ljJTS2W2UarM8SeHdhV05YEZ
         0fjFrT+KBBFyVzD9YFM2vXJ73w5KIzZs8qscvPe6G00mctMA9HvLxcoo9DiBurBSk8rV
         aQoMzo85BSVGuvGIYvAOfjwxEBBZ6PnOdyp4vziMblrit4TRA4Kok7dScDxFdv/gtYQR
         +dLBWUmD1ITKOQgj5ETH7ZnaKCEufX9J0X2U6ZR2lwl/hshL7O0bYeMLPe6tp2AL9fxY
         r1Rg==
X-Forwarded-Encrypted: i=1; AFNElJ8+IvI4Kd0FRrwRcDSvudJyp54mVEuVELXINOsiR1H45qpRZJ810xUSELupemRIEMQ99O1czLmOQp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfVp2Ol69rrmLfiRdF+3Cm8/2jnkp3gDkVPPi3zMBAAJm/Jg4G
	Lm2p9WrEDfCLE1l3TdrK7VQyDtPN8ABW8+qwg2xvcJ792nLWLpqjxiy80qCdUMPoaWA=
X-Gm-Gg: AeBDietLwR35JapgSXwhcv/uv0J2sUWkSzNw5NaM5XWEVstObjUVP1MGQjzmYMhGCRi
	0KVXSYNqjupkJZ0WwaNhy82LM4KJYsaXLWs9wFfSI+9a48otF3JuClyaauXV9zv3BdQR+7LwEXx
	eDoHWBlXFwUpTwIv13QGayJgv93MNzuTioFo65N1L3cLuw3qieAanCM/yuMQRa8OTYEh8MIp3Rz
	zF6rMBdpkPZ0TntnFzGolXhWTtwlnX/iCeCQR/oUdgFLnQnpeRKxiSlA4qfBZY2uhOk0M7THn+3
	mDkFHMPR1BcdNmNOjdTmiNeYBZnY3jYc/0hLlYE5hU8X6UT2BJwZ8OkK+ZStJINNy8fERmY8QU1
	db826JpxI4wJ0N2jKJshR7upLcmgYoMCpUfjWcC7ErrBAfKfXyyh6FN5wRkYR6jpMEdGmf5QEt+
	r2GdiVgHbQftFbvX78KjU6xGMCr3+lNwrZTfIK5rqDQmXt/C8QtcwKxZaq0jQ=
X-Received: by 2002:a0c:f09a:0:b0:8ae:6347:8c8b with SMTP id 6a1803df08f44-8b025ef029fmr11410336d6.37.1776370446430;
        Thu, 16 Apr 2026 13:14:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2607:fb90:ea1b:4643:9f36:3ffb:fc60:9518])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6cb9ee20sm43873996d6.26.2026.04.16.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:14:05 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:14:01 -0400
From: Gregory Price <gourry@gourry.net>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: John Groves <John@groves.net>, "Darrick J. Wong" <djwong@kernel.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Bernd Schubert <bernd@bsbernd.com>,
	John Groves <john@jagalactic.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>,
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	"venkataravis@micron.com" <venkataravis@micron.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	djbw@kernel.org
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
Message-ID: <aeFDCeqZDPI3rm3s@gourry-fedora-PF4VCD3F>
References: <adkDq0m5Wt9YhJ8A@groves.net>
 <38744253-efa3-41c5-a491-b177a4a4c835@bsbernd.com>
 <adlBcwJjLOQDAR65@groves.net>
 <CAJnrk1a06zkUmXW5EFiUmgAoFauwtzsYvnotaPH0ifVtyh7iDQ@mail.gmail.com>
 <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com>
 <ad4_jFsR951c2Mtn@groves.net>
 <20260414185740.GA604658@frogsfrogsfrogs>
 <CAJnrk1ZgcMuwfMpT1fXvUwBBiq9eWFHWVeOFQFFKiamGGe1RJg@mail.gmail.com>
 <ad7Tps4tkNbndd9Z@groves.net>
 <CAJnrk1ZWVsKW2dhAWdBkCQskoTE+hmOhPFDhyz4EtExn=GdXGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJnrk1ZWVsKW2dhAWdBkCQskoTE+hmOhPFDhyz4EtExn=GdXGA@mail.gmail.com>

On Thu, Apr 16, 2026 at 08:56:46AM -0700, Joanne Koong wrote:
> On Tue, Apr 14, 2026 at 5:10 PM John Groves <John@groves.net> wrote:
> >
> > There is a FUSE_DAX_FMAP capability that the kernel may advertise or not
> > at init time; this capability "is" the famfs GET_FMAP AND GET_DAXDEV
> > commands. In the future, if we find a way to use BPF (or some other
> > mechanism) to avoid needing those fuse messages, the kernel could be updated
> > to NEVER advertise the FUSE_DAX_FMAP capability. All of the famfs-specific
> > code could be taken out of kernels that never advertise that capability.
> 
> I’m not sure the capability bit can be used like that (though I am
> hoping it can!). As I understand it, once the kernel advertises a
> capability, it must continue supporting it in future kernels else
> userspace programs that rely on it will break.
> 

FUSE_DAX_FMAP is already conditional on CONFIG_FUSE_DAX, the kernel is
not required to continue advertising FUSE_DAX_FMAP in perpetuity.

Setting CONFIG_FUSE_DAX=n does not mean userland "is broken", this would
only be the case if FUSE_DAX_FMAP was advertised but not actually
supported.

If DAX were removed from the kernel (unlikely, but stick with me) this
would be equivalent to permanently changing CONFIG_FUSE_DAX to always
off, and there would be no squabbles over whether that particular
change broke userland (there would be much strife over removing dax).

While not a deprecation method, this is what capability bits are
designed for. Same as cpuid capability bits - just because the bit is
there doesn't mean a processor is required to support it in perpetuity.

They're only required to support it if the bit is turned on.

---

I think the focus here needs to be on whether this interface ACTUALLY
needs to be more generic - and whether that is actually FEASIBLE.

It's not like this is a new problem - and there are real design reasons
why John chose this route.

The additional overhead is not trivial for FAMFS - FAMFS is not doing
i/o.  He already has data showing fuse caused a performance hit due to
overhead on open - his concern of overhead on fault being catastrophic
is grounded in data.

For others it's an age old problem of self-describing protocols (parsing
vs giant inflexible binary blobs, pick your poison).  It's extremely
unlikely we will find a one-size-fits-all solution that doesn't
eventually run right back into this same problem.

I worry that this discussion is going to turn towards implementing a
solution grounded in parsing arbitrary formats and how to store them,
and that is completely detached from why FAMFS went this route in the
first place.

I question whether the actual issue here lies in the interface APPEARING
more general purpose than it actually is - and therefore inviting
attempts to over-genericize it.

Is there a world here where this is solved by a name change and a
capability bit?  I think so.

~Gregory
