Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300B5197A67
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740502253; cv=none; b=fC14zky4hXcLmBxMf3S57Nls4lzWryetEIWdGli8WFBbFtU3tTtO6178hKiJaC/ug2aGJzrEMkkVLa/0efBpkyd1TFpXGpJeq06d7Qn8M+J6lH1mP2voEr80N1HLa6ttF5v+g9gNZIhrz0l0vt+wVFyXuNkXO8CNARxSpMp13jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740502253; c=relaxed/simple;
	bh=UG8eZltknvJ/8A9quAvUC0yykW+VaqkKlyJxmauyfV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0mwSG4emGFIUDAsh32AeJ4greHJl9wXQ8KG8H1zicfJZmwWNhZUlIObqa5oW2BkFO+li35m0+JD6/b4rlv9Ch8KUelz5cDWoxEmHveJytllNJULze5tRfNoocW1PwY6ktd82pPf5MaQG1FuIGvXKxpXe2i7WDry2Si1BTFRR/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4IYfi66G; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4IYfi66G"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22117c396baso196015ad.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740502251; x=1741107051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lk6iw51fgW1qWU/03VHRsVVbj/sa5vR8EbwmDP3cjSY=;
        b=4IYfi66GRiNLKMX30WwsmC+RRt1eo/Ri3Ho7URNpWvs5vr81aSO/2hu8p3p/HXTF5C
         Mm9bru8AmDxERidnlxDxlCp2v/NWS98iEpa7wQZgVDA58/qOxahnIrW8kh0+FOc/3Ry4
         eKy90AmT+KBo4/l5yMdVD/EDENYJxd1g7rN3wS0C67/G0/KODVTFcHGLYu+yNhERSxwo
         AAN8sz41Ka3EB65BewOQZyZdwiP2pR3AcE3Dv1etitHOUV96Z3yCkw5RWzS4eJmSco4o
         ulT5Dga8fXzcz5/vyxqjp18/aktCDYjVFuLEN1LmVLLXWfh8BoWbdMQD3z1ABzWYrznF
         /XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740502251; x=1741107051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lk6iw51fgW1qWU/03VHRsVVbj/sa5vR8EbwmDP3cjSY=;
        b=fOkR1xcNE03jQQWvsbUdVyCopeZdwX3O/twszWS7d4Jzu3cQ6e3vbTrdQuzaCpgDqn
         BbXJFWdmjr5dBDyF379N+NtB2OQh7rewpTWlXum7ouOgpdGLfawyKlo63AB7LgmJ9uHs
         1eiJOOYgZZ/SIymwShq0wzuBDyg/FO0nbwjRWFfjE+HVV25SPdXO90aok4+mtw/SKZ5w
         aqIQuod/e4OYMg5e9X66gF1wjlUnDz61BeZeGwQbeZdpGLuSY3H4LS8ltcXvRZIgnhTP
         +ppO4EzmeFn2rzzrrlXaUbec2DTYRmrtPZlmOsWtLoe7Nm11mW5zbHloqeVWXuPYxlZf
         4bBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbP9V72pjiqNwK2+i9Luw4rWR8cj6MmPbkzc4Gt2lxXluaaBUrV8brfxGNRjt1x/6Y5ZENGDHuujI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfmdJhjALVNUj7LU1sTmsLENjrIxAwUiCP+b6UuhjhE9KfBJ3E
	fbPMWjY1TlSapYiW3VVyjxNTt+LRS4vYxZ6Kl1zCH9tIoXdbeAjQaR9+aEvvTw==
X-Gm-Gg: ASbGncu3yhS8ggZzpvq3Ida45oOddHw28VdhlB+XpY5G6iB8vbGLGQdy34W3zsN2GQ/
	I6u18FHeTn9rOhY0tNsdoKTWa0QpKW69EbUqX33M/7D8ZJ7uCFhsptHmSpYHtb+w4kkk7VJtjYa
	12ZwrjdeZqRyMtMYIOYGQMO+/7/SYgbc3NDIGCKGCBckWO6rYvyW4gzjQWxGRsMNU0oTBSvw1kJ
	kebTHCapWBMuKDG2e+v2J+IEovjXZ4Xi368kmxJFDs1kDZ6bjTuW/H2jCOc4RMeEdU0nbbHVHUa
	ShLE6CgofsG5n4V+pEQhtxbOlIwjyT/MGPfve4SEVZtQPYLiSi7JaGyi9Ff2PYA=
X-Google-Smtp-Source: AGHT+IERMuVCVd7U6MTOmNpPqxv55xXM3OvnM1bfuQpjOxFQC3PAJTJoQU8Phr6vdg5p0sFS6cHxBQ==
X-Received: by 2002:a17:902:fc8f:b0:215:42a3:e844 with SMTP id d9443c01a7336-22307a60a10mr3635965ad.17.1740502251142;
        Tue, 25 Feb 2025 08:50:51 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81eb0dsm1772166b3a.141.2025.02.25.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:50:50 -0800 (PST)
Date: Tue, 25 Feb 2025 16:50:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 13/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <Z7304KKv2c1pOhj2@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <b1930038cf828dc13c080e2b46b3003a8c98ef24.1740238876.git.nicolinc@nvidia.com>
 <Z7zmErar4YvQSSxw@google.com>
 <Z7zrHn3tPBD5chv1@Asurada-Nvidia>
 <20250224233505.GF520155@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224233505.GF520155@nvidia.com>

On Mon, Feb 24, 2025 at 07:35:05PM -0400, Jason Gunthorpe wrote:
> On Mon, Feb 24, 2025 at 01:56:46PM -0800, Nicolin Chen wrote:
> 
> > > Just thinking out loud here:
> > > I understand the goal here is to "emulate" an IOMMU. But I'm just
> > > wondering if we could report struct events instead of the raw event?
> > > 
> > > For example, can't we have something like arm_smmu_event here with the
> > > sid changed to vsid? 
> > > 
> > > Are we taking the raw event since we want to keep the `u64 event_data[]`
> > > field within `struct iommufd_vevent` generic to all architectures?
> > 
> > The ABIs for vSMMU are defined in the HW languange, e.g. cmd, ste.
> > Thus, here evt in raw too.
> 
> Right, the point is that it gives as a safe uABI that is effectively
> being managed by ARM.
> 
> If we make our own thing then we have to take the responsiblity to
> make it safe and extensible. I don't see a justification to do that..
> 
> It is the same discussion we had around the vSTE as input, the raw
> invalidation command and the IDRs. Since we've already done 'follow
> the SMMU spec' so many times already now we should keep doing it.

Ack. Undertsood. Thanks for the explanation :)

-Praan
