Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ACB3A3801
	for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432632; cv=none; b=TlxA6WrJDNNGymLCBJ1vvUMtanB+YUf64PjG1nO1ZDSupqZxG+NHVDY5+BpvPuXKTK1bMFaMWSmhK5VzajeS0t30rfHi/XRCturmkmoav1m6o1WvQpVCTSrqlUMoxse4uO4AgJRJ9isCnNO2MXM6Eq3I5cUUb3Q5Qu3sLd6/0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432632; c=relaxed/simple;
	bh=hkpNLJ3ybawOIa1fkGOwYhoNiDG571CgTvN9uVT7u+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEA2VXvM9/TwbbwbI3FqYPu6PcrDQ9DYnEpl8gj+ykyvudmZuoIKZ/FzRNGQuSOkDdbONB7ZhO6ddoIkJb3lOY//1XcQ8c5UHp/GdJXO4yXSWPTREQUPoiM9ilH7cdJ2YBSZQuJ2Ym+zQqPCpmrlal+SEB2H5m9mw0vxUnXrnjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fwqU9rc9; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fwqU9rc9"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-506aa685d62so3428921cf.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1776432629; x=1777037429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xgTqv4J4Fl9HXQyBvnfY8cYHtSEuC0puU/+LlJmiu7o=;
        b=fwqU9rc95o1LTxXbeM3xVzr/YEF6qQLLwnIhwMCPZzaaEAl6BjYzd9K4SMG+IkvcuM
         6mF3iufDqSliJDpuDd/qFSvj6sge9Bl6ut1WQEhwxX0NgfPVSWBt/NIEhoSvE9LQky4a
         ziPucVpAOTXZqRs1IfU6TcWSLjQa1gWhvYBhb+gLbuOTkswwRsbepenvXxOBM0cVOhdU
         kJ8LZl5X0d7GiOhsaUPmwijnaf6SX7xQfBrOoXP+sYNxndqV9EygIoLTQephxZOm6Me6
         iEJgTv8oYwCldLJ0rlD116HeN2ahjql2pDnql+FNBAYlDIyU7quduG/rVTPQVc1ZAxVX
         WNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432629; x=1777037429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgTqv4J4Fl9HXQyBvnfY8cYHtSEuC0puU/+LlJmiu7o=;
        b=Wou4M7i13lFSByAMeqPaJiR9cpp+rJUV09mCYhzNF7kvl0khg4koIuUNBVVX1UvXtb
         hIKER9qvyOCkURvPrlunALFez/oGojmnAmgYgCETAXTUxBioo6DBrBEqsFJJZMZ/A/67
         53pOtdme3QbVsPmzn3+A9aoNW8CpwUuR68Fsa+jjefbzjrNlEMLZJSM4MI4qmtIv16ld
         c4xsl0JvcOC9/rBfXYS5FjJs/h9yK8JKzgxPfgzn53gY6mZ+pCiATM68g0hEoPQaozso
         g87xbI9cDlTVX3ytaVciPctYU6dogWDgiDvMnw5aI6/pjQKA/YorDy+TLbcf8wrA2RpY
         97Lw==
X-Forwarded-Encrypted: i=1; AFNElJ9WwEbEB7njECfPXJvawwA5G2xaQtzSMEm44Y+ZA3aCLdq1DTyPOYj61NOvCU6lF6WTOM6PD1P7Ej0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUbeg5AW+4xtwQUPvgVvh1Hbwaqu4juPIVh+58MKgPXhY5mVVZ
	aBuOlDYnjObZ2eUkzm4cSi9uyFYBp3YKhHMonZh78Ej5eA374TDiBFKROTzN4prqgKo=
X-Gm-Gg: AeBDiessshN8wH5fr3uHqrXlAVQ9UlMGzq3sYuSmJHfZjrf/g9ogImuejyoOGmY/cKW
	8ONWbhRBoQGYlL8zFhEd2w6MvJOplSMSri9y8pVZeQCnQ8hZWKt81P+FGNimHymPf9GgIGBFVAD
	xvTs4AGd1/49miVrRFiIWoitB7d1gk2jNVDHU6yWn4tcFXRrIH1iamnXPPFTWHdru7aZSicZnWv
	NBWX1qXXio/VqPWY2XGHLMWe+XHutdTCbvCgU5tsPHsMqGtaR9AcV8p9uSn/q2NyeuBruwd1Xu7
	Db4IrWsB0gjiXQjNC9P11mhnzoJNiNuiAqhYpp/43hA7/Sp3wdev2kB14imLO2GY0jhH+FVpGBY
	SdNtX9Ve07IkDFvhsjpdzSpeapvDCQ9G9b7JdZ7cxz/PR8JWuuac0IBwpDKVpFnfx6cW1M/eiLd
	6d6TCGcvPjCzrJjoSfp5+zSIPiwlHywEAY7gAJqqcrsUDHnp5XEo1+hgEbiW8BrzmtVLeEASdFd
	SqbCigVBPTvz5slCi9U
X-Received: by 2002:a05:622a:1f17:b0:50d:80ee:3962 with SMTP id d75a77b69052e-50e3683091dmr40533621cf.17.1776432629479;
        Fri, 17 Apr 2026 06:30:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-108-18-109-80.washdc.ftas.verizon.net. [108.18.109.80])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e3bf260fbsm9752291cf.10.2026.04.17.06.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:30:28 -0700 (PDT)
Date: Fri, 17 Apr 2026 09:30:25 -0400
From: Gregory Price <gourry@gourry.net>
To: Christoph Hellwig <hch@infradead.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Dan Williams <djbw@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>,
	Bernd Schubert <bernd@bsbernd.com>,
	John Groves <john@jagalactic.com>,
	Dan J Williams <dan.j.williams@intel.com>,
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
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
Message-ID: <aeI18Q2lcxZLw-1V@gourry-fedora-PF4VCD3F>
References: <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com>
 <ad4_jFsR951c2Mtn@groves.net>
 <20260414185740.GA604658@frogsfrogsfrogs>
 <CAJnrk1ZgcMuwfMpT1fXvUwBBiq9eWFHWVeOFQFFKiamGGe1RJg@mail.gmail.com>
 <ad7Tps4tkNbndd9Z@groves.net>
 <CAJnrk1ZWVsKW2dhAWdBkCQskoTE+hmOhPFDhyz4EtExn=GdXGA@mail.gmail.com>
 <aeFDCeqZDPI3rm3s@gourry-fedora-PF4VCD3F>
 <43d36427-4629-4712-a262-391e64006eb5@app.fastmail.com>
 <20260416224331.GD114184@frogsfrogsfrogs>
 <aeHrsIGagdmZJ1Fw@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeHrsIGagdmZJ1Fw@infradead.org>

On Fri, Apr 17, 2026 at 01:13:36AM -0700, Christoph Hellwig wrote:
> On Thu, Apr 16, 2026 at 03:43:31PM -0700, Darrick J. Wong wrote:
> 
> > ...however the strongest case (IMO) would be if (having merged famfs) we
> > then merge fuse-iomap after famfs.  Then we extend the existing
> > fuse-iomap-bpf prototype to allow per-mount and per-inode iomap bpf ops.
> > That enables us to analyze thoroughly the performance characteristics of:
> 
> Don't go there.  I think that you two are comining up with two
> interfaces for roughly the same thing is a pretty clear indicator
> that this needs to be fully hashed out as a single interface first,
> and any kind of preliminary merging is just going to create problems.
>

We're not sure how deep this rathole goes, and John's work has been
in the rathole for a few years now.  Hence the desire to hedge.

But it's obvious no decisions will be made before LSFMM - so we can
take a breath and chew on it. Maybe we'll get there in person.

~Gregory
