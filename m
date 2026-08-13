Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FBA37F8B1
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 04:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786597038; cv=none; b=LXFb9T47g/ACrcxEvKAyNPU7q4VVv/aKCitJMGiqvVQ69y5VJTHw0fzVzg+buVQkVuIai+NB8mXB+EoJODS2A4PqC90Hl1MTm4Vomxo3biBJUcWO2BuH6eQJQQSqkwU47Xf48A0zS6pzcfmbOyFDNmaLNxwTOdj/Zh7cVErYvdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786597038; c=relaxed/simple;
	bh=9+ULFWVEbitvZ6X+/yUPHpOAJDJ7U8TgkFMrJeNMk/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUUrrbv0T2rWKrJJcGdPcP0MuVuA7LwDdjGAofL42kJZweQzZRxWhjHcriSaEKm8c4ubyZrSSGaKEknGroBIAbrlSRjti7h/c/DiEIVfAevP5q08QPY5+/FAfEDfBMmyotNkNG97GN5i1G9NPp7tdouJr6eIE+PWYbJmzA1nv88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUyV3Mf3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUyV3Mf3"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ced3386430so21000705ad.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 21:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786597036; x=1787201836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WBtU8YVaq1yMUZRCZWu+8sP/s98ztgfVffYxabqxGEE=;
        b=AUyV3Mf3GPCSO7ud3xXo0H9+iBdkCQ9nuJqP+FUctCHjDf/poEOgsfRsJpT7U8v4EM
         smKOhkeRs3IZbGSpo/4OSr0ntL+u5N0hwL221wehyCRbcqwzD7kT6CHu4nWXuJcRZrzQ
         AWXEdCNHBpzQlXXkZJF39UqulQLoHnMtVowtB84tWB+I8uQjaKAgGVms0AX/ey41oRie
         F1l55WaDkjVJOxB1SM9y9v1nJ/O0ertuLTD4lHwjpPKZ4w5snpVBFilTau1+sW5kwAQp
         R0KXY7TLzkZxdSaz1BQ/Y/HXwl8r0tOXXFwkdPohMDW9ALkCONDBrlTaa432BdQy1SRT
         K4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786597036; x=1787201836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBtU8YVaq1yMUZRCZWu+8sP/s98ztgfVffYxabqxGEE=;
        b=BYvuOCrR+ce+VJxpoxM9U3oOcHltbNLowFeW6KJD+yBBAzPcyhMitgnYztdRRe0jIN
         8yMg3BOURIKSYWnoCGYrCq+x10izGAMzwqjQMdd3oaahu7RIuBH3I4eiAO/x/ZV4v6F0
         wwimwxIzVTQ2JeEWnuYurJ5GknRm5ucgluYqwZV6324lh2jtPWd2oq2qne4/D3kUUnOD
         8qeQnJ2xxiwpSDW8bDwz/pSWWDKRxPfwHfGLWnyEfgVxaBt5eRbc76sUOYV0a1jLP3+9
         nEYItbHNt2mmOpQCXF/lEImNAaV61cykS02tjK7+BAjqRjMYr4Uxh/qVSKiIlaq1GnPr
         7L4w==
X-Forwarded-Encrypted: i=1; AHgh+Rp84k8OmVRt6VVkzp0UkfXr4cF2VWssLKL4nCwX9YtJI0FE5AZ9AI6Gtuy3sapiZ3lc3nJE5+lzTQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpG8EPfeDI/lDc/0NrP+kU9sMlgRwKaR0BB1GQIaV7zJRz9mne
	FhxCn1S4r96ZptFzBfum0Zpk6d+xWnvxJxqflVI+tLgdS7kN07J2jZtB
X-Gm-Gg: AR+sD10oZL0xkyisCM69D2jsprc9E66sKAEVkiwwVbmWnHDCDUKuHts3iByQRHRQb8i
	6Rj9IHi12YojI677iLszX6VZT47mJOCNAu4HxtIMKsRzuaxamTgK+4BgGgBkrY9O/O3iJ1nhevO
	VCQSfKzzLABHFCHwVMjb+ZgxCd8ZA/JPM+SMjFWxQzvYtBuRS4zLMGBIY5qC2IoNPUAbE+DCOwY
	MQlM9kkrQRw71P0pePyEB+Gfdo4QWEvtAo+j2qmfPWNwQNv6ZWYj7qpUylNx/XUBRnrffcwczXs
	b8f6ldzS1H3hh7J/E4u1KOrznvrJmPKBa9TINSwUHFRtxc7wbaGErtVI8GYxdIL5Kkx8Snsv7Aq
	NOESmI0YZ7rfKMA0p2/eBDRNtzMNL+spbTRy5PvlHjm8rS+LwtAD5AXCDuV7Gfp8y37eAUNiJ52
	/EpRqxpItEqjmNdHyLY+cq3q+lBaP8DJrSfOF/X4I6oVRPB2p6ECnhtgPMiIfcR6YaymDQhzh8Z
	w==
X-Received: by 2002:a17:903:38c3:b0:2ce:93a3:c168 with SMTP id d9443c01a7336-2d37d58376amr36875355ad.7.1786597036243;
        Wed, 12 Aug 2026 21:57:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c200408sm3960635ad.12.2026.08.12.21.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 21:57:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Aug 2026 21:57:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device
 configuration
Message-ID: <bdc11dcc-ec6a-4951-9348-1c60a3be94ad@roeck-us.net>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-2-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812103532.395049-2-renari@arimil.com>

On Wed, Aug 12, 2026 at 06:35:30AM -0400, Arie Miller wrote:
> Move model-specific report offsets and capabilities into a device
> information structure. This prepares the driver for coolers which use
> a different report layout or do not include the external fan
> controller, while preserving the existing Ryujin II 360 behavior.
> 
> Handles an issue reported by Sashiko where an id could
> be missing driver_data.

This is introduced by this patch and thus irrelevant for the commit
message.

> 
> Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>

We are too close for me to accept this series without independent
Tested-by: and/or Reviewed-by: feedback. I plan to apply it after
the next commit window closes.

I won't mandate that the issues reported by Sashiko are getting fixed,
but I wuold strongly suggest for the users of this driver to have a look
and consider fixing them. The issues look very real to me.

Thanks,
Guenter
