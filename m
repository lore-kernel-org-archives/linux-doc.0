Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF009376BF6;
	Thu, 20 Nov 2025 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652649; cv=none; b=kiYaSI3HPlDoBgGbQbx5Fq4KuvIWrvzK5o5qy3+qFU2ccYVJuy31iO9dSp7bNktOo4taKWEeSTAMLJBpu64YxwdgasPAN1gRRILeqUjDQDAZR9cLMsjuuWodWGvLUv2gbTR3saZ7WnWb0FSUp4+E2uTG6S3/fp2Ea1p6aeY4USU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652649; c=relaxed/simple;
	bh=FxA4rDePX88S1yvW/+VQOo/R/AVP+nMWbQ22DcvId3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zy45S/KNcJWqWop/Dahf+OrO19jvCPvOhCqB4FHrtD8SS7JXtVQJ6APqJwMvsmY6aQy5dcbBDlZumP9liDkF6xcJufwCamtfapxXGrRTvmJJNwJfO1SoXJAo3C2xjpQIQtKdX8PW460Q8TSsJqgyrZE/0zrgSWaRU+KO0bgvs6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC1A4339;
	Thu, 20 Nov 2025 07:30:39 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A378A3F66E;
	Thu, 20 Nov 2025 07:30:45 -0800 (PST)
Date: Thu, 20 Nov 2025 15:30:39 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] x86,fs/resctrl: Factor MBA parse-time conversion to
 be per-arch
Message-ID: <aR80HzlVD4OBsFnx@e133380.arm.com>
References: <20251031154225.14799-1-Dave.Martin@arm.com>
 <fa20041b-21e2-488e-88fb-ab49a8e24fb8@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa20041b-21e2-488e-88fb-ab49a8e24fb8@arm.com>

Hi Ben,

On Mon, Nov 10, 2025 at 11:06:32AM +0000, Ben Horgan wrote:
> Hi Dave,
> 
> On 10/31/25 15:41, Dave Martin wrote:
> > The control value parser for the MB resource currently coerces the
> > memory bandwidth percentage value from userspace to be an exact
> > multiple of the rdt_resource::resctrl_membw::bw_gran parameter.
> > 
> > On MPAM systems, this results in somewhat worse-than-worst-case
> > rounding, since the bandwidth granularity advertised to resctrl by the
> > MPAM driver is in general only an approximation to the actual hardware
> > granularity on these systems, and the hardware bandwidth allocation
> > control value is not natively a percentage -- necessitating a further
> > conversion in the resctrl_arch_update_domains() path, regardless of the
> > conversion done at parse time.
> > 
> > Allow the arch to provide its own parse-time conversion that is
> > appropriate for the hardware, and move the existing conversion to x86.
> > This will avoid accumulated error from rounding the value twice on MPAM
> > systems.
> > 
> > Clarify the documentation, but avoid overly exact promises.
> > 
> > Clamping to bw_min and bw_max still feels generic: leave it in the core
> > code, for now.
> > 
> > No functional change.
> > 
> > Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> > 
> Seems sensible and helpful for MPAM.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks for taking a look.

Cheers
---Dave
