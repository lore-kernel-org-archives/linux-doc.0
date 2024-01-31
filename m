Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794F1FC19
	for <linux-doc@vger.kernel.org>; Wed, 31 Jan 2024 02:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706668083; cv=none; b=Fs2v3cZrtxFcIYOip43DZRNOP0CydG3xfO2jp6NG0R7+BIZ6MSk8XdGN5Ea+sjuxDkMhy0f0LI/PsDg2gCyB3pmu18c6rZjttv8gK/xxv6dKcMWmL7IfNLGfAEPO7szNEFoAePccU1tLgcWCJkuPh+1PjvnwEGwVnhNgkjuwsc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706668083; c=relaxed/simple;
	bh=vL9ewJGQjbVzXzeBAWLNtgJlQ6U/GTAb08cdclhSXDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FC5aPsB6dGoLmiSjBSRUVQAlttAuUg7YoG3QQklcsvRpNImUEQicKaF/N1tRVIFi19vEqa2geE2jwCeUzWi8giCaZjqk70m7dy8j5tsv1mBGlvkMkBAuE4B/YsJfEb8RB9l5TTffRqS/wvY1aF8Yu+/ZxGMOl0JwDw2hua8TVoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=D45KeAKf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="D45KeAKf"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6de070a4cadso2119524b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 18:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1706668082; x=1707272882; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rFuCfrepBWXS1XxHQhjTqPjsgtcav0dkeDXr+bSzRE=;
        b=D45KeAKfrJ98hS6d6uV3k+WVmM4ZVpQNftMQ8UcepF49jvwH1RWcNkrkF70O4dYahv
         tiHKD1xXz15tDg/a3/hFJHqZg6fupSdF77ozGdAgg7jyw+4CnnaIwAwhnoKFcJD5lV8s
         9WYG8Z19Df/P+wgLRJ9f7W9xn5w9GX8A3/UvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706668082; x=1707272882;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rFuCfrepBWXS1XxHQhjTqPjsgtcav0dkeDXr+bSzRE=;
        b=jPvkvKBQYBT606QVyiKyVJz1bkkZduwVN9jBmirJUkqhLsJ+RApGhZe3uPZJsx+gSK
         s76HZsqtlnJWLSJpnotBrfWuIql0eJfjqutdnaPSUlxa2CnkYrYmoKUpjQAU93R2WfV1
         GVQLIj930ij/vY8728nbH+BJkHMVFzCG4KTuKpk63mhid0gqo/1GDqQkkuV5SS92k5T/
         i25spVTll++pFSq7KM3I+DRBM+JBfSxNEVeylV5LRcWrx/ezaouHk9w4zsRpREDsG5t5
         GyCViY6oomPs0Dg9xaSCuhNWp00xxlJX5fAhfFGVFUIxTjFVNKRVoswFOSDELTmCyvl6
         hrFA==
X-Gm-Message-State: AOJu0YzR96U6+vcMWvqhSpQEg3RgPxUQ56FoM+PAHcF7a+WspDGplrOl
	m6TuYGmV9q4/YeHZpdGnRgu3FNcY3KYOt2p3RGfz1AXazlecl7wx5ojDn/Y7Zwc=
X-Google-Smtp-Source: AGHT+IGjQbidItS+7RU7cPhy+bkQeiwZ/jpP5J+ABb5ADzdlxfdt0avRjFcD6UpscTVrmQlDW7WNQA==
X-Received: by 2002:a05:6a21:9206:b0:19c:7e70:d32d with SMTP id tl6-20020a056a21920600b0019c7e70d32dmr376162pzb.0.1706668081759;
        Tue, 30 Jan 2024 18:28:01 -0800 (PST)
Received: from fastly.com (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a00218a00b006dde3053cdasm8574075pfi.133.2024.01.30.18.27.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jan 2024 18:28:01 -0800 (PST)
Date: Tue, 30 Jan 2024 18:27:57 -0800
From: Joe Damato <jdamato@fastly.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	chuck.lever@oracle.com, jlayton@kernel.org,
	linux-api@vger.kernel.org, brauner@kernel.org, edumazet@google.com,
	davem@davemloft.net, alexander.duyck@gmail.com,
	sridhar.samudrala@intel.com, kuba@kernel.org,
	willemdebruijn.kernel@gmail.com, weiwan@google.com,
	David.Laight@aculab.com, arnd@arndb.de,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Lynch <nathanl@linux.ibm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maik Broemme <mbroemme@libmpq.org>,
	Steve French <stfrench@microsoft.com>,
	Julien Panis <jpanis@baylibre.com>,
	Jiri Slaby <jirislaby@kernel.org>, Thomas Huth <thuth@redhat.com>,
	Andrew Waterman <waterman@eecs.berkeley.edu>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH net-next v4 3/3] eventpoll: Add epoll ioctl for
 epoll_params
Message-ID: <20240131022756.GA4837@fastly.com>
References: <20240131014738.469858-1-jdamato@fastly.com>
 <20240131014738.469858-4-jdamato@fastly.com>
 <2024013001-prison-strum-899d@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024013001-prison-strum-899d@gregkh>
User-Agent: Mutt/1.5.24 (2015-08-30)

On Tue, Jan 30, 2024 at 06:08:36PM -0800, Greg Kroah-Hartman wrote:
> On Wed, Jan 31, 2024 at 01:47:33AM +0000, Joe Damato wrote:
> > +struct epoll_params {
> > +	__aligned_u64 busy_poll_usecs;
> > +	__u16 busy_poll_budget;
> > +
> > +	/* pad the struct to a multiple of 64bits for alignment on all arches */
> > +	__u8 __pad[6];
> 
> You HAVE to check this padding to be sure it is all 0, otherwise it can
> never be used in the future for anything.

Is there some preferred mechanism for this in the kernel that I should be
using or is this as simple as adding a for loop to check each u8 == 0 ?

Thanks.
