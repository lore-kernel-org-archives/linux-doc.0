Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515882AE6A
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 03:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736910754; cv=none; b=llzyd9z/6HT/uu6maywRDpB49qvcAPKkcewal84y8dhFgHLVCjtGt5MnqueLt4guxj4E+ad9W1CqPgQrBQVLV2+k9/+Qk3CD2iiNGU64CfcFRw+y3YRYja0yaKFIaTZq+FExFABJwQnfoFwXNDAWM/ORBEJScyKUafisIdEfB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736910754; c=relaxed/simple;
	bh=IVHEnBkEPaTio+Iy3q/pWlWL2onucL4O+0UzHe9ra9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpRXcOqc5zVZoJKWps8Pu6G068X5aGlO8TgES5cXQ9GYyPdvRHoyEizW5XQuPBc8/4ylIceVn5Rgm/GvAVY6M4b2hBymTTPjfFPwnbSHbP2fOl+oFgRdpCaKLMBPWJBUvOnrdAFMd/VXhue3CtQTrCdQE6UGJXwkC7plKMtIrmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2DOf/KvH; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2DOf/KvH"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4679b5c66d0so394811cf.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 19:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736910752; x=1737515552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WLrWAK3A+hX7MbqxT/znt3dud8cCYJ+whdShWH78bg=;
        b=2DOf/KvHqJJkm72h9gUUgoogw0B/HsvLesKvoICF394k+MIGjPsLYRxY+MAOeb7avv
         GTGZ8vJcFjBDF28uEphA77pFAdqfdbLh/ghueQCwQ9HgAkGQYpZhVzhUBG7GxMcfPvD5
         1YJHcK7uRi1hD2ly3+H64IFJ9u8lNXRUw58Wlunq7WeferMsHSij2c8JyJXM1kTFGu4y
         kJAWFU+KQ/jKnUUP6AlgzYhZXC2WfacZC1ZtIThCVvxXspySFDemHNi3OUGrPOPlA566
         6AC3hc7RsaV5JQ4kW+WhYzvO5R5mkLysP7ehTou4sysxFjy/Gm6E81wPg3NELxgIjwAK
         PFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736910752; x=1737515552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WLrWAK3A+hX7MbqxT/znt3dud8cCYJ+whdShWH78bg=;
        b=Zfg5N24as2rNJJauXMH3CKOIpIVJMX42NjPgYRnF/e7GUekcJvaaDxVib5GI2xHRMa
         Np5f2pN/US3HE0MnS722acKVpgNQd9ZM2WKezY9VBa2EQv/1n+9r8UbXewlF4jXJEK9B
         x+ZnrqvPB8tQ44DuWfmBFjvVzNUDPFvXrIJxmZy5vV4BZB34EiW/rtWXoC76CMPY80jo
         rscBUyN6TcQ54AS+Sr5uj4cnE+3IWK/R5OW/SQy77/ekWtiZpZWoKMJSqZQLANUltuFe
         airjC4PguhrYS3RRsnJXhyLz5ayrSgV3+IPa/sQTLShYLbibHk3Tx+3RIPuK4hVRincT
         GqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUELVMVaAL+IvZftKi17mBI1G8jY9Zjij8ttA1ffKUcTxhPiCDMLEvmPkvqxJJaeZYetXT4xohr5Uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP4b0zpXq19LFWYcbBUfbMgZT/AqGqegj+l3oBRy7H9ytKpZ3x
	bFRm5HqyqfIwDx83m+O2DnnJhj1fontxAZ6CftmcMJXG4aVKtLEvv/H+URRsyHoxt5OYj15VJvE
	f+UwBb1Juu3uE6j7lpPRIruN0trDKx2okGpKY
X-Gm-Gg: ASbGncvbsN8qo1tBnY3w6T7AMXq+J3OUNe0QyGt3qa5CoYXSPOdIvE4ijiAJNC07ddS
	pwEvnRf9PlrlceqjIRIh6ZFRU1UZHoOkK33Yg/A==
X-Google-Smtp-Source: AGHT+IH5FFGAiPnYc3QmEM1mJrbs85UnXl2WCXEjbVPLmdRANY94kWDirMcRZM7DOuXSdvRmLcFHqaEOOnw8BOLR+jY=
X-Received: by 2002:a05:622a:388:b0:466:975f:b219 with SMTP id
 d75a77b69052e-46df567eff3mr2280101cf.8.1736910751881; Tue, 14 Jan 2025
 19:12:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <20250115025830.pebmoyerkruqtx5y@master>
In-Reply-To: <20250115025830.pebmoyerkruqtx5y@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 14 Jan 2025 19:12:20 -0800
X-Gm-Features: AbW1kvbSjZeuNjMrfWdaHrRtVrYiQKhiGbkf0X276wxeUwBBTQRL-k7w94xE9nQ
Message-ID: <CAJuCfpEvbCJeQDnMqJK7F9dCLX+4_kx3THuRq5yuf5U9oYoEKQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
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

On Tue, Jan 14, 2025 at 6:58=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> >@@ -6354,7 +6422,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct m=
m_struct *mm,
> >       struct vm_area_struct *vma;
> >
> >       rcu_read_lock();
> >-retry:
> >       vma =3D mas_walk(&mas);
> >       if (!vma)
> >               goto inval;
> >@@ -6362,13 +6429,6 @@ struct vm_area_struct *lock_vma_under_rcu(struct =
mm_struct *mm,
> >       if (!vma_start_read(vma))
> >               goto inval;
> >
> >-      /* Check if the VMA got isolated after we found it */
> >-      if (is_vma_detached(vma)) {
> >-              vma_end_read(vma);
> >-              count_vm_vma_lock_event(VMA_LOCK_MISS);
> >-              /* The area was replaced with another one */
> >-              goto retry;
> >-      }
>
> We have a little behavior change here.
>
> Originally, if we found an detached vma, we may retry. But now, we would =
go to
> the slow path directly.

Hmm. Good point. I think the easiest way to keep the same
functionality is to make vma_start_read() return vm_area_struct* on
success, NULL on locking failure and EAGAIN if vma was detached
(vm_refcnt=3D=3D0). Then the same retry with VMA_LOCK_MISS can be done in
the case of EAGAIN.

>
> Maybe we can compare the event VMA_LOCK_MISS and VMA_LOCK_ABORT
> to see the percentage of this case. If it shows this is a too rare
> case to impact performance, we can ignore it.
>
> Also the event VMA_LOCK_MISS recording is removed, but the definition is
> there. We may record it in the vma_start_read() when oldcnt is 0.
>
> BTW, the name of VMA_LOCK_SUCCESS confuse me a little. I thought it indic=
ates
> lock_vma_under_rcu() successfully get a valid vma. But seems not. Sounds =
we
> don't have an overall success/failure statistic in vmstat.

Are you referring to the fact that we do not increment
VMA_LOCK_SUCCESS if we successfully locked a vma but have to retry the
page fault (in which we increment VMA_LOCK_RETRY instead)?

>
> >       /*
> >        * At this point, we have a stable reference to a VMA: The VMA is
> >        * locked and we know it hasn't already been isolated.
>
> --
> Wei Yang
> Help you, Help me
