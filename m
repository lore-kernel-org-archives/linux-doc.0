Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9528649E5E7
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611393; cv=none; b=OS1FhUr1mwN0mm8DlJMWUsFc+r+ZNhYiIEgdVOE9+frRB+E1y/Eg6NsnntUvyBkNFJ23Lfp1aMI+xS4u0bxDQuWZbONjaAisj+k6ZmhSinUQ6KAOhbSO6KImmhViN2Q3AQUFN/VGQHKeZCCOlApfdlzm60rkkPplxZ/pGgdVTDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611393; c=relaxed/simple;
	bh=hMg7RJefHBNDjWx7qlSUPFnIqApIedOx+ccA1coGGAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onGgqVKKnZ26AcaO3eBeN3/WYW39xZ0Nb0ko72eVBrYcR5+m7CBuJtky1Wydv+UQMYJdLcW57oi/ZF06YuntIOulBeFNfULRYEbjdyXyFZn55EoTanHILXooNFpfIa4xio5f5ZuIw8+EZ3BSxZPJzC18J4a3z0LvAml0dF2iquw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUIYRGfZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUIYRGfZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso18116235e9.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611389; x=1789216189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IR0+lkethKHvrwCdwLXMATakzMSwaAKd6EpWxgPc0oQ=;
        b=lUIYRGfZzMxbh71ntNcHdfaX7qcD4W21aZLxy5KXsV9jI0WlTJMjwPTfoYUixE1+ax
         8VMCo0qv0LwmCspW/ZecFnFlkVR/KWFcMLPa2gNvG5MNCnXFfHJGsX+HiBRcZJ2ULwdo
         RvT44Vy9q5hmqgqqogM2Cc/pWIFt34PI1TYu6UM1fZZKQdezEwJ0jtWE3CE3gK1KDF8S
         3s9Z4ISt+ScI0rYlwygCxRJXM0UkOQIvcunGyvlinYZKEdEPhUHdzXkfTsnhGqdCHcCY
         2XMYd2un7S7NmKo52rrnRaQq+5CXgSSsvwGK0AMrnk/flDzw/NIk2/cvhhGqIXR9IfgN
         SBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611389; x=1789216189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IR0+lkethKHvrwCdwLXMATakzMSwaAKd6EpWxgPc0oQ=;
        b=Ww3ATki8SD0WL7waXNiSw/VL1pkSw706yT0Si2T/LV4NB2PfozvSlK1iybfXizluLB
         lk9+qc+6/OlhG8C207JHrPPHwLjn1G2NwlkMSUquQ8chCY15u/wEg4D/u6R6Nq4erFvG
         F3jfukmWRb6OS9E7ISTqLPhe4Blt6CWxDpUu8k8mQvKg8zs/e/CJP5YOujpO7V4ybSy1
         MVJjth/kvS5ZnvGANjI8d73JpB3s8Qwp7/LU8xRgTq9qNt5KNE/tMkx5oF0KqOe+saU2
         uonmI+uu9UeKC3eD9ioUHqHEiaHo3Cot2g/yxP0opmglC+eupIh6SL7o+lxQa+xGvbge
         4Fpg==
X-Forwarded-Encrypted: i=1; AKwUvBxSz0TPWGG2xd/k3u0eS55lLcXFiIzevLJAt85XqsIebcfC96Et88ClSyCNcClAVRzHsN7RUmc+2MU=@vger.kernel.org
X-Gm-Message-State: AFuF++mPBLEvCpWEh38s4wjO6oMQt7LPr3Xml8NhG33JHAQSgs9bjLF2
	ybNNb6L5qZSCVWQEU3B3Y/4chZ9cyhoATmloF8y1N0Od/Dreo0a62u5J
X-Gm-Gg: AYBFou3YEuuU3Ej6na2S64X6blFrufcwcPDV2mBGdrXs1PjkVasIQYCrrmexoavJ+2O
	/XxOJ0yG01vFXd6Fqq49HCZtYxmYRqo+qVDquvaVNl8qQ3HzTiVm87T7lL+KZivo4cey+1Pgr95
	qswGMdvrlqmRzOWMi6FvJhdLFfuwPEcyCh769yeRGhKlZKUK1AKYc+LXiKLRyyN3kM91sUx/BJL
	/FIX2Gd+g1pHqUjOHVn5PDYjmzQe+h2ANOop0oCTZ9Sa64D8miHUfWcrSfvjXQoU+8h4MWxVHWY
	6xBv13T8KsimpCFPGH+LOiRXX6eX90n1O04zM91l8JcY1qGX/i8fD3ivc4PI4nlcN2oXhyZA7Y+
	rAxIFwRoQHfFq5e6zaNybhmv6egGAIyarPjmgW8sLednMMbaB6a1ZDsDKqZo9spRz5SXVParvrB
	pjkJovzCmiwc8Y5Z+g4ZcahPCK/KjOoBEwuMaPzMv+0UuAxaTQ3wqxQ/QFRQXa7jJIJTjaChWuu
	+1HMaaYufAfwFMl+ab5P2NF5l9KyltgFvMNEOpHKtEjUJ1ghB6i91zB2QoETskAMcau3TIVJ53V
	dMyir04VxbEzUjbeiUM15CC2QCC3jk2dA6q6pUPoqOqlWZyr4GG2DjfcZpoaxcyV
X-Received: by 2002:a05:600c:3495:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49cf8244bc5mr116977535e9.7.1788611388275;
        Sat, 05 Sep 2026 05:29:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm118555475e9.11.2026.09.05.05.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:29:47 -0700 (PDT)
Date: Sat, 5 Sep 2026 14:29:46 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Subject: Re: [PATCH v2 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi
 and pata_legacy.winbond entries
Message-ID: <apwKitEmOv3ZwLkd@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-10-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905094649.41996-10-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 11:46:49AM +0100, Karl Mehltretter wrote:
> pata_legacy no longer has the qdi and winbond module parameters:
> commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
> both together with the VLB controller support. The entries also refer
> to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE, which do
> not exist either.
> 
> Drop both entries.
> 
> Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> Acked-by: Damien Le Moal <dlemoal@kernel.org>

This one is actually a duplicate, I just found out. Ethan posted a more
complete patch in June that removes all six pata_legacy entries which
commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") left
behind, this patch covers only two of them:

  https://lore.kernel.org/r/20260607064053.195166-1-enelsonmoore@gmail.com/

It has a Reviewed-by tag from Randy, but does not seem to
have been picked up yet. 

So I suggest: drop 9/9 and take Ethan's patch instead.
The other patches of this series are not affected.

Thanks,
Karl
