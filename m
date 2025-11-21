Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75968330B37
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714471; cv=none; b=Cg9SUxCw7aBNNVHTFn9+iEaBNWlhmUQ5D5MinchxuPcpxO3aSs0SMQOz6Njkt/+u9gwJph3n/yXon4pbavXPory8PgC/nDQYqsC8thxQlHW8urVVaKkBKoq2kjyue2aSgjc5kay4imgVZl9LQQi4cjIm9oEYN/Nvf+v6AEutg7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714471; c=relaxed/simple;
	bh=DaciFNiZJdDzmwkQJHk/PAQ4JjEDIeUFvUYCaDDTZMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pH6XK2ZcDfo+OkVaSg/Ymo86H0XW6wIeyG3ZPBz4OAXDs9nOAR2XbC5v3Ii06j/eT7KejZ9C1u6rCHBrwDioKratv28Y0KZOcCK8pqsj2ARew0oaxEkWedZttAPmP/OWpYYfaGmIVfIXo5q3aVN4JarW3+Do9t8pmc5KoHXmOS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nzk6O9e6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nzk6O9e6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3169BC19424
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763714471;
	bh=DaciFNiZJdDzmwkQJHk/PAQ4JjEDIeUFvUYCaDDTZMI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nzk6O9e6AQKntD2JXVbyRVvUL1AUBFDQBxR0fD8hL607V3qQ+Oz/eIh6UDh+OlIvP
	 S4Z/0o/UHsTi/Gkd8WPfumYLUzQAQSjV9s8se7Nestq8j70sOVN9LAWvJ8IqGwNG4G
	 VG/QcFClINXgV7k7f8NdlQHSAa7xSh9FqugkBW3yz8eYQJeF24PpAtmObl2KEt9Wyb
	 rCT1YrocEhyZoWnLRbjl8Yr6YNisVX7MDA47sclDWzy3ZhlfHcatZpJlsiNhAlle4H
	 zKjxrTduhQYK/26IJRIFb4em/VYnmQ4A/Dc2ctQR3PbPUV+Ry6Sj4eHZisSFhNm31+
	 /XP29WyF1ismg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a33b06028so16464651fa.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 00:41:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFbgOr5kkwC67RJ/cSjDtXiAoavaXltsU6ex0KiR8QP4ot0xI7JbESXX5Xv8sXOfmkBu/2vTWa42g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTfRhyqB20Z5y+JA6m1dAcoVXCr3dP0ceMftoJvw0TuQnJz/9b
	QuVFbIJA5A8xJFks4XOEbud0nsg/tHHSo4exrCW/uWqYCQI5mrWZDVECNhf+HR46Gt8FP/d3d3T
	kvGEqQmMuxlGgZvnpxsSQJTDUcwZUWgk=
X-Google-Smtp-Source: AGHT+IEZkw4pUOPUm1jcsxIwoiBKols3i04HAvuLgAx8hxH/RJuJuQ5mOXqJFQljvDNxVxtyEoY07KVcHagIosejyGY=
X-Received: by 2002:a05:651c:1104:b0:37a:4611:9fe5 with SMTP id
 38308e7fff4ca-37cd91db308mr3512481fa.18.1763714469415; Fri, 21 Nov 2025
 00:41:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-mauro_v3-v6-16-rev2-v6-0-e5538d534aa0@os.amperecomputing.com>
 <20251121093001.40e01849@foz.lan>
In-Reply-To: <20251121093001.40e01849@foz.lan>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Nov 2025 09:40:57 +0100
X-Gmail-Original-Message-ID: <CAMj1kXESiP+qSX+27MmPYGX9iWHjb-TEzQsWvdu=WmKcdORQSw@mail.gmail.com>
X-Gm-Features: AWmQ_blgOiT1cZ50tRM36ay-nNSHXe_Hznnj3EG_3TWHRgTyXaTyKtnj5HzswWg
Message-ID: <CAMj1kXESiP+qSX+27MmPYGX9iWHjb-TEzQsWvdu=WmKcdORQSw@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Fix issues with ARM Processor CPER records
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Daniel Ferguson <danielf@os.amperecomputing.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, 
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-edac@vger.kernel.org, 
	Jason Tian <jason@os.amperecomputing.com>, Shengwei Luo <luoshengwei@huawei.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Nov 2025 at 09:30, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Thu, 14 Aug 2025 09:52:51 -0700
> Daniel Ferguson <danielf@os.amperecomputing.com> escreveu:
>
> > This is needed for both kernelspace and userspace properly handle
> > ARM processor CPER events.
> >
> > Patch 1 of this series fix the UEFI 2.6+ implementation of the ARM
> > trace event, as the original implementation was incomplete.
> > Changeset e9279e83ad1f ("trace, ras: add ARM processor error trace event")
> > added such event, but it reports only some fields of the CPER record
> > defined on UEFI 2.6+ appendix N, table N.16.  Those are not enough
> > actually parse such events on userspace, as not even the event type
> > is exported.
>
> Hi Rafael/Ard,
>
> What's the status of this series? I'm not seeing it yet on linux-next.
>

I'll queue it up - thanks for the reminder.
