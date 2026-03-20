Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A233A872B
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774008526; cv=none; b=u6bCPRhxHybFLBulhxjAjrDf3AHyprRVNbjcrDMb7lV8JyxiSk6uQMh//JbwTz5yw1WR4WYT7H1ZevLdfuwyApLAYGAn6lJXDgTf+dVChomLWP7nXkzycO8loy57mSNYTUc+HKpXD5JyUDZc7q1VejlT2/Fl9o75rIxnaRy8RRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774008526; c=relaxed/simple;
	bh=sTci/8J2E+epYvecHi5mLJYOgrVmwPgaF51deVVEfT4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5L2/scjieYV45ldjvbCid09WUh6/lP9WADKMPrhllwEDrr2SAOFr+2y1CGSGrEiNJ57N/7H0O+EGgkGUeYGF6bpJi1BxMK0zRpoWasnFP0OzYCCKCr6VBZ6nRihnsezxwCE1bF1ej1hvvt7X4jWatSbq7AwGG9wwaBpJj3bk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuJihI8x; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuJihI8x"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so5069635e9.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774008524; x=1774613324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gvss4kcUZITGQy/ngnNiEgdp54uhtse3hTZBF+Kteg=;
        b=YuJihI8xQKNwIw7QKDEWgHzRv3tYleDRqb3Fkc4FBbMWfx1MfGVz5FnLbEMJdGkNOc
         eMX14PmWOeVapcWiA/4GXjnzhG0S69dg7wNgSQart8Th3lty36qDejCWvVR/6bstzHAJ
         z/lVd/T4OYho15dYGVTRbWinN4kbLr58VJejbtR4FSjzZVXvgNdOUdGHnno/HGCcmKzS
         OCS6NPhYIODadqSec/o/BZ6mhJPFP3zqIhP2N/Bjx58nakhvw5PNSmQGEnCkyiHy0UKs
         6XNQYQpioUpdMCTEHOI3vn6METtUVxLrWWQuPcsW1l2arF54tgYhqvrP+GYSnXQmP9ZW
         sngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774008524; x=1774613324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Gvss4kcUZITGQy/ngnNiEgdp54uhtse3hTZBF+Kteg=;
        b=LoaUKqGOLCpevR7AWdoZGAzA8vJV7gXypO3oPZZkidq9GiKyO2nmQGH19b3xn1dfEc
         Rh9lPW0r3bhW8J22cyNV6lTi9z5ZZJxzwS8KAaA7uULDeUTrpcqntYtCpsnsAvdJJBkR
         1c7UkVXocFJ5msEtDvsHAu0NVXJ/9xwRcMchaAkcpJacs4X63/Frt1Sw0jkos00K8M0I
         SWxIntHlVcFDTfCd6DcRdjSeMkKt69ITe098hqGGP1LbfgYZN7/YBJ7hrglyjYqKuIPJ
         C3I5iXS28kj0x9LiBvTpPFe8zX89t6ctcoMxOgMNehhlAJKa4QCLL8BN3uPoCsRwLOeh
         r+eA==
X-Forwarded-Encrypted: i=1; AJvYcCWLnk5tXVmOUWH3ig/JZL3rUVnnapvXfq79u6LmY+3JbVUjT+njuk+0WS5x3StXwuaVGdgDxz0A0VM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr2/Jg0tNb22Mceu8mNd2VYvKvLY6/I4q3/jynbmZTWsgRK6uU
	1ErejmnCtw/xXq1rEc+x+aMf5SRQtH+n/lshc3chqUkfNH3qq5DslVpD
X-Gm-Gg: ATEYQzyH5s0YtBnmLq3MBLtKWfuCSlYUQeq4jzOozBvG4u17QGPVyZ3xYhG78+DNnRd
	DqIippcFWnAKfUDj9XDLpe95Ic/qL/dZCKh/+iiPnhonQ/9q56hZZmdhGeBNfqZ/KgpmrfU8xO7
	qoXS/b0WthThAYMKO6391iK4xmtclTCrP88xuaeepDw0BmbFLdBozQPQtiGK4nPaLXL1eDULAJe
	CQ0ONUQ08IuVC3bJp7vWt4AYe9HfMBvfjI/bqb5do83KyFzvzrPm3D5s8//ZzHOWyRM5awsUWxh
	7Gl/OvwV8aaPUSApPPTsFxtqCIVsEEJXRZ2geJatnDHmDOjunOTcOFo97+3jy23PKx05JUOEh+/
	L1dH0F2QJPkfl+pu1vq6NCzxFYlsReWcJzMekGm9r5vA0h2pSr9WRdrTULWeZmg15/JSZMNC6Kr
	tUWtMkE1JLqSeHDpNlHD12z2QISDWP/5azZxUC5rf9JDQ1jaVa0A214so4oRC/92Yup7ketUbsU
	80Rg+1/Nt68ntV5Wc8e3EI4mExlWN5viuAWhbq/w768PUiydXo=
X-Received: by 2002:a05:600c:4ecd:b0:486:fc61:541f with SMTP id 5b1f17b1804b1-486fee2e5b4mr40216655e9.29.1774008523188;
        Fri, 20 Mar 2026 05:08:43 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe889652sm22927885e9.2.2026.03.20.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:08:42 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 20 Mar 2026 12:08:41 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 02/10] lib: kstrtox: add kstrntoull() helper
Message-ID: <ixvzb5mni2lhz733f4fvvzhozmpezkx5s2q7sash3wv3u2g7ov@pgs6pve6kxrq>
References: <20260303-adf41513-iio-driver-v8-0-8dd2417cc465@analog.com>
 <20260303-adf41513-iio-driver-v8-2-8dd2417cc465@analog.com>
 <aabm23jCikXs1l6F@ashevche-desk.local>
 <qcloiwjlbehs4yyuttvrt46monh7isef4d5nzuwlaby6uxfael@j3trvc5jwosy>
 <4mtdzxfj656sjr66npabfvrr7yd7q26l2unhsihjtniz4ossfj@g3qnzonoary6>
 <rygken7oujyoupeanrdnl7r7smesa7js6sn3jsafbajc4sm3jh@adeslfqwwf3x>
 <ab00clb7LL-bmJWe@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab00clb7LL-bmJWe@ashevche-desk.local>

On 26/03/20 01:50PM, Andy Shevchenko wrote:
> On Fri, Mar 20, 2026 at 11:16:32AM +0000, Rodrigo Alencar wrote:
> > On 26/03/04 10:02AM, Rodrigo Alencar wrote:
> > > On 26/03/03 02:16PM, Rodrigo Alencar wrote:
> > > > On 26/03/03 03:49PM, Andy Shevchenko wrote:
> > > > > On Tue, Mar 03, 2026 at 01:27:07PM +0000, Rodrigo Alencar via B4 Relay wrote:
> > > > > 
> > > > > > Add kstrntoull() function, which converts a string to an ULL with a max
> > > > > > character limit. The function is an alternative integer parsing function
> > > > > > that does not require a null-terminated string. It becomes a better option
> > > > > 
> > > > > null -->  NUL
> > > > > 
> > > > > > over simple_strtoull() or kstrtoull() when parsing integers from a buffer
> > > > > > with custom delimiters without having to create temporary copies.
> > > > > > The function is consumed inside the implementation _kstrtoull(),
> > > > > > promoting reuse.
> > > > > 
> > > > > But this will not properly convert 0000000000000000000000000000000000000000100,
> > > > > for example, if the max_chars say set to 20.
> > > > 
> > > > Why would I want that? truncation will happen in the case and the value will
> > > > be zero. max_chars can be zet to INT_MAX/SIZE_MAX if you want to get 100.
> > > > 
> > > > > Also kstrto*() have a common idea behind to consume the only \n and allowed
> > > > > digits. This (naming) doesn't fit into the kstrto*() category.
> > > > 
> > > > mmm ok, but include/linux/kstrtox.h is the right place for this? how about just
> > > > strntoull()? I feel like a safe_ prefix does not make much sense if it is
> > > > only to differentiate from simple_strto*(), which should have been safe at
> > > > the first place.
> > > 
> > > Also kstrntoull() does not really match kstrto*(), as the 'n' is often used
> > > to indicate a stop condition on amount of characters, which would not need
> > > to require any termination character at all.
> > > The 'k' prefix was add to 'strntoull', mostly because the function is being
> > > added to the include/linux/kstrtox.h file. Other names I could think off:
> > > - bounded_strtoull()
> > > - bstrtoull() - 'b' for bounded
> > > - bstrntoull()
> > > - strtoull_bounded()
> > > - strtoull_limit()
> > > - safe_strntoull() - emphasizes overflow safety over simple_strtoull()
> > > 
> > > Extras considerations:
> > > - Single-letter prefixes (bstrntoull, lstrntoull, etc.) are too cryptic
> > > for a public API
> > > - safe_ prefix is subjective and doesn't describe the actual behavior
> > > 
> > > kstrntoull() is still my first candidate, other than that it would be
> > > bounded_strtoull().
> > 
> > could you provide more feedback here? Thanks!
> 
> I don't know what new I can add here.
> 
> My suggestion was (and still is) to have something in *_strtoull() family
> with additional checks added, but no limitations on the input string (i.e.
> no max_chars).  If you look at the printf() code the max_chars was added
> solely for scanf() and has no use otherwise (yes, I know about and aware
> of initramfs case).

but is it include/linux/kstrtox.h the right place for this?
*_strtoull familly... then can we just expose simple_strntoull(), which is
private to lib/vsprintf.c, by changing its prototype to expose a error return?
In my case the limitation on the input string is useful for the truncation of
decimal places when parsing the fixed point value. It would avoid a 64-bit
division.

-- 
Kind regards,

Rodrigo Alencar
