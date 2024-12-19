Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7BA218AC8
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 16:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624547; cv=none; b=szPnuUIuys96ih2waqyaOv1n9NxdBCms8YYSLbjdPWlXi2UmZA9OXRxJ9MaWInfpJ45/eYnOAaJ6srwQcCrXhhgi1p8q99RHkFO72LKpQzDfotY6ywzV2Y2wFlIOvw/z1NJjG5xcLqLEjt2uCEQ9pwSWTOUnv1czMd//b4Co/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624547; c=relaxed/simple;
	bh=tuMcpsUZREIUVyzz4ojsblqNAQ+lBbLQTV/hl6W/BOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPljz7xI2kS/XCw0ZADCDUISA77zPhSHx8fRG06NqZzobJACnMUrZ9wgU0vt26AqkurCs+aM3T6OAzISi4XuVZnIzxE4iNTbNZYYb7HwQjgUYmOrrIjf3FbefuuC1j9fEo/5I6vIhu3gTgC2I/TiMk3waj/flYuMB9U6yXRmoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tqMMXNOv; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tqMMXNOv"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678c9310afso268281cf.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 08:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734624545; x=1735229345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCgxhmLOQYthLyXRUTTalRd8vqUeNlTesIKzqn1x7Hg=;
        b=tqMMXNOvDTDqi+CmGrUBIooGMXeNsD1RQ3SRTkqd0XOhlxFfFNhe+CWDaFYBPQooFO
         v3VQsjgQxqJJcJceBBrixqhNzjFJtR10TTtVm6Qu10TJfVJfx3Brmen+f5ew9bsTDsEv
         s2vL8eOAiSnzcxROE00azdM9aeAZcrwoVkkgXeMlJW8ESOYZ9eO3EdiVwi7aeoFbTWqU
         1hSLISKrRuDsi7+Nd6maUtUE93jsYFIYC6EUfCLYq3Vx3aSGU2RlhGth1wCRrJFjIjM8
         P7YTjvmLm5dr50lqhQny4cz5PClgvLQFFPIT01FOCpYP7qzk0h/4MOGtScrmbR50IXUt
         i0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624545; x=1735229345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCgxhmLOQYthLyXRUTTalRd8vqUeNlTesIKzqn1x7Hg=;
        b=bJFPpVBlyAEcLLdkccYjJWv528N/yDzneZX0tt6vUobz60dD8569UuDOR5B00VgssP
         7lK85/hWrd6U+iBT4iBJcQgPIzZmwneBC6187uRbXMStR3frjAnMUaXVokV0DtvYSGSZ
         kSXRXU+zynHOy+QneDUe/wdXAW0J+GdicDGLhuOG6E3zzN1MAzkNiXLe0Wcdp2TU50vd
         JHo3P+v3ykhZp1cO7FUD/efDAyB8DXeCtr2dakalKvSrVH52BQcwRQrBz2saaRkALTil
         r629ApvOU9V61G60/a+MOzzdF+8ihK04yUz6Fs+FKp6bAoruHU/ql02ks6qLaAf117xM
         rPwA==
X-Forwarded-Encrypted: i=1; AJvYcCUejGrEYb5IqPm3PfWLvEK9We05LMD8BnH1fN5C1lEJdWaCUP/igZytNBMyjBYZKldKw923P8Mp8oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYf1xYCYVvUjUaMEqhs0+kuA1Z/jW0bKx1Vp6UxP5F+/uPBPWG
	Y5jbVhmiMUDoCSyC18Hcd+6R8LEWzhOP2BHQo7zGfY7V0NnkTTXNCP7AFU3cSLp358IT0W4NZ/z
	U5ajtqY5eKK9sxE+xHxlPzYuKcTPj3gmH2Bo+
X-Gm-Gg: ASbGncvigXwLyUq16wa/OQqrxMwM+VA0aYm8jI/AtmojwLcs9weNjn548cZPIXjyTcy
	7WaalsGhpTKauNvPLq/KaMd0MmlZwgAhUORm4jg==
X-Google-Smtp-Source: AGHT+IGaYUwlx8T+p0Hq2btHdVXy1lv5ojWPf+BuJ26e1EpPkyfSUV7doB72/gxv+xg35rUWrgceMD59LoyZkCBd8oc=
X-Received: by 2002:ac8:7f45:0:b0:466:923f:a749 with SMTP id
 d75a77b69052e-46a3d93ed81mr3392441cf.15.1734624544472; Thu, 19 Dec 2024
 08:09:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net> <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net> <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com> <20241219085515.GB26551@noisy.programming.kicks-ass.net>
In-Reply-To: <20241219085515.GB26551@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Dec 2024 08:08:52 -0800
Message-ID: <CAJuCfpFeUU0hDdfyn+qUKGnnciRH2dAAVWL5A5FdWHa0UW_RaQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 12:55=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Wed, Dec 18, 2024 at 11:29:23AM -0800, Suren Baghdasaryan wrote:
>
> > Yeah, I think we can simply do this:
> >
> > vms_complete_munmap_vmas
> >            vms_clear_ptes
> >            remove_vma
> >                vma_mark_detached
> >            mmap_write_downgrade
> >
> > If my assumption is incorrect, assertion inside vma_mark_detached()
> > should trigger. I tried a quick test and so far nothing exploded.
>
> I think that would be unfortunate and could cause regressions. I think
> we want to keep vms_clear_ptes() under the read-lock.

Ok, I'll stop considering this option.
