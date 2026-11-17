Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950658;
	b=TBbJQj0cYDNY2ZIyOAzMOyowbkle8FnPuCwhNqTDJasuh0J70t7c3ApWXdCmEmKtnJ1t
	 LTpIx7hI5y0Y50LHtBJXqLyqs69yfmBfAoo1kGmfLN0e9CHDKAniFV3vPNqXYCaKBbQQZ
	 tex/dB3dVpUOM6/c2Q1h5GFaOAU0b6wukk7pZUThOWmXwOPboW3bnikfFgTqpqySfSOr1
	 OO3C+iQHl5ibY20LTrg+nEUCQgW0aefjIsyIm458WQANbbWJeSs83Gjl3X1wTlouvppWE
	 YlZCsJxYfocOqpFf38XO+VHaHxmnx2xf4eE4xa36btg/9ujXklluDvi2sQF6kge2VSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=J/fjCpBeMUF8gNXxUY7RYX8CVW+S81rP+s0YQaibwOw=;
	b=XVyQIzhVOKEQZaN7bmPo2xA/r4YnYGm7GAg+WKs44pFHEsq1WmbBoqyF02JrJlDEXONc
	 u/R+G8Au1UJrPIKByxpjRRMFzfM2wm5D9KNPZzW4EGzrgg2b7lbqP3Sbh9aeU0aug3yVa
	 AgzBpEwFLrDq07ItpXKcvJxQaSvJFq5sSC16kQH+BeSLO8KNJy7Ed14Qwcc4eRQlfm0Sw
	 ug6saBSwZXamwfNHu65ZzKQcAkocfxIsAmfG1CVY28mmqyU1Yzw8iQuOnZ0r6c4PLE5N6
	 dj9i53Nfz6UkQkSv0wnNWf8+njYJ9HX3h5zAiziy6ncuK2dlC6vKgrYitb6342k1FOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nxr9m7DQ;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A4606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 21:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nxr9m7DQ
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ed408b0d9dso1225105ad.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 13:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794950657; x=1795555457; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J/fjCpBeMUF8gNXxUY7RYX8CVW+S81rP+s0YQaibwOw=;
        b=nxr9m7DQhADZJ0A11Vgtv9+ajmQSQVyjgxlF4UwAbRrS0p+4aLCL0I3w9+n8hCnAcE
         kjwiv5TjLKTSGMaG913wevcCAjy+0kZFu0WQDUaACQ06JCCjpAQEgkqWNeh/KD1jGktI
         ynt3rXfYw0l0vQ/YqcKzSN7xwFu7Rbe0jP1QxDANz1zURk/krMd5ubwFuWiIxzpXqBbg
         jFXwEKz0rfsOmVSIhERyJ6WHu+KZ0H9I3EM7G+f7OB/0bYQ6xsUORuwZ6r70SEvLo2rH
         hLxNxv6VSg1nz8Gf8vmXTRaGufNR8it5NUuNFRh0JEBJCW5TkDavFdqZAK5rDa0c60Rn
         Ui3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950657; x=1795555457;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/fjCpBeMUF8gNXxUY7RYX8CVW+S81rP+s0YQaibwOw=;
        b=Ywra82w4DJezhoXshpN8jRrCIcqsZ7u/LDiRopRK+r19v2Z52+sSW7znCOkwZa7vGD
         mULfiCyd9zWZRfSgxC4a5HlfRMwbXTKiH7ZsJGVa7kUykgfPQMjhTb3V9dqc4DC3a8Kx
         Od5m0VUCidQNHHE1to7H1D8XDdDuqs8uS8o/gYstYYmjMRy67NHL2O+tRMtoEwcXz7mE
         q3LgCtdLcK0hh/o3nD+u/y6mnogLjGolRekC020uWfwjsxXXZKfY5Z9vPEtCV8y4a88A
         x4EzqPzeeHXhOY5slAil3AYEfYmCfyHt/GtobgVNMBUODPVz+uDk9+nBCGGQHPevejvg
         BQcA==
X-Forwarded-Encrypted: i=1; AL+hErFJxpM9Sw5pYDniP1W7I5EBVAoSzhIlQ8cuub9f6gJKdVtlRpwXqyNewOUBEgNjnwxYpzkRllZyNxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T83HJtZ4Isyf2SoMpT9gjsDqOjZbim9XWTGbyfeILzz8zI3a5
	9utDKpNry+5likYdiYQBaF39pclGFMpEOUi3AoHxs+gG4NFymBl7iqHXVU2GUm3NwQ==
X-Gm-Gg: AZFdTZcbS68wN8EOOBW8fPOOzoL1er8FhO1sksqvjoLgL+aG0S5P2Wq3rBUxy6dJEF1
	mL0J4TzWhcfpFcDu2SfeBZrqO03AQ9KDxGqHBNrCjOJ4iTJ5H3RhTS1VtDtSUa/MaBlVonWxJUi
	iLsa5ry2WyacFWaa6aciSYVox3e0s1zw8Kr4Ms0KUYuEovttDj3FjJZUHDa5mhq1UMJsXJ7maAc
	aPUNXUQx2pHVhndbX0p7kWFUa9M+fV69pENOGT12SX6rBAUxg0qpGxCSn2A1uB9RSdtE+QGrV9i
	MDmkIROezGb6Q+E7NcoILATGlCAA9JpoIRc5GiNDNSU7FEbNqF6yrdhMtchIeEHlPOiUndJqQbR
	vq2RpEniJPotq+SFdT/gnczr3wi7zEGC3NOmJRG886NepNBLVGsKc1v4CqCA9AxtNCPPs9FAv7d
	KZWEElfAGxWzVGlukr0im9FpyibiaEIkMffsj3hrRj0RCgGhFuGUiwDfGDuycWsJHjDCteS3aEz
	87o+UmwW/8Z/wb7QBf/fjb7b+dafOBlj3qT7OstxacRhchoQw5970B1MUCrTCwGVxNe+2uc+vyt
	HN1t5lubmCohgJtEAk9l5HESFN0/eISckc41EH4FjL04P9NooT3OymptQafqV7zD
X-Received: by 2002:a17:902:d583:b0:2ef:ee74:78e with SMTP id d9443c01a7336-2eff72ea998mr4954175ad.13.1794950656357;
        Tue, 17 Nov 2026 13:24:16 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff617eb61sm2650725ad.28.2026.11.17.13.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:24:15 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 13:24:15 -0800
Message-Id: <DMXSWJDPGJLE.30NVP7WQSZIZ7@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, "Adithya Jayachandran"
 <ajayachandra@nvidia.com>, "Alexander Graf" <graf@amazon.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Chris Li" <chrisl@kernel.org>, "David
 Rientjes" <rientjes@google.com>, "Jacob Pan"
 <jacob.pan@linux.microsoft.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Josh Hilke" <jrhilke@google.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Lukas Wunner" <lukas@wunner.de>,
 "Mike Rapoport" <rppt@kernel.org>, "Parav Pandit" <parav@nvidia.com>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pranjal Shrivastava"
 <praan@google.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Saeed Mahameed" <saeedm@nvidia.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Vipin Sharma" <vipinsh@google.com>, "William Tu" <witu@nvidia.com>, "Yi
 Liu" <yi.l.liu@intel.com>
Subject: Re: [PATCH v10 08/13] PCI: Save and restore the ACS Control
 register and Egress Control Vector
From: "David Matlack" <dmatlack@google.com>
To: "Alex Williamson" <alex.williamson@nvidia.com>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261013162529.1928093-1-dmatlack@google.com>
 <20261013162529.1928093-9-dmatlack@google.com>
 <20261116171017.2342bd11@nvidia.com>
In-Reply-To: <20261116171017.2342bd11@nvidia.com>

On Mon Nov 16, 2026 at 5:10 PM PST, Alex Williamson wrote:
> On Tue, 13 Oct 2026 16:25:24 +0000
> David Matlack <dmatlack@google.com> wrote:
>> +static void pci_allocate_acs_save_buffer(struct pci_dev *dev)
>> +{
>> +	size_t size;
>> +	int pos;
>> +
>
> Nit, moving the device specific enable test here:
>
> 	if (pci_need_dev_specific_enable_acs(dev))
> 		return;
>
> Would avoid:
>
>  - Allocating a buffer that will never be restored
>  - Saving ACS state to a buffer that will never be restored
>  - Testing for the device specific enable at restore
>
> Otherwise,
>
> Reviewed-by: Alex Williamson <alex.williamson@nvidia.com>

Thanks for the review.

I'll make this change as you described. Preserved devices will still
need the buffer even if they match a device-specific quirk (see my reply
on 09), so 09 will also allocate it for devices that were preserved by
the previous kernel. Since restore then just checks whether the buffer
exists, that is all it takes for preserved devices to keep their adopted
controls across a reset.
