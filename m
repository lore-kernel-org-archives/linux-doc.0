Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F326E15B135
	for <linux-doc@vger.kernel.org>; Mon, 19 May 2025 03:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747627063; cv=none; b=bEjhEpQBosifKxqyr2ySmkhZ1yoZfooV9otTZn7KEW6/+Plsj7cHReLgonu3EdqxcYcKDQTXqGuw5b1OAsshANZnvuhUwCmjSPF2HjwzCQmOiuIEtvRMEBbACs9twfL2fvWW1+nZhURqOMA8vsW5s4iZ0o6DoyKc4Ud0PfEgdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747627063; c=relaxed/simple;
	bh=1hDvDjA6HQG5h4sz+2wd4COfgvihGmIu1xT7D9dVHIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mesS/OAYhpqtGcVk6aT7Yac1nQoVRnPgCFpUKVKqarkbq92ilEe1yTjDSGAB7mCBs18x94/Jly2x2B8+lcH3pWulzaSTHRXoamqe5xNu5Ux8+JKKUxX4mRmjKmHSebvij3XO4r+r0GzsT56Rdq7UKrN+T6GJaGWpe9moBuherlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0gh3QoZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0gh3QoZ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-601dbd75b74so1162061a12.1
        for <linux-doc@vger.kernel.org>; Sun, 18 May 2025 20:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747627060; x=1748231860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHrIEtPjGjFqpzWZtXsXJBDFa43Q/aUAj/FyDajBb6A=;
        b=A0gh3QoZKEZC+r2YmpmFmWsbddFOOLRlMWK2YEKU6/K4zervkOv2l1+GI1NYIntuEi
         MUlutx8emc/iqdppSLlqjiMZMXGw0Jt5Q4KmMUmilLpHL0acKRVcYWn4hmFD57L7iP9d
         dw7SNnbBAwNkMEunA/WtM/ml5rSAZwYwrYK5lsd0SlPLCwGiK4CYqx3LHpBoNBjPAux9
         EzAQeIRf5CoNvK85snwBcHDAgfIWAkPqBJQtA56edhKgHrXL1/qiAZCzDyfNb4TcJnVZ
         4OD6KRj7OG/KrrOCaA9Q0B/zqpeXtF/o4yMLZHc2wqHXxHzAZc2N9k97in0UzhSGYAzz
         nQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747627060; x=1748231860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHrIEtPjGjFqpzWZtXsXJBDFa43Q/aUAj/FyDajBb6A=;
        b=awpuOAMuxwkDms2Ym4LHVjt9+gnV81GbUVCt+chk69eDi+wE6HQ0KhHnMY+t6nb5Is
         zQ25AX/jiBhUdrrW/S3ZfmMXC/0NkZwSuvB4MW3qTfSLE0cAJd9eQv2PU0QrkejFzeDm
         /z7W81kDQZodE9/1UomcHc4S1OOp9+N+RUTpexlrGcbD3higKvqcxY/zyDeJ48bqnu9l
         HA1UCBwKbX+qdi4YHmlK7mgLnITKBpnDIV+E9jxl5lTpfozAtLCQvXGqHx3zmxpb86HG
         Q32py/LxsIU8jAO6kojTVPVn63b4lWmm1vC5jIggE4Z7SEI+BM+uDjCq3U1ZLSJLqLPW
         fJeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi0R4YYEbtVSdY283Ix57mox+2Vxzy0cG96FNhrLyRMdIhZe2d4WH4idtr+KaVQCIQHCQ26wz60v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuf7vqV/1+XEkC9gsIxBX22j7KGTh7hSCr5z3IQTKQJEYrFlh
	guJVMxZkY4saHdRPHoeFlPSfWHD0vVhhVInMFmNYOTwssctfur3V+7hTrONOsOmNnaUcZot1NWm
	+AjazTWRCUTypxrjpwxPEm9Y0nAG4rfI=
X-Gm-Gg: ASbGnctHuCySPww3N/b8x59hu2sjezXVADoqFT1cD0MUZGQPlcemEjZXoAMu3D2tH6I
	F1nfutNq4CtLIaXbN58rqxWl/4Ltio6H8xVNOzWPiyIu/ehAL9yAxuFL8Cc6eF9FJL3jUUOxMrN
	YiBbelfgnDOZrTDTEMJ8SARsqxVsUyBJTn8/4=
X-Google-Smtp-Source: AGHT+IFo6bfASF2lkPvobdIIUwEgZbV4GIk4NW2quS8GrMBSG2VpjhCPlabl87G4iFRnLNRxwefi81bBzBye/G6YE9k=
X-Received: by 2002:a05:6402:50cb:b0:5fd:dbf7:b6e0 with SMTP id
 4fb4d7f45d1cf-60119cde5b2mr9415049a12.30.1747627060058; Sun, 18 May 2025
 20:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202505160627.WtzIIpL6-lkp@intel.com> <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
 <CAJy-AmmsqK3x97yncNrnugCNrf5qNOTUwixFNiBifqigLrp2zQ@mail.gmail.com>
 <aCqhRwOxvUiCFtpN@rli9-mobl> <83ed3edd-97fe-4106-93d5-4058a61bc4a3@infradead.org>
In-Reply-To: <83ed3edd-97fe-4106-93d5-4058a61bc4a3@infradead.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 19 May 2025 11:57:12 +0800
X-Gm-Features: AX0GCFtzH0jZzLRleyKEbDZoCx3PtKQVsX5lWJmbSGGdaHmXZjpuOSoeWt1gkg4
Message-ID: <CAD-N9QVGSP3n+T13PP=5eakmerdERkYsrO5i9-O=9xoSdmB7Gw@mail.gmail.com>
Subject: Re: [lwn:docs-next 37/72] htmldocs: Warning: Documentation/translations/zh_CN/how-to.rst
 references a file that doesn't exist: Documentation/xxx/xxx.rst
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Philip Li <philip.li@intel.com>, Alex Shi <seakeel@gmail.com>, 
	Yanteng Si <si.yanteng@linux.dev>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 11:35=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 5/18/25 8:11 PM, Philip Li wrote:
> > On Mon, May 19, 2025 at 10:24:20AM +0800, Alex Shi wrote:
> >> Yanteng Si <si.yanteng@linux.dev> =E4=BA=8E2025=E5=B9=B45=E6=9C=8816=
=E6=97=A5=E5=91=A8=E4=BA=94 18:02=E5=86=99=E9=81=93=EF=BC=9A
> >>>
> >>> Hi robot,
> >>>
> >>> =E5=9C=A8 5/16/25 7:04 AM, kernel test robot =E5=86=99=E9=81=93:
> >>>> Warning: Documentation/translations/zh_CN/how-to.rst references a fi=
le that doesn't exist: Documentation/xxx/xxx.rst
> >>>
> >>> I didn't reproduce this warning locally. It seems to be a difference
> >>>
> >>> between different versions of Sphinx.
> >>>
> >>> Could you please provide your Sphinx version?
> >>
> >>
> >> I can't reproduce it too. My sphinx tools version is 7.2.6.
> >> And it looks like a incorrect warnning.
> >
> > Sorry for late response, the Sphinx version the bot use is 2.4.4, and i=
t also enables
>
> JFYI, Documentation/Changes says that the minimal Sphinx version is 3.4.3=
.

$ make htmldocs
ERROR: Sphinx version is 1.8.5. It should be >=3D 3.4.3
Detected OS: Ubuntu 20.04.6 LTS.
Sphinx version: 1.8.5

To upgrade Sphinx, use:

/usr/bin/python3 -m venv sphinx_latest
. sphinx_latest/bin/activate
pip install -r ./Documentation/sphinx/requirements.txt

    If you want to exit the virtualenv, you can use:
deactivate

2) As a package with:

sudo apt-get install python3-sphinx

    Please note that Sphinx >=3D 3.0 will currently produce false-positive
   warning when the same name is used for more than one type (functions,
   structs, enums,...). This is known Sphinx bug. For more details, see:
https://github.com/sphinx-doc/sphinx/pull/8313

All optional dependencies are met.
Can't build as 1 mandatory dependency is missing at
./scripts/sphinx-pre-install line 984.

For older versions, you will encounter the above error.

>
>
> > kconfigs like CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFI=
G_WARN_ABI_ERRORS,
> > refer to [1] for detail. Hope this is useful.
> >
> > [1] https://download.01.org/0day-ci/archive/20250516/202505160627.WtzII=
pL6-lkp@intel.com/reproduce
> >
> >>
> >> Alex
> >>
> >
>
> --
> ~Randy
>
>
