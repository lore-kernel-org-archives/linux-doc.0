Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6EC23EA85
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 01:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770342539; cv=pass; b=XzJ48jK5DBz+bNTybqEIySNKFqJKh+EANn5aWItnLP/ZrX6/5cWkXF+lN+qCBC5MTLyjZvaBLdUGRHCNJgZrsjftI/BAmXksVp5Mf+6DGOL/FQjUc11D28Ta45rAFMJ+BMSdgR8o5OaSkeHmLLBTtE85hLIceqTHLdtUQhDf+2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770342539; c=relaxed/simple;
	bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkIvvNHFyC8kFAQTvf7ULw1LuoUdL/W3NW2E/BxcBMjiCLhDLy5T3h0vGrWuKBIw60bviwOUyBfGOMFTu+GmtE+yMmBElGvEemT6c9yRqebj19jzNo4Pxt07JvbdvFxOIs1UajEn4CXqO9D3YXoNKGBiJJlMxpI8x9kkXPyTocQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSO+dHb8; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSO+dHb8"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8951c720496so12860846d6.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 17:48:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770342538; cv=none;
        d=google.com; s=arc-20240605;
        b=Oj/zIsHs0TPd2jhu+6byUnmFtWhwiegy2K9vuINxpt/tg+kJQMcP+jjPpAtSfhSETh
         0Xxzs7f8DmdIIaB5/77882wru5eXnL+ENH7CCaubbmXGnqPUpYofyI0m6m45pvf2bQPD
         cZ9iUksvryUUzIQvmfOahSJVt7ht++EG+bqDQKAAFVNOBteuUw7Ruxk2dVft3eUnfQjI
         RTjSyVtXIZpdtXBW2I/w09q4nOJ1OWhmJTh36kw34Cg0VE6C+YMC0CcQseUsj/8FBGY6
         uBxXFXT+fkTT0nNxFarSyMuWxIy8yPxIJak7hYeY1IRAj7IT3qie/SD7DkVooCkC5UW4
         nX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
        fh=Cb8k656GrCznplVrJU90urIBLS0eZ4xEztXfeRxqe7w=;
        b=UwL5cgYwR43QifcZn62HPzFCfZR+3lYgVFmDIM/rGsu1eRpfFijSxKYkbkrMTFcoyY
         LBisHv2BajhkicPHqWFAqenjLsy8Vujfj8zpYmSN5xC7M1aeVM+tTB0S1MgNHaoX3GzE
         m5tgdTniahmCUQZaOUbPsKHhKd+5dGQNI8GMAASvh+7hAc56mzuwQTx+EJFfZsQJ8sWE
         uCG6HvVKdCp2s7l3Lsp1+tdOWRmaWr2UF8y5JN9tPIXZ5e3Br8jTJbr9D0pPXPZ0GnnV
         eo8dj22W8yJ1whW94gUwPlmMgWV9XAcVMBMpu+vmvcp/PHK4tL2VMFFPjjNEEFgkriyk
         JKvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770342538; x=1770947338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
        b=RSO+dHb8hCYS8eQGF6mFZ5GtOIutzXtL22MzW5vs+SkWw7e72WLP2HFwGWY5ftbyHo
         fHvxfrkmd9G+vmmgohs10bl9oxvYPwOmBlFJlBDSSWJGac24T/sfBEqlStR71XVuDgpD
         4S27igf8upM7T1TXzzQM39mlwg2FWLO7yfXDjQoJbaqnaGGSesYbvET32p5Dr/bhhFxx
         Z/FZhNn86RiWtq8HzwMySL/CSnhkI38m/01DoOpOT8ShMAxlYKk6rxYIDZKx95q0Qixw
         gdsW8qIvDZQkMga2c3+H5gqxwrieC1rS7lWWHd71hjTuzHmhaF7jbzxTJTRAu5FLN37K
         1ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770342538; x=1770947338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
        b=tlWo10z4ayPxWj+WYpvq73Pty/k/WQlydTPZuvto3QM//HBplroFBMpVZE2jTlFdPm
         H7eGaWfXFGWiCPsUe1Y5CWBm+QymwHo1YK9F18vBfwk7w4q82laHbcFL5zU483RoCjDf
         fU1CEpA+RjC4N/EKlu5SgdLYX7uq+n5sZTGItFJxTQdIjwLrOkTQu5Tlvjwv/ZSzeCsx
         8mTMyKnIHYiE81nlHfe/8V8yLH5Oxc8hpwUkmzQvZY6qZ6EmebdQOp1o3bZbCdAct3KK
         3RJDLSbPlHvZkVM5XRiyGObyr1mY6iS3JMC3ascgVk0lclLqYCMQlqw49hXemUzTtUNV
         5LVA==
X-Forwarded-Encrypted: i=1; AJvYcCWeCAXOSTBrw2jcCpsvynl8W00CuQBoKW+mgkXF3iotb4g/BCO1RpLkspX8aLylH6EYSZk3f+atIhw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxdkw+N4VYS+sKp3P2uPL7EhTUT1jjzZS8SnicleCS9j5fdU2+
	84eiNe6nzPexbuLmGceZUGcSd7RShf6CkcSSXpM+CbHidOqU8He4PbQ8KvFEL76wHVlctonB/5m
	qejOsh/qZEzbMZpeORHJPiBibf8WHsYc=
X-Gm-Gg: AZuq6aKpwFoWSwPg9RBLciZ/WvZuOPBZK5jWUBwXfh2IM/5Q039cOtGiyufGNfLYmfS
	/AAGhPCUZKBPX6zYVPozwjKiICUsIRpBf2nAvX5DAhGgl0mvOkwUZ6kwMlxHeZh0sEbJ2P4Vc89
	5HXNIk+Zx1tWIyR7yr2RMKyhb0HDJr/qZv0+B6y/JtpoOBHYqMER1490NfoXn+/jqOqcYgQ3whP
	9rFJi5QwwB9jxCpy1J5jWZXUnJhZHcNdMZWH7NTkrGFT8Ywh0MVtIWc0Hnt9J9wyKB3PIwOVsXs
	xP496850JaUPeXY/KqDc8ugOHZPETA9n7u6CFu2IzbJ+8jDFX58O3Zo=
X-Received: by 2002:a05:620a:470d:b0:8ca:123e:8194 with SMTP id
 af79cd13be357-8caef409c65mr147454885a.33.1770342537850; Thu, 05 Feb 2026
 17:48:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206003451.1914130-1-joelagnelf@nvidia.com> <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
In-Reply-To: <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:48:46 +1000
X-Gm-Features: AZwV_QiCn6zHej5_Mme9jV7jp01t4GcOY8De2NKm9jmAO6FZQzlBgU_JLG2YX-I
Message-ID: <CAPM=9tw=jzQxGvVrsUSv14RxQtnaw2rH6K2b3Gxh_UUHnOGTkA@mail.gmail.com>
Subject: Re: [PATCH -next] gpu: Move DRM buddy allocator one level up
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

On Fri, 6 Feb 2026 at 11:06, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 7:34 PM, Joel Fernandes wrote:
> > Move the DRM buddy allocator one level up so that it can be used by GPU
> > drivers (example, nova-core) that have usecases other than DRM (such as
> > VFIO vGPU support). Modify the API, structures and Kconfigs to use
> > "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >
> > The commit cannot be split due to bisectability, however no functional
> > change is intended. Verified by running K-UNIT tests and build tested
> > various configurations.
> >
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> I forgot to add Dave Airlie's review tag here from his other email. When you
> apply, could you add it?
>
> Or, let me know if I should resend it. Thanks.
>

This one was a bit messy, so I've taken this into drm-misc-next now,
it doesn't quite end up in the same places as yours, but it looks the
same, and I updated MAINTAINERS at the end.

Now you can just care about the rust side of it.

Regards,
Dave.
