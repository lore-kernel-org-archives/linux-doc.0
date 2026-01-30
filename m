Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8840D3644D1
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794480; cv=none; b=WnEq3uMa+pCRgNrBlCiha2VVv5PWKvxfL57igorfBDpoFuUmD+nXy57A1RnIoMfZq6P5epeAtjYzYhvND+xm+uG7D33f9IYjDdrMVHzX9euaPB96j4cnx/YzIPhz2Pv84ktq+4qGZZFaTswSFlrCvDHOP6s70PQ3neXvfy/3ucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794480; c=relaxed/simple;
	bh=po7edBQiBk8FP/oPhiDSEZOovfiZ88dORRyTLqEoIfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqsYBH/VQdjjsS/ANmykI24SYhBRBfXn6g3+x6FLwPVmacGNtHNHqoAkI8rt23AuXok0vT28UtVwCo50S11ihOyl/an+t3M+2sntcNZ70fR7NPFNDMbOkhRkwCJLzdxHQxD+U6gu+d3USSmAMD5zapJzMZ7JEYL83eClNHey0pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=L71RnFMu; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="L71RnFMu"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-502b0aa36feso29310241cf.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1769794477; x=1770399277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lr0ACEC4r9sTM7XeNDuo4Q3LP3+bjrKF/ES76GEt9Qc=;
        b=L71RnFMuwoe3Ek0MuUPPS7wKLzWEorMVAxd8HctR0ufV82jVho936kBw/HmxtBPsgK
         zfrliDrL/2p+9/IbkhajqgNsKVtT7sxpyVtoXpL3vhg3/zYfPZn+b2zqPFqRFELkoodB
         ydZ9YVZxowejJKFWtG+eXCQ2/anE3L/4nGui6xzDX9EQ6DivwMBvXoyhIfoV8fDCB6tX
         NDxBjJe7pdJaznD9GmqP8LWLTwsg9b87bmcqZRZTyUntxQGfvgcChmQweY9IcwmySh/c
         7bXklbMWtxiXGKlEHmn6E+TYx9tODPoHjY+CqubKIxVMfXIGFk2I4FyYKc+zOaIKTaQi
         RSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769794477; x=1770399277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lr0ACEC4r9sTM7XeNDuo4Q3LP3+bjrKF/ES76GEt9Qc=;
        b=McCf6ChaPKNn/3B9nbqay/svBNR7NAT2Erkv8CEN1q42FlJIx6bqQSUB2+5Bw91qwY
         NO6lgtzJYUS64c6dfXyRDJG01gOGAqzas8uRACysTsl2dL/+dXlpnYe4ilmVI4rbp2Ez
         LuQGIspIQ5rfzAC5ECp0PM69XYFP+IXzgFlSMzoFrRdemqHzlTdy+YU/R7RQh8RkwVQf
         mg0NkU2Bfk7OBG1Q++ho25kn/LkqKchpKs8NAxJUfaCS2ltfGrFuJeELOCM87wlxOJ3m
         CS8tJObQ1sGjM11ZTrwHxrP3PUy7OGpoqQZyVGEzom+YAOg+W6bYfQK5Py+y7VjsO6Nt
         Tb8w==
X-Forwarded-Encrypted: i=1; AJvYcCXUY9B/Gwx+bmZeamWN4aIURN48txAUkTnbFBQB1D//iA+TQB24e5F5Nzy5jGyoYeMavv10ny84MzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEymBm6d47q68eB4LEqg/zP8rimuCaIg9PZinHy7GL3kqmEF8n
	y6xnYnHcJkusU53ZjXaU+ICE7pXGhzs9Rme5DRWKhThWxMo9710aPH02fvvgEwBACG4=
X-Gm-Gg: AZuq6aJX2IX60fHOVWiEKtzqnnVdquIK3OV80h5fZ1GctzcMwGHQNAP6VO366Mi/ToW
	wTx8f8oZHs+cebfGoRUIBulN56Mp5Z4n/9mstkKJuRMZDx1nygGDxYD4DXbAEGREfVDkT+nc9Ga
	ZDYbplJLREJfR2luxdloMpT7iKCcu54ryu8/TcrRW2CzK4D9leP/rYNCgGvfssUWPHCQBbOkP/t
	r9clHLrbHZLXjLBH3ToROj3+YKbCGwxgpif3gKgO5DB//zAoV2hO1OflQ5VzLaJa+/JAdckVWHI
	+NtIqe2MYoqi0fcVgVPa7sL8Kxu+p4I32w+NCFA97ILqlY4vzgWK5nlYLozPH2uS0wnO53/XFPL
	uXW6fm/Y3UkrYIicxFD6BGSMhmu+CZwYytjTqdg8IW5O1QUc8Ujd3li6melq5GD4/8qGmi1zEcd
	W6/ugoG5UQ+dGV3VLjkM7qbIG+oWY2gPr85q6jYoDyxk8Now7aitxrzVL0yjXj5WPUZK19/Q==
X-Received: by 2002:a05:622a:20c:b0:502:a1c6:3487 with SMTP id d75a77b69052e-505d289da0emr31891651cf.1.1769794475777;
        Fri, 30 Jan 2026 09:34:35 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5033746eec5sm60844171cf.9.2026.01.30.09.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:34:35 -0800 (PST)
Date: Fri, 30 Jan 2026 12:34:33 -0500
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kernel-team@meta.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, willy@infradead.org,
	jack@suse.cz, terry.bowman@amd.com, john@jagalactic.com
Subject: Re: [PATCH 0/9] cxl: explicit DAX driver selection and hotplug
Message-ID: <aXzrqYOmgo15NZ7s@gourry-fedora-PF4VCD3F>
References: <20260129210442.3951412-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129210442.3951412-1-gourry@gourry.net>

On Thu, Jan 29, 2026 at 04:04:33PM -0500, Gregory Price wrote:
> Currently, CXL regions that create DAX devices have no mechanism to
> control select the hotplug online policy for kmem regions at region
> creation time. Users must either rely on a build-time default or
> manually configure each memory block after hotplug occurs.
> 

Looks like build regression on configs without hotplug

MMOP_ defines and mhp_get_default_online_type() undefined

Will let this version sit for a bit before spinning a v2

~Gregory
