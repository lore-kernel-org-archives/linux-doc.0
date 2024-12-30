Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86670197A67;
	Mon, 30 Dec 2024 20:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735591952; cv=none; b=RV6n4eAPYpq0P0+ywrZ0wQi/rSpFlfPtH/FyuRxGOKMR5qBJTNDzeTUuyPAunCYEAXsg8Mqg0dj6Dhah81pNiFUmmyZlA9yYj5ZwCAWW5HuLGpQLOLzGry0Z1ea4wuirYyR0+Xk1dEBFjvO//AcjaS0LHumHXfrf0oZjCcIq3/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735591952; c=relaxed/simple;
	bh=SC1SEsBAfr1ZnAgshLcdGoSBsxw5r3AusZ7z+e/fDO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2iTBK51dBvdEBBMBgly6Eo0eFx/tRpzSO9w4PswyIK5mVz0K2KzhvoJcTFb0iejJr9kYxqoaUUyazMnneOksVSdJWjGLbuF9ch51WVgJKR5HuGLjDAWoa0O+g/JmoL9Wl272iE0JjwyVWMgIo9C/YFOz5s4yqjpP3h/eKrVNL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5Bzvrpa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5Bzvrpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0FA9C4CED0;
	Mon, 30 Dec 2024 20:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735591951;
	bh=SC1SEsBAfr1ZnAgshLcdGoSBsxw5r3AusZ7z+e/fDO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5BzvrpalOALnHbynLZkZXEVrNgofpy8lgw5OnqNBfPuIMcIbIfVUF10iC+5XQt6N
	 LTMZm3eeNhbTZqDrN2vFelrcrV/OoQEFaNoqP3k2ZOB6BVqpylgqTP8rru7M0LjGM+
	 +KfiVt/xTjbpxXhPgwfhezefA+Qp+W+bSSMhMlL6sXR/rXlube1IcMRe0fw66CgcVj
	 t3OUfG7AkW3DcpP3QxGAgrbs+Ho0UtY2Hb+P8nWP31CUI66imeFhOr0+ha+2mULBTi
	 KBo9EBrcyK6jwC3YW9+n5XEgG15zkiCtaugvQVgQx4sDOV6s1ZIp3HdYghU+6KkC0o
	 hEtf0MSk+Ro0A==
Date: Mon, 30 Dec 2024 14:52:30 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Saravana Kannan <saravanak@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] of: Add printf '%pOFm' for generating modalias
Message-ID: <20241230205230.GB2488017-robh@kernel.org>
References: <20241217183711.2525863-1-robh@kernel.org>
 <Z2nA46H_sRrC74n8@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2nA46H_sRrC74n8@smile.fi.intel.com>

On Mon, Dec 23, 2024 at 09:58:27PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 17, 2024 at 12:37:09PM -0600, Rob Herring (Arm) wrote:
> > The callers for of_modalias() generally need the module alias as part of
> > some larger string. That results in some error prone manipulation of the
> > buffer prepend/append the module alias string. In fact,
> > of_device_uevent_modalias() has several issues. First, it's off by one
> > too few characters in utilization of the full buffer. Second, the error
> > paths leave OF_MODALIAS with a truncated value when in the end nothing
> > should be added to the buffer. It is also fragile because it needs
> > internal details of struct kobj_uevent_env. add_uevent_var() really
> > wants to write the env variable and value in one shot which would need
> > either a temporary buffer for value or a format specifier.
> > 
> > Fix these issues by adding a new printf format specifier, "%pOFm". With
> > the format specifier in place, simplify all the callers of
> > of_modalias(). of_modalias() can also be simplified with vsprintf()
> > being the only caller as it avoids the error conditions.
> 
> Shouldn't ACPI case also be considered? Otherwise we might see a deviation and
> then completely asynced variants of modalias based on different type of fwnode.

I don't understand what you are proposing. How the ACPI code and DT code 
generate the DT modalias are completely different already. Are you 
wanting to plumb a fwnode modalias op? We'd probably be better off with 
a printf op handler and moving much of the code out of lib/vsprintf.c.

Also, looks like the ACPI modalias code does kmallocs. Given the locking 
discussion, wouldn't that be problematic?

Rob
