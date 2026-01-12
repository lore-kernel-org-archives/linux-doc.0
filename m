Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4F36BCC4
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 16:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236419; cv=none; b=aqufi3mwrbJQ2UpYn2cK2RIMbSOfYkgn/0FTjV9zC7PoS0WNvQa+9k2BaY14Rof+yzh47fyOIieQXad+kKCCkbSs+Tt81VVhem3DdlQIZBalzyJjGTzaN9ySY1p5yTVtjoIgN9lF5btzUjEkbeyf8/Ka5Q1oedUXxls+mPO667E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236419; c=relaxed/simple;
	bh=8lgp9tnyFzGocHb8jl6w1NG/N7Zcs3J+oUbbLZskDQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVURjEeuVlP/QZpLTfTmNUB6qUkYndbdHiPKEGGXGfO4GqKzTMKviYg3VMmmUs6TA1EAOK2822VZeg2/7dfGV39Q128ep65Ri/CuCbifRYt+kNtmWP5vUtNlKOyyaActUAtp1R23BJ0owo1RM+1RLMIMXKqDE7J7idIB+E06E8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVNtrd9w; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVNtrd9w"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c6dbdaced8so5498952a34.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 08:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768236405; x=1768841205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6deLDrT44WMlKVvRfzJXPGGgj/xg0j1HG9++H6LUz0=;
        b=FVNtrd9wO5lp/y8ML5TJtEg2LVNoKpMuvXUTY8BKHqCPebt7zyvkOdNSz2l9+PqKFo
         g1dosaCKVbNh7nUAtxpC2VtVFARScgjWXE5Pz+6Uo/4nrd/IExc7v7gWNOC22kbRMvAU
         U36Y+xhtUulxquh0ORokEYUGuGNP+XSQOzgVwv9S9ON1yGVWuBmbCV7ALcPPYMWtjDwP
         sNHUg7roftqLGiWVbgqkQVdPdaZMytBn4QK+AXfgkuR72v2is+0n0Gcco/vlTwyt/XVd
         EelSYEx3zxMxi1BNWTzDtUiWRxiu+YdbC+09h3mMg5fQItDlIRyxROasaNCaV6pVlHwE
         Gj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236405; x=1768841205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n6deLDrT44WMlKVvRfzJXPGGgj/xg0j1HG9++H6LUz0=;
        b=JgLeJBkKKf7lpTtWhV2/MisB7shVYuSECNe4ce5qVz3numqxLTzeHhtU6J3prNAax9
         crOWrm5wjRtfc16q9m9+AhzxPm+HLOik914fVUHvUAfnMQa+0K5hlWSaew4lU+CiISNL
         nkfoAbll8iw22VyKbu/XGOicBZqGbF03TqaswB7qT0NWl+o+Udcax9Dye7oQl09DHRbl
         iQB6G/IE3PSMkLOLGLJOSQItbY5vozhLPPMvxPsf8yLGIrO0H3p4DHLKUT043lEv4owV
         hCR3T6l3lOCr9+bKvK6h0stteKIjH83GzdBcqpD9uFTCLhtXMq4Q6Wcb3ThRRTz4fp3/
         IstA==
X-Forwarded-Encrypted: i=1; AJvYcCWjSXn+zRNGqc3yeDO/4263PgvM3mTTJAjNIvI3etpNcHHrV9xFWcUdr9Zu3C0leteT90UkOVnNyIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFBT5e9H1i6UJ5AVq2c6BsR4kzi5JbjL3mVJaiE0zoPWGFaycd
	SbFQUOcfrXlunLogH/+/wDNlfeowcI6c2v5W+j13hbcMScb189idnN82
X-Gm-Gg: AY/fxX7HvOnPSmnEPc+0aVPJYw1xSFfYa/WD4MCCFJYOlVA5+TCkFQxgFvOiboWzI52
	oxbpJzdzP6aJ6LOdAzKUJkyOWZKTF63QIq2qipNhsfHzETkTTJx+ClzLLKTgTLv1naqltXuceFD
	9sAnLBOYdx/jhomH4ShV6EEN9i9fOsXI2aLw6JaxaQ3Y80su0vknD4LW3Ap0KuFToRU6B7q1oZb
	WS0lwMWwGAfHMY2L7gZ3S61bn7maIT/z6ggQ0A4OIkIJPMmKhAM5DWdEVNc+rMRcYPw+qTctY46
	80CD2TBZBR4MjHoP8UoGTR4XnrkiWIv6DJNobUE3Yp0bendQYa6FfEEB0G0W7vVvOy91XfQ8Y6V
	ZYyEoxefzwE9rerA0AC8aDwH1GGRs6nSzm4V/gnmXcB5W10MEEfqA5QafCwVquwOu9c/PSpmPBF
	AqxHXt11XwA/pXsnmL/aXCa5dR/ia56Q==
X-Google-Smtp-Source: AGHT+IGkPS/NCs2Mk5Oq2bbD5I5Nrr2IjEdlrsoDxvBDNYRoKgitfj+LmMDnnes+e1yquAKJv+M8AA==
X-Received: by 2002:a05:6830:2e07:b0:7cb:1270:1255 with SMTP id 46e09a7af769-7ce50932573mr13073106a34.16.1768236405392;
        Mon, 12 Jan 2026 08:46:45 -0800 (PST)
Received: from groves.net ([2603:8080:1500:3d89:b02d:f13b:7588:7191])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce4781c286sm14241471a34.8.2026.01.12.08.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:46:45 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
Date: Mon, 12 Jan 2026 10:46:42 -0600
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
Subject: Re: [PATCH V3 10/21] famfs_fuse: Kconfig
Message-ID: <26sfkgpuqdle2nmj4kcv7j2bgnrlpfo3wglfzqiuagjucnufx5@b4ggxnalmcwr>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
 <20260107153332.64727-11-john@groves.net>
 <20260108123638.0000442e@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108123638.0000442e@huawei.com>

On 26/01/08 12:36PM, Jonathan Cameron wrote:
> On Wed,  7 Jan 2026 09:33:19 -0600
> John Groves <John@Groves.net> wrote:
> 
> > Add FUSE_FAMFS_DAX config parameter, to control compilation of famfs
> > within fuse.
> > 
> > Signed-off-by: John Groves <john@groves.net>
> 
> A separate commit for this doesn't obviously add anything over combining
> it with first place the CONFIG_xxx is used.
> 
> Maybe it's a convention for fs/fuse though. If it is ignore me.

I've squashed this into the first commit that uses FUSE_FAMFS_DAX,
which is 2 commits later...

Thanks,
John

