Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997127F736
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763408352; cv=none; b=ir+3W4uLFHuo/SjVb0h61+BF9XBpOqb/Fz2soEnaNepqLUqaw07Gr8NYBSsv0TIbw1sApi012rhFCejaDoqTTKtOshxBH9gFPzihaZ84Gb2jUbSn0QcxTIiPONS2987CnTimVMiD33ZRumam7SjU8MXFbOryG5KniqTJtKY1F9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763408352; c=relaxed/simple;
	bh=b9aPjw2LvCUZNOTxP5qpY7NgJ724vIXmAiSxxWNqFj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+yCjJ+QaLfFKebMqkXfLuJ0f252+OSARnZVtYusT6USbU2Lys8LWEAjNNQiK1j/blAiaKFrUecxg43DiHQeXGvZXUn1ZVG0XLBG08Qm7y6bD7yslhA1cXYAkwvUYpsRlLt/Lk4OHiYcuTLQR9+2wCFR0TFRH75Yk8UqWVT1moI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDvuwokg; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDvuwokg"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59582673e15so3751189e87.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 11:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763408348; x=1764013148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9aPjw2LvCUZNOTxP5qpY7NgJ724vIXmAiSxxWNqFj0=;
        b=qDvuwokgJ7ynZsglDSewTnrj0tY7az0tYREPbz/DYRBG3kgll4ay88TKYpt702LNbv
         2uu9HxCqV8Gtaa7IeX+TQ/7IJESYmIpflDbL3EdzIQstkzb7uLuedxhd6H0MIOZtpCNf
         dqCAh5kzyBQVFdKgszhSQLcNB/fBGs0dF9ZkLt+IN7ivHw7Pyb1nDcrfQCc9aOPxxtzV
         XgxEatw7hijzxySZsCeRTfqro9vgiRYPuGh57NSKzxa8kYs0rH8QCkLdlM2onOxtxFQi
         YaWiyQoCDCgle5arO0Y1VMZHQHLLW4qL3BV6ZhdKNNdTMBhUhuRCfIAi4Wofq9LoYO9f
         hkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763408348; x=1764013148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b9aPjw2LvCUZNOTxP5qpY7NgJ724vIXmAiSxxWNqFj0=;
        b=ISzsQ1R332A7HT0+lV0p8AfvUldLNChhjm7d9kF3nzkp0ekQuNKaL8kTiGsahssGG5
         uNFNJra0j3mfrU9laHzM3kxJ63h7cNjNMzRatbsIdHw/axcBSZrnecAw6a4Z2chxrg6K
         nHmiT7A2wuB3TemDKtV6CEHaUqTNtmbKtBFDclNq8p7krTzoep6W0nNfhH9CHg/Cxfnx
         rOJRgAcqpCqyPvUW5p+11M/6iTYc9CKKH38xNEP8sX+iszgk1LElTURNkj5SwBAyOAf6
         9aP1xLvyLZSYSOH1W3lIQRTrENeBj2cC5QHBnONA4++Isi+MZC+WKB0MiOkcphaZXdLB
         0+2g==
X-Forwarded-Encrypted: i=1; AJvYcCV5uXK4SCU5OLC1CWiKqdRJ9Dt8cPZ/hhA6vfE/ZL2kCxOFas66Yraib02vqMg0NAtbvuEmeCVYr2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl23LTfFd/2In04bAs+6R5D+Q5IKReZ5/R7OPZK0LpRnlHcpvj
	9BeI12vEi1NMLVwzcPTKNrgSSYCzkSpZaJ+0nPZkegwjsib+cBn7QndjidevJm8g2fsv7XGIJVX
	i5a74m0mUETkf1NRr8uaZLodPL/5xQAx3Xraairdz
X-Gm-Gg: ASbGncsab0sxl1wlSLTAFdrsDqS3xEEGjKVANdhuhnWs6KwzgT7LVQR1qwNa61gl1ga
	JKwSMPCgrAxOkZc7mhK9zjAjlT3lLhuMpkcXKwm0NecKes4nAAEsbroZ4X06pYlp5UsbsJYsrbP
	b1+Ia0J83zRRgxOYwOInl8w6SLn3D4hVyffvHdotxxq5wPUZAulo+YcOKtp4JX+LjPKvLhkUn4r
	GxV+gRl26bMeTqR/Xk4wcRmRiUI3vTZapYiaokZ1XkWRCgvDRZQop3A1RgQb3y5vLsFFys=
X-Google-Smtp-Source: AGHT+IFN4xOyb2ZHLHkpG4LWQorQPgUWti/L9wSnM39BaS2Jya2ibJD/Dhx+BTWb3SDVgOFhixbcdjfh2auRRViLmWg=
X-Received: by 2002:a05:6512:12c9:b0:594:3270:3b14 with SMTP id
 2adb3069b0e04-595841f96b2mr4673200e87.32.1763408347863; Mon, 17 Nov 2025
 11:39:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com> <20251115233409.768044-18-pasha.tatashin@soleen.com>
In-Reply-To: <20251115233409.768044-18-pasha.tatashin@soleen.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 17 Nov 2025 11:38:40 -0800
X-Gm-Features: AWmQ_blJn1ck9PTGxHP2-KznbYK2P4A6YYPNkQIgUM3c99KDsjZHm2bxwWZBfno
Message-ID: <CALzav=eskApQk6kstsQWThwV=h4Qmd85kAw3CxZt=6hj=JS-Xw@mail.gmail.com>
Subject: Re: [PATCH v6 17/20] selftests/liveupdate: Add userspace API selftests
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
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

On Sat, Nov 15, 2025 at 3:34=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:

> diff --git a/tools/testing/selftests/liveupdate/.gitignore b/tools/testin=
g/selftests/liveupdate/.gitignore
> new file mode 100644
> index 000000000000..af6e773cf98f
> --- /dev/null
> +++ b/tools/testing/selftests/liveupdate/.gitignore
> @@ -0,0 +1 @@
> +/liveupdate

I would recommend the following .gitignore so you don't have to keep
updating it every time there's a new executable or other build
artifact. This is what we use in the KVM and VFIO selftests.

# SPDX-License-Identifier: GPL-2.0-only
*
!/**/
!*.c
!*.h
!*.S
!*.sh
!*.mk
!.gitignore
!config
!Makefile
