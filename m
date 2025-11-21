Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE955185B48
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 18:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749634; cv=none; b=Oi5jLUdshIyuW5E3gvfGFUEZGWTKORpK6okSn0vl6b4Xfq2lMlRL2DZtwzggXwfjzjtbF+6bij+CoLclAf3gqIfTTF5JPq1m7aCuzoYaxdrurHkum54z4yDusWN4q+/GqMiyy2lR+KQOXF5PVedi5wi4mD0lSiHM2jls4lzvofE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749634; c=relaxed/simple;
	bh=RIpIicnRHmRQuJRBvM2SWLEVi/ryf1VeYisOEFqReEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kcw22KAdqpL7aQNCRrRiUdl7y57lGXGAHWZUyGkDAMY1JNwSDv4jEoHTIC/j9Z2gPWZBfIvzPeeFrFadaUlZinxHkrZp+BzKbIE/wGYs24wxzaXZJhnKgd9O+znw7PIy6+pQgv5IkTkC959iVue4BsZRBS+UXd8DEdQjbYH/Wnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=nIzTxwdC; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="nIzTxwdC"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-880503ab181so25734556d6.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 10:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1763749632; x=1764354432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BSM9j3tB0BFCd1CCyzkIWTNWPTuFhRIBwlbOOYldaI8=;
        b=nIzTxwdCwowG9WkkEHVkK0Oe4o9wzgOPDawTxTsGxd3KOHvZhTotXETK2RKHeVJBw1
         KfNMF25L/mpmHax9xiaxVVwVRHMjz9ppAKwKsZNjSwDU/wp2vEvIZUlsW0DQbN2Je8+v
         dJWN81G9ZpTwdvfyVuKy/kKkMwLJHNKluRBOs5PP5dDrnbVOsNLiF3w0p6Q3Mbk0lpFq
         b/jGf9rIWEzltOk+kdQZ+XUo08yh4I2aE3qp6ZTB0uiR0fHrd2rs9a4med+TmApmL3Dj
         382GeDK/ajyJDwCTdrvirJdenn3nfj9pgaoIzLQFZklOOHads7ZuOvB0Tc8/LOnrWZVO
         yAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763749632; x=1764354432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSM9j3tB0BFCd1CCyzkIWTNWPTuFhRIBwlbOOYldaI8=;
        b=PXhP16iHoANX8tv2oWyFUpIwkVZURTenW3IF1ZxuzJY/9jYwfB9gjS8rH6f2EjEUy3
         4aw78k5yJE8nBi+Dqr7llNt+FfpMlSdiXe0VNFqjvcgWATC85IlryNI9FQS3SWy+syJA
         jmAbW4/QfdtewN33A3/x29Z+xIsIDxiN1+Yxrp8za+qc6JQZZgHs7wMRh3/U4G7jl22B
         QfHzOasLCos7QMqGep+PiiAId+4kFMct8JPrMdd3UTTY4CUMniFOsXZmyLAMyQFvhzx1
         qorj3W95RQK6CgKiM5bt0OYQm0j0W/BkL42WyM4kIBhucfvnIl0GSceI6LZbi5K2jrQ8
         Skkw==
X-Forwarded-Encrypted: i=1; AJvYcCVs7kARsvCDCQAxd2pyoZhy30YnoFQhGo+29PfmgCQX2h4BJEcR2qXIBCMsqrBgbB1OBIg0N1Qpoyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0Q46DkVAWjmEpCv3RG4iO493MjgqMEEKWDgww3gLQT/gCxUj
	Bb4ujWvb98gZxo1RaL6fNg5lNi5vGBKUpDoYNKCTqBsuEkWbD4BfdZt7311VXA8AuPY=
X-Gm-Gg: ASbGnctASEty3kK+cowstZobvoHOQIZLjwciuhN+xvr+QaQN+Cbdfpu+tmEIA/RWEX+
	XrfLbulacOy1NVG51pxdkqn/sJJOZszOL4on+LWFTdy3y0cJV6KeQuT9co26jT1oIXSTeZD12Dy
	siZU2Tbfs9z7Hg2h4GXoXWTUSc6kyRxEzBU2vRiFfISGL1FanxXGGSeKks7Z466X3TdbbeWQ5hy
	RYjgPOpV06xD0r4oGE0MwVxtdEmS+vckH+OtbC/zCDMZ3suFXRxRJEMw6EOU5Eq9JQytkfKmfp1
	BAEFSnc4KwQtm3umbP4xEmOtrjMZmxqyN4D3aVYFd6pzihKcWW8ZlkqQ6NcD4hecpLeP8btA7dP
	4C1tO98rEywIdQ1FQdNZjN4gz1Gm67ukzDiGfy2MmLFXlZFa4FSCxripUybd6B2ZX7C5+/1kSGg
	rOdXuwTqL55HoYK8DE4MBGAofPCGtKYV7byGtNSG8VZQZlIIQ59LpZrSrDv9w347e++8NFnQ==
X-Google-Smtp-Source: AGHT+IGKm8uH3sKDW5KC8Eriuk3f7FVRukai4cHX9cxHkx709+pQdR97f/CiOuxJQvK4Xa3LIBqdGQ==
X-Received: by 2002:a05:620a:29d4:b0:8b2:ea56:9660 with SMTP id af79cd13be357-8b33d1d0d69mr407483985a.30.1763749631705;
        Fri, 21 Nov 2025 10:27:11 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295c3306sm418206685a.31.2025.11.21.10.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:27:11 -0800 (PST)
Date: Fri, 21 Nov 2025 13:27:00 -0500
From: Gregory Price <gourry@gourry.net>
To: Robert Richter <rrichter@amd.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 2/2] Documentation/driver-api/cxl: ACPI PRM Address
 Translation Support and AMD Zen5 enablement
Message-ID: <aSCu9DqRde7ry7l-@gourry-fedora-PF4VCD3F>
References: <20251121121655.338491-1-rrichter@amd.com>
 <20251121121655.338491-2-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121121655.338491-2-rrichter@amd.com>

On Fri, Nov 21, 2025 at 01:16:51PM +0100, Robert Richter wrote:
> This adds a convetion document for the following patch series:
> 
>  [v7,00/11] cxl: ACPI PRM Address Translation Support and AMD Zen5 enablement
>  https://patchwork.kernel.org/project/cxl/cover/20251114213931.30754-1-rrichter@amd.com/
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>

With a once-through I don't see any obvious nits.  lgtm

Reviewed-by: Gregory Price <gourry@gourry.net>

