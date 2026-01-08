Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742EB44CF4C
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 13:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878754; cv=none; b=PFa/1xbI/Yb8PdAWp/S8nrj6z5IPPS53kE8BbTm1zz76RIlUyizKzcs6pt0t09t72Wt4WVlENve6j/Ege+dkfEtSNKteFj55m3m55WTr002uCgA1EDM8I9fUC1x9qYeLzk3kzIUA4zsBMdXwcMJRFFQT4Zm2ZBuZj5Enuc7QTOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878754; c=relaxed/simple;
	bh=jwFf19PSHKXwdf9bEk3kZxmxUld0e6v3BgfnWrHCUjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TF7syvtligVvJ3cwsLHkm3NJnpzmvUMEwqt6SmPiVvEPf3oBqiKreBg7L0zjHZ80vjR0AIHi4tAkSNHAEXYmpu1t1GWskbZVnKNeItYq18miutrelaD4QwYEg6qjftmmSidEMhmvhvKYslZ/Yc/P4hEddnHurR2XyOallI/7h40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+ubIeNp; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+ubIeNp"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7caf5314847so2069291a34.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 05:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767878750; x=1768483550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E49XAlEZRJNJzFNz0O0SAsxb11w6Gi0a4fcPebK/tXg=;
        b=R+ubIeNp/lncYOXBpbXdxWxD4pwGcq7tkrjrm1VRvjztIpk4hRG7WV1/EeON0ROBdI
         Aw4wvKH5g3ucA2mj6Vh8dqZRuuR/3h5QHNPC+LxkKDTECCrd11Mx3/pmm9zFu+wYCVM9
         2R40p5+/1Hd4aXVSYDstYBJfQyoqqPGWsXywvSGcHRhC8Yx8AJHMIZb9WF3wT/kE2Zpu
         A7xaKpemg5BFufEBSdCpwjdYQywy/oFM4y1wUDj3kScVn//AxI9ukSHVd/hAmMF6OHbS
         tZNrVTzkF7U/66ARQOi7Brv0iQafnFZAWUvsZ3l3x9Idt9K7l/tJ//kXf9xlDwIRmPGY
         xwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878750; x=1768483550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E49XAlEZRJNJzFNz0O0SAsxb11w6Gi0a4fcPebK/tXg=;
        b=Soa57YCaetsVSIbNK0FXZ6xAgnK0PNV1fKF9H2AS7m93ByOR5CsvbA0jwY5s/Nd2V7
         fMUoj3o0na+/hIzPG4mHeull6FAOV5o9BZYLIP80oZmdP8O/YL0ANYMeovuEOV/4faQr
         dghaxXNL9i3ekSRpG0EojVogjPzbUrTxn4vf1dXLz7C030dwTtITRkNbBOPfIj8+oX1s
         DdYFs+IZXEQEBfRmEjzllfXnor8P85rDeX8xtUCJCv7cehEFiT9oX0vXlRdQM1xe3iew
         WByhDQiASIfH6SG/UN0G3zHzSeyVRpz9sR+m6FH4eInYCR2rdMz6S5iTUe6coB0lkGd5
         1fIw==
X-Forwarded-Encrypted: i=1; AJvYcCVPIDrzNPcAwlGrdNT7ywFGmy54kSnY6U+XYs/QWZ6wx65b2UoF423YrTSGDMN/w8FLd3boEsIT1l0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0cSXcwbmcGNAx1oSP/YIJrIyP9TYdjejsRVIP+zp1NqromQk4
	gedW3qsqD++tTINbhEHpL+5kNyLIBjXH/DYPNq5tEU+9alaS1n6NT1NF
X-Gm-Gg: AY/fxX7H1bbvoWBo7/glGfvyquFk68ts0PLmM4lcjVGlu8hulCuwaqWuUf8H4iSPRpb
	apwIk4qLzno48DnJcx+x9IDOjzJAoh+bkGpSCmptmQ9YoOwJuYUlhvDvBcF+9lJ+Z7c/hmcSGL/
	Xhz6dgFnSlTrPHYfxA4NyAUrVWjRWjbuOdTDLy6/gACnRUXC6UPwi1QLBYKDDhkQW7O6no95CT6
	IfFEsx5qoi39zPoSAG6K5ks6vVxi4L4+odk79ineq4Zez/pWwzQypFQkmYJHc8pdS5Y5K8qx/+h
	ePGKYNdbh/v3rP7YJE/BSFzMEvJYlXInXzauKVve6sD+1pv5h6LZ8it91slAk1sOmwBiSngfFEQ
	j+SuhDiSQF/IxL0pZqPYZ8Il8bfXMM2MslQp65puOaJjBlz/1avvSjPlfX5YGngvTyZ/QCH3pa0
	EnE9aY/R0E7MRucBpQs2I0PcFRrraISg==
X-Google-Smtp-Source: AGHT+IHiefcf7btCQSFUKrAxCiXJ1hW45Y0S4Hc66MlrtJ5LVsP42OyHRUDsrUHUXG45rEL7nC8tMw==
X-Received: by 2002:a05:6830:411f:b0:7c7:6850:81a2 with SMTP id 46e09a7af769-7ce50b57c2cmr3718104a34.24.1767878750143;
        Thu, 08 Jan 2026 05:25:50 -0800 (PST)
Received: from groves.net ([2603:8080:1500:3d89:902b:954a:a912:b0f5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47801d63sm5317503a34.6.2026.01.08.05.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 05:25:49 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
Date: Thu, 8 Jan 2026 07:25:47 -0600
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
Subject: Re: [PATCH V3 01/21] dax: move dax_pgoff_to_phys from [drivers/dax/]
 device.c to bus.c
Message-ID: <3kylgjwvrdrfe5hcgqka2x2jsgicnnjssdpjrqe32p6cdbw33x@vpm5gpcb5utm>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
 <20260107153332.64727-2-john@groves.net>
 <20260108104352.000079c3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108104352.000079c3@huawei.com>

On 26/01/08 10:43AM, Jonathan Cameron wrote:
> On Wed,  7 Jan 2026 09:33:10 -0600
> John Groves <John@Groves.net> wrote:
> 
> > This function will be used by both device.c and fsdev.c, but both are
> > loadable modules. Moving to bus.c puts it in core and makes it available
> > to both.
> > 
> > No code changes - just relocated.
> > 
> > Signed-off-by: John Groves <john@groves.net>
> Hi John,
> 
> I don't know the code well enough to offer an opinion on whether this
> move causes any issues or if this is the best location, so review is superficial
> stuff only.
> 
> Jonathan
> 
> > ---
> >  drivers/dax/bus.c    | 27 +++++++++++++++++++++++++++
> >  drivers/dax/device.c | 23 -----------------------
> >  2 files changed, 27 insertions(+), 23 deletions(-)
> > 
> > diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
> > index fde29e0ad68b..a2f9a3cc30a5 100644
> > --- a/drivers/dax/bus.c
> > +++ b/drivers/dax/bus.c
> > @@ -7,6 +7,9 @@
> >  #include <linux/slab.h>
> >  #include <linux/dax.h>
> >  #include <linux/io.h>
> > +#include <linux/backing-dev.h>
> 
> I'm not immediately spotting why this one.  Maybe should be in a different
> patch?
> 
> > +#include <linux/range.h>
> > +#include <linux/uio.h>
> 
> Why this one?

Good eye, thanks. These must have leaked from some of the many dead ends
that I tried before coming up with this approach.

I've dropped all new includes and it still builds :D

> 
> Style wise, dax seems to use reverse xmas tree for includes, so
> this should keep to that.
> 
> >  #include "dax-private.h"
> >  #include "bus.h"
> >  
> > @@ -1417,6 +1420,30 @@ static const struct device_type dev_dax_type = {
> >  	.groups = dax_attribute_groups,
> >  };
> >  
> > +/* see "strong" declaration in tools/testing/nvdimm/dax-dev.c  */
> Bonus space before that */
> Curiously that wasn't there in the original.

Removed.

[ ... ]

Thanks,
John
