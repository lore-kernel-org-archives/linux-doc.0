Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A834E33859A
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 23:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147564; cv=pass; b=oD4HSB+PAIHL4NqkYuj6oXFSw80IvKiE0QK1V+B/wZjp+RU0MvhRPGsTm474sanMxPSGTv60c6XV9W/9KVYsshusBJtbOiMthSmwHtwnjRsZN/KcEI/z3DKvFCnw+1UpDtk/B++Lm3MCLViKhvxbFrQNVA+7sLhAabYo0Bjq+Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147564; c=relaxed/simple;
	bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpmVM6Rj7IiYGkDm+Z2KM8rZjsSz04yiJ+/0GVv+1SO3DG/VA7rYedQcQfalX1ILLmOKEa5/EB0GnzGXM4pjnTvRNnjGdfVcwkJRskywYPti45elgcdToEBYGxCvuqVYU51PeNdJyxB66bRWefpW3XoG4yGLAinhCZSMj5lPq7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aX+kKzUs; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aX+kKzUs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so635e9.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 16:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779147561; cv=none;
        d=google.com; s=arc-20240605;
        b=RX36PBiomXwQ3kFWisptln4irPYGmuH4oe9U0f0hTPH8VgvmwG+gIUUi8M0bwcqvfw
         q0+7pS68OngujMnk0QSmsrytj6qrNbz1l9U61FLeCctKawxM4Ux/NRqn0iGvdq6eaJbr
         USzcqR1W0BBt52aYvmfHDMjFR3tVOvGQxjeL0PJ5im1xxqXPXSP/rfLW/kh3+FZSQk3M
         hfSBiUl5BlDrSsJvlu8tpPXocniczs6cI9gA59OX3kh5mZG0EvA7ZaqHDoOVDkVeXY/p
         CJab8qrtqnrpzLLAVeIxyvABoTwsEDRjrP8nBPCgnToQT/PtuQxsDFAZyDDZfs9soGaZ
         e+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
        fh=pTiRz3qvRQBpc99NDGZ22iO4s/gndTn56iWs8SXfHKQ=;
        b=BOhmKZkrSJxpiM1amJLEg10XuM7SDVFj2mz7GNAaPtHufQ7B3Vg21X36x+eI0+xvBr
         qKtcKz6p6QdLCQF4WJPcUAfKX6PwMhreXgAlR1KKGjwVKw1Bu4cefVRlBHhD+CNTPunU
         k7VKMB4sjX0cIY5JiFgMaXy57Ksp+i/NxP7tT3K1x5C1WLEQe4OrGvkxi0EQw/Z+WffK
         01W4V4dS4/cB4H+TNVKE2DKyqEskL31voX3BOzUZ2nfmnAuqF1mLz8WNaH68+9fNNGz4
         A+6C/pRTrSK5JWIOkk/uSvEu9HKux5CUZOgC9cmsLWUHsSgpKnsyczsJzWiD5aPFjOse
         bUvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779147561; x=1779752361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
        b=aX+kKzUsboVSf1MSKClDtOA3TnfKk+2f/C6h/5nyVGbD9QLjyaIW08h8weErzxQ8CV
         K05jrB3VojE83yb+c2TIiJHZ53CzjtK3vhBDEYgkBJbzrecfWi1eqaiES6OCvMAdd70f
         6VUC1A6T4JCWF/UBzVx7hx02iiKtejtlhO9uaTDWQJMQaUDhf+7nzaNcVT+3s0e2QUgS
         GSnujKQ3COePTRHcxTBo16Pc/2bGiAVoDMzg7hza8br6DAfoYb+m6y62mfnRfGopFZgu
         1hCCXb9CCP+V63QbmI6ny3ZzWqx7jKpPC9Uc/dskvKKvJmtPSyszZdVulhdG92zpq2eO
         11Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147561; x=1779752361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RlgWSbw/qDy0FEEgyFzO7eBFoHyyLd7vQDOSYcU9a5s=;
        b=BLVBsa6kn73fijYz878NShA8n6us4BrafEDzfUCe9Z21/h8jbGd259xgun9Q5D8M/X
         v72GjI48QOQF+/tkpl4B1KovlfKHLFbYeFyR20WnSlL8rz+Vm352vlqgGeL9b2+huWd5
         aqSpMPbqaljC8GO+kX+myvJAR9Boj216GXCZ2ZBc39+JO7dxYKxVwSltDpevKUinyWBn
         Sd2Il20NRuiRHCYvA1t+daWqWR6qIS+ZB/RK7hQVraPIB20bBlIReQkib0P08QfoJ3+y
         wf9mPbR6q8fP/evVhy7I6UxX2BUS6bF26IsGsZ/vdZf2IbmdfY+1tjQocoXqvd7nMqTf
         I9vQ==
X-Forwarded-Encrypted: i=1; AFNElJ8K6rBx4Pf/bzJl2wdUKI0kewGcM0nsf1rJpiI3ZIioXChvLtFtIVwMB8Pa5Ju//xvzPlK9Ab4injg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/JcRdnNDZnqvRnlDWAtEpcVfq80yi4PDmoF7ffvO9KhL5zOjo
	wY30O1Fv4E7S0Xje8yR/50v9dTKP21L47KVWKqrY5u7aq7eNRIZxEZqucOpnPytPtc3qB8UG1Wi
	apG/+DmueIPjMEiB3Ozp/9H6Ea9iFZju4lVS4dJdc
X-Gm-Gg: Acq92OFy88mZcFa+nt00jl9qmMFvuCC39PqfATh2tU28q9J6kJqmE/fvQc1y0gYTfPK
	tKbiTDq23ihaGzKCAN19T9A9+URNAUmLzOm0gfMMZgBmOPmx0hseaVtiYmoq65/l9RQ2ngQ0fjJ
	4SHwGPeXQcli+qsYWOgUZrkMGkRH7tOvZ5YQHct/s2RIvQewZHw/IyL4hFPLO6N4BpDYIEsWsBZ
	k07E1Vao3dKS+CvppoaPiGX/asnfu2DnuHSqyFaYRynY3Wx9LAx83PoF+aVtL3TG4B+X+VyvzrT
	tNpiQGe2lfGcCriowvlGpfjTz9xlNPUjkCxRfNz4Kmgmz7H6
X-Received: by 2002:a05:600c:534b:b0:48f:d634:b18d with SMTP id
 5b1f17b1804b1-48ffa5e1260mr1775015e9.8.1779147560622; Mon, 18 May 2026
 16:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <8ef38815-6ae9-4359-86d4-042554357639@amd.com> <CABdmKX2uwZ12kYJYPJGfWxuMBOJS=64b1GRj72tfB5D=NKM22w@mail.gmail.com>
 <CAGsJ_4zjrFJYQQsLThTGXR6g+2PXzeAhjyDpLHfDFqVViWvyBQ@mail.gmail.com>
 <CABdmKX0gqg309hcXcOHSj_yTg0h1zwDL34GDk8mX3wp4YoyfDg@mail.gmail.com>
 <CABdmKX3wwgovwS-V8rVC3=+EZcTvPs_cttpQb1w6WemwLAVhsw@mail.gmail.com> <CAGsJ_4y=Gsv=FSUjJ5+99Gg6ULUnv0LRexCGOGetzChR3YA44Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4y=Gsv=FSUjJ5+99Gg6ULUnv0LRexCGOGetzChR3YA44Q@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 18 May 2026 16:39:07 -0700
X-Gm-Features: AVHnY4LTFYlENC6xQVXK8AijxUAKUMiH_YZR8cEYxhyMaKCwg0sVArYGdEg8UAo
Message-ID: <CABdmKX3GgCogr9pQFybnV1p_zuo1V9fqJLCXvk-HAnk1gwLoDw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: Barry Song <baohua@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Albert Esteve <aesteve@redhat.com>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@kernel.org, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 3:19=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Tue, May 19, 2026 at 5:17=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > > > > Yeah I think this might work. I know of 3 cases, and it trivially
> > > > > solves the first two. The third requires some work on our end to
> > > > > extend our userspace interfaces to include the pidfd but it seems
> > > > > doable. I'm checking with our graphics folks.
> > > > >
> > > > > 1) Direct allocation from user (e.g. app -> allocation ioctl on
> > > > > /dev/dma_heap/foo)
> > > > > No changes required to userspace. mem_accounting=3D1 charges the =
app.
> > > > >
> > > > > 2) Single hop remote allocation (e.g. app -> AHardwareBuffer_allo=
cate
> > > > > -> gralloc)
> > > > > gralloc has the caller's pid as described in the commit message. =
Open
> > > > > a pidfd and pass it in the dma_heap_allocation_data.
> > > > >
> > > > > 3) Double hop remote allocation (e.g. app -> dequeueBuffer ->
> > > > > SurfaceFlinger -> gralloc)
> > > > > In this case gralloc knows SurfaceFlinger's pid, but not the app'=
s. So
> > > > > we need to add the app's pidfd to the SurfaceFlinger -> gralloc
> > > > > interface, or transfer the memcg charge from SurfaceFlinger to th=
e app
> > > > > after the allocation.
> > > > > It'd be nice to avoid the charge transfer option entirely, but if=
 we
> > > > > need it that doesn't seem so bad in this case because it's a bulk
> > > > > charge for the entire dmabuf rather than per-page. So the exporte=
r
> > > > > doesn't need to get involved (we wouldn't need a new dma_buf_op) =
and
> > > > > we wouldn't have to worry about looping and locking for each page=
.
> > > > >
> > > >
> > > > Hi T.J.,
> > > >
> > > > Your description of the three different cases sounds very interesti=
ng.
> > > > It helps me understand how difficult it can be to correctly charge
> > > > dma-buf in the current user scenarios.
> > > >
> > > > I=E2=80=99m wondering where I can find Android userspace code that =
transfers
> > > > the PID of RPC callers. Do we have any existing sample code in Andr=
oid
> > > > for this?
> > >
> > > Hi Barry,
> > >
> > > In Java android.os.Binder.getCallingPid() will provide it. Here
> >
> > ... let me try again
> >
> > Here are some examples from the framework code:
> >
> > https://cs.android.com/search?q=3DgetCallingPid%20f:ActivityManager&sq=
=3D&ss=3Dandroid%2Fplatform%2Fsuperproject
> >
> > In native code we have AIBinder_getCallingPid and
> > android::IPCThreadState::self()->getCallingPid() (or
> > android::hardware::IPCThreadState::self()->getCallingPid() for HIDL)
> >
> > https://cs.android.com/search?q=3DgetCallingPid%20l:cpp%20-f:prebuilt&s=
s=3Dandroid%2Fplatform%2Fsuperproject
>
> Thanks very much, T.J. That is very helpful. I guess
> that would require user space to understand the RPC
> procedure, including single-hop and two-hop cases, and
> make the corresponding changes.

Yes, this is solvable by having a policy in allocator services where
the caller is implicitly charged, while also supporting cases where
the RPC includes additional explicit information about who to charge.
This needs security checks to prevent arbitrary remote charges at both
the ioctl() level (selinux charge_to from patch 4), and at the RPC
level (not sure yet but maybe a private interface between system
components and gralloc), so that only privileged components can
initiate remote charges.

> You pointed out the SurfaceFlinger cases, which are
> two hops. It seems that AI models are also using
> dma_heap, at least from what I have observed on MTK
> and Qualcomm phones. Likely, we need to understand
> those RPC relationships in userspace and make the
> corresponding changes.
> I assume AI models are a single-hop case?

It's currently a mix because AI model loading is largely controlled by
vendor code right now. Some implementations use
AHardwareBuffer_allocate, but that comes with unnecessary RPC overhead
for the AI use case. So I think we should be trending towards direct
allocations from dma-buf heaps because model loading time is
important.
