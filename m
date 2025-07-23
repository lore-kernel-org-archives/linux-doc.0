Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353308F58
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753278832; cv=none; b=Fp4fSVeib67GBct9rIeKsTvukA8sDlCsECCUSB/h7MaAU4JkhNE6ZgVUUeGBoG3kRTaRAIvCfF6BncnbtPm8prMOkMhihm5OCOPDqHOnABEiAWfLRh/RspDIrrPsLvXAEZ3HusrnlqikDkRAjb2KdI8DlI0UBsogDMXbNMHlUjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753278832; c=relaxed/simple;
	bh=hByHGrth5zdeb5TgCiwXXXAzfAWK6MDyTN/grdnGXO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nmxoz87chQvs5nGllHzH/4JTcj9d0mBnRkZlPlPmXAEWzqM96d0YHiD6hNOyYQs5P88WJAWxGkXLDryf+FlbUl21zBtXfLW2TrDDxwDU2LRGNn0d/dGZI8KIpFi+765l5c4G4fORKXxZTKvJkr3frlcD3S1gP8opq7vQb08Xby4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=dM9JXVnv; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="dM9JXVnv"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab3802455eso86192011cf.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753278828; x=1753883628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nYQ1nxWVgdB6FCVcfOrCHIYHLuEY3Xl4xttYXGmsTA=;
        b=dM9JXVnvI/nED2XsNyy7A/f4HrA0tPyaQWK54CCTUytezJATSD6jxh2KlV6Erdcdf6
         TJLt2q1PQTwIjLBM5FjszQVQfWVLLk5I4kuZfb0NGqo0iMJAXDUu698AP9/7qTyXc+He
         RYAOPoTtLIS8gtEYVbkuUqMod4uQ9Mlt6THbDftUBGg+Dy9W6jV71ffVYS0893Pitou7
         QG6dk3K49tNEelJAPHlJBl52bF1/YdlU+FUHqX6tPoaV1PbU6RLnR71alJHyzsX70qM5
         Jz10MNP6qWIl6ZPL1WMdExBJjvoMk5kdnRu/iFgh/zSJgfUv3YEUuD295CXtOAlEAPPP
         D2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753278828; x=1753883628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nYQ1nxWVgdB6FCVcfOrCHIYHLuEY3Xl4xttYXGmsTA=;
        b=j5yRTh4cOaUa24W/nRdqtmzStFSnaKRdlYygPZUloUADbbubGVO2kmN9xjtdJkoX/p
         G0YhEPB+Ii9wtihD5BKKbwamjHcSfwpp0R+Dy5cBwOIWeF/9taRUwKeqKJ9KrIUT1XZY
         oDltFdIZUXACiZ2NYLaqZw8U6Os5ywaye6wPNqqM4D3Zqy1c1P1sPA/0IL02J0QH9mLC
         28XAKM9sj7x/W3Zb8bDj7x3A6IGbuPsdCEy5Vo9zQEW8bPTCoVzG2OcjOp/hHJpMx3Nf
         T/2jHAEHLUmmERKi547sVsws2sEIUdbLSCy7VjFxJrpSTu12+lE69muubibeQM2dMim4
         PM/w==
X-Forwarded-Encrypted: i=1; AJvYcCVz6V2iX3UsCyENp+mgOlL4TpPWsfXDQ8I7KsHzxfwrzfkmiMnrdcD6VdQiRVhKqNUqLse8YUxvkf0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw32lbfGqKQW3gZ8ue+D53PLrxQL+Zuka28WVyEGsM/6aSsoilM
	PPjqYcQOpxgmbNNqLjODeOzmLnRgfN7Y0nQy9PLI17cvRPKUyF4Unz+8+lgSUOwS79IGoTqcvxB
	t64JqfXaqATa6ZAHrG07I1G/PVHQvd0xbOu0jznpSug==
X-Gm-Gg: ASbGncsN5ekJdeytxwpXqA7Fg3ffhx+UK5ZDXZ7fKqaC8JOXr0rNPOuYQtKjC90ucC4
	/cZOGaASU+sYrfxLOyEWavV0+Ec4Gjo4DpNrowsk6DR6ABFWQr+wxVisrUquy4D3Jy561CAN4P4
	McRoCccju67g6DKFiChNTD20LzWm+cxPKgWSea4q54iz2T4GaLnfbGiec+bHRWFvIAPV0DahgkH
	sja
X-Google-Smtp-Source: AGHT+IHnUuhdrD9l7/UqXUCaUGkjpnut9RPkUhkRsYy8dMo95ULrH9zUrOnS3/mgiyGB2gnOI0df5GH4vloe3EzyqoM=
X-Received: by 2002:a05:622a:13:b0:4ab:65c3:37d5 with SMTP id
 d75a77b69052e-4ae6e009e59mr39018621cf.27.1753278827759; Wed, 23 Jul 2025
 06:53:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
 <20250625231838.1897085-18-pasha.tatashin@soleen.com> <d6e44430-ec9c-4d77-a00b-15e97ab9beab@infradead.org>
In-Reply-To: <d6e44430-ec9c-4d77-a00b-15e97ab9beab@infradead.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Jul 2025 13:53:11 +0000
X-Gm-Features: Ac12FXycG_A7VpBGI0ZPxdi4OoC_3NChOWXSX3JfSNxhPZyJt2s_1oWRajx-S3I
Message-ID: <CA+CK2bCpY3xnPeEyWCRYVpRcs3maKMqZnApQtm5upkwmM80a3g@mail.gmail.com>
Subject: Re: [PATCH v1 17/32] liveupdate: luo_sysfs: add sysfs state monitoring
To: Randy Dunlap <rdunlap@infradead.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
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
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 12:29=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Hi,
>
>
> On 6/25/25 4:18 PM, Pasha Tatashin wrote:
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-liveupdate b/Docume=
ntation/ABI/testing/sysfs-kernel-liveupdate
> > new file mode 100644
> > index 000000000000..4cd4a4fe2f93
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-kernel-liveupdate
> > @@ -0,0 +1,51 @@
> > +What:                /sys/kernel/liveupdate/
> > +Date:                May 2025
> > +KernelVersion:       6.16.0
> > +Contact:     pasha.tatashin@soleen.com
> > +Description: Directory containing interfaces to query the live
> > +             update orchestrator. Live update is the ability to reboot=
 the
> > +             host kernel (e.g., via kexec, without a full power cycle)=
 while
> > +             keeping specifically designated devices operational ("ali=
ve")
> > +             across the transition. After the new kernel boots, these =
devices
> > +             can be re-attached to their original workloads (e.g., vir=
tual
> > +             machines) with their state preserved. This is particularl=
y
> > +             useful, for example, for quick hypervisor updates without
> > +             terminating running virtual machines.
> > +
> > +
> > +What:                /sys/kernel/liveupdate/state
> > +Date:                May 2025
> > +KernelVersion:       6.16.0
> > +Contact:     pasha.tatashin@soleen.com
> > +Description: Read-only file that displays the current state of the liv=
e
> > +             update orchestrator as a string. Possible values are:
> > +
> > +             "normal":       No live update operation is in progress. =
This is
> > +                             the default operational state.
>
> Just an opinion, but the ':'s after each possible value aren't needed
> and just add noise.

Removed columns, thanks.

Pasha
