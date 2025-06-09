Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A173FF1
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479995; cv=none; b=TmgpCr486EwRBc3P21E9OTGSuAW271jWmzriL2eSmQb4oAVM6nNS6eedVvmOsYiuNueg31t2DsUIu9Y9lgiCLfMz5s7Poxq98gMDgm1uCHpyRkgTf4GfcoICL3vO2bpQCe7MdwPn3xX12CYGKVTL8SUB/IXGVHQh10mdrch9OpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479995; c=relaxed/simple;
	bh=Tpmkew92d3UkCD/uBMzxFAJa947kpytzKjgdSyXBJfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xjul88bgmLKpLTVWUTMY39z7JA5NKZ/I9NzYg1T3ddzz0PXC34LEBc0uuDnkyJztZxO7kBODUpCrsRtEQtMJzMOlUFpA98280aK5PYRcMQtyic5b4P+5QOtnb89CT5s8dGhtX5T6UzyPqKpJU8CJiL2guQPcJgSTtzRXwthcQSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kdpcp82k; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kdpcp82k"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2855680f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Jun 2025 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749479992; x=1750084792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TBUyMfCvEgObXbMHMtHUW0hbnDDnIuTip1OX215Qd8E=;
        b=Kdpcp82kCwc92L/UgF0Whbbj5VvCOwVSJhAJI/QudBtP5S2cjq4ObAHOiP1czxYYYn
         O6iPWkkHhrJExJTcxZPbngPEKUi2VMjyt/51lVF+pTF41ui+xB0Aj5eoYC1oQ27uNOBq
         BuEjyEHMzbuiJ31XKAbPjDhpACLoXtJu2aYxm5KTEmyWjpDt/S0bFnCoA3RvCp1e89/L
         djALovjdfi6jGY5TQm3cGS4IEhNrd8XjMd4xnTGHuzA7WAZCP00TWNIl4lAmLQxF2l2J
         VkNvl7s3SKVDH8uaN6YZO5y8ZPEjs77AGw7uL9hM6BukTjwSS4gWXQRvpkbtpZ3VmVsp
         MIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479992; x=1750084792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBUyMfCvEgObXbMHMtHUW0hbnDDnIuTip1OX215Qd8E=;
        b=Cdf7CcFMcBHomKCAb/BSTzlJvpq7Ixh77sFujKdGf1o141T8XK4FwCdGyLBxjtSFkp
         M+32tfnNxjUqpgYYoymyvH/55dSi+8eaNkxYDb+xRU/6cq5JTSIwfHsv1xh1U2hPvgVj
         NqmsrMPjUoMZu1YvDd2WN4xrGo5KPwuLpzlmwfWrX+hfNfTd1+WyQmR65ljVRlTRP5xn
         Kk9fjuUQa9e0D2RJV5f5GSHcQwfxPYlQjaxTVhcW4Rwz4zHZF5Zs7WL4ymMwdNn3j1CE
         zj2ZXc2B8EZKWUTt/BVGcT+bMkWcsIBI3/ZWykdZutJtKZe6SuBp2PMPvBIm98P6ey6q
         Yhuw==
X-Forwarded-Encrypted: i=1; AJvYcCUDiWmSkGe20gE7HhUdFHrHDyBSYa8J63YsK802NfbOq7tgnYqdLS6q8pwRYchou/y9CJfKAjFe/OI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZWNE8cnYNx9Yn7zixb4VT8mUhGAVWcEL14khplcKxYWUkALat
	J57rSrgq3X7ffBr4oKwoMZrVuJT0WNMZ1UXzFgNpiO8QZEx+sutOnPqOhvIxc78Tfbc=
X-Gm-Gg: ASbGnctzQPbOZ7+d1GKy6ltq8IyFDJokI3X3MR0jLuQvhtKJqw0NbXy61iEaNuay5KA
	I2bI/hYvFmauUXFXY4YCeM5pvQbStPDYgavyxTcYtKyjr9GHFrV+3gMDSyPytEvKSiHxNTtJ93R
	QV7AMoZfg1XhRs9eImIbmVJ4XD8gY0yxzsQmwYumQvmdqNbcL/7b0tIF6hkDgd2UT6e+c6/07MX
	x/4shJY/3Ij75IaTDwdwlEaJhzMplP+uuFaYbIoeMZb00P5JTg449se7pAmuxDUxspgrqLU8TaE
	oPkh1dCLzwG/9g3I3GBx5D7vQDCryeKXlQ8A3nFxI09uVgG5/ueX3mtHMUvk9Ole
X-Google-Smtp-Source: AGHT+IHQ9WnlIb2N+Qu2oqWlSl1QrWztkyTzn0RfuZ+Bgd3cAwyVXJ521y5E6cUICXCtVhbSAJCdMQ==
X-Received: by 2002:a5d:5846:0:b0:3a5:2b75:56b3 with SMTP id ffacd0b85a97d-3a531cae8d7mr10675904f8f.24.1749479991728;
        Mon, 09 Jun 2025 07:39:51 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092635sm55068605ad.81.2025.06.09.07.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:39:50 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:39:25 +0200
From: Petr Mladek <pmladek@suse.com>
To: Kees Cook <kees@kernel.org>
Cc: Sergio Perez Gonzalez <sperezglz@gmail.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Rientjes <rientjes@google.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	Thomas Huth <thuth@redhat.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] slab: Decouple slab_debug and no_hash_pointers
Message-ID: <aEbyHeG8qh8GChTh@pathway.suse.cz>
References: <20250415170232.it.467-kees@kernel.org>
 <Z_-dPcdiGW0fo8Ji@pathway.suse.cz>
 <202506051314.D6EDFA91D@keescook>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506051314.D6EDFA91D@keescook>

On Thu 2025-06-05 13:15:32, Kees Cook wrote:
> On Wed, Apr 16, 2025 at 02:06:21PM +0200, Petr Mladek wrote:
> > On Tue 2025-04-15 10:02:33, Kees Cook wrote:
> > > Some system owners use slab_debug=FPZ (or similar) as a hardening option,
> > > but do not want to be forced into having kernel addresses exposed due
> > > to the implicit "no_hash_pointers" boot param setting.[1]
> > > 
> > > Introduce the "hash_pointers" boot param, which defaults to "auto"
> > > (the current behavior), but also includes "always" (forcing on hashing
> > > even when "slab_debug=..." is defined), and "never". The existing
> > > "no_hash_pointers" boot param becomes an alias for "hash_pointers=never".
> > > 
> > > This makes it possible to boot with "slab_debug=FPZ hash_pointers=always".
> > > 
> > > Link: https://github.com/KSPP/linux/issues/368 [1]
> > > Fixes: 792702911f58 ("slub: force on no_hash_pointers when slub_debug is enabled")
> > > Co-developed-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
> > > Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
> > > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > > Acked-by: David Rientjes <rientjes@google.com>
> > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > Signed-off-by: Kees Cook <kees@kernel.org>
> > 
> > Tested-by: Petr Mladek <pmladek@suse.com>
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > 
> > I am going to wait few more days for a potential feedback.
> > I'll queue it for 6.16 unless anyone complains.
> 
> Hi,
> 
> Is this still planned for 6.16? I just noticed it wasn't in -next, and
> we're almost to the end of the merge window...

I am terribly sorry. I have forgot this patch...

I have just pushed it into printk/linux.git, branch
for-6.17-hash_pointers.

Also I updated the documentation, aka applied the diff
from https://lore.kernel.org/r/202504181307.254F81843@keescook
See
https://web.git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/commit/?h=for-6.17-hash_pointers&id=de1c831a7898f164c1c2703c6b2b9e4fb4bebefc

As the branch name suggests, I am going to push it for 6.17.
If it is too late for you then please let me know.

Best Regards,
Petr
