Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CF32D0FC
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 01:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786584074; cv=none; b=Z5vlAxt89LX4VQeQCq2DyaXgqm4978YI4olV2JPc9MPlNZnr4IhuMX3sc/5WMHANfUSgy2S5SOEWCx9ikCNkJb3vfFG75uoCBXvpIUxY895XEsy6UZRGbvuP5Gaf4tnxj4wbUNRXr4C1hjiLeQ7Aq28CykRvmIxECoKZlPThvVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786584074; c=relaxed/simple;
	bh=jQAWRVENXd5JGHsxo/hf6vUttuV6ujE/QtYCehIVHRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AibxK2RFVK0mXyna3T6qLd+U7doSJ99/8NVPAlIe0VOPk+y62kcW+IH1vEaWa5b24WVsBdL/AnCHvweXCs1i0SSpptRcQ9tcu8z/NDaolBBW4mMjNT3bcMV61k1h8BD97IrCTZ4WqSHM+2qcgHm4NexMKPaQ4O1Ajf6BwIXXqpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gV8Mq8xE; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gV8Mq8xE"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so1893296d6.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 18:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1786584071; x=1787188871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGIPGO62vUWJJtnlWOV7HnIzQD6+wbjwlpycp53S1ew=;
        b=gV8Mq8xEA4vtp2rDR+jnsK6TSSY301yKIdCVoD89t2x3h9Hgh1rrBdXjPL+CXFnKeT
         SgVmxK9YhwfBk26NKuanp3J6BqnN7/USTpDab1KXu05gblpMHZZhHLaHX6OYZjrkSTT+
         ndMAlJK/eFZotlpBWs/cl17UYJG9pm8sN7oSr2GxLXNHrirOvdufd5pCS61GGlFgjQET
         UblzbhY28gXamsNJPH9B9mCtMjh0uO2f2nXQy8B2vIpvJJnTFTdLMwOELMREAc5ZnPHV
         bljYuNumM7lTPeweZ05hCOaUTdzG6R7ZVXB7nWY2NU3i4BPv37QoHQw7aN/CUrDZSC0J
         p/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786584071; x=1787188871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGIPGO62vUWJJtnlWOV7HnIzQD6+wbjwlpycp53S1ew=;
        b=JfdMzSgEEUCxyHGELrM1UGpMUc6h77zgQSpr8o3CSZttnC7GHYjUywJebzXZaOe1Et
         eJ/wJWqZswdY9pqWROzv5tGCL0cMeXrunVaVS9hAdXlY/v2hCzp3hoQOF9IeMjMIMaJw
         2JU/jabJxgFZ/tv2LJhACJCOl95Rw/V/g6M2zXIb4JSkBl0oHCa+6FyZ9/pOzaUa/TrE
         ToowN/Zsm+8Ui1R5cKLPvhtOR+PVaFqenAVWyN4UthFDMrC2tXxFFAvMrW2wdRbZyhDC
         xUYSHMhwHZoFUMbIoIdglNiLMO0we762K3gn2alFbyNdgYtVpP+TzN4H6y9oucM12PSi
         10hg==
X-Forwarded-Encrypted: i=1; AHgh+RrimekwTQmdQYsQDd0mnBdecd2BI1t9c6X0lJ+dJbtuWZZIqpg6IDszFa+KJ8d0eJU2z4ovlSWPmjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6zoOztvxokj5H6AC40xyx4Zu6thfKsPJpS8aaPRHsgclkIn3M
	atYgFUEUk9Kj0kjF+HoDeX9LHea9juQIZN/e0tc25fvyw4gI1K+YB3FZk7Dwh09rG0U=
X-Gm-Gg: AR+sD10BcFCKCLC4QeRIdGRUP9mixNT1cRYFwX32n6tr9MPLPaElvgipa9iu5N5II/o
	1YDNPoqmbhiUeOpFPvot+4lGJJBtvtqsauSla10IPr7YgAIH3pFImlWoGZuJGlL2J0N2mgdtcvw
	46FMKDBMQRzWRzmAWEBRcB0hjWrYJp4vTK+EjpAPsnc2uAYhxBUr44ddGToGI2RTqXzkSJpW5fB
	ydlfIR6fZcvILBPjkCMsEXmjG7e1jI3TY52oqC1A4tMEmfOzJc36NQZAJMbPLrMYNfvvlCl/BZu
	yN1KC8Y45ybBRK6jjGoKOBWYyzD+8QBTmDUR+yIrTQF5/i9dh5uLY6fQetdRk6n3d+cn7FVJnYY
	9ee7FdxHF2EKP+7nvL7scpmCzy6UaCLdhpFroV1yH7J7l6Ye2y7+O8uOl6J1fOMi9gde6f5st6a
	/BzMqapLqgC5bhNVpE4HytFuFpw7+2JyoOQYb5UH6OiZbYPwE=
X-Received: by 2002:a05:6214:500b:b0:8f0:d710:26ba with SMTP id 6a1803df08f44-90a80bb0b74mr17793966d6.31.1786584071577;
        Wed, 12 Aug 2026 18:21:11 -0700 (PDT)
Received: from fedora ([2601:19e:8500:d3c0::28fe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e350sm4119856d6.6.2026.08.12.18.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 18:21:10 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:21:04 -0400
From: Gregory Price <gourry@gourry.net>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com,
	balbirs@nvidia.com, brendan.jackman@linux.dev, yuzenghui@huawei.com,
	apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com,
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, osandov@osandov.com, jannh@google.com,
	pfalcato@suse.de, jackmanb@google.com, hannes@cmpxchg.org,
	ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
	ying.huang@linux.alibaba.com, kasong@tencent.com,
	qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org,
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
	yury.norov@gmail.com, linux@rasmusvillemoes.dk, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, mkoutny@suse.com,
	sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev,
	usama.arif@linux.dev, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, muchun.song@linux.dev,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
	cgroups@vger.kernel.org, damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com,
	"Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
Message-ID: <an0cAMh_m8ZhGIm2@fedora>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>

On Wed, Aug 12, 2026 at 02:01:12PM +0200, Pankaj Gupta wrote:
> >
> > Bonus Configuration: HBM device memory tiering
> > ==============================================
> > echo 1 > dax0.0/private       # make the node private
> > echo 0 > dax0.0/adistance     # highest tier
> > echo 1 > dax0.0/reclaim       # reclaim active
> > echo 1 > dax0.0/demotion      # may demote from the node
> > echo 1 > dax0.0/user_numa     # mbind()
> > echo online_movable > dax0.0/state
> > echo 1 > numa/demotion_enabled
> 
> I am bit confused by the HBM device example being discovered as a DAX
> device. Is it to
> only to showcase the use-case? Or we see HBM device is actually
> expected to be discovered as
> DAX device with N_MEMORY_PRIVATE?
> 

"actually expected to be" -> no.  there's no requirement HBM be
discovered and boudn to DAX, DAX is simply a convenient intermediary
to memory-hotplug.  This is at best a demonstration.

A device driver could very well just call memory-hotplug directly,
or its memory could be brought up as a private node via a boot
paremeter (which I have sculpted for v7).  The former is preferred,
but there's a bit of a chicken/egg scenario for bootstrapping.

Most of these UAPI extensions are going to be consolidated into a
debugfs interface for testing purposes only in v7.  I've been working
on aggressive Linux Test Project test expansion to ensure there is no
UAPI regressions.

~Gregory
