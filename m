Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3531308F3C
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788621759; cv=none; b=q/SDAaICZPTJGVunv/y5N4fqfdPK5oADKbrkKhtP6y9jOZ6HUI4nUowlo3T4NcKeDOaHAsLR79y64vZfT4My0fx1lrDkhkV9a8rEx8C2FHfmBEGign6hirruwt8gYirm+mYstLyol6UW3lffELTKX1mbfQC2wb79M0KxKIH+SXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788621759; c=relaxed/simple;
	bh=stE75XH+VoyliaLEVzRsIQuDTfaIfORb7fDDrzhIzIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8sBAP4zWvxG7UYVMK+M3JI4v1YUMTfFe8SIxYib8sfeJBDzOP72UHTxCLXyiwKxh59ZtBzJ15mERyxUUCS1KJLUqPJCGSl4/m2XgQcnzijRP86g63mBeaZI3D8raqwHKCQTjJ0Avdgu8R1C8pfRl+S41OUMOigoS/c7C5Ff4Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8VBuZdB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8VBuZdB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so16978135e9.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788621756; x=1789226556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xiwfJ3u464HVWwKQuOirA1XlcYzmmwiUzq3bDqr5FyA=;
        b=R8VBuZdByeAmOt2hgeiAFGbVlzYgkzSSgERPwbBPl7cKgG7HsAyE6M7wK8FxgaTYDA
         jnP+A+T1Q6ZI+Bo4qeibVLWDiR06l1YcNMjWu2BYr7VrQfI5ucQnodCaZfkn8hspCTgd
         xCMer0DSJqBa8O0qupacAgvtYunxyUJjL4rIi+wrpTWGYeK5dp6zqe60eXADpuTwfQ/t
         /87fOBp5cbjOPlen9dN8IxYE4/A6hx0uqYR6wiE6AVuPHlFBEhiJiB4zNbKn6T2B0bcH
         NNdHWzuUKhMn33Nyu7ZyUhAZJTBLlPivctwY6668dsBNKyxoD5AohDNaYLPCggO15xHC
         3ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788621756; x=1789226556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiwfJ3u464HVWwKQuOirA1XlcYzmmwiUzq3bDqr5FyA=;
        b=o5glw5ob4gZaxOrlSBX2AEflKsRYFK12TtfRmq4QQK2w214XtTfo1UMz6FzD9UGmND
         R9ZQc14VVzrhtsqrYP9k8O11oxOzv+tnCc7ypjN9fE1x/zH62N+S/7j9ZRnygZ/oQ+d7
         k/LdvT/Y31zMUOkeVSSgUYAlKcrCg/Ol7G2jZ1jNg53pSFIhql5Ra5aKCn5t8iu9iiyZ
         k0PlFVD18YAmiONpEvBl+4iOTrpaHIWOqFxZDVqZ8ah40gSPTHcdwCgSmibw0jYati5h
         5SZZxB8u/H4sjjXBgjKkppnHAYMsJiFa8EMU0i2RSHxB7ixtLxz0uIIzLIoF0ZLDULP1
         OHMw==
X-Forwarded-Encrypted: i=1; AKwUvBwiqnESxsBMbMIYJ+tVge0WJ5+ZZHM9zAN6k0TFp7iK2HkuhCqPyfWfbWWjDkjon9gZLGETZEV0tUo=@vger.kernel.org
X-Gm-Message-State: AFuF++kVPLkAeKK4WRXf7uzoIYNXyZf0FyAtqIvIFpjO7D1Vf2GaPz6A
	Stlgc4MZrbMdRYY0ZqgaxoCTGPo6nICHqGL1KuHj1jQAPJp774wAi22r
X-Gm-Gg: AYBFou17HW+ncW3+fn/HEGVVWyevhIFs/hUfKeFFxPCCVDJ2azAB/BBaX5T65FUfZ59
	LGXeqaMOBukAkrWEa/D+EV0suk+zKlNqnSmDJu2GEBI5cwJTR1k7d2N0w6WNc44kaw0ISndkx38
	O/pvA1Kwx3j8HtMmEz//EguyepjR0wHN0aSuF5aPg9qp6zQfrpTwmOCh+76Ghs5upFFmxSzOylP
	okqP6IjeUd9LHjDnME0pWB7azweX74pTPUIZn9spwPpUUvTo0kLvHN9wL0LMYVxiGh0vNti2naC
	TnEwJQ3NAX9uI12zyVyFlkyFOt3KN1oJhENwWKZRxSRNFla5Z6uJlxIILrPGlTJEc+DdyCcR0Rk
	OwfgbAvYScAx+YtjKLT9lyJ8eZoF2eiFDCrpZOKUryJXBoOB2kzImlvDjWdFgCb1rblT7d2FPpX
	J0ZnM7+gtbz9uAAsX0ju5zX6EV1xuyfwQs7fdyx6vasDYNYxoWoFNTNwDycCa3s/27GoapXe3GB
	LHNN93XLMFN9DamAUtDcVcGdxfDyPRL8hpI4tzN8351oeG5zLwdtVo42ZDvtMzOyaUq28Hzngg/
	Y5/gL8NJefmDX0jXZTPp9WNXxrc/wgYf7RFN9/CfLePsHaNJ/JQdELTJv9+8j3+D
X-Received: by 2002:a05:600c:6303:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cf82cbab5mr112017265e9.6.1788621756075;
        Sat, 05 Sep 2026 08:22:36 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm246185335e9.3.2026.09.05.08.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:22:35 -0700 (PDT)
Date: Sat, 5 Sep 2026 17:22:33 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <apwzmSr6b0WEkW86@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>

On Sat, Sep 05, 2026 at 08:13:45AM +0100, Borislav Petkov wrote:
> On Sat, Sep 05, 2026 at 11:46:43AM +0200, Karl Mehltretter wrote:
> > edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
> > edac_stub.c"); nothing parses it any more.
> 
> Nope, it was:
> 
> 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks")
> 

Good catch! I will send a v3.

Thanks,
Karl
