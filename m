Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771157;
	b=j8NJcKvmDosYIbXH1S3mR05sQeDxNnG1PJNn4QNKZR//l2lgg79mKQ6s1ewZ6bSWp10o
	 peCkkP071plo8JiPdcA2ZZiX3h4KgyZJEmh9VOJ+t4iL3gIUDt3OxjidxcRguDq+uejxw
	 PkdsBF7UWpUyrJtnneQZGnrIFUlL/yBVqgEs0a8dad+yL3Pd1fqpg9xsXzI0BReYUBA11
	 IvAtyJ92Zwl5zmFsqD8ngohPxVs9YpO1ZHh1K+p2bknImPdJS0qp4nZGknlbjcXyQ6k0D
	 CDv/gGYkN76EEtJAp0Kv0N2AdENO2mQYFj4OfwhESBzkWLza7JACgxYto4IkQJMbXBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qfip9nPMyQ6NKHGpF7rQvQFL04olz8IZl5yoz+w1jok=;
	b=Y2ezvUMwgk8fI7qB9a+1Smh1z14MdZEndXoqQsUyHmkCKGLGbaZYXNxHmzJywjc0Td3r
	 kr4Ey/sKjuIVsw9vxZPXCP282PaaemTbYc1FByAQhfxrsnpu5qwbnqhOmacQYJWexoZtZ
	 sATEzHCz6qK8In53Ip6U5QyY2H+nGUkPWKxPsnCVbctfJodELrmQShcDIJRNAJ+dwzCTg
	 NEhZwL23PDfqhWlSphYN3n2Hsmqt/1Vg20V1AGZ7+L1BjgOa5RaN0vX73yka3udCeCeA0
	 kvOigS8sGoxrb0Sn09NAQpJ6/irCmnIdLgarqbigEorxPBe7i2k4z0hyL7SylengLAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pOV9sna9;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71894606A31D
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 15:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71894606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=pOV9sna9
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53644b28706so13933711cf.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792771155; x=1793375955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfip9nPMyQ6NKHGpF7rQvQFL04olz8IZl5yoz+w1jok=;
        b=pOV9sna9TZaCqywtdDI8h+mSGdu3kY7TvcG6DQSaz/wzZ4RWxvzzkBqqhU+wauIVz0
         y7gqDg4Pv98+G/EoG0dUf5Bpk4Cl0e0UZ7LUISdotu9Tsw4EOlJNa9g21e1C+Zf9KMZH
         gYHQI9+v1MeGOmU6kjTdceiCLbZqOiGD/vZZ2gPbf7Lfpg+R46vh7tpjBVmQ5GGunmYC
         VtuXQ6ZEps4zStuYQLp7cEl/vePQpZ5aYQvoiujxoHTHp/fCRUKvmNk27XK19PLiHYCI
         JYluupC4j0EMlwXjgXHC4TBCzVFNeQ1eRj7qeCWp0ln6/w6oJwD1gZkKqq5ddT+khVyu
         ejmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792771155; x=1793375955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfip9nPMyQ6NKHGpF7rQvQFL04olz8IZl5yoz+w1jok=;
        b=qPPNrm3eLhAp1QT0D7K9/EK0UgzBE3EgjWqv+3Sfhj/WjNRvhmEERLoAxP07hmsSxN
         ERXEk3ny+IRBT+qeiNOeANQVxVIjGAuVyn9ACOOosk1aWEH3LQbMtQZRlP86jupd5XMG
         vxPzXyVcuRJF0VEoXVgr/AhVjo61h4NVQS7u9UWIKb3uMGNcltpTC84rh/1kHE8JNDN5
         eXL1n3kWRTF3bjutqY/pLOGaeJbwrKUBx4BHJzeTg5zlOiHzfDBM1+uyjsxj5jaL3pnZ
         ZLr2DvEW9BeI+mAGXIv6T/U0ufDxU8zE921s/Hx0PaLn4/iTR+GlJIYl/l64Y3cYlbF6
         vznw==
X-Forwarded-Encrypted: i=1; AKwUvBzYYUZp7d8rDiPYprxVsLddOM1EDekpNn5DDZHLj+SXv4Yuh/50Kl67RBbgNdwR5I3dhoiTHqSYHSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVN3l1ISgigW/IqSDLfR0uEHMIUnzYjNDgtKg6VHkxnNWbwAOp
	PJ+X59U44wPZA0x1X8LmspGo/JIkkanKcpvRw9q3vFxsntjoAJsC3xQUvA4viS/ILHE=
X-Gm-Gg: AYBFou2vKoJ6nUuNJgnDfKHwOv2pa/7KlAQs/JyWcDaEegPQX25a7gXLuKeLDKIdGGD
	ZJynE+VWqPmXZyclyQtJX+fo1TkwURJOaYdGwnkhSLUz90PmHoaF/kgzC+ABbXjC73uBBmqLIN6
	Jp2ECCCsDEP4zw4WLiuchtetdMItPgoDn/oCKcpyNVnrlPH36ie3f+6kGKTlr/w4MaUh44qeC+H
	S8lOossGBzlfQvaez73vivp0laLojBqHvIB05Tz+eIN6m565rKWExFYhqPfU5lSOmKX+Z28DWBG
	CsLzublJFVSiaQopNEsHZ263iXl1AM6galBmP1jMSbhHXggZWaYXpQQ+GPAzbHpLLevnYiTWhU6
	2Q1BOsoLjQ9vucNkDgmwl/yvhtFjHhViM19Qnu+mBfjgceXQs1trWlrbuy6fxTCsH1HVcshoDpo
	hjVOYbHS222quGUXkB9dUQ3+xkt7QQJe2Zk1rX5PL+EhW/GxwEJcJ/JpDR2vuGX4XgysOTDYYgq
	PYlw9qC9bExWJs/MHvqIaeVnmlp0BBRDxteOc4sR5kT2sq2irjlrypoFrjQnWGDY1Zmprarwc6k
	TUethRqf9KxM88dju45emVd0zRAjLDsqEizywg==
X-Received: by 2002:a05:622a:a0e:b0:535:859c:b6ff with SMTP id d75a77b69052e-536c24e2452mr39136051cf.20.1792771155235;
        Fri, 23 Oct 2026 08:59:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53836c78f67sm656181cf.27.2026.10.23.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:59:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKHfm-0000000Go19-0EMi;
	Fri, 23 Oct 2026 12:59:14 -0300
Date: Fri, 23 Oct 2026 12:59:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v9 02/18] PCI/P2PDMA: Derive routing from directional ACS
 controls
Message-ID: <20261023155914.GK3977851@ziepe.ca>
References: <20261007063227.GC7822@unreal>
 <20261007204045.GA783967@bhelgaas>
 <20261009174301.GC11438@unreal>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009174301.GC11438@unreal>

On Fri, Oct 09, 2026 at 08:43:01PM +0300, Leon Romanovsky wrote:
> On Wed, Oct 07, 2026 at 03:40:45PM -0500, Bjorn Helgaas wrote:
> > On Wed, Oct 07, 2026 at 09:32:27AM +0300, Leon Romanovsky wrote:
> > > On Tue, Oct 06, 2026 at 03:49:47PM -0500, Bjorn Helgaas wrote:
> > > > On Thu, Oct 01, 2026 at 02:55:10PM +0300, Leon Romanovsky wrote:
> > > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > > 
> > > > > pci_bridge_has_acs_redir() treats Request and Completion Redirect as
> > > > > interchangeable. On asymmetric fabrics, a control for only the reverse TLP
> > > > > direction can unnecessarily force P2PDMA through the host bridge.
> > > > 
> > > > Does "the reverse TLP direction" refer to Completions?
> > > 
> > > In general, the P2P code treats TLPs flowing from device A to device B the
> > > same as TLPs flowing from device B to device A.
> > > 
> > > However, in the context of this commit message, yes: completions flow in the
> > > opposite direction from the device's perspective.
> > 
> > And I guess asymmetric fabrics must mean fabrics where Request
> > Redirect and Completion Redirect are not set the same way?
> 
> Yes, in some of our systems, deviceA to deviceB is going through
> different route than deviceB to deviceA.

It is a little more subtle, I think practical systems try very hard to
avoid that since many host bridges do not like seeing only half of an
exchange.

What we end up with is Relaxed Ordering and Strict Ordering take
different flows in the fabric.

> > But I asked about ordering because it sounds like this patch expects
> > to encounter asymmetric fabrics where Request Redirect and Completion
> > Redirect may not be set the same way, and the spec implies that
> > asymmetry may result in ordering violations.
> 
> My guess is that the hardware and system architects have ensured this
> doesn't happen. At least, I haven't received any complaints about this
> series during internal testing.

Yes, the ACS combination is selected to avoid ordering issues

Jason
