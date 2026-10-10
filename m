Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB8360751
	for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791628397; cv=none; b=IiGQFUR8miV/Qtm0/OLnq5GKZBGMgxetncuO7kvINh8WTefoSR3jovhdLZcDDc1dX/r+8om/nz3BZ+taqRh6s9iA+ZOuZ5OVxvFI/xToYBBCjPixQkVQzrjbpi9Ji7rBDjfTANhYQ613PKdUPr/vtMo2VvDyw4FZxKshiGJAurY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791628397; c=relaxed/simple;
	bh=cXpXyyAxJEQk85gzl9TTiU5pF79hr7iF/5HP6KNcpRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ehrdfzocq97gT1qYfl0Vs5hqNMKXcj0DS3TVjGVBAWBhvTgsu3SDHPZgfMrlrTioVjtUdxWOZn+BUqAl79kryWjG5dSHsYtzHFGQx42OoSa5FeVryKR7iphze/noMLYke+2gM9vOf75MV94SiwFtizgkY27ni/Kh+7RcDUJpr48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ATVqcYuM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XngCrKkV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ATVqcYuM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XngCrKkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791628394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
	b=ATVqcYuMR+07F8ir3rGrmamv8fVVIjTw01DV0Aic0HFJDvLxOyewAOWUAGM7ONmLIYRdyH
	ZijZHYmhOcGRehU+hBP5gRw3U7GEHAw9RoaCOBqZ9g2GH5WJ6bQDhFEbbt7X7avFsoxh5u
	kXHwlcNyc5O/hmXdJwCZ/sp2fcWtqy8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-Fkovu24pM4eF7NPm8fZyPw-1; Sat, 10 Oct 2026 10:33:13 +0000
X-MC-Unique: Fkovu24pM4eF7NPm8fZyPw-1
X-Mimecast-MFC-AGG-ID: Fkovu24pM4eF7NPm8fZyPw_1791628392
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so8767435e9.2
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791628392; x=1792233192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
        b=XngCrKkV/WIDqh5TFby4SQkW3Hzd9vfekSIdkJTlDixE9QnIsqmo9Bm6NsXySM++94
         6p+/+l5AD+GGJuCPkKpEVbLkNj6lGUlDLSNy5dg64ECyG8LKXg7HB4Pusa5fWnN8+Aw1
         baZBXH1oOyw3GL2YmjEFmBD4lCT8jW5CuIR2ujywSUqAcdZkaxIogO08F4b8l42xd7CK
         dMMu933HeAY4f88tC4SSgSWLxcsto0ErfxcOlER4v87tF6NWEM49EFvh//vIz37kBKdG
         XT23zMJTDC0rAEG3QBXUVyh32rsveYbK1SkYxrPgB1qJdo8zqo1MFpbmWQB06XrgNJpL
         Pg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791628392; x=1792233192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
        b=O762Sf9kRJxvVp4c64x8pTNAW6oPkOZw4/dxqzRQvrYcJOzr/m/V15gzsm2oPUKz9B
         vvaM8EItK+GmcYZl0lMTVdOzOwvRh9n984HrjUb7pvTi1+eEjuX8Jjsnc1zrx+iCEclf
         fPnmmHDhMyy+nKE6tijF58ybrfoXzLLxWsc1ttsSElVzwT/XHwGwNVfM87wmVvdmEuWa
         IuLmpL+gY5vwD3RsQeKM7HVNSU08vvUxAby9VQ/E+ZtKyQw6GZcLcawjVIMKKBhrFXqZ
         +OiciEpUXNiYqDPZ+8BzyX5lmBO9IiPdXkkg5fApT8wpfrTY17ukFmNha4FZxGYiFPGf
         Hg7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxU/qWY6im12ifc5KPaKp+MaRVXM6CGDQfbtkQ/ZFh4qpyWSQZU/hlHK+dPN/iWadlzplrCOJKbVNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv6ECyyJzTg2oQmG4ElvHFRC51q3wEeG6wkhnZW4sDj2h7cDCw
	IAsu/oG85VCdJv/UkpZHHJwtKfz89fv9dFaJQftaHO86IMxOkRjkwrRMYUFL4ppz1oKhhldIzF8
	tecXPldouAEuCAURJDtTuireCzJS/iGOYGfQdT2AmpxG1Ztdp2SZxsj0kEPkDMw==
X-Gm-Gg: AYBFou3kjwnnneAPBx6nBNMDWog63W/D8mitcSs6jy6vjS3ZiSiN9WNPbg7b4rwICqJ
	UC+XKrQdqaSnk1YA3DyXqS4ywfE2cPyLbY1s/AGv3NxB9Hj7bytodsW1UHlgloZr7491zXceZw3
	lMbCDHCPXKg9/RwCOVOOPCV1USbm+HCXGSndvZeuOsok3c+Zi5fVFU2ciqdICqOLxqvDKWvZSdJ
	bVpjEn95/3EOazUnkMXhVyMF6aepcbEWzYTgyQtt2u5OFtMbOIcLc9A1VgKheya+HwcYImsSzhf
	1y3Hcnk2pLLLc9rTa+wL84PF8T0L7IsSXBN6zkSnORPAOnbpPOTMCJM1CoZp1OvJ7DWpHUI=
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr94489275e9.21.1791628391856;
        Sat, 10 Oct 2026 03:33:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr94487985e9.21.1791628390226;
        Sat, 10 Oct 2026 03:33:10 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fb:d100:601d:d7d4:d03f:527b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c3a13sm8328544f8f.25.2026.10.10.03.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:33:08 -0700 (PDT)
Date: Sat, 10 Oct 2026 06:33:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	broonie@kernel.org, tytso@mit.edu,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH 2/2] agents: add a skill to determine Fixes tags
Message-ID: <20261010063228-mutt-send-email-mst@kernel.org>
References: <cover.1791499378.git.sashal@kernel.org>
 <7fa126fd22b4449cf63a7045f7cd959e106fac87.1791499378.git.sashal@kernel.org>
 <c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info>

On Sat, Oct 10, 2026 at 11:40:56AM +0200, Thorsten Leemhuis wrote:
> On 10/9/26 00:54, Sasha Levin wrote:
> >
> > +A ``Fixes:`` tag identifies the commit that introduced the bug being fixed. [...]
> 
> Sorry for partly hijacking this, but it seems appropriate while we are
> at it:
> 
> What exactly is the right commit to specify when it comes to a
> regression caused by a change that exposed a way older bug? The change
> that exposed it? The change that introduced it in the first place? Both?
> I'd tend to "both", but I guess some people might consider this as too
> noisy.
> 
> I've seen occasional discussions about this and our docs for humans are
> a bit vague here:
> 
> Documentation/process/submitting-patches.rst says:
> ""If your patch fixes a bug in a specific commit, e.g. you found an
> issue using git bisect, please use the ‘Fixes:’ tag with at least the
> first 12 characters of the SHA-1 ID, and the one line summary.
> [...]
> A Fixes: tag indicates that the patch fixes a bug in a previous commit.
> It is used to make it easy to determine where an issue originated""
> 
> And Documentation/process/5.Posting.rst says:
> ""One tag is used to refer to earlier commits which introduced problems
> fixed by the patch:""
> 
> Ciao, Thorsten

I'd say the one exposed it. this way it is useful to answer
the question "do i need this fix".

