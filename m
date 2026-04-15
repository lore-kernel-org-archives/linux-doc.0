Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76831DC198
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776260103; cv=none; b=tVy2w4IxOhQp3RJ77dwmXeMaX0a4rZKNT12/gU2kx9hYHwqdS6+9Old4qNYUQRcPR0hy599AH/f46gwlc7GARpjwnvhvx6Qu/SoxISBCD0XfLw411qxx7mHPXrBdfsFUrbZcnMy56h3pdODSgQe0/oaL50qxtX+fBmrjx0hozbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776260103; c=relaxed/simple;
	bh=t+Xy3C2Mbde6Vr6fstEOcu/315GZEmI8mjVuAP1RX6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ws77chT79jcHrpUHH+n8j7bvr1XIypPg70VfF4hyY4pD7qu3cEwkgJVNR6QG+Y+ByFx9q7rVp9t/79orM/rw67dhpckJQexeBzPp95iXU/SrF9Ou7zd96ill2swwvzKoYVlYWKVVpoxZxhUBgKU4/CK2yvk+R/FG+sxFbwKIU8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=PXKrfb51; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="PXKrfb51"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d6b9bca48so88770901cf.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 06:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1776260101; x=1776864901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6GdYNWBfaWYhLIdfOtbeuO4AqRlccwz6nlSiifbQOw0=;
        b=PXKrfb51sn9myKAjoNJsPfvw4Ez9mKBlE3emDO3GqJd4UwLrE80Kx757V733TARXc+
         GXMpvqL7AP3bux4x134O0TqEuJksA9cMK+m5btI5eDCKSFNIuezfhZGRPrdl6B/v/vIp
         rtznZ4X+DWhmAkAUVM/oth8e6gtFQer/0Ki518YFo7inP8yIvdcIGEIn/t6tOi/J65Pm
         Ld1Nbrg0tyz776YU332TOtlGKToWsVD99ifnHEQjRv2hqzOCkWwIYPiE4GiySh9RolM7
         lQgEvotqu7JzsCfgni5qCi7ulsmbfUybHEhBwlVLd1PZ6jnN0QEaICaw+Eqlfn1V2Som
         y4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776260101; x=1776864901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GdYNWBfaWYhLIdfOtbeuO4AqRlccwz6nlSiifbQOw0=;
        b=L8dWSb4/nBPyR4t1HGkXZxsBCWUMukKqAe17TPhLIKSJXgyEAEFRjF5IiCAKfCEBwL
         sNuaEyluZ9YfLAzQ6wgHX/gcbY8K9YpMjy8+UCOAvVEFNGgzR2q2y8CsH2Ef8vRaRmEt
         uHFD/1oB2dk2IFuZ9WzY/tVit2lHBkOZTavbl3aFxTYksUHZhpFS5arVO6R+YLZyp8Ws
         It7cQzXnPXz+MGfr9klbjiFUFTiagvLhPbgCajol/3YyKDOCzY/4z6I2513+vwqyrNy6
         vOxtxUadt9DhFIrQrkMjgi96ARbM0HtbIoXntM0+s9aRRlJG8HoIMAjHRp1bWA5PBtoN
         LD1A==
X-Forwarded-Encrypted: i=1; AFNElJ9/r02WfzQUzO+m4cL8ICZ+9Rjre95nb3qbrrahrlz9FFb46ifI3RA8DcQJu7rVjPIs0qHpJmZU/FY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzADlDqHtp9wtoG+lRRICh7s5WZLL4MIs8PaQLJxWaQ24x2U2V8
	MiiNwr81zDPL2l/pFwHajm1p+8Kl4L55Fo9TzKdRS8+R8eD6yh6S7Xia0wMfVwy7mJU=
X-Gm-Gg: AeBDievMH9IWoSn1wpS2hWoNcIQcluSsXV+DggqRKDpYtCTk100RXXr2Wbrdpewzv7Y
	fnGp3BZjltHkL8wp6YuBQJklJJHmTVp2BAqZZqxf5veqldjyoQ2I7mxftjF/PaSsnFqQT6uMpdy
	m3U9vUkTLE2EOvDW935cVZIotsIa6uZbLMG+aJdN2sWJ5Xehu2A89NYeMZa/40uqr1kqVWvmA6V
	+cZgF3dR+1eoOi4luEmOxl4lD0R/Kvat9D+53EQRqZezMDg/Iyu6i+LPUntPwILDTGtWZG4uyyF
	IHVxGdBckLwO2m/uSBIbpTZ48v28wPT/ItlNlS4Tsiwf2QeCamkNXCb5B0aK5mTRdssqjNkXzRX
	9uEprFlaeAF4XaD85i7kQPN5PHX5T4aZzxjx+w/WIilo8vdrhkG0NUm+kAoHytsALLfXieg79Fy
	2u7JExJxKpMWKFTfQAuG0lzsUa13GSrbF6pAYm7L+bler2hXn89ARDXXHQdX8Y1PGL6MdUhLGkM
	bvqVVlcjSiLUl273uNDlgA=
X-Received: by 2002:a05:622a:250a:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-50dd5a44875mr321999521cf.0.1776260100492;
        Wed, 15 Apr 2026 06:35:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-243-150.washdc.fios.verizon.net. [71.191.243.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6cb9ea1csm13877066d6.28.2026.04.15.06.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:34:59 -0700 (PDT)
Date: Wed, 15 Apr 2026 09:34:56 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, John Groves <John@groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Joanne Koong <joannelkoong@gmail.com>,
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
Message-ID: <ad-UAMcALRubBcHk@gourry-fedora-PF4VCD3F>
References: <CAJnrk1ZRTGWjNzkMxS3UkeZMmrpadJDtWKontMx2=d-smXYq=w@mail.gmail.com>
 <adkDq0m5Wt9YhJ8A@groves.net>
 <38744253-efa3-41c5-a491-b177a4a4c835@bsbernd.com>
 <adlBcwJjLOQDAR65@groves.net>
 <CAJnrk1a06zkUmXW5EFiUmgAoFauwtzsYvnotaPH0ifVtyh7iDQ@mail.gmail.com>
 <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com>
 <ad4_jFsR951c2Mtn@groves.net>
 <20260414185740.GA604658@frogsfrogsfrogs>
 <ad69tTnx5YkD4Y9K@gourry-fedora-PF4VCD3F>
 <f254f6fc-dc06-4612-82d7-35bb10dbd32e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f254f6fc-dc06-4612-82d7-35bb10dbd32e@kernel.org>

On Wed, Apr 15, 2026 at 10:16:38AM +0200, David Hildenbrand (Arm) wrote:
> On 4/15/26 00:20, Gregory Price wrote:
> > On Tue, Apr 14, 2026 at 11:57:40AM -0700, Darrick J. Wong wrote:
> >>>
> >>> I very strongly object to making this a prerequisite to merging. This
> >>> is an untested idea that will certainly delay us by at least a couple
> >>> of merge windows when products are shipping now, and the existing approach
> >>> has been in circulation for a long time. It is TOO LATE!!!!!!
> >>
> > ...
> >>
> >> That said, you're clearly pissed at the goalposts changing yet again,
> >> and that's really not fair that we collectively keep moving them.
> >>
> > 
> > This seems a bit more than moving a goalpost.
> > 
> > We're now gating working software, for real working hardware, on a novel,
> > unproven BPF ops structure that controls page table mappings on page table
> > faults which would be used by exactly 1 user : FAMFS.
> 
> Are MM people on board with even letting BPF do that? Honest question,
> if someone has a pointer to how that should work, that would be appreciated.
> 

This was my first reaction when I realized the BPF program would be
controlling iomap return value in the fault path.  Big ol' (!)  popped
up over my head.

~Gregory
