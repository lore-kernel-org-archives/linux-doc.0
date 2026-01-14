Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F46D335065
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768414729; cv=none; b=Xb19O3V/rs4mSlVTqFEPZ1CQv/WqgdxlvMfAg7Xa7Dmte7t9ifh+Q90uSlb9XKyuV0bXXlYqbZQNB1HWkX3+Xbfo+cDL5zx/9ulCjlLRl55fXtR2J7Ft+ui0JREf0rHLZfJK1eJidX4e1OayG89wVn7k/b5JlEUR7jaPtGt7OOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768414729; c=relaxed/simple;
	bh=nvKWR5nnAzHhlGbNmiAcErLJSBsDgEBrbGdBWFfzM3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVSDSz71bLGU8/PedjRbkqqEBilxbK8+0W2tzF6SI44U32ghVLEo9yoyiigrRro3V9For9XBQJ9flmDfg990GW+lgpebY+AXb31amN9DyAUcENob5fkuo66WoCZBkQ+CJ+c8lQBNLspAkb97Zs7M4SkazfaTzJPdsmA+5wk/2+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=P1eQG2p9; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="P1eQG2p9"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8b25dd7ab33so8323085a.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 10:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1768414725; x=1769019525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCRHBPEdLpSaT9XnA1UF9iPTP5oMnQq3mHDp21dM8hQ=;
        b=P1eQG2p9bGH2NiP4/jwtMPtiQ77hA4tUxXh1jy8LEGZ7nGgunmE96+ZmwP/0dBV8nM
         OTsylxJFPo/WhzHWmJoBoDuC89XpmJqtKfqCQM3xc3NsXlBkZWZJexSusQTp97UQd8fz
         /LiNTDXM2pwR8RtPFw4Vy8frV3UYJs0wF8fcaT/DhSfjt4/NasVFXDCiR7B7oz0CO1EW
         /WvK1sDBydwo9CmgOSAQS6TQ0MfnY10gfc2hIb4ekCIneBqgJG3cmEMteyLsT22jOUHK
         Fy7BXRTeFqvxyM9VdzRpr+rP2KPQLNWNaJxpcfQnS98ALRHMm1LD1SmNF/3X/CY4ubpw
         8BRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768414725; x=1769019525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCRHBPEdLpSaT9XnA1UF9iPTP5oMnQq3mHDp21dM8hQ=;
        b=EG3a+echhHIzfZ+evjUNsaxd3Y4gdgaz5jUuBQyL9Zl6rxhmKdg2GQypRBOmmtOY/R
         K4zhoyLFOmod0rWZ9YQqQtlg9/Qs4IltUbvufcD31/CRd/f93MHlOAow+8HS01RLaKc3
         //GjbVDZgyV432OV88n71ToFe4EhIJpbmYgHavk5HF6biRckV/BeNvtN9HbQky2uxypy
         ExpBLZnQgvI/XZg8dTVCSHERBl8gEjXGe4PaCbSRdn1BBYlo2PBnDssnfXM12pGaGRx0
         WYamqA8xgPPSKis+4rIDe3XIIN9VNWr4TBvoFWj460Wq0Kng1r8XY4rwvB8Rc1FNPRAN
         3EKw==
X-Forwarded-Encrypted: i=1; AJvYcCVQZxwFoTTLyTJzq5pDR4kz0uL+ImIag9cx0kW/+CFEzQFK8iVpcizL/RMEVy0fbOlZDYz7HFXB6ak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0GdDyX5vgbr9udET/s7ETmpEzWGcZJ7oDBf7YW+SXma4a5n91
	JOMpom3rMtycsXgNgOoRNZjB6NfPZZ9WUCzi3le3aKOoGT4+q0TQu2EVpUnDCA2inlo=
X-Gm-Gg: AY/fxX66fht+uv38l5WyyYSmlSPPEyA2lPl20Un9PVov78MHaiS6TS0h9/rertbvhqk
	LZO042qowcV5SJP2nhN32qdDhn2Z46XHRdSbMF6ZF+cp5NJuwRzdIbhv30ydcq1QhTy+tYCPHsB
	VQz6mNCzL7t4A5Ut+wwU6Xwa6dJtdjEfc4CIBAFJnZxxakW/wjKEenfiIJfpQYl9RZXXz2cMwqw
	szrYFgNQNmqfPovjkNt9V06TweldJWbD91WdyMkVfBml20RVi4GqCPYbIFf5D76zWSh34N2wY4p
	D1C8yM4NoD+2zjqiK3vVazZb78Q9NG+NrZfigC+ebE0MNk13DINdeGkofI11VZWHTGqzLBtcBDG
	9iiAwhbIoS7gLfTSEBBLZqs+W8GMIg8dJRYsp9Aj7S4fQ+dDZ8vpXyVbhcp5zw6kwQ9hIO0T7i2
	BegIedPKf286orz72u/bB5f1QcCbPlAuXkNEhTVQEF7kzhc77r6DrdX5VmWxIKMZF+HLKWzM/QE
	S0psbBj
X-Received: by 2002:a05:620a:3724:b0:89b:9b75:f5f1 with SMTP id af79cd13be357-8c52fbdea7emr538217385a.53.1768414725232;
        Wed, 14 Jan 2026 10:18:45 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530aab8f1sm210480985a.23.2026.01.14.10.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:18:44 -0800 (PST)
Date: Wed, 14 Jan 2026 13:18:12 -0500
From: Gregory Price <gourry@gourry.net>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Robert Richter <rrichter@amd.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] Documentation/driver-api/cxl: ACPI PRM Address
 Translation Support and AMD Zen5 enablement
Message-ID: <aWfd5L4bPk29_AeO@gourry-fedora-PF4VCD3F>
References: <20260112111707.794526-1-rrichter@amd.com>
 <20260112111707.794526-3-rrichter@amd.com>
 <20260114180000.00002533@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114180000.00002533@huawei.com>

On Wed, Jan 14, 2026 at 06:00:00PM +0000, Jonathan Cameron wrote:
> On Mon, 12 Jan 2026 12:16:45 +0100
> Robert Richter <rrichter@amd.com> wrote:
> 
> > This adds a convention document for the following patch series:
> > 
> >  cxl: ACPI PRM Address Translation Support and AMD Zen5 enablement
> > 
> > Version 7 and later:
> > 
> >  https://lore.kernel.org/linux-cxl/20251114213931.30754-1-rrichter@amd.com/
> > 
> > Link: https://lore.kernel.org/linux-cxl/20251114213931.30754-1-rrichter@amd.com/
> > Reviewed-by: Gregory Price <gourry@gourry.net>
> > Signed-off-by: Robert Richter <rrichter@amd.com>
> 
> Head hurts from reading this :(  Hopefully I never do again!
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>

What's one more layer of virtual addressing between colleagues? ;]

Glad this looks to finally be punching through.

~Gregory
