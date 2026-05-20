Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6FE31E83B
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292050; cv=pass; b=QRXTDRxIptUYdhZ796WuTEfHpWV6y++sJAJwBiBcDhCH2XxPCO5sfEnjnZn6fKlZwofnkksksLFna1dEZKvQSnZ+++K/uqHxPX2Ie/JltYWLsUW3Wz3kcL3ZnaiX4mVk8iVhRzy3FpVvoqXq8Y2510eyVLM9+CSBGZYeSREI5nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292050; c=relaxed/simple;
	bh=AWGO8vhu+Zh92NgAY6Z9P494WPO1xIp3IJxl+CkGVDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvTvN4a4Ec0eAoKB57h+6pGWudw3WTITwUeYHBjjh0u5tg1LJ/WULAjNNg/HAGPmMTj73DuTcjdfvOAROf+G9bkQ1RqiMRycRM8PBJ4OT4MgrwVdX8sdfgAxnykdPgcAvQcs4uhaxK39uGBTxnvvxXNzZEEM2b+ccYBf1Bcfz7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b=gqpKgBW+; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b="gqpKgBW+"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-90ca6f20872so730391485a.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 08:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779292046; cv=none;
        d=google.com; s=arc-20240605;
        b=aSmGduuYVg8IiTx5nqw53UHNSwVvzKuShdwvbKa5Bgudzp9DdvElO14XMeQX1YZsYD
         9oFWWgrOvj4ufFWlHqXdduFrRty47gfBsFIAA3tibWdhlevr+Gej+1VlPpjkGw0FzaR9
         BlC7Q5Trd2xUPCrp5xSXpBgU5UjXznAbamCJB/cZkXAMoSw6VsNOf12SHCVSl9vsiqHo
         yRAE1EpJGcjzxuZrTDFIpmSYa8pNFoNiE5Pj/nhkPkw5ncPhz42XDZbn5xGiD/dKibfK
         1YUo9cxlweuAP4MsexbpQ8gTdS/oYD1tIsvXCQcFKYZzb6QCJ6oDJVMOMPIoYOYPHuHz
         JMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5uPOQqH/io7bW7wdgpurqth07a6Aq9sxwItrhNv9yI=;
        fh=5K1j7PFCfWAmqZQSnzQLp5rXs0imeZGCX2TfthYzrY0=;
        b=NRkwYKs1H1Cp8CtzQ4J1oHZ0GD/XXEXHYrKPLKr3SzCf6hrMWif009+p2xrpkw2gRZ
         JOnq2P36MOs+vP3SodD1dBU6x5ZTG6dvheDb6HTiXv1wM6AcwaBNDf0BMwiy8Igtr4OU
         O3kQmEBNdbO8LMQvMX2XwtYwvmV1eU6DQxayC/kyrNs7RLdnqFpF6ecW3TBfCvEUXBYM
         YjOslIvN0jUyCx71ygSBzebhULzxknRQTLi1x+5aGFCSFUdXtG9/N6+YBHMA3Xq9cmbS
         OIfhUMsYWKX0wpqVGXgbWZhhr7vvcaJEp+ILOofSueJrmqMT9VD1n9D8GCFnQ9/W9fUP
         EHsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1779292046; x=1779896846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5uPOQqH/io7bW7wdgpurqth07a6Aq9sxwItrhNv9yI=;
        b=gqpKgBW+I0jN7mJrVwuYxEQK5+v8ZKgcfb/N8fKIp/DRkwO3EvYPS2Bxu7Ku5uw6Tk
         Qi5/w5VuAMFqy/BPb+nmYhAW/2Eb9V3vxfhd5hpUbnCpFi5rtnE8svDuYScomFj0hW6y
         BLh9xvzOi1j1W6o9LYHeW8vOyx1T3UdhFGWQfGj6AYwrXa+VzZgUyEa5GYtjPv3BHG9v
         hrHuAKpUx3Kl+n2Oz7fyPmC8Nm2g8FwEQKpLcTAZSdiTCDLcOWECfQ5Z5LZh3Al5CnR4
         244jcVQVaZkMsDHQQrcTzgVrf6UfMuELa0bBLfJ81miA405vsc48ZuFs3gN5HWikIZX3
         fkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292046; x=1779896846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I5uPOQqH/io7bW7wdgpurqth07a6Aq9sxwItrhNv9yI=;
        b=bngyMvmd9gKPfwNYVIGY4H2FjuoaikI0SxKW+dBafBzmLcx1ll6kJv6uTzzK7xpaem
         lHlTYOZwA3qAVKR4r6EdD8HOvRrFkbzsOhCuOAlGz/w4WpEABxSisV1ehixu3V3FqDiI
         EkYmiWDkH9DWQoVeBFYQ+2fMxT5fT0Pu09l1cy2ceoxrcc96zanAL7HVxdZXmyqwrutA
         4VgCad1jnxcQeDk78/i0PqrLwfPh1MSjYuIEmSfYsPLTywTk6D+kgj+gZZofS/NYP6Lm
         NAzmriiBdCbcVuOA5dGRCD1AVlK3ogv342RFNXFMzvsAHAp1JiiUpzJNbWMsEidqsr+v
         HjxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ktikShbrqBMv2KOUqotkFHamEmOfAQAFz9pU5oQy6ZtIV+WkzeVKQUFCKPxwm92OrV0mJh/8UCEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgo/vLGvnunX+u7KjwLcCDJYH+mqJGjfsaYZhEcQtEnbQFhJUn
	wurFe7MPsaMZMJ8iKDaPIj0OlFJ7xGADbcbk0oYHNihdmlpZpf2GFrhSjkWYCywjfAdsHomWdon
	de7xCiWTleWUhAuxono4nu7G3CapTU3Z6+vechLk08w==
X-Gm-Gg: Acq92OFsrJ/nITC0iENHYTGIJb5MG/GYBbgnrgT/G939tKj70DelnQNUqPJsVzawPAn
	fgMAgTENexqcAi2Z9n3v8OphRFP2XUFbdnRONY5IBKzz1MwnBva4l/Dlq8Wff0EfQ4Bl3hrVblR
	F6EMYGx70S4sI1cCTXJXoTnbRFjj2bDlX1t4lkrdb3S9XU4Bknczt462NXSNJIIcgN6yLxd85gQ
	IJMj6m8n01YSI3dBI3TFOqjP9y8yi8AEp0n27LH2/HCAG3LGJrCGkt/TGL+Qahyzw0BrezDbnfb
	qRBZzgLp/3l5DstEcw==
X-Received: by 2002:a05:620a:1d94:b0:911:fba0:6d02 with SMTP id
 af79cd13be357-914a0268c45mr5177385a.22.1779292045808; Wed, 20 May 2026
 08:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com> <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
In-Reply-To: <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 20 May 2026 17:47:14 +0200
X-Gm-Features: AVHnY4JWUX0pXGJu6GgwPpdJDM8Jh8t09gfswovnCTuU2k-U-QKXEr_LdCOWDYs
Message-ID: <CAPsqS2Tt0JbHhJLHBsbJ2YfZW913WNfoSXpSa+8TD1T9CV8V3g@mail.gmail.com>
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ekansh.gupta@oss.qualcomm.com, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bharath Kumar <quic_bkumar@quicinc.com>, Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, robin.clark@oss.qualcomm.com, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 4:12=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wrote=
:
> > From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >
> > Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
> > Documentation/accel/qda/. The documentation covers the driver
> > architecture, GEM-based buffer management, IOMMU context bank
> > isolation, and the RPMsg transport layer.
> >
> > The user-space API section describes the DRM IOCTLs for session
> > management, GEM buffer allocation, and remote procedure invocation via
> > the FastRPC protocol, along with a typical application lifecycle
> > example. Sections for dynamic debug and basic testing are also
> > included.
> >
> > Wire the new documentation into the Compute Accelerators index at
> > Documentation/accel/index.rst.
> >
> > Assisted-by: Claude:claude-4-6-sonnet
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> >  Documentation/accel/index.rst     |   1 +
> >  Documentation/accel/qda/index.rst |  13 ++++
> >  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 160 insertions(+)
> >
> > diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.=
rst
> > index cbc7d4c3876a..5901ea7f784c 100644
> > --- a/Documentation/accel/index.rst
> > +++ b/Documentation/accel/index.rst
> > @@ -10,4 +10,5 @@ Compute Accelerators
> >     introduction
> >     amdxdna/index
> >     qaic/index
> > +   qda/index
> >     rocket/index
> > diff --git a/Documentation/accel/qda/index.rst b/Documentation/accel/qd=
a/index.rst
> > new file mode 100644
> > index 000000000000..013400cf9c25
> > --- /dev/null
> > +++ b/Documentation/accel/qda/index.rst
> > @@ -0,0 +1,13 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +accel/qda Qualcomm DSP Accelerator
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The QDA driver provides a DRM accel based interface for Qualcomm DSP o=
ffload.
> > +It uses the FastRPC protocol and integrates with DRM and GEM infrastru=
cture
> > +for device and buffer management.
> > +
> > +.. toctree::
> > +
> > +   qda
> > diff --git a/Documentation/accel/qda/qda.rst b/Documentation/accel/qda/=
qda.rst
> > new file mode 100644
> > index 000000000000..9f49af6e6acc
> > --- /dev/null
> > +++ b/Documentation/accel/qda/qda.rst
> > @@ -0,0 +1,146 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Qualcomm DSP Accelerator (QDA) Driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The QDA driver is a DRM accel driver for Qualcomm's DSPs. It provides =
a
> > +DRM accel based interface for Qualcomm DSP offload, supporting workloa=
ds
> > +such as AI inference, computer vision, audio processing, and sensor of=
fload
> > +on Qualcomm SoCs. It uses the FastRPC protocol and integrates with DRM=
 and
> > +GEM infrastructure for device and buffer management.
> > +
> > +Key Features
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +*   **DRM accel Interface**: Exposes a standard character device node
> > +    (e.g., ``/dev/accel/accel0``) via the DRM accel subsystem.
> > +*   **FastRPC Protocol**: Implements the FastRPC protocol for communic=
ation
> > +    between the application processor and the DSP.
> > +*   **GEM Buffer Management**: Uses the DRM GEM interface for buffer
> > +    allocation, lifecycle management, and DMA-BUF import/export.
> > +*   **IOMMU Isolation**: Uses IOMMU context banks to enforce memory is=
olation
> > +    between different DSP user sessions.
> > +*   **Modular Design**: Clean separation between the core DRM logic, t=
he
> > +    memory manager, and the RPMsg-based transport layer.
> > +
> > +Architecture
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The QDA driver consists of several functional blocks:
> > +
> > +1.  **Core Driver (``qda_drv``)**: Manages device registration, file o=
perations,
> > +    and DRM accel integration.
> > +2.  **Memory Manager (``qda_memory_manager``)**: A flexible memory man=
agement
> > +    layer that handles IOMMU context banks. It supports pluggable back=
ends
> > +    (such as DMA-coherent) to adapt to different SoC memory architectu=
res.
> > +3.  **GEM Subsystem**: Implements the DRM GEM interface for buffer man=
agement:
> > +
> > +    * **``qda_gem``**: Core GEM object management, including allocatio=
n, mmap
> > +      operations, and buffer lifecycle management.
> > +    * **``qda_prime``**: PRIME import functionality for DMA-BUF intero=
perability
> > +      with other kernel subsystems.
> > +
> > +4.  **Transport Layer (``qda_rpmsg``)**: Abstraction over the RPMsg fr=
amework
> > +    to handle low-level message passing with the DSP firmware.
> > +5.  **Compute Bus (``qda_compute_bus``)**: A custom virtual bus used t=
o
> > +    enumerate and manage the specific compute context banks defined in=
 the
> > +    device tree. The bus was introduced because IOMMU context banks (C=
Bs) are
> > +    synthetic constructs =E2=80=94 not real platform devices =E2=80=94=
 making a platform driver
> > +    an incorrect abstraction for them. The earlier platform-driver app=
roach also
> > +    had a race condition: device nodes were created before the RPMsg c=
hannel
> > +    resources were fully initialized, and because ``probe`` runs async=
hronously,
> > +    applications could open a CB device and attempt to start a session=
 before
> > +    the underlying transport was ready. The compute bus makes CB lifet=
ime
> > +    explicitly subordinate to the parent QDA device, closing that wind=
ow.
> > +6.  **FastRPC Core (``qda_fastrpc``)**: Implements the protocol logic =
for
> > +    marshalling arguments and handling remote invocations.
> > +
> > +User-Space API
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The driver exposes a set of DRM-compliant IOCTLs:
> > +
> > +*   ``DRM_IOCTL_QDA_QUERY``: Query DSP type (e.g., "cdsp", "adsp")
> > +    and capabilities.
> > +*   ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``: Initialize a new process =
context
> > +    on the DSP.
> > +*   ``DRM_IOCTL_QDA_REMOTE_INVOKE``: Submit a remote method invocation=
 (the
> > +    primary execution unit).
> > +*   ``DRM_IOCTL_QDA_GEM_CREATE``: Allocate a GEM buffer object for DSP=
 usage.
> > +*   ``DRM_IOCTL_QDA_GEM_MMAP_OFFSET``: Retrieve mmap offsets for memor=
y mapping.
> > +*   ``DRM_IOCTL_QDA_REMOTE_MAP`` / ``DRM_IOCTL_QDA_REMOTE_MUNMAP``: Ma=
p or unmap
> > +    buffers into the DSP's virtual address space. Each accepts a ``req=
uest``
> > +    field selecting between a legacy operation (``QDA_MAP_REQUEST_LEGA=
CY`` /
> > +    ``QDA_MUNMAP_REQUEST_LEGACY``) and an attribute-based operation
> > +    (``QDA_MAP_REQUEST_ATTR`` / ``QDA_MUNMAP_REQUEST_ATTR``).
>
> Explain, what happens in the users don't map the buffers into the DSP
> space. Will DRM_IOCTL_QDA_REMOTE_INVOKE handle the mapping or not? What
> is the difference between those two modes?
>
> Would the driver benefit from using GPUVM?
>
> > +
> > +Usage Example
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +A typical lifecycle for a user-space application:
> > +
> > +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
> > +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by that
> > +    device node.
> > +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE`` t=
o
> > +    establish a session and create a process context on the DSP.
> > +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or i=
mport
> > +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_FD_=
TO_HANDLE``.
> > +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass argumen=
ts and
> > +    execute functions on the DSP.
> > +5.  **Cleanup**: Close file descriptors to automatically release resou=
rces and
> > +    detach the session.
>
> I'd have expected the description of the actual example. I.e. clone the
> app from https://the.addr, prepare clang >=3D NN.MM, QAIC (https://foo),
> run make, run the app, check the results. I'd remind that DRM Accel has
> a very specific requirement of having the working toolhain in the
> open-source.

We have been getting submissions lately that don't fulfill that
requirement so I will point to the precise part of the documentation
that explains it:

https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-usersp=
ace-requirements

For an example of a submissions that complies, see:

https://lore.kernel.org/dri-devel/20260114-thames-v2-0-e94a6636e050@tomeuvi=
zoso.net/

Most importantly, notice how the proposed Thames Mesa driver generates
machine code for all the hardware units, and doesn't use any blob for
that.

Regards,

Tomeu

> > +
> > +Internal Implementation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Memory Management
> > +-----------------
> > +The driver's memory manager creates virtual "IOMMU devices" that map t=
o
> > +hardware context banks. This allows the driver to manage multiple isol=
ated
> > +address spaces. The implementation uses a DMA-coherent backend to ensu=
re data consistency
> > +between the CPU and DSP without manual cache maintenance in most cases=
.
>
> GEM usage?
>
> > +
> > +Debugging
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +The driver includes extensive dynamic debug support. Enable it via the
> > +kernel's dynamic debug control:
> > +
> > +.. code-block:: bash
> > +
> > +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_deb=
ug/control
> > +
> > +Testing
> > +=3D=3D=3D=3D=3D=3D=3D
> > +The QDA driver can be exercised using the ``fastrpc_test`` utility fro=
m the
> > +FastRPC userspace library. Run the test application:
>
> pointer
>
> > +
> > +.. code-block:: bash
> > +
> > +    fastrpc_test -d 3 -U 1 -t linux -a v68
> > +
> > +**Options**
> > +
> > +``-d domain``
> > +    Select the DSP domain to run on:
> > +
> > +    * ``0`` =E2=80=94 ADSP
> > +    * ``1`` =E2=80=94 MDSP
> > +    * ``2`` =E2=80=94 SDSP
> > +    * ``3`` =E2=80=94 CDSP *(default on targets with CDSP)*
> > +
> > +``-U unsigned_PD``
> > +    Select signed or unsigned protection domain:
> > +
> > +    * ``0`` =E2=80=94 signed PD
> > +    * ``1`` =E2=80=94 unsigned PD *(default)*
> > +
> > +``-t target``
> > +    Target platform: ``android`` or ``linux`` *(default: linux)*
> > +
> > +``-a arch_version``
> > +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
> >
> > --
> > 2.34.1
> >
> >
>
> --
> With best wishes
> Dmitry
