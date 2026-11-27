Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804552;
	b=uM74BhIk/nscbRrhO+zDi5zfbibpbswSlrgaHk+nr36+4wlEisSxbf0qyMTQryWwrKx4
	 wV8Jr0e2PYjfW0W5tawriBaXCNFYH17V1HeuGRUp5pxf80yY8lqIa7XVTtHZY0tWIyA6E
	 LziCWlxHCi6hrkqLHCNX32GSL6Tou64adLCZLt7ekRNBN80xagwHMxhwl12laODTmbnGw
	 F6m7dfeWnmQAfaJUtggyX2P+qV1038rIHT8CLD4YNZL5vbJWd78iawOGjTdxJXlnlfgd6
	 jo7oQuzKSWx0fLqBhaidaEytzHk4qKYtKlVX3D6n2+jLkI/LVdYuGPTJuPm9O+vJ4kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tF50Nzkiz8TetU3KuqsmLR2UYlH9w5XpGjZivIOBBHo=;
	b=xGIzedylyRJ8Fwuhi+pb0m/8j6wsaIhdSfTvtuOJbtmE72anaNa8l//v63XeDtPL7bd/
	 1WnPD1+9np45/Yv2WSChiCKPaNx5LPLdlWFvDrWuWKsvEpCQZ784eJ1WAJ2x1sIG0Yt9W
	 6oorqEfMTH0rbCGL7h65WPFttj0KTVNbcqJJ7N6ugMbaTn6pS3JVm9UtKcT20oii9PtHp
	 sCuYhu5cZx4yyTlpo0aR3LK87F+Yjn7YSNBKS+2hBETd3Gf4iQuxbQ9T3WYjSltKPIxCC
	 ox4VxelhknWeU6PSeS4VYg0NY9CWEs5EjuXqeUDDQOpxolkf0cHoBpOP7in8S6fe7pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Fj1bJxJ0;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F582606A31C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 18:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F582606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Fj1bJxJ0
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-55b8cd4e2abso84394801cf.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795804551; x=1796409351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tF50Nzkiz8TetU3KuqsmLR2UYlH9w5XpGjZivIOBBHo=;
        b=Fj1bJxJ0/q+RCXCL+ngrgkwcF9vPXRG9KyQ+E82YNMaBs0oRjulHVQ/26cv0e4+b5u
         W754HR+EZ/XzS6ncfOunsPe7plYOuq6Cmoi8KQxSetFUApHaQJBxC+t6H0KCBnkZOfsz
         e8MzgoFJrAWOL9ZPB8FvGhj8ABGzeXR2CBOotSDjuJVbw8fsP9btqkcAthJ1icYxSdvi
         2ocIY2FYVJVe18nQMXSHybxY/PTXbTs6O22AyLJayF3ptX1w05wnFQwkfCn0yt744AYQ
         lK0Oteoy7D1yLBAWeZRG6EZ+P87QYxG0zQrm0ak9iXwE0TKzbiMZ6oHR7WgLupm8OkQc
         iEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804551; x=1796409351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tF50Nzkiz8TetU3KuqsmLR2UYlH9w5XpGjZivIOBBHo=;
        b=WrE1KcY5lOTySIRwRt3QL5am6FmfATJRrSl6NcMeCrURwARSyXhNmKrjBV+fPtVFE6
         qOn+2qvgZlQ/Xg3RJw5OyByi4S7Rsqk5zUGNIGaSGwV9NsdNtBXc2lP3M9cwZPsvhUNa
         gPpg8eNFbTbW+ggW592iif3u1sillNTmPB0I/SdDVL+FwTWUUGSA4Nf5dBw6r/WrzmHN
         +GGgJVm5tJ1OJb2kmll5puzhChrZYOq1aqOcvh22aI3HxibplAZ0PR4FeOa9T3jzyYBQ
         nHFhLKZhU1XNCEkr9akqIp8v1QN0GxHfBMV/ioM0TtLbVG1u+wkQryAwpGJtXf+VjIVX
         CMHg==
X-Forwarded-Encrypted: i=1; AL+hErEeViAl4W4CQctAv40vX6HdNVdK+rXfCHXcAi9SqUtIUte6iphLTo5kW/Eeh4BW383svnu/6Ny38kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+VdgDLsulMYaSEri3oafm6ETLHaKmQ7Wh4R1Uq2/T4dFhDKXB
	vOv/7lJzNQWAXwExdbP66Ehvdc53AMIVLa5xNitd4qFR2RWE+N0cmP5AwP0iWZvKGzM=
X-Gm-Gg: AZFdTZcZU6KwWWl1jW/+EKNcgF+05u1pETtO5eg5P9tOslfZCX1xCeeuCPyd0v5ar73
	gJ/nekbRw4RozQ1fZpqFXWfx35rM4uUXmDDHy0Q+aRvhcAeauKBQBiqvImIhZR12bA0PgB0TBUJ
	xLDu6hghY8mlm3tFlhj5dFF4XwnsreKM7DpBbkHNSIfHB4T0dInOk3zohuBjxzPbSajImbiKmls
	qQAqBsc4IcItGPtiaGUjKpzZpiPiO7yGZrrO4PJwlqq7KQYACfpFjS0HImd9rq5zObnSGyttWml
	d60ig4UXDo5Da+Um1T1Qdyek97uSqcf0nMVgkxAHDnPVh3FJQWo4E2uvkviMj8gNc0V2hKGKeix
	TyDYiCrGier4g4eyWJR/HlbiX9W7PRGgmxcN8lv81mE0+UXU4obLOcdtbC/OTLNDpnyPXMuPZMw
	6Wg6hKQpJ/+TsABtUxtXIRGhVJiLMCkzuDNzI76c0Hr8ekAGCXNGEgKsaO9/+D1K56FS+Udeosz
	GBYhmnG7+kPQMXeSoouaXYen2jvB+M+sPCekOXIiWUk13QA9QndA6Y6nNm/WByH7JQBdtiXGKLQ
	brXCaw==
X-Received: by 2002:a05:622a:5a0c:b0:54d:812b:ac2 with SMTP id d75a77b69052e-55d76aa5123mr463929871cf.28.1795804551241;
        Fri, 27 Nov 2026 10:35:51 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dc8895b8bsm36322411cf.10.2026.11.27.10.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:35:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX0nW-00000007aGg-0jpi;
	Fri, 27 Nov 2026 14:35:50 -0400
Date: Fri, 27 Nov 2026 14:35:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 7/8] attestation: providers: introduce CCA Guest
 attestation provider
Message-ID: <20261127183550.GV246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnK2c3kMq8p2a_7@e129823.arm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awnK2c3kMq8p2a_7@e129823.arm.com>

On Fri, Nov 27, 2026 at 06:24:25PM +0000, Yeoreum Yun wrote:
> > > +static const struct attestation_evidence_format cca_attestation_token_formats[] = {
> > > +	{ .vendor = true, .value = CTLV_ATTESTATION_CCA_GUEST_EVIDENCE_VENDOR_FORMAT_CCA_ATTESTATION_TOKEN },
> > > +};
> > 
> > should be the generic EAT token type
> 
> Is there?

That's the idea. TDX uses EAT as well.

> but the content seems to be different according to vendor, So would
> it be better to keep it as vendor type format?

EAT is intended to be self describing, so if you parse the EAT then
you should understand what the vendor and content is.

Knowing the EAT came from RMM won't even tell you which ARM profile
version it follows, so I'm feeling like maybe we just need to tell
userspace it is an EAT and then userspace can parse it deeply to learn
exactly what it is??

> > What is this and the related work? That isn't making sense to
> > me. If the token size is not absolutely fixed when the driver starts
> > then it should be fully dynamic and this just streams the variable
> > sized token.
> > 
> > Ideally directly into user memory so we don't need to allocate a kvmalloc.
> 
> In case of live-activation. I think in that case CCA-Realm token could be
> different by activating the new RMM.

Then the size isn't static and you need to just stream it to userspace
whatever you have.

I'm expecting these unsized tokens to work by streaming them into a
memfd so that userspace doesn't have to try to guess how much space is
required.

I also think it is pretty broken if LFA is changing the token for
realms that are already running. How is that even going to work with
an RSI API like that gets the length then tries to fetch into the
allocated buffer? Token silently truncates? You need to loop?

> > This isn't OK.. We only get one struct device per RSI and it gets to
> > bind to only one driver. Given there are other drivers that will need
> > to use the RSI, like the TSM and others, this needs some other
> > solution?
> 
> Currently, this attestation driver is enabled when !ARM_CCA_GUEST only
> (IOW, when this driver can be built only when TSM arm-cca-guest
> disabled).

I saw in your FIRME series a solution to this problem, I think that
would be good to get out on its own and apply it first to RSI as
well. We will have the core RSI stuff, the realm attestation and TSM
driver at a minimum..

Jason
