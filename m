Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3477E1FECCD
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 01:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770340045; cv=pass; b=HCqUnyKrsR1EqBAZdW+qZWNKkGL7S63yHNDjKcmFRW1GswJeID9//PT/V5IWaYuMWFP48a99ejkc9iEWietR6exiWcbg8J/iDqvnZp0/Cqr42iIhbvfJHKgCew9yRxBRT4i1RtMybAGYoWc5rVu0wao7PmRcOZm6lx9+XvWta1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770340045; c=relaxed/simple;
	bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZD7/9qNJ6TkCHxiXDmjhdAia3swjPnkQiUpTQ3LiZKnVMDQgUDvy5y6mKF/9WhR+g6V1ZuOGg/3lbZD2go3CrIjei3+wnZZGgXpPkCf3bpy3FruZmtCHE7FvpjuaVWxRytRvRN/qCZ3LcZGYGueuDPyfyHoMbw99ZVMQEyxTNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBSUUK+p; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBSUUK+p"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-895075a3be1so18168226d6.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 17:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770340044; cv=none;
        d=google.com; s=arc-20240605;
        b=PEh4bosnZgo03/l+aZ1UbMNO5gk+6rKDU9vIXAgsuiZdDT7zdShnVa8gq9ST7sQpRo
         GkTO3MBQS89+6Y2TzhfvBt2/NGzSXZhC5Hmop4FSGN0odcxr/uh/oNrJG2SQLp6uP0ys
         Ntn7t1pdCfOhuyJbNBA1t35ENcwXdMyo0TGJbLNzxKIJsZf9vVyBvt1jnhSWIUOoztXo
         kAH021F35EblDRv6Rtvg8s0lRiEkp7q293CPOs/tkRxEpJhkK6IMxYkst3XLXtgfpxPc
         p1oU8im460WcBlqaaLlRUgzuiQJFS6eAJtTkB7rNeXdqh1X9IG7n7KdeqjMMIr5Hsjg2
         4qbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
        fh=71BUdEynonuUMdqSGamxBKvIDwSwVIMbaO9oIcBSWhc=;
        b=kfnGtZq8zi+s53zI72BAiVi8VPjSZEDieAry38Ysqwd4swKPkmsQOBT1kmCQfZDuJ3
         4GfwuLK4guT5V1H1GE61uk0Ib4Bl8BMzjn/B4da3KEMnoBA/WX5blSgYKA0IpAwSwU4w
         UJPL2YAATl7x0i3GcSxTLkPJWYC6xOfqfnJRutgjIz51rc3FZLTf/wbpLEFW6VX8LUy6
         gVrIlXpCW8xuNz5F4f2HKAqv5S+b8laVsrA583AfSPa78V469/l2P3aY6lt141yGt6Kr
         NXK9oFvFOKE/oC4NmCLXdWqTufKTjLKfZZJADg8W6dP8YrmVy1FgHaCcu/lSyBqtlhz/
         QV/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770340044; x=1770944844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
        b=QBSUUK+pHEQKVDWqU7aVtVvNN+Z5y3qfTInfv+o7/d+2U/Uh98z2l3j5dJzMDHo3Zp
         7KKRnsvL51LzOWN+hUhOeIfyuKXIdl1AsuQ+9ImzT10RJQrmJhcU/ERBypEEGwG3/5i8
         sny6S4hqC9OojiB3yjMI/4xI0HaVn/ERoMhuAmXv58idmsWrURwif8g/EEhH1jV6AfGQ
         jln7vpt5QNkBk8Q829AqmRYgQsGCqOzIKNZyRNh+XVEmsmC19nnmfcuVySZZZKgwA0EA
         aam044VkgskRdJrJcg3J5Fex8XYRGFJKrLcV5M0IwV4LGKHYlwhHmqs+v1frn9zxK6TE
         oTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770340044; x=1770944844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDWVWFCQyt41m36By+1mg9Tz8HGxZTNBLIvQ/XOM2S4=;
        b=tAFR1ZprACgBB6M18V+9tDY01hNsAafzxEvS6EXEci1hsSz1F83S3GUBw1q6/rd9NP
         Ajyq+E5Sx8DxnfN005vJXZi8twSpomBx5xiHZIJJ93cpOMtS9UucplzEajVBT22w+TlO
         E4IUmtk4PFB9lkfw4nUMh5eSByu8Vuhf7/ZA5uYzOo+3AJwgW7losIPAOTMZpfAgw3xd
         GMfN9ykInvlBNwlRrV4nRPIHmsmvfMXXwj71iZRiRthHlapAaOI6tQQ5ODMOwFjdNfN4
         I4Y3qGpRdvhWaizq+9Q61KA99TPCXZ4tK/j2mI5EkzCFXOulRiHSSk06cEFDkvD00hm1
         Wmew==
X-Forwarded-Encrypted: i=1; AJvYcCUZeKwk7/YfoQhkCRfxEGDE0MhPObXFE4McQZ/7l8NjGYvJAWUaSbvR7LrJK1400GnbP7vR7seQSW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7WQp0boM63w+r8JU5p5q6HEmntRbpUZUb7AY4tof6vsRABM/
	HYyUuwFilrpy5VJ7kNfNUmpV3ghYDeD/YBCHlGBDV5/05clFXr5KhEVI5vKDrihZ/1c5z00/Cpt
	csF1aX8Ua+VzwXc1fXEHGjVFk+5E19mA=
X-Gm-Gg: AZuq6aLNATFaG6247cYD9vUJGTkhgmQkrNem7/07hYMHdgVutDILSYZmLXQp41R3Wlc
	1cLuhst4rz7TMlWEhAZ5thg4qAdzvkbHoCTRdbx5wc8IGZTuIoG+Q+4M7u4+MRkplPf7teJUxrd
	Q3JIrP6bn3mmQO3vGEma1Oi5e8spORg8TgMyZJQU6mg+CVw5f71CpGftoQJc6i1EZWUpiB+T8JM
	aDPf2g6g+IngNWKJoxXpXsKJqT+h6x2zDQHiYpPVx1WMijvT9mnUbbGKIiOzxzlkVANC31NCo0h
	ksH96ITvpZmroA+ANmk5AQzM743P6FQZ/TL+ThtedqxNnPFNvbKHeGM=
X-Received: by 2002:a05:6214:c29:b0:88a:44c8:fe30 with SMTP id
 6a1803df08f44-8953000350fmr75404466d6.10.1770340043910; Thu, 05 Feb 2026
 17:07:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-3-joelagnelf@nvidia.com> <CAPM=9tz5iXoFQ3+4hPFW+tZCL2zWe0WJ07-oFkP8TNVL_J_SSg@mail.gmail.com>
 <44542f0b-be3d-4e82-aacf-0bf19ab69954@nvidia.com>
In-Reply-To: <44542f0b-be3d-4e82-aacf-0bf19ab69954@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:07:12 +1000
X-Gm-Features: AZwV_QjEIAozPEFJ7NdCW81HEOLtXZUhxCZzFmSJOZbp-SMcdPX-QLYah3tkGzE
Message-ID: <CAPM=9tzafj_-L+ia8q=tL5DBWZU9PdSq9vaCAD7ituoMR+CaQg@mail.gmail.com>
Subject: Re: [PATCH RFC v6 02/26] gpu: Move DRM buddy allocator one level up
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
	Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	joel@joelfernandes.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Feb 2026 at 11:04, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 3:55 PM, Dave Airlie wrote:
> > On Wed, 21 Jan 2026 at 06:44, Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >>
> >> Move the DRM buddy allocator one level up so that it can be used by GPU
> >> drivers (example, nova-core) that have usecases other than DRM (such as
> >> VFIO vGPU support). Modify the API, structures and Kconfigs to use
> >> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >>
> >> The commit cannot be split due to bisectability, however no functional
> >> change is intended. Verified by running K-UNIT tests and build tested
> >> various configurations.
> >>
> >> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >
> > I suggested this and think it's a good idea.
> >
> > Reviewed-by: Dave Airlie <airlied@redhat.com>
> Thanks, Dave!

I'm going to apply this to drm-misc-next today but I'll move some of it around.

Dave.
