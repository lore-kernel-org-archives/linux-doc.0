Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD96436352
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476870; cv=pass; b=GABl8MrBMzJf4yoLmeNjX8iA3dhRi3D/uUIvFAPYqoojfXZaYfPpwjYlEShEy5a8U9AV4gtJfMzBQRASEfDKlg2sYc2GHSMyVOsxFk6ZI1GBWOc/31EuHXh7UAAU8O+qwdGdQn1XhxD6jVjMhec+6cEkmti+HaQxxvZ2Vbv8Smk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476870; c=relaxed/simple;
	bh=LWdpnYx07T1Ms5zP1asG6Lruytmqf/Fa2t41ma/B4B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PM6/+4zlWDZ85Aqk304J9qofjO27JYEwBvHhryJPiRdi1WyXgmcOVQu/U0DhMHoSuuESwGPrJtMd3cUW8O8MAtcGKf+FncZKs97LwX3FZMG3csIEeRGeyUMQm9G29tV0liQxoqJJ2BJChJ1pCFFOB5FVPjzSYZYeDa4Whkb6lAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b=xRhW72PA; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20251104.gappssmtp.com header.i=@tomeuvizoso-net.20251104.gappssmtp.com header.b="xRhW72PA"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-91588056619so75742885a.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 01:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780476865; cv=none;
        d=google.com; s=arc-20240605;
        b=kjumGdCmdHO8+eUxn6JYui4n9zPDYPHKjIp8TCsj9QIT//kWo9Cpz8JbkhPTJ7H/Ak
         A1pNy9VcS5Lv1kx80dYHZw1QUbzYYG1XSRFuls+JqlZ8R1yLENz0P8FwHrpZa3RE0svy
         raMAYvxJ+UVuEhURsTxXQbXhY55XQ0Co4EjdVYRJN4A8JaZ5UTdB7GnGK2QBz+Ny/7s9
         GtsbeUN51oCXLDHzjhHWnfEepMC4g4oOU12AgAMg3zO4Q143TjsP47yEr8t2XTY5PeBP
         C9ZqGRFDPQLuDcJ6ZjeYTBG5G0pSDpV10y2GJ4TG73A08manUDZatAzBZJ7odS+WnOa2
         XwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g7JX48xUqE191PjwdvrWj7w+4oUCIR2hhRFUmFcQpEw=;
        fh=Iz5E0Mmt47YDpNgH30YRiUwT/JNC/NFsCiSq9YiKEdM=;
        b=DE2y4bR6quE5/DowuJR6Y9wZl8yt/9xiz843Pde5bHxVBA2eXU4Lg2M+QrYaMaSEay
         3pXRN9UbX+/pzXKR7m/jAqyI+HQJVqYW1ggpHFOzHjE4R5hADFF4BMwgVc977eBgM9VJ
         qkRBCCaYHp1VFTO31HhsgG7yePJADgxRTcDTrzJ8+qvna7bEiZ2fkl6n193vJIlJEXUj
         vxzK1w3nfnoPLHtjmU4svW7i8MlfWs7gZ1Mas63/nLbdvBrHEooElc31Lv7Lx2z2jSkj
         lpMEpKMltzUGxwB7Di07NK2wbX137gpxHiFrL4z+L2N1K2FOLCmrQ2flCs+hzHSw8qxF
         gyhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20251104.gappssmtp.com; s=20251104; t=1780476865; x=1781081665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7JX48xUqE191PjwdvrWj7w+4oUCIR2hhRFUmFcQpEw=;
        b=xRhW72PAvG6tvAL6ohGjFciI5+ZBAhgCgN2KXtEAaVmnacTCWylLBn35aeFOejG6/N
         7GLp5ukhO4s6W7PSezQOF3eilmMUWZVNkilfOLnspccfDWK3P47XbJyUd1aXYf3I76GJ
         nRr+cguQselLCvxmhLtyXRKtXjA1leN+sKNxvkkatS/XsRCSp8iLjlX0NcJq1r3d9pyp
         AzT4/KAQfZ4cVTdRQyoE8gMV9Hfeeu4AeCKX3/1cEB4lmvyKR8cwLMdsWvDcQ58vb6pP
         qaN99bc1m6hzx0BdEQgMgTNwyJhP7tcznGvnkMQ+6mL27TeBy065OZ+6YF4SEUltz8zK
         dWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780476865; x=1781081665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7JX48xUqE191PjwdvrWj7w+4oUCIR2hhRFUmFcQpEw=;
        b=bP7GTROXtmQSxkAQ9BFPeIEfPnowNj8/2ssmL/tjzsw4HzMOTfs0H6PQQLz1b41uLs
         T8cB9EftoU6dudmAyxJLnzDRe3+64unUleeL/11uv92BKEcRnuwC8UjjroHlPw1/AuWE
         3TB8JIeNaX28c6TJbe6pRkr0tSdC7sgJ5fLEQWen2uJh/anfW6PyZlSbO3RzKyYEw/iN
         iOzUp5X/+roOUZ/Omi+NDTCc5X19cEWu/yUncXf11FaiR7trP8ZPvB871fOVPPz82r9f
         5g3w/xYWlKdgzyX84pYLUZG+qb0y9iC6avkMQbHYXAV2ofWEgbxN7rELoRLcxoHRdAkx
         dWuw==
X-Forwarded-Encrypted: i=1; AFNElJ880T1zEcawkEdGbxFpIjnmqzLBC26jBJKwCVE8HPUlJSpc3f2rrSW0ix1YvjqiJ9nEL13tNKNv0hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZsMwnxtGq3eI19Hj+mmIc/V+cSXj4BfFzZBzN+xbrwsuz9hY
	/amcOW5kkFPHuK8Vczhqr8EfYBL8OPpLdaU5oIkHnTM3Vr8fN8Frlf9/rNvD6MHMB/gs+rCpEDT
	bevtePQ/3KWuRa1us3SBayKKFpVI9CPgC8awOZDn5ew==
X-Gm-Gg: Acq92OHu7gFq0rKuB0VSL9Asm9etZ/feV383QBijDVyXZxzqukd1hth/Xqam4odeyfG
	bvr0oxg0rX54KEuJ6XhR1cgqnVJyDxXCJW6THFR+KTBsobweov5v+ucpH/nfYXIMrjI6ZXGl0RJ
	r5z5dx0/LOqZejf9Ab3DN9q0X9F3ZlhFkyjyGFX6SFPKMUorcsnVP11BqUZyqlLK33XDiPQAP2Z
	bxd+uWzTynGT2r8bnGlDzDa3QA6pITw1V5mTfPpMuTvOmx3UUnYYpfjBtQPPv+LPR9AzOzgItpH
	uFYlA0xiRYGfWXKH
X-Received: by 2002:a05:620a:470d:b0:914:e3dd:17fd with SMTP id
 af79cd13be357-9158a6cce06mr407596485a.6.1780476864872; Wed, 03 Jun 2026
 01:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-2-b2d984c297f8@oss.qualcomm.com> <paiohsil5pmvm7cf6jxrhaj2225bgvlt3scrag4x6gbkyosow5@l4tbakbnxcvo>
 <CAPsqS2Tt0JbHhJLHBsbJ2YfZW913WNfoSXpSa+8TD1T9CV8V3g@mail.gmail.com> <9879f670-8a23-407b-ab45-673904ad4a86@oss.qualcomm.com>
In-Reply-To: <9879f670-8a23-407b-ab45-673904ad4a86@oss.qualcomm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 3 Jun 2026 10:54:13 +0200
X-Gm-Features: AVHnY4JxR71JOH6mKjWdwqMelPGIBYkdeP3ekd-6Gg14JWpiLQqO3KnjrrlcThc
Message-ID: <CAPsqS2R5kr1-UqhijjgAfU9D1VnyEd3pCxOagHyesHSHpN4_8g@mail.gmail.com>
Subject: Re: [PATCH 02/15] accel/qda: Add QDA driver documentation
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
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

On Wed, Jun 3, 2026 at 7:22=E2=80=AFAM Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
> On 20-05-2026 21:17, Tomeu Vizoso wrote:
> > On Wed, May 20, 2026 at 4:12=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Tue, May 19, 2026 at 11:45:52AM +0530, Ekansh Gupta via B4 Relay wr=
ote:
> >>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>>
> >>> Add documentation for the Qualcomm DSP Accelerator (QDA) driver under
> >>> Documentation/accel/qda/. The documentation covers the driver
> >>> architecture, GEM-based buffer management, IOMMU context bank
> >>> isolation, and the RPMsg transport layer.
> >>>
> >>> The user-space API section describes the DRM IOCTLs for session
> >>> management, GEM buffer allocation, and remote procedure invocation vi=
a
> >>> the FastRPC protocol, along with a typical application lifecycle
> >>> example. Sections for dynamic debug and basic testing are also
> >>> included.
> >>>
> >>> Wire the new documentation into the Compute Accelerators index at
> >>> Documentation/accel/index.rst.
> >>>
> >>> Assisted-by: Claude:claude-4-6-sonnet
> >>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/accel/index.rst     |   1 +
> >>>  Documentation/accel/qda/index.rst |  13 ++++
> >>>  Documentation/accel/qda/qda.rst   | 146 ++++++++++++++++++++++++++++=
++++++++++
> >>>  3 files changed, 160 insertions(+)

<snip>

> >>> +Usage Example
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +A typical lifecycle for a user-space application:
> >>> +
> >>> +1.  **Discovery**: Open ``/dev/accel/accel*`` and use
> >>> +    ``DRM_IOCTL_QDA_QUERY`` to identify the DSP domain served by tha=
t
> >>> +    device node.
> >>> +2.  **Initialization**: Call ``DRM_IOCTL_QDA_REMOTE_SESSION_CREATE``=
 to
> >>> +    establish a session and create a process context on the DSP.
> >>> +3.  **Memory**: Allocate buffers via ``DRM_IOCTL_QDA_GEM_CREATE`` or=
 import
> >>> +    DMA-BUFs (PRIME fd) from other drivers using ``DRM_IOCTL_PRIME_F=
D_TO_HANDLE``.
> >>> +4.  **Execution**: Use ``DRM_IOCTL_QDA_REMOTE_INVOKE`` to pass argum=
ents and
> >>> +    execute functions on the DSP.
> >>> +5.  **Cleanup**: Close file descriptors to automatically release res=
ources and
> >>> +    detach the session.
> >>
> >> I'd have expected the description of the actual example. I.e. clone th=
e
> >> app from https://the.addr, prepare clang >=3D NN.MM, QAIC (https://foo=
),
> >> run make, run the app, check the results. I'd remind that DRM Accel ha=
s
> >> a very specific requirement of having the working toolhain in the
> >> open-source.
> >
> > We have been getting submissions lately that don't fulfill that
> > requirement so I will point to the precise part of the documentation
> > that explains it:
> >
> > https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#open-source-us=
erspace-requirements
> >
> > For an example of a submissions that complies, see:
> >
> > https://lore.kernel.org/dri-devel/20260114-thames-v2-0-e94a6636e050@tom=
euvizoso.net/
> >
> > Most importantly, notice how the proposed Thames Mesa driver generates
> > machine code for all the hardware units, and doesn't use any blob for
> > that.
> >
> I believe QDA checks all boxes for accel, as there is available
> opensource userspace, opensource QAIC compiler for IDL compilation and
> LLVM supports hexagon arch.

I must say that I'm at a total loss regarding the userspace portion of
this driver, despite spending half an hour looking inside the FastRPC
branch that you link from the cover letter.

Can you please explain what do people need to do to:

- run an algorithm of their choice on the DSP,
- execute inference with a common ML framework such as TensorFlow Lite
or PyTorch.

The documentation I pointed to earlier explains in length what is
expected from the userspace portion of the driver, which is more than
just being open source.

Thanks,

Tomeu

> I'll try adding these details as well.
>
> Thanks!> Regards,
> >
> > Tomeu
> >
> >>> +
> >>> +Internal Implementation
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >>> +
> >>> +Memory Management
> >>> +-----------------
> >>> +The driver's memory manager creates virtual "IOMMU devices" that map=
 to
> >>> +hardware context banks. This allows the driver to manage multiple is=
olated
> >>> +address spaces. The implementation uses a DMA-coherent backend to en=
sure data consistency
> >>> +between the CPU and DSP without manual cache maintenance in most cas=
es.
> >>
> >> GEM usage?
> >>
> >>> +
> >>> +Debugging
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +The driver includes extensive dynamic debug support. Enable it via t=
he
> >>> +kernel's dynamic debug control:
> >>> +
> >>> +.. code-block:: bash
> >>> +
> >>> +    echo "file drivers/accel/qda/* +p" > /sys/kernel/debug/dynamic_d=
ebug/control
> >>> +
> >>> +Testing
> >>> +=3D=3D=3D=3D=3D=3D=3D
> >>> +The QDA driver can be exercised using the ``fastrpc_test`` utility f=
rom the
> >>> +FastRPC userspace library. Run the test application:
> >>
> >> pointer
> >>
> >>> +
> >>> +.. code-block:: bash
> >>> +
> >>> +    fastrpc_test -d 3 -U 1 -t linux -a v68
> >>> +
> >>> +**Options**
> >>> +
> >>> +``-d domain``
> >>> +    Select the DSP domain to run on:
> >>> +
> >>> +    * ``0`` =E2=80=94 ADSP
> >>> +    * ``1`` =E2=80=94 MDSP
> >>> +    * ``2`` =E2=80=94 SDSP
> >>> +    * ``3`` =E2=80=94 CDSP *(default on targets with CDSP)*
> >>> +
> >>> +``-U unsigned_PD``
> >>> +    Select signed or unsigned protection domain:
> >>> +
> >>> +    * ``0`` =E2=80=94 signed PD
> >>> +    * ``1`` =E2=80=94 unsigned PD *(default)*
> >>> +
> >>> +``-t target``
> >>> +    Target platform: ``android`` or ``linux`` *(default: linux)*
> >>> +
> >>> +``-a arch_version``
> >>> +    DSP architecture version, e.g. ``v68``, ``v75`` *(default: v68)*
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
