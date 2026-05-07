Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916EB480321
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778182520; cv=none; b=jeg26Thys5OYo/LS4e74M22Q9ANWwTAotywpKVqxe8TgH4R0wx1d1i6kK1bnD/b9fU2Fs23ggVsLbHcwdXYzi0UWe404ZNUXLp2nUX2MybvUGHUdFaVkmjSELsFu+cmdUZ7y5Q0T2vNMbtwtX02SviwhX3QNrIUpLaqKMkLO4Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778182520; c=relaxed/simple;
	bh=egyJ54W1Vz4slSGKdV3Sp2mle9aTDaiuFpCrkCmzJuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmwQy/OX1Z/830xUEJs3m8ZmWHNq/uukpm2tNvv3zji+1E1zQuIKpPOrMQM/sSFJ0tiUunR36ZklKIgoqAH8mCrdlNsmqb+AWn3rloMEomy8U9njRD7VQvoVTjI32YMvCgZEyqzCIAwflKQw06cKvmPwtSy6SFnhu8HLv4Hrb44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8iO2GNb; arc=none smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8iO2GNb"
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-50e5eb0fabaso11946891cf.0
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 12:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778182516; x=1778787316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GUH1cXbC1tx+N4+5eObi62eHLa+mMesNGYbVZ4fNanM=;
        b=k8iO2GNbmQEii8+o6MS7t8uaZaUhd8gZpAT/X2liNOgrgbS2jW6hAPdV7QEoUrYZat
         yuPaJ0F234Y2DxIhSyvzBYvGcoJ9WLXczuNEGEzNc1r0VVkUWb1ij19zN/zr4FR6zDBv
         sPOAxXA/XPql7n0Rbnv3mVCcz7e813t/oNs1trX/VhngUNODnsEfFTNyz4aMEeQKsLQV
         TgVt0TBCqya4KtcO3YauZBucr5iXk905/nFgdHiPfYaVqH/KhRrOQHW2lhtGxnI4gmS7
         w5fy6m7x7dUG+jeUSEudVijeQDb0WOxSBCZmrYEnB8JOGm1IZCGQPL+bCT9IP2dF14E6
         H71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778182516; x=1778787316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUH1cXbC1tx+N4+5eObi62eHLa+mMesNGYbVZ4fNanM=;
        b=XqJwax8PJOb4KNnHXIpllTv7p04YDYJ3yiRJa/bJCT+nOtUfxybUKynfC0H8KD6Iq/
         AHNujEjrPmInxemc+KVvuBkI5leKRcT2RtZjUxQ3r+XCYILinE7T6ehBWYhSnsNWHSnP
         YTSz1IBGZ3ZSojEZjNpMp7aIRFsA5NEd/Z08rg8amHnfWsbKX6lb6HkRnDEp0ic/syPv
         iUvrAN3HuzlQVueXT8AZ0HM+mc3A6sbWXGMw7ojZtPmTa3D615g05VjqEWFWYpBHhhDf
         x34mtXQ2l4LWJjz8zE88AHcFZqnoaUnPVoaMtYrxS67ZJbolw2wblbgSn+MpZdZcrSP7
         cZiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8sCKBC/B7/l+VZWPL2241zUC27vmfKoJvaJqsffnBun7GVyBHEw7A3KwQ3pyQoT9f9PntfRbjGHAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhUnb0+HnwV8cTVTYIAVigfD3SalHetfsiNBcgcnr8Qour5kTF
	xr84J0SIe4pDOOfR8aY7LgoPB3wUdXVok+Mwgwf86oUSVu8eZwGwPk7N
X-Gm-Gg: AeBDievRaeedlH8xrhFrjOWLtIG5mhK6uT3+dF5piEK5bVX/By6YugKX+ZWqlF/BnXb
	pLZ1RbeVknwJyY1YCfqIpUjzEQRhpvhdlM6OLtPY6mhAhtGYM4MdlR6Z45lrjok7/aL/LBjvdpG
	cKTYzuCF7GaLBi/fLVUhzgrWCynqjlV+AzQUDnEXzkQxK1i7gIru5kf8g7szbUqA8J1xFcMoZEd
	pluUUUwwLVHY8chTGNYvmCgRYOPJ4PEzHU60COcNo6fU4Le/9GY7EEYHgnfgb7TEiBaFaBZuuMs
	Ipv8Q28Yk1L0FtOP6/1Ix2R+lbLPmUQLLRinl9UyVSzbWhMwyly4byjPZhoKNxbxBv/V9mHZuFM
	IwYNja0yG9dgzMtYhTh667+YL4bweJBtlLf2IwwqmOygJ0zgg55j8d9ucIkmPXmClj8O5l5KJ8c
	/qLX1Yl+wm25nS7Q7jAw==
X-Received: by 2002:a05:622a:98b:b0:50b:a9d3:2e20 with SMTP id d75a77b69052e-514621df2camr123839701cf.49.1778182515941;
        Thu, 07 May 2026 12:35:15 -0700 (PDT)
Received: from drapl0n.kernel ([216.165.113.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-514851049f0sm5059641cf.10.2026.05.07.12.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:35:15 -0700 (PDT)
Date: Thu, 7 May 2026 15:35:13 -0400
From: Mayank Gite <drapl0n.kernel@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix typo and formattting in
 security/credentials.rst
Message-ID: <afzoL4RJk3po1Hwy@drapl0n.kernel>
References: <20260506225925.271163-1-drapl0n.kernel@gmail.com>
 <cbe6e145-9d2f-47bb-8d22-1599cfd1a9d4@infradead.org>
 <afzQVIv4-Up24VNM@gmail.com>
 <87pl378417.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pl378417.fsf@trenco.lwn.net>

On Thu, May 07, 2026 at 12:31:48PM -0600, Jonathan Corbet wrote:
> John Doe <drapl0n.kernel@gmail.com> writes:
> 
> > Thank you for the feedback and acknowledgment. I thought that since my
> > earlier patch was invalid/corrupted, I should submit a new one rather than
> > version 2.
> >
> > I understand the procedure now and will ensure that future revisions follow
> > the guidelines.
> 
> Along those lines, seeing multiple names associated with the same email
> account is a bit disconcerting.  We are not generally interested in
> taking patches submitted under pseudonyms...

While configuring mutt, I forgot to change the default placeholder value
for the "realname" variable, resulting in an inconsistent sender name.

I have corrected the configuration and verified that my environment is
now set up appropriately.

Sorry for the confusion.

Mayank
