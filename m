Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEC926E16A
	for <linux-doc@vger.kernel.org>; Sat,  8 Nov 2025 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762625652; cv=none; b=G4neD3dURBfRLbyhZKmMs5Sh8kwGJnJhUIIONE/f+eZ57hrdPDyiqKmiGZM+Em6KDlNE0u78vQ+UmGOVOgydYxKucqnpHzpjzjsjbYsQXLhk6mVf3N/V7UcV+auPz96v29lVq5jrUVqh8Y88/BCxaSYUvj1vLYhBgQiNwmjnEws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762625652; c=relaxed/simple;
	bh=HXLYSWisfIRg/IZEGEaCxFtj3HbKG4twWmdqzwXU56M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8qN9Kf56KTmA9sv87WdcS0mzMhR6KZAd+gdVKMgGNB8GM686MkFFRzrskjIl0ozvnDYPI8HASNo8CYhrYpVSGPYGkX4M68H8t1QH1Z/jOxJpB3ywmiipInLKU4Wmo+NcGPFvGbzHgc1lGtbgeZkYHCMlmyOCrLH8glrJGHlLR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DiUZmm/U; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DiUZmm/U"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so2797263a12.0
        for <linux-doc@vger.kernel.org>; Sat, 08 Nov 2025 10:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762625649; x=1763230449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Q3WFXvp3nzw/xfIhFbqypMckNDbnX8ReX564Qc9Enc=;
        b=DiUZmm/URky2uJk4p6TqUg8JYsDKX68Wlio8SnlETKTdQV5P6kVnCYCc5A1HmG67YR
         dPiUYtngGF/IDwNQ6NwhgqBwOhXOYiaqO0uCQRfn5M9IdfoUIQgMTGvaEoveSIqz7QY2
         7JROIPuVD9XX7mItmn63f88nMjTaf1tXoJuePaR7CmGpQ6mwLCqjzLU/W9/Klsi/YsGj
         0sBDeVGvKiGmqv9QLtp4wZzCmvM7MyBbxeWg5rNa5xbvaQa9G1U9iS6rRQzHT/b7rIlz
         uI8UILJXP1NAibLw5jSnbQaDKk9FyHv4szQaMnO9f7DSzJ3E70mlx2/ZpeaPs90EEHi+
         o19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762625649; x=1763230449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Q3WFXvp3nzw/xfIhFbqypMckNDbnX8ReX564Qc9Enc=;
        b=Q1tw9DX034NGtX5IGO3XOdXK6wbUkaT1RxVaySNgR6+h7r0qYY6051x6AktkAlFrXy
         b9xvgySjEbLo/wFLV7M2imggEmQuqpERUMRj295MyBsSXDoU89uth0Yl/mT4mFJ3ESHU
         ejUO3r5P3HiEtoUgSLicDYSO3Zz8h76+rvoRCjk6RoLxx9Yh+DK4fHA+oDjBWERCSXZE
         Xwnb639P+YupQ2kaR+21b1CxNwH/gK34KP/SLNEoSECEzykDxzH8TMFBjRUhdQLvwLub
         zy8qNlteAwwaGdJSZ4kd4aNGrTg1/cBQtqTKjqMJkPtXQwqL4yKiPlR8srUyS/lTA0UV
         /b1w==
X-Forwarded-Encrypted: i=1; AJvYcCWvMY2eBIpf9jN3BOTeSEnYGQn0UHOFycmip//ulmODp2TqgBjA/GlfZAp9MIXYvJfYsOH7rxZfFNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgHFdekJGXh17eDyZc6hMYDvWy1OkUWnFzpMZzvobfmdhbEO1E
	p/M6ul3+Y04FrpX2j7OjX4Uc25Q5SIoZsITe2VdS3WbzVXFo1VBo7byoFUEpGX1Clppts98qKhn
	jH/gzcTdxX6Uysw9KP2YPAdXNJKCWg/4BYazaqldAAg==
X-Gm-Gg: ASbGncsDdV+pw3bAsS0RG6cWbN7Z9t5v+jWKzgIpxlGuf7UzXhTO278VrW9rI1t91mw
	JZtzSCttvWjiLr4p1Iw/SXoglXcF0s03ZWLP8D10yThlBn6b0i18lVIbsJaUnlqw+zY/UQq5U09
	VpPXPOxLkmCZt9X+PTY8kacLbmVO274VAbC8FanX22c9dqa3Bvp212I5EcoG1CBQZkcOAmy9QN8
	B3NDiOs6nMLTClXiuIUuQApP4i0IXYz3KorCfPVUMgCMcg3A6wpEpldChmlzpP7vzl8gj5BwXh9
	AuIwEveUXTheMzA5Bea8LkfGM5jQ
X-Google-Smtp-Source: AGHT+IGnxIvGVB3DoG73/LoR1IZOJvd+jikoooj0blQZKowrXDzv2ZHuSFpnulnp2McWHadhftCSnlvUuIh9AczGGLk=
X-Received: by 2002:a05:6402:280e:b0:63e:405d:579c with SMTP id
 4fb4d7f45d1cf-6415e83f02fmr2267675a12.29.1762625649247; Sat, 08 Nov 2025
 10:14:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210526.257742-1-pasha.tatashin@soleen.com> <20251107143310.8b03e72c8f9998ff4c02a0d0@linux-foundation.org>
In-Reply-To: <20251107143310.8b03e72c8f9998ff4c02a0d0@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 8 Nov 2025 13:13:32 -0500
X-Gm-Features: AWmQ_bn1c7HhzSfiUpQMj3X6qTh8tFK5YjykAbxye45PZog-6bB9QqhpzjoyA_I
Message-ID: <CA+CK2bCakoNEHk-fgjpnHpo5jtBoXvnzdeJHQOOBBFM8yo-4zQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/22] Live Update Orchestrator
To: Andrew Morton <akpm@linux-foundation.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 5:33=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Fri,  7 Nov 2025 16:02:58 -0500 Pasha Tatashin <pasha.tatashin@soleen.=
com> wrote:
>
> > This series introduces the Live Update Orchestrator, a kernel subsystem
> > designed to facilitate live kernel updates using a kexec-based reboot.
>
> I added this to mm.git's mm-nonmm-stable branch for some linux-next
> exposure.  The usual Cc's were suppressed because there would have been
> so many of them.

Thank you!

Pasha
