Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9DF3C6A56
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 21:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619622; cv=pass; b=eay4p81P5iCqiCZZjv/2RBIxnXfvfp5o3h9eQ9nTsICGIxgR2fVupJtfHOm37v5r2IuP9xvCBBCl94EbtasZVw87A0yU/5KnzSOQjSJetCG1iRkOXKbkSbcn0jkxgu8z8prrFRch0AA0nSn2dPot7SDTqkHIyl7fLB4u2mbTXW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619622; c=relaxed/simple;
	bh=yjcYpwM0bNWA8F+oMBSlbnJX7nZ+1khq657ozFenk1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsJ+4NTerVhrmgVx77mW/rHm9XWWj+feZzp+aZVjpm5O2Wm9sbGUUdiD4ecl7fNMXjkkF0PmpE738LMUUyfyY/zqUwEYfQquMHmgtYiiT1ggoSInTZ1DluZIr+MeSWNGriDl45OJHZq8+mlOJO9Y9jtYDq3ISxE5A1d4wYzc8lE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KYU5vNgn; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KYU5vNgn"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-130c9dcbd25so5675097c88.1
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 14:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778619619; cv=none;
        d=google.com; s=arc-20240605;
        b=O9pavv8U86vN7vF8cZ94bahTLC5pP1He5XkcDebR6BjylUsuE3l98c2dxssZv+gFAv
         3F4B6BmWcWLnqrrwfGLmhlZlEgr1O8nonNvtQkYWAJhILrd+k8BiVZk9LCwMeyhyQnLH
         dtwJeth6TJio0LfLelew3tR0lKbIPvALSqVUz5u3kQVrDrv4csmOg4CbLdEzU6ZnoFT3
         Vd0aJ7aauIMbvC6ujX09bIPXEua8Zgm1lyrtzzu9uNMXR2XXd32FAXBVu+M/0JXuTdpk
         IwMcKHjNZqTi3fn9y7FKrbe0q/cQa4WH4IsKoKIGlBo3ua087PqwgD1IO/tsvbdKmnJT
         wWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9t69VAH4Nc1O0MVDyKt+JQMOR1DA7dJ94HBiu06W+HM=;
        fh=s+3hogeIk3MwbzH2Bqy2Gn6iZp6+VisdynxRdLkFvSk=;
        b=GZ2h2KPNm4tywlQHiINtd9BhRuhpwwz1BE90whBdkt4RNlcmWixZ5USIen6/dGT5pP
         AqH87wcnN/1FbObj2oQx1VBS0DrXehHR2/y7bLT5Bj/qq98kpwDIZW1UehkV4UGViGap
         YNOMlLbpqjbm/blOxtwi5v/6Pa7qd/upjC35AZr2+1c8hW90mFRCJzJmhLE4DkDsKziU
         X5XcXff65VwApIQoeYvOvowIhZeKMQ5mQj3LZR40QSIwQIQgE8kIPfQKeXhsGQrDIWR5
         gdIRcswFsHGLYrjwdPDWmTcwvVkcSb5PquV4SXq339z7fcBYRY5FiVT3vwhfHkQVbqKR
         mNJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778619619; x=1779224419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9t69VAH4Nc1O0MVDyKt+JQMOR1DA7dJ94HBiu06W+HM=;
        b=KYU5vNgnDBBJPuWlxf7lFR91IHbrV8OkzR3trOdGVz4KIMAWskUuH1oyFcJQNd0DRu
         w9wrP8xMj0EL1TuFo8QxPIdL2PJ17f1TJ6tlpbG9ibsue1EWsKm6FER6163MD3rEZQ6S
         iJAACQAzV1vdNBgf3Jy/7BRVoaRtfrELpuEeQpbRdfEAi6Bf8w0RhPg4jSA+Nna7c7Ap
         ighJ8xRz8+xXr1/s0ERILzp1adkUgDz/0kgugFZc1kLMlPBW9FYVRTeGm3CoBPJDynEV
         3orwTuARevjTMKC6XyOm4eEemo8WIm4W6GukN+crwCdqN3ZWdkD9/9216JtUvUvbSv2f
         oZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619619; x=1779224419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9t69VAH4Nc1O0MVDyKt+JQMOR1DA7dJ94HBiu06W+HM=;
        b=Qvla21YFqTt2eQhpCkOFe4cHtsVOvfmNjjyFJwDd1wcAHe4jf1u/WD9xCf4XMi2E5v
         zuqKFC2Qb/SQbtyiuN0M3Kaq9IoEWvL9TLIFuJ/tOfSAk8HeW5bA8pK7lm0dihW1iLXQ
         rc+K0LsKJOJJAbYjTWYuSR6jQLbdqAUP/02wQ0P/bbBRacPw8OxudOkFt3WwmwN3HVrp
         Tq89LQgQfrY53amghPvXPti1UvvHoftPXYKocpD1Mjpfx+gIBmn2C0wAqNNe+yqqTQpk
         m9dfXIazBPB4fNSIwS1+rO1AMSHMw+yQJ04QB8pD/cDlKHccr1DSe2hoOvlWQEw2jnJu
         Q6lQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hPr+TVZ1WsPRzeFNxzTy7WdWbv+ZJgF1eq5Ms1+57BzC8twesNAptjSLBUyZS+Yx5+eOS+Ig5DG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlkUS0Q/JUggLuJYzEXDrvDnP/UwqiKVP+TEPv2vEFmyQ3tnyF
	Wzk4aISuuWpyJLWmt93CPkxiFeCl43fi9ECndB1e7vtNid23niU/4fx2H6JQbhYynPBX7vLpv8H
	Zfy2GX9aCnQEZ+ea4dsQ/B0wWsYnzhT8eFBF5Vy1F
X-Gm-Gg: Acq92OEUBxzJkO/+bWBeD0kUPN3LQzBfreuii9GJ+fD7FHNFuPImIRZAtYDKOsSNUbd
	den7q5wmx5z9S4MGrqyjQe7+iN7RfcsarlEBc04eIbtBWyNm564EaGYYU/lOsXc6ecSn6dnHknw
	Kjxi142ub7HTQBwPLkZZUU9n/7GUc7kOlOahZcaPq+1gM6Pg7m/HKIxoyBWCkZKeT2FlFnz7+V4
	dI54Lk5Nsgz1FnQFEAfDsLZS0R90kdL6JphBA5HKD1bkb8AIOP0U8VK9eJLmy09KRn0nUgE7IzD
	zZy1e9pY1WkasTpslUU=
X-Received: by 2002:a05:7022:2394:b0:11a:fb0a:ceca with SMTP id
 a92af1059eb24-1333b2d9c6bmr3134966c88.16.1778619618598; Tue, 12 May 2026
 14:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511234802.2280368-1-vipinsh@google.com> <20260511234802.2280368-3-vipinsh@google.com>
In-Reply-To: <20260511234802.2280368-3-vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 12 May 2026 13:59:51 -0700
X-Gm-Features: AVHnY4KwNtssIpJT8BgW9ND1vjmOC-DKwSQu-Dn5zwJb7fp396v17OflLbojuVc
Message-ID: <CALzav=fR8c2tYj9jeOc_K=xoupxAfWMHmk0ipDniSXg6uGiFYA@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] vfio/pci: Preserve vfio-pci device files across
 Live Update
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-pci@vger.kernel.org, ajayachandra@nvidia.com, alex@shazbot.org, 
	amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, chrisl@kernel.org, 
	corbet@lwn.net, graf@amazon.com, jacob.pan@linux.microsoft.com, 
	jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, 
	praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 4:48=E2=80=AFPM Vipin Sharma <vipinsh@google.com> w=
rote:

> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index c12d614fc6c4..019de053f116 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -45,13 +45,15 @@ config VFIO_PCI_IGD
>
>  config VFIO_PCI_LIVEUPDATE
>         bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> -       depends on PCI_LIVEUPDATE
> +       depends on PCI_LIVEUPDATE && VFIO_DEVICE_CDEV
>         help
>           Support for preserving devices bound to vfio-pci across a Live
>           Update. This option should only be enabled by developers workin=
g on
>           implementing this support. Once enough support has landed in th=
e
>           kernel, this option will no longer be marked EXPERIMENTAL.
>
> +         Enabling this will disable support for VFIO PCI DMA buffer.
> +
>           If you don't know what to do here, say N.
>
>  endif
> @@ -68,7 +70,7 @@ config VFIO_PCI_ZDEV_KVM
>           To enable s390x KVM vfio-pci extensions, say Y.
>
>  config VFIO_PCI_DMABUF
> -       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER
> +       def_bool y if VFIO_PCI_CORE && PCI_P2PDMA && DMA_SHARED_BUFFER &&=
 !VFIO_PCI_LIVEUPDATE

Why does enabling VFIO_PCI_LIVEUPDATE require disabling
VFIO_PCI_DMABUF? I saw the cover letter says "to keep things simple",
but what specific problem does this solve or simplify?
