Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47A63176EF
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779139062; cv=pass; b=LeH3HsK8YY6NPjd7I2CpJFItmDwsk+qDYMbKc8mkqGMi3SqqKG4bFlJPERcfZ8TN69p6xlYIvfehUSTOjQrlPc78FNRNnShDP+eD3ZJcrhk3T4k+I6+k+SzbXp+84JzXff63GbKSuds7nNs1MgowGRT6zfgxjXhf74LPX3hlAGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779139062; c=relaxed/simple;
	bh=5vGdQyHp/I7JpGHhFk5fuQSzwyP9mbsuOCfc+s4mAv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2dMcMy7ioHDIsiIjUhN9UumqSTKuD5K68XG1Sjec2+k6YIF7oXOFvFHKSSqkVBtfztdIw9+lIKuU+Xi8SL0B6x2AQJi4mIwnYIuMcd2gzGVa+vTLzqdL3WqjiBGPBaghNFVsrq2RmpSyf551ecj6NX9Hn+eoKXN/jYasDl17r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k2JbJ7lZ; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2JbJ7lZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so115e9.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 14:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779139059; cv=none;
        d=google.com; s=arc-20240605;
        b=grV3KsRMpoVHxvPe1ddZ1t9T7HEdlc+doNLjEEskpaEuHJIs+TDV00B+iaX0FQEpUH
         RnZdrCOoDlzA5i47nxmgnk/BhpKqPUNrMprwWWb9wWnt6KtMXgsKUSWJkPLRlc2aDnEQ
         LzJDwHKvwJqDiOqSlp0n26SRJ9UYs2e5xuTfNn5zjRmwoSudIGIce1ma7j3V4hz+DH1K
         agWydFf9mxQftxJLd+MlYaxZ3Mitk4fBsv15G/SUI+eO0mAV43bU5EEkdnjkTK+J0iEn
         477S4ANixgcqViLmXf7FdphuWVxmbpu1MuYBLXvvmp1P6wVGvUb80T4D3/hW+/2H84MM
         IRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=log57cx8SdjIr5w2o2XwNSf2dPRv6imxY1LxmZJSaF0=;
        fh=+2Xey9UzSCpeHWFjhlxPboMueLIBOExOSjqIx0BpU90=;
        b=ic5F5xkHO6EVRX7xMaK2ECzNCd0QzjOTN99OX42dgZSk7pzNNDMuMahlKPYe0pAT+i
         3bwmkGGVP5XsSX4dfEVN2HZuqbVHM1CoTJ5GDj51RdMwOTCdRXV9WyNaJxyJMSWAXHE4
         2jWY+Adi3scSdXUZua4OPP6iwOyPNmsP+pb6Rc9qOvh3Xa5ScF/IXO4bppATvWQnSQIl
         TODsmJ49S5KZvMPXxB6+dWo8cDrbJmzKyvToegQ1WYNO7rrzALGD/rkyLVu5V+HEl2xk
         yRGxhtDExFI2/IYoiMYaLgTd7tB+jyn6pYpjFy+0sGLlF54gwCHcTy/cbO/U8Kb/3HAx
         Umrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779139059; x=1779743859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=log57cx8SdjIr5w2o2XwNSf2dPRv6imxY1LxmZJSaF0=;
        b=k2JbJ7lZHGQ+jVMY2vstQvctCN7mgH3ovFbAyWiKjT/QHJl6RDsYXnBym/Vq8MVsnY
         VdS7pP4zUllKvJwn/6HN1sA5gjNFA3BsRZXh57jsQdBChX1yAUh/oc1x53Cwgq9v8/dS
         WyhmC2QxDx8ACFPiiOClK5N3fcrigo7U9CKqyqYxYdS+shOhBSwHcT6DFOgDbTKD2k2x
         inl9u4+tOQdDcpTde2dJqu4PfdRd0R5RqKOYLvtRx5bwaRlAp4MdtwZd8ImvmRBazHhL
         xpOaq60msFXqZwUOCjd9kBfnF+a8yxCswBJAPbKXXVkWw8KllZ9n7gIdFdeXz72ypZkj
         7ipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779139059; x=1779743859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=log57cx8SdjIr5w2o2XwNSf2dPRv6imxY1LxmZJSaF0=;
        b=Iu5shPT9NnlH9kQOcaH3TQmi0dqsGrOj3lZ6SmwdW7SfXrgpk1MZXyGUOv8wT36Utx
         997+LQtJuyXymGuIEl38YrA0eQvX9CWvNLFtOe7itr8LjM6jQtENf/rbhfJ0JfUnoeGo
         A+3VwZxq8XuhyyFpXfWmMN0po8boXN9KUG5oT/rMvhnW1FV/EjB84GJDZV9z9P6mi6BQ
         ahbF0yLglikx1MsGauIQyD1NN8hp0D/3LxNvkHWvhWXVnmOjYxiAr0keDMfaRfjhFCND
         Zhlgm78j4a60WSR4rZ4oqZfLi/Y0UOKjvAY4pSjM7Zykoz5x8qob3oqpMRh3lvTRC+Xu
         2BVA==
X-Forwarded-Encrypted: i=1; AFNElJ9kJh9DXprDG/GrzAl5RA4rsL7Qq1d8WGbmC+o5fNy0tTO6ZBidzo0QOwhZ1DyQ5zaVY8PJsub/smA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQhU60UiOsHocYocEj7EhRW+QpI0yCkBuQhf1c/H5ibP80TzZM
	juhjof20AR64+W0q6mbRV0UvaIhDdZuHO8RgBCv2WxcRL6i1j822PPGVXiJx9K4Giq/kyR/+dec
	u1BL7hs3Yq+zQhP/OvLa+4ol9s3N6oRiuGx4rXjuH
X-Gm-Gg: Acq92OH+q8bcW5pAKTNfqlTjzDi8aYNjPQbtoLLQO9ClujAAraAfQSIm3WhGWoqWbqN
	wspNu0dO4O6WJSq6IIkuY23BisE3+d7BZq/M9hiCJOz/sOEXzW5gbYKSQhbknQip1QsZbdnUjIT
	gm9QsVtdsw+ZmIo27MoFj3rq9kk6YAo+LLneZtzmokbGLa0qnnq8BqeJlZ/7VzgSMB1Oz7b8Euk
	U+MIy1uNnpoH+jK7kgS8+7Zc+P5yw1dkMZZKF50YVcWJ3mFt44LSz/fLAPBZuj38pvLJfudUKBz
	43J5hAV/2owlUIXwV8bFZ4TlsOnT4HUOP9UPAotghR10v2quVxN0xrLEB7A=
X-Received: by 2002:a05:600c:5888:b0:45f:2940:d194 with SMTP id
 5b1f17b1804b1-48ffa5a3865mr1584195e9.2.1779139058579; Mon, 18 May 2026
 14:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <8ef38815-6ae9-4359-86d4-042554357639@amd.com> <CABdmKX2uwZ12kYJYPJGfWxuMBOJS=64b1GRj72tfB5D=NKM22w@mail.gmail.com>
 <CAGsJ_4zjrFJYQQsLThTGXR6g+2PXzeAhjyDpLHfDFqVViWvyBQ@mail.gmail.com> <CABdmKX0gqg309hcXcOHSj_yTg0h1zwDL34GDk8mX3wp4YoyfDg@mail.gmail.com>
In-Reply-To: <CABdmKX0gqg309hcXcOHSj_yTg0h1zwDL34GDk8mX3wp4YoyfDg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 18 May 2026 14:17:26 -0700
X-Gm-Features: AVHnY4KTHXYs5nrbWVXYvXQ9l6M2g--DIK3-AK3RR8R_cqbjNyBgiR1O8BbuYxI
Message-ID: <CABdmKX3wwgovwS-V8rVC3=+EZcTvPs_cttpQb1w6WemwLAVhsw@mail.gmail.com>
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

On Mon, May 18, 2026 at 2:12=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Sat, May 16, 2026 at 1:40=E2=80=AFAM Barry Song <baohua@kernel.org> wr=
ote:
> >
> > On Wed, May 13, 2026 at 2:54=E2=80=AFAM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > On Tue, May 12, 2026 at 3:14=E2=80=AFAM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > > >
> > > > On 5/12/26 11:10, Albert Esteve wrote:
> > > > > On embedded platforms a central process often allocates dma-buf
> > > > > memory on behalf of client applications. Without a way to
> > > > > attribute the charge to the requesting client's cgroup, the
> > > > > cost lands on the allocator, making per-cgroup memory limits
> > > > > ineffective for the actual consumers.
> > > > >
> > > > > Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> > > > > a valid pidfd, DMA_HEAP_IOCTL_ALLOC resolves the target task's
> > > > > memcg and charges the buffer there via mem_cgroup_charge_dmabuf()
> > > > > inside dma_heap_buffer_alloc(). Without charge_pid_fd, and with
> > > > > the mem_accounting module parameter enabled, the buffer is charge=
d
> > > > > to the allocator's own cgroup.
> > > > >
> > > > > Additionally, commit 3c227be90659 ("dma-buf: system_heap: account=
 for
> > > > > system heap allocation in memcg") adds __GFP_ACCOUNT to system-he=
ap
> > > > > page allocations. Keeping __GFP_ACCOUNT would charge the same pag=
es
> > > > > twice (once to kmem, once to MEMCG_DMABUF), thus remove it and ro=
ute
> > > > > all accounting through a single MEMCG_DMABUF path.
> > > > >
> > > > > Usage examples:
> > > > >
> > > > >   1. Central allocator charging to a client at allocation time.
> > > > >      The allocator knows the client's PID (e.g., from binder's
> > > > >      sender_pid) and uses pidfd to attribute the charge:
> > > > >
> > > > >        pid_t client_pid =3D txn->sender_pid;
> > > > >        int pidfd =3D pidfd_open(client_pid, 0);
> > > > >
> > > > >        struct dma_heap_allocation_data alloc =3D {
> > > > >            .len             =3D buffer_size,
> > > > >            .fd_flags        =3D O_RDWR | O_CLOEXEC,
> > > > >            .charge_pid_fd   =3D pidfd,
> > > > >        };
> > > > >        ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &alloc);
> > > > >        close(pidfd);
> > > > >        /* alloc.fd is now charged to client's cgroup */
> > > > >
> > > > >   2. Default allocation (no pidfd, mem_accounting=3D1).
> > > > >      When charge_pid_fd is not set and the mem_accounting module
> > > > >      parameter is enabled, the buffer is charged to the allocator=
's
> > > > >      own cgroup:
> > > > >
> > > > >        struct dma_heap_allocation_data alloc =3D {
> > > > >            .len      =3D buffer_size,
> > > > >            .fd_flags =3D O_RDWR | O_CLOEXEC,
> > > > >        };
> > > > >        ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &alloc);
> > > > >        /* charged to current process's cgroup */
> > > > >
> > > > > Current limitations:
> > > > >
> > > > >  - Single-owner model: a dma-buf carries one memcg charge regardl=
ess of
> > > > >    how many processes share it. Means only the first owner (and e=
xporter)
> > > > >    of the shared buffer bears the charge.
> > > > >  - Only memcg accounting supported. While this makes sense for sy=
stem
> > > > >    heap buffers, other heaps (e.g., CMA heaps) will require selec=
tively
> > > > >    charging also for the dmem controller.
> > > >
> > > > Well that doesn't looks soo bad, it at least seems to tackle the pr=
oblem at hand for Android and some of other embedded use cases.
> > >
> > > Yeah I think this might work. I know of 3 cases, and it trivially
> > > solves the first two. The third requires some work on our end to
> > > extend our userspace interfaces to include the pidfd but it seems
> > > doable. I'm checking with our graphics folks.
> > >
> > > 1) Direct allocation from user (e.g. app -> allocation ioctl on
> > > /dev/dma_heap/foo)
> > > No changes required to userspace. mem_accounting=3D1 charges the app.
> > >
> > > 2) Single hop remote allocation (e.g. app -> AHardwareBuffer_allocate
> > > -> gralloc)
> > > gralloc has the caller's pid as described in the commit message. Open
> > > a pidfd and pass it in the dma_heap_allocation_data.
> > >
> > > 3) Double hop remote allocation (e.g. app -> dequeueBuffer ->
> > > SurfaceFlinger -> gralloc)
> > > In this case gralloc knows SurfaceFlinger's pid, but not the app's. S=
o
> > > we need to add the app's pidfd to the SurfaceFlinger -> gralloc
> > > interface, or transfer the memcg charge from SurfaceFlinger to the ap=
p
> > > after the allocation.
> > > It'd be nice to avoid the charge transfer option entirely, but if we
> > > need it that doesn't seem so bad in this case because it's a bulk
> > > charge for the entire dmabuf rather than per-page. So the exporter
> > > doesn't need to get involved (we wouldn't need a new dma_buf_op) and
> > > we wouldn't have to worry about looping and locking for each page.
> > >
> >
> > Hi T.J.,
> >
> > Your description of the three different cases sounds very interesting.
> > It helps me understand how difficult it can be to correctly charge
> > dma-buf in the current user scenarios.
> >
> > I=E2=80=99m wondering where I can find Android userspace code that tran=
sfers
> > the PID of RPC callers. Do we have any existing sample code in Android
> > for this?
>
> Hi Barry,
>
> In Java android.os.Binder.getCallingPid() will provide it. Here

... let me try again

Here are some examples from the framework code:

https://cs.android.com/search?q=3DgetCallingPid%20f:ActivityManager&sq=3D&s=
s=3Dandroid%2Fplatform%2Fsuperproject

In native code we have AIBinder_getCallingPid and
android::IPCThreadState::self()->getCallingPid() (or
android::hardware::IPCThreadState::self()->getCallingPid() for HIDL)

https://cs.android.com/search?q=3DgetCallingPid%20l:cpp%20-f:prebuilt&ss=3D=
android%2Fplatform%2Fsuperproject
