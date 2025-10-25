Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348BE1E5B7A
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761405359; cv=none; b=BJwcvOufcj/L1Q0AsUkjVBO5fhBG/DTkv84XZWJHyPnelXGEhwS5gNQ+w6e9Sr6txE7v/zHWCyuK3XYABXxgyHE1os/KcXaLzzDZ+UMeKlMi8iy/qNDqYbnktiG9V1EhvZjEuYGi9EyDDW6j7ONp+Q3dFcSsWUqPp49XZhOCSp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761405359; c=relaxed/simple;
	bh=bi4GMT2iyyBr9MQrD3T6o1udwx+0fc5659kLbgfo8vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmYYOIeEllT9o9JQYXDa156eh2RMQlg+dAFPG9TAhKEABTCHjYtO0LQEkvBrzwOjQWODPaRLG974HlfXA4nat6viWQkJSxsEUDqXWKaop/abapC6a80WTbJGMlfVwC8elzstYr1W1zw80Ty/PIpZ7IHeHzn/43dvaw1nEzCfr2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=En1khRSB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="En1khRSB"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b6d83bf1077so175227166b.3
        for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 08:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761405356; x=1762010156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bi4GMT2iyyBr9MQrD3T6o1udwx+0fc5659kLbgfo8vg=;
        b=En1khRSBLS6hpgD0EjfNw/xEEamxOXFEO4xl+mWrXdAWqjQTW0LehBwanoPzORLcnJ
         /BKJglcDFSprNufcZgzc60O/myCvzZ+0ZNvV3NIFwmaulq5cmncyJ+RUjilaQJbkmmbJ
         oiJO3V3qlk3t7q1l1eig0yiPyKXJs97gwjqwPgzb/Mv0gJuQ+UTFh6ZiSz5MqXhAQdVl
         u5bcXEHSOji8UvrLOQczSsv0WeezCysjAqxyuirjkhttoVxUYtqs8d2oBEyIsJg1i/PP
         /IpC9wYMWQXfcbm0+FL48Ny6XX1T1u6RqHT9kq6A7rASe2WZYg9VH1761W2+yX4MLxKn
         tSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761405356; x=1762010156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi4GMT2iyyBr9MQrD3T6o1udwx+0fc5659kLbgfo8vg=;
        b=uTRh2BS68ynC9i+RVYB4VcRMIgI3eoYLvn10TLK+fel+r0/O4zYNrgl+a4FM7QCORD
         7j4mwr4yRMhPU103rkzae2AwD6nnJE1X01TCR/rfedff9DiJPE7XytMWlzYYRuFpCVfp
         6gchNyVeGLiEqOILmjbrFjhIClJRw2eiuHnAdqRJoC+YPCi4jolXO0DkJFtjy2+wte1x
         KSdhWShJwP7vjBHAEwIgPcqBrHyCzLoJCG98cO1Vc4T1NJQkwuS7hLSkUFeMTuHjf0fL
         4YA8xlOkiygqn9HTVExEyppjZ4PDJOEaExhy692ZpKxLra36CaNGSo2pcMIUSFIaBFZH
         x1uA==
X-Forwarded-Encrypted: i=1; AJvYcCUVzvQkQIPK08j6gDA8dEU66LjnU0Ya6J82sNcI+9TFgKF6l5S1oBgn16nXJgFDIEs4j9qKl1ho2ik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+YqcVIm8pTG5JM5XhRqz3RxhpK4HassJTNU6kVhwHfUnnrEEC
	1r4y/T+RLpKl2a4rIRYBxaisFMf1r5kPQPpAZ/mSkalpW3ip4EqfuoGziKWRpbIWXGUhTZ8qFO9
	SqrjyO1GmRL8yq/IC/8xmfZBUa9ICQmFXc5waZE4drA==
X-Gm-Gg: ASbGnctVftibBiXiOglHnfc1Oi/MKzNstORYlwJP4x44CmZ/CaX+KlFsy32EKbnlmjy
	zcuGu3z0ssgMycsbzehJXx4zqg7sRcjRGTFKxdwFPc6sWdJJ+886kglWtfM3u1ee0sX/xmBvntW
	CGBEpQroXYfv14EALOQthhfoA6Zjv10Aga5uOoKb6ZJvZUgCy3uMMNySZj5Y0vazF8MybIPwfGc
	NB2Zw85QOedRw7uwyQ7GAdI0NQdsMrG18y57lobS+c07URF0ftYpgTwlVu064ARD6DJfdVamPKa
	H+uvvp9HEKHv5TPjRQ==
X-Google-Smtp-Source: AGHT+IFCiIAROvFB2yMO0UCR+4ZQEZ0s8jgRn6oQbNbO878Y9zbld799sNxrnedeLYq8Qy2EigSbEXq7Bo6P6npPVMM=
X-Received: by 2002:a17:907:5cb:b0:b3f:294c:2467 with SMTP id
 a640c23a62f3a-b647195b32emr3912611266b.10.1761405356545; Sat, 25 Oct 2025
 08:15:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <2-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <2-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:15:20 -0400
X-Gm-Features: AWmQ_bmbZ8u5CogyggVXgDbcACzApTnoI3lXdk_DKTEGWhLBxFj0guiH9QhsMTM
Message-ID: <CA+CK2bBpunzb9yaQE91NYfp64xSSuRaHW71MC=3bLVfWsHBDzA@mail.gmail.com>
Subject: Re: [PATCH v7 02/15] genpt: Add Documentation/ files
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 2:21=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> Add some general description and pull in the kdoc comments from the sourc=
e
> file to index most of the useful functions.
>
> Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
