Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAF11BDA95
	for <linux-doc@vger.kernel.org>; Sun, 12 Jan 2025 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736699394; cv=none; b=pl3bvoQv5RBsygv1f//vbIfMtmdYyy5ILgl1c4Ji1MqRTz5C9gGuXu4fCxgFqcI4yriecCIKC3GSjJlZPiIKMDE8eGWkMda/USU1e0lPuiIbnxTo45dv668XEEEBTvB+P0Vh9Joke07yqWiqMztPliSHrfps7MM8fn7GWEYTpTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736699394; c=relaxed/simple;
	bh=pafjelIF8w7HMb5e41lGceWaRWXL4eViG5SvwC/7Ul0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OznC7v1ihcTr2xRPGQcyHlFBtEYdcMovZE6hSr1zUzL/wjz7sfpga/1DczQVAK6kw8/PuMhkAjCaxY5DHOCh99aFDjCGDLMTz1QrluioyoKnTWffiqFSm4lMs4K52NYkvbSpn+omRxBuA9lBhzNq9xuq2N4qEL1uacAybxu3B5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 6d1c8af3-d102-11ef-88a2-005056bdd08f;
	Sun, 12 Jan 2025 18:29:42 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jan 2025 18:29:42 +0200
To: Julien Stephan <jstephan@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/5] iio: adc: ad7380: do not use
 iio_device_claim_direct_scoped anymore
Message-ID: <Z4Pt9oZEkfQMuYUm@surfacebook.localdomain>
References: <20250108-ad7380-add-alert-support-v4-0-1751802471ba@baylibre.com>
 <20250108-ad7380-add-alert-support-v4-1-1751802471ba@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-ad7380-add-alert-support-v4-1-1751802471ba@baylibre.com>

Wed, Jan 08, 2025 at 01:49:33PM +0100, Julien Stephan kirjoitti:
> Conditionnal scoped handlers are turning out to be a real pain:
> readability issues, compiler and linker handling issues among others so
> rollback and remove the scoped version of iio_dvice_claim_direct_mode.

Is it IIO level decision or you as a contributor to/maintainer of this driver?
If the former? can you add a Link to the discussion?

Otherwise, I would like to understand the common approach / practices in IIO
WRT individual drivers to deviate the common approaches. Jonathan?

-- 
With Best Regards,
Andy Shevchenko


