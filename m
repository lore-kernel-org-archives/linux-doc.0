Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D171BEF66
	for <linux-doc@vger.kernel.org>; Sun, 12 Jan 2025 16:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736699473; cv=none; b=K0EdXMjdi7Ve1A3r/g7+o72pebaONj7Z2PKx5mDZQr8nkY97nKQL+rskuVCXlvNkwgqA4CH7md0anDlrRvT4nitHXTSpTHIrRIpR+960guR032o23rU6uODFwIm+MZaBLE+7PZa8Imz40oivG4LAl7hcQB3hLxdZnHWzpgr5Ggs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736699473; c=relaxed/simple;
	bh=+ZSLQBehxiuq4WTHU5FsPgpMbl3uMrfckw7hl78oB7w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7KWC8hBqxvPL/8Rf0CHLWaQTMTl7Azx5VImpfstXe/31rGieUI3kGGuSaOpGipSVfieT3FNtCqLl6QfDvH4UdrrbmiKhAEKXUqAykcN+9ZxEos0jjuWuJN/otkb227I+bxf8b1h/8/IIl92t/dvxJ8U+wS9MlJtoBUUtXf32lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 9c4d8e33-d102-11ef-9cd8-005056bd6ce9;
	Sun, 12 Jan 2025 18:31:01 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jan 2025 18:31:01 +0200
To: Julien Stephan <jstephan@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/5] iio: adc: ad7380: do not store osr in private
 data structure
Message-ID: <Z4PuRW-9NTSGARTj@surfacebook.localdomain>
References: <20250108-ad7380-add-alert-support-v4-0-1751802471ba@baylibre.com>
 <20250108-ad7380-add-alert-support-v4-3-1751802471ba@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-ad7380-add-alert-support-v4-3-1751802471ba@baylibre.com>

Wed, Jan 08, 2025 at 01:49:35PM +0100, Julien Stephan kirjoitti:
> Since regmap cache is now enabled, we don't need to store the
> oversampling ratio in the private data structure.

...

> +/**
> + * ad7380_regval_to_osr - convert OSR register value to ratio
> + * @regval: register value to check
> + *
> + * Returns: the ratio corresponding to the OSR register. If regval is not in
> + * bound, return 1 (oversampling disabled)


> + *

Redundant blank line.

> + */

-- 
With Best Regards,
Andy Shevchenko


