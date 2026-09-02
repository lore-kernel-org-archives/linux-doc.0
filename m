Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450494A4825
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 18:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373842; cv=none; b=e5iabBbdrMU/PWoDXuksSfGcOxqyDU7aTIMbIuLzR3Jg7krJSUxHlS/qNRtfm6YcTeNQ9bI8nX79EDnnB2PH31bdvcew03WNtLCZDCLIlDh3WohHPu2HpKjEtoQ0NocUCVDXEGSveIH+BbAhCEBde7P3WDJ1kX3RU8dRBhMu0TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373842; c=relaxed/simple;
	bh=bkBg8JCveUTUejP9e99kXQtFiCBa0ligbQaxs0F77wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vo0NQaB2XhzA+UAML+UprNtqRlY4bQ4YHpzo0Ttik2OWEcwjoR2QO5WX7C7/a5V2IQNOeFv6b/tdNviYJq1+dtAqohli8GdG9gLJUX8FKgXLLJtS9yJvNR2UfA11i5gXg8hQT9537ahV4uMj5k4Kz2+P2kg48Gw4s9gsWk6JA/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk; spf=pass smtp.mailfrom=philpotter.co.uk; dkim=pass (2048-bit key) header.d=philpotter-co-uk.20251104.gappssmtp.com header.i=@philpotter-co-uk.20251104.gappssmtp.com header.b=sYnXJ1Jv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20251104.gappssmtp.com header.i=@philpotter-co-uk.20251104.gappssmtp.com header.b="sYnXJ1Jv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso21123755e9.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20251104.gappssmtp.com; s=20251104; t=1788373838; x=1788978638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1qbNEpl0QUNAOnPf9pwBA6dUXCvPRsbz2ZyzRlAtMQ=;
        b=sYnXJ1JvXYIy1xwxLmpJJnjSj9kRnEvoz/EtVDRJPEST/APRVpYVfRMLPFSNHkmEwH
         T8BZwYqseLDs7XfUznw+zvc1oarCLDovcscbJ8knVsI1FnpXFIvaA0cat6QVrWursVVK
         F/tANqLbvQexDB9+xuCp5ZSxd613Ne01fTvmpXMS7dg3a4BVpzImWLoyQUtq8FlB8yeS
         1SxNMU3ak0sYAxR+atlASbUswIkcGviQKRPMuRR6nvJsZBdSSYfIbhBfFQ7xuxqTOuuI
         gmwro8znsXXRJ8e60Ed/YeAaMhccHKc2bKH759iSd+/xgmyMxkFy1FBm2luUVscbkubX
         lSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373838; x=1788978638;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1qbNEpl0QUNAOnPf9pwBA6dUXCvPRsbz2ZyzRlAtMQ=;
        b=lLcuDSoLezjFNjURehubUV42182cDv8AWHTp9Uu176n4Oca8VrDspdJ3kh1BCehXPr
         8Gi43twm6yoIL/y4WC+o4WEhiggWcTvrlYPdmH3eFy73zjeHKTKGwgXLTp6Z6+J0bUKZ
         FgCJqp8pYK8t7CVV5eF92w0bdSR+L3TsAWp45gr0C378y580qNDgekrxFWwRWFSnX8VH
         W8ET97qnaWiz/1wQk+i6uXy+8BmImCkuVdn54JQS+yikE6BAc1yaa/DGjVY2eCxTABt2
         Z3K3pdhy1eRWl72LS3u6JtSBCzMVwSPu9oLrB5F29TR5OsLR0I3k61h6WKQ594y/GOCR
         dYRg==
X-Forwarded-Encrypted: i=1; AKwUvBycISQDR8rB5M4hdvXeAc+Q8OTlhiCEl5/CSTX31lOVJB64vSsKe8/eH6PYtv71QdBGBqYW+aG4qhg=@vger.kernel.org
X-Gm-Message-State: AFuF++nxL8dIb+2wo0K5hJVaoZgEU0PK9BDl0WXywK1n5vSi52I0NtE0
	AGOXAk7HgTHSIgDHglkGVXV+Rx9/8Ln4V7Iie0Vd0/OJU1ZndisXIM6EKCUBxRCN0dw=
X-Gm-Gg: AYBFou0lVARpbANOFv19eK2cCqfbD9e5KifGbXQhunxpjm38VngU022KBHJeWPU6ko9
	+kmo/z7qpj0TxHw+CX3AoFQa8Q4060I8wElvUUDI4/GBZxZc6umufyI+EaPVRNyi9/0uWDGle7K
	ipwnNuL+G0jp8c8ffw/J7gAtF1TLwWxXsM2dpDk1b97QuS7qs5ejlePJ9NemMjLfdAusQpodyPG
	JzONBUycEaYboDf7HwpC1y/06gxNOhY3OblU9Gk9QVprSs28ruJRgG7oTPwQ0FC20eqxLECG7ju
	LJEaq4CywigOigmIgjK0NGg4PcoIxUGRw3iTo4hweLCdmsqs5SkOUXYsDY4s7pNtriQm26ninoh
	Ay4OQBi0LMuV+Kc+CBe2b887UAzEBowFmiA/MB6z0cFcDBRdniggam6KpFYnyulC1LXZ7qc0SA6
	btLRhQ35jxa7jhme579c2gs8wOnicPuugqMJM75G5lwnffEFKQ65ClTds7kVTg8yTyavOw1hKPf
	YpWKaHg3WW9QR7AoDzUy0tODd52yogkFrnDnUlmr2zohGM=
X-Received: by 2002:a05:600c:8012:b0:49c:d818:8764 with SMTP id 5b1f17b1804b1-49ce5842473mr140567475e9.11.1788373838366;
        Wed, 02 Sep 2026 11:30:38 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm9134555e9.15.2026.09.02.11.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:30:37 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:30:36 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cdrom: fix brackets
Message-ID: <aphrTLxLO5F2adsR@equinox>
References: <20260902125431.696887-2-manuelebnerli@mailbox.org>
 <d254a0d6-83e3-4f67-8fbd-87b5ad3b2849@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d254a0d6-83e3-4f67-8fbd-87b5ad3b2849@infradead.org>

On Wed, Sep 02, 2026 at 09:46:58AM -0700, Randy Dunlap wrote:
> 
> 
> On 9/2/26 5:54 AM, Manuel Ebner wrote:
> > From: Manuel Ebner <manuelebner@mailbox.org>
> > 
> > Fix missing ')' and add '()' to function.
> > 
> > Fixes: e327cfcb2542 ("docs: cdrom-standard.tex: convert from LaTeX to ReST")
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks.
> 
> > ---
> >  Documentation/cdrom/cdrom-standard.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/cdrom/cdrom-standard.rst b/Documentation/cdrom/cdrom-standard.rst
> > index b97a4e9b9bd3..b6dde1d1eaaa 100644
> > --- a/Documentation/cdrom/cdrom-standard.rst
> > +++ b/Documentation/cdrom/cdrom-standard.rst
> > @@ -1014,7 +1014,7 @@ How to update your driver
> >    just calls to the routines you adapted in the previous step.
> >  - You may remove all remaining memory checking code in the
> >    *audio_ioctl()* function that deals with audio commands (these are
> > -  listed in the second part of cdrom_ioctl_. There is no
> > +  listed in the second part of cdrom_ioctl()). There is no
> >    need for memory allocation either, so most *case*s in the *switch*
> >    statement look similar to::
> >  
> 
> -- 
> ~Randy

Hi Manuel,

I concur with Randy, looks good to me. Will send along for inclusion.
Thanks for the patch.

Regards,
Phil
