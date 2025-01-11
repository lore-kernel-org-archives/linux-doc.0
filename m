Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA91B4121;
	Sat, 11 Jan 2025 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736627507; cv=none; b=d8x3HwEoNpQYtKzJW7rfRuwi6Ed0uX9WuNC/dbI2OCVgsnZmoLUSPJ5y6bGLrDCgfmls6i+xyyxt3abQ2YImUPzt65t5fyllcUZOvzrykcjzCEK2cOGTmg9GRx8bnIKC5i/2wUH5/sm4akfL9ecL8gA7Ci9UAx9kFEwo8zt3y8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736627507; c=relaxed/simple;
	bh=65GfOQI69XV6dysEmkkwWYfOukD48SH1fFWO4BJkUPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Usoejx4VXkQs7FG1rYVFMAWhsFkFB/nV5ToNFsoS44ODqHkBBxgh5uMVRaLnw9snLYVtgEt/+vM9hvVcmFCuboOOm/urqajH3VBjOgDsanObTG8kZM3/WTsiwWQcXztHn41h19r5NqE7S8ubv5m6llnDZXUdi//5oTMoxv+5Cq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xhmb3uJm; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xhmb3uJm"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so5122074a12.1;
        Sat, 11 Jan 2025 12:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736627504; x=1737232304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MslvBwVp8G0PqfNk0PqWhn2Nba3mKE6gkZqPy7s3dYc=;
        b=Xhmb3uJmV38LE9TxlnP9/LDE/7/Uq7HmvzXk41ZJGBKtemBDBdnbKu2ZWOkSh1KCdj
         mYTb/lHz4jxKsMZ2O84RswWbcoigxRCixznLLHP2YN7IuFSLlYSvcNexX0cLUVU5GWds
         8YLV7173e7LWWlNDXfgQ3KbkRm2o9BLJSWWPnmBdsrzMoZWeMZquKb7i1yT2mEvocqZl
         GkMvDvl5FbzGK8tIAzZ5CTtzOfRWm0oTUPHW0N6A6e3NguAR/zTETGOZwZj72th8M43L
         g9n2fcQcw9uIIpbw1kmHFAcfB+GGJUxxqWmT2kn2Ts3VJEBM1FRY7zNBgGRvuKY1AR9R
         pE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736627504; x=1737232304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MslvBwVp8G0PqfNk0PqWhn2Nba3mKE6gkZqPy7s3dYc=;
        b=P53L8yDoENH0b/S3KaS8AMBRU5yBv588AYSka70t3hg9WA9m7/48QSdQ3OiZRMFX8S
         wtKjyj+JXEfGMyEDWrL3NfxAxSRiAi/rFgYW/kzpkXA46GdIR3EqtoZXoxwwi3z6GXaN
         TYXBedFchJPowdFp3J5jiGVou5CZdaCW1E8YK936SE2mFfiCHFqlkYb2KP+kv7iCwl/h
         DCDii3Y3kslAEyQRZVrKRARJs4P2QKUvi/jszvdr7N49p7nJnw8D2UgFomu+lCtq/UgJ
         UPlZa64V9zYR8NZSz+TxRcLm2d5XggTXvH0/cYVW80zFIWsl9bHoaqm1YdEGKWq+u9ft
         5P+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/8/Mk9GZxWmtMeMfqgav6HxOYNgcNRsgPXyhpFrwHve9KkXfM6VhrI5aL9v8oZ1/FnMW+10pI8V4=@vger.kernel.org, AJvYcCWBYyRqx8zRXba3H+8+pMf3n4x6MCqidpMYHXLJcueBloLcFuZdWntwxURCWPmqHQjpJ3COILiaUxmjhMrX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5B3vRiE7T3aZt3J9NfcEkzVjjAJHDIL3Bzq6WbjuxHSdsQIwP
	CiDY1/0kNbaggBvFLopx/I2MRqRk5rjil1U4KoCQWR/yrKZmKzKGbXKsVaTgh3ZT00xBdVq8JT8
	tdy7uCORpl4N6UoJVTqhjpdUL6rI=
X-Gm-Gg: ASbGncuu/FYhKnZKlfDyQ/e8oTSisN3+V8BmnHqc06k0mSxMgBIq1drI8hrABlEv73J
	zoEAco27456YETk0Hhavg5eGNnz8kEMlhQrJS
X-Google-Smtp-Source: AGHT+IHuXJeqlgCckMeQ+w12Yjk3JH+vgnCauIut0U6G3C0fvr0fdunF+UtgkkpqvxSBAKKB5ehiw3elG85BZ+zKhiU=
X-Received: by 2002:a05:6402:2790:b0:5d4:5e4:1555 with SMTP id
 4fb4d7f45d1cf-5d972e148dbmr14181767a12.19.1736627504093; Sat, 11 Jan 2025
 12:31:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft> <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
In-Reply-To: <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 11 Jan 2025 21:31:31 +0100
X-Gm-Features: AbW1kvZ_ZJ9-8LiNseFXH-qVMqlLy5y7326TflNCxRehrLh15qB8CHaQI67q6CU
Message-ID: <CAGudoHH6TKX8EnoK2aSSBc_4EKgOWV=bRAqreFWbEqBJL5RcKQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 9:14=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Sat, Jan 11, 2025 at 3:24=E2=80=AFAM Mateusz Guzik <mjguzik@gmail.com>=
 wrote:
> > The previous modification of this spot to raw_read_seqcount loses the
> > acquire fence, making the above comment not line up with the code.
>
> Is it? From reading the seqcount code
> (https://elixir.bootlin.com/linux/v6.13-rc3/source/include/linux/seqlock.=
h#L211):
>
> raw_read_seqcount()
>     seqprop_sequence()
>         __seqprop(s, sequence)
>             __seqprop_sequence()
>                 smp_load_acquire()
>
> smp_load_acquire() still provides the acquire fence. Am I missing somethi=
ng?
>

That's fine indeed.

In a different project there is an equivalent API which skips
barriers, too quick glance suggested this is what's going on here. My
bad, sorry for false alarm on this front. :)

--=20
Mateusz Guzik <mjguzik gmail.com>
