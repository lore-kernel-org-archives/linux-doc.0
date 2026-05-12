Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8033905E6
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778593673; cv=none; b=SncbegZNfzUGh03dC13bEBdjAKp1KdDl0v9KKEoBRgkLELcvK4xbhBzGzw1E9zbLP177HUCYjKpgl0MKD7c6y/c4XvJ8143kgVPfJGWqEzvdiC5NJXz1zDWeotxjQO0/daqaklJMkp76D7Qel0LW0LXNOUt351fgLekcAYJ/nuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778593673; c=relaxed/simple;
	bh=AHvaIjAEownr1UuDMvzjOHmJ1x9P7IhUK8cJvIHHPdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTGU4U8JmaUT3rPXjvxaE0NjYefo5CaWiPCIkZNPExdMTPYEVw7GsdMsSFEUiCPVp6akp5KKwkc7pK3s2MGUBqbD+eYk7Rp1D1r/hv2KFBAwIHkP/Nl4tdunZL4Y0R0B0aO47JDVuEHrfAsw3+j64lMfnoeMq6hTEvxTUSvz40I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PllI7iZP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PllI7iZP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0D0A1655
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 06:47:45 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B147C3F85F
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778593670; bh=AHvaIjAEownr1UuDMvzjOHmJ1x9P7IhUK8cJvIHHPdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PllI7iZPE0ks8BtlOuIQOU0IdOSZqfe5UQSu2sb9d3lScI+IRM2RtpnN932sIHSrR
	 VZYQTuJKlEhZ6ye/gNHqjUTIr5FRd+I3gR2a7KZ8HG0SK8Dh/sdT5WNSFmwoiHgJBA
	 k3mtO/WZlklOnQicwNcAOvtMLAWz3szHv3O1mgPE=
Date: Tue, 12 May 2026 14:47:27 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Steven Price <steven.price@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <agMvb_jeRsO7tSS-@e142607>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com>
 <20260507135356.5428d50d@fedora>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260507135356.5428d50d@fedora>

On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> On Thu, 7 May 2026 11:02:26 +0200
> Marcin Ślusarz <marcin.slusarz@arm.com> wrote:
> 
> > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
> > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_device *ptdev)
> > > >  			return ret;
> > > >  	}
> > > >  
> > > > +	/* If a protected heap name is specified but not found, defer the probe until created */
> > > > +	if (protected_heap_name && strlen(protected_heap_name)) {  
> > > 
> > > Do we really need this strlen() > 0? Won't dma_heap_find() fail is the
> > > name is "" already?  
> > 
> > If dma_heap_find() will fail, then the whole probe with fail too.
> > This check prevents that.
> 
> Yeah, that's also a questionable design choice. I mean, we can
> currently probe and boot the FW even though we never setup the
> protected FW sections, so why should we defer the probe here? Can't we
> just retry the next time a group with the protected bit is created and
> fail if we can find a protected heap?

The problem we have with the current firmware is that it does a number of setup steps at "boot"
time only. One of the steps is preparing its internal structures for when it enters protected
mode and it stores them in the buffer passed in at firmware loading. We cannot later run the
process when we have a group with protected mode set.

So unfortunately adding support for protected mode where the heap name is provided means we
have to try our best to set it up at boot time, or otherwise disable protected mode support.

Best regards,
Liviu

> 
> > I'm not sure why it's needed at all, but if
> > it is really needed, then s/strlen(protected_heap_name)/protected_heap_name[0]/
> > would simplify this.
> 
> It's not so much about how you do the test, and more about the case
> you're trying to protect against. I guess here you assume that
> panthor.protected_heap_name="" means "I don't have a protected heap for
> you". If it's deemed acceptable, this should most certainly be
> described somewhere.
> 
> > 
> > > > +		ptdev->protm.heap = dma_heap_find(protected_heap_name);
> > > > +		if (!ptdev->protm.heap) {
> > > > +			drm_warn(&ptdev->base,
> > > > +				 "Protected heap \'%s\' not (yet) available - deferring probe",
> > > > +				 protected_heap_name);
> > > > +			ret = -EPROBE_DEFER;
> > > > +			goto err_rpm_put;  
> > > 
> > > If you move the heap retrieval before the rpm enablement, you can get
> > > rid of this goto err_rpm_put.
> > >   
> > > > +		}
> > > > +	}
> > > > +
> > > >  	ret = panthor_hw_init(ptdev);
> > > >  	if (ret)
> > > > -		goto err_rpm_put;
> > > > +		goto err_dma_heap_put;
> > > >  
> > > >  	ret = panthor_pwr_init(ptdev);
> > > >  	if (ret)  
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
