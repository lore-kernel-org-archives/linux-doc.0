Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC70B30277E
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761406231; cv=none; b=ZCJNEORRxiqxQ9/vlipJyy6GVu4l8E3FuLcIuF/I3O7OUouj1dqL/mP3C5swO+Q5zqkaVuzwZAZbDopffCkp9VcaSaTDoRhIyn/z8H40uXV+8wR1fNKUN/LbqgHY/A2sQz0rXVvTB90G2sp3llUf7UJ+3jNOuyYZc8sbDxriAbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761406231; c=relaxed/simple;
	bh=YQe91ROlP9epeFIBAVeb7AxK2YjKLaeOQX5QP76voII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApX5DOqNoTd+mBSOp91JLpAjIKW2x3moQMe9gDEowujy7/47cVjzsHJI95f4kN8aV16CyZnsZn8yXGbSqKXC+VWIAJyHS1ILdDULB6E3LEacJG2ULCGxHu3XWf+UqkkFMRESkoEHEde4RkPZwN3rthpk4hwhRXwBqe1sro8+/T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WD/o5w9z; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WD/o5w9z"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so5412422a12.1
        for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761406228; x=1762011028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQe91ROlP9epeFIBAVeb7AxK2YjKLaeOQX5QP76voII=;
        b=WD/o5w9z1wSGPe5tQTOcVGH8/2Xc0adxZs7tsn+UGgF+xOGoBUTIiz+tEcmtVOQ8v6
         Ac7QvrH5lXCfthJ/Jt6UZJYuU/sEBnp/WRvJ8XtksENV7IYJihZpOLnuG+21mn9vMm5a
         ZLexIuOJSHtchjxt0gu2v4bBPIBz3ekwhTslJquym9oB4qUkVoruPGMPlkV8XLP6z81v
         KbFIeY34t9xSed24UlSwa7EG7rimVcZ4fVbGeu9IV9jjwyW3Wd7DBMrZh/67RYN5fDcj
         yxoM5xR/RyKwpPpnEP2WEZdCaoxckTaBqISFcZOJUZxEkTMSG2h6KGL5b8CCWqn3p4qV
         eyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761406228; x=1762011028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQe91ROlP9epeFIBAVeb7AxK2YjKLaeOQX5QP76voII=;
        b=HdsOOLk5MVS/A66H/6z9wlFY1oIiNK+vDnbUGQMu6sgcuOKYuMtRNsV/qtBRK7ySor
         x2ATseE8UN4ROd28w3cEBlX/Jd4GC1yuO8tv0LpleAL90ZkoIORv+JQddZiTiD1UvNWW
         sLqr1a8xeTtiYCjtbR7LrT5u2uDkvbtfn8NC/JmN3XzCBuOEC93MUvRfb579IAAYKpw8
         JA7PsJMMTLVjmqc5s+W0c6Je/rYUuNDJxp5Bzm7QC0o7bd/YvYiNsRgxA3jmt1zlHTQV
         xqkR+b4svmab1wRXIek4PCNv+emNF/om3yJyPDPgpoojCsbDFzjl24s+ao1mJ0+eQ4Os
         9uuw==
X-Forwarded-Encrypted: i=1; AJvYcCUy6YHcMQFJfoWqPPEd8QJhp61jpVqueis0sU/O4KuZy5Bfgx7rj6bXuUqFzqKzF6YhkR3ZV+aYlc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYP9CeljSDPGrzR0dCeVF/MQAZel8NM6nUhAOnsaMCbqmKUCbu
	+rOO8/d6ZjojOl0EjDK8rdX2jdjzOjgj/w7cKxU/WqaWBMRd4N+Ij+VF+/618XeebMZJGlM6lGN
	/3mlR3dow9/3QJF6Wo07vIbI+chkMhVUd7llUwiV6RQ==
X-Gm-Gg: ASbGnctNJoWxeOmhEmuUoHF5fxJ8Yzr5gAW3QtZQUIgGobXwPG+ycctIouJ53vCK957
	sO4ZRA8sR2VZ6cBFDmdc1mzztyXZ/E2lmlKI4ZL3QiP6wxDRZLru8lsUy4oBV8pLxgT55gYDI4D
	1FZk72u9Alz6x+IUiog1S62rQ74VocXfULUABnlYHbuifAC3VtKMwRQBKR2EpAAM8Wg40/Qtr1P
	iAzZzDy0tY/WHZEaeBGgR1LTssmD3l7/hSY3ePGnx1XBB5ftkt7HRPrae2pUo3pE+wy2WyHkNhT
	hSg342d+igeHrJi9fw1UOq3Yfuqu
X-Google-Smtp-Source: AGHT+IHyii/MACqqA1gMbxyh8CZfZM/MVeB0dSh2M8XUI9vv6+1k3VQ9IQ7FPNSu6S0HuT0ITqx9emJSEDbCLG+Yc0Y=
X-Received: by 2002:a05:6402:350c:b0:61c:cf8d:e51d with SMTP id
 4fb4d7f45d1cf-63e6007d198mr5362602a12.22.1761406228044; Sat, 25 Oct 2025
 08:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <5-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <5-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:29:51 -0400
X-Gm-Features: AWmQ_bmUOgV3_0ASbOM3QoMzXfGDVzgu3GeEUS2HtNMs-zqEXMaBdqidVXde5tM
Message-ID: <CA+CK2bBHzGi-4dqXeQn+OvahYfm5miKEhSuVmYCpo=Z4cUdONw@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] iommupt: Add iova_to_phys op
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

On Thu, Oct 23, 2025 at 2:20=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> iova_to_phys is a performance path for the DMA API and iommufd, implement
> it using an unrolled get_user_pages() like function waterfall scheme.
>
> The implementation itself is fairly trivial.
>
> Tested-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
