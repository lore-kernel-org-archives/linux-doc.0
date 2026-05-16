Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D52264C0
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778927635; cv=none; b=YLZdqYSfYjXVHIa+OpUUIibbfVk5x/wOrnRqJSk8HleQj96lUDDYsB/yCvF8v/olWPXymN4WqyL5v529+kLnrsrFdYTeoFaTgAEB/BITV5O0R/Xdic7HsTL6UTVxN0zuIPz08f4M7j/p8HT4SDWA4eY1OnSuJqG2M8ufPDora3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778927635; c=relaxed/simple;
	bh=FuvtoQBugX7lKG59TCI3KMuu2qI+UzI10zjoRTYacFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyPNVm9Lwp/0bBZ49XSYArYRo/faoEUl+4fmlBvHCPxbE6Vp2U64fV3ipK/MLcy9rRUcewgvQRKYV5l/TCLBOrk/i9XmdRDPLM354LHSB5lp3AApSnp+GDxKI+aKeLliYfTHGh0NzFzF+w8I4pGFFgEcHjKnbKSTSeEYKPGXIO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qz+K0+kI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qz+K0+kI"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-452169ae568so352160f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778927631; x=1779532431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tmDlgq0uLgD0NRXODmF5A8gxYBrdzp2qhaLJZG2Vx8s=;
        b=Qz+K0+kIygMvtjmc6ywX+hDfV1Dleob+laDAhW2KWYfFf8FfFrhI26kl4npcgpW2TM
         7xQfsG8VFTr0SW+i/Ei5QsPhbO4wUUYfa6EPZUi51Rt2hQqdup6Vq6zb0281J3nXsltb
         KS7NlBw03lCIdblqiPfXu114MijE56RIQWYyx9rXRRKLrHQbw29nUgGTfTw66fsI7Cbz
         4Yy881caXz6t15bLsf39Nc3L5eYboReG3thbzoZg3IDXy2Zus6ElLfyQZGY3IpgO8TNh
         tq0f0mK0hXEKZRzg2SSzUZLHn57giEhliWXpRrpkk3eWR+LTNm+ZMVZCgqbWllQQCozZ
         TLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778927631; x=1779532431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmDlgq0uLgD0NRXODmF5A8gxYBrdzp2qhaLJZG2Vx8s=;
        b=KoOF1BW/RamBTn9X8MILwGvQ4vZksdl3nWTXj7tVlwZw9SNXgNCpBa32tKt4dot1Vv
         1MnRLqsTMIcn+ZsmbxAsQjZkU136Xf4l1cdfvAJhxuQVbSrq/m3fW2f4OvMglQIU1Y7/
         oCb5p02p+KzjjRes5/Prb9fDVUHjP3kTPN0yCIlbi9jYghxJn5PPwTeLxQy8sepuxPrl
         ZxKRi8QeTk4qJQhxGEDvf+NyniTxulgvbQv7gl5q2ZsjgSXZT2pnivd4NFgMFTYAnnsA
         G8kkmmbowpjQdicMExEO6Uf9gU4Qc8tyopy3JUUeAbPE1KH88/0RAZrmhBUuuWP27+Au
         pV2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8e0gdF9KOh+KxSOjT6Gr2UVQ+hWsyGgMXlfSJJBJnGeTQJZiEnRBCoypnhjmAMez79N8XqNUpEhvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZORgZF7+2PsQmoEXaLzHL9/nRu1jvqKCpymel5jdbO24IurK
	mn2Dez7yQ4rhq70FwkVNH75pXIc/ERvJw9cEdgWkYHfEDct2RtmVsOXd
X-Gm-Gg: Acq92OHOZqqVEXf6+2Jb1waS+fsxaTJPNNF5M0t9Fnd+oCbPiQyn8sN4brjtgQU7pi7
	yA+Rpx82ZxI87dXpc+a2IqodevbdR5PX5EQXVoTr8Mpk2N37+kbO6rX4xc3T1/pZ+oDfO+FMV7h
	nlp+OtzplPD/NPees5USspZFoUQNd0R3XoyXy9quef2KsPukljlpypB4WbbWFMSa5t18iWj4DrB
	tvMecOZlwnzI2i3xKnYA7esWdCF/brieWEslUfsmLOSmkL9kE6O07GzOeM1ZGx6sCQ0sOqkYSVp
	VP9CKO/UaXKwuGL9s9uCKjcottnj9oMotnxf8iqBIpShG7sEOgTLn1ZCgJ68H4TjOZshgzuDdUC
	tvDGipjTsrjI3bv8VkiGWuwsWGU2oX3TdAsbWHDVtLs9IdsD1n1LAxxnv50igbuWj4S9TH+BAIl
	VNpQsyElR4tn0h94BjUZrWnBtUfBldA8Me80BkNxrLCHWbUpIxrONaxgFdOt0HPFfrArbFcQ1mK
	mwh3vKo4+knO3iB
X-Received: by 2002:a05:6000:d90:b0:45e:5c98:c8ed with SMTP id ffacd0b85a97d-45e5c98c926mr8135017f8f.21.1778927630643;
        Sat, 16 May 2026 03:33:50 -0700 (PDT)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm20703655f8f.2.2026.05.16.03.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 03:33:49 -0700 (PDT)
Date: Sat, 16 May 2026 11:33:48 +0100
From: Stafford Horne <shorne@gmail.com>
To: Horst Birthelmer <horst@birthelmer.de>
Cc: kernel test robot <lkp@intel.com>,
	Horst Birthelmer <horst@birthelmer.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Horst Birthelmer <hbirthelmer@ddn.com>
Subject: Re: Re: [PATCH] dcache: add fs.dentry-limit sysctl with
 negative-first reaper
Message-ID: <aghIDLYW91C4fcd7@antec>
References: <20260514-limit-dentries-cache-v1-1-431b9eb0c530@ddn.com>
 <202605152333.0pOd2zJR-lkp@intel.com>
 <aggTg7OnEm175nSQ@fedora.fritz.box>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aggTg7OnEm175nSQ@fedora.fritz.box>

On Sat, May 16, 2026 at 08:55:16AM +0200, Horst Birthelmer wrote:
> On Fri, May 15, 2026 at 11:09:54PM +0800, kernel test robot wrote:
> > Hi Horst,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on 5d6919055dec134de3c40167a490f33c74c12581]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Horst-Birthelmer/dcache-add-fs-dentry-limit-sysctl-with-negative-first-reaper/20260515-154600
> > base:   5d6919055dec134de3c40167a490f33c74c12581
> > patch link:    https://lore.kernel.org/r/20260514-limit-dentries-cache-v1-1-431b9eb0c530%40ddn.com
> > patch subject: [PATCH] dcache: add fs.dentry-limit sysctl with negative-first reaper
> > config: openrisc-randconfig-r073-20260515 (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/config)
> > compiler: or1k-linux-gcc (GCC) 10.5.0
> > smatch: v0.5.0-9185-gbcc58b9c
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152333.0pOd2zJR-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605152333.0pOd2zJR-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    fs/dcache.c: In function 'dentry_limit_worker_fn':
> > >> fs/dcache.c:1474:7: error: implicit declaration of function 'get_nr_dentry'; did you mean 'retain_dentry'? [-Werror=implicit-function-declaration]
> >     1474 |  nr = get_nr_dentry();
> >          |       ^~~~~~~~~~~~~
> >          |       retain_dentry
> >    cc1: some warnings being treated as errors
> > 
> > 
> > vim +1474 fs/dcache.c
> > 
> ...
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> This is puzzling to me get_nr_dentry() is defined in line 178 in the same file and first used in line 209 
> and has been there since 2013.
> 
> Builds fine applied to tag v7.1-rc3 and to the current master with gcc and clang.

Hi

They are protected in:

#if defined(CONFIG_SYSCTL) && defined(CONFIG_PROC_FS)

With #endif on line 247.

In the rand config as least I see:
 # CONFIG_PROC_FS is not set

-Stafford

